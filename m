Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C012169397
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738319850; cv=fail; b=U+TkJCTTJ8fv+Vmtr57ZE/jKj7M8tqye6NwAlLKzuFEOfBe5paCnyUbUUv14Ho1fZulOPU/a02JN0pPRyPwR/Koh3TDqoBiJshNs/H4Mlzk9SaWxGHyiUoPVj+eqKHmgGoH6GfxWZxFEMXI0ihuZUkQPiXi5YY1vzj7WLbXXTOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738319850; c=relaxed/simple;
	bh=I44iyDiQq2O620nVGHBLq7BKnNdA8JbO6VJt/G8Lth0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RHPVYDTaQmK1yZkJ5QlPUBfMS2kVZBK9JK+5tA+d0bbvDET/yZ4ZQ3DmgsubyrM+dW3I+rJ51al78XSOjL7TwNMKaXuyeEL+42fJE6n8wvHJaDKPdprqA/b2/QyJ+Pwlvjkh9HHjqXm3u22VQZ7umUemReRJNdX1cxxZ8cIUIaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UvaCjcGx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yjhxprJV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UvaCjcGx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yjhxprJV"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9Vxfw021625;
	Fri, 31 Jan 2025 10:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=cDR03caO1x5H3LdViLeHHSSwOlNjC9AQiSmuUVCXfT8=; b=
	UvaCjcGxzUyenW1Yl6efT9Jtku/0ABEUd0l25DESqS8BliLlo9dVtiSXE6bHcwgq
	Da/lvv090xjmsZr7k+WJj4tAItIJ2wwF3MFXfUttWWzCML1RNjHMcOwcPtiMg5Dc
	TxONu5NWumxiFqZOmtP7Ycd7DEO6+ZS8j9lywZBSkm1LVjfuaQ1xzLWbqEk5KSWW
	OMcFZb6yFQo6fnl3ZaykTDXEkiqWWaUftNSuLbeL2OaEPjycQ+X8zbVapVSzu6DG
	EzFQBdpSrHcytEL7VfgPnmlo2CO5TDWJqR+tyAKucPe+1V8zKy4qLqWO0uGkZKMJ
	CqxXCbvCEkt280T+wSVApQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44guybr42m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 10:37:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50V95WHZ009013;
	Fri, 31 Jan 2025 10:37:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gg1g7rjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 10:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaIaGW9lcqvkwyXsqcWIlD1CvohO+vzTFZog58DcHXwXBThhWD+Nz3nxsI0wc6fUv4k+8dWv374Pd574/s9E26S8MQAIzNU0hxnjg/dIEHSrIDte78aOwAs1rhWkDNXDN5eOq8zYbOSQxwQxrpMzoDb82wLcM3Qu0wQNBhxG5QCwfXSWs/Rzz6tzSa/Rny1ys47WV/dp7YcGWk1acIW8pS06pUTG2uAVVeg3PH2m/G+cw1g3iyL6alNGGuswHjauPtKPirak+5k+K8lVugRULjavuQ+dfpc0i1uYFGNqJOFX2FRmbkTpj7p1v+hNwF8Q1+Q8Roz7yzVjY8wVMewRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDR03caO1x5H3LdViLeHHSSwOlNjC9AQiSmuUVCXfT8=;
 b=oNt1sM4WwfualYzdz0iuqBS+yyZDOM+7+btcXuTMHkppb7nd/si2h0Lj3LE2IH5lJlyxYSwWG0odPw5mtbVNGEEtbOOTcPdhi7ilK66mKSC55/yecb4e9kU1tGYH0OYjwGAlax+fKiRj9vwZ+79ninJFbZmZ8nX3nJ2u5jCl4gMbY5btGO9PdcXZ/WwNq4fmMlcmdUyJBA4oT/G9X6vTFodaQ8Y01NRwGJI+HHXvg8zB4iTSVr+4f+43xHpoHpo9hqZ8cmuxWqOK2nVto9GOhNpRuJorD/I4k2vLxKweBBwN7peRYv2+DAVToj97O/OQt0Iuy8EL+cNDGeMGAUbYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDR03caO1x5H3LdViLeHHSSwOlNjC9AQiSmuUVCXfT8=;
 b=yjhxprJVMOFdWWxVjZiHeGkO0lgHWWONmxwXaSDQURiD8Nmx2L4JJ54Sr1IExD7kMaRm1VeoNPmjEev4RkYxMIRt2g+cbqwc2WU5n6gzHvSc66a7K+xRXpYqXpJzZ394YZgX7nnnk4+0G92N7jTEZE6ViA1o/9ZvuZMbr/ZJPkA=
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by DS7PR10MB5024.namprd10.prod.outlook.com (2603:10b6:5:3a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 10:37:20 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 10:37:20 +0000
Message-ID: <8715d5cf-1f63-4c57-b855-8abae8debaa2@oracle.com>
Date: Fri, 31 Jan 2025 21:37:09 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] workqueue: introduce
 queue_delayed_work_on_offline_safe.
