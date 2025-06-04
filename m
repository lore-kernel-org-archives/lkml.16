Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17418DB24
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057009; cv=fail; b=OkXieWYPWUq0AAXcpQ4emRp9Y98oyvRrPE3v3nF0wwOY7mT3Zjz7cHeiWGJ7pRld/7w6bgbMqveoNq8tsByvmqBmeBI36Lc48D8r07/4ONN13/mZLGcF7a20dJhiHewT5FktV6LKiwYpYmA+HkNDt0rcodiLPs71jejkkgSR7hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057009; c=relaxed/simple;
	bh=Zucoz3XTzCVF34HnCBxcdx7qGrt7auANSzRWfu0DCt0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pN0rU0laPeOFJxy7IQ5QTupAk6nx6l8fuP8C6iDlm1viOR+cEfE4IS8/gigkVq9wOQPkh1j95C8Qt5Gfj0Awp2dlwOMltmEOhW8h2/a/UfDAyXP/OWJ9KX4Hp8kAdLhWod5ZDsVTtq7D8TKrclEZZzEaxZaUn2C7hEGoAGpkM1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ojHCDSZn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ocgGTxBJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ojHCDSZn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ocgGTxBJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FdxdP023843;
	Wed, 4 Jun 2025 17:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Zucoz3XTzCVF34HnCBxcdx7qGrt7auANSzRWfu0DCt0=; b=
	ojHCDSZnldlFt2f7/dZoUWtc0oWEDgSeZjuy69DCmjfMPnJCWt1BhCmixB6op2pg
	Pa4wCp2Zgd8pRiZQclE6wiTm2R2XdeLRJbtRNk13xMI+n01tZlRrsyZDVBnQodgB
	XdGNRJ6bk++psVsx21sc3XGZs+nc6mA3A1b/kDRjozoxdJRqkFP02FoNpf1e8zvS
	Nxzgc5ZP7jbNEFoXryKw4PXBnARVCfEsxr9J4EKwaCgOamAFn50HB3D9XOy1pLQT
	pIRtu2sscAjA355BPDpgTPnOScWvHm/BzPUJIg0VvcowK5WVNj0K+nqbgFzBO7kH
	HRC1qIvSh/CSv0/uMegtpA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cvey2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:09:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554GR0PC034872;
	Wed, 4 Jun 2025 17:09:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b9d7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIGSXukHFCw9mG6uhAZnZB3Qr5xkCslUUb5EBBn9fxCwpej4JjvA7BQFWnm0MaqdobcAnMoYBOzYLIaA3EZqJ1vdn5olA9wVIYZ/47jlsjhnC0BDyiXcIcmvDMFvLfcfhmy5GCKZPY0WNVQQ3lHEu61hpdVYEejvRHxojhFcvZwprJJBnTnqNuecGzTIMQwI4gRZZw1b0LXMvfk+CUsbHdZp3S1WrKAwSIkvcpq3paiPQgTzZZwYzGIUzfynOKZzI3pCuCHGwg1fkbcz/oK4jRHPjwrNTSn6OE/aiMK1RaxqWSk8LXhfBOtvJ6wIna8P4GPx3OOO//NpKt2q6zoNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zucoz3XTzCVF34HnCBxcdx7qGrt7auANSzRWfu0DCt0=;
 b=UrYOUviphrHflZQMPbHqzwUt/R6dHmxGexP2JrORNDmxYd0aOn6fNfDvhzT//3YTe8F//1090V7DTZOiKU65rXoFOPxN98yxKjSR8/2gxGoAB4jMPN1EbYyc65ClS6Vs0xuEUuW19EbTM65SPICgpEYPLDZUql4ls+LkjSurUhkSUqIctNct7ZmgBewVNF1KNcz5wj6UGeYmiDKZeMAhdrgy+UHvswQVs/XxxyxT9MMHhujnaJUnZzenAZWTtPxvj6Y3BQEecxjNya8X5esDqlp6IQhxA6bFH9+JCJow7alp3QTqSoP7tuYJv/toVHuHwDXYZZjsXrdSwmK/67BMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zucoz3XTzCVF34HnCBxcdx7qGrt7auANSzRWfu0DCt0=;
 b=ocgGTxBJLLgX6a5bxT2RQ5azm1ca0RrG8Jrl2OTXhbVdwawEyofbdneTXhyXhFTa+UfcuLwBuF8qb8+x8XdxooHABT6fBq/Bo4GXRYULfUGp8pWeCnzuOaQzQSgqSKSqMVKH4ctsphDc3NpSh2HQf/KF1bj7k8njLD8AVdRvovc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 17:09:50 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 17:09:50 +0000
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
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Index: AQHb1V0mtwlUIwQHSki21OTBoge6R7PzPCsA
Date: Wed, 4 Jun 2025 17:09:50 +0000
Message-ID: <04E4EFD3-0FF1-475E-802B-97C72CBCC452@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
In-Reply-To: <20250604103106.1465f847@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA1PR10MB6219:EE_
x-ms-office365-filtering-correlation-id: b1c16569-e455-471c-6ccd-08dda38a9d8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDJSMEpBWHp5cXZibVRWM3I4T0ROWGRmUXcvNEVPZ0lZdDd1eURNRVhoeVRl?=
 =?utf-8?B?bnFOdTUvRG02d0VuTGhCQVdnVTFUZzRYbkVBWWM4azg3MFRqTjJhOXdOVi9T?=
 =?utf-8?B?RTgvb1pUTStuYWdmOUoyZExKR1hOOGRjbFRQSHNJa2g2djhqVm41RFlsVWdC?=
 =?utf-8?B?c09xeWxBc2ZxT3FETFJMNFF5NWwyTDErZ3RvVndERmtvajA5RGRmOERZQ3B3?=
 =?utf-8?B?M0t0bU5ES05XZEVLSW4rL0JGK0xLYlpsZm83QnZwV0pxMTRTRk5lQ0ZEU1Za?=
 =?utf-8?B?c0E4OUx4dmQrREg3YW9KaFB3UHZ2Zms2OUhwWXpJR2QvWkN0dkNKL1ZreDZh?=
 =?utf-8?B?TlJ2QjVJOFBoSG4vY0dNZkJyT3pXU3RUMkI3Tm5wQVVYUnpsd0ZPL1hUMm4r?=
 =?utf-8?B?dDNSMVVjcGtTMi90K3FMd202UnlUUWNhK3pvMWNMSG5kZ0dhRlRkSjFVbEJx?=
 =?utf-8?B?c29uWHhVMkFFck5YQlJuVXdXbEhJcUtiUW1uU2ZMUkIrRDI0eE9CNGJDeDRr?=
 =?utf-8?B?VENDMGNsR1l6dlllTGZTNkxWbGlrSzdqRjR4cjBzdXFVZFd5bHhsV3FOcERI?=
 =?utf-8?B?TVNXSEJQU2dwcnFVNVhpZm00YTBHMEVPcTdoQlF5dVJOZE5qTFpIOVJOMU5H?=
 =?utf-8?B?Z2R4c2gybHBkWWJ2SjRZTkx6YkFHTTAzVlBSYXBZem1ldktFN29iTnh3K050?=
 =?utf-8?B?NnA4eDM0dnI5Rkk1MmJyQ01pc2hGUWlnSTN2SS9KNE9GcEJockVnRUlpSjh4?=
 =?utf-8?B?WStvcjBqUnhhN3JyTmFXM0JiZ0FnREN2T3o3d0tZczU5L3FRVmFkSWdEY0lD?=
 =?utf-8?B?YUxISlJPR0VxVlo1ZVpTVjVBY0JJN0xPZnBObEQ3a2lkTTdjVklLZlhCN2h0?=
 =?utf-8?B?R2hFUktZQnpDL2poZGNOSkEzb29NclhtUVJxMTlVQmJ0WWMxQ2lTUllScnhq?=
 =?utf-8?B?a2FNSndpTG9OMkxOSUFmditIZTJzdXZRdU9EeGNkWU02bTBVcmhmTEE0aDdN?=
 =?utf-8?B?cXgyMk9ucks4MjdHamIzWnptZkplVmM3WkQ4NHlxVEpSWnNnUUQ5RWduWXRp?=
 =?utf-8?B?U0IvaGVIS0lvYjhTdjNqQWJHMFpDUUprVVZ6UDQyRVZRa0RFMTBmcFo1SjFy?=
 =?utf-8?B?Sy96N29XZk9BTmpoWnVpMjdSL29WQVY5Mm4zdG4wOG5xSXNBREI3MC83bXdW?=
 =?utf-8?B?OVlkVWhiTk1Ib0FqWlcyQ1hNZVg5d3pXOXcwUnM5c2V3eXNUbGRJTitxTFJp?=
 =?utf-8?B?OG5DMzNMNmdCS3N5cjFwbmZERVBwRGZObGMyQzZlYVROWk9sWDhtV1RYemt4?=
 =?utf-8?B?aEJoMEk2QTJ1dFloZjczdHloUXYrRW1zbVRSWVZGV0NlYUlvYUh2dmFFMlRN?=
 =?utf-8?B?Y2J2WDVBQUcvQjlZUVlpWlA1TllqWVJwLzhvRERnbVlqUHAyWXZVYk9VTERt?=
 =?utf-8?B?NkpHd3lEei9NVHNGMkRMSnVTdkxBR3BvLzhMVkl6V01xK0c2ZVFHcTNCZmVY?=
 =?utf-8?B?cjZ6SEU4K1o1S0cxR2ZSVExZZEhHNW5aZHB3b056Sm9QcjJONzBvd0tPYkdW?=
 =?utf-8?B?KzhvU1pKeExLaE5EbmIrTlIxa1FIUlR4eHhFb3V3SFlibnhRTjJ5MmtCVlpI?=
 =?utf-8?B?MzBzTnVhMUZzYmxuMkNGekhKL2g1dnR5WkdSSmZTTm8rQjEzTjViZVJueUdq?=
 =?utf-8?B?RG5jZXBUcVlzeEJGU1luUG1tM3RtUCt1Z25Pd25obkh6cUsxTFFaL2YwODV5?=
 =?utf-8?B?OXNWd3JZbFVDSno2aWFEeGJRZTFFSnJtRFpGZkcrdVVLNlRhN05DV2ZsMU1R?=
 =?utf-8?B?R3VCWnRHUWN4TUY3eCtFMXJCdzN5ZWhFRWxrcUprQnBkL0NUZHM3cGkyUGFS?=
 =?utf-8?B?L2twd3orM2lFNndBcDZtMlhuYTRDclVCY05SYUgrYnpwcUlLT3VFcWc3dzdK?=
 =?utf-8?B?QnFHV2hxUmpNdWRHQ0ZRQ1VnWVZDMkZrb1U2NGFDVmd0VWlZbnpDQzBQYkpZ?=
 =?utf-8?Q?2zTXzECIJz73Ei6IKPNdSoPtuwOrDk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mks2a202RDFwbDM5YWJ4dVdDR0Z0QWIrSkZSYzNlT0JsZldZZUhkUHlpYVl5?=
 =?utf-8?B?YzV5MTVkL3ZXNWRBYWVxc3l5RzRIY3c3TmF3SVF4NDhUYjRlSzZoVi9yMlN4?=
 =?utf-8?B?Qnh5dE9JQ3ZOa1FPZmhGRVM0YlY4K2hTZ0ZSSXowbjFSUTcvRU83eC8vc0ds?=
 =?utf-8?B?dytqaHA4dkt4RW1DTk1lcFFPZW9PQ1NCUFpmY2d3MkxQZ2ZzREw5OWUxODVD?=
 =?utf-8?B?VGNMYS9DbnFGT0w1UGkrWFZ5T0ExQ1lXK3FsdURzUGYveDd5ZE1UQU1mTDkr?=
 =?utf-8?B?ejdEVHVxeHgzWlZ4STRzOU83OWF5anhndWx5bGFRK2RvbWwvdFFqL0tWRW41?=
 =?utf-8?B?eE9aQUMrNDUwRkIwNWRZVmNOajlyS2I1SFl3L1dMR3YxemlndTBrbjRSZURj?=
 =?utf-8?B?bmJTbkVvT0xXSXZQS0VrU2cxSXR3cGIxcVloY21Ta3NOQUpWVVEzZ0tCbkk3?=
 =?utf-8?B?OE1JRGxuUWNrbkxxL0picTlucnBNT2p6VXlIRWZjRFJQcVJqZ3F0cjJYdmFP?=
 =?utf-8?B?aTZvN0tYMm5pdW5zYXRNbE5jQjRNeC82aXRMVTRZeGpVSFdwTXdac0RBOEFt?=
 =?utf-8?B?V0FhczJSOTNjR0hxNDg3ZDlkM2R3Vm4xOHhuenNFS1FKeWhtYW0rdTRzd2hl?=
 =?utf-8?B?OXpjRERac1l5V0ZCMG9Lc08wSDBySnJHN3RjcVdwK3dvNlVpeStnN2pwb3Q0?=
 =?utf-8?B?ZVpMV0hndGF4T0lodWx2QkhzT0dqWjZJMkFCTy9zSHV1enFjNzhueDBCK2Rx?=
 =?utf-8?B?WDI0bUdXQTVCV0d0RHcxa2hFOTNrUVN0dE9PVFkzWm1pWHJlUG9QNjBEcElv?=
 =?utf-8?B?UmdDVVVSZ0FBT000R2w1T0trR2RXUW5yN2pNQzVWbGlNRzF5NmFDN0MwNytF?=
 =?utf-8?B?ZjZqSWF4bkpnYnlJelhwazhZN1cvZ01jTStSa1dLZDVFTnIxaUpObFpJSWtP?=
 =?utf-8?B?Z3V0ak9Eekl2SWxzRmtVem5BUExtVEtWUXR0ekpURWZ1RjVvd2xsNWdvbHFZ?=
 =?utf-8?B?eTRzYmpLQWVNaXdhRnM2WmFkcTVXSWs3SjJuWXV6ZHVJK3NyT2RBTis4YWc3?=
 =?utf-8?B?Yi91TzZCYXR2ZWtYMjVUV0lQTlZEN0x1U1AvVTdEZk1tVWVOQ0lJeUQ3bGdB?=
 =?utf-8?B?SFN2ZnI4UEFpaVdha1p4WUdSVFEybjRHUkwzY1VrZGJoZmZBaXU5cXRPWi9Y?=
 =?utf-8?B?YW1YOWYyeFdUMmxtNkVHRjM3c29UcjdDYUNZN0ZzblFyZ2tjZlRCc1c2RWJN?=
 =?utf-8?B?UU1LeG0zZTIzWGtrWWNpZXMrb1N6UXYrSXhlc3BJZjg1NU1OT3lBdEkrOHZp?=
 =?utf-8?B?SE1VZHdLUjJWL3RZeTloYVlhSCtwb0tHeXRNR3RKZXh4UENOcEFJeUlyb0Ew?=
 =?utf-8?B?cTlBS3laR1lKVTZadWdQS1NJdVZJa2JocThYcm9YT0FOZkU0a3ZmSXlDekJp?=
 =?utf-8?B?UXkxcmxLOXVWNmE0VWkrTHZjTTE1MHJnWGViSFRVRjRQbGc0NlVwblFuSDNR?=
 =?utf-8?B?ZXpIMTRFbTNuTHVJWloyMGZOc3lEUGEzeTNvUGNNQU0wdTJJdGlmYWxoNmp6?=
 =?utf-8?B?SmhVZ1BPbzllU2lVSVJveWdEOSswUnZnbGRDeWpkbUQ5a01WakJPQUdMMTVY?=
 =?utf-8?B?OTJwMDBrZG84Vm5YUFRHVW1XRWxIclNYMFczdWZVNDZCSS84MDdyUTBXOWdU?=
 =?utf-8?B?NW4reEppY0s5cTFLSHc1NHJlbm1NVk9NRmZKdUNMSU1GRmVLMVp1N2JYWklP?=
 =?utf-8?B?TkY5VVV4Rmc5TlQ1bXJTMHBtaE1EKzl2bWhrbERDTzVoUU5oektZU2h1NklO?=
 =?utf-8?B?V3dWMFAyaXZwa1MxakFHNFpoMGlMVnZJQ2dzTHBZcGkxbTdxN243MlVIYTRh?=
 =?utf-8?B?QWtGSWJkWW1Cc1cremhaTjA4RE4vTUhURElja0pvKzlxenhUVXhoOXQyWkVG?=
 =?utf-8?B?SFcxTFVhaFRlaTg2ZjVLWVBQeW1KQitReXNhZ3EycXNiQ1V6NEFCVHQ5UExS?=
 =?utf-8?B?NDB4cXNYaC81YkN5SnRxU0VhMzRoL1J2TmtxMG5kanRWcm43OXVnTkZPVzhu?=
 =?utf-8?B?a1BmRUZQVmhyZzhENU9Ubk53NTZOeWw5NVRNZXN2RERNdGNaS3dRQnIweFBw?=
 =?utf-8?B?ZzdJYS9LM044bUY1ei92YThPT0xvVzZXZ2pYUWN4Vm1wdkJYeXJtQWU4azVq?=
 =?utf-8?Q?TR0t7ZJlgttP4bi5ruswxqw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10DE733FFF93644FA63AD74973A7F020@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H2uuxo4LkfAzuiW/2ZMtYO+i+a1X0gqTTPRaE/UNNAF3Aw8AaV9OaOSbHvkJ+5c/CTQ8/Govge86FCar4+1a+cT7YZo3JrjLe/J32+Zjj8I00PEOFejE/1o3nkG+TCw9Y7UpqHrjxUUy8oX0NisFUrQ4zyzyP7OjWOWW57fttDIfXH2fOA4gEKutrWcpnYJnsPuXxjL/6kDgKov4OYDSvNy6fWYdtcgUTR1wB77ByBEUnznBhFnnLnvxnAp4D9X8+lvg2qsufva62sb60m2rgqf3WH2wAk5cdOSE5p0olp44OajCIrF+IyxG74R6nZfQrdMGL4MZVPqmScp7wTVAE3+FtUFhL5cbPz8fqpKYwDOqjpsiCClOR4a56KyyZeVgESvNlwLwABxez2VJSa4JImBatbyBIiMOcB80fjAgNrII2PWhUxYnTv77+MwzCkjoIycRF/VNBOXn5TjmnPSlBh2wlk0wUJFj34AAzo9kpwIXsakDG5MW4OcG3y6lJBWzt0YrYqyRgUKYbtm6952cqeJrALjWuiu+dL5BocR0m39k82aYVFJS63Wv3moj7Dupl2bZAsfRV5eGGOQM68K6OZZKyFRlS/9aR5DgzoiSGqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c16569-e455-471c-6ccd-08dda38a9d8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 17:09:50.0566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCw3dpj4bPZ1JpMEhhStaxVTf0g1DSzxZyAS5jCI7qrqd7nLTqM42x5G5Q/yN9wZn+5WFx2wIt3QE00UAY7/d00kNzSPao0J8o9Nf+Fcud4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040132
