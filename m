Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB420D4E2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032479; cv=fail; b=ElJfjLNV7wXyqyMUdSjI34N+lBbdjuFxk5qrX5k0ixY83jq78cpYXiXt/7BtU5+CXLky5C8P33fSmwhBQYO4ys8O0032I0x76ie84LDSE4I32MtvHCDhT/7FGqJy4X3Bllcg8n96/YKv+a8iARwGV2Xco7w86ufoFOWKDT/EY0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032479; c=relaxed/simple;
	bh=aj2cZZ3JqRktyhgvqi/LBjIF7OhIjEGxSvhlcYF7FTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NpYqr3MpSXy0CUMat5AUchcsi/UfXUTeXKBtbj50TPlU9hAVxAi3Aq6kVuip02rVMfvV1tGXnQJLllQVvmcsB+pw++BBMiyH2+fAwytyLkKJh7evVN3Bb60am9Ml7AXpAlQu5A0ZzayagsYiGjyQ7btwK/1GpV4niaLTiL+bapc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YERqjgGa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGEorzkb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YERqjgGa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGEorzkb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NJtmSM019722;
	Fri, 23 May 2025 20:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=aj2cZZ3JqRktyhgvqi/LBjIF7OhIjEGxSvhlcYF7FTI=; b=
	YERqjgGa4pTkW6RvqjSHuVgnf0tgeDbVkgasYikcddpVVKwzN2Aru6fXZj6zAnWe
	la9CF4d6fXNoyBGB63gcHLq1UWHaonOPg0SkJuKU8FN4xg2SMchYMqUDStOW+T3J
	3u6iHzByFS2ZfYpadWz4mQNhWYbmpvL2kZ+qvRnX3eb34mZsGE1aS4tP7RbYf4e3
	DQDT1mMeMsewISDf5W/RLR4La8X4+fsZKJuMALlYoUlB8C//7DJImvzlyxQmeRje
	g1YUfnI8IiHPc152rsR0ughJb7dhSC0O6qqgNq1XTIz10A+f5RB4ys0lZUoM83VQ
	H1FznLAizct6A2DBWWxiPA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ty2g83cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 20:34:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54NJvqdV011361;
	Fri, 23 May 2025 20:34:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwer8222-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 20:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+9nSXFaHdoVMRY9rfIZVMnRm8sfGvyc4YAOjnFo2GQXd7hTDLkUI4niVRjGWK8c/X8ffJ9Wm0eLdXN5BI47Ni3iYacXSc6Ch+rfMUbjIIxZYBBNoFlT/1kmwPFMH6bwz/wFdlZvA+VbNc+favoDhjVeeLHrgvThTKODfnnmmCDMX60M/8GLZpCNyJ606ySUbMFjhSftal9OVk0dnMqr24f7RNBZ74f9Qq8U+KifoYGkTBDao7m+SLQ0DuTaekwuduOiqUAvMYCQN3dwKcK83RTI6vZFaI8b9tQ9IbKerBlZJ0BT9T2qvvOcr9sc2CwVhCQq8qXtVXDon5uIHKHosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj2cZZ3JqRktyhgvqi/LBjIF7OhIjEGxSvhlcYF7FTI=;
 b=UhW20SRNfwO80CnXMvcw7tD3/sc+enPNT7H5x6Fn2OT72FnLTsF8KJYS5mJC4Q68OyGJ3framBhGzNwW4V2sf/PxWf7yXPzCgL49BrAzrJmLpTAd/GIfbWGgWDHGU1IIE/ORBgL/ztnd29fZwmjUR8RwmUAgjI82/dbkEGjBUhq+G1Pa/twexI5arIKnLnbpSH5+Re5p/w3JI3/YlX/z+/8DKqjUTEvuhfnFsqoOwh5cGckYWTyKRkYEUW0zWvcB2gE31jv4sG1Un/TRn93R8twta9bG/8g3wff3A+iBeB7BLDG1IKc/dG1poMRumsH3iI2/YYGb0gExX9wziP5m+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj2cZZ3JqRktyhgvqi/LBjIF7OhIjEGxSvhlcYF7FTI=;
 b=MGEorzkbz3v9TfI5973a/qDbOeMwrNzayEXRYOGNe01FMjT+6mqEOKgHlNGSGQVFQI/HzfaJI2ccVkZzPM4PZu/6G2lBBOKH+M6wXr1XI1YLvK3EpKzB19yScqggHs5XTF0GhLfi/rcelC+yPT1buzhQxaPreMu0AgrnJEjTslk=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by PH7PR10MB7085.namprd10.prod.outlook.com (2603:10b6:510:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 20:34:15 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 20:34:15 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Index: AQHbzB4sjkkUMQXqRUSZrCYUHipYTLPgq88A
Date: Fri, 23 May 2025 20:34:15 +0000
Message-ID: <7EF41833-EA7F-4C02-837E-FE2260E3EAFB@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-2-prakash.sangappa@oracle.com>
 <e7e5acae-f372-45f9-aa7d-c4126ea4be1a@efficios.com>
In-Reply-To: <e7e5acae-f372-45f9-aa7d-c4126ea4be1a@efficios.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|PH7PR10MB7085:EE_
x-ms-office365-filtering-correlation-id: a8c12ef1-5e53-4822-ff16-08dd9a392f30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RmpZR05NLyt0bGdKME84U2gxbVNlNDFPbGs5WU9XTkNZVFAzd1FJa3RTRmdJ?=
 =?utf-8?B?NDZ6YVFmOUNRanR2UDdpRzY1RVhoK00rMGN5US9ZT0tQaDZVYytFMGtoV2pn?=
 =?utf-8?B?S1lBQ2orSlRiVTJ2T3ZSSUxidE95eDBVRlNLbDhYT2hPNFdFUkl2K3VNQVJI?=
 =?utf-8?B?SDBvVTlZL0lDa09BbjNWM0ZKYjlhRmptdkhrOVptWjhlQk9VOW1tNHlPc0s4?=
 =?utf-8?B?d0pTSW1nK2lQZkp0VkdPc0wvR0l0bklmSzNnZE1tWWJkTTk4Q1JTM0tPU1ly?=
 =?utf-8?B?VHVNaUpEa3JoL2pNY2crUGNNd290WEsxRnhWSjFFRlZVYlNWazJoQld6M0N6?=
 =?utf-8?B?YllaNG1pdHJHZllBUHduMHM5NzhzVCtLdVVzc0tOYlFQU1NaS1hqTitBUDF5?=
 =?utf-8?B?bDFVZ2VWa3JuTERMeHNMRklrUi9WNWVnQVA2R0NBTUd4RWRRRlFseEVZTDlV?=
 =?utf-8?B?UVcxRWRuRVVyTG0xY3YwRHZOR0oxVnNTUTRaZlNWbXkwZUxpV1FoZytDeHV3?=
 =?utf-8?B?TDBZV2w3VUJGNmFBVHNtZ0k0ZytpYjRYcVRXWkc2ZGQ2WWdyUjNtOE12dVZE?=
 =?utf-8?B?dDI4eTBHNFZTZWpqYVF2cStqZlRqYWI1WDljajFLdFFGTzZyOFcrdDVtQzly?=
 =?utf-8?B?SDR3T0NsdGx3WU9oVHpoZ25VYVRjem5XYzd2SVp2YlhPTHMwekV6bUNlQThr?=
 =?utf-8?B?SDY4ZWh1bUgzSktLWkNud3JjZytZSlduWEd0K2tCRk5WV0JKdVJEQ2c2OVJX?=
 =?utf-8?B?enVkN01sM1pJTThGQkoybkpwNENNOHZibEFsd2d1ejc0VkROQ0RRYTFjVGcx?=
 =?utf-8?B?RjByQ2JkZjV4bHNtZ2VtT2hWeW43L1gvUmxaQk8wY3NYWFdoQWRMZ3c1b2Jh?=
 =?utf-8?B?VnpGYk4zMmltOEczRENkcmY0QVI5aWJCOXgxQTVVNmVHN0IvT3AweWxXc2Zy?=
 =?utf-8?B?OUNYcDhDc2R6TUFjUDhWZkNOdTk3dVVoTXE0Mk5Nb05kYkVSLythY3hUL2c0?=
 =?utf-8?B?N0VISHEvNnA3Y2hxQ0liN1RKVXlUc25pNDdIZW5UQjVqZWpKRHRnYUdDSElR?=
 =?utf-8?B?OHFPRW5EWGl0VjFpSmU5L0p0STgxK3RXYVVPZFRac3FBZTdXN3MrQU8wYndR?=
 =?utf-8?B?K2RlczJRcVIvVndZdStlczJobFRBMngxd1hSV2RZQWducW8wNGF4VUxYMVor?=
 =?utf-8?B?YzBkSU5MK1ZxNGNnK0J6WjFYOHNHNUQ4eVJ6NWFXSG8vVjBQT1VmbzRiOC9P?=
 =?utf-8?B?cHpVcjgyM0pDY2FwU1FnbCtJUjcwVlRIek14SjV0WndqMk05TEZXbkplcFRh?=
 =?utf-8?B?Y2tHYTJHRlkwZTU2bkNkRzFCbkNJR0RtbG1pZ3NFMDJTblAxUWVDZkdROGdp?=
 =?utf-8?B?SE5JbEFrTkVWcDk3bEt2Z1NYTWNCcXNZUjBETDF1SVZNSDZOU2gxcFM2T25t?=
 =?utf-8?B?eWx1bU54cno4RHR6R1VlUW01b2N0cEV4N2R6UCtGQyt2bHE3WGN3M1dzRGtQ?=
 =?utf-8?B?eFEySkwyR0xSL2t2RjlOa2xnQmtwcXJLY2JFV3RyaFNoY2NVT0V6T1FCcjEz?=
 =?utf-8?B?TmRtdGw3SnNwZE1zL1c0QTdjaG9pYytGbEViZFJ3cTdMV0NSNG9HNWhKRE9U?=
 =?utf-8?B?cUN2WnRZSkRVQWJ6Ylh4cTRNUG5oTmd5cS9rZHBOMnphdmwwamRSTXQ2QUJ2?=
 =?utf-8?B?OXpxbk90SVl4N3ZDcnRsRVltUUJVRFpLNDhSaE41Z2taR0s5VGV1cENlNFFR?=
 =?utf-8?B?TTNQMVhUUktPM1JrRi9qYUpDMHlwTHRhNDk3MnM4ZHVxeGhNUTgvaHE1REhJ?=
 =?utf-8?B?ZUhiNjFLYzhuSkdDZWZvVHcxVEo0aVdBSU1kWmRqa3BmSXpjY3lXcG9hWEM0?=
 =?utf-8?B?Mi8weU5aR3RmVWRRSjNKUVBQTzYzUjlGM3A5azgySk93UTdJSytMQWdVbU5n?=
 =?utf-8?Q?YYQzBYbsAi4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RktJYTlGUjcxbkFFMzFyaDdUYjdiTmY3c2JuUlRMS0xnTGMzUllFV05rL0dp?=
 =?utf-8?B?T0FZL1ZUQkVNRUhQczJKbnhyKzl0YWt3WHdPNm5ka0o1STBCT3RiTzZCYloy?=
 =?utf-8?B?bUFxdFg2UmUyd0dJdmM2aGFmL0g0M1laMVBQS2Jpek9JL0hmazhtSm1hTDFl?=
 =?utf-8?B?OHgyOTVuaGpwRGc3aWI1VjdMb2FyRXpCZDBpMk1JMkdxZm91ZklHMWpITDM3?=
 =?utf-8?B?cUQzR2NPM2VKMitBcW5zeHNWRERVaEtVRWZBWlhLejJ4Q1ZZTEl1aXl1bVZN?=
 =?utf-8?B?aGxiQ0w2M0xUN0t3eHBSZml0b3p1QVlYdHRhZHVUUmtoak5iQWR1Q1BkTlB3?=
 =?utf-8?B?dmRWSWgrWGJQYndGanhwYnAvSjlCaU9WREp0UDkwdzFEVDRjYTBtUkozRXBO?=
 =?utf-8?B?aU5FMVpuUldnOUJleXcwVjBaSTJlTjVqMXJFWmhnUGsxWkpqMTh4UGZQMTRH?=
 =?utf-8?B?eXR6TkFtQVZqcmMzQlJYWGxieDNNbU9BTUJvMm9GMGc3Z3VKZ2tyM1Iyd2dk?=
 =?utf-8?B?ejFHWjY5ay9Gay9uTlptYlprOXExcURGRUtIVFBMU1RTelpGMVpRWVk0ZEJn?=
 =?utf-8?B?dzMyU1RzbEk3cG90VkwyeWt1STF1N0gvOCtETHJkZ3htVGlrVjhocEpWdUox?=
 =?utf-8?B?NXVQRHdlVm5NYkdLaVMyZUhYYTEyUHA2NzJNSGRCb2JWMXNmeTNqM04rWmxD?=
 =?utf-8?B?N2U5ZVpuWXNhTzFNYkkvN043dGNsREd3VkU0R1cycFB4TDdCTHdORG1rSjVl?=
 =?utf-8?B?c2lyaHp3SDNvMHljSmJSR2tVdjBrb1Z2S3FYRUhqMUlvU2crdHU3OG0rNFlq?=
 =?utf-8?B?Vllpa0JwVXRuRmliRXc3UGRFZVRzWTk4MXBkVE9EUHV3SmN0Sm85azdxdmI4?=
 =?utf-8?B?dXY0SzZuazNwdHFKQ2RNM25TUHBIZ0lPSXZnQ2YwNHdleVhjaDl2c3JwNXNF?=
 =?utf-8?B?Yyt1TEF4ajBXUDZiRkNvS05lMFFzWWgzdHRZSDhCK3RwT0ZKMFIzdUdBUDlN?=
 =?utf-8?B?Y1EvblZaeUlQdDVsQmxkbmZKYmxVc0NRa2E1UnYzLzErMWhwVGloc2E2ODdl?=
 =?utf-8?B?ZUhFZ2VXTUU3R0t4N3Z2Zy9LQTVQMEVOMGFKcFhRVkE5cG1aNXlhbGU1ZXlB?=
 =?utf-8?B?aFVLcWVGSGgxdDFaMEdWYXRrTjlPYktBQ1ZmUUwxbk14SWRqYjBRRmI5MWor?=
 =?utf-8?B?ZlpnMUZTZVdYUGdYdmtkUVUrSG8vVElKd1MxRXdKQTFvUXhHZVJQaTVaUkx6?=
 =?utf-8?B?Wm8vSkMwaHBwdmZ2RzBibElDZGJuV0dVbzloMFlxVkVFTTRZc3BmOVIvajdQ?=
 =?utf-8?B?MzV4K1hRdjBmKzQxKzhRUTE3NzQ5b2tNOHA0TkxucjFKS0JzZUw1bzE1VWdB?=
 =?utf-8?B?aWIrT3pyeFhuUTI2d3J0eXRBRlc2M1B5U0p0dG45aHRjcEZmUkF5N3B2UkpW?=
 =?utf-8?B?NFc2Rk00cEZRR1pCQWhSOFFPSlUzaUNvaDJjSVhrc3U4Tk0rSGJ1ZHQzam5y?=
 =?utf-8?B?ckpobXluem1QYklLZ1I1d0IzbDQ0SGFvcy9JV3RXaWZOcHAzZUpQSmZNZjQ1?=
 =?utf-8?B?cmxTS3F3MWNoaiswRjlNUkNSbEdnYUNwUjV1aWJvT1d3bUtGbDMrQlNKdklQ?=
 =?utf-8?B?Ylg5cWVDWnBxZThCWnpTYjlSZU1TcVdyZ2Y1RHBFaXlDdVRWdE81aDhHakU3?=
 =?utf-8?B?Z2N3QTFPZjRHcXJxVlNPL3NrK0h1NmRKUzhUak9mUzRLOTJlcVVQVTI1eEto?=
 =?utf-8?B?ZmJFYkQvdTN5dzVsSjdJZmtBd2Q3VDhiM2tTRytxaFpmSGdsa0RzMXNsUk5R?=
 =?utf-8?B?MEFWbDlWYzB2YlFnYzJSNGU5T1FHaDBVMzBvYlJaSEtFZ0hUSXJtM3JKU2d0?=
 =?utf-8?B?RVNSQmZ0U3hWNTMxd253YURKNDd1S25ObENDSTMra0pIdUl3a2Vjei9odHJC?=
 =?utf-8?B?aG9JZGEvR0pkMWozcTlVdHAyOUprU2Z5dDUxUXZETWdTR20zbTdZQm9RNHJ6?=
 =?utf-8?B?MjAzWHFXTzJhUy9CNFdVRUdTNVYzSXQ2VW11NEJPd01YMVYvQXhiYW45bHNn?=
 =?utf-8?B?b2FhV1RPaDN5Rm9ETnVDamdOcjhTNjAxankvaXo0NGtoUlJiNUpFTlFmRHU4?=
 =?utf-8?B?WHhWWTUwbWpidXdDcVdnNThFSjBQc0NLRjZHQ3lLZEJGbldDTnJZUVluc2dS?=
 =?utf-8?Q?EcZn9PPtmhZOc8mK6BTLMuo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3CDD114A562274BA755ACB35C793C54@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DmxW/fOk0KloSphqy/97eG/JH05jNTF1Tg/oPJW5391hYDFfI4bYgPzV9f/ucRQ4acesWHUBaBvO8xs2w4T2JuZ6WOlafdZlB0DuraItdorDUHlvPjED6uYG1hngsKgiOMXCf9rtQmSxYzp06dBhWOP8fnFFZGj+uUx8f2+I/O/UbRLfXHP6rQIHsXuGDslT0PH3WgFK5wIKSZM2Xd8zIw8lBMoDwNBYQDYMzA2k/fdIi3sQMQzr4refh/UJmsZidWO/eK1F30liYs9YFWfee8uZl9iHOYFPRbwOebh4bw0AxldJLZt7oapqbaagcQOcarBiSCCqj9K8yWF8+l1Xtr9pppkBzlgC/bVl/5QCMM/qY05MfiDuUC/NYv/PIIbVh0CLSiVzFWg/FWyj8AakDnjJ7taOCnnngJAZxobPC0vJrOllErWX+VgRnF0DWZ0Zh9Z4j4yRiJ/WS50VNR2QM2KDFHIzO2LtoASWR01ovkdNEFDCojPjYkp9L9T1/CsoUxvXu/65d0/D75CqK6e+VWNOQoGWmtfsfKhpH00fAm0+xC8QW69RUV6XJ4yMr8s0ywbUOXH5dBcnPNCFr5W5N2FsSjyxRks+tJSyCEjehjQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c12ef1-5e53-4822-ff16-08dd9a392f30
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 20:34:15.1974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwKtS5H+efINSo3irf5qYMe38ws18tKiTtFS844e3ylaslcgzkwRLuJo2y8N48iS8HCbb1bKrumxwD+9u3qBWcTARAgAvhLW60/+uGx2svc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7085
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505230187
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4NyBTYWx0ZWRfX+NYabiCdiZNI 2++h6bEpWqGJ/e+YS5AIoiTG7bDNPEPD8LhUmyjp+h8/j3Hb5mEvVxEmUzodvCt8Xa7fA+ujXLN IrBITmOyJW9Qx+05GZ2SXWPMjlQvEPlwIGoPIQRiunVvNvQK0fJ0hF42TJqBJNTPUQcXmewsqZ/
 MMfTmZFTO91V6UgDuW29t7IHrESzytl3Ex6rf5kkUXpcE37cwV/M58DrlsPIvsdpasT1/0b+a32 NjGaTPEh4M4CaKFZxR77qPmXNUB7KjDMUAV9pOy0dddIGJ4kwKMsM9MNwtDUK/li4UzttlAWcuJ IcgEoO0oO3w7Y8B/jKnwJGqC7z5j+pH0Lpr+X0Vi4RVsO7fcIVjiw6PjOzvtNoQTpPG+kabpDdX
 k0XHay0O/Zsm0ivhKgI25RmS3D0LM8eDo/Nj9sv4pe70j/VckhNC0apC7th8RZy4bZ1uLLCg
X-Proofpoint-ORIG-GUID: 2yAdVn9RLa2vjvAFWJFCpi_TYZ8FTNHT
X-Authority-Analysis: v=2.4 cv=VMvdn8PX c=1 sm=1 tr=0 ts=6830dbd5 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7d_E57ReAAAA:8 a=UcGnUnSDki8RBSTxUbgA:9 a=QEXdDO2ut3YA:10 a=jhqOcbufqs7Y1TYCrUUU:22 cc=ntf awl=host:14714
X-Proofpoint-GUID: 2yAdVn9RLa2vjvAFWJFCpi_TYZ8FTNHT

DQoNCj4gT24gTWF5IDIzLCAyMDI1LCBhdCAxOjA24oCvUE0sIE1hdGhpZXUgRGVzbm95ZXJzIDxt
YXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAyNS0wNS0x
MyAxNzo0NSwgUHJha2FzaCBTYW5nYXBwYSB3cm90ZToNCj4gWy4uLl0NCj4+IGRpZmYgLS1naXQg
YS9rZXJuZWwvcnNlcS5jIGIva2VybmVsL3JzZXEuYw0KPj4gaW5kZXggYjdhMWVjMzI3ZTgxLi5k
YmE0NGNhOWY2MjQgMTAwNjQ0DQo+PiAtLS0gYS9rZXJuZWwvcnNlcS5jDQo+PiArKysgYi9rZXJu
ZWwvcnNlcS5jDQo+PiBAQCAtNDQ4LDYgKzQ0OCw2MiBAQCB2b2lkIF9fcnNlcV9oYW5kbGVfbm90
aWZ5X3Jlc3VtZShzdHJ1Y3Qga3NpZ25hbCAqa3NpZywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+
PiAgIGZvcmNlX3NpZ3NlZ3Yoc2lnKTsNCj4+ICB9DQo+PiAgK2Jvb2wgcnNlcV9kZWxheV9yZXNj
aGVkKHZvaWQpDQo+PiArew0KPj4gKyBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQgPSBjdXJyZW50Ow0K
Pj4gKyB1MzIgZmxhZ3M7DQo+PiArDQo+PiArIGlmICghSVNfRU5BQkxFRChDT05GSUdfU0NIRURf
SFJUSUNLKSkNCj4+ICsgcmV0dXJuIGZhbHNlOw0KPj4gKw0KPj4gKyBpZiAoIXQtPnJzZXEpDQo+
PiArIHJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgaWYgKHQtPnNjaGVkX3RpbWVfZGVsYXkpDQo+
PiArIHJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgaWYgKGNvcHlfZnJvbV91c2VyX25vZmF1bHQo
JmZsYWdzLCAmdC0+cnNlcS0+ZmxhZ3MsIHNpemVvZihmbGFncykpKQ0KPj4gKyByZXR1cm4gZmFs
c2U7DQo+IA0KPiBUaGlzIGNvbnNpZGVycyByc2VxLT5mbGFncywgYnV0IG5vdCByc2VxLT5yc2Vx
X2NzLT5mbGFncy4gQW0gSSBtaXNzaW5nDQo+IHNvbWV0aGluZyA/DQoNClRvIHVzZSBzY2hlZCB0
aW1lIGRlbGF5IGZlYXR1cmUsIHJzZXEtPnJzZXFfY3MgbmVlZCBub3QgYmUgc2V0Lg0KDQpNYWlu
bHkgdGhlIHJzZXEtPmZsYWdzIG1lbWJlciBpcyB3aGVyZSB0aGUgZmxhZyhSU0VRX0NTX0ZMQUdf
REVMQVlfUkVTQ0hFRCkNCnRvIHJlcXVlc3QgZGVsYXlpbmcgcHJlZW1wdGlvbiBpcyBzZXQuDQoN
CkluIHRoYXQgY2FzZSBzaG91bGQgdGhlIGZsYWcgYmUgbmFtZWQg4oCYUlNFUV9GTEFHX0RFTEFZ
X1JFU0NIRUTigJk/DQpBbHRob3VnaCB0aGUgZW51bSBpcyBjYWxsZWQgb3IgcnNlcV9jc19mbGFn
cy4gRGVzY3JpcHRpb24gaW4gc3RydWN0dXJlIHJzZXEgDQp3aWxsIG5lZWQgdG8gYmUgdXBkYXRl
ZC4NCg0KLVByYWthc2gNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gTWF0aGlldQ0KPiANCj4+ICsN
Cj4+ICsgaWYgKCEoZmxhZ3MgJiBSU0VRX0NTX0ZMQUdfREVMQVlfUkVTQ0hFRCkpDQo+PiArIHJl
dHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgZmxhZ3MgJj0gflJTRVFfQ1NfRkxBR19ERUxBWV9SRVND
SEVEOw0KPj4gKyBpZiAoY29weV90b191c2VyX25vZmF1bHQoJnQtPnJzZXEtPmZsYWdzLCAmZmxh
Z3MsIHNpemVvZihmbGFncykpKQ0KPj4gKyByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArIHQtPnNj
aGVkX3RpbWVfZGVsYXkgPSAxOw0KPj4gKw0KPj4gKyByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+PiAr
DQo+IA0KPiANCj4gLS0gDQo+IE1hdGhpZXUgRGVzbm95ZXJzDQo+IEVmZmljaU9TIEluYy4NCj4g
aHR0cHM6Ly93d3cuZWZmaWNpb3MuY29tDQoNCg==
