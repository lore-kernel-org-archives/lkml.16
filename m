Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA738837
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886042; cv=fail; b=UPOoa8Y+9y0l/j+Wu3tKadfidRnW9/nOwRQdV5HmWFyM+LX7xXSK27DvE6IP4vVkhw3AvXQBlsMZ9rhvEufgBV8T8A6k8/dQ5WYNJoS8mUu/j+8NJIpBZm53RHvLo272B+TVjXaZGrBMtHlkXAplmipErAX/xXxk2B2i2u5iRFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886042; c=relaxed/simple;
	bh=yu+g6pjQwigSqKEBUm852p7Xjpk02Qvv0edP/QJfSpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FQIFbtjGG5pC94VUa7B53J5JQZN8dxLLHXtFn0Q2k49sqCZtQjLXtMViwdGttv223AAzDMXbKUthMQaClCKGLFXLeaUNhhUxUkbZh58+Ac4YyvlPdZoRXMmBoGN1XDa5g7smI4oWFl9aMxf1tHiI7EU9demtf8sfrzB0jliRHIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nL34ygNG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j4fn6fwE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nL34ygNG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j4fn6fwE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNnhn8000580;
	Tue, 29 Apr 2025 00:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=j5/4eN2iSbMDWvghiSeNFwYAMx5sC5QXo7SE23baBig=; b=
	nL34ygNGK+cx0aXpIcQ+j1bxVaDrfY28JPc/e1My35LCb79RfLoDcMvgDH9tG+mU
	E89thVxHrCUN9FHb4GzOmIlvp2qUHnj6QfJNmiZwyvo2hKjLhJaKcqlU2KO/kvuB
	eLJpeFdOZYIUwK6Wj3wm1rk8WVAd8uvCdA/tlF//D2zA9VPTedY/b7M/nANBzqxv
	fr5k9gZ1D8E6dTtE7F7Iif/BW2tFH8L3NnQGWfjq2CMK9GHZOAmLBT5hRwqMbX4d
	6XOoovads0SpQC5BROOuTZbP4jHQxRV6XF/WBdA7/alJwhDsli5hWy1lHy6EKsln
	raSTXMntWcYOrjfHSPFxEA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ak4u0226-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 00:20:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T0HhZd013878;
	Tue, 29 Apr 2025 00:20:09 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011030.outbound.protection.outlook.com [40.93.13.30])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx95d4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 00:20:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slGBHIRPA4R+3ZlGz6BcjNaPPdbdr1S9y8WIGp8f9MPkFCUvryRLeLljtKTQ5jDYIEIGyFAANT4JVMPonWX18+ha/z7uNeMIJH1QLsMa5Sz5C3fD1aC3nUGob/4ecfYixfUaZtd3yX4QHkROgA8QFcXnWMx9CEQ6GflyK0BjQvYYDLOLUzloyU6xGBU+h//+iJ1kvK+bja2qEwW4I052XUyEAm6o4QbjooWvW8G4AQmag5dOCKIRThMycuvF8NNlvqW7snPA1OG0RSKvuAtCb4DKFT7Kxe5bEarAWLuI5a+VSJnk7dC6p6FmqcWJMTN5gHeipwjiB5NpA+0khSFibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5/4eN2iSbMDWvghiSeNFwYAMx5sC5QXo7SE23baBig=;
 b=d3dSEw/qno3wHB6A62HVWDoKgW/FoBGI6m+eAcKybihdTYUwEQoZ9nL+uAz0ZcCOr9bIW0bhznGNQX8y03We5uSgqx571PriQq/mLGnFhXAnT8HjyKVY92sKWXT3oQr7uLOiS21GDfbLOZT08SGOI0QKKxMlyTfpZ1SPK5UmeQJu4jOT2ydc6D7rFUqPPux1DQvVFW3zyF2CFgwxiOdNAmI8YFpOR100HeLalGjPetXIy+kH1hjBuXtGqzbhyaEHpM1281q0SyTcqwWpRnOg0nuQXDXWZN3pnrWupMOKizTAG8G0eejFcYM25JACzjaak3MkPPiVRFitdnTiQPNXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5/4eN2iSbMDWvghiSeNFwYAMx5sC5QXo7SE23baBig=;
 b=j4fn6fwEjZN9I5WilP06pTnecZHThLfGYQCSFtW9rxEn30V436+LHk3NG9WgKUkgEw8BCFXfly1bPUgo/Iwxto7/ex6dGHrx66efWAFpbwcDxtp9f3vUN0f6cLn0q4RBcUVaK+bmyQBfcvD3J8L/hUOX6DrSuw8unb8XnzKKHZU=