X-Proofpoint-GUID: ew_Hmh644ToWi8O0q7tFQQgAQZtXUeV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzMiBTYWx0ZWRfX9pp9croxmVPp CKBsaUkBEWHX3bIVuC3IKJ7K7/epaxk6b6v2WURBeHLYkQRsqPIJiMqFBjPxoR7nLbq+Tny0jx9 X+oN/m6GUmIfY8wDo0Gg828Pm+pAidq4qq0X5dPjyaRDV6FpPoU9Q5jNCZDTUuRv/EQckCkY28V
 +sQCoUaDXU+5dRcrz9cCn3u0CLifWM6HTQRIQrDuKPG5av/tROW6k3zG/TK2GHSvydlItjJneUJ r6hhRZfmBgjuVLoANjI6uttD0Bqc/sS3S7AD4sK2naUWGi/aBaSmPE1zq0lZ51cnb3UZO2L7+79 i+7gOhog3Tsir0sIMvScALyJnebb5UM+IymTCWWhXkxZ+FYbC/ryrJKW6WJlmiFOeQkIcGqRmTz
 lPMgFKlPUgL3TnSYTP3cUlhQ2Qx+KxL8r3+W2/1O6fEZmvFTVKGnRaIp7AQqt9n0kmNxiPWR
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=68407de4 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=yPCof4ZbAAAA:8 a=nnC6LwUoCx7AKfdz1I0A:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-ORIG-GUID: ew_Hmh644ToWi8O0q7tFQQgAQZtXUeV0

