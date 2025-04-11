Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA07347C7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404897; cv=fail; b=fbf6OzCL0N2c2aQtk9Ru3RjxrAXjvf9AU+y23anid4XGSnT3R6HEDCWCoc5Lysd0zE+RmwqoAMBnnMkXIHmH5MtPO8P4WonQqsTA2DtRCLr4tLM5sVfFVgdfoTQtr+2NDQcgMnbg0rxCpob+4WP60hvQ4griTebh3+EvWfAxxLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404897; c=relaxed/simple;
	bh=fwWcaFPD8BntuA3Jv9CxtrrkYuOB+ZBrjy63MoHgAQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i76goEIrFIQ7ns6OefeOeEf4taARLsnl5GVnFg9YjE1vIh4SvQmyAauKfxs0Cw9lLXlEbJfDd35c0RLtAVO1wzapbVEfm21gN+vH1GQ9QpAjugcbHnMtPiV2SYAWxw/UsNevMN+ba0JDNRTfqkZZb0m87eJkE5HOluzQzRj+PZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V009tjsW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qBZbljCM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V009tjsW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qBZbljCM"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BJfmXC012399;
	Fri, 11 Apr 2025 20:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fwWcaFPD8BntuA3Jv9CxtrrkYuOB+ZBrjy63MoHgAQY=; b=
	V009tjsWKRG0bDi74MR3OGrZFVaJaaEyaEHc1w4E0Sq+yV4KeEJcHZXz1wc9Dh29
	KAF+4KRjhFjBizqoS1pMD/cmTNs+txVtjihWFNQKtcdUui4zLAbJ9ZZAQtLY5bzX
	4/HD395G8QcqM3/+8xJuXTytEEKxytNV1K8YT/vFzU5iJsBL5mDysO6NpqgVrZXQ
	jI86we2+fV0JrpCF+Gpe3Cjwsabi/N4yd1L1yukFCr4IAu5P3ihu9yEZugnbdjBX
	nBCn6fjXrzQxjksQK5Xr8ciPIsO2f/TDl7Kcdiihb6DLy3xnvZ7Z/cmgEaI56FqK
	xZ4YWXzzou5Lr7RQSjZ10g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45y9fe049w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 20:54:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BIpjiH022270;
	Fri, 11 Apr 2025 20:54:16 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013076.outbound.protection.outlook.com [40.93.1.76])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyewj4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 20:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLU+w1jHo9YVR0qOctCRvmtIowpsf5ux1kNhDTtMgEgw/kQx/ZJmT+oVSdoQbXeZ/kbK2Y/TPnds8rx5PlYF80NERyrEOOuphgYsZSou7B0JLGgJ97J77NvHaqPR30kwECPDfgKO54ufJh33mxZS74ppEeShl7GNpe24gw7eJy7Lsm1wyTxBlmx2ht6ZS1A9X58Y6pVPWcDxloZ8CCMXwTBB9Zfiznnayw4GwEO3GVHdOg2YQJc0a3dc9BAjSLQX7gVrynTT9eYkHz1TPLN/PamRbXavcH//vN1L9Jx+zZkjpY7fRVuA21n0TlSMaNDGYkoiZRR23lrWQrtZE0Uidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwWcaFPD8BntuA3Jv9CxtrrkYuOB+ZBrjy63MoHgAQY=;
 b=enX/EesOYmqa2a1EuX+bZKjpFgRZeLbSbvVhZsor1iCsZgkDYVfRMVgFKaTRY35hl4vZf4F4H907xMxsYJ1ZOt8vAgFBLggBW6ETRcVnaRl5y1ACElhNw7zGTiJTpd8UkI7SIGwoQ5ogo1mwOPHns1Dpsy+jfmBU4R+8qnPQvx4kNHAQq9yQLuAPFBEBV56rTNPL8SrsMA/BEX1jjFsry3AofiFhaugSCCKFvS6lHj4vDMTRHsSt010F/IlqnQ6HJY8qYkloT6JqvfqqcJVE4UenEf/FmBMV0YD/R2Lt5LkC4l5q0r1VPnRVJzFxGVayjbBvHZZIwbyFldJkCKVsmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwWcaFPD8BntuA3Jv9CxtrrkYuOB+ZBrjy63MoHgAQY=;
 b=qBZbljCMQeHVWR+SU3GwO2DHzbAmcqT29wDfv+bmx6v8ZxcQNPqVZkMApS1o9VRQIzOIURIgI+iUCFUkKvwsnUvmzuLCmsBVDtHzU5WpDdJ2Dgg3jDllO1KAI0VwcRnbGfZWLT0pQw23HpYe8/DPQsOCb6LAwaPLUvwPaYZgsC0=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by SA3PR10MB6997.namprd10.prod.outlook.com (2603:10b6:806:31a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 20:54:14 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:54:14 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] Scheduler time extension
