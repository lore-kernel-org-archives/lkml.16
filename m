Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830111E833C;
	Fri, 28 Mar 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159249; cv=fail; b=kP3pL3Agke5UOo6UVJnXxrawdOC6ADyef91JqXdV6PKe76++deBhLHco20XzAvV6PSVRBO7uGAEsmnaV4d+dnQmNYL1YMx3QjHtM+RK/L3JgPfRgx/2gmrp66gTq6pv5Vtjn8ExyXSn0qNBMxDHwzxS/C10wVe2zGxxaExmGID0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159249; c=relaxed/simple;
	bh=njGfT2OmQCWPJ7CMmKmAjt/w646jAcS4AsX30KwcOYE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gfrjQHLn8OQaAbJNx/Uigtf3D6M8khqgUvh716w85NOraJX9MkIjr+KKusxDkX4HJSkOHSx0gsIorIM2vI+0nZEkdOhfGKe1B+GoLfwf2qBIFc0/UolPe/p923CPQFUxMBEsdRoBDeynaxEnEZdkm6KwQtcuLU4nZ4XkwDklZKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zXqYGjiW; arc=fail smtp.client-ip=40.107.96.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zXqYGjiW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRbiQDI5yXEgvJ84omPSTKytkqa/Lb+BLhztdp0IgGwAv0nCCswoIc12z9TycsCF3H/bKzBzuU1Ol5M1YcxWLtvreQIVSpBLEGCjsCJkamufNMsRTX0aO/PJWKxvm26xT72G/CAB+43eg1D1TGxeAJeSuOOa6Szvw7T5/eDow/XcCt/4j9O+Z+AqfcaGE+D85D+jdDHPETQb/nipCYmKA2H/HH0ztyMh14n8MWAZLPCy/iov6ZirNlMJqbKKTKcMzctp0BwGz5RUORM7gjMXgMCAq+5+1ANv+o+uKUXVqDh3mzRREU0z3dienQlrkOmjJh36+ndlDuWPEY5xEvzg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njGfT2OmQCWPJ7CMmKmAjt/w646jAcS4AsX30KwcOYE=;
 b=JOH4+ES6mi+48frxugwB7jMU2kSpFyHUK/XVOQFLO38r2AT0XiPalrp38af7fPZhhHLghMNQcDjA4BfARB2dFpkZ4CaoH79LiK+ShARbqw62tl9nwqjitGRX8kfpsYJD+sesfu9GPC56w3VUHxFBmn7L6CM1HW9rrhoXaPKDVHzCxGcS2QxTwawVZKlwB1GhYmC89zQElC0rz6459zTB8IdIYxudep5XYKERPO0voUBsCIB+KuQ2eoIe7eFrKIaKarCr5oV35PJrs5GpDc8rM+nKPk31sqrDRVq7MpmRPyq1EysYiBWlIm4cAASh8DTLxLlFagv27CCsOnyYr5niAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njGfT2OmQCWPJ7CMmKmAjt/w646jAcS4AsX30KwcOYE=;
 b=zXqYGjiWraKDhM9UiGbfk58wWa5ZoV0g8yQ6ckwDinyG2/WIe2btkB8IkefpvfqxzwEioQCPmwruWOkRHpWYCA87ZhB9ab8gyCMA+WHGN34eOmtCijfaEC0h4L8ReswfZdSXQ2MhoHa1cpD99hoeZ+1+rkUVZWy5KSaD5pMaW0hprv4lGLi5LD1e/KA7mQps83UJ9EZzS20DMXEWn70+UT2wt4Q1gjtLLPyn6LUVb3sCi/YeQKAKpYj0T/q7DvMZXnP7LK7ksD/pjrbNV6LfTh0yYan+t6DJa+qewd3UQgizHyZzFUSWjRQDG8gyeVi7ln9B+G41Y9vnDPFF4QmNWg==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by DS7PR11MB8805.namprd11.prod.outlook.com (2603:10b6:8:254::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 10:54:03 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 10:54:03 +0000
From: <Manikandan.M@microchip.com>
To: <andrew@lunn.ch>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Topic: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Index: AQHbnh/pyJiWvGpgIEmzvnvLJ7gCCrOFZusAgAEYowCAAHh/AIABax8A
Date: Fri, 28 Mar 2025 10:54:02 +0000
Message-ID: <c33d5c3d-61b9-41c9-b553-dec8087a60a4@microchip.com>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
 <20250326072140.172244-4-manikandan.m@microchip.com>
 <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
 <906d596b-391b-43ec-8654-38de64f043f1@microchip.com>
 <807f29fe-2fe1-455b-8357-4caafc45090e@lunn.ch>
In-Reply-To: <807f29fe-2fe1-455b-8357-4caafc45090e@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|DS7PR11MB8805:EE_
x-ms-office365-filtering-correlation-id: 65082253-796b-450d-ddad-08dd6de6da64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Wm5DM2Q2aDlVSGI4bVd4b1NSM1Nsa3Y2TGZXMG45cVM4ZUM2cVAvaHFmSnVI?=
 =?utf-8?B?ZGFYUnVvWVFlSnJRZSsvOEpZd3dWZHBYd1lBdGg1KzViWHRaVEcxRSs0d2FP?=
 =?utf-8?B?VmEwQ0JZZWRNRHdrVVpuaXk0SkdrcDRVUXVtc0JCR25YZXlBYXdCWTVnRTkz?=
 =?utf-8?B?TzNnNUs1NWdhZWRVNnZsZkFyeW5lek1laEVDVmFMZ1NtVkFHVkpzWXhwUUY3?=
 =?utf-8?B?cU5XL0E3QXUzL0lGeXR1VkVXTmgxdXNEN2R5NlA2M21pbis0TTgyeC9vaHI1?=
 =?utf-8?B?VE1DN1owVXZOeVZxcEJ3ZGhhVktaWGQvaWFnRW1nWCsyVC82b2Zha29wejdy?=
 =?utf-8?B?MjZabThNQjdMOXFWTkdiTWxiUCtOZkUrK2g3ODNJQUNCeGYzRG11RXdkb1Jy?=
 =?utf-8?B?V2ZZemt4VXZhL1NSSXpraG9lcDBtY2pTdDdPOWk1YWdDa2Roc0d3ZXJQalVK?=
 =?utf-8?B?WW9CZGlHUG5NRlNPdnhHU3hGc2U4OVdLSTkvMHM0d1pCRDVqWUVtRjRsRHo4?=
 =?utf-8?B?cUJNMnRjNHVucW5vU3RkY3BPT2xLR3Y1TmdkWDF2ZzA4eHBxenVaWGtsUUJD?=
 =?utf-8?B?UFd5cmY4eml3ZVNOYUpEQ2ZVdEJDWkVuVHFPTk1JeGFYM0RRaUxTOGZtUEhU?=
 =?utf-8?B?dUtpbGQ3Qy80bVVwSm5OejNOZS9NbTFSbkdYQnN3eTNXSGpqRDUzUWg5OU1U?=
 =?utf-8?B?T2VrRFhwNk1lSWEvc3NWTHJvNmlxWkh0RW9Wcnp2c2FzUjhMVW1tRnkyRzB2?=
 =?utf-8?B?ZWdJRFdBVENyc1dhWlhwc1hGaWc0ckJPSDlWcFJDd1BkeWVveXVnYVMwbGUr?=
 =?utf-8?B?eHpEVnhqQTlJL2s0NnFHNlF6UTRSNnBRYkVxdFh0c2dvTHZSZTZBMU9icGpn?=
 =?utf-8?B?cm5zNFdGcnZEa3J5YmNiVWx2dnRCSVFRbFhmK2NlVGxBOHRzeDVYVzltWGVu?=
 =?utf-8?B?UmNraVlVSDJZTy9GeVVST05vUW1obmVRSitBNjZIbUM0cEhvQUZBbC9WbTM4?=
 =?utf-8?B?S3dXOUg1cGFKYVFqTmN0Ujhrcm4xeWFTdVExTFBTd0FEY3F4Uk1WSlh6S21m?=
 =?utf-8?B?SUNPRnI0eEp4eTBzb2xkQTNDNnB0eW9keWprb0o5eCtabkxhWVZEdFFqVWlH?=
 =?utf-8?B?SVNjTStJdi9TdE5iTFdOQVlZY3lUR2pMMStOM3V1TFRHY3Vwdmp4My91UnZm?=
 =?utf-8?B?MFluemxCKzdWS0lERHYxNi9kWXdvREQ1eXJlMnd2ejZjczlPcGQ3Tnl0czln?=
 =?utf-8?B?RnpXM0VPSlJlSVZxVnBYaG9jc01jcmp6K3lEUndsOTJObjRNN1lYMjdKV3B4?=
 =?utf-8?B?V0lZNFpaWm1MUWUyVFhUaEx6RGpWQXJCUE1wUWNhNzZUYjd4ZVR2VnUxVWZj?=
 =?utf-8?B?em9ET0U5SGZ5TU9PZ09uOUY5aWJFT2tjYTFOakQ3Vk04U1hhOEJKaHB1VFEr?=
 =?utf-8?B?VU53UDlISkF0aGN0eTEvVVlkVUMzTUZ1bTFDWTM3RmJscndSRWFFOWZpK0h3?=
 =?utf-8?B?cjNrSzhpZ3hkbnBod2xGaGYvUDJFTUNqcjFPK0xDdGoyc3VIelVPOU5rVFZl?=
 =?utf-8?B?bks2ZDdEWVorREhFcmd1YUs3eGVFcFRncmovTHRaMUtXOXFVR3FUYTFtVHNO?=
 =?utf-8?B?OTIvclJ4dWh5TWl4QkNlOUgrM0NvSXJGbVNXNW4ydnZjZGVPQklnaCsrZHF6?=
 =?utf-8?B?RkRXMG1PU0ErNnE2ZE11Yi9tK3NSTDYwUGl2MU15SVdmdG1WUjdhNHZxMDlG?=
 =?utf-8?B?QXRmU0tLQXo3TWYxUVpOVXk4T0dLeGhtZ1ZBZStwUk9CMk1wSFdMYTl3ZGVK?=
 =?utf-8?B?dmFDS21ldW9CRVcrWUF0eE5JWXBkMlpOZ3d3MXV1UGtHUXcwVWVoa2dlUTNr?=
 =?utf-8?B?MXU5MWQ5VzZTMWpZdVF4U01jNXRKODRwVEFuc0dUZ3JHa3MwMFR3anlFbEh5?=
 =?utf-8?Q?9URmQ+iSd4h/8/VKpJxTDj4ZfbUxEKGL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVY0L0V0aDZSeUs5cXYwdU8zSkdhcVk4VkZZb1R1dzJiYjl2dHI4cTZyaHBv?=
 =?utf-8?B?NlNSS3R1d1F2WTkzcEZZdDRyVXFzY2ppbWpKdmNkcWt3cW9URnNJR3JOYWhS?=
 =?utf-8?B?ekxpWENyRy9xRzNOaEVKOUpZRGEveThaSVpuaEgvUjhqQ1h3SmplZVViQTk2?=
 =?utf-8?B?YkNtaEU3dHk5YjRZVjVYSnZMdjl1RjVxcVMwK2JQajhaZlFNdHI0cElpOWdm?=
 =?utf-8?B?TkVmMkJJL1NrUEFKbmJkcStRY1MzY2VmREwxOHRackozcTc2endSNXE2MzBi?=
 =?utf-8?B?MTVNOENRRHFvQithUktsL2g2a3F1dFladml6eVFzZWg2djFWellKTWhiSXpG?=
 =?utf-8?B?WnEwSVRhUmFuWmUwRnBhbmJ2SWR6WVhEb2QzUmx0bVU5cWFvbXJ2YkZDQk5T?=
 =?utf-8?B?aXk2aFQ0b3hMRXZINkxJa3Fad1ZxTjNwcVRwMnA5dXpxRlJPdkpJK3FRZGI0?=
 =?utf-8?B?TEwwZkdxaVhZN3VtZ0xMQ0kvUTZZSWgxQ1JpRGUzRjd1K01BZmtrN284c09M?=
 =?utf-8?B?cnhQYm1wM3RObkgvZnBFWjkxRUpxM0VlaUxsQlppVDVreklNdzFUc0J0Z3ZL?=
 =?utf-8?B?SHpVTmJGWGpubEVSU1lRM0xCUW15ZXNUcTdPSGtrVVBHL1prc2xWdm5IdDIw?=
 =?utf-8?B?b0xqekZaNXBIeXcrTjduRGtlNTJnT0tRbWNNbjhXSGtSMXFvTEM1MXoyNC9V?=
 =?utf-8?B?YVJzd0s5TkxjT1dtTEo0ZnMrZkNtcy9jNmkzcVdEOW8rYTNpQXo5ZWpVNmdF?=
 =?utf-8?B?Rk4rWXhFcWU0RHZDV1h0cEtBczJiU0JpYXhZcC9UTDlmRzE2RStLb0lTeUdS?=
 =?utf-8?B?VE1MMVlUT1VFV0RjRjE4Wk0wUDRXa1RaYVpXMnpWQUZYZWtXdmZST0N5RU1w?=
 =?utf-8?B?MFVKUklyNmxSejIzUXpXMXIxdFR1SlorRE5ZT2lFWllUM0NYNjRJMk1OOWQr?=
 =?utf-8?B?VTdFRkJ2a1RZZk4zNkxhMUY4RzdKbzV4UStJQ3BCaXJuekl1aE45NTdJb0VZ?=
 =?utf-8?B?dVFTRXE5b0pnMWdiTUR1eDJQcmptd2dVOW05eWxxZFFRNGxwdW1malJsQTEx?=
 =?utf-8?B?aUdMRnVSN0d1NlpVOEJZTktzakJIcVI4ZDdFM1djRkdaTTlDa2VqYlRvVDJu?=
 =?utf-8?B?dE0xRVZDMTAzeWlVMStraFprREhaMkF3SkJkeVhxdlIzcWdnR1dieVUvVHJ5?=
 =?utf-8?B?bG5oYzJQMUZLbnhTRTZUbHREYWhTUTEvWHRqQWhkM21BZlJiZTk2RnNwU3d2?=
 =?utf-8?B?eUNscDNBaTVROE9LaHpPaCt5YXo3aG1kUUFJVGpyL2ZxYmFZQ25zNHduOHlY?=
 =?utf-8?B?RmQ4YzYzc01lZmV0N0NKbkxXQnRkaURHZzg3bHVmdWpmdDM5RFZkNXF1Smo3?=
 =?utf-8?B?dHdXelBJM29CK0lVRUxlTElwWC9nYXlna0xKMEQ4bXpxYVptV1hTcFUvdGlz?=
 =?utf-8?B?WDhwN1hBSnhoNDUxd3V2YTBPN3JZNGxZNENlVmhudVlHeVdsR2tja042QVhE?=
 =?utf-8?B?d2RxYXBpQXR2UFRWSnRCa2JOUFJ1N1MwNFhRSk12TmJFODh5ZnV0dWx1UWts?=
 =?utf-8?B?RTdVNjJhUVlVZzcvd2tjWVA3azZKSmtBSStnSHNFb0Jtc0xOSWcvL3FmcDRq?=
 =?utf-8?B?T053UkpSMjNRY1lOYTk3UlRPTTAwQnp5Z2FiMkl6NTRETHU5UlpRaGZtSHkr?=
 =?utf-8?B?b1pCZU8rSWpSVUFVeXlqN3pZWHRkdkkxeE1zV2RhQWNxSlBGVjZxWVlOZzRi?=
 =?utf-8?B?cnBrQklWR2FLZ3Mvd1JrYzBRcU9JNStOZXJHdW5JSjNHeUlxTVVKVEs2dk9O?=
 =?utf-8?B?dFBGaFJmdXlyYytaWktkMlIyQ1JHWXlKRVZBQTkwbi9kNjdxTnBvSW50NTN2?=
 =?utf-8?B?MTE3OXpKK0J3MkRvR3JwOVhRVW5pTENqQ2l4WFowREZRRTJOOFh3NkFtRWdv?=
 =?utf-8?B?QXI1MTdpVTFuYXFoWjRTZ3Q0bDN2WWxSMWJQUUgwOUh5bTNRc2szVit0Yzcz?=
 =?utf-8?B?TTRibmhoVldMTXd4WktmVFZRZGlBTks4enRFUHR2RGtPTVEyWVdRQS92NEU5?=
 =?utf-8?B?eUFhbFZ1bkk3eTA1MEZwK1ZRT3BGWG5lTE9yUG12c0NBM3JjRm1NS0dUTW9o?=
 =?utf-8?Q?GPqcPUsvZaNrdRkObuyNFn2HH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <365B0CA49F2B974CADF754B4BE8E44B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65082253-796b-450d-ddad-08dd6de6da64
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 10:54:03.0087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jOQa7yED0RSpRGM1ulBuleY5TxDX9MSGF7OyUO1ln172hJ8zKvA6lsXxjqj/TxJM+yBWGDkd9oz+aommT1YUro2RQa3eQtCoHn4PsKVhkw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8805

SGkgQW5kcmV3LA0KDQpPbiAyNy8wMy8yNSA2OjQ0IHBtLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUaHUsIE1hciAyNywg
MjAyNSBhdCAwNjowMzowNUFNICswMDAwLCBNYW5pa2FuZGFuLk1AbWljcm9jaGlwLmNvbSB3cm90
ZToNCj4+IEhpIEFuZHJldyBMdW5uLA0KPj4NCj4+IE9uIDI2LzAzLzI1IDY6NDggcG0sIEFuZHJl
dyBMdW5uIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+
DQo+Pj4gT24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTI6NTE6NDBQTSArMDUzMCwgTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+Pj4+IEFkZCBudm1lbS1sYXlvdXQgaW4gUVNQSSB0byBy
ZWFkIHRoZSBFVUk0OCBNYWMgYWRkcmVzcyBieSB0aGUNCj4+Pj4gbmV0IGRyaXZlcnMgdXNpbmcg
dGhlIG52bWVtIHByb3BlcnR5LlRoZSBvZmZzZXQgaXMgc2V0IHRvIDB4MA0KPj4+PiBzaW5jZSB0
aGUgZmFjdG9yeSBwcm9ncmFtbWVkIGFkZHJlc3MgaXMgYXZhaWxhYmxlIGluIHRoZQ0KPj4+PiBy
ZXNvdXJjZSBtYW5hZ2VkIHNwYWNlIGFuZCB0aGUgc2l6ZSBkZXRlcm1pbmUgaWYgdGhlIHJlcXVl
c3RlZA0KPj4+PiBhZGRyZXNzIGlzIG9mIEVVSTQ4ICgweDYpIG9yIEVVSS02NCAoMHg4KSB0eXBl
Lg0KPj4+PiBUaGlzIGlzIHVzZWZ1bCBmb3IgY2FzZXMgd2hlcmUgVS1Cb290IGlzIHNraXBwZWQg
YW5kIHRoZSBFdGhlcm5ldA0KPj4+PiBNQUMgYWRkcmVzcyBpcyBuZWVkZWQgdG8gYmUgY29uZmln
dXJlZCBieSB0aGUga2VybmVsDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4g
TXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+
ICAgIC4uLi9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjlfY3VyaW9zaXR5LmR0
cyB8IDEwICsrKysrKysrKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9h
dDkxLXNhbWE1ZDI5X2N1cmlvc2l0eS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAv
YXQ5MS1zYW1hNWQyOV9jdXJpb3NpdHkuZHRzDQo+Pj4+IGluZGV4IDM1NzU2Y2MwMWU2OC4uNmM1
ZmYwOGYwYjNmIDEwMDY0NA0KPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAv
YXQ5MS1zYW1hNWQyOV9jdXJpb3NpdHkuZHRzDQo+Pj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L21pY3JvY2hpcC9hdDkxLXNhbWE1ZDI5X2N1cmlvc2l0eS5kdHMNCj4+Pj4gQEAgLTQ3OCw2ICs0
NzgsMTYgQEAgZmxhc2hAMCB7DQo+Pj4+ICAgICAgICAgICAgICAgICBsYWJlbCA9ICJhdG1lbF9x
c3BpMSI7DQo+Pj4+ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+Pj4+DQo+Pj4+
ICsgICAgICAgICAgICAgbnZtZW0tbGF5b3V0IHsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZml4ZWQtbGF5b3V0IjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MT47DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIG1hY19hZGRy
ZXNzX2V1aTQ4OiBtYWMtYWRkcmVzc0AwIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDY+Ow0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgfTsNCj4+
Pj4gKyAgICAgICAgICAgICB9Ow0KPj4+PiArDQo+Pj4NCj4+PiBJJ3ZlIG5vdCBsb29rZWQgdG9v
IGRlZXBseSBob3cgdGhpcyBhbGwgd29ya3MuIERvbid0IHlvdSBuZWVkIGENCj4+PiByZWZlcmVu
Y2UgaW4gdGhlIGV0aGVybmV0IG5vZGUgcG9pbnRpbmcgdG8gdGhpcz8NCj4+IFllcyB3ZSBuZWVk
IGEgcmVmZXJlbmNlIHRvICdtYWNfYWRkcmVzc19ldWk0OCcgdXNpbmcgbnZtZW0tY2VsbHMgaW4g
dGhlDQo+PiBFdGhlcm5ldCBub2RlLCBzaW5jZSB0aGUgc2FtYTVkMjlfY3VyaW9zaXR5IHVzZXMg
YSBkYXVnaHRlciBjYXJkIGZvciBQSFkNCj4+IFsxXSwgdGhlIERUUyBwcm9wZXJ0aWVzIGFyZSBk
ZWZpbmVkIGluIG92ZXJsYXkgZmlsZXMuIEhlcmUgaXMgdGhlIHF1aWNrDQo+PiB1c2FnZSBvZiB0
aGUgbnZtZW0gcmVmIGluIHRoZSBldGhlcm5ldCBub2RlOg0KPj4gICAgICAgIG1hY2IwIHsNCj4+
ICAgICAgICAgICAgICAgIG52bWVtLWNlbGxzID0gPCZtYWNfYWRkcmVzc19ldWk0OD47DQo+PiAg
ICAgICAgICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNzIjsNCj4+DQo+PiAg
ICAgICAgICAgICAgICBwaHkgew0KPj4NCj4+ICAgICAgICAgICAgICAgIH07DQo+PiAgICAgICAg
fTsNCj4gDQo+IFNvIHdoeSBhcmUgeW91IG5vdCBhZGRpbmcgdGhpcyBhcyBwYXJ0IG9mIHRoaXMg
cGF0Y2g/DQpBcyBtZW50aW9uZWQsIHdlIG1haW50YWluIHRoZSBEVCBub2RlcyBhbmQgcHJvcGVy
dGllcyBvZiBhbGwgZGF1Z2h0ZXIgDQpjYXJkcyBhbmQgbW9kdWxlcyB3aGljaCBhcmUgbm90IHBh
cnQgb2YgdGhlIG9uLWJvYXJkIHBlcmlwaGVyYWxzIGluIGEgDQpzZXBhcmF0ZSByZXBvJ3MgYXMg
b3ZlcmxheSBbMV0uSW4gdGhlIG5leHQgdmVyc2lvbiBJIHdpbGwgYWxzbyBpbmNsdWRlIA0KdGhl
IERUIGNoYW5nZXMgb2YgdGhlIGJvYXJkIHdoaWNoIGFjdHVhbGx5IGhhcyBhbiBvbi1ib2FyZCBQ
SFkgd2l0aCANCm1hYy1hZGRyZXNzIHByb2dyYW1tZWQgaW4gUVNQSSBTRkRQIHZlbmRvciBhcmVh
IHRvIGNvbnZleSB0aGUgY2hhbmdlcyANCmJldHRlci0gU0FNQTVEMjcgV0xTT00xDQoNClsxXSAt
LT4gDQpodHRwczovL2dpdGh1Yi5jb20vbGludXg0bWljcm9jaGlwL2R0LW92ZXJsYXktbWNocC9i
bG9iL21hc3Rlci9zYW1hNWQyOV9jdXJpb3NpdHkvc2FtYTVkMjlfY3VyaW9zaXR5X2tzejgwOTEu
ZHRzbw0KDQo+IA0KPj4+IEFuZCBhcmUgdGhlcmUgb3JkZXJpbmcgaXNzdWVzPyBCb2FyZHMgdXNl
ZCB0byB1c2UgdGhlIE1BQyBhZGRyZXNzIGZyb20NCj4+PiBzb21ld2hlcmUgZWxzZSBub3cgc3Rh
cnQgdXNpbmcgdGhpcyBhZGRyZXNzLCBjYXVzaW5nIGEgY2hhbmdlIGluDQo+Pj4gYmVoYXZpb3Vy
LiBJIHdvdWxkIGV4cGVjdCBzb21ld2hlcmUgYSBjb21tZW50IHRoYXQgdGhpcyBNQUMgYWRkcmVz
cw0KPj4+IHdpbGwgYmUgdXNlZCBsYXN0LCBhZnRlciBhbGwgb3RoZXIgb3B0aW9ucyBoYXZlIGJl
ZW4gdHJpZWQsIGluIG9yZGVyDQo+Pj4gdG8gYXZvaWQgcmVncmVzc2lvbnMuDQo+Pj4NCj4+IFRo
ZSBvcmRlciBvZiBzZWFyY2ggaXMgZG9jdW1lbnRlZCBpbiBvZl9nZXRfbWFjX2FkZHJlc3MoKSBp
bg0KPj4gbmV0L2NvcmUvb2ZfbmV0LmMgZmlsZQ0KPj4NCj4+IFRoZSBkcml2ZXIgYXR0ZW1wdHMg
dG8gcmV0cmlldmUgdGhlIE1BQyBhZGRyZXNzIHRocm91Z2ggYSBoaWVyYXJjaGljYWwNCj4+IGFw
cHJvYWNoOiBmaXJzdCBjaGVja2luZyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzLCB0aGVuIGV4cGxv
cmluZyBOVk1FTQ0KPj4gY2VsbHMsIGZvbGxvd2VkIGJ5IHRoZSBVLUJvb3QgJ2V0aGFkZHInIGVu
dmlyb25tZW50IHZhcmlhYmxlLiBJZiBubw0KPj4gdmFsaWQgTUFDIGFkZHJlc3MgaXMgZm91bmQg
dGhyb3VnaCB0aGVzZSBtZXRob2RzLCB0aGUgZHJpdmVyIHdpbGwNCj4+IGdlbmVyYXRlIGEgcmFu
ZG9tIGJ1dCB2YWxpZCBNQUMgYWRkcmVzcyBhcyBhIGZpbmFsIGZhbGxiYWNrIG1lY2hhbmlzbS4N
Cj4gDQo+IFRoaXMgaXMgbm90IHF1aXRlIGNvcnJlY3QuIG1hY2IgZmlyc3QgdXNlcw0KPiBvZl9n
ZXRfZXRoZGV2X2FkZHJlc3MoKS0+b2ZfZ2V0X21hY19hZGRyZXNzKCkgd2hpY2ggbG9va3MgZm9y
IERUDQo+IHByb3BlcnRpZXM6DQo+IA0KPiAgICAgICAgICByZXQgPSBvZl9nZXRfbWFjX2FkZHIo
bnAsICJtYWMtYWRkcmVzcyIsIGFkZHIpOw0KPiAgICAgICAgICBpZiAoIXJldCkNCj4gICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+ICAgICAgICAgIHJldCA9IG9mX2dldF9tYWNfYWRk
cihucCwgImxvY2FsLW1hYy1hZGRyZXNzIiwgYWRkcik7DQo+ICAgICAgICAgIGlmICghcmV0KQ0K
PiAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiANCj4gICAgICAgICAgcmV0ID0gb2ZfZ2V0
X21hY19hZGRyKG5wLCAiYWRkcmVzcyIsIGFkZHIpOw0KPiAgICAgICAgICBpZiAoIXJldCkNCj4g
ICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IEFuZCB0aGVuIGl0IGxvb2tzIGluIG52
cmFtLg0KPiANCj4gICAgICAgICAgcmV0dXJuIG9mX2dldF9tYWNfYWRkcmVzc19udm1lbShucCwg
YWRkcik7DQo+IA0KPiBJZiB0aGV5IGFsbCBmYWlsLCBpdCB1c2VzIG1hY2JfZ2V0X2h3YWRkcigp
IHdoaWNoIGxvb2tzIGluIDQgZGlmZmVyZW50DQo+IGxvY2F0aW9ucyB3aXRoaW4gdGhlIG1hY2Ig
cmVnaXN0ZXIgc2V0Lg0KPiANCj4gVGhlbiBsYXN0bHkgaXQgdXNlcyBhIHJhbmRvbSBNQUMgYWRk
cmVzcy4NCj4gDQo+IFNvIHdpdGggeW91ciBwcm9wb3NlZCBjaGFuZ2UsIGFueWJvZHkgdXNpbmcg
dGhlIGN1cmlvc2l0eSBib2FyZCBhbmQNCj4gdGhpcyBsYXN0IG1lY2hhbmlzbSB0byBzZXQgdGhl
IE1BQyBhZGRyZXNzIHNlZXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3VyLA0KPiBpdCB3aWxsIHN0YXJ0
IHVzaW5nIG52cmFtIGluc3RlYWQuIFlvdSBzaG91bGQgYXQgbGVhc3QgZG9jdW1lbnQgdGhpcywN
Cj4gYW5kIGlmIHBvc3NpYmxlLCBhcmd1ZSB0aGF0IG5vYm9keSBpcyB1c2luZyB0aGlzIGxhc3Qg
bWVjaGFuaXNtDQo+IGJlY2F1c2UgLi4uLg0KDQpSZXRyaWV2aW5nIE1BQyBBZGRyZXNzIGZyb20g
TlZSQU0gaXMgcHJhY3RpY2VkIGluIHNhbWE3ZzVlayBidXQgd2l0aCANCkVFUFJPTSBtZW1vcnkN
CkZvciB0aGUgbmV4dCB2ZXJzaW9uLCBJIHdpbGwgYWRkIGEgbm90ZSBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UgZXhwbGFpbmluZyANCnRoZSBoaWVyYXJjaGljYWwgb3JkZXIgYW5kIHRoZSBwb3NzaWJp
bGl0aWVzIG9mIGhpdHRpbmcgDQpvZl9nZXRfbWFjX2FkZHJlc3NfbnZtZW0oKQ0KDQo+IA0KPiAg
ICAgICAgICBBbmRyZXcNCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0u
DQoNCg==
