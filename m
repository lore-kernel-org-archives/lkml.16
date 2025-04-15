Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA2224B15;
	Tue, 15 Apr 2025 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742890; cv=fail; b=egQXPSpKbR8GeaNrSLeBlwfP08TOE2BYJumwuu38wuOm1l01rvj6kOn5BLtOztvwgfryKwGP8KQ5UcPjWv4LmTyla4W5U/6gEaubaQm3jbg2uBACgV6uvJvgvr52N+eF2slj+WldPy5Hm2US7uRamB4MKOTJ5g8Zxy/WVJdvdEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742890; c=relaxed/simple;
	bh=AEZKOW61PhkgwMisGR/fOBrfs7acDl69+sfmRQMupbc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ck17zEEYOxa6EnTniTIY76msKu3Ria4RRVJy0T90OmImzXRKDmeKG/GZ3hgIXPJGfNl9FVLrVDi6izwnaIBw64K3KWetbdTK1J7j0wEu9tMGVeOvGDmRU/iv5r52cJCUmZYXQZnyjvMvBtVuArC6v3uXhzZNt6NvYs/aV8/HELY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VBP1+Ppa; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VBP1+Ppa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR8J9aFJhhfFkSdN8at+1OPkAscwpgjYVDCIbilMaaWo80ie4ecD8MqMEMCu23vaL5WcYT5vPnOdeiWVHb07+VPuej+a3UX3seynExW53PFUbxrYoF1UGmzVfUcZEfTm8D1v+hAZDTlR4zKXrT0Cm4UkdKXZyqqC1VpL0qUJwjtfgZmjeWoSDHvaJKurjt4lKKX6FLwGIiuwzt9jNM+sq0SWN8rRtQ4yF0C93FwV6ZgRj8L/YWYuQ67Z8m+3Wk45eweQ9YFWiLvT+6B3JSu5q9lYcePdg+0EEa+4r8eR+3e0vpwEChy2j2yJvNX1OsqZh5PlJxO4xNJvalHIIPXMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAJ4tMZflX3x7pEjE8xVtmQup7vVHIRxBEoY5251W2Y=;
 b=LyO7c9ZK7Unx13QPhra4T+sQxuj7XfGAEWNSlelxW8XXoZ7RWDKeMD1027DsnEEpvoJ63umFDTch5UAn7swnmWU496fcacbWf1/l6bR1hLGT9QbSGWnWUX2lGqjaQeD41rUwJ+yIEhyVKesJV6/PEfMK5Fmg4iMoYtSm4zd924ySQf/I81bqr96fVwEFVmjvrwyk/2qeqAzsYQ8TlaydA9XAIzO5sNLocPSV4+aOtlQvXQgPhmMn6i88zITeIvBJyBs2rG45tk9JUQGPvrsn6lC82DmFKPcjaWKD0WExbVlcza+V3JzfKYo8iTX5Xxi+YdsdlQw+etKHyXc9cXB7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAJ4tMZflX3x7pEjE8xVtmQup7vVHIRxBEoY5251W2Y=;
 b=VBP1+PpaUbqaa/n5Tj1zT/QW0TUnGXjuibpdUYux+hTzjshhV+shU9a0/UEDJYUHIJhgFNO7A6dcm0U9cTxubDL8GFiQIiAvVYu8NdfuIOPsy7z4guP3lseXtPs9cNmBGlzViuP+cUjeApSAAbpI4RQp1BHEzPOK/jZmv+gj4oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 18:48:05 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 18:48:04 +0000
