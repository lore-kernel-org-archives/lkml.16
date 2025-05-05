Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CA1624DD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409394; cv=fail; b=GsDd1jJTlUhPMStofSsW8VLN1KidxV3efV6S22YKiya830tKydorlYuIG3knJ5vfl2OIjLVeGoPW7aSZYwYqlxsVaf9Ywo4Am1nMQJy9bhCsK0lhWgRYsXkkc2sZqDbcu6/MH0OtkKZ8S3Kh+wdyPKif7sUGZhk70JlkkKRqkPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409394; c=relaxed/simple;
	bh=vxO1qFBuBdvdE5gpnd0+h3sWDucACmO8Kv0wrv5OB2A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dx391mbVm8wEMp6sN2/WGERB1PUYjGXCyjydGSXSbGJD43y9IUYzMlpLMipsm+W4lkuIJlxMlClMW4cEbX2POONFr/fc+nNsWyR9b3bJXEu9Qg/mVyB3BTILsbN7cHUI7TdIuJyfOVz8TVV0dCe0g2UybXvnY1edBVY0wyGF62g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QV2zynQ1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qo/ujTud; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QV2zynQ1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qo/ujTud"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450bukq005734;
	Mon, 5 May 2025 01:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vxO1qFBuBdvdE5gpnd0+h3sWDucACmO8Kv0wrv5OB2A=; b=
	QV2zynQ1mzL99OkNlmqzoR0b3z3CWwYysBhNRwL32lWVCvpIb8VQPynrxCXSSlzo
	CWODf3CTSk4nYXc2FeShP30ZfWbi8URRFbQPSVGNU+p9Fc7HYhp3ZSL5oNCIbr0x
	4xs5VxkJvP98ESsdmQOajBTSvWTRdW38ji5olNwP3llDuus2fB7B+vGHNMpSaAXo
	6asWjTIZmwZje1gJW2rgn4xHg0NOIdCHGNoIjliCJzml1/SfqooLtC+cpZZM6YLe
	7LmVOLRSkKJHm3vN6plEN9SAHdz/WDovCSQAcA2nOPod9jGhmw8vQtw4B/GRbgW2
	5gmX3nFUhl0maT3fuxAsCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ejxq01m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:42:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5451U93s011231;
	Mon, 5 May 2025 01:42:43 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kdd7uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbxkZyvGe6fqIn0gwLHUmmsVkjljvHKYscT2WGPz7n7ayAiFiqMl7ixBC9Timpbt/CPxE/N2OfOoGC6q36J67lF+ThNZzBd3LfBnyvpGe0YR0R5hTZBc7tU1fPRvY1j11zoKCd8wEOtS2H3JpVW97PAr/i5IaNj4VYzyKfY5LmXv6Cfqy804EvdQlubZRkGJs1tdl9Kzmh4rlop+er8gWOJCOzvtr4oyGP7Dbzys+BUA758gRFZXh4gHB7AZDS5dcGBMRbsGFilOsHT6t21fg51j3YxnWkTYtaXW89S7oDL6IrpJ0deX3FuUlDfwAOW6ZpLMLYHhXJkX3NBHcV2nZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxO1qFBuBdvdE5gpnd0+h3sWDucACmO8Kv0wrv5OB2A=;
 b=ymRJsYya+D+GCSSQOvKHGBISk53WHDUgiORaauHl5hx9iAqfFfyyaEGQaXj4dZwsa4a9ilT99aSJroITTSPN6HxpQJ0ihZ8UIKNw5PjXg7L7NWWSqln7YbL6CMsKvAYJyVAJ1Hp7KuY83jARqLT7C2OSdoRrPFid10KDtSh39BIrrQckCe9q7cFMbDRIOVBB/JvTO5w+M4CNdOg/YMWi13R39IYJ6FspQPdfgROhklj2CUn8v1ALKkZE36qPo/zmLdW6KsX5U0GTjP7At8CU+ypam4TTMhGB1Lv/aoyZ0bMKoUUigBDquXoXf7+RQHBiAn31KfA7T6U/4bssHZqAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxO1qFBuBdvdE5gpnd0+h3sWDucACmO8Kv0wrv5OB2A=;
 b=qo/ujTudYSFmDEYwVKOEnHtP4UhB4RMqyiXK/Is+Zu5DBamJoApEEMaj6HG0aBWPtq9VKIGXq2+86oDEtv9SmUMnQqQRavvj1AL5CMfFz0bqzg5pN94dPQ+BjiAonbROBs1pya+bEGbUsqpxqiZ1SmQOp3alkQlM5Hn6deK64GM=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 01:42:39 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 01:42:39 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Index: AQHbu0F1MdTMmRhrrUCPTfzyEjyJ57PDR2cA
