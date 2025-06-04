Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE131E5B9E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057026; cv=fail; b=jBgRBoxPiHpogXe1PPyFNRMWcSpOqi7qlE/r7H7tyuHB3W1mAbGalLILYzvKSgmgJQKo4WyGbLjl/xvpTd+QNITxfE4e9mpxHkFUmX0o9jWNdTmYdWA6sCmXArwsa/JBzSIuXlDgGzcwKOcB6PJBmQd1bVXi4HsVbSWMvPpMlcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057026; c=relaxed/simple;
	bh=smtLHrhbS4Rd6HLfLqfjlCeLUfc99ye8LCMgHvvudRc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GPKF0ru2t6TSfvgUdBxKdStdvCI/7WO9MzPiWKFtcLQhTuA6sarUU5MZnztVAa/4Q7eNdbDfMJj8n4JH/t61on8YprtTA974rRnDJGLWw3/9lYBf8I8e4RE1hR5hsm9bd6wQRONg433XYBqs5HwppK/fKTzVBx48FYuPZLnhhHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p/eu5ANI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ebEuwe1P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p/eu5ANI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ebEuwe1P"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FduLK032149;
	Wed, 4 Jun 2025 17:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=smtLHrhbS4Rd6HLfLqfjlCeLUfc99ye8LCMgHvvudRc=; b=
	p/eu5ANIbDEhnhPpkt2mDKTmURmJa7VkzfGQxVhhXF8yb+01p80C0gdkrja2Ggy3
	CiK2sLqXGCLlsJDs9//G6vTuRRs0odJfEE3X0xFw8zXpcthIvgGwXfWMLtODAjwr
	FJY7zB/1jHAVkM3Qhl3+/49gb1R2BUsmE11J9RKC6Nd0A9YMi0t6zoyTp2m/15JR
	kk6p/GRviHAAQHgmqrZpk8CHs3VwxPWo6CqKhHwofApNvP15BIqmggndZtfgOgvb
	jmxW0UiEbMQJjskNkbSLNCTWvubekT8ABDn+WF10KDQ1BaIsuRTOqXocM1qGSlXX
	m6Nheglnx2juOciznV2pmw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dvgkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:10:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554GJhKa040698;
	Wed, 4 Jun 2025 17:10:12 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b9ffh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiBI2z10l5yJ9/R5KTBkRnlGcrbe5b8HijBcD/yV74Bo/zvNfjZvANHQMBOJMHdQR8CEwdeXKx2WxGQlxDF7EcvSpBCy4tIvQf09/EWn0duGB66vbt0pgPsqjc5ZnKqSKF/JduXOt4BBINpVp9Xp90WK16Mty38B4erVzgKkqw7sXBVqFNhk0qFyixu3yeXHIZRdhCwbPSImLT+1ZUWa+5C2pDE7B0gOxQC3v9LlRups9nfT35BFPZP9EMGKq96heElwlt2EbGJGZqnqYRcFDzC4q7nlgNRh4Ct2RLhTkquuVSRgOvFSeMU6YtyGWCqhvpPnEs3sSFHxYMuu0TiTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smtLHrhbS4Rd6HLfLqfjlCeLUfc99ye8LCMgHvvudRc=;
 b=G/Bof2yooQNwafOFDa7+vp0P1Y8FWwjwysFn+cMRQkjcTPT5zH+KzniW2hGWvUnZcn18VsZDLVzAQUdWJ7VCnCQJAL1XEBOTTgk9EtUI/+4OKN82Ixp3X7gU8cTtcRXKQiJUfW9ST54AsAS9K7cGY6r9HBivX2FJeeTzrhBTBE4kB7dZ4GNqjh3I3t9UDznAEHiU5itZuSvS/YsU31eRV2EIfzOtjSsiI/MFaqatCwp4xX1UbvEkyPJNFajEOTqgBvTe3owh+r6+6rQdxAbzJ9upUdDHz7dEqdLUlHcRrCTpPK02ZT50BW+S9Gh1bIWxr8coTxU2AEYrL0ENEIQTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smtLHrhbS4Rd6HLfLqfjlCeLUfc99ye8LCMgHvvudRc=;
 b=ebEuwe1PuIi4tuFJwJX85U1MwVQYLau3dIfXVzSGqBZw+nib7kQ2oh9umwMJ93M8m+Pu0sN+5aJslaaFhnyjV7ivdJ3pTcZzToJvmqDNfGg2oKbvm5M9O8B6vgPQ8hn6YPoxvJiyl8yppQrfDYWXA3tCsvp+x0vBSfInyKIJ37E=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 17:10:09 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 17:10:09 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 5/6] Sched: Add tracepoint for sched time slice
 extension
