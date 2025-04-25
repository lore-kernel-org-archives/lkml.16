Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DE1DEFDA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600857; cv=fail; b=oxXbNEpQmFWd7xsHO5NAy4xPg8myVdrtWqhxwbrYV13azZyy/LTiOfoHsDBYdKuquq6BRoeZe+GQkd7AKZ5MaYymOWDWu9vzp8TRqBcqSIOnyL5MWeMKwNFECVMC7QO76wQOLGlP2V1R0XIbuox2WMMVVWI3b+/um3Da9tmG6sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600857; c=relaxed/simple;
	bh=cAEMQSoeFk+Gp23ZvgR+JGvZS+7/2vQGlm8aZhVSJ+w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oo9V/Lmgb7I7bPFM0muTRbcwC9ZoKRe7ecRCDzcGwlVXMMMAOghfcZY/u5BAkIStHPC3q12+K33ZD6Q4pe3xSqpixeo3ctgkuIKh0zdNOLCLJ0HqbXcnMPlS9LFjyIcprM1Fp7l5Ac4qIOeEknhm5CP8ETslpEfrstEz02t08IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZziDyL3D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BCpovorq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZziDyL3D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BCpovorq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PH5nRB000476;
	Fri, 25 Apr 2025 17:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=cAEMQSoeFk+Gp23ZvgR+JGvZS+7/2vQGlm8aZhVSJ+w=; b=
	ZziDyL3DEn9t0qBHrNZY7unaHkyaYqFxlLIG10J9W27rQbydDaGEKQWdztOi6iOb
	FojjJim8XAwZmJEP/bo87f6z/yXdZ6YD9MjmGoxD2lmubVc4mhmshv6EDdxCfVE6
	tRJUnQgqdTt02Y9cZzNY0n5q3MxcjES3/HDqnvAai1hvaJWqARZbJp6oCNratRoI
	IT096xEt1P5oR8T9A9HMsk4nyt62Inl5Ja4LsY/4w5kBgg9ZC+1IaLjlU2shlp5a
	vemfF/9hnhF8H47xkRB0logO0o/8Bbq5Cve0FW8u9c2Jv7abZ30RkWhOvGvAXseS
	J13Bd8Zf0PdLSty6oYsUFA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468e7c81mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:07:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGjG88025219;
	Fri, 25 Apr 2025 17:07:16 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jbtpca0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1EVMRVKSbTwMdL7iDLYR/xOenYmI0bKVeq90XnkCT4n6mJGelYtvZbK7AiuD3r6B2Dfdp1P/rpYN+w+FeU9PhEIrNKdmeeU5HQRTPuQD7T/IwUeyExRn4ya9nrnkZWlxvzGfVKtOiGabzQMgnDoRTE9c9HuZv1lyFv0M0MOsnX95zM/3cST6IZgCCoy7vc25akgj4mxmf5PtTcLlYqTr7xFdmGVSY93Pk/V2mgcBct+ZDjToLr4URiCtlAnvkJfNPHezH8lEQNTpVoFYKZUok8jd0DGrOuHzZQvqQsvEnQ9pdBbiNWsjl5pzK5I9we5YaFMNGR7D/5vFnuEmYPfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAEMQSoeFk+Gp23ZvgR+JGvZS+7/2vQGlm8aZhVSJ+w=;
 b=pS9QTlFtYp2erXR2bTeJHo9vcVk9vR7CqlFqW+GBJxuu6Xblw0QIzdF2IWIVTOCa/3uXIRMS50pcPyxeZzGzkzS8EprgRKtRzqZJKiNRtB2qAfTHcHmi/iX/bVPiUteEixb5w/VfFpvYMvMNl4QAhvPFcJlBwQv3x1vmHeBXq+oXniVuq5fqfIiaEGBsIWFdVD9tCa5O77vLsfSuDcBwQ3ebg/2nd2tXSkaQvSv1i7TN+B6FhEcMyH6BGZ5h635CEI30h4CbeVOxrEBsWLh1zcU8ZwVrOBIdyFSZljks6TW2rtbCwlDIZUvU1uCw6VAzMzvChBPK7zDD6JgioN9VlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAEMQSoeFk+Gp23ZvgR+JGvZS+7/2vQGlm8aZhVSJ+w=;
 b=BCpovorqNPMm9ua+xExES8XBnXJxTl/tXdRr3najJixp1zWVr/7HryEqVomGasXNhm/YvRDNLR6CvWKY5mmlRr0q/fFic30cywNqK+uKLF6BTH+7gkSs8h+/aVqPAU8r1K/UG/LG1g08hH8Uhv+6mbFQ7ES5yBuViRXd+GoSum0=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA1PR10MB6124.namprd10.prod.outlook.com (2603:10b6:208:3a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 17:07:14 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 17:07:14 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH V2 1/3] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V2 1/3] Sched: Scheduler time slice extension