Message-ID: <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
Date: Tue, 15 Apr 2025 13:48:00 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
Content-Language: en-US
In-Reply-To: <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0062.namprd12.prod.outlook.com
 (2603:10b6:802:20::33) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 8422ac67-b866-4173-471c-08dd7c4e0de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFI2cDJJUlJFSVhTanM2VFJLOUdMWTZvUGd0VG8wMURubGhZK0NTWjdDK041?=
 =?utf-8?B?QjNNMXQyMDVFellneFZ4WjdJZ2hINWVESzlBd3dyUXFucnJvNUEvUmlmeHBj?=
 =?utf-8?B?U1ROZFkvNUpIWFdreGdBTmRMSW9yTXdIWXRmcUp3OWNZdzNTT0hnZ0d6VDIy?=
 =?utf-8?B?M0FDRkJMelVSRUw2VGpEUkpFQ2pnNlRoT3JWV1ViS3dNanlydDRHaEUxYk9a?=
 =?utf-8?B?eHJwYWZWQXVrSVVlV0Y1TjFhcHY0VHBXTVNYdzdzRHBBQllFdisrNTN5clMz?=
 =?utf-8?B?TmNIQ3lFeW9qYzRyc0o3dFArSmVyQWF2VjNSbGFSZzdpL2NkR0s5MGpyUlRB?=
 =?utf-8?B?NVVHQmlxd2ZON0Jub0NDQWJ0bTJYR2V5WmFwcTRCQW9GaWQwNjR4bVlmRWN4?=
 =?utf-8?B?QUVmb2hLbTUzekU0QVJlcmQ4MTBXMklvZ1JRSjNscUJGY0l2UTVVcDBUVThR?=
 =?utf-8?B?T2pkK1VwTjhkR05GL2cvTE03OFJLSThTeGp2TWFrejlYZjAyNkNOcFlwRk03?=
 =?utf-8?B?dGFMbk1ZYnZ2amk5cjQ3ay9QVjI4Y2Q2UTBhb2VmTkM0eVJsTG02cjhZMDg0?=
 =?utf-8?B?S29PQW9uSWxBNm5TRW5EZi84c1BYTk9MZ3RlenlUaStOa0ZWZUVNak9DaC9P?=
 =?utf-8?B?QWpNei9VVGNncTZIVTQ3THA0M0FFSUFLaVlxVm1KaXdGZitseSs5Z0hrK0g5?=
 =?utf-8?B?UlVhZlZhR2I2ZFZqK1habVFYUTYvYWhVRHZvVFNtRGxibm1xV3FPd2t3QVhp?=
 =?utf-8?B?TjluNWt2M2MrZ21NMUJ1M05hMDZZNlZYLy9KTVZaNDFIVC9uRTVLeml0WVlK?=
 =?utf-8?B?ZTlUeTdLV1dKN21ZVkhJSXJuWGFHTzIzbGYxZElkWUY4SGMyaFA4SzhXbm5h?=
 =?utf-8?B?eDJlczR0RVZaWlFBeVlCTjBrcHdKTGRVL1ZlY3NKRE5iNnNSa0h6V1FPTGwz?=
 =?utf-8?B?YnltQTg2eDJZckg5VzdjcVZxZ3hlb2RWOXJ2Qi9TNW9zVnJ6VE52cC8rVm9q?=
 =?utf-8?B?YmhNWmlTTGNadGoreWpjcExWN0YwTEoxNHQrcFNTcENkaW03WDFRUVNWU3BV?=
 =?utf-8?B?amhEM3VMbnNoNlBPbkRNd1NIbkNEa2pBbS9TcytWc2dVbDV3MFVlR3BCaUJk?=
 =?utf-8?B?R1dNWXZ0NmlSV0FtOUlrSG9kSHBiWFJGZmVUZmxIWi9scEcwbldCUDBMbkY1?=
 =?utf-8?B?cWtCYmVBZzZWbWROL05NdDFodEUwVTF6a1AvODNjbXh6N3VScHluQUFDUVRH?=
 =?utf-8?B?djhaUlVaODF6d0RPaUxNOXBaMXdoTk5ZMklPWmxHOCtHN3Evc1ljbGtoNHNv?=
 =?utf-8?B?eXRISSs0c3hYQlRZaWN0SkViL1A2S1hUUnN3eTVBZ2pzaEhqU2ZmbXorZHVT?=
 =?utf-8?B?ZStsTHp1dXNBSXJnOEJRVllkWmN6QVZ3VG1hV3NQeHZUZTgxdFpBR2drOS9t?=
 =?utf-8?B?VXRIRDFwUEsvdTNGdTZJUzZxckYyRnZuRkxDRXZFamhzSjUwMk9FWHlVdXBz?=
 =?utf-8?B?VUxvRlNRWi83YU9mM2t4eEgxZCtYTEc1eGlaMUpGdlh3WHJnN3hacS9tUm1s?=
 =?utf-8?B?d1FyZ1ZrUGVBQ1dVNks0bGdYdVlHOXUxV0U5UXE0NHMyQlNDZ3hYTXN1bTJv?=
 =?utf-8?B?SUwrSGVycTROZVdWU0wyR3E3Lzl4cEw2MTcvSmU1RSttTFVQVFFyMTN1YnF6?=
 =?utf-8?B?RVNXOE4wbGJLa3Rza2hQVDVZN3lVR1lLeWhsN1VzdkFycVhsQWJlUU9HWTNk?=
 =?utf-8?B?cmQreENONmZiNm1wcmhudkVZUDlrZTYzNkViL00vZGdMK3NMeHN6K1c1UzlL?=
 =?utf-8?B?SHdEd2dzUkdWQ0EwUURJVDYyTlMwc3BXNFpwZGwrbU94Mnc5REw3SjJaa3Q5?=
 =?utf-8?B?ZDhVZ3l2bEJlWjY3Sk5sakxpeHY4M3lPQmliV2RJWFFYYkQzYVMxQmdDRVlq?=
 =?utf-8?Q?AR7k4vElwwY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWgwN0pYU1BIYTE4OEE0dlNydjdHZndzSzUyb2lQVkxGc0VueGF6MEViQVUw?=
 =?utf-8?B?Rk9acXpnNWYzRkFWakJnU3BHemFtdnJyUk1RT1ZKeUJSaHM2NE9kWDRBbDNG?=
 =?utf-8?B?OFBGVm5ic25lbkg1eVpxOHRGQzFySEpTUWhlYjh1V3ZKMGZLb3FqNS9udXZU?=
 =?utf-8?B?dE1Ea1lmTGp0RjhqTVUrYnNENE50RVVnREg4eVN1STRpaFlJb29EMEpVSmlt?=
 =?utf-8?B?bWtGZjNlWjNRTXp0NzJnMXdVT2FmeGNtVk5kS292SG9MekhyRlJRRTdXdzFQ?=
 =?utf-8?B?d24rMDBTa3p5ZUNWallqdWZhN3F6NVFQQnlFbnQzQVRheVY5dnZrejZwUVQr?=
 =?utf-8?B?WlZuUDJzVjRTcHE0V2p4TE52QWFFME96QmZuSU1Id3FDbjdid3dOZC9Jc0xs?=
 =?utf-8?B?WHJEZ1UrTkcrbDJOREZRYjVOTVZ5OFErWkY3L2dxN0p5ZnJMd00rdm11SkFC?=
 =?utf-8?B?cVhwMENKS2lqcEp0UW9RbGFqRFlhdy9CN3FzRU9qZ2hQSzRhdzdvNk1vVWds?=
 =?utf-8?B?OWlGbUlqYkdLQlVJMndML2R3U3Y1ckc5NUhlOFBWQVRlZWs3WnYzaUp4clh3?=
 =?utf-8?B?OXB4bzFsalRxb1FId1UzM1c4SjhlUkhQUzJodGdLakhhT2diaGxaWlE4YXVs?=
 =?utf-8?B?OXVodDhkcEFreDZsZXUzcE9PWGEzWE9QTlcvb2VvRTk2VFh2ZDJXdUNDbTh4?=
 =?utf-8?B?M1ZDUHFEWGczcyttNC90dVV4aTUydG1aWlhldUNYclFLbHVZaXMyTzlhcnNK?=
 =?utf-8?B?MElreDloYW1GbmRSUUNRM0pCbytYS3RPdFB4RVB3Z1ltRG40bkV6d0N0UnZU?=
 =?utf-8?B?QmlxcGV3dUNrU0FUT25INE5NbEZiZ1B3NW0ybHNOb0laUHNsRnVoaExjM2Nl?=
 =?utf-8?B?M1dIYk4zSkZxQ05CTXpFOVlOaVNleG54S2VBc3k4czdja2trWkRuc2RFRGFv?=
 =?utf-8?B?TWhDakx6c2hnNklWcndmUWdrRHBrS3U2ZUhQZkhsMG83YnpBSXZtcUx2bW5X?=
 =?utf-8?B?MEpaWUNsZHBFb0F5RU1JbVV1SFVlQ2JKTHkwRGhJcnZXS2FEeU9KYTFwNEpT?=
 =?utf-8?B?TU9Lem8zUm8vS3NhdVVNdjRCbjUrNVo0M05uVXZVRy9aRVFhVENZaUpUYkdm?=
 =?utf-8?B?K2FuSEVBZXhqRGIyc2Zqd2Vma0NUNmQrZFZCTVV6TStiaU9UYUhDd2xSbEN5?=
 =?utf-8?B?YUhFUjBha0c4Tmhpak1raDA4SStXdnY5d3MxZ08xRFBSdXl5dVo1UFNyOWZk?=
 =?utf-8?B?T0xBQjhheXpKMGYzNWJpUlRaeHFCcTU3dEtXcnBMcUcrcFR2a3BQSnB5T2h5?=
 =?utf-8?B?TEhYMk1QN1NkNWtYTURYdS9MQnBIcWREMml2ejdhQ0piaVZ3TC8xZDFkcERF?=
 =?utf-8?B?TkxMU0h4U1BZaWJUbzV6T1NmMHpqdXhCcVpFcEIzMjhSM2xsYXZUOTNNckc4?=
 =?utf-8?B?QVE5VXhWVC9jSXlKSkZsTkZuci9kL1hCYXEvMnJXNllYUnFZZnRrejdZd0g5?=
 =?utf-8?B?RGtqQXZFYTVCeTc4Q3U4N0VsREowTzhPQUw2YlZGQ1hUY294OUNhNE5oaGRF?=
 =?utf-8?B?cUpXY2JHWUhEM05nUXpKTzhmOHAyQlp4dStnOW0xcEd3UXlydEtZQlhvQUdr?=
 =?utf-8?B?L1lxOGo5aXdWbmNUNVRvdi9raVJwQnUrQUgzSDQvNHROTGNsYUFvWTA1WDFo?=
 =?utf-8?B?N3pURXY5Z0VPQ0F0VFFoM3B0MkUxYmZ2bE9VQkVKUnB4dDFEbGhKSTNoLzJC?=
 =?utf-8?B?bUdvSVNCOWw4ejl6UHdqcWFaSTVlLzFyWmdLS29seDNVZHdQR3k2WnF6VXFQ?=
 =?utf-8?B?bkZZSHNPOGlDZm56RTAyR1ZXUEdsWEIvNDJ2UDREV0xvN3QzR2YyNXlteElm?=
 =?utf-8?B?RHRtM1JQcHgvb1JtWEpxSURhbCsxZ29EUmxLNjdsRS9rd0FBOXJvZGZ5VTdq?=
 =?utf-8?B?dkJvQWg3RktJd0lkMVJVM3VKRzlwbVZvYlRKZEpCL3YyN1RBMHhqRWVuSGVC?=
 =?utf-8?B?eVpSbElZTmhUN0VOeUVqUEF2b0NzOVA0WU1JWFR6TkIzODBmdmtXYVAwb29R?=
 =?utf-8?B?ek1NQmszazNVYXZjZDRTWXpwTDVxYlVRclI1SWZiRGZUK3VyV0xaUnA3bXlU?=
 =?utf-8?Q?nEns=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8422ac67-b866-4173-471c-08dd7c4e0de3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:48:04.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVyL3EbGrYeyVsItn7lL/t9qdF3iTsJwU5VBbMU8BAETXNv9LjLoKA1SaJ0ygA4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738

