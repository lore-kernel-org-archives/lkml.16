Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C105AF9E8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743558808; cv=fail; b=apwOo8/572JNtYr/C8f5lfYfMtS2ypGBzuYGUed26mDOcGVkLN8BOioyjUH4NUqaJfTj8u8tQOqsc1GK4sWl+Inu56fI4S39cs7hAyyiJ+q1BoA4vbtBZ4Xwe9ACiVV3fZ2UcSEml0XRWVtkV0RQPAB1LWpvLQ/J9Usq9M0jrEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743558808; c=relaxed/simple;
	bh=a6xelN7KqEG2oOFQIznbc+ChNhSypQpXomqqJJwfcnA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gCrt7+VmnvixvckCSPRkwB/9ajJXdSEasmvnpeKC6kupI4xnrFijkw4xavy5QV5lQ3Tyf0hbcyNeE3f6Ffig+NT5Dw2hhlSVAA82SybMY6bpDz1Jzy0352pPS0DP7x7F5ekyxamZSAV6mFozZu1gWJKrK+avDpqloMS/c5dmKUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PrwyC7y/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KsBLUqhA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PrwyC7y/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KsBLUqhA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531L26Xg014719;
	Wed, 2 Apr 2025 01:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jUm9uEEXYHC8AvQ1M031Zcg++e3dB8gYo4du4sfb4x0=; b=
	PrwyC7y/obnjCzGa23u+thC1I2cmYySc2moWn+qCabZBOCMrsThnN92HGEEOF/lw
	vbUkq5/igof/vxC6RCjUXIMVyf4djI1Km8jMkpIjvokbr3OJ/6i8Gist8AUCUqcH
	dG2FXa42GVSGw0hnfkrHlrpj6CB1vHDOzmJQYq0DF8FMzrPqXTu25m7MJIfijy41
	5iXUPikwnlZEIG/2ohTHF8WITxWlMlTyNLyicUGI8e65JEO1N0pFoUQjd8WEQtA8
	2L121fFrq29yfQLv87ug3sQx54ebJxtwbIXuz6d32ww/ilDWHMj+kQbPX7hR2mW6
	6869xocwyYZb6nvvk5+7PQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n29scw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 01:52:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5321U7DC033568;
	Wed, 2 Apr 2025 01:52:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aa6jpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 01:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU7w+NrVWfPvnLE3hRkXGPt66Ggjl0/Lwvgu8NhMTK7YNIGBPI4G8ChZV7ZVTniZbXTQctgZjqN/141OkiORLW7VI1oB8f8oFYQScEui9BtNjEIP9LL22itBS281I65QCTEoBMUDe665NUKw33QwBXhEdtOj/JSB7DdJjftOGXgCe6E3l/9TZno3eSTLjcuBNg0VBpOaKOoTMCGmQGaa3dDLuBNAMSajFQylWLP8G6y2DxCFWXQwmE42RAwTBSYvrg/87RLkeBkp3cFrot6R2z6LHOttItl4NLW7ElvDnkIMw7gaCDVRbk1E4PJOgeT4sUzz5v8J+lJD4jZPOdzkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUm9uEEXYHC8AvQ1M031Zcg++e3dB8gYo4du4sfb4x0=;
 b=mNhqUFYhqgioTpoxR4AuHeXxff++/LmYbCN0C9vUGcPPtaN77SvZlONyhUAuzp6p6zPKg83RbVmQIcPRPP7iwjC03lRRY2IdoZDQhGgQyesK3FizI/fN8AggiA1ktBO6YACeq3Oj2TIttsQuUY2zHjyVoNOeDhJbPiI2y6EmWc+DIZontcn0/mI4SNKacHNGF7zk6a9Z2nRoMkvZfL51d7GfkOLHuLO5kI5baPQv67/Z4pXyT0bI7a2abB0Y8psZmdz+xSRINvrpchAj/iyWm0PkCMCG1JNDCObUuZQDtAkMx4WR9yJjYdwoGkJRj6k+ySgXULoPcwsQC7yA7YaSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUm9uEEXYHC8AvQ1M031Zcg++e3dB8gYo4du4sfb4x0=;
 b=KsBLUqhAz35T4NHJhNphjx6TItPfU1QwHs339MERPz/hB4fH6OSwizRsKIfKvZ5GGKUC1gOwTvGLkBOWiOT0Vgfp8FsOHte+cpq24od5cZVIrWTpwh/R4ubeX5oVw0kuQppM4Vyf5YQT1d16zfYZNOszYJA6fhvT4yJa7VA2yFI=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by DS7PR10MB7345.namprd10.prod.outlook.com (2603:10b6:8:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Wed, 2 Apr
 2025 01:52:49 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8583.030; Wed, 2 Apr 2025
 01:52:49 +0000
Message-ID: <cf25be6e-bffe-486a-a02e-d828203bec3e@oracle.com>
Date: Tue, 1 Apr 2025 18:52:46 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Peter Zijlstra <peterz@infradead.org>
Cc: kprateek.nayak@amd.com, mingo@kernel.org, gautham.shenoy@amd.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
        yu.c.chen@intel.com, tim.c.chen@linux.intel.com, tglx@linutronix.de
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::22) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|DS7PR10MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cc4ac6-1f43-4a3b-25a0-08dd71891254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjdEOGcrZ2JJQjhNM0VveXY0QTdYUWZlRk9jUDNYQjBrcjIvQnY4VERqeGl0?=
 =?utf-8?B?NHRvZXBjQklzTnFVbVBXeWQwSWtMRE45OWNid01IVGFvM2ZvQ2pMMVEvSkJT?=
 =?utf-8?B?akgyNmpaeHphZEszNnlkNWdtQ0NBQlBlalQ4UFhuRU1OQzdZK3ZUeWdxZW0z?=
 =?utf-8?B?TVJvclJzWGlyVXhqY1ptZTBrSXkreTNwTTRMSDRWbFJEUEVvOGlOaGdKeEFr?=
 =?utf-8?B?cTNRZUtLOXNzeFdvMXdpaFY3OGVra1l4RGVmMWFlZjJjUFFIZ1BqRml2ekFt?=
 =?utf-8?B?aVBGOTVJeXVwVnVpbEpSWlNUbUtlUnhKdFVyQ2xlRVZBVEZlb3FSQjRIT21n?=
 =?utf-8?B?dmUrdlI1Mlh0VjAxTUMxNFNKb1FQK1h6WWp6MG5sZjYyMzk3ckdqRTVwNnVL?=
 =?utf-8?B?di9NOEx4a0dZTzlIS2lvcWhBTDVIbVZKQjJkcHhScFhkcTJwSE80ZXc0UExM?=
 =?utf-8?B?UldPYUhkMUhmazhwcC8zQjYxaW9DNEpGRzhYMFRpbTJ6eklXSkZOdFM3Qm4x?=
 =?utf-8?B?TkpqWjlEb1VVQzhmYm90Zkl2WTl6RWM2Mi83TEFkK0swSW11SVRkWEh2V3BR?=
 =?utf-8?B?NG14Q2p0a3dzOWJxbEowYnVJSWsxNUxOR3NSZzdjYlNFRFdERnMvVFZHS1dj?=
 =?utf-8?B?MG1FT3hXeGdHb0dqVEpKLzhCZGZ2d2FETnFUSXQ0ODlUem9Qb2ZXQ0l3R0U0?=
 =?utf-8?B?TUJQSE9GYy9Fd05CZlI3d0RPVWxDcDN3RnhjWU82TTEwZXJId1VHN1ZFSzZU?=
 =?utf-8?B?c2FIUmJKNmhTZmtPTFVFZSsvNEZnNjd5UnZBczd4TldBQ0F3WG00THRnWW5q?=
 =?utf-8?B?SVZOUTk1a3Mxc01IVlpwbDZCMTVQaUthNGdsc0VNWmR1S0h0OExjMkJVdkNl?=
 =?utf-8?B?WWxjOU5WTW1LTFIrM1k0OWV5K2lKbWpkOFEvU2M0eTIyakZSaWl3T1ZUSGFq?=
 =?utf-8?B?elNIZ3hZQWN0cldleWhZUkNwYzR2MkFpR0t6aGk2SDBTNGZoZ2VMWTlUamtu?=
 =?utf-8?B?OGNLVVhlZlJkcVhQL1NVZXZmbm12OXZBaTFYNU5GTnY5L3BJbU03VDE3Z2VT?=
 =?utf-8?B?b1VoNlIvZmdiTzNLTm8vWTVWa0d3QmhXbzFmQTVGUVRjUUw0aGVPQmhmSlkw?=
 =?utf-8?B?d1NMNTIyb3B0SWNTdVFXQk4vcGxqRFUrTmR5RDhkeGFsOCtxSTg3eHFnMGUw?=
 =?utf-8?B?WDAxbmtKZlRDZ2JBNmpJWGIrM2d1aG1oYmc5eko5WG04TGxxQ1FRaFU4cVRT?=
 =?utf-8?B?OSszZ2FWdEFlY3ArZnVkcHp5UjgyZ2ZlSHVyYVFONWg5ZnhzSU1FWnNMLzJV?=
 =?utf-8?B?YmltZnJCb0czZEJSMGFPT3BUbHdzVzhNbHlCMkR2bjFZTHJkVEU3bktwR3Rs?=
 =?utf-8?B?L25Zem9GWG96Q2N2SHp2aHFJMkNZb0FIUjdtcy9WUi9XcjdjdmpvMk8yYzZO?=
 =?utf-8?B?M0UrZDM0VjZCUTQvemE4a21SRGJQYlkwQ2NnSzE5cC9SVXlPa1RuQk9IZGdp?=
 =?utf-8?B?aDdRWTVGNDNkN25vWG5FNXBSK1IrMVE3QnIyREVGNEVoZ1NEUnNjUHJKckZ5?=
 =?utf-8?B?K3oxMVYvRlhhWnZvUFBBeTN5TW9wbzBqKyt6Uk1LbGZ0ZzFXVzRjeStvRVVl?=
 =?utf-8?B?SWZnY2lJMnpwRkYydGJCQzNsc1FXRDVnYWRzYWxTRjZXaWhkQzFJd052Qkt4?=
 =?utf-8?B?L1dvcVFPV3BucTdDQjFMZEYxek9UNmp3ZmdJWlE0ZDF4YzJvZncrcXhaTXB0?=
 =?utf-8?B?dStqNDNwaWFTV3R6VW1DMVVwMGtFSnc0N0hsMW8wdzZJVWQ3eHg4dUpLV1Zz?=
 =?utf-8?B?UkZWTTZBU0s5NlZwc3lJOFJ2SU05SWFqNmVJdHdqRVRSWlpjZE16cHNxQjM5?=
 =?utf-8?Q?AA47SlzXj/R+W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW4xaTBad1E3L0QwUnF3VlpTMERxeEoyY05aRVhqYXl1T3RPOVUxTWdCemoz?=
 =?utf-8?B?NEpZOE1vVm8vb21UTVZIMEM0T2xDS0s3UmJjb080dDhXcFdlY1N6Y09TMXN6?=
 =?utf-8?B?dXlnVFlxZks2UFdQU2ZDK3BTaERnTkNnOC84TmxGVU5VRVdGRlB6RHZCZXhS?=
 =?utf-8?B?RnJaZXFIODA2dDNNL1NBOFJuYWxnb0w4Nzh0MmJCa2tDTmZXNERXVWxIT0Jn?=
 =?utf-8?B?UTQwdVdhKzdmWXRDUnhYSHd2a2FidzhveFJhM00vcUYwaVNzT3d1T1hNd3hZ?=
 =?utf-8?B?LzgxeXdXUGR2bzFQeEZ6aVBUSXU1dE9oOGdMZ2NIcjFMVkVZYk02YUlPb1BB?=
 =?utf-8?B?Q2N6eWZKbTEwMFFtMkRpOG9HRDhaeFFETDUyQ3F6NEcvRWFVV1UwTE5wVlZ2?=
 =?utf-8?B?VXJLUWkzV05KSDRvS0FwMTdVSmZ4a0krRXlCUFpabFcrVmRSNnVnbXJJbTc0?=
 =?utf-8?B?elBVU0R3S3BnQWNyQ0M4NzdLaGh1dlBPQ3o1bnZOVXI1M3hMRSt0eFZOLzhF?=
 =?utf-8?B?RitWckZDUnhpMzFSWlBrbDNCOTlmQ2xER2djV1FHUlRTTmJWUXo1OGQrQlg4?=
 =?utf-8?B?aEVwSEZ2cDZnWFByRzQxZmJLeVgxQ2FkL21FMEoxbU05blU2MkxHUDJTSCt2?=
 =?utf-8?B?cGdWRndKUmVEMDhRdlFtS0JWWC9mZ1R3MDJzV2EwRWw5a2FsbHptLzF3WERs?=
 =?utf-8?B?d0xiR2l4anRKQXZlQkNCL292Q3BsVWJwaC9HV3p5TE9lbDUrUHZlUkdpc2kv?=
 =?utf-8?B?OGZ6VEFYQktUWmNkSkpJclEwVkN3b2F4NEhsTHlwTXZLM3E4ZEhYTlJSajUw?=
 =?utf-8?B?UzU4YjEyaXFoeVFoZzdtdW0vMFh5aEFaQTVybjFiREVOZFZNK2thaGZxbTJD?=
 =?utf-8?B?eWJBYmVWSkxtMzhJTGxKbG4zQVl4VzZleFdsNERVa29IdmQ2L1VMc0VoTVQ3?=
 =?utf-8?B?K05SYUhyZURuSHp3cHpMS1J5bGtValdmWnY4S0tnS2wvNTE1TCtGOHhUSkgv?=
 =?utf-8?B?dy9WZGpzTXhGKyt0UmRvcHJYL3h5bHh0eHNCaDRVaDB2UmhHNGxRUFdqRWFi?=
 =?utf-8?B?ZW5LYkhOODFERlJESk8vK1VySFdwR0tZR1gvYVVwMklueFYvYUxqR3kzYXVT?=
 =?utf-8?B?ejZzZzQyNWtPZUNvS1hBb1lWcmF5U2pVemY2cE9tczF2QVo3cWt6RStUeUN2?=
 =?utf-8?B?U3JBQ0ZSYXFPbm1pZVU1OU0zOUZNK0lHWmJMS3BtOUx0cldUbXNtWC9oRHRy?=
 =?utf-8?B?WldXaE9MQVBIQUVzTzBHMVVWV1R5R044Y3Q1am1mNDZ4U0lPMkNOL0duNjAy?=
 =?utf-8?B?K2VwNUxnN2NEaitCd2I2NXdSajc2RXByT0RXamRSNDhUY3RXSHlObHh2RXFj?=
 =?utf-8?B?WkQyT01VaXdTUG91TFRrSlFvTHUwUVRmM2hQRTVVYkg2cWlZU0hHVm9IN0Uw?=
 =?utf-8?B?aWdIeDJHUW9sT0k2Y1FwKzQwbDFFWnh5RFljYnJENXpKWnpSR1JYa3NyRkN3?=
 =?utf-8?B?bVlla29hanI3Zzc3MTg5alh6aUIxbW8raTRkOWhxUGZaREJxRTlKWVZTWkla?=
 =?utf-8?B?NEVrSzMvRTYyVTgvcXIyWllFZzI2QlpvQlAwaFVsNWxrVzF4TGpwbWtpc0c4?=
 =?utf-8?B?K3A1cHRMSUQ4TWxvRDlrTysveGsyRSsveG1DY244ZS81MFk0RGlldDIwQUxQ?=
 =?utf-8?B?OGxNMy9HMmNDbW0wZVFhMnUveWxJeUh0TGVSWDdmdDRDb3F4OTc3aGlBUU53?=
 =?utf-8?B?aEV6bzFudkIyZFEwbEFJb2RpMWt6OGtheGVLUVluTzg3eFREYld1aDdobitx?=
 =?utf-8?B?RGFMeG5BdEdqMHdDdnZ0LzlYWDhvUzh4bEp4alZha1M3ZmNyOWg4Qkg3Z296?=
 =?utf-8?B?bUJNN21xWG1EclJENW1vZmdpTjVmbGs5MzVGVk1nOW5CMGVhSTlGTGVPZ1A2?=
 =?utf-8?B?a2ZPRHMrSjR6NnZjYm5KVW1WTmVDSElIS1J4ZlJ6OFRWNi8zTEJDaTY3ZE1E?=
 =?utf-8?B?Qi9aRFI2eHpHaGM2TDM3TkdNMVV4N01jUE9uYTN6ckFlT1Vta1Bra2tHQk1t?=
 =?utf-8?B?K2RaVUpLeVdybllUMkZNbUZmZ2VoOS9idE9UdGduZ2dobEd6dUc3eXZzNldD?=
 =?utf-8?Q?48vwInjopBBzB6TjptSdKXgkk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d+2zVgks5gA2uSJVNa7YUw+Y2YY+4rcu+rgFCjEfE5ptrRGoENHvKPU4J7fWPrdpARBnh1zRB3FTwITxhuYf3EL8u3txrLxXbZDggMhCLRajurUBsD7jyG2hAaMNVZXaS4eFuN1qh4Dxl4wLTynsTnD3Q/Kmw++4koJIUIj2c6sff8SpHYEk0iFoYVkTpekq15ysiiWbRh1UvrcyYnKIV8YhqFdOrCGr7y6/+TSaSEi3tppDs9W53KWsYvIJxAnBDPXqSUsrEeYz/xrNmyDaxPAg5dlCaYCk38AwsPdQ5EcFnSaEsl5mEOHjfr8J2uTPR/gQCYQ/NKJbOMfGlCaFisQhqz8fhYqRT/W9ErU5ORVZjHRbb1u17+k87nJS1wPRAyO821UnEgeET9vu1EtQqGm1ZXZmW4SMeKhh+0IlcVLRQtYbxR8glo33C15hwJg9ZXzmwy/u+lM3Oxbs9xN6aq/uiJzZegJt9MIs3R464iHmjr3GHHv+5GE/NdwnI+H7kQAxQlP6aT7vYh31mlRf7ffQD29M7N1cfYdGMned03AW51Je9h8hX4ULn3kqgbqS9GBSXQmrltMqjW6qIGI5bdQpZFsNWa4jMAVxAXFwbms=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cc4ac6-1f43-4a3b-25a0-08dd71891254
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 01:52:48.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIlIBW3OWdAMLcgifBwLpzbEAL5EHD48UVboz6r0T7Gtp8SiCGXdAbKbbDQ40KZ1ljj6VGrgRpJzhGQhz7elBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7345
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020010
X-Proofpoint-ORIG-GUID: BFa6wlp4a0FyL5NBbCsvwPBNYFVz0WsJ
X-Proofpoint-GUID: BFa6wlp4a0FyL5NBbCsvwPBNYFVz0WsJ



