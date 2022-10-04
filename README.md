# subtitle-convert-docker
  Docker container for subtitle conversion, using Subtitle Edit.   
**Deprecated, use https://github.com/Wauter/subtitleedit-cli-docker instead (unless you need anything bitmap related incl. OCR.)**

## Introduction
This is a solution for converting between subtitles formats using Subtitle Edit's commandline convert tool. Specifically, I needed a way to automate converting from and to Screen subtitling system's .pac format. Subtitle Edit seems to have good supported, stable code base and active developemnt.

[Subtitle Edit](https://www.nikse.dk/subtitleedit) 
https://github.com/SubtitleEdit/subtitleedit/

Subtitle edit is a windows based application which includes command interface for conversion. 
It is packaged here, with mono, in a docker container. The image weighs in at a ridiculous 1.5 GB, but it works great, so hey ¯\\_(ツ)_/¯ 

_(I would suggest to use ffmpeg instead, for ffmpeg supported formats https://trac.ffmpeg.org/wiki/ExtractSubtitles, where possible)_

In part inspired by and building on this thread: https://github.com/SubtitleEdit/subtitleedit/issues/3568 Thanks @batatop





## Usage


### Convert subtitles

General reference:   
https://www.nikse.dk/subtitleedit/help#commandline


#### Basic usage

- Create a local folder called 'subtitle' (for example), then place subtitle(s) to convert into this folder.
- Bind this folder to the docker container.
- The converted files will be created in subfolder subtitle/out 

Run the command (while in parent folder of subtitle folder), example:  
```
docker run --rm -it -v $(pwd)/subtitles:/subtitles wauterdebruyne/subtitle-convert:1.0 /convert sample.srt pac
```

_("/convert" and "-convert" argument styles are supported, either will work)_

#### Specify custom locations

By default the container is adding the '/subtitle' folder as input folder and the '/subtitle/out' folder as output folder, however, you can also manually specify these parameters, for example:
```
docker run --rm -it -v /mnt:/mnt wauterdebruyne/subtitle-convert:1.0 /convert sample.srt PAC -inputfolder:/mnt/subtitles/in -outputfolder:/mnt/export
```

#### Get list of supported formats:

Either check the format names in the subtitle edit UI, run the following docker command, or consult the output below:   
```
docker run --rm -it -v $(pwd)/subtitles:/subtitles wauterdebruyne/subtitle-convert:1.0 /convert /list
```

Any format name from the list should work, for example:
```
docker run --rm -it -v $(pwd)/subtitles:/subtitles wauterdebruyne/subtitle-convert:1.0 /convert sample.srt iTunesTimedText
```

Current list of supported formats:

```
Subtitle Edit 3.6.7 - Batch converter

- Supported formats (input/output):
    SubRip
    ABCiView
    AdobeAfterEffectsft-MarkerExporter
    AdobeEncore
    AdobeEncore(line#/tabs/n)
    AdobeEncore(tabs)
    AdobeEncorew.line#
    AdobeEncoreNTSC
    AdvancedSubStationAlpha
    AQTitle
    AvidCaption
    AvidCaptionDropFrame
    AvidDVD
    AvidLocMarkers
    AWSTranscribe
    BelleNuitSubtitler
    Bilibilijson
    Cappella
    CaptionAssistant
    Captionate
    CaptionateMS
    CaraokeXml
    Csv
    Csv2
    Csv3
    Csv4
    Csv5
    CsvNuendo
    D-Cinemainterop
    D-CinemaSMPTE2007
    D-CinemaSMPTE2010
    D-CinemaSMPTE2014
    DFXPBasic
    DigiBeta
    Drtic
    DVDStudioPro
    DVDStudioProwithonespace
    DVDStudioProwithonespace/semicolon
    DVDStudioProwithspace
    DVDSubtitle
    DVDSubtitleSystem
    DVSubtitle
    EBUSTL
    Edius4Frames
    Edius4Ms
    EdiusMarkerList2Frames
    EdiusMarkerList2Ms
    EdiusMarkerList3Frames
    EdiusMarkerList3Ms
    EDL
    EEG708
    ELRStudioprint
    ESUB-XF
    F4Text
    EZTXML
    F4RichTextFormat
    F4Xml
    FABSubtitler
    FilmEditxml
    FinalCutProXml
    FinalCutProXXml
    FinalCutXmlGap
    FinalCutProXmlName
    FinalCutProXChapterMarker
    FinalCutProXml1.3
    FinalCutProXml1.4
    FinalCutProXml1.4Text
    FinalCutProXml1.5
    FinalCutProXml1.6
    FinalCutProXml1.7
    FinalCutProXml1.8
    FinalCutProXml1.9
    FinalCutProTestXml
    FinalCutProTest2Xml
    FlashXml
    FLVCoreCuePoints
    Footage
    GooglePlayjson
    GPACTTXT
    Gremotsjson
    HoliStarJson
    ImageLogicAutocaption
    InqScribe1.1
    ATSISS
    iTunesTimedText
    JACOsub
    JSONAeneas
    JSONTED
    JSON
    JSONType2
    JSONType3
    JSONType4
    JSONType5
    JSONType6
    JSONType7
    JSONType8
    JSONType8b
    JSONType9
    JSONType10
    JSONType11
    JSONType12
    JSONType13
    JSONType14
    JSONType15
    JSONType16
    JSONType17
    JSONType18
    JSONType19
    JSONType20
    KanopyHtml
    LambdaCap
    LRCLyrics
    MacSub
    MediaTransData
    MicroDVD
    MidwayInscriberCG-X
    MPlayer2
    MSOfficeWorkbook
    NCITimedRollUpCaptions
    NetflixIMSC1.1Japanese
    NetflixTimedText
    OGMChapters
    OpenDVT
    Oresme
    OresmeDocxdocument
    OtterAItranscription
    PE2
    PhoenixSubtitle
    PinnacleImpression
    PListCaptionxml
    ProjectionSubtitleList
    QubeMasterProImport
    QuickTimetext
    RealTime
    RhozetHarmonic
    RTF1
    RTF2
    RXmarker
    SAMI
    SAMIAVDicPlayer
    SAMImodern
    SAMIYouTube
    Scenarist
    ScenaristClosedCaptions
    ScenaristClosedCaptionsDropFrame
    SMILTimesheet
    SMPTE-TT2052
    SoftNisub
    SoftNicolonsub
    SonyDVDArchitect
    SonyDVDArchitectExplicitduration
    SonyDVDArchitectline/duration
    SonyDVDArchitectline/dur/length
    SonyDVDArchitectTabs
    SonyDVDArchitectw.line#
    Speechmatics
    SpruceSubtitleFile
    SpruceSubtitleWithSpace
    Structuredtitles
    SubStationAlpha
    SubtitleEditorProject
    SubUrbia
    SubViewer1.0
    SubViewer2.0
    SwiftInterchangeFileV2
    Swifttext
    Swifttextline#
    Swifttextline#+dur
    TEK
    Xml
    Xml2
    TimedText1.0
    TimedTextdraft2006-04
    TimedTextdraft2006-04CDATA
    TimedTextdraft2006-04Ooyala
    TimedTextdraft2006-10
    TitleExchangePro
    Titra
    TmpegEncoderText
    TMPGEncAW5
    TMPGEncVME
    TMPlayer
    TranscriberXml
    TranslationMemoryxml
    TurboTitler
    TwentyThreejson
    TwentyThreejsonembed
    TwentyThreejsonembedsrt
    UniversalSubtitleFormat
    UTSubtitlexml
    UTX
    UTX(frames)
    Uleadsubtitleformat
    VocapiaSplit
    WebVTT
    WebVTTFilewith#
    XIF
    XMP
    YouTubeAnnotations
    YouTubesbv
    YouTubeTranscript
    YouTubeTranscriptoneline
    ZeroG

- Supported formats (input only):
    CapMaker Plus
    Captionate
    Cavena 890
    Cheetah Caption
    CHK
    Matroska (.mkv)
    Matroska subtitle (.mks)
    NCI Caption
    Avid STL
    PAC (Screen Electronics)
    spt
    Ultech 1.30 Caption

- For Blu-ray .sup output use: 'Blu-raysup'
- For VobSub .sub output use: 'VobSub'
- For DOST/image .dost/image output use: 'Dost-image'
- For BDN/XML .xml/image output use: 'BDN-XML'
- For FCP/image .xml/image output use: 'FCP-image'
- For plain text only output use: 'Plaintext'
```

## Build instructions

Clone the git repository locally

Download the SubtitleEdit (portable) installer and unpack it inside the 'subtitleEdit' folder (SubtitleEdit.exe and all support files go directly into this directly)
  
Build the container:  
```
docker build -t subtitle-convert:1.0 .
```