Thread-Index: AQHbtSMgnPA5MV9ZP06XHg8GjLCPC7Ozlb+AgAApuACAAN8wgA==
Date: Fri, 25 Apr 2025 17:07:14 +0000
Message-ID: <99AB5E48-1F61-480F-BA82-ACFDD5927436@oracle.com>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
 <20250424141345.7F42GFmZ@linutronix.de>
 <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
 <3fb752bb-793d-4c0b-bf7f-12d04a4e7cc0@amd.com>
In-Reply-To: <3fb752bb-793d-4c0b-bf7f-12d04a4e7cc0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA1PR10MB6124:EE_
x-ms-office365-filtering-correlation-id: 0e2a06a1-095d-4c61-bfb4-08dd841ba026
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alE2NWI0NFJsTFRrSThlcXBtc3pPUG9LNWZTOHY3ZU9PejVUSmxoc2ZrWkw1?=
 =?utf-8?B?VzF2TERYR2JnWmpObUl6NlFhbjVKdm8wQXlHc3JCak82N1pIWTRuYkNUbU9R?=
 =?utf-8?B?ejJlYVFHNXl1TjlhWDRSTXVOcHhQMnVkd21jbW9NQ1Voc0RzY2lXZDA5Qk9m?=
 =?utf-8?B?NUpVRUYrVzBFY0xpbXlhSHhrQndsNHhzR1dCT1I4SXY0ZFB5cTAweWRwb2Vo?=
 =?utf-8?B?b0V3SWM1QkRxNTJQNWFRTVhDQnFCcXUzTFc4YWMxUFQ5Z0lhNjhqV21COS82?=
 =?utf-8?B?MHV5Y2hOUG1vS3NIQXF3Zm4zT2VBTC81eXh2Z1o5a0xJSDQrRStHSVM5Sng0?=
 =?utf-8?B?TWhELy9WZWVLcVRxWHFJT3JmQUtPbU1URTdETDZVSFJMMkp2WFJEbk5IbWJa?=
 =?utf-8?B?ai9rOWpBQ1VHU0FSWmY3U3I3UmQzVHNXTkJNUGkyT0hBN3UwVURVeEd5UHVz?=
 =?utf-8?B?UVZKeG1jU212dGxJMkltK1lFeUd6WHMxRFU0Q0M0eFVmWmVjdWFYd29xaWwr?=
 =?utf-8?B?eWFTVlo1ZWRrampYVHZvZWNyZzlYNW8vUXlhOUN6U3hsTlJ6d3hzcXJJQWs4?=
 =?utf-8?B?NnBwSUw4ck9sWUR4ZURNL0tFSzVmeDZOdnJaMFQvL1Y2Q3c2b3dDTVVVTUw1?=
 =?utf-8?B?T2JCVjFGdGk0L09uMjVldFV4Mi8wU1RxUFpDY01USFVGZEJzVjBSY3phS0dY?=
 =?utf-8?B?bzdneDBRSEZxNmxYRTNiK05ldnJHem52WkgreCt2MGRGY3V4YVRpUWZkYjBY?=
 =?utf-8?B?eEFFeXpOUFQvSG9iMWltRmcrRmNFR2dlQXVNWmhNZDRoY0Zva0I1SDAxNFp2?=
 =?utf-8?B?aU1KdUtrc00raUY3cCtaOHN0TDJ3L2swRGpqZlFnUU0xRkhkODFBL3FRa041?=
 =?utf-8?B?NVBrVEYyRFBpR2hVN0hjM2VvMzl5M1JxL2RXbUUxb1pqSVpLd293REhtL0lC?=
 =?utf-8?B?TWY0N25iaXlKNi8xc0N0RW9GcHBCd1ZJQWlXM2dRZDhPZVBybEViTGtlbUxy?=
 =?utf-8?B?VjFmSlpOMm5sbzM1VDNjTlZLeWMxbndoeHN2bXNkMElTYnhvQU56STZTcFM2?=
 =?utf-8?B?cTVidmphcGpwTmRLREdBek5WZDNVOGhpMzFGNEFXOXJGWUJoaUhSaWJEWEN5?=
 =?utf-8?B?aHFuWEQxTUlidWdvQVhQYlFNVi9jVFdJZkkzWTlDWGlDUWdmUXFMRy9NY1hs?=
 =?utf-8?B?T0hJckxyR25HSEQybnphTFBQNThnM3dzZVJTUHFMK3FxSWdGeWcwamRIVUpr?=
 =?utf-8?B?cHhqS3ptYjBuY1hqTDc5ZjE0UXZXeWFsdEFVR0lIVzUwaTdtRHQvWlNsYVpl?=
 =?utf-8?B?QWs4R0IxVVBaWHM1aWpSM2xUWmhWZkhyZUx2QTRKditVMXJBQ2xQdFlOT2p6?=
 =?utf-8?B?WXJYbFExYzVMYU9QejVTR0hRTDV0WjFOS05MUmw1RGQwdlRhTnhLem42OEdy?=
 =?utf-8?B?a0RuaW9JVTVkRFZJeGZCRlRqbkdKMU8zM0V2UTZZUFI1VjZrWUF2djFvb2JO?=
 =?utf-8?B?UUhwakowdkUvY0t4MzZOSndEb3Ixc1IrT01vQzBHTC9IUmxHaTd0bStPajdn?=
 =?utf-8?B?OW83RDkzMFB5L0tUZ2ppb1Z2Ym9kTWYwVzVScVU1dWxJNklZK0xQNUF5V0Nl?=
 =?utf-8?B?ME9nV2pFcGg4QzA2QkNza1BlWEF0Wk9JWHQxL3A2NGc2ZW0zejJZM3lWVUQ0?=
 =?utf-8?B?Y1ptQldzZ3hUeUx1QXBwOHlEUTlURWZMaEsyUnA4cDVZdE9LM1dZMVFvR1pW?=
 =?utf-8?B?SDhmeHVpeDl1UXQzMzR1QlFmSzFmSndibzZPSmF3Q3RZOERQNEtHL0Zub1R6?=
 =?utf-8?B?aHV1SmlKMFVEb1FXZ1MwaTdxNDlKUzFmSFl1S0dJbjR1ZG5VeUE1eTI1bjlT?=
 =?utf-8?B?elJ5LzJvc0dLNSt1a3JQejZPK0wwMEhqNXdVNDJ2blNwWmJwa2xvMXRKcXVW?=
 =?utf-8?B?QlI3ckdxSDVlNU5FaDFBeGFqSnRpRFZmdVVBbno5Z205UXBSTDR6QnhDWGlL?=
 =?utf-8?Q?K/L3vAfTDLbh/CYIfvELYo53QpQ7k4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVM1bVFvZ2pBSTM5eXIyMFJIdFE0aHl6cVlKY2VXVmpMY2RsZ3VkTUk0cG5k?=
 =?utf-8?B?bEl2cnJuL0dWb3dVNUFuckJlZTZxOXNTT1oxOVVyemVLMDV6bitLQXJ1OG5C?=
 =?utf-8?B?a1lCb2JBWEp3ZVA4UXZ5bEZHUkVJbkhST2pxM0ZuaGxLckxTU1lEUTJPNHJH?=
 =?utf-8?B?ekZyKzBBZFJSZmlUSGxaTG1zR25TSDJPcFBmQjFZeU5kOTRSMld5cHdJYzZu?=
 =?utf-8?B?SnZyckF4dEtjMGZ0c2lucWJqb3p2UU1IaUlVZlp1eC9PakorUWY4bGxSY2RV?=
 =?utf-8?B?RUlnVTBINkZKeU1teURGSkRPSXo4dDZRcGRwQ0xqTi9ISHpINmxiQm4vSHZV?=
 =?utf-8?B?UFJnWWVVejVsSXNyWk0vT1lVZ04yZ3VpT1BrQmIvUnJsbzUxdTlyMVE1Y1d0?=
 =?utf-8?B?ZGJDMVBkK2k3eDZQeHhRMFNEd3Z3TEdoNllQdzFJUE1OWCtlSFBpRlN5d3J4?=
 =?utf-8?B?ajhWb0NDVmFad203TTVwYm83R3ZuSHpBTFZKQk1mdmczcHQ1U2s1N0M3MTE5?=
 =?utf-8?B?cUpTdEJ1bnZtWmtIUGdCYjJ5LzRCTHlIT01YNCtFb0wyNElmZG1mTDFoNWpu?=
 =?utf-8?B?QmxYaWtzMDZTRTZjdzBGeE83UjEyYmFLajVmTG9tTTc2RURFMVdJK0hBQU55?=
 =?utf-8?B?UWtETEE2b3ZJQzJqdUdzMjVsbkpmY0xQVlRFSE5mbzBPVUMxeUswV1ZsTElj?=
 =?utf-8?B?NFUrdGt0VEQ0eUpSclBLQVRXWklHOW1BYzgzUTRNTnRsRkZuQ1pjV2YrU3NG?=
 =?utf-8?B?c0twNWlYWWRhTzhUZGlZc2JVQ1FhUXMrVUc0TERjVHZ6ZEZoOVJITUtuZHFk?=
 =?utf-8?B?cGh1eTUwOXNCYmdKTG5aMHdxRGF5ME9XUSttditFeE1nakFMQW4yMTBmNmZX?=
 =?utf-8?B?bi9ndGtoZWhwQ2ZIZzR0V1dXK3lwWW1Qc1ZPM1RmR1ZESlZ1ZFA2Q1JhaEFm?=
 =?utf-8?B?eU9oNVo4VVBHSldrTmliMnlYeHgzcmRPeG9tN3NWZXpmbGVaMnBSK1JMOXBL?=
 =?utf-8?B?SDNKTE45MnlwS2t0VmhqNFl6RDVzTlJhVHlvLzlzUE5ZZzh0ZkZlWmozKzAx?=
 =?utf-8?B?QkN1WjJCcmtTbWZIQ3ZobXlEbUFZNnVmL20rZWxtc1dCS2VDbFd0S1dnVzdk?=
 =?utf-8?B?WnZvRGV1bDBlM25QQ2pIbWt5NFlCWXB2K3g1dUFYM1BCanZlaElrWDR4bEJo?=
 =?utf-8?B?ZDIvN0dmL0czTTlGYzZ1SmR6MGV3K2w3SEdZWTFzVS9McG5LMEhUaGZicGl3?=
 =?utf-8?B?ZjNwYnNXZUtTb1ZqZDVqc3B5ekM3dHlnN3ZraEtsdjExeC9USkZjSnR0ZlUr?=
 =?utf-8?B?Z2FOT05wYms2UDJ4aEpqL0cxdThqbGRIOHkyTEpOR1VGMk9HaTBlSlNlOFI3?=
 =?utf-8?B?SFltdERBKy9ITnNaUmpDKy8rTVp3N2VabzA2YUxuc01mMU54THJvQlVFTm9T?=
 =?utf-8?B?Zm5WNGEzN3VlTXNySEpud1hiSUtVdnVveG0vU0tKSUhOcFl1SDI1SjBLSFFW?=
 =?utf-8?B?a1NrVFFrQTUwc1Qyb1I2aGgzR21ONUNNYUtOY1VnQzJOSTZlK05UUTFVMENQ?=
 =?utf-8?B?NUZ0YlN2cGdjUEoyMUhuNVczajlnUTRVaTJ3dS90ZUZDMXFueGpBek5nSHM3?=
 =?utf-8?B?NDZrYVNPc3ZhSklJWFlBSXgyU2twd20yR3V5NnA3UmxQUkZqNUUvaVkyUVVH?=
 =?utf-8?B?RkYxVjlXeWcvb3ZQbHBUZjlsLzRNR3FRMXdLRzVLR29MZ3VzbXNDY2tnRGJT?=
 =?utf-8?B?L0cxejUrdm5hU09tV2YzTmRwbEx6eUt6T3pKbFlXam5UVlkzZlpxcmpDZ2RN?=
 =?utf-8?B?NVpvNm43eGxWNFJMZVRqY0dZWEtqT2RkK1A0QWxtRFpqeDhTZjhWeEwyeGl5?=
 =?utf-8?B?UHc1UGgvaVNESzFFYlJiTTllSXFOYWpZVi9mUVFjZnBoV3lXdHJUc3ZCS3M3?=
 =?utf-8?B?dHlEcmZlVDJza1pTOHFOZFVtSmJXWVkxQm1JWERHMU9sMTk4dDg5UFhsYUhT?=
 =?utf-8?B?bUdYaHNCZE5XMGxETGZISThTNlJsMDV1RTBxVGJyUWNpVjNob0NZSmhuZ2Jh?=
 =?utf-8?B?ZXlnU2NGN2dyZmxSNEkzUGlXeG55cG5SbVZXQkNyUzBJODg3YmhMcEtXVTl1?=
 =?utf-8?B?V1FpTm44QXJFNWJobFJMRFVnS2pkV0FPMEl5REVxbGszK284N2lkSkhqc3M4?=
 =?utf-8?Q?Z1o5+d+xnd80KJMAHuUgNjM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <087393E986F41C4A9D174225638A1652@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2R8kSZzI2h8KC/02sxXiUZLjwrdEW8YoVJH4uOFQYZtnpMtZWb9EnJKvoqH8Xgm0mPDE2ge2VJ2eRCH5dCjXm+Kx3Co+QZVnNw1bcRmRpM1gZHwH0Pmr/WMgedY8zPEQjnCnxNyH9qQDdBwGV9NFug0Mr8egUrgB8Dk6ehnGrSq9toHMQ8vdv0c6Nn4uC946ZF8ASlhyu6RbBv13+wIbM2r28HAQMbVM3U+2CB8Uek7/0l7eNw88TcuUWkIAx7FqC88p77MPn86dXBWh94l+ofmCyU/FSzprYrQGoix1auntuC475kYjfAS/KWu2PEsM9RHBQzkL8dGULjwbVoFhpk7O5scArCS9CDRGMErMBsWb0CE4Ldza4cyBPXltrhTk58rWKx2Z15xkXEW2jgH6u328voSm0lot7c60oW9awQIPm7WeEBJjsa0vylu1q0GwfpRKPVPt11sDPIPUgrzkm0H1bT4U8XTVNJerzpo59fjCWuu9EVC2d4cckxpuQIPZ2n/orVkjbx+yjMWK5oQpin2lB+1FB/xOz8GeL89uIqo740LHsbTPSGgKiQit94IE5wDmndQpV3GiofpfKv44oOPHyaOxMEIegc1fij8nuy0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2a06a1-095d-4c61-bfb4-08dd841ba026
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 17:07:14.1819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbrvTG78dB+1KaJyOuZzokYb8Jmr2hDxygKWYKwjscdTvvuitEz93oTSXpmxSd33fQ6uydKXxSIgDFZXOLocvKiMXwUg03QgyfxFSpk7QKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504250121
X-Proofpoint-ORIG-GUID: fmXq1UpnjTt-vTdwXmlzEjsb6JBWlljf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMSBTYWx0ZWRfX3ao8dcReZJe5 5aCxHOVVt0gunBXqteKeHIcfszCvKEHRAN56KAHbiet3vx0xNAbjZ9Nbhin7L6sL03k9jGVzQi0 acLZg1D8pu2K2XVDzLzkTNpm3EgQekeydAmjboQ282a2DVz/ft+cySku+i1chMgZOaCtFTBAwIZ
 eAN4zfX8slckW+6yplcBDq+fNQ+cmYzh3GcGlAxOQKjY5w31OyOq49SUvpyuevaAe3E3syE9axw oiwGGzjwcsNTchRDE40lLBAJCyckKNs9XJZ7K0ieJdg7ubiCQaJ2BX2fBIaT3DVECn1FdQxt9em BsJ3eeNadmEtY4qo6kS0l7ngcZ85P6xzK4ONiE/NnSTmEuBm1SLKq8rD99rwkyMaDUota7CgNca vZ0NKrmK
