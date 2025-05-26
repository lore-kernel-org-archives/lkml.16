Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF6202C31;
	Mon, 26 May 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269662; cv=fail; b=O4uN9WQX4/w3ejI5kIAO5otRikB6LDxF/Tf/KPmjZVmZODTIqnS4fDgRvMhC/oqRondRcD3Y4IF30xcG6Kf2e/8mZk7IP0V8bDowZ88iJWr2M+ZMz3c+kgnHXO+QYSAGzuAMstnisEJ75x+YkAMNixgnQvA7ik+g97nAwex6sZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269662; c=relaxed/simple;
	bh=03CP2Iu4IzM/FcjVa7VAANMheNrTe+hoVodL+RmPfyU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nlhgIpd5sThrL0cwgWyE4DJn48YmyhN4uCDI5G0Mmm5yyxR6vZPOVG4PH0XXiX35v9HCCvTNH6Ay6MxPmGCvJ0zv7Y5ZCmiHwEchrgHm4D1RrgtgfVum03pRwieYLI7/FzOGzISJ/4wFt5S8cPrdDBe1Iu/y1SDqMiJtJA4plQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UWkrqmLT; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UWkrqmLT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4TLhtpd8u0y+h5E3jL8X409oddpjcU/FtQHp+MrmJCM2B2xVf+6L45otfR1RQknFQIwyBpP+yHGOsvoa16lIUAq8TnXkAlTd1BfUtunZvJp8dfRiP2qT3l0//IJTTLhOlSFk/gOSFw/T+DVofI9SYKbdf+LOD7UTDo8UDwTOo68U2JIxcmhW9iGO1WxM/zybHQ1xAREoVEUuAahvsHmGpEC5Qfn4aT5b/zE675/TK1c4vHdWqrIjJpcr6/4Xq3KkYxapBQ0OAVGOGpvIHncIMjJ1oXPFYy3MSmRzana2ACqA5D+j1uWbZE35rxd4jpxSIlV+rjwmN6selp3921xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03CP2Iu4IzM/FcjVa7VAANMheNrTe+hoVodL+RmPfyU=;
 b=blxJC8WFMUmWRvUEXOesjQ6LW5XT8IhHfWdGNhsR7ldhyyTuIXS2fQjDLfXlmq6oQdtnNZWlqHa6d6mzLi0B4p4eoHaiPhAZSkTPrYBdnU4uo64b12uF16dlJFRALlg6KN+WXhs07QWPd/05Npf9ApxBVoAV3Fl92rt7uRj8SM560fNVyGGXUvzbrLZtd9qpe4mbUQvxB+QV8sxKwtxpyMQV5gqblX6Lb/Md0TJ0go6d54YdojcJcoHomjSV4AL8kZUvh+9QeG/NsD7AiIY0WbpdY+FZcK4in9YG4k39/scNb2dZ/RL8poCGUNx2iPlifTVS+YFbZWuKvPrEefepfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03CP2Iu4IzM/FcjVa7VAANMheNrTe+hoVodL+RmPfyU=;
 b=UWkrqmLT8y5VvP5Z/YCq4+0V6/5vZzrTc97KNdiReVeJdMXOiJ+6CDNmFY2NVjbpI+xYXLmAoB+Ugw38sppATqw9wVc1vxU0ht7XjdsauJezj6scB64mq2iYRN00W/qNtx86glTXH2Dov+4rkpAQXmFp9ZlNHXEx6OVP1zNuJ/4=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 26 May
 2025 14:27:37 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 14:27:37 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>, Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: RE: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Topic: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Index:
 AQHbd9MxLQsfHKHRn06jkLCPeMCORrN5TCNcgENn4yCAEqYgooABy4BAgATCa2yAB0dpsIAIDELQgAArZ/A=
Date: Mon, 26 May 2025 14:27:37 +0000
Message-ID:
 <IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
 <87ecwb3i80.fsf@bootlin.com>