Thread-Topic: [PATCH 0/2] Scheduler time extension
Thread-Index: AQHbf0Q2OR3YDnbdnE2tu2zJcXVlQrNLvDkAgC2FogCABeX5AIAgIVqA
Date: Fri, 11 Apr 2025 20:54:14 +0000
Message-ID: <1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
References: <20250215005414.224409-1-prakash.sangappa@oracle.com>
 <20250217120000.5ae1201a@gandalf.local.home>
 <821926D8-ABED-4B66-9E2D-39594DB82FA1@oracle.com>
 <20250322061422.2b24f021@batman.local.home>
In-Reply-To: <20250322061422.2b24f021@batman.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|SA3PR10MB6997:EE_
x-ms-office365-filtering-correlation-id: cc3ab981-643f-4151-ef62-08dd793b046c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1BzbDVtR2ZSb1drRDZ2ajIyb3VGZVhjcmhmOVBOd0ZhalFFQWl1MHpVeUl2?=
 =?utf-8?B?c0dwZmtnMGVBdC9ZQXJCd2UveXlxeC9FTlJTUlNuU2RTMURYQWQwTW8yRnQv?=
 =?utf-8?B?V1oza25uekRGNmFsNGpOZFZkQmZQR3FFMzBQWWQvNVY2WTJlcDc0OHZOUTdn?=
 =?utf-8?B?cFZBZmIyTmVIaWUzTVNyR0t0TDJQNTRJR3E0aGpyZzFJK2kzVlVCK1FSZExk?=
 =?utf-8?B?aEJmNm9MZ2lyeDJIMHY0SDVqMzVFU2M4cDgyMTVqMnNwZFhsK01LY3FlbndX?=
 =?utf-8?B?YWpqVlNQM2pCOTJIMWY2bUdMVm1ZN3UzZFRDZ21IRGVoUHhlbkVGeDB3RHZV?=
 =?utf-8?B?ZU5ZZi9LTjkrZHdicVYyc1RlOW82UUhuWlhWQ1RZNW1BVDltQlNzcnpKUXBj?=
 =?utf-8?B?SzFjdmFwOWFsMmI2VitOUHQ5dThMZDVPeWF1bC9WeGFWSGZTM2kydzRTOENN?=
 =?utf-8?B?Y3VLL2Z6NjNHK2luMGxGNVg0M0gyZHZoUnFyanRUcHZZQmhCbVJieWdzdmZs?=
 =?utf-8?B?NjNSUDJRNGJ0UWxMSnQwaVhTKzJUZVRCQkJEWUNFWFNvOEhudUtSSFI4QmxG?=
 =?utf-8?B?a3J4d25qbzV5ZW51TzFZdml2T0s4N1dxMGhmTFVSSkFZSjltQlp0czh4TGpv?=
 =?utf-8?B?M0lWSy90OEJZNGlRTXRzU2JZRXFYL0Y3ZzNxdjJ5a3dPYjR5a0lNSmxkVjdh?=
 =?utf-8?B?bmpOTER0akhnblVHY05GWUQybWR1SnphcjJWSk9OZ0N5MzBaT0VJZ3A0ZXZl?=
 =?utf-8?B?M2dQVFd3WkZmRThPUGEvS0IzMzlVa0dRSnBXV1FiQzg4elFIRkl2REVNQlZX?=
 =?utf-8?B?MGhWVnV2c2VGdGpXVkNiRHlOZHJhSDNqSURJMHJsQkxnY0E0VWV5aW0xZmpN?=
 =?utf-8?B?bC9ybUZwcUNCdHRyNG1wakJjVWJsZE5yK3RkVFIyR1gvWFNFOWxZQnN4ck1Q?=
 =?utf-8?B?NTNNTGd6TmhmNGpEanNnRW5RcE5PMmZuT0NCNDQzK1RLb1VZSFYydTR0b3lj?=
 =?utf-8?B?WG5MRmVCQnlmWkIxWDJCckdZZ2tGODRrYVhrK3pwdXJ4NEpncDVpK1FWT1Fa?=
 =?utf-8?B?ZlhsRGtUQU14M3FQM0oxajU5TmdFdmtPTmp4V0JZVlN3WWNGS2tzaGVIY3pQ?=
 =?utf-8?B?R3ZKbXp4TTFWU3dOT2tJWlJFN215b0dWM0xuTjd2bFdxWFpOTk9weVVVRlhG?=
 =?utf-8?B?NWhPNFBmR1JZSW9rZ2RyS2dvS2ovZm4raDV1aU9lZ3hPSWNZRFpLa3F5WGlY?=
 =?utf-8?B?V2dKTXkxeFhiaEc4NmFwczZzV0hoVi9HSnhyc2tiVXIxeEtKNlhmaTIra1RH?=
 =?utf-8?B?NWdTMDFudzh0b25RRDV5bWQ5ZXQzdjh6bE9iKy93TS91K1BOWlovbE1YL0Ns?=
 =?utf-8?B?MmZtaFVJckkrVlpxN1k0aVBHeVVjZytFY2wvZVNrUUtpYW5Ic3NvN2VCMy9P?=
 =?utf-8?B?UUFlQko1WGFxdUtDZ2RMd1Q4YXlDRXM1SEgrMXVhYTlqS3V4SzdSd1NnaHVS?=
 =?utf-8?B?UUVkWTlIRDhGcVpoL2ZUQWl2cllJTEdOUk9Tbkpmdy9vUHdlM0hHY09WdjRH?=
 =?utf-8?B?bDBmS2lzb3M0c2JJeDZyQy96em9ZMVFnOW1EZEhUa1RaZHZaMS84WEpvSm1r?=
 =?utf-8?B?cDB1N25OR215Wk9JOFRyWWZFMzBLNjVUYkFEZzZDdXJTQytaZmljRDQ5Znd5?=
 =?utf-8?B?VHJNQWVNZ3RRUjlWSDNPM1N5cmFsbnpod0diWkI2bm9pcVJwdzdRQklwT2cv?=
 =?utf-8?B?Mk4zS3EwTnNqNFVycDEvdVJ1MlZtZHFMT2tTUmlXUnFyUVZZeXZ1dm9vc2RL?=
 =?utf-8?B?Yno5bUZKRGVkemZ3c3BvMmJrNzI0ZFhvT2Vxa2NMOVk5Y0VNVm5Bci9TZjUr?=
 =?utf-8?B?TXZ3QnFPTUZDWDNHZmRtNUIxS1JqMGdVR3FOZW5HeUIreGNnVnNJeXRzMzhI?=
 =?utf-8?B?YzZjNDlPaVdXaXJTUlJiUnhHUXJOeHprMi9pV0VIWVA2NEQ1M0Z0Z2lLVnhY?=
 =?utf-8?B?NUxKdXNlbHV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmpSMUdJRGR6ajNSbTNwdVZiUms0dHVLajZXNnpDd0p5YTdaTFNjaXlPbTNG?=
 =?utf-8?B?LytnOEhVQWlMcnA1RVJiSHk3Q0tHTHJ0U1p3VkpvNkhvSU1WU1RhbEt3VkE0?=
 =?utf-8?B?MnhvZ2hNaG94bkU4ZCtqMEJidWRNTG13RzNqRVA5ckNpL3ZxdlNLa1c1WDFp?=
 =?utf-8?B?aXNiTXJiQXg1Ri9zNHB0enhTdlduS3V1amJKanZNbE1rZ2J2MjZTdi9xWFZt?=
 =?utf-8?B?RU54b3hPNkQ2R0c5ZXRQRUNTQjBNcFFmclduWUhHTFVQQnNDSE5LMk9TY0JQ?=
 =?utf-8?B?aFBoQTgyT2JYQ3prRFlUQUpCQm02c0xROWZyMk1sanJ0d3U3ZEZtdXloL24z?=
 =?utf-8?B?TEJrbjNVR1E3ZzN3R3VCdGVsMjdiKy92cWE4dVJid2YyeElFb0NzNk1kUFg1?=
 =?utf-8?B?U0Q2YlkxRytrRFpuOFhEOEx4TlNUTktnQlZJckllSCttdXowazZGeG5KRUZY?=
 =?utf-8?B?eHRXTlhOL0N4aE5HSk9hUVQvKzI2ektjRGxsM1VnLzFGRHNxVm1HQ01pRy9M?=
 =?utf-8?B?Qnd4UUtvQm1qY3Q1dzBEckJaQ2pXbkhqY2hJQmNOdklrVEJmMk1UckpMRW04?=
 =?utf-8?B?NHdQZks2dlZCbGJpd2NNRDZOVjNxZDZIYzdOdmEyTXFBV0MxSmN2S2pHZmVZ?=
 =?utf-8?B?NDFiaStIS2J6WG1UWlp4eGJGVG41SFpQUURHWWI0dU4zN1FEVzZXdXRyZUFj?=
 =?utf-8?B?ejhDRjUwZllubE81REJCOFpQMFJ3RGJZOWhhTENRWHFtL2hIRUE1dDhUdHg3?=
 =?utf-8?B?cjJiaVdnakNlSUFqaDV6dHR2TFlXZWJEeU1FL3NaM3dMSHVVNXk5Yjd4eWdX?=
 =?utf-8?B?cjFzd2NKZmdhcjBRSXlKUkJxWWhUZDREZXZJN3VCWk9ZQ05JcmxNMm11STFX?=
 =?utf-8?B?T0dIMDBNU2MrVVdOY1dTUW5PL1g5bGsvN241eThSZUJxU255bHJSMlBML3FG?=
 =?utf-8?B?OGI3RXhsTVFxZ1owMjlHSlRFT2NXaFhUMzFITlh2TnFRT1lkUGNTMVM0Yml6?=
 =?utf-8?B?bHFsZmVjVkFudkVMeFFocDJNejdEYUZEN1M2MzA4blR3WFM1bkhkOGxHOHhj?=
 =?utf-8?B?TDI1Skc5TTFEaEgyMXFoM0thYmJwcmQxZkJTaThhY1l4WjZOTkN6eG1FWG9N?=
 =?utf-8?B?WUJ3NjV0TVdnL3BDWTlqR0xrZnZuaUlrZk5pOCszOC9QbTUvWmJKa3JBS2s5?=
 =?utf-8?B?U1I3Y3JCSGp3K2owaVUrZEhFUWZ5b1Q4NUpMVEZwUUJ5UUZSK0hQNXdBZVpJ?=
 =?utf-8?B?WkdsWThTTW1rYzJUdUdmc2twVCt2aVZrNmcvT3N5QThYWHNITjFiOVJLZ3ZF?=
 =?utf-8?B?REhZZTdST25taWhBUWFXeW9MZkE2N2l3UFpGL1ZqNHBxZmFlL3ZrVTBXdElH?=
 =?utf-8?B?VW9GRzRhMU9UdmRNMDEySE1EUEpQNzZVa0F0WDdGTXFlWExnek00SWlNbFNJ?=
 =?utf-8?B?bWpKcTNiZjF3ZDNsWktMc2Q1THF4VG9xR1RRN0p3N2JUVTZlL0llVVR2WjNH?=
 =?utf-8?B?SEczSWFJNWhqeXVTTDl0V1ROMzhPdnY3QUQvRmNhWkxRVmE0VW5rRUk0Sytq?=
 =?utf-8?B?RlZmZWxoTzVUMzF4Q3pSWUpPU1ArRmxxODNic2FVV2J0UUNPMVcrbC8zeXFI?=
 =?utf-8?B?cmkyMTFmZ3FpVkFPZ2Q2QWtlN0dEb1JXdzh6UnZ0bER6YkgxZ3ZPVFM2Rm80?=
 =?utf-8?B?VG9jYWxtdldDV2N2T2wrTVl4Zy83SWJXZlBKMHYwM0hyYmRJa05ZZUQ5SFhy?=
 =?utf-8?B?RW9JcmtuTFFPaU1qL2dQdlpHU0RWUlRWS0dzREsxNHpmV2pOajIrWEhBSmZh?=
 =?utf-8?B?dW1UQWpYb2hMQ2xwU3RlZk9Ra3ZjOFMydjZVZ0tKUnk0TG03a29CTEg4ZFZB?=
 =?utf-8?B?M05JR3Eza1Fvb2NmemV4dGJNNGlRT1dneHZoRWs4aWJKM2l1eksrOFRmYWxo?=
 =?utf-8?B?RDg2ZUM1TW9yRzFzN3FCMGVBakNqckVBNzNLc1I5MnhiS2wzOWlSSDBITDNU?=
 =?utf-8?B?ekpoZXJTWHRJYWdvaTcwemVWdUUrK2RiUW4zcmg2aTM2eit4eTlhdCtzN3F1?=
 =?utf-8?B?U3hOUktweHhQNWl4NFY2cmhZR2pDaGtXYjBDRWEvS1VlNmVsdDcvd1VVcjlp?=
 =?utf-8?B?M1Q1djRWY2FKSTdpdjVQaFJrZC9FSnRjalkzWWJNaXNiVmpwWXkxamFmK3NJ?=
 =?utf-8?Q?bjZt7RPBTlBfnJ5oHCrlxOk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <704B7EE87F5A2F41B483228577661078@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWxhoJhUmtHOfzhXEHEknrSRDdASdZ++VNrrhYbNeYke9XCok1fGeROpSjeH0qUNo3dWtDiVEXDeUV7X1zijp+wUrrnhHtevprsdqyB+N/VQYuIb4S0k0CySs73QkvAUNiDTqwcRH4e2tze9iyCKvPHtCf+iwlMCV+cg2FPd3H6PeafubI6+6Cmjl4gGR0tUGWtUJgoeqJ/fe8InGfyOmiH2jmjQYgzHa7/on3xh8cupdXVh7F+dkwbBczMnHpQxkw2iI4pMXgo/0Lks+R7F/0nYLdY1on2Vi6s/pzQ68W71qLpUMvNS+mVHwhbaNnNVR3Gra2IMBZLv1B/ZRMUa0HXPKmB3e5XzHUf/7tPe2lDKF/xjN6occRhDksBxOOt1g1T2tDMTPtClzcfep1tpcnciC+ESSTchCN5pnfcwpCZ9iMPW4Hq5S/WtqmKHShfuRTv7+94RmObe5vpvICHNANFjsSnmW0Ya0NtM9axfHFsT7JxGSnlbF3ipO94lQn5wWi4KGM8KpW8zSum4jyYoU19lSvKy4a367Zkf0NeEtvoC/N7RjjG+5p5rh+yWRnDVrKRdszaO8tS/BDOVv7vDQEkxzAjRurkVO6pwRsUPmxk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3ab981-643f-4151-ef62-08dd793b046c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 20:54:14.0634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsTAQuTFIYNBUF9j1SBbIFqx7EOfkUH9xnE/h3B4jn8LZ45W6L+SPMF4iJhqpKPW/tE0pJi1iQzVrUrevH4fX8wNLuDiLct188LOlnJGgVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504110133
