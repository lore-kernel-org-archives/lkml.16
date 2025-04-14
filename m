Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4D10F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665358; cv=fail; b=r6EqvMdQyK9A236SCI4flWuE6jZ5UdQH9xS3j+170Q33dKTSau9y04qhY2qG+NpxxmC6Hd0tsx25d0EEgx34mX4HNM4CQmhQaP5esAmz/qXpqMwfWsDsCA7t0H43jCYgZmQV0Uak93oiFuajdk22aoP/2x8TlYUeFWdlBXk0L7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665358; c=relaxed/simple;
	bh=s3fgNjr13QftYkULTtKq/ikCNmoa+sZkoGPN32SzYF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hgtJwWGV4/Ik8Ef6X9xylAMr03x8qjlZRCBRj5ZZX/qMsBR20Ur5NyRcqgc22XG8fnXHL36WPAWLX19Eb22g/5v7x16bhKVOm8bSycz93Ml+PpJ1M2ly3jn36aJUjt+/ZXjLw03I4WuREUnsDMgAPqcHl2CRWnZRdmmvMmO8/jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W7OkHJXN; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W7OkHJXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYw068rDjsYD8xvkFX5rSrIhg03tQNrHcoSFN1PLVJpeh4soBHvopj7vVzbO5AVofqj7FZ0LKKu+84M5yyWiWkRUui4G+/Wut3hbmDGPDD9Fe17z1d9AKvGKVX7iBVpV6TUBG1SR2+4gP568eeKtRqUNvvcjiENXq+4Qt0KxZSkqAa/0erxc2QEBC7CXL7q1q5Fm9+Ucai39+w/5egzbCL6aJpkqe6454k0pfGMKfCkEtmKMgvbsz3cjxbk1bgKybrwmso39QN4uHE6pEBJwZ0laLbDJVsVMH/TXqTl4phPhm/3h/bl9BtFZeyKXieUlk1rjCZJSNDxvNoIVGxfRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3fgNjr13QftYkULTtKq/ikCNmoa+sZkoGPN32SzYF0=;
 b=Rzaj1r1TF+TDhV5um1CJ3AfYLdaRmkduSVQBCS/lKI6YrZxhqwOZpAJE221YgbdntrjRnzQT1+5fsX52U/5lLpX2XaMA/+zETAJS1NjqxYYMlY7hbD2Y4F9ABoN9Z32bNOYqpm5DgsaPEYOMIn9zHDZ3lsmy/HTtCwtbmSa88JvxqUxUk5UelRrp+e60f3ALSiBEMW9HUtv/Y5KvFox/bo+5/plpwyPSO9FvsswM2BaYUfu7/aktEvmAIe/pnBYxJUVO0Te37Gob++w4hDyZxl5motOuy0icPf8Gu78sYgoYTDSN6INub8baT5SQYsI1YSHEwFxcBy+arqNY9n1fFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3fgNjr13QftYkULTtKq/ikCNmoa+sZkoGPN32SzYF0=;
 b=W7OkHJXNI8Jc5PqmhTZzRg7hcCWo868RmOEPp2X8ROVeVs6fsvQ5+cwhuBF6Vbv8CVCms0QNH9YjltL5KyI6WGZBXiuvShpweOhfJa1SNlMncLWFcO7KbWgcCt2O/uzyvUL9+F9/ozr7M1wrOkJfUrTt8HmtB5umc/AiSS7SXfk=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 21:15:54 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 21:15:54 +0000
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
Thread-Index: AQHbqkRxQb0hpP7F0ESPe2022Gd5BLOjr73g
Date: Mon, 14 Apr 2025 21:15:54 +0000
Message-ID:
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
In-Reply-To: <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=92ff3b4a-e04f-478a-b1ec-1b36478e5eb9;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T21:13:58Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA5PPF6407DD448:EE_
x-ms-office365-filtering-correlation-id: d2f97d1d-2533-4932-3e71-08dd7b998ae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHZGazNwTW41cEdTN2htS2crS3AzWWJXWHZObnIvVEg4QUxLSXJVL0s0K1hI?=
 =?utf-8?B?S1czVDVUVWsvOVd2ME9FeVl6Z0gwZkVMczB1VEtxNDZNck85eHh2NGozdUh4?=
 =?utf-8?B?UGVCWTA5SGpYNC9nVUN0eDJyanlhWDFCNXdCamNCNm5ubXdNY3V5TDRGMDZq?=
 =?utf-8?B?RjJjRnZBcExtZUIwcUZqaGIzQmJiQjczcU80WW9ua2dvbXkvNDVQb3NMVXJU?=
 =?utf-8?B?TDZPZFhjYUluRkU3Zm1ob3RyRlIvV0ZTcWk3czg3ZnVxNGIwb0FlbkxMK3FJ?=
 =?utf-8?B?S2FHcjA2MWdtRDR5QVNPY1pKSVhkVWhieVZQbjU3QVA0UWNpYlZuQTNzWmNH?=
 =?utf-8?B?aWRCbUpnQjAzcHhMTzZvTGszZlB5UlVxbGdUMHZ3bUExSnUyWEp2QlllWlRQ?=
 =?utf-8?B?R0xtUGNGR2xDYlZjaC9pcmx5OHpGOU85WjJpbEdlR1p4ZWVNNy9VNWp5UjZ2?=
 =?utf-8?B?ZWo5RU54UGFOVlZUKzBiTE1Ia3huYVN3S2psaUJmWjVXdlFJclZMQmJabFFM?=
 =?utf-8?B?bHdCbFplRzJ0eDdBUnV0MkhxNVA5M3RXaFJUcXVTS1Q3eGE4d1NrRFFQNC9T?=
 =?utf-8?B?aGVNdDFnNFc1aUJvUWE1OXEwcVQzLzc5eVdlc0UrM3NtYjBoYlQ0VXBRYUND?=
 =?utf-8?B?Mmd1Y2NFUXptZEZFWi9qcklTQ2Z4ay9MenFpLysyRlZIVzUxTElYQWpKMndi?=
 =?utf-8?B?ZGduVUdRNmhYa1Q1YU9TWnpWZzlWK1g5c1FqNGlqVkdNOXd2T2gyMjNLOW5K?=
 =?utf-8?B?b0RWT2I2UWkrYXErcW54SENSZWRvOEVPRnNPWmZMcU1SNVZmc2VHM2dzQlUr?=
 =?utf-8?B?ZS8ySjRVRzA0cnFVOVNPV0xLWjdGc1lYZTNCM1R6bkFET01NMnRWbkN4YWlM?=
 =?utf-8?B?d09lbnMwYzI3MjgwZ3JkS3pneWhlZkVuY0Rqd1JocXlnc1grbzJoRGd0OWVl?=
 =?utf-8?B?WHBLRGptTlJqK04ycGl1TlhWY3lJaWcrRHZ1UVp0VUNKaXpoMklHVHdMeWVi?=
 =?utf-8?B?V1J3ZXR6RnNBSmVlQVB6MmpFc3oySjJ0TFYvanU3eTRpMG5VTWwzY0FkRmdz?=
 =?utf-8?B?TTBveit4OFJzQUNHUzdGK0JtQ0pza3dMY1MwTUJDSW93bmI4WCtEVmM1bTlH?=
 =?utf-8?B?d3FPLzJHWnU3Y1l4dkl0ZGd4TFVneDdXQk01M2NyVmZFOC85M3NwamdER1Bv?=
 =?utf-8?B?VnBUSTV5dk9ucTlVSDBYb0RDUUtKVDJBOFd2WmNwNEJ3UW1Mc1YvL2Z1TThY?=
 =?utf-8?B?K09hNzIvZnhUMzd0NjMzOTBzV2J4OUJtSTNoNys0TTUyd0VvZnladVFkcUpn?=
 =?utf-8?B?SVdqZ1FxK2pRRVY5Ti9yMUlSWkJYS2JyQUdrcGErWWZSb051TndmNm9ablk1?=
 =?utf-8?B?aW1iZGVzRmd4b3pPZmlEK2NHVFROaHlHTkVpdlpCUms2Q2lwZEtjNWYweGI1?=
 =?utf-8?B?RXUrSndaTzRJeDg2alRheExQQjVmano4M1IvY1B2OENCS0dwMEY5eGtxSm1C?=
 =?utf-8?B?ZDdldlBFaHpEM29xWnJMYVduTllaUTY5NllsbFN5eVJNd1F5VmNrWlhuaG1j?=
 =?utf-8?B?NDRIWVZUZ3JYM2VIMjE4K1JsTUV3NEQ3aVBWT0ZFSzNuNU5YZ2FiQmFzT0dV?=
 =?utf-8?B?RWs4Y3RPYnBFV2JHSkxadVBvbkxZMytmUmkxdjdBSHFTanFER2EzMjROdFI2?=
 =?utf-8?B?SUdPWS9TbkxyekhoMkNCdFhoRmp4OEg4dTNlNkVhVFBSdTltelFlTlhkWCtj?=
 =?utf-8?B?WlRaY25BdlcxT0NqUXlSZmhVU0s2UXFvMjBoa3dFbTdyUTBDM1h3eFpDdCtR?=
 =?utf-8?B?ajk4N3A1SWhPRXcraUVuU0RsYTNxMElUcXc0RzJtRllUUWFScWNjcTI1M1NN?=
 =?utf-8?B?RTJKWlc3bWhhdThOeHNsQ1FUeXhNd0pIcnl5SU9HMFRqcjFGbXdOTVY5OW5D?=
 =?utf-8?B?WGZCZWRZMndqc3Y1Z0Q5cGY2SHRqK29uRkpybS9IeTBZYS96MHFISHQ1Yno4?=
 =?utf-8?B?L082QjlIeUVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHpFZSt3MzIvYW1XbTF2THUySkljd3NvTzZoM055RWluelRYNUVaRGxQQUV4?=
 =?utf-8?B?T2pCOVF5L0pRbkcwU3BvV1IwSlFSdHFFcC93MXE4R1h6S3dqcGZOd1dDR0F5?=
 =?utf-8?B?VmhWdGpRZHBQM2FxYmNSSW0vUkFydHFrVDRFdUJKWWZJTEQ5NjJrc21IdklZ?=
 =?utf-8?B?dTErNUxaZUIvWGV4SUFUcVVmeTFvUHBvN0d4WkY1eHh6dDhBbnVRNTV6aUx4?=
 =?utf-8?B?WWhCd0xGR3puQ3R5RjRlaUhpQkhCS0JPQjZvWXRSRnAvd3gzUWZVQ2FnU2dO?=
 =?utf-8?B?OUZVeWJLVzJicko1aHljd2F3YmQ0L1krUEdTZHJVdDBQaCt3SCsxdEN6N2dD?=
 =?utf-8?B?cG5vVmlHZUpPMFdjWUhBajFiY3Q0WTNxMlphNzlKNnlnSmk1SnNwbXhGUzBm?=
 =?utf-8?B?cFQ0ajBvMVE3bFFTNllzOTdPdFdIK0tjZmpTQlFrUk4xVzVNRmFhc2ZURER2?=
 =?utf-8?B?b21JQXlSaWNjSythNGJmakVXZEI2aTBlb1l5ZnZyRnpBYXpDY0M2SDBBb0Z0?=
 =?utf-8?B?SlhQK1hjQm5JMjhFbWpVNWthK1JoenNuYXV4REJiZXhNTFIzK0oxSG54TEw4?=
 =?utf-8?B?QnFFUkt6TEphaDR2aXZ5R0Vab01jY3o1MXAvT3ppcnI1NERwdlFEcWtmZXll?=
 =?utf-8?B?aG1WZVB6MGRsWEZIb1NjSXN2UDZYZ1hreW54SmZyR0Q0TFUrWnJSWGdHNEVS?=
 =?utf-8?B?ZG1abXRLaXM0UlIxSVEwKzdRUkZaNmk0Y080eEZ2WmcxT1J3OTFZalhnK0xV?=
 =?utf-8?B?YUxwK0dvbG9QbGlmR0pOL3ZPbTZ0RlN4MDVxQXkvVW9uWkl0SmtMZUgwVU00?=
 =?utf-8?B?NTBzM2lPNE9pUXF3MW5tcWEva3Q0UmtMYlJxY0JJRjk0d0FHT0VBaDlwWHgy?=
 =?utf-8?B?d2dCNWhRSzg0aEVxVDlUMDF0aExNaFF1emVXamlmK3RWalZ2bERncGpHSC9u?=
 =?utf-8?B?cjg3c0FyVG9qRTFHbGV3ZXNCQysxRDJHdHd5QTR4eW9mQUV1OFhHc0VBeXpJ?=
 =?utf-8?B?Y2xVY3pIYkVZNnR3QThSeTA2YmxqcXdreUpTcUVhaEJ4dVpZNFNReFhRWXF6?=
 =?utf-8?B?RmVoTm1kdkZyYXFxb2pYNGE1VzdYRXNQRU5lcmdIcm1UY2pLMG9YQ1NnUElN?=
 =?utf-8?B?Y0FKK3UrODIwVU03OUVpbitGcTg1dTZPMXgrcmxOSjFDd2txL1NqNExhV0kr?=
 =?utf-8?B?TTRhaG5QRFFKWE9Dem5vZmpsQzJHRTR2UjRLeVZXcjJRaWdxOUxoUjZ5NVZs?=
 =?utf-8?B?bEIzalRJNjR0Uk5GYzlQZmJCMnd6VDB0Y2NKSzRId0d2YStPWWJmMUpBVm0x?=
 =?utf-8?B?TjBmRFBXS1l6cWlWYVJMOG1FRkVORHUzdHRUK2l1ZVlTcnlJdXY1Sml0WjBQ?=
 =?utf-8?B?REJ4Rm5jbzJGanBwOUdQdUdvalBlcytDbE15U2ZKd3RWem00TDhMblBYZ3F2?=
 =?utf-8?B?cHpaYUFKeS84WjNmcjRuMEYrbUk4cUhYTk80N2ZCOGxTV3RPNFdSeGx6SWNU?=
 =?utf-8?B?SE1rNjJMbHowaGlZZHFlZGsxaUVnRjRjemxEWGdBYkFKUVBrUFdhTlo1Tk1D?=
 =?utf-8?B?c3dIc21IbHQwc2liNndlaElhand1Rzh1L2l2WVBkbEhQZGordDlLbzBKblVz?=
 =?utf-8?B?eXpGNFZDNWdvc0o2ZVNOU0hPTXZSOWRyelFPYlByUlNzWmlKMUljNUxKU05T?=
 =?utf-8?B?eUIvelU3aVlZMHdKTC9zMENaVDNSZ3BuS2d5b3NLcFYxNnZEL09XUG0zUjAr?=
 =?utf-8?B?ZmhsZkYwUGxnTXBXbHp0OE1QOGdtSmxNZU9UNVJlTUkrVkQwNng3anlaWWJa?=
 =?utf-8?B?U3RSdkw1K2xKZFBUaUwxcmNJMmxCaHRZUWZhQUVPQTd3ck1acFFPVjZxdlhh?=
 =?utf-8?B?d3hIQy9EcUt4T0owM01zU3cybmhleGg3ci9wVjhEK2F1MWovWjhkalhUZWgx?=
 =?utf-8?B?L3g2TlhLNmhCcElwelV6cm5EQlBVejhROGlNNnQ1eHM1TE9jc1dXVEdkRUlM?=
 =?utf-8?B?NzlKRVd1d3h3R1hmZ0lRS1VyNE5QUFRGeGtmNURPcGI3VzNIN3hONC9qNnBN?=
 =?utf-8?B?TDFrbXYyVjlETTdXRnBVYkdBZ1VKdkRMdm5XYnIyNWcvZ1VwSnhNMkE0dG9n?=
 =?utf-8?Q?UGh4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f97d1d-2533-4932-3e71-08dd7b998ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 21:15:54.6261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdhrJvMoi6f02QlktNyEHG0FfsDkDmVj4TsDTQPLbQFcBPszyhUd5lWH6QvKKbzA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDE6