In-Reply-To: <87ecwb3i80.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c62e8fa4-e5e6-4ad9-b5d7-a54d02be1b8d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-26T10:46:10Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|SA0PR12MB4494:EE_
x-ms-office365-filtering-correlation-id: 9397a7bb-8005-411d-c471-08dd9c6176b1
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckdqTXJ0QWxGWUhvVHdVT1VXdStZMzM0YW56cWJDbXpUR045WkdKVFZVU3cy?=
 =?utf-8?B?TTc5bW5LZG9nRHpxaHpXK3YzY01IMDRZS00rNklBM2MybmtVa2x5K2c3S3lV?=
 =?utf-8?B?c2VvZ0FWdmx6T3pSRDYwQzRyS0pRNjZpZU9pWmdiKzV5VEVNeFJWOTl6THlG?=
 =?utf-8?B?bXY1R3RiZUEzTGt4Q3M0ckF6V0k1UzlvamdFZHREM1Y4RlZEWnovZ2V3eSs2?=
 =?utf-8?B?UG9pVGs5TzBUZVY0UVBjUEpBVWZnU1dZc2NsNm8wSG5iRi94STdoVUgrM2JI?=
 =?utf-8?B?YnFqNFdvQURSekJ1TllmbzVMWlY0TlMwRE9VYWtxZkdEQlQ1em9ndzYwd0dw?=
 =?utf-8?B?MHN0d0lQdHVUeDJIclNKUVJFRVZ2aUtWMSsyVUlFWXIyT1cyOHoycTl5eTVr?=
 =?utf-8?B?aGVxeG9mcDEyeE43VmNyUEhSZGJ2UFBlcXpsODgyc2dFU1Z4bzN4OTRJbHh2?=
 =?utf-8?B?NWN2YXBBRGRuaC9zbGhzdHYrNHJUNElGc2JhbWxoeU9wbDRyMVhTckpvQ2RX?=
 =?utf-8?B?RHkxUktmWHUwZE1tVW1WSncwWnQ2NUxMUGJiQ0lma01aWUcyVnBPZDhjYy9v?=
 =?utf-8?B?VCtqUXIxaFZiWmU1bGlhRjc2WG5YS0VZalIwN1JJNkpENnVESGJYSTJDaEZZ?=
 =?utf-8?B?T1NFTlQ4YWhLbEVYMnlVTVFCTFBYKzAzVjVuOEVEdWJRb0lXaENRVlN1bVJ1?=
 =?utf-8?B?a2dkTnFtcEpUQXM1ZkwvMFFWWkcwNTNVRnpUNnhBVFhTM0xXRGlva09lUXZU?=
 =?utf-8?B?L2d3NzNpZ3NDWi9sQU00cjQvdE80ZHdZejZ6UC90L1hRQm8xL0wxajRJOGFl?=
 =?utf-8?B?eGU0SGFwU0xEU2puSWNwOENtQmlqRzV2RHdTWDh6TUtNeVVVa05ELzBNWTlC?=
 =?utf-8?B?S2U0aitsQmdCS0tJYVMwQ2xXNFRSK1R0dUgxVjMraFBMdFk0SUFNTDN2V2g2?=
 =?utf-8?B?OTViWWdUNmNWenhKUWtTYmNvbzNSWE1jQUJpZUd1bkVnSTdxeFFUSFo3VFVR?=
 =?utf-8?B?aHZyMWF0VHI3WjNsai9qdm8raXlTamFldC8ySkJ1RzZ0ckN1NGRpbkkycFp0?=
 =?utf-8?B?dHc1RVpPekZYKzdGdkl0VDkyTjRtNXhmT214WURrV0R6aHNvZnFLUVBEZkhC?=
 =?utf-8?B?Z3J6MjRaMmhpR09yd0M3cnpUWUJFQWZwQlEvSjJac1pvbFBLTVdSM1BwdnU3?=
 =?utf-8?B?Q1IrcDBtbnIxMVc4YzFmV1diQS9sS0lvY0pBL0hreWthM21vbjBzMmxSSU03?=
 =?utf-8?B?ekwvMkp3V24xdjBEcmQ2cXJIRE44QXJMa05xYW1qM2dJV09nK2VtbW16WE5p?=
 =?utf-8?B?dEpPVGN3S3g4T2Y1V1NybHNUa0c1ampBNVhTUU9aY3YzcUZadm80VmozVTdR?=
 =?utf-8?B?amhyMmVZekhFRE1ENHFVMGs1bHdpMHZXSkxjWEFTS3Vkb1JXb2plZDZBTG4x?=
 =?utf-8?B?QlI2YlYyK0hta21RMVlPdGFrK0lnWDZndUVJVHpKd2dxRFdTVHFvWS9qYnFX?=
 =?utf-8?B?a1dBK2svR0k5UW5HYnNITnk4eWFmSmV4bFFsZEJFelhTZ2d2QzlsQ1JjczJw?=
 =?utf-8?B?Qk5CcDBieU14SkhYZ202Y3pvSEc3SUJOd3cxV2RHblM2RW5VRGFkZXdteXRP?=
 =?utf-8?B?OVd3N2xIZVJ6VTZzRG9tVFFnck9pSDJXK0VCNWtUTUIxSUJaWDNraG9waXhv?=
 =?utf-8?B?Qm9hbkZkdFo0K2NtY2d3RGU3dHpaMDlzOE54Um53bDExMGVSdTdrYklmbHJF?=
 =?utf-8?B?dTZrQ0tERXR0NHkyZFM1c2UzdWpWNTZsWHloZjlzWlFuazA5dm93ejRkdDcw?=
 =?utf-8?B?a0ZxdlJ4L2xFR3dYT1VJUlpJOVZQMHFhYzJOVk40RGdFd2JvS0pkckxuRjRN?=
 =?utf-8?B?RWd1RHdMRjJTOVNJaE1SSDRzZXNFMUFoeXdvd0Q0RGV3U29BRE84SE15T2Vt?=
 =?utf-8?B?bG5ZWHFMQ1c1QitWRmNkWng1TlV5eTRHR0JnWkR0YWhkdFJIVXlhRXpuSG5S?=
 =?utf-8?Q?3WCXXOTdl/JBc6WZElCb50jaPC7VP8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkJpdG1QWTJUbjJIK2NzbFZsemJ4SXRVY1lxaTdxQzJOc1VCTEJ6dmFuY1V6?=
 =?utf-8?B?RVdSaDBVdUg0OERXSE5uZ0VkOFhrWTEzUWdWb24rQWdyVkg5YTVHckFPWUpJ?=
 =?utf-8?B?TytJWFQyeExtemR6OEJuUGFYb2pVbHU1SEM2WVlrV3dvU3NxK1VFRjdFOXVK?=
 =?utf-8?B?a2kveHR1MURJNEQ2MDdPNXJ5UGt3SG51YnE4K2lkam9UZ3U3QXBIOGNWcm9w?=
 =?utf-8?B?Vlk2VUZZSXpka2VFNGI0bjFSUFdVeGRZUTVxZWRVSVlUMjc5cDJlMGFuRkpI?=
 =?utf-8?B?UEpOYkJHUTlOelVyWWg3QzRZUGhzTXd1Nis4ZFpkZkpKa0pyNWZXS0ZZVEF3?=
 =?utf-8?B?TmEyMjNSUGUrbisyV1dyK2NzZkx6ZzJiQ3dKMS8wRThWYUtqeURvMzh2N3Vo?=
 =?utf-8?B?K2wvOG0zSFhWYjFXd1FPNitrUHNLTlpobGRoLzZrR3dleHViMzQxVENNajlG?=
 =?utf-8?B?eDcxUG80cEpaUEtLcHFKV3VoYy9RRWpmRTMzRkpoMndWQ05oRDhCclBIQk5M?=
 =?utf-8?B?aitmOHpBOXJrUFAwcHFWWHlPRkQ3R1IwaWgyTE9pdkgxSXVyUTgralhCOGlm?=
 =?utf-8?B?Y3A4RXFSY1RIRWIzWjhaYUlOcEcwZnF4V0lNVndOb1krdFpzaSs1SVRyNWZv?=
 =?utf-8?B?WVF5RHkwUUdYMHlJdUR2bkVvczNMcm9qYjBsTWtpUWZZVFRKY2xaSkQ4OTlr?=
 =?utf-8?B?aHNhZVBrQWtibkxXWXZEdXdkaFcyUkNBU2dzVUNBU0ZhWnFoTjRwc1A4QWk1?=
 =?utf-8?B?dVZlbjVJREcxYnUyd1U4MmhiTXMraksvQnd6eFlFeDFxSkZaSW80TDNGcUNH?=
 =?utf-8?B?NDZtSGQ5Y3NTVSt2bXZwNW5qcXptekMrWXRheGJCL1hyRURVREkzSllvUVRy?=
 =?utf-8?B?TURhbTQ0d29JcFJPZ0xlMzRIcUo3Vm02ZGlnREk5WXBFeXpGcjdkL3RyMUhC?=
 =?utf-8?B?aGptSHFnUTc0MXNjSUlWRDZGNlpzRzNYbnpqTkVqQ0ZLR3hVa2RMaUF4ekRt?=
 =?utf-8?B?c1kySmUrUTFvYWo0dk5pTSsvanpzbzZ2T2FpK2N4NWgwY3hwUnVNK0xlMXBZ?=
 =?utf-8?B?T3BhaC9lUklJUlllRHFjTTlzYm1FQjUyOHhMVDVLMVh4UVQ3S1VWSWtUL1R4?=
 =?utf-8?B?d0tZdnNJS3E3VE9DZEt6TzQya2x6UHZ2emVmVE9FU2loY0Z2akhIcnVyMlhW?=
 =?utf-8?B?NDZnU0xMUDRZaHRMUmNNQW9lcCtPMFpGbmV1NTAyOEVNNnllblMzVE1tOVRP?=
 =?utf-8?B?V09ZSFpBUno3elFNR2tlZjNaNzFjYlA4SDVYVWtjNk9RemtYdVllVXNhY3hq?=
 =?utf-8?B?bStNV0pYM3BFWlJKODlYS3pPSFBlUUhGRlIyWTV2TlFXK1VkazBndm1LM2I3?=
 =?utf-8?B?NEdQU3hWL2huY05FTXRlblNZNUNrQmYzLzM1N0FRVFlHcVowZG9yN211VVhG?=
 =?utf-8?B?SlpGajBoYS9DOVBBTzA2VFRZNGlTTStmTVVDanJGUGJ0dHJmbVZRMG8xL0dC?=
 =?utf-8?B?QzZ4OENEQkFGdG9rUmtOeHB3Mnc3MGViL2syOUd0RGtCUG55dmtuN0dvMCtj?=
 =?utf-8?B?ZkNoNnkwSitHVUpGNWRNMHArSmlXM3Q1VzZVYlJmc1FQM2J0ZVlic2czUitp?=
 =?utf-8?B?WUNhUVhNaHVIOVZzWHVGM0MraFlzeElrNFZGbWpjSGJwZTRnT3B1c0U5dVJs?=
 =?utf-8?B?d1RtUWtCY3Q5UExmanRDc0hFbmhONCtEazVMNkNVSVZTTFNKVTRlVkJKMHkz?=
 =?utf-8?B?YjFSQ001WFhsZ1RPdW1uRFE3UDZoS254RkYrdHlxQ3BXSlMwaTUwYkxRZWhx?=
 =?utf-8?B?WEdiWGZMWXJyOURvOVhXbjE2ZWtra2ZkUk45b1dFR3hneGF2OG92YlZObUNi?=
 =?utf-8?B?RW9EVzlaWG5lVS9uZlFveTVQS1g1VlNwQUpOSFBMc2VMZkYydXJHUlBpV3l3?=
 =?utf-8?B?Smd1N2lEUFdPTkFrNWwzVDR4YTBkVm8zVFpRU3FuS3RQbGwxdHcxSWlONEFh?=
 =?utf-8?B?Vko0aEI3dml1RjdRM05rdWN3L25QTjJxUHp0TXg3djhYZm55QTNNR2xhMWla?=
 =?utf-8?B?TFd2bGlLMVErRG1wMVU2Um1JN2l2UHlNMzZkcEVYWTJLTlpWOEFJNWFyUVpt?=
 =?utf-8?Q?6uoI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9397a7bb-8005-411d-c471-08dd9c6176b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 14:27:37.3246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYwvJ/pOHCb/YodD6w2bqN+Gf7zrPliyzI/PMPx6Y/d22dIa2IzaMQT2MTpan6oW9SiZzn5QKuj9xc3MQC1dLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiA+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9u
