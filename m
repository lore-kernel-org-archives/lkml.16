Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazolkn19013075.outbound.protection.outlook.com [52.103.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C2192B96;
	Thu,  1 May 2025 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142672; cv=fail; b=piCJYMiPMdR9IFokKpCSAdoLSnp1B+aPcBt55rznMghceDi12/XV3cGWpsFrOTGvnYpudAaReCkZiJbsh7RnMGg4/pArAZE1z5qsjS51JpAGIk6JgrDDMHLExyDymxS8MSe4EqoN1Jh7x0Ie36/dI9mn2AHqg1P824kPc8dH2zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142672; c=relaxed/simple;
	bh=6y4OgbA/1p3HuB6MZujBIym4KsTgpBSzMeU7JzKLBSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kpU33rFnSGxaIbOQN0/Kp+cGZcLNmdcPnw+0atMULjN22jPavQfECxYAiirXgJJygklPOUZKg0QVt/OOOPBKMDL2ueKSvZh8bfByTURxg6eeK2/qLOgSFLYZLfYdIYVStZqjPYNvFUiKQSXDOnjJATwVdIHbwfrk6TnGTtbgNsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l1GRMLQ5; arc=fail smtp.client-ip=52.103.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l1GRMLQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMFE0/sdDVV6bcdvYfm3rKH+PIIcjJoH4AtVPWJBOBfYZFxWzvJYHI3JxKfCkZssTNhY4vU2sJ8+XAN9Rfr7aW2QsAlHxlUJMw5P69LUy3/jb1DcqNK539rU/4CY5aedNWEYzP6Bn4DM6K/XnkS4j7Frodv2bT5HyE+I6Ec4SilMvTN8H5cbPMR6/uKdJ+aL0sNU5kXdGWYzMqwqSvM1rf1OLmZoCtBlP9S45UzhMiQH1I32giBKcsHG4E8LagfaIns/cURi69WM7x/cloNbm8f48nrmj97UXgZ947Fh+SbWvLK7zSCX9LFvnYJ0sntn35zF4/PfTxWWil8/0SwNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dot1bMFt/DisAJOTlWbEQ/ehv2IWuD2H51Jj5JRNxxY=;
 b=g1Ka3TjbYYswWWdKFic8hO6RyYDsiQd9BZuG6IMLprLw/JooTrIMqFNkA68BbThua7hvXL+F1Zwr178Hc95JQ3GdBa06CEG2C7MrgyQcOaFtQ2+hYXlZCYYl2E6JoJaHKEacZ1kgQh0pkg2E6kNGw5+LxBaUFuia8J7CR2/wqX+zRFfbZuldnD53FJXowaI0AzFemLxgv7Ei8PuB+jLKWimafSnJMWgGPOgbOny/o+TEsoP0QhWW9TL3I9jXiFGnIUBkM5J5p/KjEcIsSNGsE4LvxYXC4if05iOifnOOdLsJd4IiXhYBXkelWMqelGkfoG2ceEMDEO/VzdGi8Re8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dot1bMFt/DisAJOTlWbEQ/ehv2IWuD2H51Jj5JRNxxY=;
 b=l1GRMLQ5g7ZemIqGr3FHHe2SMYUQyM7SNCyO5bnYi0e7X0r4asEr2uhHiHkWBxoFHEXxQJf81hHvUmul1IpZiPCk2u9LixgpKhe6oCk3+gY79gtkw6RbIEhvIkZsqgijpqC9r0h45NhQu6epi8AJyTSvsmsGUxFGwghbdJApG+9uynxYYjKK7aA6/0u9+gWDOfIR44WeqBWnPklgco48nSQr90zmueDgZtLKF1WYmd/PKkXHwMKm8CwYfcw3wYzW94zaNlQCrWV14KKyTjsAwQr2Bf1r/fBeRtDYIW8dbqbm/ChVK9Qp85vUsZTsVv2BOn2n9a8dwPDUI8ykVaeCIQ==
Received: from BY5PR07MB6612.namprd07.prod.outlook.com (2603:10b6:a03:1a2::26)
 by SA1PR07MB10011.namprd07.prod.outlook.com (2603:10b6:806:3a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 23:37:48 +0000
Received: from BY5PR07MB6612.namprd07.prod.outlook.com
 ([fe80::399:d381:1dc:a50f]) by BY5PR07MB6612.namprd07.prod.outlook.com
 ([fe80::399:d381:1dc:a50f%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 23:37:48 +0000
From: Jason Mo <NukaColaM@outlook.com>
To: Mario Limonciello <mario.limonciello@amd.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: sound: soc: amd: rpl: No ALSA DMIC capture interface for ACP6x
 (PCIe rev 62)
Thread-Topic: sound: soc: amd: rpl: No ALSA DMIC capture interface for ACP6x
 (PCIe rev 62)
Thread-Index: AQHbuKLrFVrORCu6+kGmtT7bTmqMD7O+CGyWgABj4qQ=
Date: Thu, 1 May 2025 23:37:48 +0000
Message-ID:
 <BY5PR07MB661209806C2A917385698B0DA1822@BY5PR07MB6612.namprd07.prod.outlook.com>
References:
 <BY5PR07MB66126978095912E5D4A26E50A1802@BY5PR07MB6612.namprd07.prod.outlook.com>
 <aBLAwjELCoWNWDyH@finisterre.sirena.org.uk>
 <a08967df-a7cc-499b-94a4-125f9dbf05bf@amd.com>
In-Reply-To: <a08967df-a7cc-499b-94a4-125f9dbf05bf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR07MB6612:EE_|SA1PR07MB10011:EE_
x-ms-office365-filtering-correlation-id: b74d6f48-2234-4a1b-8f4a-08dd89092e4b
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|15030799003|8062599003|15080799006|8060799006|19110799003|461199028|56899033|102099032|3412199025|440099028|3430499032|41001999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0bZs5rQGR9E4bCKtn/LsWy3yaBVMVq8rC2oWf5LEVi3kZVFvzPc16wlGOt?=
 =?iso-8859-1?Q?1pXkCWo9avE5f/4/Fkn9kUjx6yKZHUDSa4h7OH1D/0kO8fym5HFs//4YH8?=
 =?iso-8859-1?Q?hCumRHRjNnjckZmmyCSTSZWu9rMXYie3JdOt+/9/avs2ja3uM8QoRPyJ8g?=
 =?iso-8859-1?Q?68k3YCvyZ3K8CHrGd5utANK/6n1MO41Nk0Px86RgWgmvKoBcM9s286Qm5c?=
 =?iso-8859-1?Q?QLUVDEuy9lvq+9JzQEQDZ9zdBH9NQRghpociPkMhTGC9YWp+mZUF6e3r4R?=
 =?iso-8859-1?Q?3Ay3QmpyadxrkGPkBQQA/NjvUS2aHzxpefps3bnkTiGJbuIwTb/zFTCcYx?=
 =?iso-8859-1?Q?fpMhX6N5Y3YhuKhZWH6huMSISrCIx1nJXpInVnakaj+sC6u6aHik1Ty5GE?=
 =?iso-8859-1?Q?h9qGUqAcbLBO69r1gFkYeioKZYuQx0+iOvrv3SBWtsjlOYBwyDW0LXLj78?=
 =?iso-8859-1?Q?51oNkAm+wOtZsLI58UYjnJbmJH8ZdUZwc4+SYTXjLuTgm4zykfOpG9E/yc?=
 =?iso-8859-1?Q?a9lHX6wjWXfrrhfvLeLH+Vzv130mY/3uWdkg7vy/qmllDJRmmpTKCKUtRd?=
 =?iso-8859-1?Q?WGcJ8TWt/RxdlTeavpAQJuGcVPphSKq6/SufntS99WWaopy8CVcmJ9NEot?=
 =?iso-8859-1?Q?JtRQ4pkhmMrP8hT+CQ38uiMVO+WAmk24I8k5s6/+iL3IZTgR42zjVSvkzY?=
 =?iso-8859-1?Q?BzGZhr/zwyfkS9VzhQLJyDk/9cc3T2Wi0N8P6UiSCHhjhoLCL5REPAwyrh?=
 =?iso-8859-1?Q?ndEj9ogwKSnlVaxpUKYisVM5xUwDwtsrABA2krHR/feYlmOMdDGBTCw+IC?=
 =?iso-8859-1?Q?9EKyErnokdG5fw5dykB+8wnQJT1OHQ+4u1QdP/in0TSeZIy1kCs07Q7zKz?=
 =?iso-8859-1?Q?KgYBUFGT0MtYwvLKVpzKqW3JNkFRW5NbRtQMkAxC3eJeLmxAcj/FTT846H?=
 =?iso-8859-1?Q?4vSmPthbi1hi4NujNKedzCNkUdkcsnPDby7IFIul00r3LKIaPjufw2iAk2?=
 =?iso-8859-1?Q?lPOo9YiCKozC44lj5O35L3HSrjq5qrGSrI2Vy/RD5j7szDQKQwMeTTFW63?=
 =?iso-8859-1?Q?5tDWK48WsWsBN0yMbID8HUabA286ClLqRGKC6nDjL5lqFiS1EIuau+T3Cj?=
 =?iso-8859-1?Q?8rIziTDfIrueIULlSLHpNUeCv7SSCZlpG8j+3csiF5lLEmKxx8AjBOFL0p?=
 =?iso-8859-1?Q?3qYF03/iFPHqOsvXxddq3L4EQTKJ02ClFSQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4tf+ol+vF+6m3MU+tt/WZDLe820rfFdVJ/aehCweUQsUg2+inq2g/oyB0J?=
 =?iso-8859-1?Q?U1bzDsEUhV7PhU9yb7J4LRbKovymm0WCl2SWn77Fig/gLUEDlWnVE7AaER?=
 =?iso-8859-1?Q?3qkMOLRxd/D91AHhj7MurHm5VnGJwgoM/EpX/Zq7q1ctP7kKcuKqy36RXw?=
 =?iso-8859-1?Q?toqSKMy3ZqJEvWqMULuLgSWc94ztGD65g1AJ12dDMiADXw0HawbjzosGyF?=
 =?iso-8859-1?Q?BgC5Y7W2TVbyDaw/8wplYunYyjy1m2hUoJHpYeDaPN7IgT+ID7/2fo+dJy?=
 =?iso-8859-1?Q?1prAyQAcmODbxrFZHlX1RpA5BY19Yz+BMaJUK9WD1F0whZvWCO5325csTU?=
 =?iso-8859-1?Q?DS5EG93DpazuIlpFHenUVl9eAkhKRtIs18F/atQhu7XMvStVlWBJrCVgX6?=
 =?iso-8859-1?Q?8NRvFUBPkKe88YJtVzg2XH4E17bc1CCoCQYdU8jkbFA92duF3AKlY4tgDh?=
 =?iso-8859-1?Q?Rwa7xGgl9NQx4sSH+zFuMo6v4fvWQyxPYY2akdQm2fw+clV4UwpYQFGJTY?=
 =?iso-8859-1?Q?hJlJB9nllIVjjvQ2O0InX7F6PT9o4TCpqe3MKJkDQutemsz1s9Rx8I/nky?=
 =?iso-8859-1?Q?fzSQLNizJpX6g028zIsrcSyw//1naDw7J9uv6e3izzMWuEYlBZxCwIL9as?=
 =?iso-8859-1?Q?Rj/bYD+q+cK/fm/f5RvPkV4p21s627RurT44+/LKuX2Jb4Tw/vTU6R3n67?=
 =?iso-8859-1?Q?+vd0y8fImgI1ENS6lxG7GRdzlwOvIkfaM1nE25EstmZTZuMFOMCNwdMeTM?=
 =?iso-8859-1?Q?Z8Gbj81HJCQAwiWbKgV0X2U/w0oyyY5sldstYXrFqdpg8t20W0t6q5ksyo?=
 =?iso-8859-1?Q?iRqNDH99Q1Yx96K5RkGLhzNKyOO+WHc3j8KSJs2Yj7uf72TwpxWgCWwtDz?=
 =?iso-8859-1?Q?LEqQquKGZjJnY6vtrc2YjGy2qEfsMefluH4Ox0cynifYF7MLfWM6Vud3Dw?=
 =?iso-8859-1?Q?sqCN0OriTBuI/C45ZBmdlRt/5CXtjuNkQ6vGXkdJNJMbPHHS1iWBCpyLoT?=
 =?iso-8859-1?Q?sSOb0hYe25RmJYpRrqLiV5qngPWPUij1Ex/7L6FoWbPG6dOgm73H8Pp4W4?=
 =?iso-8859-1?Q?ahoz6ChO3CohrC1REjTcuQ33CXO1DaED2gS7ZGZHY7hzU7bd/61BhJssqB?=
 =?iso-8859-1?Q?cKmRuZ8VWnZBFSoVAaTREdHtjwtzy0y7HkY8uvc9PeJCEJeOwCAYdm4UHm?=
 =?iso-8859-1?Q?Z3waGv6vMrFbIevY6RnoBxD9Kf0HGnmMxWpmFdJwIHS6w106CL9BgtuSGb?=
 =?iso-8859-1?Q?pEzR68UxQXLtE/MlFW1g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR07MB6612.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b74d6f48-2234-4a1b-8f4a-08dd89092e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 23:37:48.0480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR07MB10011

On Thu, May 1, 2025 at 05:16:00PM +0000, Mario Limonciello wrote:=0A=
> On 4/30/2025 7:30 PM, Mark Brown wrote:=0A=
>> On Tue, Apr 29, 2025 at 01:14:07AM +0000, Jason Mo wrote:=0A=
>>> Hi Liam, Mark,=0A=
>>>=0A=
>>> The `sound/soc/amd/rpl/rpl-pci-acp6x.c` driver for AMD ACP6x (PCIe rev =
62) appears to lack ALSA DMIC capture support, making the digital microphon=
e unusable on affected hardware.=0A=
>>=0A=
>> Adding Mario.=0A=
>>=0A=
>=0A=
> Thanks for adding me.  This is a missing feature.  Let me explain the=0A=
> background though.  This report was filed with a system with "Dragon=0A=
> Range".  The IO die in "Dragon Range" is the exact same IO die as in=0A=
> "Raphael" which is what snd_rpl_pci_acp6x was developed for.=0A=
>=0A=
> "Raphael" is a pure desktop APU, there is never a DMIC connected to it.=
=0A=
> However for Dragon Range, this is used in mobile designs and as you can=
=0A=
> see you have a DMIC connected.=0A=
>=0A=
> So this would be some new development to add DMIC support.  I'll raise=0A=
> some discussions internally about it.=0A=
>=0A=
> BTW - We will also need to see your dmidecode output.  There aren't any=
=0A=
> ACPI _DSD properties to indicate the presence of a DMIC, so we'll need a=
=0A=
> quirk (similar to how we do quirks for Yellow Carp/Rembrandt which=0A=
> predated the introduction of _DSD properties).=0A=
>=0A=
> Thanks,=0A=
>=0A=
=0A=
Thanks for the explanation.=0A=
Here is the requested output: =0A=
=0A=
$ sudo dmidecode -t baseboard=0A=
# dmidecode 3.6=0A=
Getting SMBIOS data from sysfs.=0A=
SMBIOS 3.4.0 present.=0A=
=0A=
Handle 0x0002, DMI type 2, 16 bytes=0A=
Base Board Information=0A=
        Manufacturer: MECHREVO=0A=
        Product Name: MRID6-23=0A=
        Version: Base Board Version=0A=
        Serial Number: ML238A04LJ=0A=
        Asset Tag: Base Board Asset Tag=0A=
        Features:=0A=
                Board is a hosting board=0A=
                Board is replaceable=0A=
        Location In Chassis: Base Board Chassis Location=0A=
        Chassis Handle: 0x0003=0A=
        Type: Motherboard=0A=
        Contained Object Handles: 0=0A=
=0A=
Handle 0x0028, DMI type 41, 11 bytes=0A=
Onboard Device=0A=
        Reference Designation: Realtek=0A=
        Type: Ethernet=0A=
        Status: Enabled=0A=
        Type Instance: 1=0A=
        Bus Address: 0000:03:00.0=0A=
=0A=
Handle 0x0029, DMI type 41, 11 bytes=0A=
Onboard Device=0A=
        Reference Designation: Realtek ALC256=0A=
        Type: Sound=0A=
        Status: Enabled=0A=
        Type Instance: 1=0A=
        Bus Address: 00ff:ff:1f.7=0A=
=0A=
>>>=0A=
>>> Hardware Details:=0A=
>>> 05:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] ACP/A=
CP3X/ACP6x Audio Coprocessor (rev 62)=0A=
>>>        Subsystem: AIstone Global Limited Device 1301=0A=
>>>        Kernel driver in use: snd_rpl_pci_acp6x=0A=
>>>        Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x, =
snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, ...=0A=
>>>=0A=
>>> System Information:=0A=
>>> Linux version 6.14.4-arch1-1 (linux@archlinux) (gcc (GCC) 14.2.1 202502=
07, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Sat, 26 Apr 2025 00:=
06:37 +0000=0A=
>>>=0A=
>>> Symptoms:=0A=
>>> *   No corresponding sound card entry in `/proc/asound/cards`.=0A=
>>> *   `arecord -l` shows no relevant capture device.=0A=
>>> *   No related ALSA mixer controls are exposed.=0A=
>>>=0A=
>>> Code Analysis:=0A=
>>> The `rpl-pci-acp6x.c` driver handles basic PCIe initialization but seem=
s to be missing the necessary ALSA/ASoC integration for capture. This contr=
asts with `sound/soc/amd/yc/pci-acp6x.c` (for rev 60/6f), which includes fu=
ll ALSA DMIC support.=0A=
>>>=0A=
>>> Attached Logs:=0A=
>>> *   dmesg (full & filtered for audio)=0A=
>>> *   lspci -vvnn (for audio device)=0A=
>>> *   aplay -l / arecord -l=0A=
>>> *   /proc/asound/cards=0A=
>>> *   lsmod | grep snd=0A=
>>>=0A=
>>> Question:=0A=
>>> Is the missing DMIC support in the `rpl` driver for rev 62 intentional,=
 or is this a bug/missing feature?=0A=
>>>=0A=
>>> Happy to test patches or provide more info if DMIC support is planned o=
r contributions are welcome.=0A=
>>>=0A=
>>> Thanks,=0A=
>>> Jason Mo=0A=
>>=0A=
>>=
