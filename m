Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2102.outbound.protection.outlook.com [40.107.21.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2A1F4CA9;
	Mon,  5 May 2025 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438956; cv=fail; b=VNMcrav4bBZ6uuVRLxIMiUGJBl79nqW/qtLUyRGemnO0i8OVfysr7QSO7n43IAytKyczWMJ2iOW1CPuDfMAJbnZbh+y+t2nz9WI1JPqOIDNA1/uTuqQ/6DCLrC1WlrEk8FtsfgU9rIpdJodnwTuI91dwwTLQRFpIc9dHuv9HLcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438956; c=relaxed/simple;
	bh=i9eALNmdTqGbh20ZwCkt0IpGfHkWSiKaRFhJ2bZJbdM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CpVMT2OxQWzKBK1ONAf7uOsENgrWPQ2oAKulnGncEGvAfCCoNcLHmvDaiD+B+Z+OD9wlIMscmvX93HXUogV7a3ugA6dYvl8EMFDv5d5JRhR2wnxSazVZdirntT3bw4t8oVedBFi9KtK3YDuS1H+rys5a9sgBaRTZTngt4Xz8vvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=EAmzTJxy; arc=fail smtp.client-ip=40.107.21.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="EAmzTJxy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2j4qVa+TUHVQ2AQsEvHRVWj/KWYNxGsniI66lK2LB/9uaFxHgRC2AP1i+43XEv/a/HbzjIqb0SG3q1o63Xq6QBR9fU6ZNiObwIMSOe47HJIeGOtV4lxsa82WiRtibjKDqHliOZJbaOhiyM8fJn2fOpyY4VxZiwIjT2PQB9wdt5LyWjFQ1r5RgN8HmpEy7XkzUk52bp8TklH489U3Nxz8IIzDk+C4uAFCklEtlON2kqnLzwbfWmMa592vOmcO2EH2ksXVhcffakbTfdJ34jn/bJ3W/VMf2sksvOZXD3snufgKVb78EFih4tAMOOEU9mRwKxLpZapPk/pj9lH0p1+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntYqqEfTZAXNYdCVf6T49eiHV/uWEzBD9nyQj5zrmkc=;
 b=f51XyBuHClgvlqi8y1WVsszgodhEnlO4H3HJzvLjJ+ZkTrpb/6w6fqPkvD0Q7SiamnyqhW4nLEJZnwR58Qlt94KEzgyU+MkhFngISsAluXbmQuutvg+Wk63HByrVvjbCxteLdfu4YedxdalUv8W1raO2tp2nKvr8Bteoz8bWuruyXW/a+8Vclt4e4qo0LV5kgbKpAnD7SMJ3qrBd13uNU94ZBCZNA2WqdyoiPyUrc3JXHG6M4kqsbLzFGMSWtC3IkORf7EteuiLD2GakOHeq4ax2Ahc+xZbItWM3ij3/St3cCLX3BYuzrgb5XrS2AuouUfPwCK4nvrORcsNb7yXuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntYqqEfTZAXNYdCVf6T49eiHV/uWEzBD9nyQj5zrmkc=;
 b=EAmzTJxythzPXP//D+7NxRbs95QPMkos3g7EHkGTlutlV7C+cXMJktCMjsK8fMoaIskSHgixiRywuo740Xi0PrR09OpBs5+Rg1ueMEsax1a1TZFapaqssc18LMZ7YVfhOpCSXA55odKZF18sN4z+G7Ozhpw1ArtOcAkbYm4az9jF+v22WG02WgWM+43dfJGRKJumQXegeSPcvDTQhnd0tidEwqDtnsH8tUjnjinHmmwAzuCsaFOVyepCv0HJBmagPeiMbtVdMni57vSGWinBN5PvqcJfLS0C93q7P39sN+4o0AVcNrszzejzCkRt6/71/wklX2UA1X+4NNHZtLWBHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DBAP195MB0843.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:55:50 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 09:55:50 +0000
Message-ID: <50039c49-a6c5-4f29-a35a-53b9af117fd8@phytec.de>
Date: Mon, 5 May 2025 11:55:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Andrew Davis <afd@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-4-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502220325.3230653-4-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|DBAP195MB0843:EE_
X-MS-Office365-Filtering-Correlation-Id: 638fb787-86c3-4204-e305-08dd8bbb03d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTVacXphb1BTYUlwb2c5SjMvYXpkVHdiU3I0dGFnRDNsVG9BL2ZDalR0SHdU?=
 =?utf-8?B?QjFOVDZ3dVh5a2JaNDA2Ym5Oei9WL014dGdqelAvckd2TGVIdEs5aEs3bkhr?=
 =?utf-8?B?ZEVSdXpnaHp4c29EZnpHaEtZaHlZSlIwVGRDb1o4cmdOdVpVb3dwc2lGNnZQ?=
 =?utf-8?B?MGo2V3NVVVdkVnN0dmprM0NxV0MwR1d5ZFJXUjFzRk4xcmE2Vm51UkNnelBp?=
 =?utf-8?B?ZTNKNGl0UU1SK3MrSUp4NktQRjcyODBSYmlteWVieko1OGNpOUErMzJQUW4x?=
 =?utf-8?B?N3B1U3VMbHFBeEc0by9Uc2taQnlLYlFWSXk2ejRqSlhNSzNsNmY0WkUvQmpn?=
 =?utf-8?B?eFN2NklwcWJoM1FwTy9DQVZWcVkwR080dzRBUDNCdTFwZ2JiWVRqUWZBV0Y0?=
 =?utf-8?B?K2IyT0RvaW9FZXZtVUdvY0dCc0ZjUXd6MUxJYWhyVDhEWW1yb3lvMU0ydWNm?=
 =?utf-8?B?VkFUazhGaWJjZWFEcHlvMm5JOXZxN3NtdW5maUhXSWplU3p2WS9MdkVMbXFN?=
 =?utf-8?B?aUxNTVN0a2dNODF5U0hOR3VSVzlnWFI2VitobGZrZlk1M05TUHhPTExyUXFF?=
 =?utf-8?B?ZEdvMWZjQ2JBVG1uQ2kvcnNyMnkwSDdVUm9ydEhsY3UzYTlNWk9EbHpXU0dj?=
 =?utf-8?B?REgrSGlvMktmVXJ6YjlreGRtYzl6RTNGdlJ4d1JIVWY0bWd4VUtSdnZ0dVBR?=
 =?utf-8?B?cTJScldXalFPQTY4MjlVWndWdlh6bHo0MlRscHlPN1NMN1hVcENIcG1WWURZ?=
 =?utf-8?B?RDEycWJ2TzVlSGU4U2pCK0pabHNDSWxzeEhZbXo0T3ZDZWNnVkVVKzZENVZF?=
 =?utf-8?B?RWoxVTU2S2xVdHgxWDJ6bno1Q2xNdEdvajQwR0k0VnI4TUp4aGJLZzBVb3k5?=
 =?utf-8?B?TzhpejRZRlV6U0FzMFRDMmxRNHFvbnJCN0I5WEpiQWowdUZqaStENU9vK01n?=
 =?utf-8?B?ay9FUG93UnpkRThVb1JtbU51TzlhSm9wU0pWd0xoWmtodGJLSUEranRvSnZQ?=
 =?utf-8?B?eS9QZTBid25wdjRUaGRLSVp1RWZBRjJkVVk1VWxGbTNNaUpnM0lKNldvbzQ5?=
 =?utf-8?B?YjVzSjFXZ1lISkpFbktWcEtXZzc4SmNiMG5IdjM0emRJa1hyQXJIOEN4akt1?=
 =?utf-8?B?ekZUSWhOeEtVd2FaaFJ0dFdhbG80VkFrYXhmcTRsSUtNbVRvKzkzY0F6Znkz?=
 =?utf-8?B?MXdVYmxZZEZITmF4dFVyOHR4MWt5TzlwYkxNRjhmQ1poV0IvWE8ra0p4NnlF?=
 =?utf-8?B?UEtodG4xYVdibm5WL0hSM0J0eWNHY2pjTzFueU9pcTNXVTBxc1l5emh5emg4?=
 =?utf-8?B?czJHbUQrUGVnK3ZqUzZFR1dwSDlUZHRoNXRTMzM4L0ZHd3BjNkREeFFnVzJZ?=
 =?utf-8?B?NWR2TkNXNllRZlpleGVwQlROMTdOYyt6QnpnUmR5SzZxbzh4bUJqTE13NWNx?=
 =?utf-8?B?VGhIck1CeXhrN0V5eksyV1VhRFdndkhubWt2QmcxZ0NIRzVuc0FrejFHK3g0?=
 =?utf-8?B?bUdPdG9TSUdCQVdLV1FUUVQxcWVSZVRid1lWb2FuaVR3a2xINEE4dnllMW1o?=
 =?utf-8?B?T01SRGlNRTh3NVc4NjIzZnpHU3ZOY0krVm5NNFprRVlQby9acG5wQmh6OWIv?=
 =?utf-8?B?VmpvWkVtUS9sYlNWQXJyL2hkWTJvUXByZjJ5a05XRlVNSGI4TEZJaXM1b09i?=
 =?utf-8?B?VTVZR0dpY1p5QkhXQ2VKRyt0QTRYam5XVDFSS0xLZ0RMa2c0cUh0U3Y0U1J3?=
 =?utf-8?B?dEV5bHFsSzlJa2c0UDl3S25kZXZ4UTZCVktWOUhGMk5tU2pURUVENDI5a3Zh?=
 =?utf-8?B?OVJsYXhFMnV4R0NtV2FVSXA5UmF0bTB4Q0tYdElkSUZGemc5ZG0yQWVvaWRZ?=
 =?utf-8?B?ZWlNTFZKL0h2UCtRZjlMcWtrUUtGTS9IamlHK3FXSnhjbkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1FSGhNQ1owcGsxU1k5MUxVUnZ0R1BlQUFCVUdVdlhiUG1rQjBaaVlCSXcz?=
 =?utf-8?B?cTViNjdobkR1ZStIOFFxdmkrMndMeUw5VWdMRTRHUmJFL3NlRlI3RzdKbWh3?=
 =?utf-8?B?VDE0ZC9Ob0hNVko4WWFYamcvbUsxeTZRSUN1NFo0bnlnSDlVbUFaQ0ZKNVhU?=
 =?utf-8?B?VFFxRStLWlBJa2lmZzY1c1lrbzN5TWFXWEpNUnlRZUo3MFQ4VDJ6WVRsWUNN?=
 =?utf-8?B?M0JGM2IxbVBDdTlIYU91MU9raHNhZndDQldQbDJIZGt6ei9QN1FwZnZNOWxZ?=
 =?utf-8?B?TEZKK2RHWEdoSjJIbzBNdjNSOXlYbUgvMGZwMVNYNWUyODBRZkNYV0RFanBY?=
 =?utf-8?B?dmpJcHFRLzQyeEZJZHIveE1oZ3NzSVd4YkpDeWtmUVlQaFJFNTd1VFltbFB4?=
 =?utf-8?B?YjdZckQ1L3JIK1NaMTVaSExLMDI5MG1LM1BIRnNaUkoxWmhWVDNPTG5BUHJB?=
 =?utf-8?B?aUNBc0QxRVEwcTNua0dreDhldU5YWE5wVVhFQW03SjlPR1QyVzE2Q3NucHk4?=
 =?utf-8?B?VUlrSDZDSFBZWEtEUDNYSzJXeG1XN3dGRmJmMGVCQVZSeXRSU3FNSG5zNmkx?=
 =?utf-8?B?NGNJbjJhUFZHcjc3WC9ZWVJTVEptLzFRYXNuTkxrR1BHdGx0bG1PUzM1c0cr?=
 =?utf-8?B?VmNJSVpwRDdscjZpTmZBOXZkdEJxUlVOYUkvV0N3N3FiQmIyNlQwVlhXSGpa?=
 =?utf-8?B?aURWbnpYcHZsK2VKRDFRaTUwN2VlczJhN0NJYnJ0Nkw3VkxRYmV2Y250Rkds?=
 =?utf-8?B?bGlGdWVaVTMvT2g2dkVxYkpLMjg3akdrQjBtQXp3dXJ6OXh3NUxNNG82Y1E3?=
 =?utf-8?B?T1FkNmR6NkRlU2xUdStEWURGTkF4ZVJsLzBzSXNBNmxkelExRHhTU2JucGhV?=
 =?utf-8?B?Tm9DZm1qTG1TdHU3RkRjc2REdG1SYzhBQk5ZSUpJUGlPL1dxMkx4Z05HY1dJ?=
 =?utf-8?B?aTVJNzNRWFJhenFOeVllTU1hVi9FZCt4TmZWcVoxNnNyVWtBdlk2RjdPVUhj?=
 =?utf-8?B?OGJtZ3dDMDdERHhxU2J2RnZERXpsM1hLWERaVGMvNXl0WkR1VXRZTUtBeG5O?=
 =?utf-8?B?TEJrK3U4NjlQWWcrM2pnY0VvbVQvU3dNTW5yVUgrRGpOM3NabTl0QlgrRDBv?=
 =?utf-8?B?M0RCQ0lheVJkaEVwVG02QmhsdkFXb2FDOFhUdkgwRDB3ZmhPajVCcFVKUWtN?=
 =?utf-8?B?aklUUjcwdFpReU91RE9kMEVyVzdLR2VCTEJ4RDFHNjVKMmVDS3I0UlBkQUhL?=
 =?utf-8?B?SW9CUGZSR2Y2ZUdwM1kvSHQ0NU9lUlduMzVQbU13enM1di81cUp3YmNvZjA1?=
 =?utf-8?B?SFNVSzdiY2RJcmNoYkREaG9UVFVSY1dFUFRKaUpYeW8vUmVHOHYrdHAvZmlw?=
 =?utf-8?B?U09vM2t2Wk9pcFZHRmdDRyswWDdiUW1ZNFhBTTVsYnhOTjhvWnYzeE5iN0Fk?=
 =?utf-8?B?Y0UxbGxrSXZFaENOMmdXNUZ0RzdRTlJWWmhYejJkN1VhOW92VGJrVUpYN1dB?=
 =?utf-8?B?QUZnN3RmN3ltM09xVU5ZRnNjR2NRQ25uRzlyT0s4WjhyejdZaGxzSEZ3SDNm?=
 =?utf-8?B?aFpkVldDUFVXME5CSm9jQU1ZSTE4enB5bmNzSUQybGREdDZJMVdFUmFtTmMx?=
 =?utf-8?B?U2ppMU8yMGs4amdCZUN4V3Jxc3ZDNkJYZy9pYmRabENFMFhsSkVJc1N5SXg2?=
 =?utf-8?B?djZoUGpBWXkyWjl5OVhJdm5GYVNqZHdVVGpFMEtZTlJ1cW01TjNjckpFczcx?=
 =?utf-8?B?MGpJWjBpZU1ObjBHTTc2NmRvRk1PUU9SRHFGQ0RPTExsZTliRGJ1VlFHR3gy?=
 =?utf-8?B?Q1pDMnlBZDVOKzIxYkwvWFo4SmVKa3VzZUU2TE1TQ0podXJWNDFVSm8yMGpo?=
 =?utf-8?B?YWdkUmlHL2JoNldGZjFqcHBQc0Vxc0NuL3MxVlE4bHdmY3dRV3lPQnpzZ1lv?=
 =?utf-8?B?bzl5LzBWM2VUTzlZWkhsS1RrVEhrS013bWFDWlZkZWhTU1hXaDFmTnN3VjJY?=
 =?utf-8?B?OTBIUTMzZ3VMaEtmU3BuajhCWEpiR3B2MllZNVgyZTZHRk80QXNCZjZObGQ0?=
 =?utf-8?B?WnZBcVdhR3grbDlkMll2NTJaUzN0MEVSVDRsOFdVUWhRMHVYTXVUdC9CWk50?=
 =?utf-8?B?dHF4L0p2OGZkRVVUN25YOXh1S0JpMlhOS0N6NFNpdTV4bkVlWlcvb2xrK0tl?=
 =?utf-8?Q?wUbQDdSwhjdhrJRMZOlTyzD+yomZYqndANA1XOSGd2IM?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 638fb787-86c3-4204-e305-08dd8bbb03d6
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:55:49.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY+zSBQ8hEXgIaZzJaos5XtYqT/+27dsXrcykcSbXc34Oj/0cF2pwGqXwEWEWVRFdCt3AvA97jhbBnQQQ+3r9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB0843

Hi,

I'm unable to load the latest TI firmware 
(98efd20ec71f8c1c8f909d34ab656731) with this patch.

[    7.012889] remoteproc remoteproc1: 79000000.r5f is available
[    7.032640] remoteproc remoteproc1: powering up 79000000.r5f
[    7.038626] remoteproc remoteproc1: Booting fw image 
am62a-mcu-r5f0_0-fw, size 53140
[    7.057209] remoteproc remoteproc1: bad phdr da 0x79100000 mem 0x47ea0
[    7.064716] remoteproc remoteproc1: Failed to load program segments: -22

I figured out that the mcu sram node disappeared in v5. Apparently 
adding it back manually doesn't solve this problem. Any idea what's wrong?

- Daniel

On 5/3/25 00:03, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
>
> AM62A SoCs have a single R5F core in the MCU voltage domain.
> Add the R5FSS node with the child node for core0 in MCU voltage
> domain .dtsi file.
>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index 9ed9d703ff24..ee961ced7208 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
>   		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>   		status = "disabled";
>   	};
> +
> +	mcu_r5fss0: r5fss@79000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x79000000 0x00 0x79000000 0x8000>,
> +			 <0x79020000 0x00 0x79020000 0x8000>;
> +		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		mcu_r5fss0_core0: r5f@79000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x79000000 0x00008000>,
> +			      <0x79020000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			resets = <&k3_reset 9 1>;
> +			firmware-name = "am62a-mcu-r5f0_0-fw";
> +			ti,atcm-enable = <0>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <0>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <9>;
> +			ti,sci-proc-ids = <0x03 0xff>;
> +		};
> +	};
>   };
