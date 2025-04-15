Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E220AF9C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733454; cv=fail; b=URXL7+pBBDaygmVeWgsUHRhelwCxsHqWNjChNGkPdZD85sTRVPaAIEvZdfe2+ECY77OmIn3tl/GGznC0DH1NfxHcmU+LgabIWYVR0Y3NuVOloUF2bcIVzOyM4KMrLB77CzITk1qt2HArlEWs2eJFF6pl5qUnwDk5ab+bWWfUzPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733454; c=relaxed/simple;
	bh=TLYqSsrWLOBdh0kz9g9ivYtpvQsHS42GYluI+3jtRaY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o6oaKoOYxbSv68VVAO3ePTRCDBc7/hS6qKB+dQ+MgV5DTreGhjFBu30db5EQy6rlo6FFUWSypj7AbyhJouro1n7C3N6TokNkGV7FipuSS3Z+MDeW1wPffiCPTrbfx+H98aTIQc5GGxyPWixgpILPEWUnnLyyFer8Tl4+fsdIBjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2miToNKe; arc=fail smtp.client-ip=40.107.102.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2miToNKe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHu5npCwv/ZtMvDCn9+thbJHVUUC7pU60p2+ythBOvcv6X0W92mAQN9uO7ICChunQO9Ay+hG9mq7jOVrE8Je/AIP+qRr41mco0RxV7lNyrG0/O9iK+mb7+Niamv1KGGabS7QVbCYJLdyHZW5GvIM1zknSiWztfznVXLEZwFyFBGD2h4Jz7p27aHutr5eSJ4wHenR151+N85EBTp0rKsP/Q8oU9gZ1Vnja2F5Qybs3I0vcQz59NfhWigjxiE/EvaWD5H9KpfvUqdXOOVDHCRZx2iFogcxtrfpnLaz1Npr/Iy/RlIMZCEzHSEl8K9A2S6LvO3k8q0wG4cDsgmqkmoLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLYqSsrWLOBdh0kz9g9ivYtpvQsHS42GYluI+3jtRaY=;
 b=VWO64M9IgKatq203FCjl9tLnvSUG44SA1IJdCnQvgxe4pllj/bcRIPAmsivSi6PaUh8qAQFfVoutbjuQvu40FcY5Q5IjLt32gpTKBA7EWZsa/zEhQc6+5Umgcum7eUCxuLB8eI1wIzOanq90MLX0keJB1LvgYA82OW/4QdXxl1zqxw1gm2K4YAnUofRREb/KgS58cmOmb6Z1hL30dLVuxDSornmnx+sNXDHuYygYtnf6d1vBksDW2viSvBSCZkAZXUeASOgAX0en7BXzKG1bCKBbqwngshERdVWT1DUp/tChft+71O+qhbjTiVSGh+NoxfRBRtUS8cMu/KgZQRCkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLYqSsrWLOBdh0kz9g9ivYtpvQsHS42GYluI+3jtRaY=;
 b=2miToNKeVWEIRaLkYRJPHma08r91TXaEhTOeaLLv0ffW9lE1C+D/B3BjMokbOm8qhBVv2RW2xxaoi+3Jrv/X4jT7cfVsuwYT7/w20Ukihg5JbXoCDuYMcaReROxopmPHpVqXUWuG/lBUTPgoaEIwIfMzCue7OqVhMtGSOnwdJTg=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 16:10:49 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 16:10:49 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Topic: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Index: AQHbqkRxQb0hpP7F0ESPe2022Gd5BLOjr73ggAAr7ICAAP0KAIAACfWAgAAKIOA=
Date: Tue, 15 Apr 2025 16:10:49 +0000
Message-ID:
 <LV3PR12MB9265BA06BBDBFCEB868CFF0694B22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
 <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
 <wuryibff35vau3vvo5gj3d6fzvfedlhcnlyc5zlwlzvfdr2dro@lkwwglmgac7c>