IE9ubHldDQo+ID4NCj4gPj4gT24gMTMvMDUvMjAyNSBhdCAxNDo0NTozOSBHTVQsICJNYWhhcGF0
cmEsIEFtaXQgS3VtYXIiIDxhbWl0Lmt1bWFyLQ0KPiA+PiBtYWhhcGF0cmFAYW1kLmNvbT4gd3Jv
dGU6DQo+ID4+DQo+ID4+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBE
aXN0cmlidXRpb24gT25seV0NCj4gPj4gPg0KPiA+PiA+IEhlbGxvIE1pcXVlbCwNCj4gPj4gPg0K
PiA+PiA+PiA+PiA+ICsgICAgICAgICAgIG10ZC0+ZGV2LnBhcmVudCA9IGNvbmNhdC0+c3ViZGV2
WzBdLT5kZXYucGFyZW50Ow0KPiA+PiA+PiA+PiA+ICsgICAgICAgICAgIG10ZC0+ZGV2ID0gY29u
Y2F0LT5zdWJkZXZbMF0tPmRldjsNCj4gPj4gPj4gPj4gPiArDQo+ID4+ID4+ID4+ID4gKyAgICAg
ICAgICAgLyogUmVnaXN0ZXIgdGhlIHBsYXRmb3JtIGRldmljZSAqLw0KPiA+PiA+PiA+PiA+ICsg
ICAgICAgICAgIHJldCA9IG10ZF9kZXZpY2VfcmVnaXN0ZXIobXRkLCBOVUxMLCAwKTsNCj4gPj4g
Pj4gPj4gPiArICAgICAgICAgICBpZiAocmV0KQ0KPiA+PiA+PiA+PiA+ICsgICAgICAgICAgICAg
ICAgICAgZ290byBkZXN0cm95X2NvbmNhdDsNCj4gPj4gPj4gPj4gPiArICAgfQ0KPiA+PiA+PiA+
PiA+ICsNCj4gPj4gPj4gPj4gPiArICAgcmV0dXJuIDA7DQo+ID4+ID4+ID4+ID4gKw0KPiA+PiA+
PiA+PiA+ICtkZXN0cm95X2NvbmNhdDoNCj4gPj4gPj4gPj4gPiArICAgbXRkX2NvbmNhdF9kZXN0
cm95KG10ZCk7DQo+ID4+ID4+ID4+ID4gKw0KPiA+PiA+PiA+PiA+ICsgICByZXR1cm4gcmV0Ow0K
PiA+PiA+PiA+PiA+ICt9DQo+ID4+ID4+ID4+ID4gKw0KPiA+PiA+PiA+PiA+ICtsYXRlX2luaXRj
YWxsKG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbik7DQo+ID4+ID4+ID4+DQo+ID4+ID4+ID4+
IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJy
YWxzLCBJDQo+ID4+ID4+ID4+IGJlbGlldmUgaXQgc2hvdWxkIGJlIGhhbmRsZWQuDQo+ID4+ID4+
ID4NCj4gPj4gPj4gPiBJIHNlZSB0aGF0IHRoZSBwYXJzZV9tdGRfcGFydGl0aW9ucygpIEFQSSBj
YW4gcmV0dXJuDQo+ID4+ID4+ID4gLUVQUk9CRV9ERUZFUiBkdXJpbmcgTVREIGRldmljZSByZWdp
c3RyYXRpb24sIGJ1dCB0aGlzIGJlaGF2aW9yDQo+ID4+ID4+ID4gaXMgc3BlY2lmaWMgdG8gdGhl
IHBhcnNlX3Fjb21zbWVtX3BhcnQgcGFyc2VyLiBOb25lIG9mIHRoZSBvdGhlcg0KPiA+PiA+PiA+
IHBhcnNlcnMgYXBwZWFyIHRvIHN1cHBvcnQgcHJvYmUgZGVmZXJyYWwuIEFzIGRpc2N1c3NlZCBp
biBSRkMNCj4gPj4gPj4gPiBbMV0sIHRoZSB2aXJ0dWFsIGNvbmNhdCBmZWF0dXJlIGlzIHB1cmVs
eSBhIGZpeGVkLXBhcnRpdGlvbg0KPiA+PiA+PiA+IGNhcGFiaWxpdHksIGFuZCBiYXNlZCBvbiBt
eSB1bmRlcnN0YW5kaW5nLCB0aGUgZml4ZWQtcGFydGl0aW9uIHBhcnNlciBkb2VzDQo+IG5vdCBz
dXBwb3J0IHByb2JlIGRlZmVycmFsLg0KPiA+PiA+PiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3UgY2FuIHRoaW5rIG9mIGFueSBvdGhlciBwcm9iZSBkZWZlcnJhbA0KPiA+PiA+PiA+IHNjZW5h
cmlvcyB0aGF0IG1pZ2h0IGltcGFjdCB0aGUgdmlydHVhbCBjb25jYXQgZHJpdmVyLg0KPiA+PiA+
Pg0KPiA+PiA+PiBUaGF0J3MgdHJ1ZSwgYnV0IEkga2luZCBvZiBkaXNsaWtlIHRoZSBsYXRlX2lu
aXRjYWxsLCBJIGZlYXIgaXQNCj4gPj4gPj4gbWlnaHQgYnJlYWsgaW4gY3JlYXRpdmUNCj4gPj4g
d2F5cy4NCj4gPj4gPg0KPiA+PiA+IEkgdW5kZXJzdGFuZCwgYnV0IHNpbmNlIHdlIHJlcXVpcmUg
dGhlIHBhcnRpdGlvbiBpbmZvcm1hdGlvbiB0byBiZQ0KPiA+PiA+IGF2YWlsYWJsZSwgbGF0ZV9p
bml0Y2FsbCBzZWVtcyB0byBiZSB0aGUgbW9zdCBzdWl0YWJsZSBjaG9pY2UgYW1vbmcNCj4gPj4g
PiB0aGUgaW5pdGNhbGwgbGV2ZWxz4oCUaWYgd2UgZGVjaWRlIHRvIHByb2NlZWQgd2l0aCB1c2lu
ZyBhbiBpbml0Y2FsbC4NCj4gPj4gPiBSZWdhcmRpbmcgcG90ZW50aWFsIGZhaWx1cmVzLCBhcyBm
YXIgYXMgSSBjYW4gdGVsbCwgdGhlIG9wZXJhdGlvbg0KPiA+PiA+IHdvdWxkIGZhaWwgaWYsIGF0
IHRoZSB0aW1lIG9mIGNvbmNhdGVuYXRpb24sIG9uZSBvciBtb3JlIG9mIHRoZSBNVEQNCj4gPj4g
PiBkZXZpY2VzIGludm9sdmVkIGluIHRoZSBjb25jYXQgYXJlIG5vdCB5ZXQgYXZhaWxhYmxlLiBJ
biBzdWNoIGENCj4gPj4gPiBzY2VuYXJpbywgd2UgY2FuIGlzc3VlIGEga2VybmVsIHdhcm5pbmcg
YW5kIGV4aXQgZ3JhY2VmdWxseS4gQnV0LA0KPiA+PiA+IEhvd2V2ZXIsIGlmIHlvdSBwcmVmZXIg
dG8gbW92ZSBhd2F5IGZyb20gdXNpbmcgaW5pdGNhbGxzIGFuZCBoYXZlDQo+ID4+ID4gYW4gYWx0
ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gYXBwcm9hY2ggaW4gbWluZCwgcGxlYXNlIGxldCB1cyBr
bm93Lg0KPiA+Pg0KPiA+PiBJIGFtIHNvcnJ5IGJ1dCB0aGlzIGRvZXMgbm90IHdvcmsgd2l0aCBt
b2R1bGVzLCBhbmQgd2UgY2Fubm90IGlnbm9yZQ0KPiA+PiB0aGlzIGNhc2UgSSBiZWxpZXZlLiBN
b3JlIHNwZWNpZmljYWxseSwgaWYgYSBjb250cm9sbGVyIHByb2JlIGlzDQo+ID4+IGRlZmVycmVk
ICh3aXRoIEVQUk9CRV9ERUZFUiBvciBqdXN0IHByZXZlbnRlZCBiZWNhdXNlIHNvbWUNCj4gPj4g
ZGVwZW5kZW5jaWVzIGFyZSBub3QgeWV0IHNhdGlzZmllZCksIHlvdSdsbCBnZXQgaW5jb3JyZWN0
bHkgZGVmaW5lZCBtdGQgZGV2aWNlcy4NCj4gPg0KPiA+IE9rLCBhbiBhbHRlcm5hdGl2ZSBzb2x1
dGlvbiBjb3VsZCBiZSB0byByZW1vdmUgdGhlIGluaXRjYWxsDQo+ID4gcmVnaXN0cmF0aW9uIGFu
ZCBpbnN0ZWFkIGludm9rZSBtdGRfdmlydF9jb25jYXRfY3JlYXRlX2pvaW4oKeKAlHdoaWNoDQo+
ID4gd2FzIHByZXZpb3VzbHkgcmVnaXN0ZXJlZCBhcyBhIGxhdGVfaW5pdGNhbGzigJRkaXJlY3Rs
eSBmcm9tDQo+IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIoKS4NCj4gPiBJIGJlbGlldmUgdGhp
cyBhcHByb2FjaCB3b3VsZCBhZGRyZXNzIGJvdGggb2YgeW91ciBjb25jZXJucyByZWdhcmRpbmcN
Cj4gPiBtb2R1bGUgc3VwcG9ydCBhbmQgcHJvYmUgZGVmZXJyYWwuIEFkZGl0aW9uYWxseSwgd2Ug
Y291bGQgY29uc2lkZXINCj4gPiBtb3ZpbmcgdGhlIGVudGlyZSBjb2RlIGZyb20gbXRkX3ZpcnRf
Y29uY2F0LmMgaW50byBtdGRjb25jYXQuYy4NCj4gPiBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciB0
YWtlIG9uIHRoaXMuDQo+DQo+IFdoYXQgd291bGQgdGhpcyBicmluZz8NCj4NCj4gTWF5YmUgd2Ug
c2hvdWxkIHRyaWdnZXIgc29tZSBraW5kIG9mIG5vdGlmaWVyIGFmdGVyIHJlZ2lzdGVyaW5nIGFu
IG10ZCBkZXZpY2UgYW5kIGluDQo+IHRoZXJlIGF0dGVtcHQgdG8gZ2F0aGVyIGFsbCBtdGQgZGV2
aWNlcyByZXF1aXJlZCBmb3IgdGhlIGNvbmNhdGVuYXRpb24uIENhbiB5b3UNCj4gcGxlYXNlIHBy
b3Bvc2Ugc29tZXRoaW5nIGxpa2UgdGhhdD8NCg0KSW4gdGhlIGN1cnJlbnQgcGF0Y2gsIGR1cmlu
ZyBNVEQgcmVnaXN0cmF0aW9uLCBpZiBhIGRldmljZSBpcw0KcGFydCBvZiBhIGNvbmNhdGVuYXRl
ZCAoY29uY2F0KSBkZXZpY2UsIGl0IGlzIG5vdCByZWdpc3RlcmVkIGluZGl2aWR1YWxseS4NCklu
c3RlYWQsIGl0cyBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gYSBjb25jYXQtc3BlY2lmaWMgZGF0
YSBzdHJ1Y3R1cmUsIGFzDQppdCBpcyBub3QgbWVhbnQgdG8gYmUgZXhwb3NlZCBhcyBhIHN0YW5k
YWxvbmUgTVREIGRldmljZS4gQXMgcGVyIG15DQplYXJsaWVyIHByb3Bvc2FsLCBvbmNlIGFsbCBp
bmRpdmlkdWFsIE1URCBkZXZpY2VzIGFyZSByZWdpc3RlcmVkLA0KbXRkX3ZpcnRfY29uY2F0X2Ny
ZWF0ZV9qb2luKCkgaXMgY2FsbGVkIGZyb20NCm10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIoKSB0
byBzY2FuIHRoaXMgZGF0YSBzdHJ1Y3R1cmUgYW5kIGNyZWF0ZSB0aGUNCmNvcnJlc3BvbmRpbmcg
Y29uY2F0IGRldmljZXMuIEp1c3QgdG8gY29uZmlybSwgYXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQN
Cm10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbigpIHNob3VsZCBiZSB0cmlnZ2VyZWQgdGhyb3Vn
aCBhIG5vdGlmaWVyDQppbnN0ZWFkPyBBdCB0aGUgcG9pbnQgd2hlbiBhbGwgaW5kaXZpZHVhbCBN
VEQgZGV2aWNlcyBhcmUgcmVnaXN0ZXJlZCwNCndlIGFscmVhZHkgaGF2ZSB0aGUgY29tcGxldGUg
aW5mb3JtYXRpb24gcmVxdWlyZWQgZm9yIGNvbmNhdGVuYXRpb24uDQpTbywgcmF0aGVyIHRoYW4g
cmVseWluZyBvbiBhIGxpc3RlbmVyIG5vdGlmaWNhdGlvbiwgd2UgY2FjIGRpcmVjdGx5IGNhbGwg
dGhlDQpBUEkuIFBsZWFzZSBsZXQgbWUga25vdyBpZiBJIGFtIG1pc3NpbmcgYW55dGhpbmcgaGVy
ZS4NCg0KUmVnYXJkcywNCkFtaXQNCj4NCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo=