Date: Mon, 5 May 2025 01:42:39 +0000
Message-ID: <1C6AD918-7B12-4A48-AECB-9BD609728D3A@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
In-Reply-To: <20250502090529.GU4198@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|BLAPR10MB5124:EE_
x-ms-office365-filtering-correlation-id: 71c66609-d953-4bc5-3fac-08dd8b761ebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N0FZQXMwc3V1WTJJZFVyWkJHL0FWTndtSWsyV3lSd1NleTlkUFFHd0Y3MEpJ?=
 =?utf-8?B?dEFNUndPaCtZNGZlMmpVUWxFQ01hYVZmZm5RRnAxR3FkMVowb3A4SUE3VEtr?=
 =?utf-8?B?azNLeHorVEQzOVMwYlFUQ1JlKzhHcWxtcGpNdDFOOG9IYTMrUHJKWTA0TzhI?=
 =?utf-8?B?amNESjNIRnNNQjFRVEhMU0hjUndLVGJRU3Z0UStjcFV2UTVTWDhqRkRqU2J5?=
 =?utf-8?B?Y0NpaHRhWTZoenp0dHNDbHY5c3NIT3I5Q0kyaEVGK0RjYjU3RzN6RUhCVHVi?=
 =?utf-8?B?UXd2aTB2YUFia1gzSmlzTUdmc0RRMFhkSGtwcG9hOFpFbjVOWDdTc0Z3WW9k?=
 =?utf-8?B?c1NERWhrcGY0TE5sTUhPTko0cWd1V29kK1V0cFhCRVFhWG9ZSDMvNnpNY1VK?=
 =?utf-8?B?djlCY2pSalVSRzc5TXdwcytydFhFZHlidFc4WkRNZjNWb3FpUmFXNzQwc0da?=
 =?utf-8?B?OFJxczJ4OXZEblJEWlJKbEh0Yjg4UXRMcGlReWtVK3ZZN3AzZUNYeGtVZGFK?=
 =?utf-8?B?aTd1cEoveDF6OFFEdHZnNTFNWiszU0NrendMQXQycXRVSS91RTgxK3pTRldS?=
 =?utf-8?B?TkRFUkRzcGM1VFJtYm51eldnUmxrWEtlR0x0RitCRGozUDUvVHcvbGFFU0R5?=
 =?utf-8?B?Nm5QS1VLVDVFRXJNVm9IU0hiZ1BIaGJMUWlySDhhWE9YWUVIMzVHaWNVWVZX?=
 =?utf-8?B?ajBMSmVnSE5YcTNmd3g1UXJqRWp0VzA4WkhNNUJkL1pjRDh5Tk5lWXgvV0xv?=
 =?utf-8?B?cUxIaGlxODg2cXppSWYraXRGZWthMlFlekFlUC9LTUZBeGk0ZE9BYUtFKzJE?=
 =?utf-8?B?Z2U1ck5ST1RGZWR2QXpXM3p1NlRCdytzZ3MvbThUc1RWWjJ0S3Q0dzZxQ25Z?=
 =?utf-8?B?Vm5VeGFUYWIwRnBmWk5UWUdjbGkwQXowWWovR2RIejBqTTFyVzVwMWlzcGpK?=
 =?utf-8?B?STkvejhDRGpybytpR01wVVZ0RVhqWlJhM1ZVcVJLS054K0V4dndrQTIzSUJ4?=
 =?utf-8?B?ZkNJMHNINFpxRmNrS0ZRaFZvRFN4Ykk3NUxoQ21kaXd1VC82NFBubzZKS2JW?=
 =?utf-8?B?a2Y2WjUrLzd2NFRKQ0ptSVR2WXJGTEZ5UWJzSVdZTnpNaysvWEVCeXB6VVpI?=
 =?utf-8?B?TGFJVTBYQU5paHN2a3prUDdBR0hHWjZTKzQrZHFCRy9UZ3lreVR2U0FwQ3Za?=
 =?utf-8?B?b3ZPVGFTMlpFRXFZSkdTZTV5TUdDNEh2bnUvNSt4c0tKbWR4QVNUc01wMjdn?=
 =?utf-8?B?TGl2SGVXalhuK2tsSXVxbVFscFpmb2ZoMG9SWFRkenBMbURlZ3JreVAzNytU?=
 =?utf-8?B?dTE3SXhGcGVLRWJCNll6VVhaQzJSenFBL0xIS1UxQXo3cHkvdis2RVZjbkN1?=
 =?utf-8?B?T3NTdTRLYlA2Rjg1SFJ2aFlSdytPb2RzTnY5dUxlSE9zdmsvMWN2TG93RWpK?=
 =?utf-8?B?TTdyQlZrOFBBUCtkV2lYYWlYdEVyNDl4cloxUFZ6bW5lcElXUG12Z2RjNmRL?=
 =?utf-8?B?cFM0T3lmYm5aNjhzeXRMbmJUM1Z6UkRKaHJKcnFrdnUwdzBZOEY4WnhKcHFE?=
 =?utf-8?B?Z2FPdjdPQmptK3IxdnVVQTJuWC9VVzFaeUN5MG1KTVUwMkRxSDl4N3ZIbGJN?=
 =?utf-8?B?Z0h4cDhjSitnai8rM1RodjllZzUyRE92Qmo2eVdzSzhhemZMSE04YVlGTERP?=
 =?utf-8?B?ZEZXYmZwRHJFRVJVbFI1b2xEc0ZwaXlZL0dzTUdCK2dYUGU4dkpsM2NWU1d5?=
 =?utf-8?B?bTFhelo0b1FBK0RVOVZqY1V4V1lUeDlBNlpkLzh2QjB4QzNON0VVaW1jd215?=
 =?utf-8?B?MXlMYjlxMVpzNlpuWWNDZk5aVmdGRXRIaVlSRDRQSXNxNHZveTJGZ2VhWUk2?=
 =?utf-8?B?amNrN29xRFdPeHYyeFVwcnAybWdCaFJNbThFUFpBYWduTkhVdU1sNUdueGh3?=
 =?utf-8?B?SVliZGk2V3E1ekVJZ2JCYlc1Vm8xQTVDcDBhNk9jVlFEcWhmOVJyUGpHcUov?=
 =?utf-8?Q?pYQozwTUpVDzMRnJiPowGpYwAxx2b0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzRidXNKWlZIeVVkck5BdStEUzQyWUU1a1A3NFZXeHUvZ3NyL3kwbFZCSGo0?=
 =?utf-8?B?eVFxa1pldWt1cHUzRHhMZHNSTWN2WWVveEpTU0NEUkZoUElGWUc5dTlnamFM?=
 =?utf-8?B?TnpRMjV6WFNPL3ppZXF6Y3hDaUhHdmtFM2ZRbkQ1Ri9OTFlTNC8rMkowYWRC?=
 =?utf-8?B?Tm4wL0xmMVpNWmo0eGlFa2NYak5xNEYzbEJzMnRMS0crMFZmVVkyZTdMOFNL?=
 =?utf-8?B?TEZ2Tk4rNjRucnJqQVk1aFJqYTgxL0kyTzk0T3Jnb0dCVEtMd0VaWVdVUWty?=
 =?utf-8?B?S0lJTGdTMllMNFFMaEUzb1gxbWJ4Y3cwdXZvSUFaU0hhYS9HclhNYTVIZTE5?=
 =?utf-8?B?djN6SVZ3UFUvSnpidG9yNGFYYzFjU0R3SW1lZS9lT1VUSWZhZzdTMFNnRjJC?=
 =?utf-8?B?TVkrTGgybkttTHVqbHY5NisrSHovUHlORFd0NXpmSXJkU29rVHFGTWpkaXJH?=
 =?utf-8?B?TDBIekY0WDJzSlBjU25GOWgzaFlhNFFrMmgxc0lDN0NTa0N2MHFGQlcwTS94?=
 =?utf-8?B?NjFLUUdkNEUrRldnc0hQOVRyVnNNV2xkNndzOXoxdHhZM1NZd2NyU0tBMEpR?=
 =?utf-8?B?K1lDQ0I2UC9lSy9LR1ZJc09pajF5YjNwZEJnM255N09TSEJ6bkwzQnBTK281?=
 =?utf-8?B?OVYycXBkeTRNNkZxT2JQNFQyeTVIeEp1REgvTHJ5MDJqQnhTTkdKdmgvcHBu?=
 =?utf-8?B?SXRyOEkyV1A3M1ZLWXlUQVBueFdFZjE5SmhyNTc4VklUWjZ1RjVPODVObUwz?=
 =?utf-8?B?czEwbm5aSHJZQUdZY1NXTmhiUmVEaEZSR0dxZlFwL1BORzArZFcxYVRwQ0hs?=
 =?utf-8?B?eHRpajQ0WFlQVkFDdzdySlFyclF0U2ZNTXorMlVpaTVLSi9UdHFBOGNiU0ZW?=
 =?utf-8?B?Uzg3bDdBbE1RcldNM0dJTGxMWlZ2czcwaU1ScGtJOFlqdWcxekdyZkJ0a1pp?=
 =?utf-8?B?SVVEbUc0NDhadWpRV0RMNVlXc29oUVRWMHpoWFRON1BuaHJzV1pGL0ZON1hD?=
 =?utf-8?B?UVU1YmtpaEloZ0dYYWowalRNWVhwdDEwK1ZJdWJaL1pNSjJZbzRvc3QzUDdU?=
 =?utf-8?B?ejhsMzV1ZHIwR1p6V21JK0pGbDduemVQMFJ2SW9QczhtNDRkV2ZxcERNSXda?=
 =?utf-8?B?M3NtZmFFbVM5QXh1eCt6aWdJQ1l6T29kYUdYcUwrakJKY0dzMDJGaU9aVk9S?=
 =?utf-8?B?VFVVMUVMMUtZOUdSSldSekhiV0NTT2xkaFIxQlRKYVlJUGpaeVlYYjcvRmpz?=
 =?utf-8?B?UlRGcjBDUHhJTU9WOVFHU0Z3aEhUVkVrWERHM1FqV295Y2NJWS9FS2ZtSEZS?=
 =?utf-8?B?WE8vVXdpanFEZDViY051SFlvOXBjanRiNjJEeDBBcGRoVEo3ZzFiMVIyM3VX?=
 =?utf-8?B?a2hiS2tKQWpXYStraG5scWxNdnJFVm5oUkJnRVduVktWQmNJNDFIV25wL0N5?=
 =?utf-8?B?SURCQnNZQ2ZLdnVrNmw1Y2ZURWhqSCtTeWVVMm9pS0RrUnkraDl3M3FWUVRv?=
 =?utf-8?B?S0lzQ3hEZXpOeVhpVC9rQ1VjWDhXaFoyb0NFQVZJZmhqZ2Y0UVB5N0ZNSnVN?=
 =?utf-8?B?MnZMb01LVnFSdnFkbTRoTUZjbmh3ZUQ1aGJnOHZmUHBoM3BDZ1gwR0VXakEv?=
 =?utf-8?B?d0dPUkdXeG9FMytjSnFDTjNZVGw5bVdlb3JSL2RjWUxzU256a2NjY1V5RVNF?=
 =?utf-8?B?OWdDTmFjOWJabFRCV2IzMVNUd3J4eXFnSzdabHQ1c1BBZ213eGhrbG9OWGxz?=
 =?utf-8?B?NGxpMGRKQkMxRkNQeE9jMVNxL0lXOW95c1JCekFSZ3NxK3FoRUR3akZIMGY4?=
 =?utf-8?B?WjZIMTFtSnJqTVlocnhNR2VBNkZDclNQT1RvNEs3YWRGU3NVWTVLbjVmQ0JN?=
 =?utf-8?B?VFNHMVZESTlWTEpOckFGa3ZLVG5FM0FJSDRUdXQ3V3VhUitsR0VQNVlhbGFC?=
 =?utf-8?B?MFhEWWhKYm01M0xaWkpwc0pPY3NqcW1zVmhHdjZTTTRRd2NrZEVKQ3lRZEtR?=
 =?utf-8?B?alZLRkNnbXEyN0RFU3N6aklDZ01VajFzTThYZ1A4dlhIbEM0MWdBY0c1K3JY?=
 =?utf-8?B?VUh6RWg1NElacWhiSitNVGNsa2k0NjJVdTBjU2RMVFdjODk2VlJQVlBMaHpv?=
 =?utf-8?B?clg5WEUrcjFGUEdTdlVLYkp2eWhVZGtmWGxZK0gwd0ovVm9rRWg3eU9mZGlQ?=
 =?utf-8?B?dVJFb1c3eXVmYzhndHJTN0NVYm9qa21mUndiUXIydnd3ZHpNakhsOVdKd2JH?=
 =?utf-8?Q?Ua4jsFigLFb5V6xmYG7L3Q/RmcGv6ztQEYovt0Vivo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD4BF72183C6CA4C904C7833DF0AF5A1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rH8NdKlsW4pSZZLmTRo8OBn/GHugwVCfhxVdGu8HXq08IbqFnWs5BhuVWcJCSV62YO1LkPU7ZptDh6jPqGUKbbgxfXJIv+V+LbazrB0tfq/628QTaFfLpb1tx/99qvMr4uZcB6cKciCSpo76RqV2lioE6DjLIhKHC1rwSsz7Z0OgH0Jbryagn9YY1gQ7BaMKlRzqtn6tqfJOOXdOQpLP32dncDvWqA+CYBFQtz++NAJHOU22O9lSV7FRjFkFQkQYNcYVncSBHSncOtck+oq9d1oUsGFK/N0aYNI1rPK8GCKdccEwQzvHj0angOyjDRb3K3lTGd7OEpNJo5bRNhEELXmvmhXwrofTqx7LpTWQPL24p91PzPQwUVlX5V5FZKCV9kNzp2cErKv1oVuwuvtZWjZYi68qetpeHwwdXmGEOSKmj0IE22CPxExgIz4syctwoVQiWY4leDvnqTta/fjc1EMJuvE/rEgTwmQKBZOVaYzIUdVjU5s0JOUBwxhmuz6YaIF6F267g7pHoOiDg904N4cn+KreQ6an3Z7iuW76YbZH7Eo9N1mrMtEOwxi+RIgQ0EkJ3OvmUojw+W6HCV8PQBnNLqAUN8iuKSqEWKPdUm0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c66609-d953-4bc5-3fac-08dd8b761ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 01:42:39.4079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOQpkiEU+mG9vCMYU1gG0OD6LbNMGTsNfmrzHGUmcESr2yubv1KaVk3uFiG450ybHPMMjFhlrhr53UoQTlUJ2YWTo901bwiXva83m0o1CLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050015