Thread-Topic: [PATCH V5 5/6] Sched: Add tracepoint for sched time slice
 extension
Thread-Index: AQHb1V3v8YMWIQxbp0WxB8CF0dA8BLPzPESA
Date: Wed, 4 Jun 2025 17:10:09 +0000
Message-ID: <972B9853-0BCA-4790-B909-A4ABA3FCDDB4@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-6-prakash.sangappa@oracle.com>
 <20250604103644.4b41b9a3@gandalf.local.home>
In-Reply-To: <20250604103644.4b41b9a3@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA0PR10MB7157:EE_
x-ms-office365-filtering-correlation-id: 9a8fb6ca-2591-4297-5584-08dda38aa922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWk5T0FXUUNnMW81SDA5VzZ1RlpMOEhHNkZGNk1XS2VFVCs1WEpubWRpSDJ4?=
 =?utf-8?B?WWc5UFVNcFdUYkRMMFZBaHlFa0ZHcjQ0eHRwL1psQ2Z1MDJjUU9qMXloNVpK?=
 =?utf-8?B?dnl1UVFzZHZLbE8yOTdmRzZkbWhGcHdNSk5LdXBqZ3hNcjNHU3p0QWxjWjZG?=
 =?utf-8?B?NjJ0Wk1EcFUvWUNzcHBDTEVhRFZNZ1NZcGZ0czRCb2c5eGdqeFFSTHduNlkw?=
 =?utf-8?B?R1BCdnZmakVpY0NsK0t1U3RJMU52cmVBUHFEUmE5WEJYejZ0T3RxQ3ljWktO?=
 =?utf-8?B?NmVRWkl6UmRpaXpSZ2psUlpydzFZRXZtakphcW5OdmdXOVgvWmNuZ1R0R0Jx?=
 =?utf-8?B?ZlBMZkMvazRRZEgrbFdnd29IMFh0V1VuandJdGEyVFQvSHllSmpFeVdhUjl5?=
 =?utf-8?B?ZWE5YXB5K3J6Vzg3U01zVHRSQWZqN1E4M0lPV2tpMWttN3hOMjlxQzJieEF4?=
 =?utf-8?B?R2FRT0QyTEZ6bEpKZldqK1l1Smc1ak9CMU1SOHpoenNQcytMck8xYzRJdXJC?=
 =?utf-8?B?dkIwZlBrREJIdFF1QmRVY0gvbkxoWFpjTWVhK0hLZnIxS3BzMGVSc2lZU1M4?=
 =?utf-8?B?ZjZhOTQzaGZqTWRoeWdYZFVDOC9oaWpKcGNQeDFPSzdVd0dVdEcraEFDa3VM?=
 =?utf-8?B?Q0UyN0llNi9seHk3YUFyVENrdWhHR25WM093eWpRLzdPY3dtQ2V0aTY0eElB?=
 =?utf-8?B?M015YmJOOWtIQ1BpaVZqQ1VsQmgrMHcybEZYRHUxZnhMZjhGQVRBblRZQXJj?=
 =?utf-8?B?UlFHejVwei9HaWxkakhmMllFeHdvQzlWV01OemV2ZEpGS3k5d2RFakRLcWZ4?=
 =?utf-8?B?UmovSWxJN2t3YkFGTXpLTG1LdG5UVjdjMVRDYW4ybTVoQ09ueVkwVC91SlZU?=
 =?utf-8?B?SVdoOUpKMFZIK1FhTDJweVpkL05XNE1qQ1E2c0IrVENIUWdNTk01ZnVnc1c3?=
 =?utf-8?B?TGFEdVgzSEpBTktNcW9lZ1lEaWJhZTlXakF0UUNaUzQvTXRQOWRxYmtqa2Zu?=
 =?utf-8?B?L3dwYTcrT0dqMVExWkVUWDhYSEh3UW5ZMFhNeWFUMHd4cFM4N2RSY0w5MzVs?=
 =?utf-8?B?SjBWYWczNHNMaG9rVDhhQnRlUE1Xa1ZDeCtsaDIvUi84TE42aVJIYVY2NEJs?=
 =?utf-8?B?bk5kNjZpN285RUprOWMyai9NYkQzTURiSENqVkQ1NFdoYmZXZ1pqSUV2M2dU?=
 =?utf-8?B?VUhQZzR6NE5uU2w3TEJUSTgyT09nVkJDOFVCT3pLa1ZLRmltS3JzTHVYTjRP?=
 =?utf-8?B?c2kxWEVwd0RNdDJYY1dBMjRLakUxRTVxa05hYi83czk3SFVJQWd6TVYvWTUz?=
 =?utf-8?B?Zjg4VmFvbk9MWjcrbTh1MGZmc3RRbUVOMUFra0NTL0VpSHg1NjhPNzNiVmNY?=
 =?utf-8?B?U3hCTG5vS0ptVzhUNzBwSG9lV280ZE9WaVVXaDNrcG43RkI5cExyeDdNaXpx?=
 =?utf-8?B?RTZ2K210Q0NjZGg3NWlvMHdyb0FXM3dpdUxwSEtuU2lwa2xzNmVpVWNJVS9C?=
 =?utf-8?B?OUJsRmtuM0g4TU1mVUhPbEZiVlBvZjgzL3NmL0g1RUZNZFVFa3Y2MWJpYW5O?=
 =?utf-8?B?TGl0T0wyTTJ6NktVN3JvNk5wYnNENkRkZGtpQkRqVGZlZHNEQjJrQmh0MTZt?=
 =?utf-8?B?MkFmMEhkSmJxTThMM2dSc0RkQytrZW1nS2lyTFJJSytPcHYvSmNHcEhQVjJQ?=
 =?utf-8?B?Y1pJNDVuYThkRzcrcVpNcmYzVlViaUNjTnJad2hGbGtaRUU4SjZ5K0VJa0J0?=
 =?utf-8?B?MStYSmh2aExoRmhBbEhoWHhsM1VtWWNSbE1sQTdqY0NTS1Q4VDVaK0ZQOVY1?=
 =?utf-8?B?blU4RC9BWVJjaGZCMTBhb0M1TU0xL01uWmlLRjE0dXgyWHl5M1hsUzlvQVhl?=
 =?utf-8?B?TTlvYy9YSlZ3UHZsR0dWME5kSzlvVFpUWjZJU0ZRZ2dHVTdLdkFQNkp0MWlN?=
 =?utf-8?B?Z0EzRTdKblVTd0tRVHNFRGJSSmxVSHZqTHpUNk1jeXpCd0t0dUdaTHBNYjhH?=
 =?utf-8?Q?y95Se/M63MOEVPrcm8SSFwyYOO9EbQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVFxN3hNUWQ3S1U3Q2hHbG5kdjNTNXBjOWVuS3FUZ0ZrdHFUVS85RUpsbXQ5?=
 =?utf-8?B?WEhQS1V5d1R2dEVUcjFFUWlzSVd6Umx1emVpUHJGb2EzbjJFQlRZWExNZ0NL?=
 =?utf-8?B?WC8xZkJsWnIzU2ZXd3N3VjI1dzhhcUgyYnV1U2F5YnpOMDU0UWNCWDJHVk9X?=
 =?utf-8?B?QndKbVlsQkRWdTl6U3drdXVwTmRSQkp5eUJEakpHcFgvR2pld3lyOXpEb2Zj?=
 =?utf-8?B?NHVLcGpDVngrdkJYSnErYlJhZm1nbmdkcnJaSzJ0OVdjcmlyWU54L0ROSllX?=
 =?utf-8?B?dk9BZGVQWVBDMnJqbkRTQStybDBhR3ZFV3hSVjJMMFpjd2tFUDdDWHh2OTRt?=
 =?utf-8?B?VGRlYXdsOGZiaHV5UFpYWVd0N1QvdDlqU2hERlFJQXF4cGN6Y3RBME4wTzFH?=
 =?utf-8?B?OWJOeXR1dWszMStaYWJ0TmpLbHZWMVFsbEFnTEtpd2tNL3JzRUNFT2hIcTBW?=
 =?utf-8?B?SnRoLzR2eTE3cWg4OXdWdE1xZ0xOVTB0TU5YOUFNK3JkQmV5SWg0WFBpejFn?=
 =?utf-8?B?SEV2R0tRclZGU3VHdkExT09kY2x2MEg4ZHZCODBMb3BnRlVMQm9QelhQOU96?=
 =?utf-8?B?MktwRy9BbDBLM0I2ZmJhVEc3ejl4bFBoMURFQTJMeUJrWjJZTDltL1pGVEx3?=
 =?utf-8?B?QmREYjZGYlNUMWh2QWNQNVk2Y2JqSFY2c0RJcXpTUlk3TGxhYzdnaDhmK3Zl?=
 =?utf-8?B?T2puOXAyUlpuRDZTRUM5UUV6SDdwYUt1Ui8rdlFKa0FJRW8xZzZFckUxZjlX?=
 =?utf-8?B?ZTBPd1lTS3E0M2ZHM3k4R0RJSHJpdDkzZTM1NlpTcHdxOFQ1M2pVb1ZieEh6?=
 =?utf-8?B?eHI5L2dacG5mQWlkVENpUTlJOVVnUWI3cisveTk3QzFpRlhYa1h2ZGpueUVy?=
 =?utf-8?B?Qk55SktNN0puelovenArYWFuTm5zRTlwalVhRjVobThGN0VqS2JXYXIvVVgz?=
 =?utf-8?B?bU9NUnBLaXhTS1hiVE51aWhzTkFRMEFobGhFOWZBRFdxVTVzZlozUW5ndjhJ?=
 =?utf-8?B?N3hRQWdidVNiK0IyZlIrMWFDVVYyQzZGMVZoNXNJYitBaUg0Y3gvUGhySDVX?=
 =?utf-8?B?YjFMSG9CNFhnN2xuMnpuZE5XbnZqbG9hWnZNSlg2NlBVT3BGdGNmUlBueHAx?=
 =?utf-8?B?c1d4N0p3K2xKbnM3ZGgvK2JmeVc1Unc2RWVjVWxJQVlMYXhHSzVCRUYydjhx?=
 =?utf-8?B?eVowTUM5MG9WSXZQYVhkQ2p1MmlNZGpQMnF2MW16SnhSVEo0L2pGZGtRaFJM?=
 =?utf-8?B?UlluenVNZXpRb1lObnZxcXlNTmV1bm5hZ25VQnlKYXYwNitxUGpjNTZ6Z0Uw?=
 =?utf-8?B?RkkxQVhmbVU3RjFUK3YwelI3K2lJN3cwSVhDcU50RTNseUFUbDJoSXNlMEt5?=
 =?utf-8?B?cVBGNnBJb3NJYXNQWXpCVzFxVGdpRFd5SjlTczA3Q3dKWU9mWHQreE1TZnBv?=
 =?utf-8?B?Uno1Q2xzVHJOS2FhZy9OR2dhK0txaFJhY2FYeElxZnJzYVB4OUhsOWIyRklm?=
 =?utf-8?B?UWszUm5JUTB0d3NteGx0WVhIbm16bnJ6MEFJblhYdkxEMmFrZEEwbSttdWhT?=
 =?utf-8?B?STFRZUVJUGNxQUtidGpoMVVpSTkyVFJScmRhdGR2emtjOGd3eDB2YTBGMDRi?=
 =?utf-8?B?UHlBYUpGTkw5TnhSa3J2Rmk3N3BYNWVQN1ZzUDU4amZENGs3dmJxT2kzOVJx?=
 =?utf-8?B?Qk16Nk9jVHpKaitKcFkycFhmcStiVFZLdVRmbEtRbHlmbi82cGVrQ2hMSzdv?=
 =?utf-8?B?LzAyM0ZuRkY1YzZCN0tHalJVMWtnZnZTSXVkc1J6UHRFN0w5bm0xRGNCM0xw?=
 =?utf-8?B?NEkrS3htQzNwbHFQdUt3QTRIU25OOXhWOXFzWHdJTCtZaHllVFJ5ZmorbTdm?=
 =?utf-8?B?NU5BalQxWm1kczVMOXM1NFhnMnp2U01jWHJuZVd4amNoRmNEUXN3MHZaY3Jn?=
 =?utf-8?B?WlNNVWs3NDgydzFUS3B2NERNNDdOQ3hOOEVqRlB0V1BTTnZsSGsvTThPS0Zu?=
 =?utf-8?B?dXNzbHg5ak84ODU0QUR0Z1J6aldJenEyV0QyN2hkK2RscmEzZ1hzUXJOcGZy?=
 =?utf-8?B?YnVNTHQzUUZqbzR2STdUN3pEbGQ4YzVkazN3WUh0RE9PdFNTd1NReGVwK3lO?=
 =?utf-8?B?TGpCYVdkWmlKMWVFbUJkQ3piazVaR1JSVG9CQkJ2cVBickROU1ljeGJIY3NU?=
 =?utf-8?Q?8FOhnacDnh5vAq6/z5jgPOI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BF1DDBE932D21498317CF5E8F713D6A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eReipGgrDJpZ8gqBVnBx9enYVoGsbghQSygeDSQalMYlgqnKbRErkjfJ8VMrEw3e6KzpsNEA/9Ya5668tQ5pSdZtCUwUbYQLZb/a0fwPGMroBvOzTozL28ry1+6ip/phnlrqYzoAB8M1UiuWUxKNdFCTJY0UfS6WyRY8D3OYjGhxny2rcjAGarfahyBnAkqjWuMtLDVueevbU8Ih7/m2bjRtTMYDut+89MluV4Kz+FI1ZeeiNdAusZVTWhqtg07yIIz8MY8MHVe53/+d05OrV+gHrWQijXJsXtHdgzmBo/IW5ipNgWIKxsT0BilZiYv8hqKoz/G9/S+Xhkc88HMY2EDFVBa8svc6BU/m4fwLg7riBT1duHrUOcKlKiErwrLFVbbLsOf//BBVmrc0l9EcD14xzMl11Le+Up04NSjH+UxbUq8KUw5mLX4n7GfVBQYXOk1BxYUV2IQqRS5UvfkRJZOzVmn+0w56BEqlK05cSr/3e9NT8X5/YWCp+VajmWVNfmGMjHWMzAti9CGndQ78WTQewAxvhgkrbL75GskXsFgimcH+SDRoR5VNBoVh5PIcgeTz1WEgblXy88cfo2QMDuzTGeZNqzMFO/DLhnWBHJQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8fb6ca-2591-4297-5584-08dda38aa922
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 17:10:09.4762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKd/f+zqSZMEAZLxWRXr2bqDjn/kU13DxDMbuupc0AC6pUxHexqZeVl5pY9Ajw8nP7DkTevdZPCF7ac4yf7xvcNE9uBKFcAGtE2moxl6RIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040132
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=68407df5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=yPCof4ZbAAAA:8 a=BNQB1_rShqGLDg3vYjgA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzMiBTYWx0ZWRfX/MaQ3IFsczcZ /QtwPI/+5cl/qwrBIPdU6EbAHqBfWbxjxphzwePuwobPdfMa9hu25qQcdU9i8FP8xBw4I/i/BZg Gcoq8GlYKhZRbx2WMv2iJXG7mR7drAwdahVW+Bp1ZusC8ZEES0m5MKt+5Oa1H8a6q2/PTbmULbS
 ZfKjmQV8IJBeell0XPgY+JOent3oAhGhtDGQGmIG5OYGz85PzzZmFIFx8JlT5ig10ZEx+BaZ6Y/ EG5QjDgau+u1SCEHVPyXbCRq0ugRZBqAK0ak4Jd1nndCS+TOGJsBy+WsXmK+NTiiLXqHj0LCOEz mdcU/3dCYwsWSB+DZ/LZEIg8dHJYKz0g92K2+Ycsme4pD+u9jLbnF9ZIvat8f+fXPMMhuir5U6n
 /En2qalOxhYpgsAhaMARFaDoY6w7oylDgb2dndgezEKeqEpehhm03lsZOECnATpzvyWvHFjw
