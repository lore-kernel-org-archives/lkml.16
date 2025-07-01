Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832221CAB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340427; cv=fail; b=rzZJSThJGjauwzYSo/IFqZGtlcdBwj9d14kp3KE7yW2OhQ7lfMlzWkd+Fxw6W218zRnOkkmFcj4udV9PncNJsctqSvrXUf5hocJdcg/+rLyyALFozmlznBTVsUUlPjvZJTqndlpJ6oaJFpsDmz6apyEalVeTpyivGazQk+RP5A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340427; c=relaxed/simple;
	bh=hmSwfO+sksoob2xThvlFIJ5qGQFf9c7b+lHHE8WIYrU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NNSX//mTP6IvS/FND3Re9nBqaWaiYa/nmNOE7qYKX4QXWVfRYo0k+io4EQmYkYmY476c+bwEXPhUqQmxhJ5cT2ge8PfJanMvn8KPiqgnsunMwvibcANEUdo4LAJZKnqeTpRHm62BSNveb3+vx4z6g12SH1HzobX+uwvSDzmznYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RW7NipAw; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RW7NipAw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk2YkfNbcrWaSE41/6bU7z975t3I8byKxB2FAQgQdYkxlWXIvm/BskR7iDfL8JwGreXdGhrSpejV6ftOH5zpelwOTkR3AuQV5QykpUtip3rI3Nexx2DZzLN9tgAn6lqUsEshBh8VAzhRKok1/Yc6LEeJtNScsl1ucugK8A8KcOGhaAx6nv6nyt8ixlzh5IUKkfBUz1U8CYuQLhEvs+c5jNJlyimxXmqWJRfG12Q1BLUgfe14MEFIIx3D5Hy1SokzINixy7ThxwSbHOpClg1GuSxHCa8SIbD6b9rafVgb3AdlqUyjHPXkKT+dziHuvGo6CYoJVTRyTWlm60bmnJOn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmSwfO+sksoob2xThvlFIJ5qGQFf9c7b+lHHE8WIYrU=;
 b=VV+QL5++cqSy5PAXaqHvVO4ynqoyhcqccl4hWY1xNUEF8w3A474rEf4iiRwyN9ROHjRmwyiBjvTfD5HvblqCaikiDjtZyT2Qs5SPzq3Gua8sctZ96InFqgr+4uiOor4ZPdcNSU2eog0sw/bD8tX0jc7sI41c7RIemW4ZO82SzcePGYKjs5CW59RW8RMpKIn5mttid5sPyH2ndm299onKOGuXGajYhHWOtrGHAR5xtCbsonXrvkldL/VlUvIs8SoXMEqOMyHwm5u6L1Z9zBKAEwEt/5MfVBFZUKDiAEgBLos9pO3fGtg8dh+Ge6q+W5UFRc6Bp9saILwseb/iLMdyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmSwfO+sksoob2xThvlFIJ5qGQFf9c7b+lHHE8WIYrU=;
 b=RW7NipAw0nCIOLi9ueMe7o4QccoRc7G+0aVQBobTu+oZ/5Sl76IKiFbn2/IrtvENgyG6hsLtKiWg694YkKGP0sY5butwULaaS4Q62qnU1CowtGHYFpiCoDo1WRYbzugEjORS3G/MTuPNKB2E/WAFmNXSMeEYCdY19JB9S4nTM58=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 03:27:01 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d%6]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 03:27:00 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Thread-Topic: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Thread-Index: AQHb6bxCGIYRDXsOiUKWzLhNR03kULQcmkAA
Date: Tue, 1 Jul 2025 03:27:00 +0000
Message-ID:
 <LV3PR12MB926540104F695798EDD4240C9441A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-15-david.kaplan@amd.com>
 <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