X-Proofpoint-GUID: TvF3bcSbh-8g_rWI-KLUDGsODMjXzHy3
X-Proofpoint-ORIG-GUID: TvF3bcSbh-8g_rWI-KLUDGsODMjXzHy3

DQoNCj4gT24gTWFyIDIyLCAyMDI1LCBhdCAzOjE04oCvQU0sIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0
ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMTggTWFyIDIwMjUgMTY6MTA6
MDkgKzAwMDANCj4gUHJha2FzaCBTYW5nYXBwYSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBIb3cgZG8gd2UgcHJvY2VlZCBvbiB0aGlzIGZlYXR1cmU/IA0KPj4g
QXJlIHdlIGxlYW5pbmcgdG93YXJkcyBlbmFibGluZyB0aGlzIGZlYXR1cmUgZm9yIFNDSEVEX09U
SEVSIG9ubHkgdW5kZXIgUFJFRU1QVF9MQVpZPw0KPiANCj4gVGhlIG1lcmdlIHdpbmRvdyBpcyBh
Ym91dCB0byBvcGVuIGFuZCBJJ20gd2F5IGJlaGluZCBpbiB3aGF0IG5lZWRzIHRvIGdvIGluLg0K
PiANCj4gTGV0J3MgY29udGludWUgdGhpcyBkaXNjdXNzaW9uIGFmdGVyIHJjMSBjb21lcyBvdXQu
DQoNCkNhbiB0aGUgQVBJIGJlIGZpbmFsaXplZD8gV2UgaGF2ZSBhbiB1c2UgY2FzZSB3aGljaCB3
aWxsIGJlbmVmaXQgZnJvbSBpdC4gU28gbGlrZSB0byBzZWUgdGhpcyBmZWF0dXJlDQptZXJnZWQu
IA0KDQotUHJha2FzaC4NCg0KPiANCj4gLS0gU3RldmUNCg0K