From: imran.f.khan@oracle.com
To: Tejun Heo <tj@kernel.org>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org
References: <20250113043540.2396426-1-imran.f.khan@oracle.com>
 <Z4VZsFBn13nBnGjb@slm.duckdns.org>
 <eab73ac2-d9eb-4ac7-9e0f-9a02b81a31bb@oracle.com>
Content-Language: en-US
In-Reply-To: <eab73ac2-d9eb-4ac7-9e0f-9a02b81a31bb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR12CA0023.namprd12.prod.outlook.com
 (2603:10b6:408:60::36) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:EE_|DS7PR10MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffabff3-e81c-4853-b4e7-08dd41e33d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmFnTHRhZEZ1WXE4Zm9wZjVwRi80a2RWeDNJS0RPWmx2L1ZoMnhmcnRKVGpt?=
 =?utf-8?B?RHZYWmE3WThYYjlWUzlGU3lVMjBZdWN0OEhKM1J4Z01tTEJVYWxldDBabDRI?=
 =?utf-8?B?dTc0YjU0NXdUSS96Um5ZdjRpVG9MTndCRTZ5QmJNUS9PRUlFYU5Jc0I1UGxO?=
 =?utf-8?B?WFpmdVc5aU9RcytiS1BVUkFHR2VMOEdhdGhzaStJVHFmUTNRVTJsMmdWaFRW?=
 =?utf-8?B?UHkyLzB0OUY1THBOQTlmRzZydFpSb3p1SUNlQmhiczE1cjB0c3hJa1RwcGlB?=
 =?utf-8?B?blZaNUtZOGRGbGxENGQ0Wm1nSFF3bzBDcjF6TFBSSXZFZEZvMmlqdDZzc3pD?=
 =?utf-8?B?ZFA0SFZGZVM5MGlhUG9pNGFnQm5rRW0zWk9ZVlJUaXh0bTUyT3V1cnFEM2lY?=
 =?utf-8?B?bnljM2xhU01oNC9XOSs1Y1d1MUVES2U4eXNaYXFFMFNHQXI5b0x4Kzc0OXdn?=
 =?utf-8?B?bE1UanlHL1BDN3QzNE9EK0lVdG1lcjBXc2hpU2EwRjJ3U1ZzVGtYZ1JUOERK?=
 =?utf-8?B?TzE3bERQME9kN3VHVjdEUHVWZ0N2TGE0WlF2Ylpidi82ZHlnUmtoZkdxS0Za?=
 =?utf-8?B?RVpHR1BJSTBSNkdMTjRkRnBqcEJQeStOQlhJNmZlZGtCbXRTMmp4QWtFMG1Q?=
 =?utf-8?B?ZkgzTTJTaHNHTTZLbzZMTEM5ZFREcjEwQzVCdzBhOWxXU0RRWTh0enhQSnJJ?=
 =?utf-8?B?cTBnVzY4VkpmL0dNTUdBV3R2MWZmYWhLcDNnSFpYUG1rMkNydzV5WWpuSXow?=
 =?utf-8?B?SkVRemRrdytHZTZ6cHMrb2ZBTSt2Rk91TWoydndDWWc3Y092aGlqV1EyRGZD?=
 =?utf-8?B?UXVKVjFCWXR5SFp1aWZNVXU3eHRKSVNmQzBOM0RZcWdGSHVyUFNKNVdmOHNl?=
 =?utf-8?B?V21VaDdjSUZjS1BKb2s0SFM2NlVOUjF5OWtRZ09USXp6aWg3T0NCTzJrYUE1?=
 =?utf-8?B?NzcvZE9malVaU2NCazF6U1VIQlR0OXdoTTVScDR1VGdnRnJLSzduWnFDa2wv?=
 =?utf-8?B?S2x3WEticFh1UjdNdVBiSGFteXV3VGEyZEZ3ZkhRWHhDbkVldTJjR2krTitV?=
 =?utf-8?B?aVhSd2pYOStNTEp1bng0WGx0QUNLOXhya2p0VFNRSlBrVjQ4ajRCeU5kc2NO?=
 =?utf-8?B?TE1wdEpNZm1HRitEeUpzQlRqVS9Na2xVOG5pbGg5WjhiTmErTExvRVd4WklY?=
 =?utf-8?B?YkU1TmhQcitzM0kyR3RmQmwybVBLYjdDRjB1M1ZORXA2anJWVDJ1bGZZZlVi?=
 =?utf-8?B?OGYwdGJVdkVyTXNnSjh1UTZNNnYxZkU2VDlaTkEzU0JXWWpsUzVCYXYydmhZ?=
 =?utf-8?B?cHNQUHhhQUxnL3BnS0hQalo3UmQyMHJjV3FlVkRsaDZEcThvQ2hkZGlCWGhj?=
 =?utf-8?B?elRPbW1wWkRKSUQ3d0xqNDRBR01KTEJRbmRPa1R4ajFOMUw0RVR3bVg2dTZC?=
 =?utf-8?B?em9XRUNJb2lFZnYyK0FIWlNpTE1KRVBtOHFHN3pkOEF4K2VvOThvU256Vmhw?=
 =?utf-8?B?OHVwWmhvMU1jemc3bjJMVWhkYm84ckR3TDVMWFJ3TlVXY0VEU1B1TzVub2hi?=
 =?utf-8?B?Zmppc0xKa2hFeUtONGZiZ0FvZ3Qya1luM3F4VEdZUHg0T29icWxhT3BZYnJB?=
 =?utf-8?B?WHR4WmEzTU02UGd6end5YjRqK2Fualh4ZVdkR29sQTFXT1Y3aTM3WTlwbURr?=
 =?utf-8?B?a0FhVy8vSWdPbWFXVWVkbFRSRnBpcDIwM1lyejZIc1dEMzkzblVJSFZNcDdt?=
 =?utf-8?B?NytuRGVkL3phaWZmRjNYU2lVTTY0bWFUeW00VFl5MkU0NS91NENaOXd3dDlG?=
 =?utf-8?B?NEdRbkVKa0pKQ0V6Wjl5N3lDWVRFdHRuekkvRS9xZGFYYTFpRThQdlVWNE8v?=
 =?utf-8?Q?EIMa7H24Bhr5z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4468.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTM1ZHRWdENCTlpwT3VtL3BpUVplVEg3M0hmUmxrMlVTWGw1SFVIMUFaZGNx?=
 =?utf-8?B?WXVwSFBqeWYyazRXQXRVWGltZ3JiWEFBTHFqcUZtdW1pb2RXOWQzbDc0WE1X?=
 =?utf-8?B?RUVDNnNnUlJEeXFZZFM2RFdzZERlb2RvRTRrb2w4YklGbjhFTHQwN3FTcDVZ?=
 =?utf-8?B?THZkTW5NUThIaUkxSWMzd1hPZjBwL05mVE04TTY0cm1KY2JrSjBEcXlrUUQ4?=
 =?utf-8?B?ZTUzbmoybHh1blpZRy9KenlqYWVQMG1vYjB3eGFrK2pXZmU4eGdwaUhqNE51?=
 =?utf-8?B?cHNDa3lJMnk5T0UwK3ZVbGE5QmREOVkvRG1GdkFwSDBjc2xFMi9DSFVDWm0z?=
 =?utf-8?B?WGsyYVhhOCtqZHpXc25qcENwQ2REaDhiT0ZaYmFLWEZHbEV1ZEdWU2Z2cnpN?=
 =?utf-8?B?VGhQWlVPL2ZYTm90NHNEdEgwYmFENVVIM0N6TFhCMVFON3VGbG5maC9JM1lO?=
 =?utf-8?B?TE5raU1ibXVkcDk2dGs5dFlLeW10emJ4dytIbUFXb3NnVFRYZDJUS3VCVllY?=
 =?utf-8?B?TE9kR3p4RFdMU205R1hqZzNMbmpib3Z4Q1B1ZjIxKzZST3VldEFJa1ZFMXdi?=
 =?utf-8?B?WWl1ZXBMb2psbmQvMkRDRk5HQzZXRHp3aFY4Qy83dVhRUC9ndnNSZ3M5UFIr?=
 =?utf-8?B?WHNDNnIxZkMyZ0xVRkVnUVU3NUhldGdMaHd6bW1vZTkwYTk4VEc5ZjY1cXpF?=
 =?utf-8?B?TDIzbTU0VEZ3alc4d3Z1MGpJTEFhQUVsVGpYZy9LeWdWcEtVL2dyNmJaVzhF?=
 =?utf-8?B?b2t6SGtXM1A5QWJtcEpmUms2QjFieTltVngxT2djVXBGWkhxeENWZkRkbmts?=
 =?utf-8?B?UkZ1Z3ZjeWl6ODUwQUlvMTY2dUNJSWllWDJOUGFKaFJWcXgxTDNvemxXbmZ3?=
 =?utf-8?B?RzUzbjVqaXkycUZlbDF1NDJ0K25HQ20zTE5vMWMwYXBLWmMzMUh3WnlDZHps?=
 =?utf-8?B?bnFUZEYrTnJDd0M3d2RhOU8vbXFuRlUrc2Q4dEJEQUpueFBrTVBTSFFRKzIw?=
 =?utf-8?B?VG9DTUlGR2ZIUG1KT3hNVFJ6bDlwdENGQlJEK0d3Y3VvQXY5d0szNTNjK3FH?=
 =?utf-8?B?bWhLRTE3aTNPU3RKQUwzNXJPcXJ0ZkpqWDJPOUp6aUticzRHS1Z3ZzRJRktJ?=
 =?utf-8?B?OVRhaVlXcVZNTlpLSTd5RWtoYm05R3JvYUdPY3hyblFTc3RSOTI3VjBzdWta?=
 =?utf-8?B?WnFBdm5KcUpmQ3lITkVnSWFPUElweHN2NkQvcXZLS3NFcWdiRGxiQVdSRnRu?=
 =?utf-8?B?dEI5cmN6RndSQm5RYlV2dkJhY0d5M3ByZkIwMGJ0SnpWazcwR1BXQ1JkMU9Z?=
 =?utf-8?B?eXJTM3FORWdSWXFnejJkZ21YTmd0TmNxZ0Nua0htY0h3cERrN1EvTDBsUlhl?=
 =?utf-8?B?RGg5bmUvbkxoRXBsR2xsN0REMEJVekdUSXV1UFpZRmlVQmVucU9WeHM0MWJL?=
 =?utf-8?B?S0ZxR2FLWmhjUXcrbWdpdElyZ2hTeHZoWEZ1UWEvbDcyb2F2UEpJbjVzT3hQ?=
 =?utf-8?B?SFdSTkw3QkZncmlrK3gwQVZ2YzAvbVF3T1lPUFF4VDJIbEpHdjFLcjZiU2dV?=
 =?utf-8?B?NzR1aDVsbE1jK2ozbzRad3JHREhTQlFoZFgvZ1ZBZU5MUlM0eTdoT1ZucU5s?=
 =?utf-8?B?WHBMczhMWWFZZEhsT1pOemgyK3l5V1NRcHA4YWpKbmtuMFpnYVlja3lsa0k4?=
 =?utf-8?B?Ukp5dUpYNGlQTGgzOHpFUEpabC9xRGJqR2F2T240cnRWazNlODFWZmxaN3pP?=
 =?utf-8?B?TjJyUE5UMWViNXlNU0s3alAvMWZXSnU0TjI2Ri9mZ2U1RUhUL3Jlem01TzdZ?=
 =?utf-8?B?YXcvU3JnLzFzWDRxNVFGSWY5SlpqY0QrS0syMVpudmlPdU41K25vUGlqVkJZ?=
 =?utf-8?B?T3hCR1pORno0Y1NsbkFZRHYrbFhWaGZIeEpOakw5bmpYeG9FMCtsd1lBSHBP?=
 =?utf-8?B?WU52QlpUWEppQzFYZjVVc2taZmR4TWtIWGNDbGZ6eGd6MzNYZGxDK1VqVWNi?=
 =?utf-8?B?N25MMWoyTlZSTnpJdkszR2NpN1YxcHlzVkIrMGE4ZnFpd0MvanE0aFBMSzI1?=
 =?utf-8?B?ZFlXQXo1WkFkY2N3bjNWdDh3eG1qZUJQYUNnUkhZSnFwL3ZSM2dFRzRtdVQr?=
 =?utf-8?B?Vkk4VU9xQ2FMd0s0M0w0OGpoSWpKaVNrZWZLcmxCNEYyVVRDclZGS3Q1VHJZ?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CFb+3vNj0GqV560FGsXMyvynIXIjUjyGII7NVtIdw0UL78fya2SiLHrLHfT7qW4cLAIWl1GAUJ9VtdXxVNXFODSWd4f2mE0BUmtFEQrIkDLyUxUyyWkKlCoO65M5OqSUIk8Y/oklAdgnN9U2IDTanIf5h1SQkCanDuYfS76FgNRQLekuziq8y03nYW9Y6de6rM3CL7VtGSL3SGuA8kvqGmsVMdOko6k/1b0xo5YJwrXMa6Imyl41cv9SfihCtaDvIb5rgqvwybLaZnHFTHORmnro0Qf6ZaK4LXRQIcC/eBbUa97QyiBahw+DrUqdiVSUS5AeVKpq0C8TBURP/ksqwsQ1YYH5Xv6Bkwu72CPrkaRG/C+1Sa+72PjIQQTz8uRDORxJi+0k8fSKXYqE4emK8f/+vRa/F5y7noX8evtDmnOiXgWgkc3x3vZeQyn74oHbs9qNxkJr67lNAAlzPtib75BoM0TS0eI9uXVlqmkgfv9zaSC2imWFe4NXXi2z6ykCcA91rL2HcNxMwyy2TX5ZBtC/Gwxw7Ac3Y80sjN6lAjYxvwixhFJlY1bLUYkrz7Ad0NM5aw5/bHgqIy20bakELvgmQQ5JRvz3q9ISaQtyZ6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffabff3-e81c-4853-b4e7-08dd41e33d42
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:37:19.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYyzDs7ZHC6IYJwA4+esj4ag3VKatBuX/h7oBZfK5yL9BllvqxauLz/pemmk8oLcW82klEcm0X41QtfdhidqfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5024
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310080
X-Proofpoint-ORIG-GUID: 95es8RcRb8eeV7gkqyVBhxtnQwhCHYat
X-Proofpoint-GUID: 95es8RcRb8eeV7gkqyVBhxtnQwhCHYat