In-Reply-To: <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T03:18:48.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|BL3PR12MB6380:EE_
x-ms-office365-filtering-correlation-id: cebae7f9-0205-4c2b-7929-08ddb84f2464
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFR6VTNEWXY1cnJMYXhoUGhGa3NhODN1UmMvMG5WdFBmUFFrZHR6NEh2bDNS?=
 =?utf-8?B?RGVYcklnQ295aTNiSDlCNHRBNHJ1WE9UTjdPYW5ZZE5nWUlEYTFiK0RsZ0FB?=
 =?utf-8?B?Rk1aQm5UL1dKUXJWN1Z1UkJjaDJ0VW5KSjZVQzhRRmJRMXlPK0pnandOVUFp?=
 =?utf-8?B?bGRhQ1d4SE9yWGxhRGYwTWtGUFAzZ0JIWndENFpxV3ZVQXhZalBFL3RhTXZ4?=
 =?utf-8?B?YTQ4eDd1QkE5WjE3U0UweDlnU0VwNWFYaUZaRHdNZURxZ3MyQTlUVE02UnF4?=
 =?utf-8?B?bVRrYWd0VkxCUWU3T1AyL291WlZVTFgyTmhiVlpoQU0xM1RnVzdDWVlUZDQ1?=
 =?utf-8?B?WGt3eUFOUVJOM25McnBsYmdiSi9IeFBmL0xwVEZJRjJaN0dvdDh4ZmJ6bDRa?=
 =?utf-8?B?Tkx4THYyUUJXTkJKQ01jbWJiQ0NpcXFTWG9OKzZHOCtHTUY5cVZDMjJ6MExj?=
 =?utf-8?B?M0FpME9LVUh6NGZMckRoYnA4eUZ1Zng4WEI5MUdzMWFrMGJvVHJ4c0xZSkc4?=
 =?utf-8?B?ZElqZXBiYStkTEJsREFhTGpjNEw2aGt5bjVhRFpXVVg5UEFuZlNFZWF6bGVY?=
 =?utf-8?B?RkpmR1NENndMNWI4QzR5dyt3SVQvYW5GSnZMa25qNXdjQUQ5Q1QxMDFzdm5P?=
 =?utf-8?B?Z2E2cDZ3QmhNTE5FV1ZhcFlKUmsrclpaNk5JRXh2SHlFSlBJb2VoVWgxaHNW?=
 =?utf-8?B?TXVSRUl3U2J5Uno5WlMrSUtmWld1d1lIalE1OWY0UEE0VHlQT1pKYVNpcm1T?=
 =?utf-8?B?SEV1cjVhNitBYjZvejlUd3gvU1psL09uMTYwc3h6c0pYOWhVd2kwSlo2Z1FB?=
 =?utf-8?B?ZUVmRE5CZzBIcUhVUHhnZXFwbHlkbWpwS1V6RVRGbWJFaDBKZGxKYnlIZUQz?=
 =?utf-8?B?dTUzaUFRNTJ4L1d3RVdzWm5YaHA0T01WSG10elRhWWRwTEdGcjdnRWNBb3ZG?=
 =?utf-8?B?VnIrRE1vbUVEaHF0bnBzRHp4R3B6U1FpY2EvSlVONEI5UUtSb0wrdEljVDFK?=
 =?utf-8?B?R2lmdlpwWjRNRlJka2RFK1M4aDdPdzNxaHg0dmhoaWo1aGI2cklhQTBFN3dM?=
 =?utf-8?B?azl3cFJZNXJ6cmY3eU9iWHI5WkRNUy9FbjRyUE1Mb3YvWlpTOVZQZUQ0OWlN?=
 =?utf-8?B?b01wakVwZ1JReDNpQUNWbUZ4RGdXYStWUENQbkNTbU5iYi9QNk82cjhHNmpw?=
 =?utf-8?B?azRTcHFCVUVBNzhYdEJPSTRGUlZNYWZ6ZHkraGtMVWJRSXQwZnlXbEFyLy9Q?=
 =?utf-8?B?ajVuUU03bjNSd3pxSVJ2S1NDbitEWUtacElCR0dBMC9aL1VpQTRQQUdVdVRZ?=
 =?utf-8?B?enBCMUhRd3JISWxSeFFIOXlWcnlVcWlTMlVuUk8xTFB1Z2xSaFZzOURyOXVG?=
 =?utf-8?B?TVlMSk53ZXlhOERiOFZ2elVELzhlUlkvK0xMMmozb1l2YlRMR3lPbmpEcDZh?=
 =?utf-8?B?bk9lZldzcHVkSC90RHBmb1NhM2Q3MjlESUpVdmVQdHgyMWdIWjI0VmdXSTk3?=
 =?utf-8?B?WW8rWHh5WHRsa2puRnNuVWNucXY1NzBiZ2h0VWk1Ris0UWtsNWMybXQrQzhP?=
 =?utf-8?B?Q2xJZjZMTmFGNTg2aEpBVnRiR1NwT1pjd1ZQQUJrWDd6TDdFMkdQYVdQUFQy?=
 =?utf-8?B?Y1FNMVJyMzl1SFd3NFh0c3BnQXV3UkFTYSswOWZpcVFDMUlNcEV5YVlTSUVv?=
 =?utf-8?B?Q0N4ZDd4QlZYeVVnVmxpV294b3BXTWszdWY5clAwdzBnd005RWp0cVpWZ0Rj?=
 =?utf-8?B?LzF5NnZieWJIZEx5S0dlVlp4bGlteGo2NHR2bUNJbzJHZzJRU3NvQ01rUkZr?=
 =?utf-8?B?R0NsZnlGemRyVGRFanNscDhLK3pKRmdFeVZpT1hGd0YzZUVWNThlVHNWVGo3?=
 =?utf-8?B?TjlFWEtpaStMdVJRVm9UTmdyUTUrZTdYdldSNlpVRm5FRHBGSDcvaXhjcFZ0?=
 =?utf-8?B?TENjVk5FdlQvZTlGZm9JNGFhdVVrc0h0OVJYYTNKYnpWRkpvSVVtR05IVVVz?=
 =?utf-8?Q?Ve2pXP47W3uD1/ZoXD39BuXUWuA6PI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THB3SE5kYWpCSG9RcFlpd3FrTE1QcHAzZ1JGMloxbUt5NFVUL25neGl2SzFw?=
 =?utf-8?B?dVErazRNcEd2WnVXTVVta1IwU2huVWgwd0JINmlDTzd5dnQ1K0wyTkFpWGpp?=
 =?utf-8?B?Vi9QUW5PVUx4elpWUlYzZWhDcmszTTFuQUE0LzNVYkR5MGYxQk52WG4rWUVB?=
 =?utf-8?B?U3VBVUFqUXF1MjRDYklpYnRJcEVDVUMxQk8xWnZGSmVPQVJDN1J1SGlFSGNZ?=
 =?utf-8?B?eTRReGdWUnJ2N1JqN0c3ZUdWcXdMVG8wakpsOThyVFRlTFZReks4MmRlaWlB?=
 =?utf-8?B?eEVIMGtPV0F1N0NpM1U5ZUZIRFllMS80TTMycGo3dTFIVkFHaG1pWlZ0MkV4?=
 =?utf-8?B?ZG1XM0hMdk9rTExsY1dpWlB4T2p6UXIxekFMVStJU01WWjY0WXV4NFlMT0th?=
 =?utf-8?B?TGRxSVBMMEdKaXpaNndrcUFiUk1ITnlpRjB5cUo4NWNFaDhXNFZ5eGczZFFr?=
 =?utf-8?B?R1RTU0UreWNBeFB5emhIcmtSVFNLQXZlM0RPS0VPRW1na2ErNDVJRUxPZ0dt?=
 =?utf-8?B?Y1BtcHNKSkpkVExvd0NpZVh2THdKbHkvbDJMNHpBVmF5QzZhVWcyTmlFUjJO?=
 =?utf-8?B?eC91em1tWk53NmgxK3dZMU80RVZUcEVidGRUazhlY0RIdm9jaWVpdllZVm9p?=
 =?utf-8?B?VTBBTWZlOTJJeDh2cDNHRE9TTGlBd1htdDRDVDZBT3J0Rk9uRGpnZ3ZteWpx?=
 =?utf-8?B?WWZQd0NFU2JIUTFMZGNuMFFVYk9kVGFUVmx3Sy81R1lFWUszUEZhR2lpQkly?=
 =?utf-8?B?T0FEZFJUZ1JhYWl2SjczV1UxcXNtaktQODVrZFgzUzM2UTQvS2lndHBrUlRZ?=
 =?utf-8?B?VnRjTExTZTh3Qmx1dkc0UHpWMWhFOXY5eWthMDV3ZWFEWStNRktHemtUSCtE?=
 =?utf-8?B?dThXT042dEMzNDZVNEVQOWlWKy9YbGxjcGhlaWJCWHpJcE9CK0d1c29YY2g0?=
 =?utf-8?B?b1dZa1M4eXBNendEeWFTS0FTZEZyTUt5TVpFdnFkQ1VOMW1veCtSRHNja1Br?=
 =?utf-8?B?OFBScW5BSkE0cHhjWGpKN1JzUHdJdWpsZ3VrWkxWQkRWRGdmeFZibHBZbk92?=
 =?utf-8?B?YVlad3h1bnJGZnFOUGhoeU5SdzMwTFlQWHlsRGdERjVhYVA5Z2dMd0Jpd0d5?=
 =?utf-8?B?ckk2ZFluTktLYUV4c3Q4enB2cjF6MDAzR0ZTRnFYbjFqa3VFV1lteU84RjdF?=
 =?utf-8?B?ZUNxT1lVVUlpY3FZbmxaek9NOXE5d3gzaU5xODJHOFk2ME82Qy80ckFMSFZN?=
 =?utf-8?B?Z09NUEFxWE54aEMrc3UwQStIbjFBN0VQOHAwQWI4RlA5VjZJN3NsWDZEQ1Mw?=
 =?utf-8?B?L3piMERRNnUrdGRaZFpMdzlsRGhmbFNBSkYzZllPK2V0OFl3K2RSTy9lellB?=
 =?utf-8?B?L2FmRHZsQUFsUzRxZ2dMd2lkQ1BiVlpybVlPK2JGWGoraG5qd0pFbmE0bHFC?=
 =?utf-8?B?Zy8rNjVNYkdYZy9jd0NYQ09PTStuYm1qTlpwbmJvajVyNndmVTMyRi96N2Uz?=
 =?utf-8?B?UnFQNlA4K1hTMGM4c0VBZmZGVm1hMkZzSkdTRFNNNUlncUFjV0lTYzI3UEg5?=
 =?utf-8?B?SSsxSXNmL3RaNk5DeG1HZlZteUIyVlhnQ2JoYlFyUUl5b1R2Z0xXSUs1VXMx?=
 =?utf-8?B?dnVzTHpkOExBaUlyNzhrTlRRWDJLSnpOajZObjZ3V3ZaV3JmMEJIclFZNC9V?=
 =?utf-8?B?dEtPdzhpdHFVK0ZWVnpTODAySlRKYTBieG5zalVPU1M1NDhDdXFCTGRyclNo?=
 =?utf-8?B?NzdhNkVSdEw3TWtvZnZXSjg0ak1kVUlyUERMRkR2Mnl1QU81MCt3U3pGQ1RW?=
 =?utf-8?B?UGRIckE3c09LQXpCUm1USmdqVVlMMFhtZFM2VThCN09jYzVtZEM5ZElXZndh?=
 =?utf-8?B?eTlGSzNEdm9KKzljSk1VM1dpYm80QldRZThRUjJkMUtUdEFuM2M5b3NwUG1Y?=
 =?utf-8?B?V2E0dEU2aXo5cWVTYmZudC9pTUNmckxQWnRzckJEUXJScG94aHFUWUxSVlI4?=
 =?utf-8?B?V3REZktKOGlFY0k1OXRXZk1oMzBlSWp6UU5ZVzhpcllhYVJYRzl6UzNETGZa?=
 =?utf-8?B?aFRWSVVxbWVKbWhlTlVmcWFZbkx2WHBPNGQ0NG5XYXZYc1hWWFdydUUvc2Jz?=
 =?utf-8?Q?nV40=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cebae7f9-0205-4c2b-7929-08ddb84f2464
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 03:27:00.8571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLRWHwxxtK7vrhkeuxQ8F5nuQAv2tln74cbw1zBNMYaWrdY/5AXXZOHew5PHOHnc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDMwLCAyMDI1IDc6NDEgQU0NCj4g
VG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJh
ZGVhZC5vcmc+Ow0KPiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz47IFBhd2Fu
IEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1vbG5h
ciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5p
bnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0b3Iu
Y29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY1IDE0LzIwXSB4ODYvYnVnczogQWRkIGF0dGFjayB2ZWN0b3IgY29udHJvbHMgZm9yIEJISQ0K
Pg0KPiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNv
dXJjZS4gVXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xp
Y2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIEZyaSwgTWF5IDA5LCAyMDI1
IGF0IDExOjI4OjMzQU0gLTA1MDAsIERhdmlkIEthcGxhbiB3cm90ZToNCj4gPiBUaGVyZSBhcmUg
dHdvIEJISSBtaXRpZ2F0aW9ucywgb25lIGZvciBTWVNDQUxMIGFuZCBvbmUgZm9yIFZNRVhJVC4N
Cj4gPiBTcGxpdCB0aGVzZSB1cCBzbyB0aGV5IGNhbiBiZSBzZWxlY3RlZCBpbmRpdmlkdWFsbHkg
YmFzZWQgb24gYXR0YWNrDQo+ID4gdmVjdG9yLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgS2FwbGFuIDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC94ODYv
a2VybmVsL2NwdS9idWdzLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMgYi9h
cmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYw0KPiA+IGluZGV4IDMwNWExMWZhOTUyMS4uNjY3Mzg1
ODA4NDAwIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+ID4g
KysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMNCj4gPiBAQCAtMTkwNSw4ICsxOTA1LDkg
QEAgc3RhdGljIGJvb2wgX19pbml0IHNwZWNfY3RybF9iaGlfZGlzKHZvaWQpDQo+ID4gIGVudW0g
YmhpX21pdGlnYXRpb25zIHsNCj4gPiAgICAgICBCSElfTUlUSUdBVElPTl9PRkYsDQo+ID4gICAg
ICAgQkhJX01JVElHQVRJT05fQVVUTywNCj4gPiAtICAgICBCSElfTUlUSUdBVElPTl9PTiwNCj4g
PiArICAgICBCSElfTUlUSUdBVElPTl9GVUxMLA0KPiA+ICAgICAgIEJISV9NSVRJR0FUSU9OX1ZN
RVhJVF9PTkxZLA0KPiA+ICsgICAgIEJISV9NSVRJR0FUSU9OX1NZU0NBTExfT05MWQ0KPg0KPiBX
ZSB1c3VhbGx5IGNhbGwgdGhvc2UgVVNFUl9LRVJORUwgb3Igc28uLi4NCg0KV2FzIGZvbGxvd2lu
ZyB0aGUgZXhpc3RpbmcgcGF0dGVybiB3aXRoIFZNRVhJVF9PTkxZLiAgQnV0IEkgY291bGQgcmVu
YW1lIHRoZXNlIHRvIFVTRVJfS0VSTkVMIChmb3IgdGhlIFNZU0NBTEwgb25lKSBhbmQgR1VFU1Rf
SE9TVCAoZm9yIHRoZSBWTUVYSVQgb25lKSBpZiBkZXNpcmVkLi4uDQoNCj4NCj4gQnV0IEkgZG9u
J3QgdGhpbmsgeW91IG5lZWQgaXQuIFRoZSByZW5hbWUgdG8gX0ZVTEwgaXMgb2sgYnV0IHRoZSBy
ZXN0IGNvdWxkDQo+IGxvb2sgbGlrZSB0aGlzOg0KPg0KDQpFaCwgSSdtIG5vdCBhIGJpZyBmYW4g
b2YgdGhhdC4gIEl0J3MgYmFzaWNhbGx5IG92ZXJsb2FkaW5nIGFuIGV4aXN0aW5nIG1pdGlnYXRp
b24gc2V0dGluZyB3aXRoIGEgbmV3IG1lYW5pbmcgZGVwZW5kaW5nIHNvbWV0aGluZyBlbHNlLiAg
VGhhdCdzIHVubmVjZXNzYXJpbHkgY29tcGxleCBpbW8sIGFuZCBpbiB0aGlzIGNhc2UgaXMgYWN0
dWFsbHkgaW5jb3JyZWN0LiAgVGhlIGF0dGFjayB2ZWN0b3JzIGFyZSBzdXBwb3NlZCB0byBiZSBs
b3dlciBwcmlvcml0eSB0aGFuIGJ1Zy1zcGVjaWZpYyBjb21tYW5kIGxpbmUgb3B0aW9ucyAoYXMg
YXR0YWNrIHZlY3RvcnMgYXJlIGdlbmVyaWMpLiAgU28gaWYgeW91IHBhc3MgaW4gInNwZWN0cmVf
YmhpPXZtZXhpdCIgZm9yIGluc3RhbmNlLCB0aGF0IHNob3VsZCBvbmx5IG1pdGlnYXRlIGJoaSBm
b3Igdm1leGl0LCBldmVuIGlmIHlvdSBoYXZlIGdlbmVyYWwgdXNlci0+a2VybmVsIHByb3RlY3Rp
b25zIGVuYWJsZWQuICBUaGUgY29kZSBiZWxvdyBhcHBlYXJzIHRvIG5vdCBvYnNlcnZlIHRoYXQg
Y29ycmVjdGx5Lg0KDQpUaGF0IGlzc3VlIGFzaWRlLCB0aGUgZW51bXMgSSBiZWxpZXZlIHNob3Vs
ZCBpZGVhbGx5IG1hcCB0byBzcGVjaWZpYyBtaXRpZ2F0aW9uIGRlY2lzaW9ucy4gIFRoZXJlIGFy
ZSB0d28gcG90ZW50aWFsIG1pdGlnYXRpb25zIGZvciBCSEksIHNvIGl0IG1ha2VzIHNlbnNlIHRv
IGhhdmUgbWl0aWdhdGlvbiBjaG9pY2VzIGZvciBhbGwgNCBwb3RlbnRpYWwgb3V0Y29tZXMuDQoN
Ci0tRGF2aWQgS2FwbGFuDQoNCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVn
cy5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMNCj4gaW5kZXggMzJlZGYwYjhhNDk1Li42
MjRkOGQ3NjZkY2EgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+
ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+IEBAIC0yMDk2LDcgKzIwOTYsNyBA
QCBzdGF0aWMgYm9vbCBfX2luaXQgc3BlY19jdHJsX2JoaV9kaXModm9pZCkNCj4gIGVudW0gYmhp
X21pdGlnYXRpb25zIHsNCj4gICAgICAgICBCSElfTUlUSUdBVElPTl9PRkYsDQo+ICAgICAgICAg
QkhJX01JVElHQVRJT05fQVVUTywNCj4gLSAgICAgICBCSElfTUlUSUdBVElPTl9PTiwNCj4gKyAg
ICAgICBCSElfTUlUSUdBVElPTl9GVUxMLA0KPiAgICAgICAgIEJISV9NSVRJR0FUSU9OX1ZNRVhJ
VF9PTkxZLA0KPiAgfTsNCj4NCj4gQEAgLTIxMTEsNyArMjExMSw3IEBAIHN0YXRpYyBpbnQgX19p
bml0IHNwZWN0cmVfYmhpX3BhcnNlX2NtZGxpbmUoY2hhciAqc3RyKQ0KPiAgICAgICAgIGlmICgh
c3RyY21wKHN0ciwgIm9mZiIpKQ0KPiAgICAgICAgICAgICAgICAgYmhpX21pdGlnYXRpb24gPSBC
SElfTUlUSUdBVElPTl9PRkY7DQo+ICAgICAgICAgZWxzZSBpZiAoIXN0cmNtcChzdHIsICJvbiIp
KQ0KPiAtICAgICAgICAgICAgICAgYmhpX21pdGlnYXRpb24gPSBCSElfTUlUSUdBVElPTl9PTjsN
Cj4gKyAgICAgICAgICAgICAgIGJoaV9taXRpZ2F0aW9uID0gQkhJX01JVElHQVRJT05fRlVMTDsN
Cj4gICAgICAgICBlbHNlIGlmICghc3RyY21wKHN0ciwgInZtZXhpdCIpKQ0KPiAgICAgICAgICAg
ICAgICAgYmhpX21pdGlnYXRpb24gPSBCSElfTUlUSUdBVElPTl9WTUVYSVRfT05MWTsNCj4gICAg
ICAgICBlbHNlDQo+IEBAIC0yMTIzLDExICsyMTIzLDExIEBAIGVhcmx5X3BhcmFtKCJzcGVjdHJl
X2JoaSIsDQo+IHNwZWN0cmVfYmhpX3BhcnNlX2NtZGxpbmUpOw0KPg0KPiAgc3RhdGljIHZvaWQg
X19pbml0IGJoaV9zZWxlY3RfbWl0aWdhdGlvbih2b2lkKQ0KPiAgew0KPiAtICAgICAgIGlmICgh
Ym9vdF9jcHVfaGFzKFg4Nl9CVUdfQkhJKSB8fCBjcHVfbWl0aWdhdGlvbnNfb2ZmKCkpDQo+ICsg
ICAgICAgaWYgKCFib290X2NwdV9oYXMoWDg2X0JVR19CSEkpKQ0KPiAgICAgICAgICAgICAgICAg
YmhpX21pdGlnYXRpb24gPSBCSElfTUlUSUdBVElPTl9PRkY7DQo+DQo+ICAgICAgICAgaWYgKGJo
aV9taXRpZ2F0aW9uID09IEJISV9NSVRJR0FUSU9OX0FVVE8pDQo+IC0gICAgICAgICAgICAgICBi
aGlfbWl0aWdhdGlvbiA9IEJISV9NSVRJR0FUSU9OX09OOw0KPiArICAgICAgICAgICAgICAgYmhp
X21pdGlnYXRpb24gPSBCSElfTUlUSUdBVElPTl9GVUxMOw0KPiAgfQ0KPg0KPiAgc3RhdGljIHZv
aWQgX19pbml0IGJoaV91cGRhdGVfbWl0aWdhdGlvbih2b2lkKQ0KPiBAQCAtMjE2MCwxNSArMjE2
MCwxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYmhpX2FwcGx5X21pdGlnYXRpb24odm9pZCkNCj4g
ICAgICAgICBpZiAoc3BlY19jdHJsX2JoaV9kaXMoKSkNCj4gICAgICAgICAgICAgICAgIHJldHVy
bjsNCj4NCj4gLSAgICAgICBpZiAoYmhpX21pdGlnYXRpb24gPT0gQkhJX01JVElHQVRJT05fVk1F
WElUX09OTFkpIHsNCj4gLSAgICAgICAgICAgICAgIHByX2luZm8oIlNwZWN0cmUgQkhJIG1pdGln
YXRpb246IFNXIEJIQiBjbGVhcmluZyBvbiBWTSBleGl0IG9ubHlcbiIpOw0KPiArICAgICAgIC8q
IE1pdGlnYXRlIEtWTSBpZiBndWVzdC0+aG9zdCBwcm90ZWN0aW9uIGlzIGRlc2lyZWQgKi8NCj4g
KyAgICAgICBpZiAoYmhpX21pdGlnYXRpb24gPT0gQkhJX01JVElHQVRJT05fRlVMTCB8fA0KPiAr
ICAgICAgICAgICBiaGlfbWl0aWdhdGlvbiA9PSBCSElfTUlUSUdBVElPTl9WTUVYSVRfT05MWSkg
ew0KPiAgICAgICAgICAgICAgICAgc2V0dXBfZm9yY2VfY3B1X2NhcChYODZfRkVBVFVSRV9DTEVB
Ul9CSEJfVk1FWElUKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybjsNCj4gKyAgICAgICAgICAg
ICAgIHByX2luZm8oIlNwZWN0cmUgQkhJIG1pdGlnYXRpb246IFNXIEJIQiBjbGVhcmluZyBvbiBW
TSBleGl0XG4iKTsNCj4gICAgICAgICB9DQo+DQo+IC0gICAgICAgcHJfaW5mbygiU3BlY3RyZSBC
SEkgbWl0aWdhdGlvbjogU1cgQkhCIGNsZWFyaW5nIG9uIHN5c2NhbGwgYW5kIFZNIGV4aXRcbiIp
Ow0KPiAtICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfQ0xFQVJfQkhCX0xP
T1ApOw0KPiAtICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfQ0xFQVJfQkhC
X1ZNRVhJVCk7DQo+ICsgICAgICAgLyogTWl0aWdhdGUgc3lzY2FsbHMgaWYgdXNlci0+a2VybmVs
IHByb3RlY3Rpb24gaXMgZGVzaXJlZCAqLw0KPiArICAgICAgIGlmIChiaGlfbWl0aWdhdGlvbiA9
PSBCSElfTUlUSUdBVElPTl9GVUxMIHx8DQo+ICsgICAgICAgICAgIGNwdV9hdHRhY2tfdmVjdG9y
X21pdGlnYXRlZChDUFVfTUlUSUdBVEVfVVNFUl9LRVJORUwpKSB7DQo+ICsgICAgICAgICAgICAg
ICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX0NMRUFSX0JIQl9MT09QKTsNCj4gKyAg
ICAgICAgICAgICAgIHByX2luZm8oIlNwZWN0cmUgQkhJIG1pdGlnYXRpb246IFNXIEJIQiBjbGVh
cmluZyBvbiBzeXNjYWxsXG4iKTsNCj4gKyAgICAgICB9DQo+ICB9DQo+DQo+ICBzdGF0aWMgdm9p
ZCBfX2luaXQgc3BlY3RyZV92Ml9zZWxlY3RfbWl0aWdhdGlvbih2b2lkKQ0KPg0KPiAtLQ0KPiBS
ZWdhcmRzL0dydXNzLA0KPiAgICAgQm9yaXMuDQo+DQo+IGh0dHBzOi8vcGVvcGxlLmtlcm5lbC5v
cmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlDQo=