Hi Reinette,

On 4/11/25 16:44, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>> and mbm_local_bytes. To maintain the same level of support, two default
>> MBM configurations are added. These configurations will initially be used
>> to set up the counters upon mounting, while users will have the option to
>> modify them as needed.
> 
> This jumps in quite fast by stating that MBM configurations are added but
> there is no definition of what an MBM configuration is.

How about this?


By default, each resctrl group supports two MBM events: mbm_total_bytes
and mbm_local_bytes. These represent total and local memory bandwidth
monitoring, respectively. Each event corresponds to a specific MBM
configuration. Use these default configurations to set up the counters
during mount. Allow users to modify the configurations as needed after
initialization.

Initialize resctrl MBM events with default configurations.

>> to set up the counters upon mounting, while users will have the option to
>> modify them as needed.

> 
>>
>> Event configuration values:
>> ========================================================
>>  Bits    Mnemonics       Description
>> ====   ========================================================
>>  6       VictimBW        Dirty Victims from all types of memory
>>  5       RmtSlowFill     Reads to slow memory in the non-local NUMA domain
>>  4       LclSlowFill     Reads to slow memory in the local NUMA domain
>>  3       RmtNTWr         Non-temporal writes to non-local NUMA domain
>>  2       LclNTWr         Non-temporal writes to local NUMA domain
>>  1       mtFill          Reads to memory in the non-local NUMA domain
>>  0       LclFill         Reads to memory in the local NUMA domain
>> ====    ========================================================
> 
> What is the purpose of the mnemonics?

