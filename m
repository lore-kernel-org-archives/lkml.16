Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5972DE716
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521179; cv=fail; b=JpLc2NopdSxUc/abn6T5yGhS1sX0tjKay9CdzKEHtUSkX+/BWApimn+fvFtAmXeLvVNRvE3TzGqbMyciVMopTHqcC3k0ELBYa3IPlNIKf6ChsLJBPwCTR6cdmkSo8ws2odo3FZinBDKVILYFZzQsD1aJiM2I9SKEzNB3heAP+50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521179; c=relaxed/simple;
	bh=3lxYjdQAX382pgk24+ELqhcTFOFbWW6Mw0BlwWvxSG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kPqKtoDo+HrSmF9bpUJnScm9nGVhV93bYd4UWuE+yqi0qKlOa8C8eksaQMBbYBxqVKBFJCA8EZrxwaXK7o0IeNdkZkjunAvUEFJRSL41ZkIM/j8vjb92WtaMM180gN5vxNFFRrzwpH3Z+AUHhw6QK6Co1ydx1NdcOvwfeEwI0Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ii8TqLtd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W5DGARkD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ii8TqLtd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W5DGARkD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Ng5KV003005;
	Thu, 3 Jul 2025 05:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3lxYjdQAX382pgk24+ELqhcTFOFbWW6Mw0BlwWvxSG8=; b=
	ii8TqLtdbIxjA4g+DfSPRp88RaaQEWn4ryBCjVT9G0kPrqCe+oSb9NK7zwyLMDuP
	36ZkIbqvQgAU0i89NRC6zxF6S6j2E/umsQSwKlNVVXdQQrQCIb7AtH9S5GgyPpxh
	vUnF6kWuEoaBem39PcPlqgfQ5PNb99yTl3L3wLRLOogF/G8++ZNzJTBJf4evA8qV
	3EWPzY355rywmkzgLCQQVZJJdTM9ZCYG+CL4wCFcXKN9DyGBdTIRQomk10AJevA2
	PloNfZ3Qvr2i3JBiNnXq/NiMKqGYFkVZVlBCNsm54HGwrpmgsgjwjoHoxYxq1cfT
	/Rk/Ae1F2Ir61axQLqY8tQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af89wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 05:38:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5634UTGp019578;
	Thu, 3 Jul 2025 05:38:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubwmax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 05:38:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaJzTxHgpUyGx9NDz+QnNCNVqIJ8ciHU98bwExCwtuDUGoCRCFQaIGuwvA7rmIL3tk7ac8/A4qDMPAUkAgSm7uG2jU2bcuYvDgNuO9FvOEhSD2uZWw+JEBL64MLSZnKT+PEtLd/aG/5+c0xou6L4HoBjFe9JmHAaCFR7mGI/GmhRFzP0EZACW0m2Tknv40zmNRgMdgZNeq7Wyok8JtkrRn3qfI8TbQ/UzFk8TgvTgeNk1pJLQmwb49Xg+9ftsGkMw4Yf9aig8caSfji3Wgxn73spV3kpK7E0vQuOJbErq+EoveHFIG89MyBeglnIAf9HCSvVEArXgzHJgB7vSck3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lxYjdQAX382pgk24+ELqhcTFOFbWW6Mw0BlwWvxSG8=;
 b=EqiB5CoPQmiu+Tz3co8gHZ4RdUdLAbpouZ9BIfUWedJh0cjZExjSreJxNNBogo2z3zpP7iBzi7z5cUNgrVMI9csiTl64mBowDuW24A9iwTlfr+WhbNy8GZdqvwUb2yPbx8PWdNBAkuqzKTM6lXg/ERf2ErtYw65DlT+iDQjWlA2zc57MIK9G3M3af1TQm2D8I3kYFNrMDHg36nxWcwl54wHkzpV3PNoQ+J1pePJ0ZV446d9pmnXGqZWTMAXdoZEoUR4KKQfTxFrxWO9x4bCLgmUCf5bvXcMWkOw/Qs0XUAHANAchwQuqd2vZ2GCean8HevaIX/VCOgAVxziztXhbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lxYjdQAX382pgk24+ELqhcTFOFbWW6Mw0BlwWvxSG8=;
 b=W5DGARkDGbBQCS6YnT6bGQiJkpqqRu1JP2UyJu0671rilXCh2zKavCOUZ57Kj/iLeLHC+DE39j/ZMSic+76wkyTMQnvYE1YgERblHDwFp6dODyyUzke02K6D4STeoAeu2uLrT4GkfiHobvvAcbzMflCdzl+qDl4WPN7KF8g9cOI=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CO1PR10MB4547.namprd10.prod.outlook.com (2603:10b6:303:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 05:38:48 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%2]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 05:38:47 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Peter Zijlstra <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V6 1/7] Sched: Scheduler time slice extension
