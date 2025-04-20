Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352654A11
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745183010; cv=fail; b=p5nK6gBl4Mb+dKVhfTke6tpvA3QWM0lFLsUFlvfYbrONwg5WjFzRsLlEgh6V4GYRuT73cfQ5MaivSKJ5A0mlqFTaHRNdp3gWR1SUGPDGgN/nlpakXMpGXwub9RTEnkQjn8FVNPCSlDY8r+xyl4kzy7K3pAC+dxYri1uTpGYQ01c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745183010; c=relaxed/simple;
	bh=0Qda8olONyoIdIVAoaAV9raPEOOq1oDsnd46UQj0SMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lABu2tKpEwANLuSs9kBA4Bn8FdzUW2Rrw6taZSK/FjZdijzekwMYMcmHGQbfW4WfES5xvGY3L2w8MxLp2F4LQlcWax0GABUH5ohboNDWCPg5aeJYAou8gfj5JHr6B9CkRrZgTKf+PpoEUkC4jkFBAOjQtDOheScIkHxlp/o2l0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zt06qWIe; arc=fail smtp.client-ip=40.107.102.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zt06qWIe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8atI5oW6sENYluOsLBbCoz4JDzsyQhNsvFk+U/4KpJk7uztveoZeD7hY2ra8KAN/0YB9Lc1ATe7eHAE5PzeBY7js7mNZ8M02msxyoZleEUOzFnh0GslQh70k+CD29STUpfqEhatFQ/fEX4kHxor6TGO3guZ/ZJ3R6Q2HmQCs/g+8lmygLauFBZk334+0p6/kqC9m4xVZ5HSlyydIYucdp7G5M0PwOFELSk0jHLHmJPTvNk/tBLwEFmcyaBJM3LcLTDu99unnxJWsVphyi6d8b23ZBPj3LkwS4CgKRpIlJhrIioTq/VuaUAFdBIgVLuZyJU6auYX8m0uGoVj2+hMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Qda8olONyoIdIVAoaAV9raPEOOq1oDsnd46UQj0SMg=;
 b=t5PmaWUwOfVKA262zzN9hh7gpfoD1SCkhPZWAaolvXMqM2MbsSfEKc5uA/S7NYJg22+Rtolhamqly2LHwOgQcMHTXLJsFhCqy7P0fX+xLOBNT7udV5GMhbkM3r7MrLT4if6pT4RCb8Xlv0ja91wR0MxfyZrsFcpqfoYGPowMGr1vfY66LqJqJ+p9E+QBEetRk4vGoOCqNEKmwgJsZ4dbSgSOfYPAPz1BQ//tYdgvMtMlWMSA6tyOVD7smeru3fnzyQlC3Efb95aYF2lS3UGWMhNj8u5gzc1kmBy9zgWop4DKW4jWbFRjm5d4BKk9J+7Tenni50Np6ynHuU5UCS+X4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qda8olONyoIdIVAoaAV9raPEOOq1oDsnd46UQj0SMg=;
 b=Zt06qWIe8bdq1aN0uOTL07HpLfkrnjAyuOBVq7yZt/Yk4k9WKjNxoFuM8W9Fc0GRKzBT40kPpC3qVZS1eWBgNO8+p0rbUiQoGoca9HaZPRroWYx4fUqpLjE89CVFwtyQ61IyyR/wXe2RrALoOwfObgU37PbaMJGwHrfNf2m3ZXU=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Sun, 20 Apr
 2025 21:03:26 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Sun, 20 Apr 2025
 21:03:26 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 02/16] x86/bugs: Restructure TAA mitigation
Thread-Topic: [PATCH v5 02/16] x86/bugs: Restructure TAA mitigation
Thread-Index: AQHbsSfOQptdt7zM7UON4mHzMuuuprOtDH7Q
Date: Sun, 20 Apr 2025 21:03:25 +0000
Message-ID:
 <LV3PR12MB92651777DD5C8A010E010A8794B92@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-3-david.kaplan@amd.com>
 <20250419123655.GRaAOY5yCyIz6TYcCC@fat_crate.local>