DQoNCj4gT24gSnVuIDQsIDIwMjUsIGF0IDc6MzHigK9BTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAgMyBKdW4gMjAyNSAyMzozNjo0
OSArMDAwMA0KPiBQcmFrYXNoIFNhbmdhcHBhIDxwcmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20+
IHdyb3RlOg0KPiANCj4+IEBAIC0yMjQ5LDYgKzIyNTEsMjAgQEAgc3RhdGljIGlubGluZSBib29s
IG93bmVyX29uX2NwdShzdHJ1Y3QgdGFza19zdHJ1Y3QgKm93bmVyKQ0KPj4gdW5zaWduZWQgbG9u
ZyBzY2hlZF9jcHVfdXRpbChpbnQgY3B1KTsNCj4+ICNlbmRpZiAvKiBDT05GSUdfU01QICovDQo+
PiANCj4+ICsjaWZkZWYgQ09ORklHX1JTRVENCj4+ICsNCj4+ICtleHRlcm4gYm9vbCByc2VxX2Rl
bGF5X3Jlc2NoZWQodm9pZCk7DQo+PiArZXh0ZXJuIHZvaWQgcnNlcV9kZWxheV9yZXNjaGVkX2Zp
bmkodm9pZCk7DQo+PiArZXh0ZXJuIHZvaWQgcnNlcV9kZWxheV9yZXNjaGVkX3RpY2sodm9pZCk7
DQo+PiArDQo+PiArI2Vsc2UNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcnNlcV9kZWxh
eV9yZXNjaGVkKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9DQo+PiArc3RhdGljIGlubGluZSB2b2lk
IHJzZXFfZGVsYXlfcmVzY2hlZF9maW5pKHZvaWQpIHsgfQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCByc2VxX2RlbGF5X3Jlc2NoZWRfdGljayh2b2lkKSB7IH0NCj4+ICsNCj4+ICsjZW5kaWYNCj4+
ICsNCj4gDQo+IENhbiB3ZSBhZGQgYSBjb25maWcgdG8gbWFrZSB0aGlzIG9wdGlvbmFsLiBJIGRv
bid0IHdhbnQgdG8gYWxsb3cgYW55IHRhc2sNCj4gdG8gaGF2ZSBhbiBleHRlbmRlZCB0aW1lc2xp
Y2Ugb3ZlciBSVCB0YXNrcyByZWdhcmRsZXNzIG9mIGhvdyBzbWFsbCB0aGUNCj4gZGVsYXkgaXMu
DQoNCkFyZSB5b3Ugc3VnZ2VzdGluZyBpbmNsdWRpbmcgYSBDT05GSUcgdG8gZW5hYmxlIHRoaXMg
ZmVhdHVyZSBvcg0KdG8gY2hvb3NlIHRvIGJlIGFwcGxpY2FibGUgdG8gUFJFRU1QVF9MQVpZIHRh
c2sgb25seT8NCg0KDQo+IA0KPiAtLSBTdGV2ZQ0KDQo=