Thread-Index: AQHb6mQg8fTfviPDoEajr7rQRNefB7QdGOyAgAAb2ACAAq/jgA==
Date: Thu, 3 Jul 2025 05:38:47 +0000
Message-ID: <E5C37D1C-F220-454B-B152-4E30C2D7827C@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com> <87cyakmhdv.ffs@tglx>
 <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
 <87wm8skrzj.ffs@tglx>
In-Reply-To: <87wm8skrzj.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CO1PR10MB4547:EE_
x-ms-office365-filtering-correlation-id: f36c4f4c-38f3-475b-c639-08ddb9f3e228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aDcyek51Y1l0SW1QYk12K1FzZ3JKMlhWNnkwZ2pnL0pEbVN2bG9wWUZVdWVi?=
 =?utf-8?B?L3drVERSR2k5bHluMnZGUi9HN1d1cHFTR3NGN0FiQmRlZnNCMW1lRUlGSzNk?=
 =?utf-8?B?TTlmdzRkY1I1enhuL21tRC9pOVJkSENQeldXZVVDWnA5ajNvOGd3L0tTaUpU?=
 =?utf-8?B?ZTc1Tnk3OXdYbGlQdDN4VFBaeFlyR3hZbnNQV3dhQ3ZNejl6RGRsRWlaUEth?=
 =?utf-8?B?dGtmak1mbkw2ekM0SUNRaXJnRzdsSG9pdUNEZjFuSCtiOW5GOEx5WWpLNU5o?=
 =?utf-8?B?WUl2MFlGOU1iUzVZam9uVXZCUWY0bmg1UEFqQkFMLzdKdWRDTUZFL1MzbXlS?=
 =?utf-8?B?UmJVb3Bva3hkSnpGNmVReDJjN2twKy92d3B1UTB0QzNMUXNRbDQ1eCtNcGRI?=
 =?utf-8?B?eURxM1hUbXRubUNKTEwvQlBQYkt3K1VwZUdZRlhCTHZWeDdrR25CKzYwOERy?=
 =?utf-8?B?QTdQVEVwQjFRc2w4NWIvK1QrUm8xVWxPRmZDVzF4b3ZJd3FscjBUOXh2ZDRC?=
 =?utf-8?B?ZFQ1c2cyVUMxckd1Z0JQcFIvdXhrRFhhZnJlM0dVUUY3M3I3OWxsS1FROElh?=
 =?utf-8?B?TWJsamhQbFpkTERra2I2cVl3OE5FUVhUZVh3a1lMdDhaNlZ6N1lCRkgxV3VL?=
 =?utf-8?B?Qjl3TGZtVFhIMWRiTHRoekRwNEpaTjRaWTdGQW00VzQ4bzZVVFZObWhtSm4v?=
 =?utf-8?B?bm14L1UzZGp6SGFJM0IzMVY3MGxCNlV1VGE0RjRwR3owU0NZdjFmL1lVZjli?=
 =?utf-8?B?azJpUmhvVERuU3QvWHlkbmVJdTJzMzJtZXNDTVk4cFQ1dUVuZXMra1JLd3FC?=
 =?utf-8?B?d2hrbnhVaUF4bHVVREJkMDVmemRyTVZhbXBISEpUdjdFbXlSUURhU1JhUGZt?=
 =?utf-8?B?ZTlDZ2c0V2xSbmhUVWZOM3NhSVFnNDhPNWVhRnc5dENZdDNVSXNSTjR6U09o?=
 =?utf-8?B?VDJROXdxRDltMElUeVc0VDhoRXdFR3JMZ3M4UGZBbnl3dUp3V0htZVE1a0V4?=
 =?utf-8?B?NnV1U2hHNFVDdDdobmR2ZFBPcHd5SlE4RGRNVTZVbVB6NVVuMldJTE55SldF?=
 =?utf-8?B?NnJFTURsN3lNTVBkYUVYS1hlSnlDL3hoUUpwSzBWK1lURTRkUU1zRzFlYmwr?=
 =?utf-8?B?SkcyOFNVYmNWNlFpL3RJV2RvME8vdU9QUWsrVVN4aG92VzdPbWVCTmR6RzhN?=
 =?utf-8?B?aHEwUFNnU3pIMXBJWDhDSlBRT09LU01XRVFOaURWdjdlY1RmZTlkNzhVZDMr?=
 =?utf-8?B?MXp5ZDE3TldEYlQ2N2xSSXZaYU1XWitWejNYbnFkSDRuZHRSRlNOTkt4ZWhh?=
 =?utf-8?B?Y050ako3b3JEMHNpS1h0SlJTWXEzYVd6VFpTUytoTC93OHBZazZXbTQ2VmhF?=
 =?utf-8?B?QWRGVTlza01mNXZYVkY0RjBWYjZDSlNGT3FtR1lXTW1LMHZXc0dwU0M1aE1w?=
 =?utf-8?B?c2hNNXp3aDJVb1dtZ2xrTDZxeVRrV3JrRjBvRXUxWEFmeVZ0Q0M3Q3VZSzRy?=
 =?utf-8?B?UzVBbjVyV3N2dmtLV1BzS3JBR0c5N0RLbTBNcStqR0I2WGl5UkxFYVFLMmdt?=
 =?utf-8?B?UGNNZ05OS0lVTlcxbC9TMDJwdVNnN0RPeEtnTkdVSTN6SzVMcTJQOHlsenBM?=
 =?utf-8?B?V2tGam16ME5RRUpoTDBjQkZqNnBZRzlPNStnejM1cVRGMEdIaHRqaFVFLzBC?=
 =?utf-8?B?c01yeHZlK2xTZDFGckgzOW9VQU51WUxKS3I3UzFEbFhrTzZETGFCNkUxb0xG?=
 =?utf-8?B?NFBzOWN1RldWcGs1K2p2cnlYUVEwdE5YcjRNaUZ0SGVXeTV0SGdJYTY3cjV2?=
 =?utf-8?B?QThZZ0NhNXBPTXN6MDd1UVdkYU1IV21pL1Bqb0xNRUtXbjlCVVpTUmR3eU1Y?=
 =?utf-8?B?ejlDSlNJbWtGSWZuUmN1d0JSWTlGejBJTEE1dmoxZVRyYUtnbUpFaElZTHV4?=
 =?utf-8?B?c1hKNFJuMzJ3R2ZxVWZrek5aSWJITXVOOFQ3U3d1OWpKclJZNFdSQ2t5djBR?=
 =?utf-8?Q?3SP2aegiVthUisjgP8PZjF/JlNBd7s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGpDWVZXR1VaN3VXK1dqTWc4ZERNOHZYTEZVRC9GSzlkc1pjVlMwblZ2YmZr?=
 =?utf-8?B?b3RuQ01SeTBwaTlKQXVkelNZd051UTFWWVAyd1ZOMExOMnlnWklOeWJQVjlk?=
 =?utf-8?B?cksxdUw0eVFQcmw3M294MWdOQU84WkMxRGNrbXppK05UZCtEUHlHRExvTG8r?=
 =?utf-8?B?STZBbkowU05GYTdNelRCN214aE0valkzSWRicmlSZm9oQnBYTHFUcHc1VFVT?=
 =?utf-8?B?YzhDbTlCZmF6b2Fzb09HRDI1ZHl2OTB5cnJXd0NEZHZacWhTR1VsTEppR01N?=
 =?utf-8?B?TzFFZXNPTEhPelNPa2c3am5CTlVJM0ZiZjBIYVJ6SjFETHVDU1dnZnUzREhX?=
 =?utf-8?B?VmRxS0FVREFGenhTOEd6dUN3Sm5JOGU1TCtQcWplc3BDZGF1TnZtWE9zcXcy?=
 =?utf-8?B?RXNUdDQ4N3l5Zzcyeld0K2dZMm0vVVVaRm9wdkNYbE9oYktVUGVHa1NEM0l0?=
 =?utf-8?B?cTRBVGJYZXVsOFBkVjkxWHZwZzB3SUFPcE03K1BFa0M1OVRiS2JzM2JCalM5?=
 =?utf-8?B?UUZpUWlBWjZ0aGx6YVQzY0NsckVRaHhjdlprcWlPWEJJU2pUWUszRmo4Z1Ry?=
 =?utf-8?B?dDQwUUhyUnIzU3NENnZIRDIydHdONnBpV3ZXMG1KaVpWK3ZRbDNNVXQ4T1lw?=
 =?utf-8?B?aExnbFlPdnlnZC9uK284MzFDZDBCeFFRM1hLc09TbjdWa0gxbWM4WmFvMG5Y?=
 =?utf-8?B?WURXcUpHOVJPTEJDcE5rd1prYWRlK0FjcnVjTmY0VlRtb3RYbHNSbEtSYmVB?=
 =?utf-8?B?MzZjV0MvRU1qWWdRZWZpeGFIRDNiM3VqN0hVMHJrUmZFR1JWMjFUS3BjbXJM?=
 =?utf-8?B?Vzk2ako4Qm1pT2xsckJVaTFuR3ByY0NPSlZrc0VLamxHbmxKSnIxb3ZRaTJq?=
 =?utf-8?B?TGJOUHl2Z0N3YS9GOVZERG5xdnVmSXpoWVJ2ekd1alRlNkFsdG1sVkJtTU16?=
 =?utf-8?B?ZHBCODlBVFhsNEhjbERPVjhFMWJoWmU4TkdGdUNTVEN4aFNGU1dsQWlLaGl0?=
 =?utf-8?B?MzVmOFZpV2tuTGQyR0grTkZWemllVWJTMThaYVd6cStSYTVHY0J1Y1JaSTlo?=
 =?utf-8?B?WlRqVU8zaFZzbDF2Y1pxazd0cnNtQUwxQzE2czR5ejc5bm92R1c3b0ZFR2VK?=
 =?utf-8?B?ZHJjTGxjbk9BRzVqcEU2ci9iaFVvM2JiaEJIWDhWRElod3E1VEphN1ZKSUkw?=
 =?utf-8?B?c0tsbzk5OGlLKzF4c0xKczVDRVB1MzBPOW1yQ21JUWZxbjJoUEFtL0ZJMjZQ?=
 =?utf-8?B?eXYzSzQrVUJqOHZod3ZTcmZHVFVsNjRKdURNbmFTeHNFK1ZxL1R3Vy9hL0FC?=
 =?utf-8?B?bW5YYmk1Q291d1dkejZubmkzUmpKaGJUTlRHMk1zSlQwNXkrRGs2a09yTERr?=
 =?utf-8?B?ZDN4d1F3ZlBRUjJWUmdVRVQrbTh1M3lEd1NGTXFlSEl5NDRpRGI3MzMrdXhx?=
 =?utf-8?B?aStYUE40ZTF0RnQwOUZEZjV6UE9BYVdsbWRNSXpIQXNNTjdSMXV1ODZFOFRZ?=
 =?utf-8?B?bTVEL2dpTFZXdFZzU29aSndQZVdpb0xPZlpOdWZyaHNXQWc2dEdGVTRORC9H?=
 =?utf-8?B?UHllc0oxeVc2MlVlVHRTd0w0V2VkS2U3ZkxQbkpiMTg4b0x4UHBiNVAvSjVt?=
 =?utf-8?B?VllMOG8zekNOZ1YwcDB6UG9NSFIxSHBrbUVoYmsyOERMMkllUWVpMDBIeFlk?=
 =?utf-8?B?WjJRcU1TL1JSQVBjcmlzQ2tveElYbGRVcnQvWGJpcGZ4clZVWFcybFc0bmR4?=
 =?utf-8?B?QXdQQlZuL2swVkIvMGtUTi8waXM2a25mSkxpeEVnTG9FWHFxcCtaczVyZEU1?=
 =?utf-8?B?L2ZWM0Y3TGpGQ21RcjRZeUVXM1VPeCtVc25URTNFZU95ZC9VOVVpbjlsOXMr?=
 =?utf-8?B?SjZGSnZTS3llM2h2cHJoMjEyOWt5YlFaYVlPNUVIZ1lId1RzNGpXVk04K1JG?=
 =?utf-8?B?R1RYV2FNdXFTWDNFUzErc0VzLzZhamtGcGUvRzE2R2VWNytMY3I1R3JMZllK?=
 =?utf-8?B?ayt5WFBReW5MTkxJKzFaa2VWeFVWY0srWGFmdVZqZExTYkdrMXN0OUZDVFk2?=
 =?utf-8?B?TmF5RGpIdklMR3AyVVZWczRjaXNIeUJMR3ZWWjV4RzFIZVRrSEdIR0tnMmVu?=
 =?utf-8?B?MXh6cktJNzhibVVsT1BYWFhwTEU0dGQ3R3ZmT3NrRWVDeWliWkNTenNGeWpT?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4435F85FF2ECD4C8920231331BCF1FC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qgnzBnS1MIpFpjP6VEYdhHxtvv02iugLuwtfF6mSBfA+B6vJex9HeCyS7Fk3Vl/FlDeaw/+VFCe7oPNGqWoy52FT9ENlSQlpXyvs5mK/Murz/5Hd/GPqp2i74U0+dJZ67hjJ4DTM1/sWfrWAECMTWI6i31jMxFf0UtVBYlmp+o5teN4FxWFcBGlUXDDbbXr5yRHBy9I4834a1YGI3ckkR0hYbiWLeKKKPXig5IN64+j1vFMMiSdi3N/DPze417X+am8+09EiNX1n1x+YVWdeTUEay85CLt3IDzaxOdKRPWYRgcJNlcy+0zgrk5Pss7RKG3qecAOVCXUmWb+YT90vq6rVmyTHCbYb53CkJHzmiLpoLb+06yrLZmcshp7GOMRb/H10ClUZ8PQWMStUlnUzD/XvOTITaiRC8ZtsjifoCh3JQhJP5K+eYi4x4ztR7aWBD0XjT1V5R3FUXATg8etxbDXsaWgYVq+/w8tbQQSsJMigstSQ04r2EqfPW+cJuSqVtOcgq78HaqnWNTrG7XTr5lyxj1ynO3N2x4BuFXz5JhqK3wPTSdPhojxNZqhxkao+tye7cdBLGbXVnM8ahRyle4EWjG+y4EEx+hqggTtwxFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36c4f4c-38f3-475b-c639-08ddb9f3e228
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 05:38:47.8941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIIGoO2htW3hdOlpZ4OgF6reiUB6Yl0LG0r4CvojF7JcKu0Y1Za127CbWVrOKbmE9qAy1J9mruYFicsrkv9otkrSkqLFpO3Ay1umAw/h5S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030043
X-Proofpoint-ORIG-GUID: fYTZWIXe0WhArmKU6wemGf11NQznDYKL
X-Proofpoint-GUID: fYTZWIXe0WhArmKU6wemGf11NQznDYKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0MyBTYWx0ZWRfX0TsemVHvLd6B ZVn9aOBAm+BnaOY0odvMoIcF5yerKyjlosnn8HqFlikQF9OXzavuMr/u5qR9vRahESvXdV//GII uJi0Zk/PWdPNTjw4C8fC5uf6ttlLCSBbTK05J9is1XGY2ISCIoA52Gr196dSCt+mUgY+qkJlZFC
 yynMT0Cfvd0sAQjqGwkStYITUv3ZsICdzGtNIEepuDiioRObrYiaevZbof4aMA51pOe8S8XC2mB l59grWLJSu++vVmJP75KRdWgpFoW88uyuLAWb+ANm06J1Xl2SNGuNP4iQ+wW+xej9Y+gPNN+Men 3hqyeK6k8UoWb8p4a4za/qy2miFMURQbb4tufXJrgkjTLaEnEPNnSVmbQ/j9i+zhN5mrz8z6reH
 QPqEIL+8fwquql+bZKL6ZxUddtNQFOkT3J46l4JhBQmn1PM7b4nrmrNBxc4khh44vz0QgajM
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6866176b b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=kG7ByTEkvURcsHKMPPUA:9 a=QEXdDO2ut3YA:10