Hello Tejun,

On 14/1/2025 2:01 pm, imran.f.khan@oracle.com wrote:
> Hello Tejun,
> Thanks for taking a look into it.
> On 14/1/2025 5:21 am, Tejun Heo wrote:
>> On Mon, Jan 13, 2025 at 03:35:40PM +1100, Imran Khan wrote:
>> ...
>>> I have kept the patch as RFC because from mailing list,
>>> I could not find any users, of queue_delayed_work_on,
>>> that is ending up queuing dwork on an offlined CPU.
>>> We have some in-house code that is running into this problem,
>>> and currently we are fixing it on caller side of queue_delayed_work_on.
>>> Other users who run into this issue, can also use the approach of
>>> fixing it on caller side or we can use the interface introduced
>>> here for such use cases.
>>
>> I'm not sure how necessary this is. If the timer is okay to run on other
>> CPUs, might as well just use queue_delayed_work().
>>

Could you kindly let me know, if it would be acceptable, to have 
queue_delayed_work_on_offline_safe, as a wrapper around 
queue_delayed_work_on, such that it can check and ensure CPU's
availability. If it can't, then it can simply return false and let
caller decide which cpu to use next. Something like below:


diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e560..57f39807f3bf1 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -589,6 +589,9 @@ extern bool queue_work_node(int node, struct workqueue_struct *wq,
                            struct work_struct *work);
 extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
                        struct delayed_work *work, unsigned long delay);
