Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5F1B043F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729011; cv=fail; b=j141hGwMA5N6KVOZ0zIA9A9cA5kWqgqsEvaQ9LEdos0mRWJxDywlsJvrdbpfpWBbu/s9HZcXhRSBQrl0SGZZBe2N+H5CyxFRS2MFZ/KAXGjiY0E2NBwzm09mOiDWL+7riyYIL0/LBhfUcqih3FKeJfEsj1MGHFCBou9v60moF/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729011; c=relaxed/simple;
	bh=5dqcLunFZrHuMsTvwSzu4QspmPmdy1IUBLq1R0ulKek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AhKDfxOz4tgXMW9OR0324SciqXfmnG8qhXSOoL9ggrf8sCDNvFVoatgeCvy4RlCZtWaSPn7qa8z5VtFrsooojj1lEa3auOghp1GYkyKjn+2y2ySpqkR0ZTiA85dAl/T037JFWS935vAdXHxtTvIZKYLewrZKPMXuPXBHB8jtBZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YjcC7nbB; arc=fail smtp.client-ip=40.107.220.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YjcC7nbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFKOSxEy4nNuKjDFeU152uZZJsaUuI/DNO2f2MeWxZHrWFe1QIck+1mpcQlbON36WvETgsclpH/8p8JWKVUVpZ9XsMUW+dVnJE1F+YxxCbuz9t2q2MTlAc7HLe1mN7ktty+jbBmGyqg2kbnmZfxDMl/NYuj5xIP79nymLyP5uEuGsOeZFRPkcYTgAp/+61xaMLAycQxrYHMRPv9RZqcXguZrt7/k6Ndff2+McNOS1dP6/uUZuQZSemrJLHMK2qJhJ012bcMlcS9K2tGHb0llrisneDaPbDlthpkTncwQQui8sqA8KIp/lR/FTZL4wk9+K5pwvOpMTZvJwbkL/WgV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dqcLunFZrHuMsTvwSzu4QspmPmdy1IUBLq1R0ulKek=;
 b=fRrvODim1j3tWOo3b4l+9pTuqqbEmMGpmklfq5HByAAq4u0EZZpEn1h4/tRAp25jcCDOfw4lnxi1h8UpqwoCV+1csRUqYO/c9VKAXk8if5CAljQoJnM+vePBd4T2lL/WwaOyWjQBkIBO5zvr/B+Y3/sydwU1Wgev6CNy6DU5qDJHGNldFkplzc4hvMxGl1U+Z5RXaY0ZGgq87jFnrub+4zeEZPpNopYgHLdwMQQUwXe5DN+ufMsM2Qq4iHT4NG1C2kzL/48gYN1hWrCzTt1i03vs9hnPPP+VZM5Vd7Z72GJvQTBVAm5VwSMOStplzOwtWmmdIO82A2xRI3cxkFboCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dqcLunFZrHuMsTvwSzu4QspmPmdy1IUBLq1R0ulKek=;
 b=YjcC7nbB9Ih9S+s4ARLj7nmTSaMN4+Iq19eK06qCNODLX/2J68AzRMHP5RvhV8HXGPmy+sfxoG1Z+0rKB6ITaLE4/upTOybiDckuimnUhc4+D/shKXbFqHmoW2kIrKjsk4rED+OHHQBqFkjh6NXl2if3AVCagXtWGiffimCfAUA=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 14:56:46 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 14:56:46 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Thread-Topic: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user
 mitigation
Thread-Index: AQHbqjdc44GkGReAIkKZskuMNLm5L7OjkBmggABK/gCAAP1TwA==
Date: Tue, 15 Apr 2025 14:56:46 +0000
Message-ID:
 <LV3PR12MB9265B894CD18006C074CDD4194B22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
 <pruotxsn2qn5gdxzeiowx4wy75xtlbiarpqyqjt5timl3sui5h@uiareopp3xny>
 <LV3PR12MB9265359D4950ADE05B0E181494B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <ikjndaokjcwq5mshmdnfkl3w3qrt7cn2vflmtd5in4pviupgzg@xxhzsopjmhrj>