In-Reply-To: <20250419123655.GRaAOY5yCyIz6TYcCC@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8aeafe92-c335-4892-bf7d-75a3b0747899;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-20T21:01:35Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|CY8PR12MB8241:EE_
x-ms-office365-filtering-correlation-id: 5b54adbb-c150-471b-3fff-08dd804ecb17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVhvQnZKWUxCdVpycWVCL1YvcG9GK1NIdTJCRzJJc0JXY0xWaVRLbG1IR2lp?=
 =?utf-8?B?SHdkOHZHWHdzUEphZ2tsY09ET1hkREQ4L0E4MklralljQ3FlQU81ZE8vZHZR?=
 =?utf-8?B?Q2RlQlk2T3FiTXlMdlgyVHlYd2tYZUFIdXRSVUE5SWtrajN6QkttK1FKQ1BL?=
 =?utf-8?B?bURGdTEzVHRGSTNpMzlaRFFEM2RQOWxvbytxWmV2QWxQVFAwNmdPZW1GeHRP?=
 =?utf-8?B?NWUzT0huY1NOb0hWMmdCNnVOQmxSOXVNNnc4djFvNG9FeTU1M3lSMmhPenhL?=
 =?utf-8?B?Rmlpa2lHMnAyQzFxU1ZxbkZocXlKTmJkQ1NrVXlqR1F6L0h0WnpVMnorSXo1?=
 =?utf-8?B?aUxPZW9acEt2N05rQkpVdEJvRzhMdnI1dEcrZFh6bGJTQnRQTVUyOFdSdlVD?=
 =?utf-8?B?N1BSYitiY2FyU2NQZWRNUm5aRmpaMURKM0xubFRSR1o0cURQZXIzcm4xVlgr?=
 =?utf-8?B?TnlpaFhYdUVkTVZmeVVhMmFCSnNlZ1FyejVxQURCZituMlg5eXY2a0ZFcWJQ?=
 =?utf-8?B?Y2lNc3Z0eFJiK3hwWWY4QSs3ODd4a2dQZ0VZREl0ejFmN1BGOHprMVkyWW5Y?=
 =?utf-8?B?QUNBUzl2T1VtT3JHRjI3aGJzMmRXWTJHcjV5NUZ6UkFCVXhYb3Jkc09oUzZs?=
 =?utf-8?B?NGdqRG0xcVV5djR0cjMyeHVPU2RKdFpKN2F5UWZQWGl0SStCaCtOYSszcFRo?=
 =?utf-8?B?aVRzUDBGeExmd0ZGNDgwaTNQcnB0VWJveVE2Z2tScC9FcHpsTnQ3S096OXF6?=
 =?utf-8?B?U1NXRi94NktwRWVNdFlPUVBtbXZ6OFluYm1SUU9CT2dkY2F5bTU2UThNdmlG?=
 =?utf-8?B?WUNrWUdjcFZ1OHpOMmtwSXVKNVduNXE1TkZiWThUR1hCbVhhUTdBV1o4ZVA2?=
 =?utf-8?B?R0Zmc2dCck44RG5WVUtacTYwdWo2NG1mZlVneCtDbmpyeGN4cE1iNjVUSHc4?=
 =?utf-8?B?QXFPNmdyS3hvc3MxWElOU2JXSzVjbjdsSXdaaEVVSUg3Vk9zMUpNcHZqaDVi?=
 =?utf-8?B?WHNvVk83N3NiZWRsTlFxYk96Z0RsQTVvc2lxZnJpMTVNQXF4ZHpqQTZxQ1N0?=
 =?utf-8?B?ZW9KQkNHeHI1VnE3d0l3NzlPaElYblczOTdCUVJEZHVDRXM4dlRHR09mQ01P?=
 =?utf-8?B?bWhzUVJ5aExMNS95Qjc5cWpjTFBYazhaOFQyK0c1MTN3c0xqK09DdFJPU05O?=
 =?utf-8?B?ZG9zVGZkaXF0K3pKS2lwN2t4UlBwdDdEeStJa2FxdWdHVS9HTHRla3BTOU1T?=
 =?utf-8?B?VEZtQXhFRVVidnVWSHh0ZkppQWR5SUpDUklKT1RnMDZRbmxYNkZKZ29RcTZl?=
 =?utf-8?B?YXVDUHM0S1dWeHorbnpLNU1sNHV3bzU5NXk3V3FtS2ptMHhMMmlKSTkzbHhj?=
 =?utf-8?B?YXNpSElOeUJhZUJySnJBWlpiSnYrVGVCY1cyc1ExOUlYUFB1QnlqRmswOE8x?=
 =?utf-8?B?NWVMaUpBZHpKbHplSkJTemxGaUhId2RXNmlyU1A5Njd2T2ZNWFA5cDM1cm9Q?=
 =?utf-8?B?bDN5N1hkUml5MFBwWmFad0tHMVlyZko4OElkN1N2VXg1dDNEREJJWURqdUtS?=
 =?utf-8?B?V0xpWUFsRDlrZExrNGc3S3dCcFJlcmk3K01NdTdQV0JOTEtBWitucGdCZHdl?=
 =?utf-8?B?TU5NK1lOYTdHQ2VxdksyMjgxMXhKMjMvR0YwUlBKNXR6VFdyR0kzT1EvRVVn?=
 =?utf-8?B?M25hRnZtT2p0VmttOWk1SUJkbnFxb0NieUpweUV3d3NvWll1VUpHeXgySFlV?=
 =?utf-8?B?UFE3eXJlWGMyaTdiN0JtOElCTk90TGoyU3VjVStJa0VuYWk2WUNrckZnbkh0?=
 =?utf-8?B?RjNsa1ZtRTZ5aFVjaUpteEh2bWRKUGs2QjdkWUhpc1ZacFluRVlTZlQ4VWpp?=
 =?utf-8?B?VEl6M2xvZGlMakxrRUUyb1JJRzhnRDNJRUdqNTdvN2ppbHJUUkJMQlRNUUl1?=
 =?utf-8?B?ZEU5MC9Wa0UxQkFlT0djR2FrWWc0ZGlXa2JNbHFqMEJzMlJ3bEVlQnV2ak9Y?=
 =?utf-8?Q?wfiXT/wjb4pCzA302Q7itzN9etaMuw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkhSeU85RHRwUFRtUTRrcHl6V2p0VSt5U1hvbXFiUEJJV0RvM0poUU5kTklx?=
 =?utf-8?B?Mm41RzBwZ0RnMi9LRHFWVldqcjY2aDNQeDU5YjVVZ3E3SXJIbmlHM1paNjhF?=
 =?utf-8?B?UGdLdExod0hPM0g4YjhkY1VTeng4cXVrK0FpcCt0dzZuZGEzU2FlOVpVWkZX?=
 =?utf-8?B?NkJpTXNEaHA2RHowV3UyaUFId3c2MjhBeis1NHJRZHJPOTBwbFJHbGNLaXNi?=
 =?utf-8?B?V0dROXZNbFREejEwd0o1RVlKbmhqS3czWjRwV21mci9VaGY2SHVtNDdvcTBt?=
 =?utf-8?B?bkViVGxKSzZMamlYNUdtT1dnaWE3YjJuUjNpZTgxQlpDYm13emhjTTU4anZS?=
 =?utf-8?B?V3hpS1ZVY0hVM2hlT1R1NUUvUnh5VjM5SUgrQ2ZjOE9HeFB2UzJ0RmpHUEV2?=
 =?utf-8?B?VTBxMXJCYVoyTlNGeU83c3VVSkRKTHF1dDJNaTBZanFRWUxqRkJ4MnhuWE44?=
 =?utf-8?B?WThQMnhiZGgxSisrZS9JQUdyNUlwTEdxRmdFcDRLdDZDOE1mRTRnQTdVYnF4?=
 =?utf-8?B?YVpYRTJ6NXdoRzQwb3lHbkNQOFU0TW4ydENlbksxNGZtVkJJZkhoUVphQ2cw?=
 =?utf-8?B?dTZIeE1FTkJ2eXRTT0tEZlh6RmFCQ0pjMHEwSEFLL0liY2JnTThNNDJiNDYw?=
 =?utf-8?B?MldkT1A3UWlPTlU1d08zMTgyNGFHdWo4c0huVGRKWXZmdk1RSDFJcXVqdmcz?=
 =?utf-8?B?MkMwdUl4OEtmOHIycENzbjJrRjNXQm1KcnN6YVA4ZTFoWVFaTk9DdXRkc2pz?=
 =?utf-8?B?SnBDTjdrSWFaWXVicjNZZnVVRXJEMitPeGZnS1o5ejRGMGxLTm85QlI4M2NH?=
 =?utf-8?B?bS9xdjY4Nlg3TkVNZ3huT3lFQmNsbEVtaENPVjhreXpSYTc0WVlGQUh3UWtX?=
 =?utf-8?B?Q1dZZVA3QzVkOXhocVY4MjZWbkg3WVFqaDc1THpLQldScFpOQ3AwZUxQNUFF?=
 =?utf-8?B?QXFPV28rWTJHdWVzUTVVR2gvaGhKRlR0dzZrSnRLL0c1UzJ4TDBSUHNBR0FL?=
 =?utf-8?B?dEFMTU5ScEJOOXJ6bldtditZcTJrZ2xudzZicDA1RmVMYnV5L1FmaXJXTjNK?=
 =?utf-8?B?alpPRy9BK2l1MVYyb21sR3pxQUcra2VoRUJYenQrRnpkODIzUGlreCt3ZXZC?=
 =?utf-8?B?Q3UrTy9tb2NKT3lGTlgvczBsWVRhdTcxU1dBKzEzRTBFYThqZmp3ck05LzNs?=
 =?utf-8?B?aG44UnIvL3pUbmE2MTNQVTkwcHRiU3NwbGpYL21iL2FRV0NNSFM1dElXSUNp?=
 =?utf-8?B?Mkw0Qk9rR0dhQXY0eWI3LzNseGJnREJYUWlVc2tIYzBLekl1ZTY0RGlMN1dD?=
 =?utf-8?B?QnpUSlVvaStCYTVKQzZuZUVVM29Bb3BBNFA4c0trV2JiOXAyNDhWa0lwcWgw?=
 =?utf-8?B?aWowVG1HWkFxQkhXL2pJWTEyTFdnVkVBUEluUEhHN2I4aVRhWkx0dXhpb2dB?=
 =?utf-8?B?aWh4OVJtc1ExdGREVnpXaWJuZnVZL1o5UnBYUElYb0xlcHk5QVAyL1UwSWlH?=
 =?utf-8?B?RFhQTmM2RldxeXdkc3RyUmtOL1c2aUFReHZtQ3J0Tyt5cURVL1M5VjVqTEVl?=
 =?utf-8?B?djcvaks1NmlVb3lLQXVMdHhoeU1aK0VCaXhPTzZvTDdaQjdCTmRlcmVzOWI5?=
 =?utf-8?B?VHNoL2xidFFuTE5CT2owZzl1UjFUSmVvNDgxY2FicUtjVitlR1BCSmJURzUz?=
 =?utf-8?B?T3hkZ0JvalpMaXBpMUpkRlYzaVRzWEdvOFNBSkphOFFIdUdLdXJGN3VRaC80?=
 =?utf-8?B?TEJtUlNPQzVsUFB2QjVNMFZaWWFWUzZHVUw0UzJMajIxTitEdDYvR2pzM2RV?=
 =?utf-8?B?aHFxcThVZ01pZGEvdVRjcVdhbWM0T2UwVi9FZ1UvVUZKRVhvekZ5bk45bVJ1?=
 =?utf-8?B?dUMwcWdoOVFCbkFnRmdiQVFsOXNjaUVtYnRkazRCeU0zeVJaRjdXd1U2amtX?=
 =?utf-8?B?TVRVSXc0SlByd3pnMlEzWC9OaVhwbURTVjF4RXpjMWowT1VOZXRmWDJTV2Zw?=
 =?utf-8?B?NjRFdVV6d2I5bjR4dGk2VE1UY1dqdm1ncHBWQXE3ZmFXM0tLcEYyT0cvb0dy?=
 =?utf-8?B?Uit4WHBOYVNubTRCbHRBTFlHczBBMXQxMkhqQkZ3eElONHBPT2ZEdEJiMUQ3?=
 =?utf-8?Q?QAQA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b54adbb-c150-471b-3fff-08dd804ecb17
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 21:03:25.9388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXloJdWPs7xG5zD9lPHEUJhYrOx66LGNcbwARXvTV8x/H2kdZt2Vrbl3XznfocOO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDE5LCAyMDI1IDc6MzcgQU0N
Cj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Ow0KPiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz47IFBh
d2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0
b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDAyLzE2XSB4ODYvYnVnczogUmVzdHJ1Y3R1cmUgVEFBIG1pdGlnYXRpb24NCj4NCj4g
Q2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2Uu
IFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5n
IGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBGcmksIEFwciAxOCwgMjAyNSBhdCAx
MToxNzowN0FNIC0wNTAwLCBEYXZpZCBLYXBsYW4gd3JvdGU6DQo+ID4gQEAgLTM5NCw2ICszOTks
MTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0YWFfc3RyaW5nc1tdID0gew0KPiA+ICAg
ICAgIFtUQUFfTUlUSUdBVElPTl9UU1hfRElTQUJMRURdICAgPSAiTWl0aWdhdGlvbjogVFNYIGRp
c2FibGVkIiwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBfX2luaXQgdGFhX3Z1bG5l
cmFibGUodm9pZCkgew0KPiA+ICsgICAgIHJldHVybiBib290X2NwdV9oYXNfYnVnKFg4Nl9CVUdf
VEFBKSAmJg0KPiA+ICtib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfUlRNKTsgfQ0KPiA+ICsNCj4g
PiAgc3RhdGljIHZvaWQgX19pbml0IHRhYV9zZWxlY3RfbWl0aWdhdGlvbih2b2lkKSAgew0KPiA+
ICAgICAgIGlmICghYm9vdF9jcHVfaGFzX2J1ZyhYODZfQlVHX1RBQSkpIHsNCj4NCj4gU2hvdWxk
bid0IHlvdSB1c2UgIXRhYV92dWxuZXJhYmxlKCkgaGVyZSBkaXJlY3RseSB0b28sIHNpbmNlIHdl
J3JlIGludHJvZHVjaW5nIGl0IGFzIGENCj4gaGVscGVyPw0KPg0KDQpObywgYmVjYXVzZSB0YWFf
dnVsbmVyYWJsZSgpIHJlcXVpcmVzIGJvdGggWDg2X0JVR19UQUEgYW5kIFg4Nl9GRUFUVVJFX1JU
TS4NCg0KSW4gdGFhX3NlbGVjdF9taXRpZ2F0aW9uKCkgdGhlcmUgaXMgYSBkaWZmZXJlbmNlIGRl
cGVuZGluZyBvbiB3aGljaCBvZiB0aGVzZSBkb2Vzbid0IGV4aXN0IHdoaWNoIHNldHMgdGhlIG1p
dGlnYXRpb24gdG8gZWl0aGVyIE9GRiAoaWYgdW5hZmZlY3RlZCkgb3IgVFNYX0RJU0FCTEVEIChp
ZiBubyBSVE0pLg0KDQp0YWFfdnVsbmVyYWJsZSgpIGlzIHVzZWQgaG93ZXZlciBpbiB0YWFfdXBk
YXRlX21pdGlnYXRpb24oKS4NCg0KLS1EYXZpZCBLYXBsYW4NCg==
