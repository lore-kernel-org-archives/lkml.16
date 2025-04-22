Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62203200BBC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332332; cv=fail; b=BWAq6RXeZG4U8J2rinyCCvCZXlomsgCpe3r3SjFAueXahxiU8TGJ8zWpBVtmGK/HDDmYkLtggu+WiiUDlSUj/HPLqQ7VorGQgdRN7wOPIUM5PDZfUTLo93ugwUPjPOHzD3z2DeuQe3gsaVdfDRHJW/z2gkl8mvv4QqrWdIgfBs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332332; c=relaxed/simple;
	bh=zX8wEilcjO7IX+nFFSe0QAsEN1qTD6Ms+1klpXLYZNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RbA9cvE9Jv8e3HHrxMDCpqzPQjyZ9KTCacyFiYNKGdB9AU9vqM9vl+yTyPbY0CnAESZcDn0AXsxPUIReGi4RFnKBqPpTTWox4p3LVgoP4FjC1azTUqDvePEgUa8YiYdkzImNbWwFtaStFXbIuOUImfIeF0C6gBzajelL6jS5bLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sF5Znizp; arc=fail smtp.client-ip=40.107.244.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sF5Znizp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jux/2f4SP3BI0pt9Zw99NnZ/psnpHJ5mk3zrSFGULuvpTF+fdIj2ZNieyNAkULNIPb6eF7l9d7geR+HzjgPKvhYmndu9EXbk1bHECddTiaykRTeKlHdk2NyR5H5FKYyOhPvOdnAc36f9Y8vmS/fJ0qWgz7P7SUIAETUrstyUbrbxou3JKKcsigeBrjYqq1CFCRgamOj2INvO1QbOQhlzDb7IXXUGv0dy0gnNH/yie27XHEq2qL2qdEyDiso1hcozIEhSo4nZfA38AW89X52RjzElgjPQypAScM4fpzNOozRjTFG1N+Sq317sQHiZshjkzuBLPHIELku6mp7kuKr11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX8wEilcjO7IX+nFFSe0QAsEN1qTD6Ms+1klpXLYZNk=;
 b=RTyVlNezM3chzUwSLGgVolhUhS7+HiXSm0TRNtj6ueNwE8TwkHNYH6Tp3jNKaGfFRQ8ZzOsu13TukKcWvC2XPZ4FNHpCK2KHdwezprU5zMJ6FTYfpjgh6/3CbdOxlydfO1uv/iTbsJdqjhTHNZGIY4tt1nd1Qu3SREDfk1puOONMJHzIB8uV5mMBeKZ5HdzwAA4KL/KTLIylzPJnV3hIRMB7VVMgl/UjQ+EeOzUXukgEINTaS3oJVZTDGdfBQNfHZdJaAZg3IA1eZrrDS4AmX0OGt+OZXkDqvZQ+OMrfs1XLjAWr7xE1Gn3oCxwNdrUdNPpRgMo6jfHf2p0EQfkK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX8wEilcjO7IX+nFFSe0QAsEN1qTD6Ms+1klpXLYZNk=;
 b=sF5ZnizpRk4WqZdvLSwUCd9iHolUT/rzVdtlWblFgo6bkX7CP+k/HgFHZVrhfqrPkO3RwJ9XF0L7Zl3YqmPxIkfyw8OmITSGGv6/UhGoZLrGRY4OzMjTNh8F5dPQ+B0RdWw/TwEyPG+6hEQgvqmuqrMbuyRs14JA8Ig03v5Bof4=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 14:32:07 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:32:07 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Thread-Topic: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Thread-Index: AQHbsKKBzwkbgMKk8021AI3EyLQfdrOtCo8wgAJSk4CAAGEscA==
Date: Tue, 22 Apr 2025 14:32:07 +0000
Message-ID:
 <LV3PR12MB926519BA499E7648F97B569794BB2@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-2-david.kaplan@amd.com>
 <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
 <LV3PR12MB9265B16CFC9D3E02C1159DEA94B92@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250422081901.GAaAdQ9aB5KTI5INO7@renoirsky.local>
