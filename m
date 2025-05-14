Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A6282E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747263687; cv=fail; b=GCsCgtadRx5IUp7Vcb6p3wW8BB9BpPGFE8s96B3JAjQbBUNf+zUFhB6UnNaYwA+XDxaw5FIEN0PRJI1i+G6NBU728SmxH+52kisCWGGotEcM8iDxjc/bQmXgUArJFDaF5Dn06AW4JfwDScOqEs/2CGtWH3XHV6cCshdopWOEH7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747263687; c=relaxed/simple;
	bh=j5ASW6lwB2pIJJ5MWSuL/ILf3KorI20X6xj9kwPXxjA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VBWBcO8AyYz2DCqqCE2uVd5wXV1EdfiiWXTJPZL64nPRfD9QI+D4Yzee1HIvsRnrX9ZeOmMLQx27kA5kVbYjxzf1hWilbT78oj1VogyMJ4rNafxYsbAIZbCvDAVShBia3Qe9KMZOvMIk4v3hgQ3lgGoeiT1iHUw9yQdRtiqXVCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RTSY5ISw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dXfa0zLD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RTSY5ISw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dXfa0zLD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJrfGA013550;
	Wed, 14 May 2025 23:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j5ASW6lwB2pIJJ5MWSuL/ILf3KorI20X6xj9kwPXxjA=; b=
	RTSY5ISwMsTDVKnDZLN98rHm+xZVE+gkiYQxHNjy/EfQRqwvgXTNyFyxmWpFy3Z/
	lXZgh8mmwcJ9gN64vKecPe7y2t8sdbYyYCBD2yIFWhhhT9ekvptyZ1j1MUPUGgq+
	9sMzGc/E8Pe1Bre9TpcWMNpU2MBGQJgTUmb06ZrKtevzsLzftXqra8GLMXY1Cj0m
	QFt5/9IWlLjixeEoSN/XEGsSm0XhlUJus1uogu8RiZjuHlmJu92kK6TQKgseaqGj
	stT+ivgQTJ6R63c2sggDEuLgbtpkL1vQ0eqJQGPICYUpBuud+QjX0Nm1STRZg314
	nHfWalMBk72Vzxp+Q/qcXA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchttpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 23:01:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELJpMQ016906;
	Wed, 14 May 2025 23:01:04 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010000.outbound.protection.outlook.com [40.93.13.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mc3431h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 23:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9fJM9Y6vR0ReKnC1DNpMFBgS//7AjBmQkFtjk3GrlFSraclvJAGQvdnCIM4R04cvtUwKWLWekM+jeLn/RiDtXRJSWIpJyUbcNZpKgEVRjk+m+lI3OdqI3G2eCXqtcqDCi8qLXqanJNqx3Bpk81B668fMz9Nqu0vVypoS1RkqxyUlHQRcJV+IUUQWGo35mGazkV8gOi2Pgi9W6385go5ABsKERkRi1XZ0s9wlUuI1OPLk/JMHwy2WRf0cZpvINY83lGO7R9HbybY9M3oPU5MSCuiGh3L65rD0QkCmg2orEv9p0dvyJYbPzgrHLw8bp0HWp4o0UOPjKZeitBpPTS+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5ASW6lwB2pIJJ5MWSuL/ILf3KorI20X6xj9kwPXxjA=;
 b=Ew+BtaNxCOx3QDrCZerFydQlSyLZ9mddVuNvMPZZptTo+UXaxr5Iv0YwaEHgr84nzlbqlXPSOdUXSk1WTC1p6qzGcnucbsVNitCgfOb/bnv7Pd9WfYZUJD7iilFmfuFF3qVJt+BIC/nTHWrDC0mT0S5C1WM6d1PiW4+5cqv684Zl+noudy5TWz0Zgo4A41oHrJUfkRP2PQXdbbbWEiCFsyrVkpEq509KljP+UKNoYIdjjodSse0NQ1c2w3wZT0bxnnVUn8b/gQISE6xoX6I+PX4Ve5FJegzJnFPpCIyorFUDcbqpsJcmKJkG4BORjC9WM6amAtjnm5JqoACPV3BfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ASW6lwB2pIJJ5MWSuL/ILf3KorI20X6xj9kwPXxjA=;
 b=dXfa0zLDuTQ+v2YguUpiZRWHXhKbaDt8mUGKckriSuZAwZ+GqyDyr4hcJfdCzDBGHwSjNPfupOXvY7F1VRrZWmIzwWN8ukYa1/Gs9QOLGGV/EbkWV3tm55O4VidccEMb9bWeoado8uDs/wAT2wHW/EnrWtADAEXiJK3euSlpYyc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by IA1PR10MB6266.namprd10.prod.outlook.com (2603:10b6:208:3a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 23:01:01 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:01:01 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
CC: "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 4/6] Sched: Add scheduler stat for cpu time slice
 extension
Thread-Topic: [PATCH V4 4/6] Sched: Add scheduler stat for cpu time slice
 extension
Thread-Index: AQHbxM0na/RgrG3D3U+/6ZSOBQ6NJbPSvnUA
Date: Wed, 14 May 2025 23:01:01 +0000
Message-ID: <2929CFC1-9B83-4268-988E-4BD17454DB88@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-5-prakash.sangappa@oracle.com>
 <d3bb8ecd-3ac2-4025-bd81-4d612bb26995@linux.ibm.com>
In-Reply-To: <d3bb8ecd-3ac2-4025-bd81-4d612bb26995@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|IA1PR10MB6266:EE_
x-ms-office365-filtering-correlation-id: a7dbdba4-9a42-42e8-f409-08dd933b3277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?czk2dGRPOXN2VlUwSDZQZm5NVVl5bmExL1ROYlk5WUh2RlhSTXF0dlpFUC9Z?=
 =?utf-8?B?bE5DcEFvYTgyTm4xTEhvZm4zUVpxdkpkZExtVTZubldLUWFuSjQ1azl2a1NX?=
 =?utf-8?B?dmdYNXA2QzZqblJlaXpwQWhZRHQ1djJDejlYb0k2aHdndktSdTBHc0phZVlw?=
 =?utf-8?B?Zm1RZWF3citpSmpaZTBtOHhDNmhFaHZGTnJ1SnRRWmFiYUFPc1pvZ1VJUkF5?=
 =?utf-8?B?d1p3S21rUVN0eVNwQ2kzYzZWWFExaEc1K1FiNExsTkxpSmdkZlVvdDRaSklZ?=
 =?utf-8?B?V1dRSkgvU1B6VHF6WkFxekZyUUJ3ZmxDMUxnZEVSTlVoeFlaeHVwaXV4WWtt?=
 =?utf-8?B?VGxIdDJpSTlaMDViV1lRNnM3WVY3TEtQT2xDdUc5M093WHorRkxmeSsvaU5y?=
 =?utf-8?B?OFp5a0tlUEd0Q0poLzJaUE1xOVhIUUwwRlNMZVdkMUxmdDlzTW94a1d6ZVlr?=
 =?utf-8?B?ZHc3YkhSN2JVL3c4WDA1Vk9EdGQ0dVYwWG5PWnBxYXp3bmVpTmk4OTBqaVFj?=
 =?utf-8?B?U0IvYUtkQTJYRnhueU03RWxQVkNEOXZWc0kxRzZaVjd6V3BTR2c3YW9aWUlX?=
 =?utf-8?B?Qi9KNnB2WVY2a3ZwdE1kL0lXZWowTU82YWdGTWJEOEZiU0gxV2JHY1QyT1Mw?=
 =?utf-8?B?K1M1YkwwZkdlWXVCWU9iQkxndEF5dW5KWTNzbjhrTU9OKzBrUXNFb0dDRU9o?=
 =?utf-8?B?b3JiVmxKWWI0VTE3QjY4VVhKbWVaRnBFTFZEOXE3YzAxVy9VWGI3MjlsUkM0?=
 =?utf-8?B?dHlQSC9sUU54ZzJiR21UWDMvQzlCQ0txM1hXV1lFTmtEVjVRT1AxcVNtS0Vo?=
 =?utf-8?B?cktmRFI1N0wyNGpHajg0R2MzT29DTnVsMWRMSmNSc2IvbzB2b2xBa0d4K0hk?=
 =?utf-8?B?NTBKc0FIaHY3Ny9oeFlOclE2dE5hYjcyUFhVTnZqNEE4aFlUSWRWeUo2UUNN?=
 =?utf-8?B?dytnRnQzbjBrejgrZlRWRElSaEJrNWRkZ2tWT1MzTlU5Y1BDSEt3TzVYbVRR?=
 =?utf-8?B?N2lUN29PVTRQTWYvNklzVkVvNVdkUmR1c05wcHZtcnA4NDNFc29rSnNrdk5v?=
 =?utf-8?B?TVd4RThhSTgrUHpxRGkxdkJnMzh0cHVMcDY1aFcxUWpEcExSWS9Fdlo4L1Ez?=
 =?utf-8?B?dGFLN3hZeWJjRm91ZzVMMDJsR0pVNk1qZnZLbmp3OEVEbHJNZXA4bHpPRkZz?=
 =?utf-8?B?NmFQVkN0TEE5Z0VjS0xaSjZOUDR3a3dVMDNwRTJ3NTdoWWhtWkk3WHhZb2s0?=
 =?utf-8?B?dUdYcDd1OTNtQlJtODlHR2lZUTdKQjVCNDl3M0gyM0hkTTlPRUZaWWw3ZFBr?=
 =?utf-8?B?UlR5SS9ORzdTdGFKVWYrQ1VkZFB0MVFiTGpkak0xaldRTXpUaUc5VmhhMTZF?=
 =?utf-8?B?Z3lBWGpDRWN4cnFqZXk2MnJWbEEzc0JLLzdTa3U4V3lQejI2RWdwUGNFczZ4?=
 =?utf-8?B?djhrVXBjaDkzelVTd0pwUGtrL2RKSENCSE8zSzBVRndmZXdNVWg1aXZJVlNw?=
 =?utf-8?B?YU9UcEhHTmtVL0J6MTB3WGNUa0hHM3lLREROZWVJeHY0QjRrODZFRFBhYlNZ?=
 =?utf-8?B?dFBaZWhDNzlPVkNuTEFZQkl3N1lNMW5rVzR5QWtTYm80TC9rMUlzMHdZSHRl?=
 =?utf-8?B?NHI2akZONWYySmVON3c5OWdoVGo4NnRVY0JoZHJHdk92bkh0TzRzcGsrV1du?=
 =?utf-8?B?U2tXem5RcXVDNlZTRGFUaFFYeXVoUlB3MUwzU2puVnlVV2dwSkxsSTdubStu?=
 =?utf-8?B?RDRYamVqNFhEVEExbVNlNXpVWktMVFBMc3hFbW8zY2M0ZGJZL1Y5TWIrZGZ5?=
 =?utf-8?B?N1RzT1lhNGt3dmIxZFVuUWQwTWF1dHEyTjRJbHdPcVpOc1E1YksxWlV0V05R?=
 =?utf-8?B?eGZZTWxidmY4djJtc05pNnhlUkwwNnZIOC94cUhYOEI1TWhnSnU4YkpkYTJy?=
 =?utf-8?B?dlc3RGlpeEcwOVJwQVI5R0l3dU4velpZZTk5WGVoaklmdnB4MzFmNnBXY0lI?=
 =?utf-8?Q?QmdXz4pkeYNuclUqbWzguLERF1Xnbw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDVvOXpaV0tjYjhMenFYbzVyd3E0WGNDM3cyT2JZM1VHWm14TzZmLy83aDc1?=
 =?utf-8?B?bDFwNDM5dG5KTVBhcGQrZEZxQWsxN0dKSVZpOHMwUGF6QTRyK2lWQmxBUER4?=
 =?utf-8?B?d1V0V3dwUHd4YlpWREc5eHBCNkpCaTJ1TWxvc2hTN1lONC9JTmtuYWJ3WDMr?=
 =?utf-8?B?aTgrU0xtakEvYXkzR081UnBIK1hMSVBRbjRyVE4yT0QyOUpUYnkzSnpKdy84?=
 =?utf-8?B?MHpkaVhEOWgrRWFLZFFnUTZ5ckpwbWQ5VW1Ca2VaNzgrUU40eWgvZFp3UTNj?=
 =?utf-8?B?ekMvNDl1My81UE1PWERRelRrY205Z25uVG9LdDBpcEFZdDkzWDJwM3Y3MGVZ?=
 =?utf-8?B?VTViQ2NNcXllbTdlbmtsMklTYmZsdWhUKytveFdmL3NCbE1RL2UwdEFFZ0Zj?=
 =?utf-8?B?aGp2WFRjODFaS0dWWGFTTlNETXRnQjVjeW0rUU95aVIxbThGQWJDOGJjMWhJ?=
 =?utf-8?B?VzhxS0FWWnB5ZUkxc3hkcG1ndkhTaEJjMDNHN1gzcDVoUEc5d2EyWFdzRHJU?=
 =?utf-8?B?NEgxTEJFUEs4T1JKN2U4MURBRzVXbzNwWUJvZTcrQUIrd3oraS8rUCtLREhp?=
 =?utf-8?B?c0ZMNFlOWnJDNm9IMG40aTFFL3BqVStXVjNPc25RUUNZLzZWdnNDcEV6RWs0?=
 =?utf-8?B?WXpmM3pUOFRiS3oyRFlxZWhUeU5YSWxGNm9BR3V0Z1dpU1NBZVUrTVBIVm0y?=
 =?utf-8?B?YlZLNWtSM2Q0RENna3lMeWU3b3kydzk1ODlEM1gzRXFEQlJhcHB6OVlleFA2?=
 =?utf-8?B?US9FODdJckQ0akUyVlY2dS9TRXlWTEc1ZEw3a2VhNCtVaGQ3ZlRNU1N0SUkw?=
 =?utf-8?B?V3YvYTlPOW8wYTJhMmNqNkpseC94eDEvbkhEVVk0OVdmcFNGL1hjTnBYZVAv?=
 =?utf-8?B?dWUzOGlheEE2UVo3WHM0UlFqOWN6aCs1ajhNOHp2VkYyTk14d1Zmcm9ZNCsz?=
 =?utf-8?B?OHhta2dWdnVmSU8rZ2hDcUFibHhHaENpTkVpbkVzRjJnYzNNZkdmS0R3bEpD?=
 =?utf-8?B?QlVpa28vbEIxdWNkSDdROWw2N1dvRFVTY21EdHdoeGpWWWtzS25kNEVzb3JQ?=
 =?utf-8?B?VFE2SmhwVElDZmpQTmZjeDVJRG56ZGgwaXFpdmFoSkdWSk4zb0t4eWdmT1B6?=
 =?utf-8?B?Q0h6QldlSTFvQVU1UFdZM05XWDNNVWVTTldCYWQwTjNJNG1QK1UvY0tyNUJ0?=
 =?utf-8?B?WmhvSkxHZGMzQXRGcGZVNHcvZHV1UFJMdmtiam5UV2pCbmJUclpTQU16TjJ5?=
 =?utf-8?B?VmlBS0x4R2pXUHJZK0VraGZFTnZHR1J4dVVTaU5vWDlFb0RscTlwYTdPbFd1?=
 =?utf-8?B?RkhicXZlTzNnRWluMnB1QmY1U2xhbVE2TzZicWFEamRERWcyVjR3VVdTSzEy?=
 =?utf-8?B?ZUtseC9UL1ZTWnE2a0YwV0tZU0NPUjUrTWVNRUcveVNBVmJ2bFlPVjJaT3dy?=
 =?utf-8?B?dnA3VU9HREFnZDQrRnRmQ0wveEp5d1NCSW1sOGJZZzA5UGVtU0pZZTFtVU9J?=
 =?utf-8?B?YWI5K01JSmhzWjlUUy9IVSttam00M1dTVWJ5UUNJTm1ET0RCdkMyQkl1UGYw?=
 =?utf-8?B?TXp6VFZodE9acmkzdDFpeU40ZkpkL0lCOEYyT3VrdC9pakdPWUsvNjRnV0t1?=
 =?utf-8?B?bTJ0eUZZRUZ3dEU5cmpPcVRSeGJyQmc4UEtlOGd6dVJGRjJORzVHK00zNHNL?=
 =?utf-8?B?RTZSYVVxdTVPUzBZUHlVRmJiNEdERWhCTURwZkc0Mzd5cDRDNzduUFQxV1dZ?=
 =?utf-8?B?NXo3azhpMXZLKzI5Tzg0S2pJSW14aDVzVXRxamVSQ1JhUWFBUFhnNUVILzh0?=
 =?utf-8?B?MVdYa0VzS0Z3cnB0OUlBa1NPcC9STXRXYUJ3Q1JXSFNkejZWNTRMNUx1WU9X?=
 =?utf-8?B?cmh1MFJmT3pxRm93YkNNMnhNQWxyd1F6bVQ4ZTJ1RE9FWlkyNFZtRVYzS2pT?=
 =?utf-8?B?RzYyNUJaWjl6d0VXU0dWRlVRYldlL1FGUGhXcVA0cEtlYXZEaWc1dFlSdTVP?=
 =?utf-8?B?UDB6WCtjUVBGTlVtM1dOeTY0R1pyTDZJTlhNeE4rK3NWZnArcGFiVlBZTXBN?=
 =?utf-8?B?dktOTlNrdHpvZ0ZaK0NYbkJpcmZPRUNYVExXY3RJMDY1YlhOY3B2QjNZYStO?=
 =?utf-8?B?QU51WUduS1Q5S2xUM3A2ZUMxVm9XamM3VEtqaEtmdVZLZkRxQS9MTFNoNEhy?=
 =?utf-8?Q?4ENPqpyh0TFvTLkfSncGjak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0131FD474AA949829306406DE01487@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zoQuYDZpNDQ3wtKj9/cAL1E+WARAZW9wC8Viru17DWY+Pl6JMNirybh4sa/Q1xmQD67U/1HeA16S7NZD6cnQuH3XYvsfRrtL34fbhFbhaZ3U52ug8iYBepg7382bJPM0WVgd79lZIUXxrqcoIYidnSNWm2NXmu0Eg5km0gB40EJohbedpNyXrmMVxTdWsj8Y1wLEnRt2ezxNwIkrujdNXFActzNejK7aIgURQQR+GyUPHiZi/JzvFFeVdi46j494rF0J8f7Mr3KrTIjRSR0ZB7soK6nh+cmmM2WZ0VhXQp8xyL2ZueBi+AEb89sg2aBOfbxDNhpAT3BKkHgegaSZeUUU5TU67vzOkmjSONm4C3E1waUwI7/sVoO+3Ptyf9BSA2lZ/Fd3byWgR1QAg0FDh7n4MY1VHuLx6l+Xrvq7EPJ1iW55DGELEsDYtD2C4N4Cc8XlKr0EoPe5OGj4w52LyV4mdffO+jFbz9iRPD+Y7xTfk0EQhZxpdmaM4i52sJtKpZ1xEGTOwxyUFbSeZzpbL+5MNMuYt4GBN8u60T9dTVqGiA0vfWP3nRh2FE/WelusATf70SYzdzgx3rWX6ci2Fw7ZWCpEUeYSxdDJz4tpk1w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dbdba4-9a42-42e8-f409-08dd933b3277
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 23:01:01.4937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fC9vezQ11VSt2Hpos4s4TtRRkyMfNSVHNVEsUH6oEiHbuZ5om3HnSanFdprZb90ZY3twzOWy6ZdEGINscquTBL7WBbiYdbP1q835uwYWNv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6266
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505140213
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIxMiBTYWx0ZWRfXzHsWMtSbznym f7GJqBzv8DeVJtwHkBwgB8ONMLK+OpZJqp86kt8/qkgON1o7IAXFsrOOJCqAe/g9CJ5uObnJOjN UD9KdRZLjlElzxiLZPSQuebZjHwzz9vMnCUHxSwC3bbuZODlsCUG5vrqxs8MTWldwXPUNi1k3wZ
 d+6qvi+Jgy4pWYqelLNfGGiYve+qTZFUOxdUU9F4omGReSmbX9Ngb1eguKVqTjwHdc6DSCaFP97 idkKyyLFrCrq7fpR0B/tB3n77ZpDgNM4S3r3zlCn6U0nZldaHOzWuSrZWylu3drLw2L0MBYbuOa DZuIOV0uJiQLgVcVs+IB2oF7AfnuaotMOLTG3iGDifo3bBxkFA1UF73ZdayAsnZdCARzHEuFFno
 oQgHENYy3Jxz16moq5ZPm6P5/crtPvMaCI9DEWm0FdL+nX1spjAy1AClbzxPl+g0xz4Gg4Ba
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=682520b1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VnNF1IyMAAAA:8 a=yPCof4ZbAAAA:8 a=_HE1cvtof-DJBIw3FhEA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13186
X-Proofpoint-ORIG-GUID: 4eANPnKot_zi-I_7ujHVl9iVlGpMyvut
X-Proofpoint-GUID: 4eANPnKot_zi-I_7ujHVl9iVlGpMyvut

DQoNCj4gT24gTWF5IDE0LCAyMDI1LCBhdCA1OjM34oCvQU0sIE1hZGFkaSBWaW5lZXRoIFJlZGR5
IDx2aW5lZXRockBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4gDQo+IE9uIDE0LzA1LzI1IDAzOjE1
LCBQcmFrYXNoIFNhbmdhcHBhIHdyb3RlOg0KPj4gQWRkIHNjaGVkdWxlciBzdGF0IHRvIHJlY29y
ZCBudW1iZXIgb2YgdGltZXMgdGhlIHRocmVhZCB3YXMgZ3JhbnRlZA0KPj4gY3B1IHRpbWUgc2xp
Y2UgZXh0ZW5zaW9uLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQcmFrYXNoIFNhbmdhcHBhIDxw
cmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGluY2x1ZGUvbGludXgvc2No
ZWQuaCB8IDIgKysNCj4+IGtlcm5lbC9yc2VxLmMgICAgICAgICB8IDEgKw0KPj4ga2VybmVsL3Nj
aGVkL2NvcmUuYyAgIHwgNSArKysrKw0KPj4ga2VybmVsL3NjaGVkL2RlYnVnLmMgIHwgMSArDQo+
PiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9zY2hlZC5oIGIvaW5jbHVkZS9saW51eC9zY2hlZC5oDQo+PiBpbmRleCBj
Mjc5MjMyY2E2YTIuLjhjZjc1NmU4MGFlOSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgv
c2NoZWQuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9zY2hlZC5oDQo+PiBAQCAtMzQwLDYgKzM0
MCw3IEBAIGV4dGVybiB2b2lkIGlvX3NjaGVkdWxlX2ZpbmlzaChpbnQgdG9rZW4pOw0KPj4gZXh0
ZXJuIGxvbmcgaW9fc2NoZWR1bGVfdGltZW91dChsb25nIHRpbWVvdXQpOw0KPj4gZXh0ZXJuIHZv
aWQgaW9fc2NoZWR1bGUodm9pZCk7DQo+PiBleHRlcm4gdm9pZCBocnRpY2tfbG9jYWxfc3RhcnQo
dTY0IGRlbGF5KTsNCj4+ICtleHRlcm4gdm9pZCB1cGRhdGVfc3RhdF9wcmVlbXB0X2RlbGF5ZWQo
c3RydWN0IHRhc2tfc3RydWN0ICp0KTsNCj4+IA0KPj4gLyogd3JhcHBlciBmdW5jdGlvbiB0byB0
cmFjZSBmcm9tIHRoaXMgaGVhZGVyIGZpbGUgKi8NCj4+IERFQ0xBUkVfVFJBQ0VQT0lOVChzY2hl
ZF9zZXRfc3RhdGVfdHApOw0KPj4gQEAgLTU2Myw2ICs1NjQsNyBAQCBzdHJ1Y3Qgc2NoZWRfc3Rh
dGlzdGljcyB7DQo+PiB1NjQgbnJfd2FrZXVwc19hZmZpbmVfYXR0ZW1wdHM7DQo+PiB1NjQgbnJf
d2FrZXVwc19wYXNzaXZlOw0KPj4gdTY0IG5yX3dha2V1cHNfaWRsZTsNCj4+ICsgdTY0IG5yX3By
ZWVtcHRfZGVsYXlfZ3JhbnRlZDsNCj4+IA0KPj4gI2lmZGVmIENPTkZJR19TQ0hFRF9DT1JFDQo+
PiB1NjQgY29yZV9mb3JjZWlkbGVfc3VtOw0KPj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yc2VxLmMg
Yi9rZXJuZWwvcnNlcS5jDQo+PiBpbmRleCA0NGQwZjNhZTBjZDMuLmM0YmM1MmY4YmE5YyAxMDA2
NDQNCj4+IC0tLSBhL2tlcm5lbC9yc2VxLmMNCj4+ICsrKyBiL2tlcm5lbC9yc2VxLmMNCj4+IEBA
IC00NzUsNiArNDc1LDcgQEAgYm9vbCByc2VxX2RlbGF5X3Jlc2NoZWQodm9pZCkNCj4+IHJldHVy
biBmYWxzZTsNCj4+IA0KPj4gdC0+c2NoZWRfdGltZV9kZWxheSA9IDE7DQo+PiArIHVwZGF0ZV9z
dGF0X3ByZWVtcHRfZGVsYXllZCh0KTsNCj4+IA0KPj4gcmV0dXJuIHRydWU7DQo+PiB9DQo+PiBk
aWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2NvcmUuYyBiL2tlcm5lbC9zY2hlZC9jb3JlLmMNCj4+
IGluZGV4IDMxOTI4Y2JjZDkwNy4uODgwMzY4NzU2YjQ4IDEwMDY0NA0KPj4gLS0tIGEva2VybmVs
L3NjaGVkL2NvcmUuYw0KPj4gKysrIGIva2VybmVsL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTkzOCw2
ICs5MzgsMTEgQEAgdm9pZCBocnRpY2tfbG9jYWxfc3RhcnQodTY0IGRlbGF5KQ0KPj4gcnFfdW5s
b2NrKHJxLCAmcmYpOw0KPj4gfQ0KPj4gDQo+PiArdm9pZCB1cGRhdGVfc3RhdF9wcmVlbXB0X2Rl
bGF5ZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0KQ0KPj4gK3sNCj4+ICsgc2NoZWRzdGF0X2luYyh0
LT5zdGF0cy5ucl9wcmVlbXB0X2RlbGF5X2dyYW50ZWQpOw0KPiANCj4gSSB0aGluayBzY2hlZHN0
YXQgZG9jdW1lbnRhdGlvbiBhbHNvIG5lZWRzIHRvIGJlIHVwZGF0ZWQNCj4gYW5kIG1heSBiZSBi
dW1wIHRoZSB2ZXJzaW9uIG51bWJlci4NCg0KDQpXaWxsIHVwZGF0ZSBkb2N1bWVudGF0aW9uLiAN
Cg0KLVByYWthc2gNCg0KPiANCj4gVGhhbmtzLA0KPiBNYWRhZGkgVmluZWV0aCBSZWRkeQ0KPiAN
Cj4+ICt9DQo+PiArDQo+PiBzdGF0aWMgdm9pZCBocnRpY2tfcnFfaW5pdChzdHJ1Y3QgcnEgKnJx
KQ0KPj4gew0KPj4gI2lmZGVmIENPTkZJR19TTVANCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2No
ZWQvZGVidWcuYyBiL2tlcm5lbC9zY2hlZC9kZWJ1Zy5jDQo+PiBpbmRleCA0Y2JhMjFmNWQyNGQu
LjZiNzUzZjU2YzMxMiAxMDA2NDQNCj4+IC0tLSBhL2tlcm5lbC9zY2hlZC9kZWJ1Zy5jDQo+PiAr
KysgYi9rZXJuZWwvc2NoZWQvZGVidWcuYw0KPj4gQEAgLTEyMTYsNiArMTIxNiw3IEBAIHZvaWQg
cHJvY19zY2hlZF9zaG93X3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICpwLCBzdHJ1Y3QgcGlkX25h
bWVzcGFjZSAqbnMsDQo+PiBQX1NDSEVEU1RBVChucl93YWtldXBzX2FmZmluZV9hdHRlbXB0cyk7
DQo+PiBQX1NDSEVEU1RBVChucl93YWtldXBzX3Bhc3NpdmUpOw0KPj4gUF9TQ0hFRFNUQVQobnJf
d2FrZXVwc19pZGxlKTsNCj4+ICsgUF9TQ0hFRFNUQVQobnJfcHJlZW1wdF9kZWxheV9ncmFudGVk
KTsNCj4+IA0KPj4gYXZnX2F0b20gPSBwLT5zZS5zdW1fZXhlY19ydW50aW1lOw0KPj4gaWYgKG5y
X3N3aXRjaGVzKQ0KPiANCg0K
