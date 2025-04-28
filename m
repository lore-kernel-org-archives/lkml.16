Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C7E26A091
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847732; cv=fail; b=DPR41k+9JAnBYOSDjv1vcN2GlJ8998HMRWsyJDaeysrBc/AMmdNVkP5bQFkpQsp438b2HTbcqkMIgQd0gKHR2So7lQ/+9+cECt5/UWhRKOM9C6F147Nn4FMXKs80XqH+inYou3NRyxkmRnYrrJyf+Q6K9jKotJTf+h9UayQnTJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847732; c=relaxed/simple;
	bh=8dHzVZNOAnEqYk70HOKjuGHGGCZfijIZYy0wrXsqbZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mDqFChSd65mq6cq63IdnepJngFFK47nSZ72sGLEEaDBc0MKKkqvmyaGRiJ6A4h0WYROffD/j7ZjnD3wLZyoEAPDqIsGbjfjIjr/d4eiXDDJd3dUprW1XyP3G+/MAyImeStJMSisvFcHqcgdHh6JOknQ5T9+jbG++QD5JaS/WPQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JiMummvU; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JiMummvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGi0aGdbZeRax5hNUtAyZMbEIYozIDk3NlYpGNEVqsG+a9KhxtKJCH1qi7QyOkzK/S2OfIi4qzqkiPrw5LQ4Gw09Lq3DmN6gyFiJB3OZOR2QTW369fFCrnMxDwJWJCuCYBZ2MV/YWFJfh4G8XJAxhIx2LBHSxto1rVicnQKG3YkQxjGzGScI5TnJWgp0KJNzMncS0fez6qJ5dsoGmpCP7OIqYVtDLYbjUsBtCHUabNHfbU1YZ9bh0KizCLgDbEG1NwGs6O+iMLI9S/OOK2JthmFIBH5sWxkVmhgA0QAbEyb1Md6gUC6PSspwm+fc2+ik92xZJsfB/R2iHuy+ugvtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dHzVZNOAnEqYk70HOKjuGHGGCZfijIZYy0wrXsqbZ4=;
 b=vVWapTrco3FxIqzryqSpsBMwLgVhAY3U4GWRb0oaq75YfrCWhPFTkrpmC8/2r8V48xP0fi5tdixFSEzSVlhHAwePn1eAlaQfiFRNPlNv3IYICcS/9mXIvsrY/FPSq0eQUTm/48WjPCkmJGbJdZxtuKTQok21kBOPFA3pvsEXyQnOY4LMQ5djmI2rgPoKAPihQuXqdzh41heQ3IOhZyNfn9UNdY+Q6y64vPwuonUvE1CaY9pgG3UDDg6PrKVYwMJWylPBpTnYj3VbKzC8ihnevdgzXHmSgniA6oWm+itwkkdIBR9wSUxMePkO36oLayyoGmKCrFOtW4suM47eHXelEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dHzVZNOAnEqYk70HOKjuGHGGCZfijIZYy0wrXsqbZ4=;
 b=JiMummvUl6HToMgd0j03/FQIGLgMuvY7prDSCLzgEUr/IPXJOU4VkBOW3i3ern+0HZ8cbs2WZnpNvRLkkqeP8aaRa4li70S7qmu3yCN57LwZgxR+RGBzSG9nPSL11LfSgOz3L6ORfMX0UN+jp1fHBB0CGxPW79wqzieD0g8Qmdg=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:42:08 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 13:42:08 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 04/16] x86/bugs: Restructure RFDS mitigation
Thread-Topic: [PATCH v5 04/16] x86/bugs: Restructure RFDS mitigation
Thread-Index: AQHbt4Y9O3MONZVFRE27iTex+lD18rO5F5Jw
Date: Mon, 28 Apr 2025 13:42:08 +0000
Message-ID:
 <LV3PR12MB926504F7792CC53B00F15BFA94812@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-5-david.kaplan@amd.com>
 <20250427150903.GAaA5Ij3L6IHenvlMF@renoirsky.local>