In-Reply-To: <ikjndaokjcwq5mshmdnfkl3w3qrt7cn2vflmtd5in4pviupgzg@xxhzsopjmhrj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=cacc3851-323d-42ca-9fe0-9046c3edd94d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-15T14:55:27Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|PH7PR12MB9074:EE_
x-ms-office365-filtering-correlation-id: dd405ea4-47dd-4a6c-bdf6-08dd7c2dbe88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1pCcGtCVzhkaWl4cC9tZWdzcHdjQU51L3VLeUhFZnZka3dnSS9lYVZ1M3Rr?=
 =?utf-8?B?YXdudEQ0OGl4bk1qdHcxYkVrUTE5anZ0c0NLRTZ2YmxNeC9qR1AwYnovWnls?=
 =?utf-8?B?eFpEME1KTUVQTTNPdENMK3MyVjBPd2FSOHNGaUxNRUY2bVlpL0lERDltSFlq?=
 =?utf-8?B?TDhrNDZMWEczSVhuZllTMy85M0JwMnplZmNBeHVQVDNLOUZkd1pQUW5PWlYv?=
 =?utf-8?B?MUh2Z0ZrWkJmTEZqU1Q0SEtCbWhQbGRLdGxPSWVHOVl0QmkyNnNTVm9YSXdZ?=
 =?utf-8?B?czBrMHlXMENvMlRPRWNHV25YRUhId3FWRzNzSzgvbHJIN0w3Ylc0Tk5rbTF6?=
 =?utf-8?B?aUMrQWQ4djNubGQ5M00xNU5oMzVpZm5rTHNkMnlDZjVyR0lSVURVbUs2SWFw?=
 =?utf-8?B?S1owVUtpRUdMdjYrS05XWndzNUI0WnZBdm5BVTJrQitxcm5XUU1mZkYrVEVK?=
 =?utf-8?B?M1Zra2U0UmtzQUhDVW1pK0dTNjR5NEpVam9JdHlrdWRCVTc0MjhYNEhkbnJp?=
 =?utf-8?B?bUNDSEFudnhiTmV1ZytEUHF1WmQrbDhjWXRnSjdsWVBxbmcxeTZSN0txOUZq?=
 =?utf-8?B?dEI3ZDBoa1Uyb01HdForYWswS2hQU0x3S2Q5S3ZKb2JRMjFDbUgxQnV2bjdq?=
 =?utf-8?B?VmRFc2xYZk1uRlpLSUZDWWRKQzc0THZXbjRvZGNwTEtpejRqTitBVWFXdmdX?=
 =?utf-8?B?SXF5K21YdzNyejJXdWo3MlRoSGNNUW5HRnBzenprNFg4a09qV3VhMWdFYlg3?=
 =?utf-8?B?VlQwTUpFQ281aW1WM1BtM29ZMld0eFVkaXhFb1Z2bFRzR0lXK3lHZFBvYm5l?=
 =?utf-8?B?SVVsd3VkcG5DVU91Z2swYmNNZnF6ZmtxL29Za1BUTGpVV1VTL3daRWRwWis3?=
 =?utf-8?B?VlZ5YzNGOW1zWlA2QzNxbG5wcmlocXhGTExVZXFUdXI5N1RyeVlUSWNyUFpH?=
 =?utf-8?B?UTdOWkVuaytOWndjc2M1dTZncG1WVXRIM0VLdlhlMDdaSXdnMW5JTjRMMC9m?=
 =?utf-8?B?U05sTDdLdVd3TnI4M1lETmRXNlJjcEpSTGxBdThKYXphTzRZNE5FbnZlSzlK?=
 =?utf-8?B?enkvbVVlbGk5SXJONGExWHlhenhKd1VDZk9vbzBURldxSHhteGg2UUh0MjNZ?=
 =?utf-8?B?YThqeWRRWEx0b09FZDBLZjZxYXEzTmY2WitabFlucmtUcVFxMDJxTndncFVI?=
 =?utf-8?B?M3RFRlA2V0RKS1BPN3JFMjhyMkNQVUREbGE5SWZ6b2tCYlN6b3J2L0IyU2lH?=
 =?utf-8?B?aU9GcEZKTEpMNUNIT3YzOTJjNUhud3FGZEc0YzZZczk5em1GcFdhS0dzU0ty?=
 =?utf-8?B?bnRUbmZWUnpDZGNPUU82RDRvNy9ETXRKMExsRVVuVVIvdmdZajZoamIvU3Iy?=
 =?utf-8?B?d05hbzE2VFBOUC9hemNqR0hNUG9sRXNseXhKWDhyOE9DbG5GMGFnOWo4dnkw?=
 =?utf-8?B?RnZOQkJnRUdVTVNEVlpqUlhyS0w3VFJSNjFXdzZIQUVDWXpGTVFTSEZxQk1i?=
 =?utf-8?B?dmNrdktuVW1xUHhWYVdwMFpXNGMrTGhQRTFEbWtST2QzaVYvcUJBbWMyRk9p?=
 =?utf-8?B?Qlhldy9OWkc5S1djWERrZUt0OTlWQUQyaHY5bFpidmx0M0xZa2JFaEdCVWZB?=
 =?utf-8?B?N1d3VUhwaHQxeUVRREx5NGd5TFZLcWFFY3hJYnZSaEpDL0RvVEhTUDBBY0dj?=
 =?utf-8?B?VTlScktpRy9yYWJWOTJTRVBrQ2ROY2ltUlVISDNLa3FpM1ArTDZOd2JMTms5?=
 =?utf-8?B?UmpqNlRzMGVVZ003anJReXZpR3VIVE5zdHdWMkZ6Si80aHByUVI5NE0zTUVv?=
 =?utf-8?B?NXJyR053a3JOQUErU1kvSFpZMEgvUEs0dFZIa1BnYmhVREhrbS9WZjBvMk5R?=
 =?utf-8?B?U3VBVExGY21RSkMwVjVNcXlKUlR6MUNNTlhQSVIvcFFWcC9QNGw4RzN1UTJx?=
 =?utf-8?B?MXd0TjdLd05mN0JaU0dJMG5OZlRWWjI2MERCL204Q1NuUlR5R1pGSGVEeWZP?=
 =?utf-8?Q?Jr3brfteWXEBNeTFBRpj6NZpEul9fA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d014U0FHYVRjY2U0ajhESjR1bENhVlFiTlBZQjRhVjJGU1BPK2tmd0EzRHg1?=
 =?utf-8?B?N3UwcWViMUduck5PZmpPbWpBNmZZU3RxeGg4MmVMTjdwbXdxb2RnRTBHRkhx?=
 =?utf-8?B?c0F6RG51TllBTWk5Zzl1UmpYVHFvSkFXeUlxNmJkeEVQT2psdHMvK0RtcEZB?=
 =?utf-8?B?SENkZWVpbnlkSlNHZ0RtQUJsSFZmSkZWNExnMUp3ZTR6enBxWUE1SW5pS2Zt?=
 =?utf-8?B?Sm01b21ZakFzZ3E0cFlVK0hDeFJWcGk5UWlxZTdDbHRQRXFnTzRoelovd1lY?=
 =?utf-8?B?eW00T0xuMmFMdE03TENxRDN2SVgyNGFnUEVNVkQyYlVNcUNPZ2tzenFEWTN2?=
 =?utf-8?B?Z3F5WC9sZHFuazJyWjVpdGR4NzUwRE9WRGtvQnNpVHFqaEhRNHdNK1l5UXp4?=
 =?utf-8?B?VzM1ZGZSNXMrUzNHUjZid1ZpS1RCUEgvTGVJdVZDb0JXeU1TVk1VZkk4b2hP?=
 =?utf-8?B?Y0ZvOEFXc3hqMVVlUjJzTUQ2OFpxUGlGM2l3MnZYSG9tMXo5Skp4WE1HTU96?=
 =?utf-8?B?Ukp5NlozMHVwVHVWem9scE5ERGpHTzBOR0wyc21KYXpNQnc4MWFxUklHTXdB?=
 =?utf-8?B?RDVyQzBVWkRuYXhpTkpFdk0rNmNsTVFDd1VpRnA5ckR4S2lvN0ZJSHJDeFNQ?=
 =?utf-8?B?dkJqWFlnSkNCN1JzWHhKYnpXanpOTVhtZER6Q3h2c1VJSVp0SlY5VXEvRElh?=
 =?utf-8?B?SXlieUVZOHRaMnJ4R1VsaVFldEg5L2w1RXdJNEVUMzVnTVludXIyWnBPc3JR?=
 =?utf-8?B?aVZmdmNjK3BodDhQTGZ5K09xTEZJTndieXc3QlNuUEYwQUYxdWREdjZ4dVhQ?=
 =?utf-8?B?NW8ydWhTS0piNlc2ZnJLa3lGT2NWZXQvSHNISTdGUUdUQmFKVW5ZTTBWaWly?=
 =?utf-8?B?T01nMlB2bDhBYm1tRHFyU2o5T1VTcUtES3d5enNLcUNFeDVjY2ZGODdtaVlk?=
 =?utf-8?B?OCtreWRyOTBoRW9Kd2lOVjhVZTNtTW44NlY5Y0xodDcyeHg5QXN1WUE4RHZx?=
 =?utf-8?B?dWQveEZIUEtxejNZOWRwRzFndzNTT2VVYk00SEV2MHdTYi9ZWHhUYW1HaHNG?=
 =?utf-8?B?a0IwMVQ4bU96dEM3dFVJbUliS2RPQjh2VFVBNm00NVFteDhaQ21NQThxMjVX?=
 =?utf-8?B?RGcrY0dOaEUyVFNvOGxjR3dnL3NxY01nRjJrak5KYk1xTEJSWUpRK3AyYi9S?=
 =?utf-8?B?SjFlblBTTy8wempVcWdjNDE5eEdRdGxlVUwwNUhUckZBYk04NWFaOWN2MG1K?=
 =?utf-8?B?VHpFNkdBVHdpR1JBWCtCK2NpNUZsSFJoTllpUE5LaXFCTFpMdkw2WlJoVXAz?=
 =?utf-8?B?VEoxMnViQWk5dlljZFpRdXJlVkNjOHhZVDdOdzErSTE3SlliYXZVK3FSNldl?=
 =?utf-8?B?WklGRHJwN0xjTnU5azFYTExDZmo4VzBULzByQzd2VisreU90WmVIUldRajdS?=
 =?utf-8?B?aDVuaktmSzMxSm5yTjU5Qy9VMk9SNHprRDVURDhyeFM2bjJ4WTgvMEgvTlc4?=
 =?utf-8?B?UWhHWGUyMkt2aE9rTkFoZlVabk1LcXdETzgrdzIwSmNKZlNzS1hwMDRnd3c5?=
 =?utf-8?B?c2xNQlJPMndDTkNkbFE0T29DUW1Ya1ZqTTVaUDlLTXQwZisyOFN0cmttMnp4?=
 =?utf-8?B?cm1WZW9kZTkvMnFSc3FDRVBJL0VTTHNFcXZaTHpqcGZEUksvSmNWQTNhMnZj?=
 =?utf-8?B?YWhwMEl0cjZobkYzRldKZHZqdjBWNDR2cHhjU0lPNkFxYkgwbkFGY0dFK1Bs?=
 =?utf-8?B?Tng1U1NEWWF1aWFBcTY1NHpyeWJQN3ZHQ2U5ZU55WWg4OGVRUkhKamlCdERy?=
 =?utf-8?B?S09Nc0ZuZjJjVlIyYlZ5Znc0N1ZXSmFPTG40ZUIyR1kvYW0waTU5MTRtYmJx?=
 =?utf-8?B?TzN5OUMrYUlVbzBPTU8vTjVBRDhUd2pDeVF1Z2VRaTdCWCtYS3pnbE5TcENS?=
 =?utf-8?B?QmVMeFluN2h5aFhaYlNBb0lYdXM4MXJXN0haMFFnQmFQcGNtb1JiNVdyeEJ1?=
 =?utf-8?B?M29vWk5JVVVUYWlLQmpyQmx2UG9NWEc4alVva1RxOTQvcVFObTRpeCs3MElq?=
 =?utf-8?B?V0p1NExWYjBGOERPQ20rcjl1SUc2ZFEvTVlSRy93MExMbEJTbTBpc0N4NmIr?=
 =?utf-8?Q?+mo0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd405ea4-47dd-4a6c-bdf6-08dd7c2dbe88
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 14:56:46.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsTP4sMIbFXllU5sm+eC5B0LBuk8YWUjsnVykbC9zCkCFCMlBBf23lwwRYVg++nf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAxNCwgMjAyNSA2OjQ5
IFBNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxicEBh
bGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0KPiA8
amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDExLzM2XSB4ODYvYnVnczogUmVzdHJ1Y3R1cmUg
c3BlY3RyZV92Ml91c2VyIG1pdGlnYXRpb24NCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9y
aWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3
aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0K
Pg0KPg0KPiBPbiBNb24sIEFwciAxNCwgMjAyNSBhdCAwNzoyMDo1OVBNICswMDAwLCBLYXBsYW4s
IERhdmlkIHdyb3RlOg0KPiA+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwg
RGlzdHJpYnV0aW9uIE9ubHldDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gPiA+
IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMCwgMjAyNSAxMTo0MSBBTQ0KPiA+ID4gVG86IEthcGxh
biwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiA+ID4gQ2M6IFRob21hcyBHbGVpeG5l
ciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292DQo+ID4gPiA8YnBAYWxpZW44
LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPjsgUGF3YW4gR3VwdGEN
Cj4gPiA+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1vbG5hciA8
bWluZ29AcmVkaGF0LmNvbT47DQo+ID4gPiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlcg0KPiA+ID4gQW52aW4gPGhwYUB6
eXRvci5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBCcmVuZGFuIEphY2ttYW4N
Cj4gPiA+IDxqYWNrbWFuYkBnb29nbGUuY29tPjsgRGVyZWsgTWFud2FyaW5nIDxkZXJla21uQGFt
YXpvbi5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDExLzM2XSB4ODYvYnVnczog
UmVzdHJ1Y3R1cmUgc3BlY3RyZV92Ml91c2VyDQo+ID4gPiBtaXRpZ2F0aW9uDQo+ID4gPg0KPiA+
ID4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3Vy
Y2UuIFVzZSBwcm9wZXINCj4gPiA+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gT24gTW9u
LCBNYXIgMTAsIDIwMjUgYXQgMTE6Mzk6NThBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdyb3RlOg0K
PiA+ID4gPiBAQCAtMjE0LDYgKzIxMSw4IEBAIHZvaWQgX19pbml0IGNwdV9zZWxlY3RfbWl0aWdh
dGlvbnModm9pZCkNCj4gPiA+ID4gICAgICAgICogY2hvaWNlcy4NCj4gPiA+ID4gICAgICAgICov
DQo+ID4gPiA+ICAgICAgIHJldGJsZWVkX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+ID4gPiA+ICsg
ICAgIC8qIHNwZWN0cmVfdjJfdXNlcl91cGRhdGVfbWl0aWdhdGlvbigpIGRlcGVuZHMgb24gcmV0
YmxlZWRfbWl0aWdhdGlvbg0KPiAqLw0KPiA+ID4gPiArICAgICBzcGVjdHJlX3YyX3VzZXJfdXBk
YXRlX21pdGlnYXRpb24oKTsNCj4gPiA+DQo+ID4gPiBGdW5jdGlvbiBuYW1lcyBuZWVkIHRyYWls
aW5nIHBhcmVudGhlc2VzOiAicmV0YmxlZWRfbWl0aWdhdGlvbigpIg0KPiA+ID4NCj4gPg0KPiA+
IFRoYXQgb25lIGlzIG5vdCBhY3R1YWxseSBhIGZ1bmN0aW9uIG5hbWUsIGl0J3MgdGhlIG5hbWUg
b2YgdGhlIGZpbGUtc2NvcGUgdmFyaWFibGUuDQo+DQo+IFdoeSByZWZlciB0byBhIHZhcmlhYmxl
PyAgSXNuJ3QgaXQgdGhlIGZ1bmN0aW9uIGRlcGVuZGVuY2llcyB3aGljaCBtYXR0ZXIgaGVyZT8N
Cj4NCg0KWWVhaCwgSSBhZ3JlZS4gIFRoZSB2YXJpYWJsZSBpcyB3aGF0IGdldHMgY2hlY2tlZCBp
biB0aGUgZGVwZW5kZW50IGZ1bmN0aW9uLCBidXQgZ2l2ZW4gdGhpcyBjb2RlIGJsb2NrIGlzIGFs
bCBhYm91dCB0aGUgb3JkZXIgb2YgdGhlc2UgdmFyaW91cyBmdW5jdGlvbiBjYWxscywgdGhlbiB1
c2luZyBhIGZ1bmN0aW9uIG5hbWUgbWFrZXMgbW9yZSBzZW5zZS4NCg0KLS1EYXZpZCBLYXBsYW4N
Cg==