Received: from MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15)
 by CH3PR10MB7234.namprd10.prod.outlook.com (2603:10b6:610:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 00:20:06 +0000
Received: from MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9]) by MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 00:20:06 +0000
Date: Mon, 28 Apr 2025 20:19:52 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: sidhartha.kumar@oracle.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
        Hailong Liu <hailong.liu@oppo.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix mas_prealloc() reset
Message-ID: <2tf7t2tjwsl7oij255uwsyxvmnxg54vsa2rlogkyrevlv2tr5b@c4kcoju752y7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Hailong Liu <hailong.liu@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, 
	Steve Kang <Steve.Kang@unisoc.com>, Matthew Wilcox <willy@infradead.org>
References: <20250428184058.1416274-1-Liam.Howlett@oracle.com>
 <CAJuCfpF9aBvTw-r-CMM4+BgbAKCePZpR7_H4ouifWDHDiYQ8Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpF9aBvTw-r-CMM4+BgbAKCePZpR7_H4ouifWDHDiYQ8Qg@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0198.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::22) To MW5PR10MB5764.namprd10.prod.outlook.com
 (2603:10b6:303:190::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5764:EE_|CH3PR10MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 747f5563-09d2-4261-8696-08dd86b397c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S01ISE5sWFVUZlJGbzVFNHNwSHhvaDU2YTlNakttb09UOG12VWlvdEcyZ3p5?=
 =?utf-8?B?a0V0WmMvUUVxRVlBbkxkM2dTcXJseWY5dDBvc1BIM3h2Zm9jSG5qa1ByMWJK?=
 =?utf-8?B?OU10cGdiWXA2aURHWkp6V011dW1zaWxxNTUzRGlJY3U1NmZMNEl6QWxKS1Jx?=
 =?utf-8?B?bTZ1RVFhaDIwb2FvdTJTTnM4RENDeWgzS2tGbVRVTEVmeG9LNTh4Z21sU0cx?=
 =?utf-8?B?VzVwMFBmY0hJMGR1SGhqNmUvM3dsNTViS1pTaDhMNWR3TW52K05mdVUxdE9T?=
 =?utf-8?B?TkYrQXJoMTNCeWtFSzJ5S2lZYml0dHJQWnNhMENhV09TNi9VVFNKWmtndWQx?=
 =?utf-8?B?SGl2bmkwWDRTQloxNTBEQ2dTSWNEc3NZdXZuZ1VjVlhpZnY2YVFOTkhONUdG?=
 =?utf-8?B?MXBjdkdNYXVaenZlWFduQnZXdXNkOUVhTEJiZERSclJjRjJ1aXZzNDFLdSt1?=
 =?utf-8?B?TWFGRzVoeVE2SkRKUVpKdUxvQlJ2eW1wNzJyVW5UYWhLVGVpdDM2d3dQVDVH?=
 =?utf-8?B?QWpSRWxaNDZFNk9BSDRJYzlycDI1NHBwQ2NGU1RGQ1FWeTFKVDYxc1FTbisr?=
 =?utf-8?B?aERlSUdZRGZ5enBscmhxRndidEpZak1XRVZNOUx6Ty9TcnMxcmwwR3BONzNQ?=
 =?utf-8?B?RHgySHVNNHl1dGxScm9sTlJ6WjVtNThZa1ZOalptWlRmaUFILzBuTUVpTDVU?=
 =?utf-8?B?cTJKaTJiYmdzbGtmWXJQR2lYNG4xSTNtSk91VDB4V1IwcW1uQjc2QkxZRFQz?=
 =?utf-8?B?dzhmYzBmYjBwd3A4ZTBlallOUElCMFo2bUxKL21lSGZIS2c1UE9SenhhVmU0?=
 =?utf-8?B?cFVWVzcxYm9wTEJZWDA5aEZCZ0JXUFNJaHNLNDV4cUQ3RTIwdE5JOHB1ZUgw?=
 =?utf-8?B?ODAzajFpOW9rbjM4M0NBYzdVK1NtMFNpS3JoU2ZQc3VyWm0rZ0crSVZOZ0ZW?=
 =?utf-8?B?eXBWVm40UFFNR09GSUszbzIrZW1QMkFYd2RoM2tQb0Mxd3hZbkdhVGpBMzd2?=
 =?utf-8?B?cmgvMk9TdS8yanZOY2lVTVVKa1dzU2k5dXd3QjM2YkNTb0s4WFY0L01GWkY2?=
 =?utf-8?B?aUFDVUN6bjlFTTVObmNLdDdiZkFUMXRvazY3Sk9ydDEvU3Npd3V5a09VSEFU?=
 =?utf-8?B?c0M0ZU4vVlNnYUkvZE15RjgrTEcxaCtxamRGWWx6TUhxTzRUck9BeHN5U2VR?=
 =?utf-8?B?UVhSbHZXbmw3NUlKTFJNMEx6c25HanY4NFNKNS8yUkpFWWcxdVNzenRlWW02?=
 =?utf-8?B?MkVKRUYzeWRqU2thRTljTWtLS2xKZWFhdDFUYnR0UktDWlFBY2NUZWdKdmti?=
 =?utf-8?B?R0lPK1NjdmVTY2t5ejBxTXdQRzd1Z28yUHAzV1h0VzRDY3VndG1NUHIycWx3?=
 =?utf-8?B?UUNSRlBqQTllOGJqbkMzLytQZ01QMkx3dWtqQS9uNjkwNXVDcElMUDNvd09I?=
 =?utf-8?B?NHVITlVuM0c3endDQWljaGdKNzFaRWZMM1RJWFlLejh6QzRiMHdRYi9IUWd4?=
 =?utf-8?B?NGZ4Qnd6Uks2SlBUU3JjRUtmcTIyWGJEaUxOWG93L0d5QVg5Z1IybVRkNU5t?=
 =?utf-8?B?SFZYT3Z1SFpRNGVoTnRpNzk2SlR6T1dDZDA5aWdtR2M2YzVZMHoxN0hmODlC?=
 =?utf-8?B?V2VhOW1PQXpCUU5xQnBqOVQ0bk5maytKcUVNUklJRVZoTC9OT2RJL0J4Zzlw?=
 =?utf-8?B?aHVsZUY5bnN4cUNlbU9FcW5GOVJPTWVWcjAydlFQSDZQVnFPeEh3WTVweHVz?=
 =?utf-8?B?blFPUXVwT3dOa2xPSXA1bWRiR3g0N2RycUxiRERBcjRzeThvcU1SRzF6MTBM?=
 =?utf-8?B?YjNoVy81TWZ3d3NMclRuT3JkelUraDZlSnRUak5XeGxlV2hVMjM0S3lWWG56?=
 =?utf-8?B?RzBxUmhyMVlwc2FqRFBHZ1VsSHlqK3djam9GeXZGeExZdFBLeW9KRW9mOVA5?=
 =?utf-8?Q?QtsPB3M/Gc4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5764.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pHM2ZCdThxUmVJWjdrd0Jpckc5T29qMHZKUDBOc2VocGlWQ1RGOTVla0F4?=
 =?utf-8?B?WVJEZE9KVkV0V3JXOHJLR3hLQm12RnJJNHdLTktZRWRwQVNDK3JsZ0txaGVj?=
 =?utf-8?B?ZkZ1NWlGVkQ3UUFadjNDcmh6bW83WkQrdEFHSlN6VGZlWEtwZFd6VmZYQytT?=
 =?utf-8?B?S3NNaUNuc3IrWFhGWEROb1hRRnc1NTlUeDNpa2VpbEIwTzViZUFqVzVCdGVp?=
 =?utf-8?B?Z01RNmNsSmkwV3BYa294MTJsNEtZclJGbWxaNUpzUTliOWpMM3pJSkZCU3dv?=
 =?utf-8?B?eEZJMWhxZTcrTUxvZlhPamxWMDFxcDlzM3oreFIyU3gwdGdhZmlhTE5zMGZ3?=
 =?utf-8?B?TjhlYUN4SUwxcUhkV1hEOVdqbE5PVzI4UEFxS2RyQ2NpY3hXeWZobXJrNWtt?=
 =?utf-8?B?c0xvZFY5WnNhS2NvTkIzYnNCeTdGbkovcHZlYWkvNDlwR3Z2aW9jcmp3UFI0?=
 =?utf-8?B?VHF0SzJyY3JzR0NLanNraXFGNytpRHBFZlFIM2pGdzZBcit3VHpWdmlHUXVZ?=
 =?utf-8?B?aHhIMlcxcjB2Y0s3NFZSbGpiUWtEN3lvaFh1dDRubVR0c0hFRnY4THRBN1I2?=
 =?utf-8?B?V0N2SmRodjBNZGxsNnhsYXZ5c0RqN3p3QlJPVnk4bWN2MlFjeS9IZGNBaVcz?=
 =?utf-8?B?K3ZmcW50YzRPTko5WCtwM2daQWV5Q3ltTlR6bW0zTGJNT1VuQUcyYWVldG5B?=
 =?utf-8?B?QnlkdTRzYXphSll6a1RReXI5SHNyamFoOUZwa0NCYk5CeUNwTSs4ZHBXTUFU?=
 =?utf-8?B?UWQ5bXNZMGJYTkdsTEhBR0VjMi9XYkVZS2Zxd1Z5VHZwOWhHU1R6NUY0SEZn?=
 =?utf-8?B?NHh1VXFkeXRkMU5QeTZvRXJVc3hkY285bVQzcUx4Ukk0SDJ5NHluNk9rOEJv?=
 =?utf-8?B?S1Uyc0RBKzBZcVhZT1phLzVNSG14aVBTc0xmU0F6YWw2WXlYaENSUFBEblhM?=
 =?utf-8?B?cjFIY0gvK0RTT3Eybkc5UlNURnNLcklLZ0loSXNsRDNxSzZPb0c5eTVHWDY5?=
 =?utf-8?B?M05BZzlEdGpEeTJqMkh2QXpuOGlMcVorY3kyakkrMXhoNkQ0ZVdZUWQ5L1Z0?=
 =?utf-8?B?by9uUmRwcVJlRlpudVlPLzQycHk4VEhCK0pnaGU3bXpOM2ZHSHRHYWNFamMr?=
 =?utf-8?B?VmlTSHFQY1ZJbmNkVU1DK3lLL1RrV0MySW80dHJSQk4zRmpKN0gySTBWK2VB?=
 =?utf-8?B?dmFweUxNR2NZOWJ6TFM1TDRiY1NwdjU1cFlHSnFjekVwSkJRbER0QlpTc1pH?=
 =?utf-8?B?dDlERGdmWHRUTkY5WjRwL01NeWZaWEJ0SVByR01lVy9NTjV0S3JqT1NCVGUr?=
 =?utf-8?B?eTcwYjF3aTZLZ1QwTWhYbmpkUllqRnVIUkpHSG1FdjVzYlI0VWcrcnlNK2JP?=
 =?utf-8?B?Z0JiT1Q1ZUlTeTd5Vm9BNjJRRnJqUEliVUkvOUNzYmcrUFF6bEJxWTVVU1F6?=
 =?utf-8?B?bW9BcFNCVEdDUlk2ZE1GRFROdWdkK0VNdTNnOGRXdHFmQXVpMWhpcmh3YjZH?=
 =?utf-8?B?aTBYZ2hmK0dYWDZHcmFSOXBybzRVbHBrOVJtcG0vQWZDeE1ObXZKbGtDT0l2?=
 =?utf-8?B?VDJ4TlBsY1Z6eFE3bnhhMHZMMURwRE13Z1BGZWdFZGduN1VPMHVKamVwZEIz?=
 =?utf-8?B?S3dzZWdnSmNrdFBZaGxJeDgveUdGYnBHaktiMm0zYndta3RHUmtUdmcrZFNC?=
 =?utf-8?B?UlRJR2xMTmtrdDVuaWVMNVNpdUkxMXk4bTV2TFlUWXoybldPQlN5LzBEOGZK?=
 =?utf-8?B?YnJRaFAzSFdTYzNDSTJ4cGZFcWp2OXozVFlsbmF6YldPdGxGSEc3VkhhMi9a?=
 =?utf-8?B?MGp0bDRRWktKaXJjNnJoa0c2elk2VllnbE5KSXUydzUyRjl4SXdidDNQaW9F?=
 =?utf-8?B?WWZvaTVoNTMvK0JMM3pOYmRmWDdkeXgwYkJHa2Z1S1BlRXI5TG1Dc1JFL2Ew?=
 =?utf-8?B?dzJaNmtGN3hlME54cm4xZXZ0Yjh5R2FZT0RHbFIyOEFlTUtxRGkxT1VXcE4r?=
 =?utf-8?B?bmJqc2dxOFNaRGFqNVl1UDcxUlRoQytjZEpCTFZDT0JDcnBTNDVZbzNkbXJV?=
 =?utf-8?B?eWIyZFFId1Fqc0NQUzd2V1BWN0ZxaTJ3TEs3U1M2N0RtRXgvZkwwblNVRGlU?=
 =?utf-8?Q?FNAQO/L3vULSVKnMTn9dhEsRd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9hDVQ2li18vW5Wv8JNGkKoSh2dfWNrB+5IO6plETQYntFMQd+q4dpKFy9B7vOJIMgg+IrLcQxAOnUYbtlUfNh5RDWfBuD+y48Toxi2BzjMqJOMgRbbK0BOE6u8IcqoGG77/DBiRWfMd/WDmw8mLZVhDVd0AIT6AhCHNskZg7Fi1chRpDi7aJPI637aUN09HUIg4rKo2AVfEsCzgu5J7v6RZGHPRIKExRe7X0zyltlGRU7JHZ1HvHvLfGx3gwHqMDIGYCm0vbsYtXG8R0QRZgg0MbCEIjCs7/0Yl+CTW7Vy4zglDaCD7X0vNCQCIIEaf9J1WKtJDkZ71oXct9hut5iPgbFfcrsK0+0JUS6jYB981Nay/f0VbO7nTJYFPRQQDNIg0yYTXvTuOxujRe9qDhkHZ9jgxda9NdJuBD5UKyH5lyAVmf4M2cdbr9h4+4oqbd+bPV+Qd2ut2SAUF/bHT/docl+5NjCrmjOTyHE2If+Qs3bQzn9s8jz/Fx+J6mIul/Wme9x3AlS0wtu+DkZ0McfQCLQSsffqhbwj1ZoQvl8lO44HDzi2hVqyy4kj5HKQkFIL8AXUam4ga+e4nYrhj0Sm9N787pRPgTMV4S6mgTewA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747f5563-09d2-4261-8696-08dd86b397c4
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5764.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 00:20:06.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvTGcpbqHBJxRH4bB0xc5FC/CeR380Fq0/YoFpjnYjTGZnO+m2i7ncGIixKNpH5/p+GnN1aMyQJcLyDXHv8tMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7234
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504290000
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAwMCBTYWx0ZWRfX43SHnHxKxmY/ T1lP3DdMvvH0qU0WZfhNAKB9CS7mPJhSMXYapa7Y378lbrLpmoea6ZaUVQQ5s8JKrXGoALXmYY9 Ad9i5vZLaGA3Tcf5v74GHcGZf31ST+e5vyuvUMQLtM9xK4yk4nafsWXak5Dt9pWjw9RMZ7XaH/j
 nT2CErfeURgVvi2r2+uf4vdeIjDOIEdEgjFxPfRELhGqJRb4/oAPExzwLy+0Ztlj+7eFEe0T0W6 d7w5W+vQ4jl6t31hyVMBAziQqM09Zj0KV9QDCEvlUTZmMRSaXPmBLDuT/qIRo+wgZY80oIGL44m Wa0hu/5iQ769IsnksKmCjkEat6hQXxalGuaWP5qavN0c/OaOMoLubwNq31Dh7B5f2d3iu6L8HYi FA49ULh/
X-Proofpoint-GUID: TLbOnWN4t5bbehJybLA0z_6Zf4dzJSZA
X-Proofpoint-ORIG-GUID: TLbOnWN4t5bbehJybLA0z_6Zf4dzJSZA

* Suren Baghdasaryan <surenb@google.com> [250428 17:08]:
> On Mon, Apr 28, 2025 at 12:02=E2=80=AFPM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> > A previously used maple state may not be in the correct state for the
> > preallocation to correctly calculate the number of nodes necessary for =
the
> > configured store operation.
> >
> > The user visible effect of which is warning that there are no nodes
> > allocated followed by a crash when there is a null pointer dereference
> > shortly after.
> >
> > The NULL pointer dereference has been reported to happen when a vma
> > iterator is used to preallocate after walking to a leaf node but then
> > requesting to preallocate for a store across node boundaries (in v6.6.
> > of the kernel).  The altered range means that there may not been enough
> > nodes as the maple state has been incorrectly configured.  A critical
> > step is that the vma iterator then detects the misconfigured maple stat=
e
> > and resets, thus ensuring the tree is not corrupted - but ultimately
> > causes a failure when there are no nodes left.
> >
> > Detect a misconfigured maple state in the mas_preallocate() code by
> > examining the current location and planned write to ensure a reset is
> > done if required.  The performance impacts are minimal and within the
> > noise in initial testing.
>=20
> With this fix applied I can still see the issue using Hailong's
> reproducers, both the userspace one that he shared over the weekend
> and the one posted at
> https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com=
/

Thanks.

The test patch also has a few issues which would affect the allocations
(such as not setting the rcu flag on the tree).

Besides that, there are a few bugs here.  One is the incorrect
calculation due to the moving vma iterator - which my patch doesn't
quite address as I've come up with another scenario, and test case.  I
suspect the rule of the vma iterator pointing at the 'correct slot'
(documented but not enforced) saved us a lot of issues here.

I'm undecided if it's worth detecting this being false and resetting,
like in this patch.

The other is to do with MA_STATE_PREALLOC, which will stop
preallocations in bulk insert mode.  If it's left set from the first
mas_preallocate() call, then we won't allocate more nodes and simply
return.  That is, the bulk allocation is causing issues with chaining
mas_preallocate() calls.  There is another issue with this flag not
always being set, and so my testing passed... With the way this month
has been going, I expect more fun yet.

I'll send out another version of this RFC with two (or, I guess more..)
patches soon.

Annoyingly, not all of these bugs exist in upstream - and so the vma
test code is less useful than it will be in the future.  I have
recreated the scenario using the test code, but it didn't create the
same issues.

Thanks,
Liam