In-Reply-To: <wuryibff35vau3vvo5gj3d6fzvfedlhcnlyc5zlwlzvfdr2dro@lkwwglmgac7c>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=34a155c8-a58f-4e8e-9a6c-25e49b9737c7;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-15T16:08:43Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|IA1PR12MB9029:EE_
x-ms-office365-filtering-correlation-id: 6d509857-78d1-40d2-3634-08dd7c381697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGg3SHlabkdOWWx6MXlibExFWDRweE9hakJUeWlaS0E5aG03YllOYnNyNm85?=
 =?utf-8?B?WTVNN1dtYjJULzVzbXZ0cHR1SHZyVkUyQWNybGVCZVFobTU1MU53WFdWeTMy?=
 =?utf-8?B?b2g2Mm91VzBtQWx0QjVoT3NDZ2NtMDZ1QzFFWUw4eHM2SStvK1ROWFYySVNm?=
 =?utf-8?B?cmpUQzF1enk5Nms3TGtDQk9RUTZKaXhNNi92cDZPK3U3VjV5QlBGSXBFRlNJ?=
 =?utf-8?B?Q2d1dEFiVXBweHFFSm5STTNYazU0d2xiNVI3OWRsTWJDM1NlSmlPS0ZzM0RH?=
 =?utf-8?B?N0FaNG1USU5sNjE1K2RXaE02OTdLUW0yOW9qU05BdWFOeW5SbUpLNlNrbEl1?=
 =?utf-8?B?TWQ2YkVxcHMzUmV5Q0ExNFp4OFVSdzdnQ0l6aTdQcXlqaXlpQTJhQnNnb0Zl?=
 =?utf-8?B?Q1ZsU2x2M2ZXR0kraHN4VGp5OFVDcnIxVzlwbHorL09vaEduaWxFU3h3a2lr?=
 =?utf-8?B?OUo2NlpEY2d1MHE0OUdDdGVZUVI5Z291T1VQbTVpa3hIWFB5MVFERVd0R0Uv?=
 =?utf-8?B?d1lTZlJZUXh2L1J6RUxtN2xoR2N1WW91VUFDVWp2Yzl2UHNwSlZlS2JIdysw?=
 =?utf-8?B?TzlSeVRraEtQYm8wbEE2WXFqbzgzUGQ3Ym9RRUFiNlhiWnVabzNnSThET1Ev?=
 =?utf-8?B?cXJhTzRWWUY4NE9PTjNxMmpBVVZDdGlKV25mcTN2SGNFZzBjZEIvZnVtb2c4?=
 =?utf-8?B?RVUxQU15ckJBUzdhdmNQTXU0QWNrcE9qaUVmaGpnSkJJOHBCSzVkRzNuV0tF?=
 =?utf-8?B?OFlyVzIvdHg1UTBFVHJsSmhGMGp4MFQvOXdkcW1sNUhxdmZYRFNvcXR4YmNw?=
 =?utf-8?B?NXkyTHg4QklTTncwcHBQbjJ0Wjd3bHhxdzRxOFZxSVRXWVJrNytVaDdQVXRn?=
 =?utf-8?B?TE1sQWFzWTF2Yk8zVGZDK0lxN1doTjBDRllFR3pNSXVqZXNic0V0aWZhd2hi?=
 =?utf-8?B?NnlqSk9IVUlSWG5FQnpJaXhlREEwWlByUmdrMng0dE9BT05EMzlJTVQvZTVV?=
 =?utf-8?B?SEsxM3ZoUWs1ZUxIbDNHOWgxam1yRVYvQ3htTnhGWGpUZVhhZVhGQmgxbk5x?=
 =?utf-8?B?dWN3OGlGbWJwK1k2Y2g2djU3ZXovK3o4UU5ZcW82UWNGZ0RJNldZSm9FeVBu?=
 =?utf-8?B?eW93eTVvSHNRLzFORm42YmFvdFNoaitsNURkejhzWmdMZFp0M2U1YlNXSkt6?=
 =?utf-8?B?TUhGWE04SUVyOWxwMDA2T1BEbjJFREpFU2NEMURqQ09qR3lnYTQ3andiRGg0?=
 =?utf-8?B?TmUvYmlmQklRUlI4Yzl0V2ZlTVVFM2JodG02Ym5SdlQxam02d0txY1BnU3RT?=
 =?utf-8?B?b3F6eGpqVjM2V05meVA0THFGVlRiNzNtNXhsdTBza29ZMUZ5UzI2T3RjNVhF?=
 =?utf-8?B?ZWRWb1FOWVZ3c1VVMUNkWGtBRzdCWUtQNmF2VnFPdFVLb1NiblYrRW5NSHlM?=
 =?utf-8?B?MHhXekVXRnBHTFFNUVBuRVRlanZtM1VHWlZFc1NMRGNqSThISGxGUDhmZXdH?=
 =?utf-8?B?N1IxZzRTUmVNZkRwOXExN3AxVDNYZDA0a1dQRlJvbVJGMkIrTFkyM1QzUXF2?=
 =?utf-8?B?ODNpWWx4Ulk1T1RWQVdaWDVNRVlRdzBOL3NFcVVibzZBdFhGY0hIRjVoblkx?=
 =?utf-8?B?MTd5Q2FFeDllRUJSUkpIcm83L3ljMkRUTCsrbFFRUk5MR2pYQjhIRkdkTHdt?=
 =?utf-8?B?ZE5oVkJpS2FBVDdaK3ZVaEtDa2gzWVkxaTVZajFvUGQ0MEVoRnZwbE8rTFFu?=
 =?utf-8?B?NlhERzlhNFJ5QjdrcGRVTXlLMkpzM2RRMGdaSFJlell5Y1F6SGxsaHEzWDdG?=
 =?utf-8?B?dVhjSXRXUXM2VmNaTkpBRGJGclUvUnJKYURZdlJMNzI3cDFxWTRnOEMvSFk5?=
 =?utf-8?B?a3BpV3RhbVNWWEdpQTEwUVlwMHlTUENhc2R5ZloxWkxqZ2M1dDNVdTlFVVVk?=
 =?utf-8?B?K0hwRlNpWHZDeWtwd3FjQXZpdGcxWjNIcm9YR0FEUDJvQ3NGL2tWVkI5aTNI?=
 =?utf-8?Q?YgC03Tvi7r8QOx6DYJrZ3i4h6YErtY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmZ1dTZnZUI5SHZobWQvWXhubmJGTjhkcnd2cGt1cE5ka2c3bU43ejBCdUxv?=
 =?utf-8?B?MFQ0SEpaeEVXSmZxRkhlOXhlZE5MOUFaSmJvMk5PWnZRMVlqc29FVEtwNlVh?=
 =?utf-8?B?aG5LME9JdWZRRXRZNmxVVGFQNmxtNW5ib002TkhwL0lkNHVoUVJDRnB5RHFI?=
 =?utf-8?B?N203THRYS1NlOVVNeDhucGZzSWVlMXZXVlpTUFpKald5cEZ3U05XcnNieTBW?=
 =?utf-8?B?RzMwQXlSaTdOQW4rRmhzb3ZreGZQTk9SZGtxTGovVVhvL1JwSU11ZkMzZzFm?=
 =?utf-8?B?eFBQQkpUYzNxS2d0R3J2K3paWFRtalNVaTFJN1ZVd2dRakR5WlRyNUlHTWdW?=
 =?utf-8?B?cDBEVXVsU0VNN3d0TStwQ1UrR1pKdld3emV1SlpkS0pOdVZWRkVuR0kyWjk0?=
 =?utf-8?B?akk1alE3SlQrYXNkSDdXMkxUSWUzTlpkbUJza0JwNlZxR0xTVS9GUjZQbDA2?=
 =?utf-8?B?MUc4Z1YzZGhKakhpMlhPSjlwbExXYmhsQkxyWlBCYThhb0RXakNsZEhQNVRU?=
 =?utf-8?B?M1Fva2tSbHhtV1RtVm92bFVWWUp6QWUxZVJWZGdUa0NPcmhkMWx5Szh4LzZr?=
 =?utf-8?B?SHJTclBnN1pGem9mdk1CWE1Nd3Rac1VBNW83REFMTUExTDZ5d1l6MDUxd2tP?=
 =?utf-8?B?bXJjNnRNc2Z2OENTMU42SHJhOGV6Wkxmc0k1clNJVFFDOXlKM0RPbGtyaGdx?=
 =?utf-8?B?SkhpbExYUTlZNzk4dHdkd0I3cjdSaFZjcDJMbzBtK1JTSlZoQWdac0xjbnpC?=
 =?utf-8?B?SVJnbEFaQk8zU3JBK3NNclpLNGhMbWtla0lrRUFmZ3ozV1AvM3dtUlZ0bkFs?=
 =?utf-8?B?ai9HcXZLcjNrZTE2WjFQTklZNDNBSzhpcVU2UHJZb3BrMkxtaWFIaFFJbzV3?=
 =?utf-8?B?bFdQY3lSL2JxbW9iLzVsVU1sVzFUS3ppWm9jSFV6QVFsYmRyUHV5cHUxZDl5?=
 =?utf-8?B?TUt3U2lwQkRVeHlXaURuaVRDQ3BEYm1ZZW5ZTlhQbTk3OHJLZ3VhZTZYRDNN?=
 =?utf-8?B?VnpHVUVmOTVESHdGampEWUNYWE1Ld0xsaGI2UHIwMVBmVFVJQ2FQT0pjSnVv?=
 =?utf-8?B?UmlEVS85b1dPazh3NjZlKzJNYk9OdTM1MCtYREY4dm9KWTduS0ErRk9nYWZB?=
 =?utf-8?B?WVFNcnQyK3lRK0NHclYrTFI5SDJaK0xaeXZZY28zdm1GWE5veTlTanhOU3Y2?=
 =?utf-8?B?SEZsWnY3bjVyU2hWZExucEZqeGhhQkhqZFYrK3dXTVYzdGVHVWxGTnppNFB2?=
 =?utf-8?B?RmFaRXhaME9wcFV3KzArTDJuSXExWThuQUErM0swaE5OK2NvdVlSbmpOREYw?=
 =?utf-8?B?Mk9FdC9QclJ1c2FJZWlVV3h5dy9FWnZBSDhYdEUvazlIL1hqZEErbkZrTzMr?=
 =?utf-8?B?SERrZUZ0ZWpoWGRsLzMwMkhBZ1JqU3g1cVRJUThIUGEwckE5UEZ1bjNjcVBt?=
 =?utf-8?B?eUNaTUtxUVMyNTB1NUxUUXZaalNFdHZ1N2hDWE5wNlViejBMNGJNUWdsV2VD?=
 =?utf-8?B?b1p4WHJsYWlsOWhxY1JLRzZoUlNBeVFSQmU5MHhKMEVlZU5jL2FzN2M0MEM0?=
 =?utf-8?B?eW43RHNrcWFiWnBSZ0NoMHFWN2p0MENiNmRQM0JJd1RXNzdlK3BYNGdDK2Ev?=
 =?utf-8?B?YTBpYzhNUERLZVFPdmtNdVV5bndpSTVVVk85ZWFORzM5Y2ZxWk9QZU1KVmYy?=
 =?utf-8?B?OS9EZlUrNUh4amQ0MXFQd29zM1Ewd2J4TlluMjE1OEZZUDNjaGlha1AvR2lk?=
 =?utf-8?B?T2tnVG9zZS9SM2JvSnV5SWhJWWxhMVdPcm9mMFQ5WGl0d2ZTN1pVWXpGS2Zt?=
 =?utf-8?B?LzZ4STBtaFNHSjg4cnBsMlNlWjdvQjkyd21DUkRDeUZmVkcyU0pyR285N2J0?=
 =?utf-8?B?Mi9PWmpVWUNyVUpCQ0p3REN3TXFXUWtKQzN2TWhaOUFtUm9YRndsN3VCV2xa?=
 =?utf-8?B?eXFFOGtDNEVaT1dqZHYySjNaNjY5SFJ2azcyWXJpVlNZUEhHVnVTVWEveXlM?=
 =?utf-8?B?OWdrR0hvNTdGNW5zWWFoV1pmcWxWbVVnUjNHZmtLaGhVY0pNQ1I3emxwNmJx?=
 =?utf-8?B?TC9kSWNYcnZ3Tk1nd1B0bUFnbG5mNXdJOThMQ29yRFQrUUlpK20xNnh3WUV0?=
 =?utf-8?Q?45dI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d509857-78d1-40d2-3634-08dd7c381697
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 16:10:49.5163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZQ3cRpowtq9epVirtzrimQFHsN699jRYsLjOgdgjBV40/ATceStpV/aEZVfiYQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTUsIDIwMjUgMTA6
MzIgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT47DQo+IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47IFBh
d2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0
b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQnJlbmRhbiBKYWNrbWFuDQo+
IDxqYWNrbWFuYkBnb29nbGUuY29tPjsgRGVyZWsgTWFud2FyaW5nIDxkZXJla21uQGFtYXpvbi5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTcvMzZdIERvY3VtZW50YXRpb24veDg2OiBE
b2N1bWVudCB0aGUgbmV3IGF0dGFjaw0KPiB2ZWN0b3IgY29udHJvbHMNCj4NCj4gQ2F1dGlvbjog
VGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9w
ZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBv
ciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBUdWUsIEFwciAxNSwgMjAyNSBhdCAwMjo1OTozMlBN
ICswMDAwLCBLYXBsYW4sIERhdmlkIHdyb3RlOg0KPiA+ID4gPiA+ID4gK0JISSAgICAgICAgICAg
ICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAgICAgWA0KPiA+ID4gPiA+ID4gK0dEUyAg
ICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAgICAgICAgWCAgICAgICAgICAg
ICAgWCAgICAgICAgKE5vdGUgMSkNCj4gPiA+ID4gPiA+ICtMMVRGICAgICAgICAgICAgICAgICAg
WCAgICAgICAgICAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgICAgICAgICAgIChOb3Rl
IDIpDQo+ID4gPiA+ID4gPiArTURTICAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgIFgg
ICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAgICAoTm90ZSAyKQ0KPiA+ID4gPiA+ID4g
K01NSU8gICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAgICAgICAgWCAgICAg
ICAgICAgICAgWCAgICAgICAgKE5vdGUgMikNCj4gPiA+ID4gPiA+ICtNZWx0ZG93biAgICAgICAg
ICAgICAgWA0KPiA+ID4gPiA+ID4gK1JldGJsZWVkICAgICAgICAgICAgICBYICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgICAgICAgICAgKE5vdGUgMykNCj4gPiA+ID4g
PiA+ICtSRkRTICAgICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgWCAgICAgICAgICAgIFgg
ICAgICAgICAgICAgIFgNCj4gPiA+ID4gPiA+ICtTcGVjdHJlX3YxICAgICAgICAgICAgWA0KPiA+
ID4gPiA+ID4gK1NwZWN0cmVfdjIgICAgICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWA0KPiA+ID4gPiA+ID4gK1NwZWN0cmVfdjJfdXNlciAgICAgICAgICAgICAgICAgICAgICBY
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWCAgICAgICAgKE5vdGUgMSkNCj4gPiA+ID4gPiA+
ICtTUkJEUyAgICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgWCAgICAgICAgICAgIFggICAg
ICAgICAgICAgIFgNCj4gPiA+ID4gPiA+ICtTUlNPICAgICAgICAgICAgICAgICAgWCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFgNCj4gPiA+ID4gPiA+ICtTU0IgKE5vdGUgNCkNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEFueSByZWFzb24gbm90IHRvIHB1dCB0aGUgIk5vdGUgNCIgaW4gdGhlIHNh
bWUgY29sdW1uIGFzIHRoZSBvdGhlcnM/DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhl
IG90aGVyIG5vdGVzIGFyZSBhYm91dCBjcm9zcy10aHJlYWQgbWl0aWdhdGlvbiBzcGVjaWZpY2Fs
bHkgYW5kDQo+ID4gPiA+IHRob3NlIG5vdGVzDQo+ID4gPiByZWZlciB0byB0aGUgU01UIGFzcGVj
dHMgb2YgdGhvc2UgaXNzdWVzLg0KPiA+ID4gPg0KPiA+ID4gPiBOb3RlIDQgaW4gdGhpcyBjYXNl
IGlzIGFib3V0IHRoZSBTU0IgdnVsbmVyYWJpbGl0eSBpdHNlbGYsDQo+ID4gPiA+IGV4cGxhaW5p
bmcgdGhhdCBieSBkZWZhdWx0IHRoZXJlIGlzIG5vIG1pdGlnYXRpb24gZm9yIGFueSBjYXNlLiAg
SQ0KPiA+ID4gPiB3YXMgY29uY2VybmVkIHRoYXQgaW5jbHVkaW5nIFNTQiBidXQgd2l0aG91dCBh
bnkgWCdzIGluIGFueSBvZiB0aGUNCj4gPiA+ID4gY29sdW1ucyB3b3VsZCBiZSBjb25mdXNpbmcs
IHNvIHRoZSBub3RlIGF0dGVtcHRlZCB0byBleHBsYWluIHRoYXQNCj4gPiA+ID4gdGhlcmUgd2Vy
ZSBubyBkZWZhdWx0IG1pdGlnYXRpb25zIGZvciBTU0IgdW5kZXIgYW55IGF0dGFjayB2ZWN0b3Iu
DQo+ID4gPg0KPiA+ID4gUHV0dGluZyB0aGUgbm90ZSB0aGVyZSBtYWtlcyBpdCBhIGxvdCBoYXJk
ZXIgdG8gc2VlIGl0LiAgQW5kIEkgdGhpbmsNCj4gPiA+IHRoZSBsYWNrIG9mIFgncyBpcyBhY2N1
cmF0ZSwgbm8/DQo+ID4gPg0KPiA+DQo+ID4gSXQgaXMsIGl0J3MganVzdCByYXRoZXIgdW5pcXVl
IGNvbXBhcmVkIHRvIHRoZSBvdGhlciBidWdzLiAgSSBjb3VsZA0KPiA+IHJlbW92ZSB0aGUgbm90
ZSBlbnRpcmVseSwgYnV0IEkgd2FzIGNvbmNlcm5lZCB0aGF0IG1pZ2h0IGxvb2sgb2RkDQo+ID4g
YmVjYXVzZSBpdCdkIGJlIHRoZSBvbmx5IGJ1ZyB0aGF0IGlzbid0IG1pdGlnYXRlZCB1bmRlciBh
bnkgb2YgdGhlDQo+ID4gYXR0YWNrIHZlY3RvcnMuICBBbmQgdGhhdCdzIHJlYWxseSBqdXN0IGJl
Y2F1c2UgdGhlIGN1cnJlbnQgZGVmYXVsdCBpcw0KPiA+IG5vdCB0byBtaXRpZ2F0ZSB0aGF0IG9u
ZS4NCj4NCj4gSSB0aGluayB0aGUgbm90ZSBpcyBoZWxwZnVsLCBpdCBhdHRlbXB0cyB0byBleHBs
YWluIHdoeSB0aGVyZSBhcmUgbm8gWCdzLiAgSSB3YXMganVzdA0KPiB0aGlua2luZyB0aGF0IGl0
IHNlZW1zIG1vcmUgbG9naWNhbCB0byBwdXQgaXQgaW4gdGhlIHNhbWUgY29sdW1uIGFzIHRoZSBv
dGhlcnMuICBBbmQNCj4gdGhhdCB3b3VsZCBhbHNvIGhlbHAgbWFrZSBpdCBtb3JlIGNsZWFyIHRo
YXQgeWVzLCB0aGUgWCdzIGFyZSBtaXNzaW5nLiAgV2hpY2ggaXMNCj4gaW5kZWVkIG9kZCwgYnV0
IGl0J3MgYWxzbyB0aGUgcmVhbGl0eS4NCj4NCg0KUmlnaHQsIGV4Y2VwdCB0aGF0IHRoZSBsYXN0
IGNvbHVtbiBpcyBhYm91dCB0aGUgY3Jvc3MtdGhyZWFkIHZlY3Rvciwgd2hpY2ggaXMgaXJyZWxl
dmFudCBmb3IgU1NCLiAgQWxsIHRoZSBvdGhlciBub3RlcyBzcGVjaWZpY2FsbHkgcGVydGFpbiB0
byBTTVQgbGVha2FnZS4NCg0KSSBjb3VsZCBwdXQgdGhlICcoTm90ZSA0KScgdGV4dCBpbiBldmVy
eSBjb2x1bW4sIGJ1dCB0aGF0IG1pZ2h0IGJlIGV2ZW4gd2VpcmRlci4gIEkgY291bGQgYWxzbyBy
ZW1vdmUgU1NCIGVudGlyZWx5IGZyb20gdGhlIHRhYmxlIHNpbmNlIGl0IGlzbid0IHRlY2huaWNh
bGx5IHJlbGV2YW50IGZvciBhbnkgb2YgdGhlIGF0dGFjayB2ZWN0b3IgY29udHJvbHM/DQoNCi0t
RGF2aWQgS2FwbGFuDQo=