X-Authority-Analysis: v=2.4 cv=JI07s9Kb c=1 sm=1 tr=0 ts=68181794 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=UqOtqtwQip7n0qb0040A:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: ONlox45wnPvEHu0aBZTAzWMQ0fSk_1nJ
X-Proofpoint-GUID: ONlox45wnPvEHu0aBZTAzWMQ0fSk_1nJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAxNCBTYWx0ZWRfX9/+TqSRzy+6a OArrqU9oKCZ/AQNrbhHGTMjpR1IBdxQsYfvHKDFpD7/SVbk9iTlM3dktPgVAn0eMzt/X4aoCFMH wEUWw02cr9hDInkUSKtSRIoKl6kKLI5yym37AhjOC7DHWTygQxSKxI4YWzWdwhtSuTYufOgEWlQ
 SRZpxQw4fWhEXYAdpg4SIYsdIuHE1XjuB0Y2UcYv5G9WbGCB1G93Ln7nfJW/itChtdw2aIS6u10 Q6I8rDwY8Z+aQSc34aLRtZ3tKnI3+e+mjxq4fT2xLxrX0St7paZ6PAVjX3zIUVpcPYdq3tWGdYE CFSKGlr29TatU/6vFyyD2Sp3Cp0Rv7qLdSgg8HZMo4gizM443x/Dn/JI7+IFkPsTYx2T8foe3Wz
 NGShXpgIuNBR/5qpm0zh34p5EYxdaJAKrk5hp640OblxxcMAErtPEYgqcSohrIbtQB9Ah/5p