+extern bool queue_delayed_work_on_offline_safe(int cpu,
+                       struct workqueue_struct *wq, struct delayed_work *work,
+                       unsigned long delay);
 extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
                        struct delayed_work *dwork, unsigned long delay);
 extern bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork);

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 9362484a653c4..7d3b8050422e4 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2565,6 +2565,37 @@ bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
 }
 EXPORT_SYMBOL(queue_delayed_work_on);

+/**
+ * queue_delayed_work_on_offline_safe - queue work on specific online CPU after
+ *                                     delay,
+ *
+ * @cpu: CPU number to execute work on
+ * @wq: workqueue to use
+ * @dwork: work to queue
+ * @delay: number of jiffies to wait before queueing
+ *
+ * a wrapper, around queue_delayed_work_on, that checks and ensures that
+ * specified @cpu is online. If @cpu is found to be offline or if its online
+ * status can't be reliably determined, return false and leave the decision,
+ * of selecting new cpu for delayed_work, to caller.
+ *
+ */
+bool queue_delayed_work_on_offline_safe(int cpu, struct workqueue_struct *wq,
+                          struct delayed_work *dwork, unsigned long delay)
+{
+       bool ret = false;
+       int locked = 0;
+
+       if ((locked = cpus_read_trylock()) && cpu_online(cpu))
+               ret = queue_delayed_work_on(cpu, wq, dwork, delay);
+       else if (locked)
+               cpus_read_unlock();
+
+       return ret;
+}
+EXPORT_SYMBOL(queue_delayed_work_on_offline_safe);
+
+

If this looks acceptable to you, I can send a v2 of earlier patch.

Thanks,
Imran

> 
> Yes, right now I can't locate something in upstream kernel that gets
> broken due to the issue mentioned here.
> All (except 3, mentioned further down) users of queued_delayed_work_on
> are using smp_processor_id(), to specify the CPU. So specified CPU can't
> be an already offlined CPU.
> 
> I see below 3 files (in v6.12.6), using queue_delayed_work_on with some sort of cached
> cpu information:
> 
>   drivers/net/ethernet/pensando/ionic/ionic_dev.c -> line 177
>   drivers/scsi/esas2r/esas2r_main.c -> line 1858
>   drivers/scsi/lpfc/lpfc_sli.c
>        -> line 14987
>        -> line 15381 
> But looks like in these cases specified CPU remains online or
> they simply have not encountered the issue mentioned here.
> 
> 
> For this patch, yes the timer is okay to run on other CPUs but that is
> only as a last resort, most of the times it could still run on specified
> CPU (assuming its online)
> 
> Thanks,
> Imran
> 
> 
> 
>> Thanks.
>>
> 