X-Proofpoint-GUID: fmXq1UpnjTt-vTdwXmlzEjsb6JBWlljf

DQoNCj4gT24gQXByIDI0LCAyMDI1LCBhdCA4OjQ44oCvUE0sIEsgUHJhdGVlayBOYXlhayA8a3By
YXRlZWsubmF5YWtAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbyBQcmFrYXNoLA0KPiANCj4g
T24gNC8yNS8yMDI1IDY6NDkgQU0sIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+Pj4+IHN0YXRp
YyB2b2lkIGhydGlja19jbGVhcihzdHJ1Y3QgcnEgKnJxKQ0KPj4+PiB7DQo+Pj4+ICsgcnNlcV9k
ZWxheV9yZXNjaGVkX3RpY2soKTsNCj4+PiBUaGlzIGlzIGNhbGxlZCBmcm9tIF9fc2NoZWR1bGUo
KS4gSWYgeW91IHNldCB0aGUgbmVlZC1yZXNjaGVkIGZsYWcgaGVyZSwNCj4+PiBpdCBnZXRzIHJl
bW92ZWQgc2hvcnRseSBhZnRlci4gRG8gSSBtaXNzIHNvbWV0aGluZz8NCj4+IGhydGlja19jbGVh
cigpIGlzIGFsc28gY2FsbGVkIHdoZW4gdGhlIGNwdSBpcyBiZWluZyByZW1vdmVkIGluIHNjaGVk
X2NwdV9keWluZygpLg0KPj4gV2UgbmVlZCB0byBzZXQgcmVzY2hlZCB0aGVyZT8NCj4gDQo+IHNj
aGVkX2NwdV9keWluZygpIGlzIGNhbGxlZCBmcm9tIHRoZSBjcHVocCB0aHJlYWQgd2hpY2ggd2ls
bCBnbyBhd2F5DQo+IG9uY2UgdGhlIGhvdHBsdWcgaXMgZG9uZSBhbmQgc2hvdWxkbid0IG5lZWQg
dGhpcy4gRnVydGhlcm1vcmUsIGNwdWhwDQo+IHRocmVhZCB3aWxsIG5vdCB1c2UgdGhlICJyc2Vx
X3NjaGVkX2RlbGF5IiBBUEkgc28gcmVtb3ZpbmcgdGhpcyBzaG91bGQNCj4gYmUgZmluZS4NCg0K
T2ssIEkgY2FuIG1ha2UgdGhhdCBjaGFuZ2UuDQpUaGFua3MsDQpQcmFrYXNoDQoNCj4gDQo+IC0t
IA0KPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+IFByYXRlZWsNCj4gDQoNCg==