DQoNCj4gT24gTWF5IDIsIDIwMjUsIGF0IDI6MDXigK9BTSwgUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTWF5IDAyLCAyMDI1IGF0IDAx
OjU5OjUyQU0gKzAwMDAsIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBm
b3IgYSB0aHJlYWQgdG8gcmVxdWVzdCBleHRlbmRpbmcgaXRzIGV4ZWN1dGlvbiB0aW1lIHNsaWNl
IG9uDQo+PiB0aGUgY3B1LiBUaGUgZXh0cmEgY3B1IHRpbWUgZ3JhbnRlZCB3b3VsZCBoZWxwIGlu
IGFsbG93aW5nIHRoZSB0aHJlYWQgdG8NCj4+IGNvbXBsZXRlIGV4ZWN1dGluZyB0aGUgY3JpdGlj
YWwgc2VjdGlvbiBhbmQgZHJvcCBhbnkgbG9ja3Mgd2l0aG91dCBnZXR0aW5nDQo+PiBwcmVlbXB0
ZWQuIFRoZSB0aHJlYWQgd291bGQgcmVxdWVzdCB0aGlzIGNwdSB0aW1lIGV4dGVuc2lvbiwgYnkg
c2V0dGluZyBhDQo+PiBiaXQgaW4gdGhlIHJlc3RhcnRhYmxlIHNlcXVlbmNlcyhyc2VxKSBzdHJ1
Y3R1cmUgcmVnaXN0ZXJlZCB3aXRoIHRoZSBrZXJuZWwuDQo+PiANCj4+IEtlcm5lbCB3aWxsIGdy
YW50IGEgNTB1cyBleHRlbnNpb24gb24gdGhlIGNwdSwgd2hlbiBpdCBzZWVzIHRoZSBiaXQgc2V0
Lg0KPj4gV2l0aCB0aGUgaGVscCBvZiBhIHRpbWVyLCBrZXJuZWwgZm9yY2UgcHJlZW1wdHMgdGhl
IHRocmVhZCBpZiBpdCBpcyBzdGlsbA0KPj4gcnVubmluZyBvbiB0aGUgY3B1IHdoZW4gdGhlIDUw
dXMgdGltZXIgZXhwaXJlcy4gVGhlIHRocmVhZCBzaG91bGQgeWllbGQNCj4+IHRoZSBjcHUgYnkg
bWFraW5nIGEgc3lzdGVtIGNhbGwgYWZ0ZXIgY29tcGxldGluZyB0aGUgY3JpdGljYWwgc2VjdGlv
bi4NCj4+IA0KPj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWxqc3RyYSA8cGV0ZXJ6QGluZnJhZGVh
ZC5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQcmFrYXNoIFNhbmdhcHBhIDxwcmFrYXNoLnNhbmdh
cHBhQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2xpbnV4L3JzZXEuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9yc2VxLmgNCj4+IGluZGV4IGMyMzNh
YWU1ZWFjOS4uOTAwY2I3NWY2YTg4IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L3JzZXEuaA0KPj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3JzZXEuaA0KPj4gQEAgLTI2LDYg
KzI2LDcgQEAgZW51bSByc2VxX2NzX2ZsYWdzX2JpdCB7DQo+PiBSU0VRX0NTX0ZMQUdfTk9fUkVT
VEFSVF9PTl9QUkVFTVBUX0JJVCA9IDAsDQo+PiBSU0VRX0NTX0ZMQUdfTk9fUkVTVEFSVF9PTl9T
SUdOQUxfQklUID0gMSwNCj4+IFJTRVFfQ1NfRkxBR19OT19SRVNUQVJUX09OX01JR1JBVEVfQklU
ID0gMiwNCj4+ICsgUlNFUV9DU19GTEFHX0RFTEFZX1JFU0NIRURfQklUID0gMywNCj4+IH07DQo+
PiANCj4+IGVudW0gcnNlcV9jc19mbGFncyB7DQo+PiBAQCAtMzUsNiArMzYsOCBAQCBlbnVtIHJz
ZXFfY3NfZmxhZ3Mgew0KPj4gKDFVIDw8IFJTRVFfQ1NfRkxBR19OT19SRVNUQVJUX09OX1NJR05B
TF9CSVQpLA0KPj4gUlNFUV9DU19GTEFHX05PX1JFU1RBUlRfT05fTUlHUkFURSA9DQo+PiAoMVUg
PDwgUlNFUV9DU19GTEFHX05PX1JFU1RBUlRfT05fTUlHUkFURV9CSVQpLA0KPj4gKyBSU0VRX0NT
X0ZMQUdfREVMQVlfUkVTQ0hFRCA9DQo+PiArICgxVSA8PCBSU0VRX0NTX0ZMQUdfREVMQVlfUkVT
Q0hFRF9CSVQpLA0KPj4gfTsNCj4+IA0KPj4gLyoNCj4+IEBAIC0xMjgsNiArMTMxLDEwIEBAIHN0
cnVjdCByc2VxIHsNCj4+ICogLSBSU0VRX0NTX0ZMQUdfTk9fUkVTVEFSVF9PTl9NSUdSQVRFDQo+
PiAqICAgICBJbmhpYml0IGluc3RydWN0aW9uIHNlcXVlbmNlIGJsb2NrIHJlc3RhcnQgb24gbWln
cmF0aW9uIGZvcg0KPj4gKiAgICAgdGhpcyB0aHJlYWQuDQo+PiArICogLSBSU0VRX0NTX0RFTEFZ
X1JFU0NIRUQNCj4+ICsgKiAgICAgUmVxdWVzdCBieSB1c2VyIHRhc2sgdG8gdHJ5IGRlbGF5aW5n
IHByZWVtcHRpb24uIFdpdGgNCj4+ICsgKiAgICAgdXNlIG9mIGEgdGltZXIsIGV4dHJhIGNwdSB0
aW1lIHVwdG8gNTB1cyBpcyBncmFudGVkIGZvciB0aGlzDQo+PiArICogICAgIHRocmVhZCBiZWZv
cmUgYmVpbmcgcmVzY2hlZHVsZWQuDQo+PiAqLw0KPj4gX191MzIgZmxhZ3M7DQo+IA0KPiBTbyB3
aGlsZSBpdCB3b3JrcyBmb3IgdGVzdGluZywgdGhpcyByZWFsbHkgaXMgYSByYXRoZXIgY3JhcCBp
bnRlcmZhY2UNCj4gZm9yIHJlYWwgYmVjYXVzZSB1c2Vyc3BhY2UgY2Fubm90IHVwIGZyb250IHRl
bGwgaWYgaXRzIGdvaW5nIHRvIHdvcmsgb3INCj4gbm90Lg0KPiANCj4+ICt2b2lkIHJzZXFfZGVs
YXlfcmVzY2hlZF9maW5pKHZvaWQpDQo+PiArew0KPj4gKyNpZmRlZiBDT05GSUdfU0NIRURfSFJU
SUNLDQo+PiArIGV4dGVybiB2b2lkIGhydGlja19sb2NhbF9zdGFydCh1NjQgZGVsYXkpOw0KPj4g
KyBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQgPSBjdXJyZW50Ow0KPj4gKyAvKg0KPj4gKyAqIElSUXMg
b2ZmLCBndWFyYW50ZWVkIHRvIHJldHVybiB0byB1c2Vyc3BhY2UsIHN0YXJ0IHRpbWVyIG9uIHRo
aXMgQ1BVDQo+PiArICogdG8gbGltaXQgdGhlIHJlc2NoZWQtb3ZlcmRyYWZ0Lg0KPj4gKyAqDQo+
PiArICogSWYgeW91ciBjcml0aWNhbCBzZWN0aW9uIGlzIGxvbmdlciB0aGFuIDUwIHVzIHlvdSBn
ZXQgdG8ga2VlcCB0aGUNCj4+ICsgKiBwaWVjZXMuDQo+PiArICovDQo+PiArIGlmICh0LT5zY2hl
ZF90aW1lX2RlbGF5KQ0KPj4gKyBocnRpY2tfbG9jYWxfc3RhcnQoNTAgKiBOU0VDX1BFUl9VU0VD
KTsNCj4+ICsjZW5kaWYNCj4+ICt9DQo+IA0KPiBTaG91bGQgbm90IHRoZSBpbnRlcmZhY2UgYXQg
bGVhc3QgcmVmbGVjdCB0aGlzIFNDSEVEX0hSVElDSyBzdGF0dXM/IE9uZSwNCj4gc2xpZ2h0bHkg
aGFja3kgd2F5IG9mIGRvaW5nIHRoaXMgbWlnaHQgdG8gYmUgaW52ZXJ0IHRoZSBiaXQuIEhhdmUg
dGhlDQo+IHN5c3RlbSB3cml0ZSBhIDEgd2hlbiB0aGUgZmVhdHVyZSBpcyBwcmVzZW50LCBhbmQg
aGF2ZSB1c2Vyc3BhY2UgZmxpcCBpdA0KPiB0byAwIHRvIGFjdGl2YXRlLg0KPiANCj4gQSBiZXR0
ZXIgd2F5IG1pZ2h0IGJlIHRvIGFkZCBhIHNlY29uZCBiaXQuDQoNClN1cmUsIHRoZSBzZWNvbmQg
Yml0IHdvdWxkIGJlIHNldCB3aGVuIHRoZSByc2VxIHN0cnVjdHVyZSBpcyByZWdpc3RlcmVkLg0K
T3IsIGNvdWxkIHRoZXJlIGJlIGFuIEFQSSB0aHJ1IHN5c19yc2VxIHN5c3RlbSBjYWxsIHRvIHF1
ZXJ5IGlmIHRoaXMgZmVhdHVyZSBpcw0KYXZhaWxhYmxlPyAgU29tZXRoaW5nIE1hdGhpZXUgc2Vl
bXMgdG8gc3VnZ2VzdCBpbiBoaXMgcmVzcG9uc2UuDQoNCg0KPiANCj4gQWxzbywgZGlkbid0IHdl
IGFsbCBhZ3JlZSA1MHVzIHdhcyBvdmVybHkgb3B0aW1pc3RpYyBhbmQgdGhpcyBudW1iZXINCj4g
c2hvdWxkIGJlIGxvd2VyPw0KPiANCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvc3lzY2Fs
bHMuYyBiL2tlcm5lbC9zY2hlZC9zeXNjYWxscy5jDQo+PiBpbmRleCBjZDM4ZjRlOTg5OWQuLjFi
MmI2NGZlMGZiMSAxMDA2NDQNCj4+IC0tLSBhL2tlcm5lbC9zY2hlZC9zeXNjYWxscy5jDQo+PiAr
KysgYi9rZXJuZWwvc2NoZWQvc3lzY2FsbHMuYw0KPj4gQEAgLTEzNzgsNiArMTM3OCwxMSBAQCBz
dGF0aWMgdm9pZCBkb19zY2hlZF95aWVsZCh2b2lkKQ0KPj4gICovDQo+PiBTWVNDQUxMX0RFRklO
RTAoc2NoZWRfeWllbGQpDQo+PiB7DQo+PiArIGlmIChJU19FTkFCTEVEKENPTkZJR19SU0VRKSAm
JiBjdXJyZW50LT5zY2hlZF90aW1lX2RlbGF5KSB7DQo+PiArIHNjaGVkdWxlKCk7DQo+PiArIHJl
dHVybiAwOw0KPj4gKyB9DQo+PiArDQo+PiBkb19zY2hlZF95aWVsZCgpOw0KPj4gcmV0dXJuIDA7
DQo+PiB9DQo+IA0KPiBNdWx0aXBsZSBwZW9wbGUsIHZlcnkgbXVjaCBpbmNsdWRpbmcgTGludXMs
IGhhdmUgYWxyZWFkeSBzYWlkIHRoaXMNCj4gJ2N1dGUnIGhhY2sgaXNuJ3QgZ29pbmcgdG8gZmx5
LiBXaHkgaXMgaXQgc3RpbGwgaGVyZT8NCg0KSSBjYW4gcmVtb3ZlIGl0LiANCldoaWNoIHN5c3Rl
bSBjYWxsIHNob3VsZCBiZSBzdWdnZXN0ZWQgZm9yIHRoZSBhcHBsaWNhdGlvbiB0byANCnlpZWxk
IHRoZSBjcHUgYXQgdGhlIGVuZCBvZiB0aGUgY3JpdGljYWwgc2VjdGlvbj8NCg0KVGhhbmtzLA0K
LVByYWthc2gNCg0K