X-Proofpoint-ORIG-GUID: UOtyPPzs3Yij3dFVa3ZPegfHg3QWagsh
X-Proofpoint-GUID: UOtyPPzs3Yij3dFVa3ZPegfHg3QWagsh

DQoNCj4gT24gSnVuIDQsIDIwMjUsIGF0IDc6MzbigK9BTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAgMyBKdW4gMjAyNSAyMzozNjo1
MyArMDAwMA0KPiBQcmFrYXNoIFNhbmdhcHBhIDxwcmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20+
IHdyb3RlOg0KPiANCj4+IEBAIC0xMzQsNiArMTM4LDEwIEBAIF9fYWx3YXlzX2lubGluZSB1bnNp
Z25lZCBsb25nIGV4aXRfdG9fdXNlcl9tb2RlX2xvb3Aoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsDQo+
PiB0aV93b3JrID0gcmVhZF90aHJlYWRfZmxhZ3MoKTsNCj4+IH0NCj4+IA0KPj4gKyBpZiAodGlf
d29ya19jbGVhcmVkKQ0KPj4gKyB0cmFjZV9zY2hlZF9kZWxheV9yZXNjaGVkKGN1cnJlbnQsIHRp
X3dvcmtfY2xlYXJlZCAmDQo+PiArIChfVElGX05FRURfUkVTQ0hFRCB8IF9USUZfTkVFRF9SRVND
SEVEX0xBWlkpKTsNCj4+ICsNCj4gDQo+IFBsZWFzZSBtYWtlIHRoZSBhYm92ZSBpbnRvIGEgY29u
ZGl0aW9uYWwgdHJhY2Vwb2ludCBhbmQgeW91IGNhbiBhbHNvIGp1c3QNCj4gcGFzcyBpbiB0aV93
b3JrX2NsZWFyZWQuIE5vIHJlYXNvbiB0byBkbyB0aGF0IG91dHNpZGUgdGhlIHRyYWNlcG9pbnQu
IEFzDQo+IHRoZSBhYm92ZSBpcyBhbHdheXMgY2hlY2tlZCByZWdhcmRsZXNzIGlmIHRyYWNpbmcg
aXMgZW5hYmxlZCBvciBub3QuDQo+IA0KPiBUUkFDRV9FVkVOVF9DT05ESVRJT04oc2NoZWRfZGVs
YXlfcmVzY2hlZCwNCj4gDQo+IFRQX1BST1RPKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgdW5zaWdu
ZWQgaW50IHRpX3dvcmtfY2xlYXJlZCksDQo+IA0KPiBUUF9BUkdTKHAsIHRpX3dvcmtfY2xlYXJl
ZCksDQo+IA0KPiBUUF9DT05ESVRJT04odGlfd29ya19jbGVhcmVkKSwNCj4gDQo+IFRQX1NUUlVD
VF9fZW50cnkoDQo+IF9fYXJyYXkoIGNoYXIsIGNvbW0sIFRBU0tfQ09NTV9MRU4gKQ0KPiBfX2Zp
ZWxkKCBwaWRfdCwgcGlkICkNCj4gX19maWVsZCggaW50LCBjcHUgKQ0KPiBfX2ZpZWxkKCBpbnQs
IGZsZyApDQo+ICksDQo+IA0KPiBUUF9mYXN0X2Fzc2lnbigNCj4gbWVtY3B5KF9fZW50cnktPmNv
bW0sIHAtPmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPiBfX2VudHJ5LT5waWQgPSBwLT5waWQ7DQo+
IF9fZW50cnktPmNwdSA9IHRhc2tfY3B1KHApOw0KPiBfX2VudHJ5LT5mbGcgPSB0aV93b3JrX2Ns
ZWFyZWQgJiAoX1RJRl9ORUVEX1JFU0NIRUQgfCBfVElGX05FRURfUkVTQ0hFRF9MQVpZKTsNCj4g
KSwNCg0KT2ssIHdpbGwgbWFrZSB0aGF0IGNoYW5nZS4NClRoYW5rcw0KLVByYWthc2gNCg0KPiAN
Cj4gDQo+IC0tIFN0ZXZlDQoNCg==