In-Reply-To: <20250427150903.GAaA5Ij3L6IHenvlMF@renoirsky.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6b077045-bc92-473e-89df-a9846d4ea11f;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-28T13:41:57Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|IA1PR12MB6627:EE_
x-ms-office365-filtering-correlation-id: 5d8cf54b-61ee-44c0-170c-08dd865a7860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUhIZEcxckpCMHN4K0FQbk1uWmwwbHBkWjBiWGZQUldQVHZTQWIwbWFKN2J0?=
 =?utf-8?B?VThZaFFiTDFKSEF4ejNoejlSaUhpNi9keFg4bzlVbmo5N21BQk01TXpwRUdk?=
 =?utf-8?B?dVgycjZ3Uk5DN0J1bEJNWHJMdGpOR2xCQ0JEVUZBZ3dRVVh2aEQ4N1NJY21h?=
 =?utf-8?B?MTZibi9ZSys5VTUxbTNTZUNGMlZ6V1FRZjhnTi9sSVVJT2dvdmI3SENubHF5?=
 =?utf-8?B?ZHE2cWY2OWdqUVByVlJvSlFrdjN6bExuUUoxcUJxSkRpMWRtdk4zK21pYXht?=
 =?utf-8?B?UVNXM3RzRXVMQXVPbzZpWUlsL0RBVFNBYTFkcUxkSjFLanRVYmJDS2hxdGhv?=
 =?utf-8?B?RVdmZUFaTHJ2V1hiL1pCbFc0aU5EQ1hFWmZlWDVhRVlOSVppcUdXUnFGdkdK?=
 =?utf-8?B?OE40RFYxRlJRbDYvSWxiNXVzd1pKcjF1Tk1UMWFkbjVoZi92bGUvYlFNNUEw?=
 =?utf-8?B?RWFrMkhycGpmMjYvYm5vZTZaUmdHTUhvL2E5eUp3OUdxVTJzNUFZb2ZJOG8w?=
 =?utf-8?B?M2ZJQ1ByQ2tQRUlqWjhLdWl0M21nR1RHVW95NDRiSE1uQzZqdlV6VXp6MWE4?=
 =?utf-8?B?VldVRmRJUHllK1BJbmtITGVqQjZmR0EyWFowZFpDZ2dJMGhhcHYzenl4K1NS?=
 =?utf-8?B?ck9WMGc0WnZwQlNDTGE3ekdSbGpGQWNkZ2dlMS94RFNrMGJta3dsYkdVdWxh?=
 =?utf-8?B?YndyU1RSQ0NKdW9BeWZLOEpoaTRyRFVSMTcyZWFoS095YzgxTUZLdysxU2tk?=
 =?utf-8?B?cCtTcHAyUWkvOXQzWGNaeitIWnlHZGlqZWhuVlprK0F5MldBNElQVG80Zm9q?=
 =?utf-8?B?Sk5xN3FVYkIweXFjMWdnbm9wRXhmcFY3WUNyRlNzdWlvMkllRjd5c0VJVEh1?=
 =?utf-8?B?eVNyQk1rZkEyaURCOURDNWlRTm5IYmxBdTd0YmZQemlHTk9Hb2JucmZTaXVj?=
 =?utf-8?B?Und5SDJBanoxdS80TmR2dGtUL1UxNHV6WVV4NlpiNFlWdElMVFpNckh6VUVx?=
 =?utf-8?B?ekRnNlZFK3RCR3BNWkM1eGUzVWd2U0Irb0tjQXhEY1RnZmlYNS9La0NtNFRX?=
 =?utf-8?B?OTNNWjR5d1cyazRvTWhrR0hXYTRpUGpVUEJudTFZMk1lRjI0RStnc1RDajlk?=
 =?utf-8?B?aEVLUlpGMFpxN3JYTFdldFF5RFhsUHlQOG5XUGRjU2ZRNW0wRFE2bWdVRzhZ?=
 =?utf-8?B?TUxrb29wdXVqajJRTTlCZldBSWlvdVFETFZQSEl4MHNxbTF5UnVzNTVMamZW?=
 =?utf-8?B?OVRab0JVSTE3UFV3M2N4c2FlZi9SNGc2dXBzNVc2c2o0MWFwaU5KdWxUZXpl?=
 =?utf-8?B?Ykc4Y09LR05NZzZRZEVWbUswMFI5SGFFTllycFRtRTUzMEJZRnFSazcvS29D?=
 =?utf-8?B?YUUyMGVWYWdkMFQ3R1FCQmlaOVRFa2JFa3kyTzlwRWpuVGpsRUloeXhDazhS?=
 =?utf-8?B?TWgwZUx5L0tpVkNiTkNBZHFNaGgxMkkvckNsVVJlZFFEL1NYOEkwekRZemlL?=
 =?utf-8?B?cWNaeko1V3d2azRrb3FjR0hPREVCQkRUbWJNRUNaM3VZWVJzbVYxL28yVHAx?=
 =?utf-8?B?ZWt0MWN5YWw4LzhvVWdKS0w5RDFrellWU0U1MkhzbXRRRyt1ck1sR0ZmOTNp?=
 =?utf-8?B?blZ1ZnZVU3FnNG83OGlaZ0E1NS9GVTdMelZjQXduU0JmdFdyZHJpOU50ZmFx?=
 =?utf-8?B?ai9VNXBjNzArdERjdklGSjdkZ0F1TGkrcnQ1TDRmTXh5WHFJZnQ5dlNZL2JW?=
 =?utf-8?B?MGJYa0J0Y0ZtWkVVdzU3enVES2ZsaGdGNXAvT0Nab0FYNm1TM0ttSThFTXJG?=
 =?utf-8?B?KzNyNUFSQUloL0sxa1RENEJKZ1F0Y3FpTm1wTG14WnlRelBuN3A4czdRczN3?=
 =?utf-8?B?cmRFZU4weXlUM3lnVmJyMGVFQTV1U29YQUJBTTJVYXl4UEs3TUhhbGFXNktr?=
 =?utf-8?B?WlJLald4Z2YvYUQxMVFNdkFUTWZWZ2hFMGJ6VEJaTCtkWVI3OEppQzVNcEZw?=
 =?utf-8?Q?ax1BZFX+fHPuySCYxeix9cqLIAXwvw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHV5c2wxaEdBb2w4d1JaYk5SWkJ1aUJDL21UckJBUDBQcUdGR2tnbGF6VkxF?=
 =?utf-8?B?R2NSZCs3aWNHeW1WUVF5UGJWaForQ2piWmVOcExDYUNNRnAxRURDbHZuUXdZ?=
 =?utf-8?B?SVhJK1YxNFY4NzRWRkZaS0p5akZhVlNHSlU1SktDSW10b3RDam1hbXVYV0pH?=
 =?utf-8?B?ZFUxeVpmdXdkS3hKM2ZwUmh1SHVTYlFybDBETzhYSEdZdmJid3ZOUXdXaHg4?=
 =?utf-8?B?NE8wWjU2djFoZWlsUDVXdW9IczVpWW9QeWhBVlJlZEEzU1VUa0YwVFNXYnFS?=
 =?utf-8?B?elU2SktsQWl6ajRkOG5PeURCNUN0dm8vSWJTWGZEUjdHZVpCYlNKYld2dERn?=
 =?utf-8?B?dHliSDIvNUQrQ0RrQ0w3SWd0dDdRM0NqS0xHcmRONU9QQ0tzanN0V0FhdXB0?=
 =?utf-8?B?V1AwSXROWWJicWxlZTdCcGJTZlljdDY0ZHVMbUlXbVdKcythdzJCdmZZUXRq?=
 =?utf-8?B?aEhlb2kyVGF5YngrMWRKeUpVdTZ2TTl1eUhVZE1MTHFXZ2t6VDJnRU9EU09H?=
 =?utf-8?B?QjM3UUkrNTFaYWsyNjdyZUErTFFFUzdWZjYxczlaRS9tRkdpOEtteVZaMG50?=
 =?utf-8?B?bkxmNnR0a3Y3aGhhRy9LMGExRVBKVTF2d3Jtakh3a0pjMWhyNmsrZmdoV1Nx?=
 =?utf-8?B?WStqSFA3cWY2eFJRK2RCU01oNTdVZTU1UVVyQndPVEdjbGtHL2xOOGVFZUtS?=
 =?utf-8?B?cFlSMStoWWZ0UkV3WHFPNTV2T1dWWjFNWVR2NVJWRHVXQ0JtTXpWT2RIMGJZ?=
 =?utf-8?B?NzdMRWFBT2ZHT2Ryc1F6OURJc05ja1FnbDNnKzczY2FoY1NOLzRvSlNDMTA0?=
 =?utf-8?B?SStORGF5aks2VFYzbnBuZk4rQWpPOUVramhkWHFkTlE0Tk9zeU95L0tWeVR5?=
 =?utf-8?B?VjFtVnhuRTZiVHJGZjNCRnJ5Wis5SG9sTEZpY1Y1VlJsNW8yQzBsTWN3RlE2?=
 =?utf-8?B?T3oyR3BhN1h3VE9XSmFvU0FmL2xSUVhUUjVCRzFRbGQ4aVg5a3IyS0ZKc1B3?=
 =?utf-8?B?TkJHMW5Gd001UjBkNlgxaStNZlRJVmMxdlV2eXdHeDhoODRiVmdCVjlZS0Y4?=
 =?utf-8?B?SVY5VDIxNmdnbWxQNWF5OHFQMmpyNzExWHgrNHllRTFwa3g3bDJ5aVhldnJV?=
 =?utf-8?B?UVpSSHo5d2dXUzJIZHpNSDVueklvR2pBY1B6elIzQzJ1TTZRZ3p2QlkrdzlQ?=
 =?utf-8?B?YUc5T0JsMFJNN0VRUTlDSy9LU1UzMlhicHorWlUxSy80aEVVMjR5dndlRHlx?=
 =?utf-8?B?MkJCVzR6K3pYdXJmREFnTEUzdnIyNTVFS1AzcXpGekxHVHhyVlExVGJJUWJ5?=
 =?utf-8?B?N29POWttb0MvNDl2SGIzRHljUGRLb21rTE9zU3gzcGNld0JncU80Q1lNRFkw?=
 =?utf-8?B?ZHBGT0dka09jdnpZRGxTY20welNJRm9pVEhjVnFvR1hRUHRpQkhhTE9KV0Yr?=
 =?utf-8?B?d2pVMk95dm15VFdqSWZMSlhjbGlNRk1KeGRGUTlwc0x0NUI5WTJOSGlkemlx?=
 =?utf-8?B?RWJBaTdCcFY0ZXJlU25JT2dIUFN6WWkyVytOR1dFSXZSOFNkT1Q4SSt0NXVq?=
 =?utf-8?B?Qmx0SHFIMHI4V1NsM1dpTGsveSthZ1RpMUJqNnVwL3pKZFdacDZVUzBMYllP?=
 =?utf-8?B?ZURsVGhBc05YUlIyY1JESWk2ckQydmdvd1ZTUDVIdDdVQlc4NVRmMk9xL013?=
 =?utf-8?B?MDJDalhQS09uYndPdU5GQ0pPelZ1OHBuckVRelVITGVyN2xVTWRJQWVlNzVC?=
 =?utf-8?B?dDNaZ05tQ2FhazJLcFkzNHpJdEdGdGZweXNxQ1FlY1Fpamp0QWhIaGlnREE0?=
 =?utf-8?B?TWdWQXoxUUV5WkhjRXRIc1BYczNraEcwNWxmK2wvK1VDWkV0OTgvL2lFS3pB?=
 =?utf-8?B?MlRCWmN2aUZjZEJpOU9Lb1VnYzVOMjFoWjYwTldBb0JWdGprYzRPandFN2Zs?=
 =?utf-8?B?b0hNdS9oWFhnZ2Rpd1JaMWh2d2dPc1hMdzRVaGFvaUFiM2poRU8rT083UzVv?=
 =?utf-8?B?Q21PZTloTmVaQ0oveDRDdENpTWM5NlByOWp6WXdtMW11Ujl5bFB6OWxUR1Ex?=
 =?utf-8?B?aWJqOXI5cTQ0SGNzL2VPb2QrS0NENFpVVDJmbFczem5aajlMWERQTThVb2xi?=
 =?utf-8?Q?LmO0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8cf54b-61ee-44c0-170c-08dd865a7860
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 13:42:08.1082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IC31q+Nlzho0Bo3NP8jg7pqPF37UOKOp0PJe3blKIhlmBSR+tDDYUIaaC2WQJ6qV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogU3VuZGF5LCBBcHJpbCAyNywgMjAyNSAxMDowOSBBTQ0K
PiBUbzogS2FwbGFuLCBEYXZpZCA8RGF2aWQuS2FwbGFuQGFtZC5jb20+DQo+IENjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT47IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz47DQo+IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3
YW4gR3VwdGENCj4gPHBhd2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9s
bmFyIDxtaW5nb0ByZWRoYXQuY29tPjsgRGF2ZQ0KPiBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4
LmludGVsLmNvbT47IHg4NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRv
ci5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMDQvMTZdIHg4Ni9idWdzOiBSZXN0cnVjdHVyZSBSRkRTIG1pdGlnYXRpb24NCj4NCj4g
Q2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2Uu
IFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5n
IGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBGcmksIEFwciAxOCwgMjAyNSBhdCAx
MToxNzowOUFNIC0wNTAwLCBEYXZpZCBLYXBsYW4gd3JvdGU6DQo+ID4gK3N0YXRpYyBib29sIF9f
aW5pdCByZmRzX2hhc191Y29kZSh2b2lkKSB7DQo+ID4gKyAgICAgcmV0dXJuICh4ODZfYXJjaF9j
YXBfbXNyICYgQVJDSF9DQVBfUkZEU19DTEVBUik7IH0NCj4NCj4gTWlnaHQgYXMgd2VsbCBjYWxs
IGl0IHdoYXQgdGhlIGJpdCBtZWFucyBhbmQgdGhlbiB0aGUgY29kZSByZWFkcyBhIGJpdCBiZXR0
ZXI6DQo+DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYyBiL2FyY2gv
eDg2L2tlcm5lbC9jcHUvYnVncy5jIGluZGV4DQo+IGU2NjhjY2NjZDhjNy4uMjcwNTEwNWQ5YTVl
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYw0KPiArKysgYi9hcmNo
L3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYw0KPiBAQCAtNjMwLDcgKzYzMCw3IEBAIHN0YXRpYyBjb25z
dCBjaGFyICogY29uc3QgcmZkc19zdHJpbmdzW10gPSB7DQo+ICAgICAgICAgW1JGRFNfTUlUSUdB
VElPTl9VQ09ERV9ORUVERURdICAgICAgICAgID0gIlZ1bG5lcmFibGU6IE5vIG1pY3JvY29kZSIs
DQo+ICB9Ow0KPg0KPiAtc3RhdGljIGJvb2wgX19pbml0IHJmZHNfaGFzX3Vjb2RlKHZvaWQpDQo+
ICtzdGF0aWMgaW5saW5lIGJvb2wgX19pbml0IHZlcndfY2xlYXJzX2NwdV9yZWdfZmlsZSh2b2lk
KQ0KPiAgew0KPiAgICAgICAgIHJldHVybiAoeDg2X2FyY2hfY2FwX21zciAmIEFSQ0hfQ0FQX1JG
RFNfQ0xFQVIpOyAgfSBAQCAtNjQ4LDcNCj4gKzY0OCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBy
ZmRzX3NlbGVjdF9taXRpZ2F0aW9uKHZvaWQpDQo+ICAgICAgICAgaWYgKHJmZHNfbWl0aWdhdGlv
biA9PSBSRkRTX01JVElHQVRJT05fT0ZGKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPg0K
PiAtICAgICAgIGlmIChyZmRzX2hhc191Y29kZSgpKQ0KPiArICAgICAgIGlmICh2ZXJ3X2NsZWFy
c19jcHVfcmVnX2ZpbGUoKSkNCj4gICAgICAgICAgICAgICAgIHZlcndfY2xlYXJfY3B1X2J1Zl9t
aXRpZ2F0aW9uX3NlbGVjdGVkID0gdHJ1ZTsgIH0NCj4NCj4gQEAgLTY2MSw3ICs2NjEsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgcmZkc191cGRhdGVfbWl0aWdhdGlvbih2b2lkKQ0KPiAgICAgICAg
ICAgICAgICAgcmZkc19taXRpZ2F0aW9uID0gUkZEU19NSVRJR0FUSU9OX1ZFUlc7DQo+DQo+ICAg
ICAgICAgaWYgKHJmZHNfbWl0aWdhdGlvbiA9PSBSRkRTX01JVElHQVRJT05fVkVSVykgew0KPiAt
ICAgICAgICAgICAgICAgaWYgKCFyZmRzX2hhc191Y29kZSgpKQ0KPiArICAgICAgICAgICAgICAg
aWYgKCF2ZXJ3X2NsZWFyc19jcHVfcmVnX2ZpbGUoKSkNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmZkc19taXRpZ2F0aW9uID0gUkZEU19NSVRJR0FUSU9OX1VDT0RFX05FRURFRDsNCj4gICAg
ICAgICB9DQo+DQo+DQoNCk1ha2VzIHNlbnNlIHRvIG1lLCB0aGFua3MuDQoNCi0tRGF2aWQgS2Fw
bGFuDQo=