DQoNCj4gT24gSnVsIDEsIDIwMjUsIGF0IDU6MzbigK9BTSwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKdWwgMDEgMjAyNSBhdCAxMjo1
NiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6DQo+PiBPbiBUdWUsIEp1bCAwMSwgMjAyNSBhdCAxMDo0
MjozNkFNICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6DQo+PiANCj4+PiBXaGF0J3Mgd29y
c2UgaXMgdGhhdCBpdCBicmVha3MgdGhlIExBWlkgc2VtYW50aWNzLiBJIGV4cGxhaW5lZCB0aGlz
IHRvDQo+Pj4geW91IGJlZm9yZSBhbmQgdGhpcyB0aGluZyBuZWVkcyB0byBiZSB0aWVkIG9uIHRo
ZSBMQVpZIGJpdCBvdGhlcndpc2UgYQ0KPj4+IFNDSEVEX09USEVSIHRhc2sgY2FuIHByZXZlbnQg
YSByZWFsLXRpbWUgdGFzayBmcm9tIHJ1bm5pbmcsIHdoaWNoIGlzDQo+Pj4gZnVuZGFtZW50YWxs
eSB3cm9uZy4NCj4+IA0KPj4gU28gaGVyZSB3ZSBkaXNhZ3JlZSwgSSBkb24ndCB3YW50IHRoaXMg
dGllZCB0byBMQVpZLg0KPj4gDQo+PiBTQ0hFRF9PVEhFUiBjYW4gYWxyZWFkeSBpbmhpYml0IGEg
UlQgdGFzayBmcm9tIGdldHRpbmcgcmFuIGJ5IGRvaW5nIGENCj4+IHN5c2NhbGwsIHRoaXMgc3lz
Y2FsbCB3aWxsIGhhdmUgbm9uLXByZWVtcHRpYmxlIHNlY3Rpb25zIGFuZCB0aGUgUlQgdGFzaw0K
Pj4gd2lsbCBnZXQgZGVsYXllZC4NCj4+IA0KPj4gSSB2ZXJ5IG11Y2ggd2FudCB0aGlzIHRoaW5n
IHRvIGJlIGxpbWl0ZWQgdG8gYSB0aW1lIGZyYW1lIHdoZXJlIGENCj4+IHVzZXJzcGFjZSBjcml0
aWNhbCBzZWN0aW9uICh0aGlzIHRoaW5nKSBpcyBzbWFsbGVyIHRoYW4gc3VjaCBhIGtlcm5lbA0K
Pj4gY3JpdGljYWwgc2VjdGlvbi4NCj4+IA0KPj4gVGhhdCBpcywgdGhlcmUgc2hvdWxkIGJlIG5v
IG9ic2VydmFibGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBlZmZlY3RzIG9mDQo+PiB0aGlzIG5l
dyB0aGluZyBhbmQgYSBzeXNjYWxsIGRvaW5nIHByZWVtcHRfZGlzYWJsZSgpLg0KPj4gDQo+PiBU
aGF0IHNhaWQ7IHRoZSByZWFzb24gSSBkb24ndCB3YW50IHRoaXMgdGllZCB0byBMQVpZIGlzIHRo
YXQgUlQgaXRzZWxmDQo+PiBpcyBub3Qgc3ViamVjdCB0byBMQVpZIGFuZCB0aGlzIHRoZW4gbWVh
bnMgdGhhdCBSVCB0aHJlYWRzIGNhbm5vdCBtYWtlDQo+PiB1c2Ugb2YgdGhpcyBuZXcgZmFjaWxp
dHksIHdoZXJlYXMgSSB0aGluayBpdCBtYWtlcyBwZXJmZWN0IHNlbnNlIGZvcg0KPj4gdGhlbSB0
byB1c2UgdGhpcy4NCj4gDQo+IEZhaXIgZW5vdWdoLCBidXQgY2FuIHdlIHByZXR0eSBwbGVhc2Ug
aGF2ZSB0aGlzIGV4cGxhaW5lZCBhbmQgZG9jdW1lbnRlZA0KPiBhbmQgbm90IGp1c3QgYnVycmll
ZCBpbiBzb21lIGdvcnkgaW1wbGVtZW50YXRpb24gZGV0YWlscywgd2hpY2ggbm9ib2R5DQo+IHdp
bGwgdW5kZXJzdGFuZCBpbiAzIG1vbnRocyBkb3duIHRoZSByb2FkLg0KPiANCj4gQWxzbyBpZiB3
ZSBnbyB0aGVyZSBhbmQgYWxsb3cgbm9uLVJUIHRhc2tzIHRvIGRlbGF5IHNjaGVkdWxpbmcsIHRo
ZW4gd2UNCj4gbmVlZCBhIGNvbnRyb2wgbWVjaGFuaXNtIHRvIGVuYWJsZS9kaXNhYmxlIHRoaXMg
bWVjaGFuaXNtIG9uIGEgcGVyIHRhc2sNCj4gb3IgcHJvY2VzcyBiYXNpcy4gVGhhdCB3YXkgYSBS
VCBzeXN0ZW0gZGVzaWduZXIgY2FuIHByZXZlbnQgcmFuZG9tDQo+IHVzZXIgc3BhY2UgdGFza3Ms
IHdoaWNoIHRoaW5rIHRoZXkgYXJlIHRoZSBtb3N0IGltcG9ydGFudCBwaWVjZSwgZnJvbQ0KPiBp
bnRlcmZlcmluZyB3aXRoIHRydWx5IHJlbGV2YW50IFJUIHRhc2tzIHcvbyBnb2luZyB0byBjaGFz
ZSBkb3duIHNvdXJjZQ0KPiBjb2RlIGFuZCBoYWNrIGl0IGludG8gc3VibWlzc2lvbi4NCg0KQ291
bGQgdGhlIHBlciB0YXNrICBjb250cm9sIG1lY2hhbmlzbSBiZSB0aHJ1IC9wcm9jPw0KV29uZGVy
IGhvdyBlYXN5IGl0IHdpbGwgYmUgdG8gYWRtaW5pc3RlciBzdWNoIGNvbnRyb2wuDQoNCkFsdGVy
bmF0aXZlbHksIGNhbiB3ZSBoYXZlIGEgY29uZmlnIG9wdGlvbiB0byBhcHBseSB0byBMQVpZIG9u
bHk/DQpUaGlzIHdpbGwgbm90IHByb3ZpZGUgdGhlIGZpbmVyICBjb250cm9sIGFzIHlvdSBzdWdn
ZXN0ZWQuIA0KDQpUaGFua3MsDQotUHJha2FzaC4NCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gICAg
ICAgIHRnbHgNCg0K