MTUgUE0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzog
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
ciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBNb24sIE1hciAxMCwgMjAyNSBhdCAxMTo0MDowNEFN
IC0wNTAwLCBEYXZpZCBLYXBsYW4gd3JvdGU6DQo+ID4gKz09PT09PT09PT09PT09PSA9PT09PT09
PT09PT09PSA9PT09PT09PT09PT0gPT09PT09PT09PT09PQ0KPiA9PT09PT09PT09PT09PSA9PT09
PT09PT09PT0NCj4gPiArVnVsbmVyYWJpbGl0eSAgIFVzZXItdG8tS2VybmVsIFVzZXItdG8tVXNl
ciBHdWVzdC10by1Ib3N0IEd1ZXN0LXRvLUd1ZXN0DQo+IENyb3NzLVRocmVhZA0KPiA+ICs9PT09
PT09PT09PT09PT0gPT09PT09PT09PT09PT0gPT09PT09PT09PT09ID09PT09PT09PT09PT0NCj4g
PT09PT09PT09PT09PT0gPT09PT09PT09PT09DQo+ID4gK0JISSAgICAgICAgICAgICAgICAgICBY
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWA0KPiA+ICtHRFMgICAgICAgICAgICAgICAgICAg
WCAgICAgICAgICAgICAgWCAgICAgICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgIChOb3Rl
IDEpDQo+ID4gK0wxVEYgICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWCAgICAgICAgICAgICAgICAgICAgICAgKE5vdGUgMikNCj4gPiArTURTICAgICAgICAgICAg
ICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAg
ICAoTm90ZSAyKQ0KPiA+ICtNTUlPICAgICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgWCAg
ICAgICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgIChOb3RlIDIpDQo+ID4gK01lbHRkb3du
ICAgICAgICAgICAgICBYDQo+ID4gK1JldGJsZWVkICAgICAgICAgICAgICBYICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgICAgICAgICAgKE5vdGUgMykNCj4gPiArUkZE
UyAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgICAgICBYICAgICAgICAg
ICAgICBYDQo+ID4gK1NwZWN0cmVfdjEgICAgICAgICAgICBYDQo+ID4gK1NwZWN0cmVfdjIgICAg
ICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAgICAgWA0KPiA+ICtTcGVjdHJlX3YyX3Vz
ZXIgICAgICAgICAgICAgICAgICAgICAgWCAgICAgICAgICAgICAgICAgICAgICAgICAgIFggICAg
ICAgIChOb3RlIDEpDQo+ID4gK1NSQkRTICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICBY
ICAgICAgICAgICAgWCAgICAgICAgICAgICAgWA0KPiA+ICtTUlNPICAgICAgICAgICAgICAgICAg
WCAgICAgICAgICAgICAgICAgICAgICAgICAgIFgNCj4gPiArU1NCIChOb3RlIDQpDQo+DQo+IEFu
eSByZWFzb24gbm90IHRvIHB1dCB0aGUgIk5vdGUgNCIgaW4gdGhlIHNhbWUgY29sdW1uIGFzIHRo
ZSBvdGhlcnM/DQo+DQoNClRoZSBvdGhlciBub3RlcyBhcmUgYWJvdXQgY3Jvc3MtdGhyZWFkIG1p
dGlnYXRpb24gc3BlY2lmaWNhbGx5IGFuZCB0aG9zZSBub3RlcyByZWZlciB0byB0aGUgU01UIGFz
cGVjdHMgb2YgdGhvc2UgaXNzdWVzLg0KDQpOb3RlIDQgaW4gdGhpcyBjYXNlIGlzIGFib3V0IHRo
ZSBTU0IgdnVsbmVyYWJpbGl0eSBpdHNlbGYsIGV4cGxhaW5pbmcgdGhhdCBieSBkZWZhdWx0IHRo
ZXJlIGlzIG5vIG1pdGlnYXRpb24gZm9yIGFueSBjYXNlLiAgSSB3YXMgY29uY2VybmVkIHRoYXQg
aW5jbHVkaW5nIFNTQiBidXQgd2l0aG91dCBhbnkgWCdzIGluIGFueSBvZiB0aGUgY29sdW1ucyB3
b3VsZCBiZSBjb25mdXNpbmcsIHNvIHRoZSBub3RlIGF0dGVtcHRlZCB0byBleHBsYWluIHRoYXQg
dGhlcmUgd2VyZSBubyBkZWZhdWx0IG1pdGlnYXRpb25zIGZvciBTU0IgdW5kZXIgYW55IGF0dGFj
ayB2ZWN0b3IuDQoNCi0tRGF2aWQgS2FwbGFuDQo=
