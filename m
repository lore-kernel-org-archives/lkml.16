Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14330213E78
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461914; cv=fail; b=VK0sBox1aUMephXPI3GkeMGIYESQaLBHKIo2ISSkwKd2yasEZTTGI+fgTuS3ofe8HyG9W6/zCiLco9S2hvZRErC2UgCysa+X/JMc/USjtF+o/zIgmmQlgkeLZZ1kP2IPyKN0mEJCKaqueFks6n4vgPptJtuYLzJBCln5c+erHrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461914; c=relaxed/simple;
	bh=Dm+2cqnniV1f9bB76i0SMAGgPRkGRXg0NAK1gtQKJdQ=;
	h=Message-ID:Date:To:Cc:Subject:From:Content-Type:MIME-Version; b=pM0CK//fyiNjvicZyG8uxrHg+0H9dW2Qea8m6AKSDrjtDmZnH4LPaOOpufcgHL9Lruy6F2u54jnwKly76mE/fjTzjU3I6HY0CYG3IyhL9Db4QY2drJ0VzsuNnrJNhQv5o6xqvY4Se4slFZblAmjuAiu4ihqLQWPc1vi7QnwIf0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KGn++KL5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sUIyiARI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KGn++KL5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sUIyiARI"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SIND2Q016490;
	Wed, 28 May 2025 19:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=2gacJ3pK/wjNQQxz
	iL+D1i0jgVkxC9h+dG+3lLpw+A8=; b=KGn++KL5fC7HacPB6xNImjcK6iHWJlTO
	voRXNWTy19ZhTp2kuI4qQzv9Npv8+9kPDKGtY5YI1XetC0dBGYSnbtMPvE8/xkFQ
	OvDeV93EhYe+GPo/C9rpqFVLR0B2Juu5Pi8UEWGlf0LaCjlT7w+Gwj2fo893rhd3
	upf1VhIo2rY4FQQuykF4fQH7j06W5g+JfS2wXB1J0e8f5q2cTuPsjZL4xqEJu1wE
	YfwDNwAL73mBFxdgXq+nFbRBMabWBgc9oXm6BCzc7UeM6k3Bzg+5UO0nwq/5byUq
	r/j/daZrHiFaRfKHfC9zlzimH8/dkSrgWFeYK8dsjrPuWS284MjaYw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33mxukm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 19:51:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54SIZ7nu024602;
	Wed, 28 May 2025 19:51:44 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jb481u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 19:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDpoO7dn+/wUSwgAqh7wwuqmXIYsbzTWffOgQaDpi4R0p9fVzwVZEfWr+WuEyMsuS9MpH+VSGqNGUy6+vrSRXPU4RH27/cwJC14cp6V0p/LBTjXgRrgW38umN/2Uz1Ag3eaU0gg+LX6QZeCvZhuFd1ooDjDSL6CqXfV/sFQDSq+Wxcp0/Rxl12HDTNZVzWe0gjaFCSdnDct8pEOdsM4InL7ypdpoBaytN6Ru+Vc/vUvDiWduTpdrDOet3hSgQqOwUS8QsjYVcaC2nknlxt8H2H6VHNZOcWHpz/c/1W63u/PSY0dRUVlMf2kUYdKZrW3YuFo6EOsAGW/lsUR8XDoFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gacJ3pK/wjNQQxziL+D1i0jgVkxC9h+dG+3lLpw+A8=;
 b=PNlySHqHJVu5irY3ThiICfYm3IaNtS4M5ZidTgyVgf90Ekdlhq5YHkDw4jrSvXShgWzLcBeCJHho6NWSFLE6SWfSk/23rWd490Xycf7pG2kaW8y8XtTrIz301XrN45Mwy0AwyF7Zi87dBVDoCtq2mqPthYZaRDbNslOPC8oBXFLSBs4aELCFfGd0VT2r69EfDALCTDc7LPrMJgojXclU33LxM9jT0eqywxZ8MXEvCIGwDtj1eyB4lhmibGhcRNvT1jgS7tAtjtFCQUkNfV+au5v1gF0DQVEE2t+nJYDTUye15++yXf1HTAMqLrb++WI3Nb1tHgY4wV/l3jJbaExqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gacJ3pK/wjNQQxziL+D1i0jgVkxC9h+dG+3lLpw+A8=;
 b=sUIyiARIfYVJqmBp/mwn9pdDStv8TPmKRw4H+OsuM/atwvPJtKZ4VSBxCqca8ecVJ4HsAWL8xSWX/hgKjRo1xs8jLpZwakmA4x1LX8CmZc9v9ttDbldHpbCLf8JqfDP0qJeuB3+ecsKKDRh4prKHbFSHKKEEL/cjvA0WNkmX/SY=
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d) by CH0PR10MB7440.namprd10.prod.outlook.com
 (2603:10b6:610:18c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Wed, 28 May
 2025 19:51:42 +0000
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::1c40:7ef9:414e:f765]) by DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::1c40:7ef9:414e:f765%5]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 19:51:42 +0000
Message-ID: <ebb6fd19-0c06-4a71-b900-b99b442a4b8f@oracle.com>
Date: Wed, 28 May 2025 14:51:41 -0500
User-Agent: Mozilla Thunderbird
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
        "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>