I replace with full text on each of these.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: New patch to support event configurations via new counter_configs
>>      method.
>> ---
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 15 +++++++++++++++
>>  include/linux/resctrl_types.h          | 17 +++++++++++++++++
>>  2 files changed, 32 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index d84f47db4e43..aba23e2096db 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -57,6 +57,21 @@ static struct kernfs_node *kn_mongrp;
>>  /* Kernel fs node for "mon_data" directory under root */
>>  static struct kernfs_node *kn_mondata;
>>  
>> +struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
>> +	{"local_reads", 0x1},
>> +	{"remote_reads", 0x2},
>> +	{"local_non_temporal_writes", 0x4},
>> +	{"remote_non_temporal_writes", 0x8},
>> +	{"local_reads_slow_memory", 0x10},
>> +	{"remote_reads_slow_memory", 0x20},
>> +	{"dirty_victim_writes_all", 0x40},
>> +};
>> +
>> +struct mbm_assign_config mbm_assign_configs[NUM_MBM_ASSIGN_CONFIGS] = {
>> +	{"mbm_total_bytes", QOS_L3_MBM_TOTAL_EVENT_ID, 0x7f},
>> +	{"mbm_local_bytes", QOS_L3_MBM_LOCAL_EVENT_ID, 0x15},
>> +};
>> +
>>  /*
>>   * Used to store the max resource name width to display the schemata names in
>>   * a tabular format.
>> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
>> index f26450b3326b..3d98c7bdb459 100644
>> --- a/include/linux/resctrl_types.h
>> +++ b/include/linux/resctrl_types.h
> 
> Please read changelog of f16adbaf9272 ("x86/resctrl: Move resctrl types to a separate header")
> for a good explanation of what resctrl_types.h is used for.

Sure.

> 
>> @@ -31,6 +31,9 @@
>>  /* Max event bits supported */
>>  #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
>>  
>> +#define NUM_MBM_EVT_VALUES		7
>> +#define NUM_MBM_ASSIGN_CONFIGS		2
> 
> Please keep changes to internal header files unless required.