On 3/25/25 05:09, Peter Zijlstra wrote:

> +		for_each_cpu(cpu, cpus) {
> +			/* XXX sched_cluster_active */
> +			struct sched_domain *sd = per_cpu(sd_llc, cpu);

Hi Peter,

I understand that this targets llc, but just want to point out that sd
here could be NULL for arch w/o llc, and then this can cause NULL ptr
dereference in sched_domain_span(sd)

Libo

> +			unsigned long occ, m_occ = 0, a_occ = 0;
> +			int m_cpu = -1, nr = 0, i;
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				occ = fraction_mm_sched(cpu_rq(i),
> +							per_cpu_ptr(mm->pcpu_sched, i));
> +				a_occ += occ;
> +				if (occ > m_occ) {
> +					m_occ = occ;
> +					m_cpu = i;
> +				}
> +				nr++;
> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> +			}
> +
> +			a_occ /= nr;
> +			if (a_occ > m_a_occ) {
> +				m_a_occ = a_occ;
> +				m_a_cpu = m_cpu;
> +			}
> +
> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				/* XXX threshold ? */
> +				per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
> +			}
> +
> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
> +		}
> +	}
> +
> +	/*
> +	 * If the max average cache occupancy is 'small' we don't care.
> +	 */
> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> +		m_a_cpu = -1;
> +
> +	mm->mm_sched_cpu = m_a_cpu;
> +
> +	free_cpumask_var(cpus);
> +}
> +
> +void init_sched_mm(struct task_struct *p)
> +{
> +	struct callback_head *work = &p->cache_work;
> +	init_task_work(work, task_cache_work);
> +	work->next = work;
> +}
> +
> +#else
> +
> +static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
> +				    s64 delta_exec) { }
> +
> +
> +void init_sched_mm(struct task_struct *p) { }
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> +
> +#endif
> +
> +static inline
> +void update_curr_task(struct rq *rq, struct task_struct *p, s64 delta_exec)
>  {
>  	trace_sched_stat_runtime(p, delta_exec);
>  	account_group_exec_runtime(p, delta_exec);
> +	account_mm_sched(rq, p, delta_exec);
>  	cgroup_account_cputime(p, delta_exec);
>  }
>  
> @@ -1215,7 +1434,7 @@ s64 update_curr_common(struct rq *rq)
>  
>  	delta_exec = update_curr_se(rq, &donor->se);
>  	if (likely(delta_exec > 0))
> -		update_curr_task(donor, delta_exec);
> +		update_curr_task(rq, donor, delta_exec);
>  
>  	return delta_exec;
>  }
> @@ -1244,7 +1463,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>  	if (entity_is_task(curr)) {
>  		struct task_struct *p = task_of(curr);
>  
> -		update_curr_task(p, delta_exec);
> +		update_curr_task(rq, p, delta_exec);
>  
>  		/*
>  		 * If the fair_server is active, we need to account for the
> @@ -7850,7 +8069,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	 * per-cpu select_rq_mask usage
>  	 */
>  	lockdep_assert_irqs_disabled();
> -
> +again:
>  	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
>  	    asym_fits_cpu(task_util, util_min, util_max, target))
>  		return target;
> @@ -7888,7 +8107,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	/* Check a recently used CPU as a potential idle candidate: */
>  	recent_used_cpu = p->recent_used_cpu;
>  	p->recent_used_cpu = prev;
> -	if (recent_used_cpu != prev &&
> +	if (prev == p->wake_cpu &&
> +	    recent_used_cpu != prev &&
>  	    recent_used_cpu != target &&
>  	    cpus_share_cache(recent_used_cpu, target) &&
>  	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
> @@ -7941,6 +8161,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	if ((unsigned)i < nr_cpumask_bits)
>  		return i;
>  
> +	if (prev != p->wake_cpu && !cpus_share_cache(prev, p->wake_cpu)) {
> +		/*
> +		 * Most likely select_cache_cpu() will have re-directed
> +		 * the wakeup, but getting here means the preferred cache is
> +		 * too busy, so re-try with the actual previous.
> +		 *
> +		 * XXX wake_affine is lost for this pass.
> +		 */
> +		prev = target = p->wake_cpu;
> +		goto again;
> +	}
> +
>  	/*
>  	 * For cluster machines which have lower sharing cache like L2 or
>  	 * LLC Tag, we tend to find an idle CPU in the target's cluster
> @@ -8563,6 +8795,40 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>  	return target;
>  }
>  
> +#ifdef CONFIG_SCHED_CACHE
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
> +
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	struct mm_struct *mm = p->mm;
> +	int cpu;
> +
> +	if (!mm || p->nr_cpus_allowed == 1)
> +		return prev_cpu;
> +
> +	cpu = mm->mm_sched_cpu;
> +	if (cpu < 0)
> +		return prev_cpu;
> +
> +
> +	if (static_branch_likely(&sched_numa_balancing) &&
> +	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
> +		/*
> +		 * XXX look for max occupancy inside prev_cpu's node
> +		 */
> +		return prev_cpu;
> +	}
> +
> +	return cpu;
> +}
> +#else
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	return prev_cpu;
> +}
> +#endif
> +
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -8588,6 +8854,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	 * required for stable ->cpus_allowed
>  	 */
>  	lockdep_assert_held(&p->pi_lock);
> +	guard(rcu)();
> +
>  	if (wake_flags & WF_TTWU) {
>  		record_wakee(p);
>  
> @@ -8595,6 +8863,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		    cpumask_test_cpu(cpu, p->cpus_ptr))
>  			return cpu;
>  
> +		new_cpu = prev_cpu = select_cache_cpu(p, prev_cpu);
> +
>  		if (!is_rd_overutilized(this_rq()->rd)) {
>  			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>  			if (new_cpu >= 0)
> @@ -8605,7 +8875,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
>  	}
>  
> -	rcu_read_lock();
>  	for_each_domain(cpu, tmp) {
>  		/*
>  		 * If both 'cpu' and 'prev_cpu' are part of this domain,
> @@ -8638,7 +8907,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		/* Fast path */
>  		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>  	}
> -	rcu_read_unlock();
>  
>  	return new_cpu;
>  }
> @@ -9288,6 +9556,17 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>  	if (sysctl_sched_migration_cost == 0)
>  		return 0;
>  
> +#ifdef CONFIG_SCHED_CACHE
> +	if (p->mm && p->mm->pcpu_sched) {
> +		/*
> +		 * XXX things like Skylake have non-inclusive L3 and might not
> +		 * like this L3 centric view. What to do about L2 stickyness ?
> +		 */
> +		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
> +		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
> +	}
> +#endif
> +
>  	delta = rq_clock_task(env->src_rq) - p->se.exec_start;
>  
>  	return delta < (s64)sysctl_sched_migration_cost;
> @@ -9299,27 +9578,25 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>   * Returns 0, if task migration is not affected by locality.
>   * Returns a negative value, if task migration improves locality i.e migration preferred.
>   */
> -static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
>  {
>  	struct numa_group *numa_group = rcu_dereference(p->numa_group);
>  	unsigned long src_weight, dst_weight;
>  	int src_nid, dst_nid, dist;
>  
> -	if (!static_branch_likely(&sched_numa_balancing))
> -		return 0;
> -
> -	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
> +	if (!p->numa_faults)
>  		return 0;
>  
> -	src_nid = cpu_to_node(env->src_cpu);
> -	dst_nid = cpu_to_node(env->dst_cpu);
> +	src_nid = cpu_to_node(src_cpu);
> +	dst_nid = cpu_to_node(dst_cpu);
>  
>  	if (src_nid == dst_nid)
>  		return 0;
>  
>  	/* Migrating away from the preferred node is always bad. */
>  	if (src_nid == p->numa_preferred_nid) {
> -		if (env->src_rq->nr_running > env->src_rq->nr_preferred_running)
> +		struct rq *src_rq = cpu_rq(src_cpu);
> +		if (src_rq->nr_running > src_rq->nr_preferred_running)
>  			return 1;
>  		else
>  			return 0;
> @@ -9330,7 +9607,7 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>  		return -1;
>  
>  	/* Leaving a core idle is often worse than degrading locality. */
> -	if (env->idle == CPU_IDLE)
> +	if (idle)
>  		return 0;
>  
>  	dist = node_distance(src_nid, dst_nid);
> @@ -9345,7 +9622,24 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>  	return src_weight - dst_weight;
>  }
>  
> +static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +{
> +	if (!static_branch_likely(&sched_numa_balancing))
> +		return 0;
> +
> +	if (!(env->sd->flags & SD_NUMA))
> +		return 0;
> +
> +	return __migrate_degrades_locality(p, env->src_cpu, env->dst_cpu,
> +					   env->idle == CPU_IDLE);
> +}
> +
>  #else
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
> +{
> +	return 0;
> +}
> +
>  static inline long migrate_degrades_locality(struct task_struct *p,
>  					     struct lb_env *env)
>  {
> @@ -13104,8 +13398,8 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
>   */
>  static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>  {
> -	struct cfs_rq *cfs_rq;
>  	struct sched_entity *se = &curr->se;
> +	struct cfs_rq *cfs_rq;
>  
>  	for_each_sched_entity(se) {
>  		cfs_rq = cfs_rq_of(se);
> @@ -13115,6 +13409,8 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>  	if (static_branch_unlikely(&sched_numa_balancing))
>  		task_tick_numa(rq, curr);
>  
> +	task_tick_cache(rq, curr);
> +
>  	update_misfit_status(curr, rq);
>  	check_update_overutilized_status(task_rq(curr));
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea70..d16ccd66ca07 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1171,6 +1171,12 @@ struct rq {
>  	u64			clock_pelt_idle_copy;
>  	u64			clock_idle_copy;
>  #endif
> +#ifdef CONFIG_SCHED_CACHE
> +	raw_spinlock_t		cpu_epoch_lock;
> +	u64			cpu_runtime;
> +	unsigned long		cpu_epoch;
> +	unsigned long		cpu_epoch_next;
> +#endif
>  
>  	atomic_t		nr_iowait;
>  
> @@ -3861,6 +3867,8 @@ static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
>  static inline void init_sched_mm_cid(struct task_struct *t) { }
>  #endif /* !CONFIG_SCHED_MM_CID */
>  
> +extern void init_sched_mm(struct task_struct *p);
> +
>  extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
>  extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);
>  #ifdef CONFIG_SMP
> 