Subject: [GIT PULL] jfs updates for v6.16
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0011.namprd18.prod.outlook.com
 (2603:10b6:610:4f::21) To DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF35CFB4DBF:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3608a6-b08b-4dcb-fcb2-08dd9e211181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEkzRUZ5cTBYODMzMUoxSzdJSHhtV3FGT2Y1TmZnSEtWZE9SeUJ0cVVnQ0JW?=
 =?utf-8?B?Ump0QzJmc1pkZE45bUQzSytNbTdrR2JyUHBlc05abW9XQUduVEJzQ1MxczNw?=
 =?utf-8?B?UVR5dDVFL3JDMVZxdzhWQkk4ZTVvdXhLb2NES2ZpR25Ta0tBeEFsY1h0SEJR?=
 =?utf-8?B?TFhISHAxVzhjU24rdnlacWU2TzVTQmwvc1NqczlPRFF0V0lzM2tSUXpvd1Br?=
 =?utf-8?B?OVUrRE1zbllVelkvRDhvNXZEVk9oQjh2ZkxGd2JGWVViSTNsREdyVzhuWFE2?=
 =?utf-8?B?NVFOV1dDR1RXb1lVUzJCU0VpQTNlY2Y3WVMva3BoLzJvTzBZcmt6dHNJWkx4?=
 =?utf-8?B?MFgvOEFzaHd5ZUdNWC84YSswaE5QZFVWem9idjF0VzA4WSs3V3JpMkpkR2dQ?=
 =?utf-8?B?YUp6UURIcERsNld1bm5ONW5iUFZiWUN6OEhRSEdOb3R6NnFIYVEwa1A2dzBy?=
 =?utf-8?B?dVJKMFlFU0tEdngwdDFzc2ljSWkwbUtzQllwSnNsa0Y5SUhLM0tpWm5lQUY3?=
 =?utf-8?B?cWhrVzByU1NsRFZvWk0zSW9zRDRoT1Mwc1loMkpnQ2xmNXJvbFBtcDhmU1Nv?=
 =?utf-8?B?djFTU0wyMitJSHhKbmdDZkl6RGRPdzI1N2xKVmk1akdhZm9JY0hnM3VMQ01i?=
 =?utf-8?B?UC85VFprQjRhSVNvcHo3MzZUNzZlOXNleHFMQTcwMnlIWk1DT1hEaVlGVW1i?=
 =?utf-8?B?Q2tYV1pTVW5ZU2dhY0ZpU0tkeWl6WE9zc25JTzhHQ2NseHZoU2dodkF3eEJ3?=
 =?utf-8?B?ZVRjclRsOEdseDFWZytvbFR4VmYxbFlKVE9VcitrZUQ1MVlrcUFRRjN5eVRZ?=
 =?utf-8?B?Tmt3Q21Vd2tISS9QV0FrTy90aGtIbUR6Q2krNUI2R1liaXRFM1MxeDBncVhB?=
 =?utf-8?B?cEVsMHBjenlYRjQ4OUsxNGJvZ3h6M0p1S1FqRzBJU0FFamQ3VWFJU2t6VmUw?=
 =?utf-8?B?L0l2NEtQUEpaTTRkYU1XOGdJVG5BVWlFTFZUVmpSanJKaHhNNWwrUkVXejJP?=
 =?utf-8?B?OVdxTU03ekVJVFZXeW1BTjc0TXAvcjZ1Z3RWaDgycDZ5Qzl3Qi9jQnE0NWJB?=
 =?utf-8?B?bDM3OHJzb04rdWh5NzVVellsc3RZb3BMYUJ0TEVzM3FqNTVEb3UvSUxpQlZB?=
 =?utf-8?B?TVYxOEtIV3dJRnlyWUJiYXBvU1FqTkVPeEp4SFkvcFZibTkvYldneTBVUmRv?=
 =?utf-8?B?bUpmditsdHhGVC9DVVpVZnJMeHBXT0dJS2VTU3M1ajlTQ1d5NFR6Zi9GYUcv?=
 =?utf-8?B?aE1HUXBJVFFIOUw0cnNZRXVhYzRNSFlEQ3RsTU1aQWlkWDdMSnpLMXZIRjNT?=
 =?utf-8?B?U0o4SVBUL2RLQXNkaERQMU1jZzNiOFU2bUdGMGgzVHlybkVSMDdlbHdha29V?=
 =?utf-8?B?MEpxcXhmWlYzeXFxN3VLbzMreTBoNEI5R3hiRXdvZFdEQ1l4eFBueHpIc2FK?=
 =?utf-8?B?MVVTcVBiWFBsWE1OYWx5ZmcvWmNMVDVaVUUwVUtYNWFHbDBuUkYvVkR4bVRF?=
 =?utf-8?B?UDVLNS9rRDJHaE13dG5KOVZXbXFVRld6TndyR2dWRENYSDlraWZHeGtaZERN?=
 =?utf-8?B?azFuV3FJd1dFak5zN3dOcmJXb2pWUm04cThHOFZhMyt5TGdXa3pCTDR4WVQz?=
 =?utf-8?B?dUdwQVZLeHJ4V3Qyc21QZHVMNllpTDg4YTlXNHlTT1pDOE5GRjdBRForNFZu?=
 =?utf-8?B?TkI5WHA1czZCYlhyMUxYbFFweWN3MkhHdUJaQnVBSGJaK2oyOXdKZ1dwMnhE?=
 =?utf-8?B?Z2J5a0JndDFmcm5xY3hkeGZaTklrYUt0K2crWldOdURSRUQzdXNGRkEyU0VS?=
 =?utf-8?B?VThGTmpBY01ZY0Z4QWZHdG5RVGticW53T2tIMzZvN3hGb3lwN3dkVys3c2JX?=
 =?utf-8?B?cUhXMWJwMHpadzhKRXNMbHZwTUdMUy8xQVFldXlLWlRRSllMMkhRb0dxUjNI?=
 =?utf-8?Q?04BkTeGHUF8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF35CFB4DBF.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky9ZY2k3Mld6YURDWUI4cjJIM1BVQ1ZDa0puTnkvWUxkcmM3eHBtbmRJdXIy?=
 =?utf-8?B?WW9hQmJNOU9ScjlzMU1BWS9GSXBNOWZIM0RabzNZUHE1bE0rMEdvQ0QyT08r?=
 =?utf-8?B?VU96S3plamcxb3dDZUhiM1VWTWRBbVB4RHFUQjc2VUZHa0xhbGRTRkV1c3J1?=
 =?utf-8?B?d2NVV0RJa1NNNFdhWEtZdlBRMUU1YmwwU0FtQVZ2cWZGSTIrQ2YzOEVwWVM4?=
 =?utf-8?B?ZXdzY0w5L0J4S01pWTh4K3RmUTZvR2U3U3ViK2ZMOS92NEM2OUxCTEEvRFBJ?=
 =?utf-8?B?Lys3T0RIVEJmKzJvOSsyN1lQQzZFUm9iS0FMMlVHMW5sMUs2NWFuY045R2xx?=
 =?utf-8?B?ZElyK2hqNlBWbzRsazVtVG55TlVzOUg2dmZIV295cWdZUDFlblhyYWFET2Jh?=
 =?utf-8?B?c0o1UnVqWWd4Z09JeS9iZDRJRHVSaGVrZk1TNHd3SEczR29TRUVyb2NyMWVQ?=
 =?utf-8?B?ZVBrTzJWLzRrNWlsM0ZNWUd0WkNSUFBUTnVkK0g0VmVwOTVFRldYanY1SXd0?=
 =?utf-8?B?Yyt0ZThlQkpVajVIYmI1b2c0Tlo1MW4yRmt2elFJN1F4K0JtR3ZrSzlHeTcr?=
 =?utf-8?B?Y1NZenpSbTk3VkdZb1doU0tmNXowcVVTVHZLZW1NL1NXVHhMMDhHWHpEbEVF?=
 =?utf-8?B?UXpQVWhkRDJSL296STZlVGVtbjl1OURLVFd0cVpsQTZnbS9pRWFETStSNkRT?=
 =?utf-8?B?SXdmRVNyOVVvL1czaWZJNU9kSVFRWUxqZ0VzVVpqbzg1WldZYzJKZmUvRTF1?=
 =?utf-8?B?eGtWMDZjS3NtKzNNWTQ5MkFSZ05ud25reTdtWHg5Zy9qam9XejhFMlo5U01R?=
 =?utf-8?B?NzZlY1B1ZkdZY1BPek16SXFkVnFoRjM1dmY4V2d3TU9oa05WWkdQek4yTWNp?=
 =?utf-8?B?RDQvanQ3ZGp5QTdxL0cvMllEbUczZFFyL1NZd0xjYUlBbHRYQnZ2dmpzOU5W?=
 =?utf-8?B?c3lsNkF0YUd2VUZSaTB0c3V1bWYrQmNCZG12a0toeUlManNKVWtIYzJJVGxF?=
 =?utf-8?B?ck1mSUZwT0hRbnlLOVd1SzN3MWxtUTg0OHBXQWpQSTA4TEU4c2N2L1FJV3p6?=
 =?utf-8?B?QVpObXZ1VHhENU1FTE9xYVpHUXZvTHZrUUxaUUhjSThxbGFhSnB2THZFbm14?=
 =?utf-8?B?dkNRaUQwNmgzYWhXSTAyc3hRZ3U4NThzd2NiQi90cmw0MnAveXJiZmdjeDlv?=
 =?utf-8?B?YXRQeDZrRDVGMGlmVytyQmNVUHJqUXBBbUw4K0VLaGtsdFludm80NEVKNXpv?=
 =?utf-8?B?dTBqanJTcUU4NGt6ZGZYREczQ1FCNTJmdzBPYzUrSlFSNEJSMzI5NXRLMVIr?=
 =?utf-8?B?SHdqQS85VHRuMHF5V1Fmcys3MEtRdmpaMkJWWlVLbHpoZEFuL21RM3UzTzhS?=
 =?utf-8?B?SWVrZDA2VUNkaEI3OExIZFdDamJkMVU4a1FxcVl6SGFuUFNZTmg0b01CalFY?=
 =?utf-8?B?OGw5eWFBemdQQlI2cUVpdFJIK2R0T1hjcTBkTi9mSXkrWGRwU2Rnb1lrWFda?=
 =?utf-8?B?VFRQaVZvTnV4TURINWRtUlNDZStoN3FpMHo5V0tWY2R2V3IrY2U1S1NpTUJZ?=
 =?utf-8?B?b21nVFZhbHF4dUs2UVR1SUs5R1hOeTE3dm9FZE9HQnVCY09pL2Z1d2lwcjdq?=
 =?utf-8?B?Zm8rd0dqR08vYnBGS0pUT054QmVZNmlYbDdPVEZSUHlEMlh3bGtGbEtmTTB3?=
 =?utf-8?B?dlRKVHNRblErbjRaeTI4dlpWWUxYUnIzQk5rV1d6Q2prSVpwZkQ5ZVkyT3Rz?=
 =?utf-8?B?YU5YMFd0d3dEZllqR29GV0JMUWszVFBVT0hMOWQxQ3h1VjhLVzFzMWVYVWl6?=
 =?utf-8?B?Lzh6V2QzTTgzWDFvbHZFWXJ3N2FOVTMzQ2pVWGlJcDE2Vkk5d3NMcjZxVWRK?=
 =?utf-8?B?dGYzMjBIVmEzZnJFMDZGSXE4VFoyUm5IcEFVbTcwczlHa3NxU29XeFNTS2M3?=
 =?utf-8?B?K1ZiS3JQdUxuWWdRZW9LMk5CYnFCQVpBQXBRZU9HeU1xUUM1VitEV2pCVk5m?=
 =?utf-8?B?Z3ZrbzlBVGNRbzczNFBzNm5xYkUwM1l5OEdUSVlPbUlwNmR1WllZVVlFeWlD?=
 =?utf-8?B?TWQxa3g1Z0FPSmVQaEh1d1FFdVh3THlLSVRoN2lWVy8vbHBpanlhUTlhUVgr?=
 =?utf-8?B?OTFBOE5Hd1lVYkFhUVNtQllOYUpsZkoxaTZVd2N3OE0zU3V5VFRFMmJVRVJD?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2A+y+emnEP1tu/jBe0nUZYl09WfKFhfjm+OoSdI+1c4hb4dGU48QRlpCsqDmk9UKSje9h23PGoDp4tE68HRpIfG4WJuXLeKj3RPK3xa68bieSXR3tIW08tCiXQzGwZVgl4awNed8w+Qjz8JUg8aN7E8OwiAUp6JWRhjGVWQjMofyuxXOFWvDLcQIxYXui5b6EJbOE5rEv1rX5yNnD++GmMLv7HtF+Yif8OkXg8FqSb5P2gQFfUOCnagGu5JF6114/4mVqNIyeFP60QcxqPNqn1JhrNuIsodxR2Ply5faGll6r7sB4RIJSzCYoG6uK9Sczr4QW9RFJe8RmGGpj9TE+6kECQCE0yihVwa/+a5N2omxJ04x9Gf5m3NJ/Z8OnlQ6WzVKCS+lAg9+MRAOit+MGu9A8LsNVnfJiZh/fmcjdopnjql0CJlXtz/Jo+Lzdu9su97W6tD4JjOdJnLnAEGyG5OEaGJii4iec00ImzBAjmhOCHp/m2HTI1hJyds7HkVk62yxPqQHrAjvYfIXW6G6YTIOWal9wkw4Q/9A92iOl8h/FhyG6mJAmIc/QXCAYIzh3Z4hpQdy4f8TVMfp7cQ+xzG+xuHsmt9UEbFnl/N6Ub4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3608a6-b08b-4dcb-fcb2-08dd9e211181
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF35CFB4DBF.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 19:51:42.3549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhnU2hG/l8UH8xG5MOHsqBTvfpRj3jF+JsZjtfexLdynIRNNwxJuEbZXE2+V9T5ONUh6lzhCMzILMTkZPs2PExFPBjca2+LtFiaRiNLdWig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE3NCBTYWx0ZWRfX1TVvgjhePG6y 8DwLXZkq2a2gaMjzc9WJrgrcBEcwyGYrzU5dVhnFLwa3XPIlovuK3t4iTxA8MwSz2l27M5MIMyc zfBY13ljC4trtXzQAkpV5YB08AyzMQcKfVulhO4WC2JvEYkCTzWOQAHp4eH0HNA9iRgRGd7f6Wu
 O9+qMg6vRWmgTwwgupMeA5jVwNOVH2EYxS8+am1pPaMz6Zfh+M8GYcB7qINNAB7W2AOES1u+qO5 cutOvp1zr9KVntXSD/S98kiX8/3NN6SgGP692yq0YQFIZc90LN+yyg5fdRkOTU6ZFD08WpB5G9E W9qfLd5MV1L4CV/8UNNy4UQhh4ey6MqrSbvrjxvfJI+HKHfdaSajTHid9j6DEFrl8s6mz9PuYiV
 xw1vSe1LzEX1TShWxRRn169p8GHdmIIPCVGAICZsl4A4qRVgDL45SbdFF4L//KHddMYRhxgm