In-Reply-To: <20250422081901.GAaAdQ9aB5KTI5INO7@renoirsky.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=4dab6c75-528e-4039-b2ec-848adb7a7db7;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-22T14:06:48Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA1PR12MB6750:EE_
x-ms-office365-filtering-correlation-id: 299e69d1-d6e8-4b0d-b697-08dd81aa7580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUg1QzZMTXNLMzVIRWsxUEpYSWdnZHJBUVdEM05IMWJnUGNUb0N6bWxySFhT?=
 =?utf-8?B?KyttVEdxNnFObkJWM0NqTkJEOWorV0xTOEVUWm81b2xCQjZEODYwNnFFV3BN?=
 =?utf-8?B?cFVGV1NBSGlVekd1WEs0OXAwbHlKRG5jWkEvc3QrZEsvaEVwdG1OZDF0ZjIv?=
 =?utf-8?B?bHNVd2VWUWZON08ra0U2MTMzS0VGMURXekErK2RYMW5meTdjakFRTDhtdjY5?=
 =?utf-8?B?cXhxZTZJcS9obmlLYzJlOUhFS0dmUFkzUGJPMVhSd1lSK2dHL0xKUFhUcUZG?=
 =?utf-8?B?eTNyL3pIdFlDN0R4NDhiWHNkTHY2OUgwV3NjOElqN2ZHSTd3bDdjT2gyU3Q0?=
 =?utf-8?B?MzJCMHlGdFIvZVFlWmtHY0FKUHJwK2hxWGdwWXJGUDN6eDRWN0VFdmdSNXNy?=
 =?utf-8?B?SnhDb1gvS1ZWWDltQUMzYmVkYmNjQXV0Y3ljTnZ1YjNrSndDdkFQL2dGV1Ja?=
 =?utf-8?B?NlIvWGFEWFA0UDZOWk1BSWR6UHh0bXNJMFlNSUQ3eEVOWVV3SG5pRW50cERX?=
 =?utf-8?B?OUJwbW4vWVA5MjN1c1o1S0ZNMk5YcXgyVnVVdkQ3WTVkU3BZbDEvbTVKR1RU?=
 =?utf-8?B?K1hJU2ZlVUJRL0ZUOTdvYjJscGhNRUNFWTVZTGU3MWhleXFVSEU2SlZDbFRU?=
 =?utf-8?B?K2toUTlSblRJR05TWk0zSzlNcDc1bkt6NlRRQ2JzYmRJWFJTd2pybmZ5Y0h5?=
 =?utf-8?B?TFlOb0dqYVJQeUVqT2RZbXRMQ25MSFVsajIya2NBb3MvMUFKcjI1WklrM1Na?=
 =?utf-8?B?bEZiemVTMnlub3U3Y0lvODg2RFBOVkNQR0hPZCtXM0ZkVTFHTWpOR29ieGxq?=
 =?utf-8?B?dy9TVTQ3bjVtNTZQT2xleitRMVVsK2gxRXN0WWQxVU9UZ3NsSHl1d3ROOGJw?=
 =?utf-8?B?K1Q1VExEQWIxS1hwZTFkM1kyUEhwRnVPaEdTUkwrak9vdXo4UUh4L3FsUTJD?=
 =?utf-8?B?WEJDcElJS0Y0VTJCdVQvZ3Y0K2VQbWprdmJ3aWhRbU0yTUNFWU1aVndKZG5Z?=
 =?utf-8?B?c0VIbUIxenJ4ZW1manQrR3d3ZCtmNnMvTDdGTnI5ZEp0WmVtQ0FMaFV3RmhC?=
 =?utf-8?B?Sytia2FVcmE2U3B2aTdCYXdBUnkyN0c2R2VCWlA0eFJERWh1V1h5eEU4UzRO?=
 =?utf-8?B?dHJtS1BROXRsRnVjUkc2QjQ4alByZlc3VVZoL1NoMVo0cGtaOXRRL25Ya28z?=
 =?utf-8?B?czBHejVRdzNETFJDdzA1aFFSRDJ6QUZubHZRNXlKM3V0aTNjbXdrbG9FUWZY?=
 =?utf-8?B?WTZ3bXg1bVVEZWR5M0tncXlSOHhmYk5vMm1PTFNQWXNRM1ErRkhjVHRENUFD?=
 =?utf-8?B?STNNRXlhZlJiNnI4TXFGQ2lyY1ZSZXBLMm5SdmczRkloRVo0TWJkeVhiTEpF?=
 =?utf-8?B?VGw1TXA3S3RGRnRMaFpKaDc5LzBRajhhSCtYS0pXazE2YUc4Ukp1ZkxhbDMx?=
 =?utf-8?B?eU5zR25JdlpaWWNzTUMxQVlDRzRzanUvajVEK2JNRDFtdnhQLzRyUnBaeEU2?=
 =?utf-8?B?SFVzd3NYOEZVYmZBTzVkWDVmZDZWbVNSdzd5aEk4OWNuVkVnZWV4cUtqZ3kv?=
 =?utf-8?B?RlVhZFUwRUg4WlVsZHJBL1lGMmhlVEcyUGdUam4zd1E3QlRFeno3TmN3V1J3?=
 =?utf-8?B?RG83aHJBQVpDUkFqQzlxVnhXZ3ZFclgyZEl1alVEV2IrYk1wQUtkUEpVYmJr?=
 =?utf-8?B?ditPUFp5eksrWWdXWWY2Q1o3enYzQXcrTG9ZbmJSY3pIRld4UzJNWG5lN1Vq?=
 =?utf-8?B?ampuUnJQTitNdzZrc1J3Y1BNZHBGeExQdlU5TUxOSXFYUXdZUmR3K1lzbExX?=
 =?utf-8?B?bHNYOVcyU1JIN3Brc28vTUNOWkNSNVVTSU9lZUJRYUVITG1zanlOWExWT2d4?=
 =?utf-8?B?NnlSNDMyaUhYcEU1MElzWElzR0J3ZzU0dWRVb1IydTh0b21BWVdmL3FiMldD?=
 =?utf-8?B?eG41NFhnQmZiVUV0SWs5QklHKzZGaTByKzVKN2J2WmZCWUd2RjN4QWdFejZ3?=
 =?utf-8?Q?ddTeaiiZpBRdgtP2Cu3h85nMUjX8kw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmRScEtUWGI2UkVnVHlzZzZDUXQweGRNQ1A4QlNlRkFvd0czVm5tOXJaZFBN?=
 =?utf-8?B?cWliNkl5ZlQ1cnRhZzZoYWhxczRQL3h2UmVTQWM1RlNXSzNzKzdHMC9LUmhl?=
 =?utf-8?B?N3Q4OU5IelhubWVsQ1g2cHp5NG01UDR5bXAxTlBVMzVDZHBlckJVcTNMK2tr?=
 =?utf-8?B?TiszTWxkeEZMNHBnYWRwaUdEMVRwbkFXWElBNXh1ZVlGVy90a1FVaVFmZWRw?=
 =?utf-8?B?SVBPeXEwajBWdHQ2TlZHUWdrRG9nY0RiYy9XQXZwcWFmTFBNS1hCanhkM3pM?=
 =?utf-8?B?Z2NhdlhlcnFwVHdKM2FqRnFRWEh0ZHMweVVNTFNvVnhjdXZIUjNrV01FMUNF?=
 =?utf-8?B?dFdQcFRRSmFWbURYdytxWjBBZ2hkWXduYk5SaUt1cHJrWDRqVnl3SHZqUTdR?=
 =?utf-8?B?QXl3b2Z6WG5NQVFQM3VPUjNQbGxKMXZvTWgwRGlvTHdHWTVxY3lEY1FGYm1F?=
 =?utf-8?B?ZUFJZ3JkTTQzV1N3NVJSNnB4NTc5TjRPL0hZdEYzOWtiaWRTbndyditaTjlH?=
 =?utf-8?B?RG5wTXpwbkE2VVFrSEY3clNMbUFQUUltT24yTTVRSC9uUVRPNWFNS20yMURm?=
 =?utf-8?B?MFZ2dzdKM281ZGtDZEh5MnUvdnVNZ1pzRDVUQTZDdytHK3dKRlR4d09abWE0?=
 =?utf-8?B?anpWS0I3dkZmWXcwZjljRWIvcVZQQ2FZd21aSmdkU1ROWlRrdnRLM2graUFz?=
 =?utf-8?B?dVBCYnF1YytnVDI2Z3N6MVZQY1N6TEZ1WU5DVlFLd21qSlFRN1Qyd0xtaW5D?=
 =?utf-8?B?YVJPMVNrSnZFR0VmV0o1Zi9icFArdjJMQVgvOXRqdHRkL2FzcWhIS2M0UFNM?=
 =?utf-8?B?VXB4dXpEVFBnSFZxU20vQ0NCYjBPVkZxMkNTeURJdWVhcFJ6MTgzS2dCL1dj?=
 =?utf-8?B?RGdTMmc0SkJuVFBzRisyZVF5SlpiNGxWekNVdlBoTENPbzFXS1hUMDVpalI5?=
 =?utf-8?B?Y1owWVNDa2orNWVTRUwxZytIWjFqZkp6WUFEMDVUdEFPU0VFWW5yQjFjaTlE?=
 =?utf-8?B?R0xvakgxTWcrTm1QRDBjakpwbittS3hGNG5tUlhWRDZnTElUaUU3L2xwZzJ6?=
 =?utf-8?B?aXJaQXZ1NmdJOS9ndjN3MFZNMGF4NFlSTmlQWDNhMjJFbFJscHoxa2dyc0xy?=
 =?utf-8?B?dmlUNUNzakF4b25zQkhsQlgwYWtLTTJxYUlYbzdOY3FhZzdMMDMreCtmdkY1?=
 =?utf-8?B?Yy9CY3FSSy9LZHNDbHV2SWV6eXRrZDVQWWdZMEFXZzBwWEZxbGR6c0tnLy9j?=
 =?utf-8?B?emhydkx4dzhpdVJVRUFWbzM4bEhyNDBDdUZYMlVoMUxwTTJJR0FSYjZVbWgz?=
 =?utf-8?B?ZVlsaFdpWU00VEsvSHdsTEJZMVNzODdmVTNXK2VRWGE4MXdZSnJLUitUYm0w?=
 =?utf-8?B?S256SS9TclJjd3diam9xamxrcGN3Qk4xd2JiUGxRd1g5THJ2SEZlWEVncUcy?=
 =?utf-8?B?ZTAzSGNpellmRGZuNG8weG9Ea01manp3UUsyeFlMY1NMeVRucnZzMUxHYytO?=
 =?utf-8?B?OVRFbmh4NFgxL0hzSUsxaHJwOEVueSs4c3FEb0xtOFl2M042Uk5jc0FudFF3?=
 =?utf-8?B?VTlDZXNsZ1g5TTdNaWtBYVd1KzB2S0x5bGMvNUlKV2hrK0RBbGtseFFJNnB5?=
 =?utf-8?B?TEptZmF4UXBUcWQ4cHlTN1FnazRibGhVVmQ3WDVsakZSSjF2Um4rejN5OG5Z?=
 =?utf-8?B?UmZQYkZ6ZXE3aXVGbVd4RjJNK1FHTXlYbWhWL1FBU1Y2dmd0Z0RpNytQYUo5?=
 =?utf-8?B?MEZHbk1IOFFFVEIzOFZ1RmVWZmRrbi8xUTljMXozYWpZaGhqbGVVdUVteVhR?=
 =?utf-8?B?eFpjTTM2dzh3dlFzSDVpbGZIaHZqcVVqTk5CeWdkRkVmYUx4dWhFWUYzTmpQ?=
 =?utf-8?B?c2JNTXp3dEMyMEZ4L2RTZTlYSU53dWNrZHFQdjNQb2Q4Z0t1bVNaeGtpK014?=
 =?utf-8?B?U1BCZUlINUpMUXh6NDJWTFZ5REIyMmpQSWRTZTBJWVNzc09DQzQ0UFlVcW9j?=
 =?utf-8?B?cEViRHcvSDZJK2djRGpJbE90YmlXK0tqSThjUnJ6QkpzL2FqNVNhWXhFUUty?=
 =?utf-8?B?QzJod1B2MEt3ZVUvZlpqZm5KOEtZeU9lY0R6UkpmMG4raXFGbzVGUklDV1My?=
 =?utf-8?Q?d/Z0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 299e69d1-d6e8-4b0d-b697-08dd81aa7580
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 14:32:07.1858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gC80nZXMGdi/UIHO8M+/ZFF+WZRJ8EKbFIK8WZ2OvQXL8wpouAnR4lhUKQRqdPSJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMjIsIDIwMjUgMzoxOSBBTQ0K
PiBUbzogS2FwbGFuLCBEYXZpZCA8RGF2aWQuS2FwbGFuQGFtZC5jb20+DQo+IENjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT47IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz47DQo+IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3
YW4gR3VwdGENCj4gPHBhd2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9s
bmFyIDxtaW5nb0ByZWRoYXQuY29tPjsgRGF2ZQ0KPiBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4
LmludGVsLmNvbT47IHg4NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRv
ci5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMDEvMTZdIHg4Ni9idWdzOiBSZXN0cnVjdHVyZSBNRFMgbWl0aWdhdGlvbg0KPg0KPiBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIFN1biwgQXByIDIwLCAyMDI1IGF0IDA5
OjAwOjU2UE0gKzAwMDAsIEthcGxhbiwgRGF2aWQgd3JvdGU6DQo+ID4gSSdtIG5vdCBzdXJlIHRo
aXMgaXMgcmlnaHQsIGl0IGNlcnRhaW5seSBkaXZlcmdlcyBmcm9tIHVwc3RyZWFtIHdoZXJlDQo+
ID4gbWRzIGlzIG9ubHkgbWFya2VkIGFzIG1pdGlnYXRlZCBpZiB0aGUgQ1BVIGlzIGFjdHVhbGx5
IHZ1bG5lcmFibGUgdG8NCj4gPiBtZHMuICBJIGFsc28gdGhpbmsgdGhhdCBpbW8gaXQgZ2VuZXJh
bGx5IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gbWFyayBhDQo+ID4gYnVnIGFzIG1pdGlnYXRlZCBp
ZiB0aGUgQ1BVIGlzbid0IHZ1bG5lcmFibGUgKHNlZW1zIHRvIGluY3JlYXNlIHJpc2sNCj4gPiBv
ZiBmdXR1cmUgYnVncyBpbiB0aGUgbG9naWMpLg0KPg0KPiBIbW0sIGl0IHN0aWxsIGxvb2tzIHdl
aXJkIHRvIG1lLiBTbyBsZXQncyBpbWFnaW5lIHRoZSBDUFUgaXMgTk9UIGFmZmVjdGVkIGJ5IE1E
Uy4NCj4gVGhlIHNlbGVjdCBmdW5jdGlvbiB3aWxsIGxlYXZlIGl0IHRvIE9GRi4NCj4NCj4gVGhl
biwgc29tZSBvdGhlciBzZWxlY3QgZnVuY3Rpb24gd2lsbCBzZXQgdmVyd19taXRpZ2F0aW9uX3Nl
bGVjdGVkLg0KPg0KPiBOb3csIHRoZSBtZHNfdXBkYXRlX21pdGlnYXRpb24oKSBjb21lcyBpbiwg
WDg2X0JVR19NRFMgaXMgc3RpbGwgTk9UIHNldCBzbw0KPiB3ZSBsZWF2ZSBtZHNfbWl0aWdhdGlv
biB0byBPRkYgZXZlbiB0aG91Z2ggaXQgKnRlY2huaWNhbGx5KiBnZXRzIG1pdGlnYXRlZD8NCj4N
Cj4gSSBndWVzcyB0aGUgcmVwb3J0aW5nIGFzcGVjdCBkb2VzIG1ha2Ugc2Vuc2UgLSB3ZSBkb24n
dCB3YW50IHRvIHN0YXJ0IHJlcG9ydGluZw0KPiBNRFMtdW5hZmZlY3RlZCBDUFVzIGFzIGJlaW5n
IE1EUyBtaXRpZ2F0ZWQgYmVjYXVzZSB0aGV5J3JlIG5vdA0KPiAtIG5vdCByZWFsbHkuIFdlIGp1
c3QgdXNlIHRoZWlyIG1pdGlnYXRpb24gdG8gbWl0aWdhdGUgb3RoZXIgdnVsbnMuDQo+DQo+IFRo
ZW4gdGhpcyBjb21tZW50IHdoaWNoIGV4cGxhaW5zIHRoZSBsb2dpYyBvZiB2ZXJ3X21pdGlnYXRp
b25fc2VsZWN0ZWQ6DQo+DQo+ICAgICAgICAgLyogSWYgVEFBLCBNTUlPLCBvciBSRkRTIGFyZSBi
ZWluZyBtaXRpZ2F0ZWQsIE1EUyBnZXRzIG1pdGlnYXRlZCB0b28uICovDQo+DQo+IHNob3VsZCBw
cm9iYWJseSBzYXkgdGhhdCBpZiB0aGUgQ1BVIGlzIGFmZmVjdGVkIGJ5IE1EUyAqaW4gYW55IHdh
eSoNCj4gLSB0aGUgQlVHIGJpdCBpcyBzZXQgLSB0aGVuIGl0IGdldHMgZnVsbCBtaXRpZ2F0aW9u
Lg0KPg0KPiBBbmQgdGhpcyBzaG91bGQgYmUgdGhlIGNhc2UgZm9yIGFsbCBpbnRlci1yZWxhdGVk
IFZFUlcgbWl0aWdhdGlvbnM6IGlmIHRoZSBDUFUgaXMgaW4NCj4gYW55IHdheSBhZmZlY3RlZCwg
aXQgZ2V0cyBtaXRpZ2F0ZWQgdG9vLiBJZiBpdCBpcyBub3QsIHRoZW4gaXQgZ2V0cyBvbmx5ICpy
ZXBvcnRlZCogdGhhdCBpdA0KPiBpcyBub3QgYWZmZWN0ZWQgYnV0IHRoZSBtaXRpZ2F0aW9uIHRl
Y2huaXF1ZSBjYW4gYmUgdXNlZCBmb3Igb3RoZXJzLg0KPg0KPiBEb2VzIHRoYXQgbWFrZSBzZW5z
ZT8NCj4NCg0KSSB0aGluayB0aGF0J3MgY29ycmVjdCwgYWx0aG91Z2ggSSdkIGFyZ3VlIHRoZSBj
b2RlIG1ha2VzIHRoYXQgcmF0aGVyIG9idmlvdXMgYmVjYXVzZSBtZHNfdXBkYXRlX21pdGlnYXRp
b24oKSBpbW1lZGlhdGVseSByZXR1cm5zIGlmIHRoZSBDUFUgaXMgbm90IGFmZmVjdGVkIGJ5IE1E
Uy4gIFNvIHlvdSBvbmx5IGdldCBhbiBtZHMgbWl0aWdhdGlvbiBpZiB5b3UgYXJlIGFmZmVjdGVk
IGJ5IHRoZSBCVUcgYml0Lg0KDQotLURhdmlkIEthcGxhbg0K