Will move these to internal header.

> 
>> +
>>  enum resctrl_res_level {
>>  	RDT_RESOURCE_L3,
>>  	RDT_RESOURCE_L2,
>> @@ -51,4 +54,18 @@ enum resctrl_event_id {
>>  	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
>>  };
>>  
>> +struct mbm_evt_value {
>> +	char	evt_name[32];
>> +	u32	evt_val;
>> +};
> 
> I cannot see how this belongs in resctrl_types.h.

Will move these to internal header.

> 
>> +
>> +/**
>> + * struct mbm_assign_config - Configuration values
> 
> Please include a run of scripts/kernel-doc in your patch preparation steps.

ok. Sure.

> 
> The description "Configuration values" is incredibly vague.

ok. Will add details.

> 
>> + */
>> +struct mbm_assign_config {
>> +	char			name[32];
>> +	enum resctrl_event_id	evtid;
>> +	u32			val;
>> +};
> 
> Why is this new struct needed? It looks to me like a duplicate of struct
> mon_evt with one member added. There is also already the evt_list as part
> of a monitor resource that the array introduced here seems to duplicate.

Yes. We can probably do that.

> 
> Could the event configuration be made a member of struct mon_evt instead?
> This exposes the need to integrate this better with BMEC support to make
> clear how existing "configurable" member should used and/or expanded.

Sure.

> 
> There seems more and more overlap with Tony's RMID work. Did you get a
> chance to look at that?

Looked little bit. Will have look bit closer again.

> 
>> +
>>  #endif /* __LINUX_RESCTRL_TYPES_H */
> 
> Reinette
> 

-- 
Thanks
Babu Moger