X-Proofpoint-GUID: 1nUC9g-ILuyD10-3cLsiSjI1zNj2rEmj
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=68376952 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=aoeRu7uMpexTEP93S7cA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: 1nUC9g-ILuyD10-3cLsiSjI1zNj2rEmj

The following changes since commit a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11:

   Merge tag 'firewire-updates-6.15' of 
git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394 
(2025-04-02 22:41:04 -0700)

are available in the Git repository at:

   git@github.com:kleikamp/linux-shaggy.git tags/jfs-6.16

for you to fetch changes up to 5dff41a86377563f7a2b968aae00d25b4ceb37c9:

   jfs: fix array-index-out-of-bounds read in add_missing_indices 
(2025-04-03 09:11:43 -0500)

----------------------------------------------------------------
A few small fixes for jfs

----------------------------------------------------------------
Aditya Dutt (1):
       jfs: fix array-index-out-of-bounds read in add_missing_indices

Dylan Wolff (1):
       jfs: Fix null-ptr-deref in jfs_ioc_trim

Vasiliy Kovalev (1):
       jfs: validate AG parameters in dbMount() to prevent crashes

  fs/jfs/jfs_discard.c |  3 ++-
  fs/jfs/jfs_dmap.c    |  6 +++++-
  fs/jfs/jfs_dtree.c   | 18 +++++++++++++++---
  3 files changed, 22 insertions(+), 5 deletions(-)
