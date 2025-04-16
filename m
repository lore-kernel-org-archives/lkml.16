Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7D8F7D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789010; cv=fail; b=TReMhxUypoYwOU734sE9PoIadAzt5PHSvAj3fJzSi+wA6DiKj6Y/ANHEjbTKqq3XhmX5IpM56/NtUpM0tltLiBbdqT2K2ueS6/m3f0SX2PEMv4srMvMfWVzVs8Ni3q/SwlRwPU9EZlQWg3zqca0SwIIhnHImtQg9S0FkN9i71+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789010; c=relaxed/simple;
	bh=RjS/wfbYa8mN2N3gNNSy6i51D4gs86CKYbk3FtNLTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fZV2ZpBpKitJlZDm2usDpORh/cFmuy8m0yVX9Stq3ca6fsYt74DqjPv6KYIgyou+VssXqqWU3pw058xtaZ8/EXWgS40jQZ3QNeATDTHGq+lX0l5ob0GY03ljmZN8aUpB1XtnsQtc7lH2x6DRY1uhzUgyc0PZD4ou/ZR+5wmQemM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FPNInQVW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cGCMdrN1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FPNInQVW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cGCMdrN1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMNUiT007264;
	Wed, 16 Apr 2025 07:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qwqOK8sbkojNNd68z/lbue622YPBx5Q27ck7105RO+c=; b=
	FPNInQVWeyvtYvYpxnAN2yS4KsMDs824/99lPIn52wY7PPBFDIQQH6o+ArNeD4sp
	ThjTKLRN7JT4dLWhTTP36276+8z0csT2yFTE7cI9LKuk3mX3Smfa7Z5cESOFUOwJ
	+DEWsEW8CVxqi5UC/C5+RdQNmcaKXn7ydP+MevB1rz4Lm297fxjTPr8ms8+FfFHM
	jn1a+2suyRz4dauKpLfGI9KHioHQqcHkK7Pj6fgenViKGQijaz2nVxQ8qZpy18IP
	t8+Jv1k+74M9T1IJOeojQhm8t8rlowvxG3b47g+iNRFb4f0iijsE0Ki4tQQS/cNP
	4DIuSYD5zheTR59ZndvEMw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617jubg21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:36:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G6ILxS005712;
	Wed, 16 Apr 2025 07:36:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5wf5cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxXrkS1fC3nbwio3bdBqkMbJbT1lusrE8s/g0nMiUBZa9UkuOtRzBkPnmsFel2JABW0Oc7cttzg8yXcXQA2jBjSwaak6067GOd+f2PVQgjKuxF1VqUcwVxCUMGqO+UEs8IdxRcjv3Dl9qWGfODaRcF03SRbW3pQkY+JaG6zFe1BawOw2G61cW9NhMS5SQnKje+2UGXlZs16Fdv3HQYzd/SY/izEkq2wu/BxLVkJDpYuVQhtR4THW2zFpaj4osb86noOS80RUyvW8xqXQevNnn1am6idiMZa1rtxjZKrmB+9iAU9W7YdFKpX2al8tdl6fzgLlp3nH/SI95TpXft47gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwqOK8sbkojNNd68z/lbue622YPBx5Q27ck7105RO+c=;
 b=o2bCknxInOKgTVqkEY+l9jPRswXkNayT+7vhcm7CiOCM0wlPwJZ49gZ1KcDwacbTf+5uArov9dn5G2Yf7JmwMWlcb70Z1vBijXAki3CQK5pNir3OsWz06wrq0tMIPa4Xy/YhkmDzvbzpbQJ++q0Ab+fC+ojShMALKXra15Gc+QLZOUZXf9Sdsh+LTy8bVyb8YL8gFMHflC9tewy659unu5+q0PgA04HMadT3Lik7fAOmDlT5z6Hdijrws7fxc+SqUdpBptN2nUAF2T6xuxX9GjQahfFfsOEQ2YaHVmzC+TOETNyXCDDtuwUnNlHE1NReVRMeC7aJ7wezdjC2N6ABPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwqOK8sbkojNNd68z/lbue622YPBx5Q27ck7105RO+c=;
 b=cGCMdrN1Z+RrzFEOS0Y5/QE1Dfv1DyBifJwJJEEoYf5qn/Q8Bm3WymjK4uqTJ9uAtoxy8asMhx57COi2+caLjIRAjDvdy9Lujjsy0+lqlP+/vlLM+/SRDLr2KgqXSVIoL2cfvSZIwy+PbUZntMtmhE5OhVpSpS87+puP7ddTPIw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB7080.namprd10.prod.outlook.com (2603:10b6:510:28c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 07:36:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 07:36:29 +0000
Date: Wed, 16 Apr 2025 08:36:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <5451d160-e7c7-4cdd-bc08-20f6778f6e6b@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
 <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
 <CAJuCfpHjf6+JSecEJr-8ZCSL-rS4MnEy0QcHcrya72dXFsfPiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHjf6+JSecEJr-8ZCSL-rS4MnEy0QcHcrya72dXFsfPiw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d8a54e-1cb1-4778-83df-08dd7cb9672a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2U3Y2FyYnlSVDB2TG92NTFTenA5cnBvclNqUTNEalQ4ZUVEWkZIYTI5UWVp?=
 =?utf-8?B?S2pNeHgrUDE4U2lYTWNBSkwxQng4VGhUcytjTGZqS2YvdDlMakdSYTNKc0Zl?=
 =?utf-8?B?WUtyWEh4OER3TnhvV29qQWxlSTNDMFIvZy91WkxvWTBxL0xEQ3hoUWlIVmxH?=
 =?utf-8?B?RjJ3b3c5VzhxUUlDV1R2RElmLzFzTTJpT3d4dHM2YlZOVmJlL1IxcHNNQ202?=
 =?utf-8?B?WDNRdlo4bFIwYi9iNzZyNE1DaVpxTGkwUTAyM1BidE5iVjlhNlZJWnNyQVpl?=
 =?utf-8?B?b2xCY3hxdjBFOFJJRGI3Y3lvbDVnNDRxRGtES0VtcUJkcjh2YmJkVjhQbk90?=
 =?utf-8?B?T04xUW55SkFQeTJ4d0poaXREU3VISkF6VkgvdDNMYjB6NEZ2dHFwSTBDcTk1?=
 =?utf-8?B?NG9nK25kL3NWL2JYRlFaeStsZ1lWSDJFZnVkd21XOW1JNTVwSVVFelVqM3Ir?=
 =?utf-8?B?OGMrSktkUUV3Qk9FNTNpaklQOWRoZjBtN1BsSWZWMTBpeWxoaEg5OW5MeWpR?=
 =?utf-8?B?Y2tuYWNxU0ZObzFNSTlTSmVoNjRFS1JqTEt4REFjZ0ZWWHVIOWx4VHkrOUdx?=
 =?utf-8?B?M29lSlZucHBtSGhxUVZQVkdiNERzK1R0c3RaMU43YjNLalVrVENnZk5EYnBK?=
 =?utf-8?B?Unp2NXZka0pSTTgvQTErMm42T2YveHJtUVc2eFJ6Y0ViSGhCUWZjQ3p2R3NN?=
 =?utf-8?B?emFCd1c1ckNlUDh6bFBWSEZLVG9ScWtNakpzK29keTJTZkxsc0FQdnVzampU?=
 =?utf-8?B?N3drWklpNDZGZVpMc0x5UFVOaVZuM1ppZFNSUEtyd1BLV0NBbUtlRkF5YTYv?=
 =?utf-8?B?NTY4b1JxVHh3SlVwUzNoQ3lZWHR4ZXFuT0lGbDBjT3Racks3d042SzJ2SGNj?=
 =?utf-8?B?cU50VHB1VmlXeTNic2NidmsvM1RUV01IVzlvVDU0SXpZU1UyK3pPT3JjZWJN?=
 =?utf-8?B?Z1pDbElqNXBUU1IySG1MU2QyOFVmQ1BvSzlPSytkK0tyazMvblp1VlRDeEFG?=
 =?utf-8?B?QmtEeDF3RklqaUl2clhrYmpSYmgvanV5YWkxTnJzU3Y4eUNHU3dUQXl1cW9U?=
 =?utf-8?B?MXJOYThEUXV5RWxrTUlQU0xZMmVFQUowUmtMKzZyTTcvVFp0YUlvZ0hxYkFi?=
 =?utf-8?B?dWE0NEVINFNWQzl6Q2h6cUUzR1Vuam1hTSt0a3pSVmhHYTBmUDFwbHlLWnR0?=
 =?utf-8?B?bi9iTThGNjc3T2JzMFZwZkVMWjhBcnR6ek8yNUI0V0NTY1N3eFlRM3d0YjdK?=
 =?utf-8?B?bG9qUzZTVkdHaXN5Z21QZWtjWGVFZ2JqOGxEbExZMXhGR3JoUVNtSWZlYVhJ?=
 =?utf-8?B?Vy9jTmxibVE3SkRycUhRcUE4bEozTXVjcG0rY0RGZ2J4WldwU2VoZGtLZ29j?=
 =?utf-8?B?R0Zoc3o4YUVSdFd2VExZajBpcUZJZ0pyc29TWlNacVR1c2NMWjlkUHp0Qzhm?=
 =?utf-8?B?L0Z3Q0FBTVlrbmJzUmdtdy9nUHlsU1Exdy9hM1JDSkY4eE5EYjZtRU11dVVl?=
 =?utf-8?B?MnJLQlhSc003TE15bHJGQW8rV3NURkRCV0Y5a0hZVk5MMXN6TEZlOE41aUZG?=
 =?utf-8?B?Rkd4dGNFeDR6RW51WGh0SzREa3RvRTRCRDFDZ2ZvMVByZm9sck45cm96Q2ox?=
 =?utf-8?B?aWMzRHRKSS92LzZvRG9PZjE5aCt6TlV5Tk10a0EyRXo2MnN2aXYvL2JqRzZS?=
 =?utf-8?B?c0U0Ulk3RXp4NkNZRk9wTW9lSkxzVWpyMTNZcCtJeUFKL3hqTngzUTVMNDRY?=
 =?utf-8?B?Sm1DZTVzTlhrQ2p3QmZHMGhWbkZ4Q3ZlUG1ScTdpWUpETUFJYTVlL0xYSERW?=
 =?utf-8?Q?CkbgK0qKwinrQ7YHXBB9JWdDNTT/jtP8wLnDA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVrOEwrZmNWOUU1dmk3d3BDamc1b1dGd2h6bWUyTTA2emVHa1hHeVNTYVFi?=
 =?utf-8?B?bUE2OXlNL2FhRitzYTREVy8rcWt0amg0cm9yUThCZjlRV2tmeXh2b01TYlBX?=
 =?utf-8?B?ZDdGOE50Qy9lbW9TeFRra0hxMnNuNnVuOXRhV05ORE5hdytVTDM5MERyL1Uz?=
 =?utf-8?B?NkE1UlRhRkdTb2tZTGRBYVMxT1JPZ2lhT3RPekVvQlhteTdMbGk0NUZCZXk2?=
 =?utf-8?B?K1hRb2kyd0Rrb3pNZVgwVjlXRW54M0tZanlCN25BK01pVmlYOGVDVnJLOFM0?=
 =?utf-8?B?N3BNM0JHUktDQ0xIZ2EzSGxWdndwQm1kOGVqNUM4RjZSMk41cndUTUY1U0FE?=
 =?utf-8?B?ZUpteFEzR3BYRGxiNFp3R1ErWUowd2psOFZUVncxUWtSVFZNcTNNTEVDSHFu?=
 =?utf-8?B?TjM5cVRYajRyNFJ2ZE5DL2JjbTRXUnBaMXBUcXluUXRkSW1WdXpDY1RVVVUx?=
 =?utf-8?B?L29tdy9FcjdFTklycEZHTzdFb3R5VDdtbU80T1UxRXpVellQWitUdk52OXBy?=
 =?utf-8?B?R01QZ2ZzOUY5QmVDcUNGeUJ0TGsvcUJEaUZSVEtXbDVOZ1JDdTJPYmtxZTZP?=
 =?utf-8?B?VWx1NWZ1Tzg0K2V4Nlp0Mkd6enlsUVBoT3dHVDZJRUp3NXc2VzBDaVplSE5B?=
 =?utf-8?B?STJIWjRlUEZTdGYyWjh2VVhpdG5zMEo1bmZpSi9Yb3cwUzMvTTJJbkpBWXJr?=
 =?utf-8?B?cXJHQXgvZFpyQVM5bUlKdktLbGxJYkgvdlJVc2RmYlQ4eWFBYmc5QzdKc1p5?=
 =?utf-8?B?OS9xaGdHbjlKTkdORFNSR1VuREtqR0pMcmpIcGVLRExpSHMyQXpxSDlRajY4?=
 =?utf-8?B?Y1k0NzRaTXNqdWl3TXNYMVdRVlArZ0hPT2RnYUJtWVg2b3hqdVl6R1VWSWdC?=
 =?utf-8?B?dmpudU16a081MHJnYjJYaWtrZm9zM1dqYzFJVWhaODA5c3F4OUg1WituY2Zm?=
 =?utf-8?B?Wll4cFo0N0l5enhJZkF6YVV3K1dzVURya3B1NmFwMnpVQkd3Yk94aDBXYkN0?=
 =?utf-8?B?ZWpQN0d6Tm4xb0xDN0RVdUtkcHBXVjkwQUZsQ2hSbTByWC82MTJXLytENTFp?=
 =?utf-8?B?VG5TMjFjd3VMa2FKYkY1YVQ4Q21QaUVodzZKZmFIcjNtdDhzSTdXMnluVmY4?=
 =?utf-8?B?YXpybUpkRTN6RkRIL1B1WE55NXo3Q2tPSXpETThwSHRMVEFBRDdSZHl6TGM4?=
 =?utf-8?B?YVZSYUNZQkRjREM1KzJ5U3VzWVQyZ3VncFdUdmcwMFdQeXdZaW5lQnEvNkRC?=
 =?utf-8?B?TndJT0RuRzd2TUpaQm9aemYrK0FoN0pIbENBUUt0YUg2c0R0WU1JWit2Tzda?=
 =?utf-8?B?YitlMUVYR2J2TmJkZWRhNnVtMkx0cHY2RjJoemtwd2V5N1BLNUJvdjRHKy84?=
 =?utf-8?B?djRXL0cwZm9kNlVDa0o5aEJ2NWxiNmp6cHlzMmFJN0JaR2VycEZEOGhFaGQ5?=
 =?utf-8?B?aWNLVUZOY3JEOTRHeUVQaFpYZjBpVGpldEdjZm5LL0gwNldrZGEySStaZ3dX?=
 =?utf-8?B?eERMM1BaN1BIcWtxaU1PMlZaaG5YbmZIdCtTSSsvTzkrSldMQmlKMngwaHZp?=
 =?utf-8?B?Qml4b2FDYWpUanpVb3VOMXBuOW9JZlZjcklaOVBsUjE4M0NuUC9jMHRrdkV2?=
 =?utf-8?B?a2N0OCtJZmZ2cDZDQ3A2THdYS08wMmNtSThwRGtPVzl4L3JXQ2VmUkM3R0pu?=
 =?utf-8?B?Mm5XQzlqdGVMRXBMTEdkZ0dEQlB5ZVR1UFVDUWRRcTJoc3FsRU1lVk00enZm?=
 =?utf-8?B?TnFtYUlDOEphUEVVVEM1aGNTNzVRMUN5S085V0ZPejlydWcvczFuem12N216?=
 =?utf-8?B?VFpFRkFJQ1pscHhYdHFVU3FDMTRLM3pvdUt3N1htUHpoUmdySTNBUXNrZ0tK?=
 =?utf-8?B?d21DRm5FMVNrbTlQUUllTjBLTmNPZE1paUYzbVZINXk0ZXZGa1Z0UkVveFVo?=
 =?utf-8?B?ZUVGQUJkTXN1TXk1QldoK0ticnpETmd0VWRSSG9YZnF1bnhNR3FEbGVRajZ6?=
 =?utf-8?B?NFF6akJrMHcxUEYwaDdYSWVseno4WWJJdnhzTzMyWHRoSVV3aGttVkxTcFpV?=
 =?utf-8?B?bkpoVFVONklBdk55Y0w5cXBYQU1EMUtOWWlQbzVwTlBBUFBMN0RuaXlDUyty?=
 =?utf-8?B?NW90RmxVTW84eDVadjA2NkdGRXJwcnBlNG92OUh6MWlkWFI2ajlxN3UrcjlN?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vkl6AtNTOwaiM0Yt/fx8onYGQ+zmwSlOtd1WDmwEsjdYw00dlzbK2XxTDTSgg0Ps3CNxN2w+SetfknBTTygdOXLXA0MQSvaW0CKadX5PSUdee0KCnqX4SiJ+EL29QrdgggxgpkIfHYRHg9ddJWAgUemySXTOQr6Gpu6mzJ+dhRlBPvf3hxgcbtHiJe2c1W56TG8XXL5UqOpa8sOds1UcZOSsJ38wlS4xZmKprTmeyyA1ejK7GHZejfOy73HzxyRxA+PVmB3QIx0p/TKHrOuPP0IfjDPX3gEA8HfITuvKcanu7cd2/zgmsEoZtPJYfbb4gg0X6dVgPKwDPPdUf4FbExckrWVgXaBf8xNFJtgZP8WwwYr1Fa31vTXDGOU1lmmdTkeIoQmpZ/roABtNAbLcytNg/o0lXfphu0nDdCPypJhA/l/YRS4lm1umt/5Y2twmJwyFPCfh/kqnH0uE/S9mVEuxCtaDFr8x7y5JlKd3yp5INzSkUlvU2Wm9SrSVSORL5JQsWWKcfgYVnwP/9VnHnrxVDVbKz9qjnW7eJucxSr5spF0nDWgunKqxH199JPC4tNfHjXZSmiuAdZqWv6nXrmw9Me7iUtoZSFi/n2ZHlTk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d8a54e-1cb1-4778-83df-08dd7cb9672a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:36:29.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHSQdBh0NMzJoNoaANhcYOMbWxiMbaNYJmM5F1ZTE2pLIof5bDqAdoQzDcjrac4HCRrt2TErgfLsDKjpekowNIWl/qWTH+ZXha+jmWmUrN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7080
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160061
X-Proofpoint-GUID: P3Vqq1_XpZUWJK83hMFuwWaQsC7wa4id
X-Proofpoint-ORIG-GUID: P3Vqq1_XpZUWJK83hMFuwWaQsC7wa4id

On Tue, Apr 15, 2025 at 09:14:47AM -0700, Suren Baghdasaryan wrote:
> On Tue, Apr 15, 2025 at 8:43 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Tue, Apr 15, 2025 at 11:37:04AM -0400, Liam R. Howlett wrote:
> > > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
> > > > We place this under memory mapping as related to memory mapping
> > > > abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> > > > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> > > > files, so this should encapsulate the majority of the mm locking logic in
> > > > the kernel.
> > > >
> > > > Suren is best placed to maintain this logic as the core architect of VMA
> > > > locking as a whole.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

>
> > > > ---
> > > >  MAINTAINERS | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8d834514a047..ce55676a16a4 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15595,6 +15595,21 @@ F: mm/vma_internal.h
> > > >  F: tools/testing/selftests/mm/merge.c
> > > >  F: tools/testing/vma/
> > > >
> > > > +MEMORY MAPPING - LOCKING
> > > > +M: Andrew Morton <akpm@linux-foundation.org>
> > > > +M: Suren Baghdasaryan <surenb@google.com>
> > > > +R: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > +R: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > +R: Vlastimil Babka <vbabka@suse.cz>
> > > > +L: linux-mm@kvack.org
> > > > +S: Maintained
> > > > +W: http://www.linux-mm.org
> > > > +T: git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > > +F: Documentation/mm/process_addrs.rst
> > > > +F: include/linux/mmap_lock.h
> > > > +F: include/trace/events/mmap_lock.h
> > > > +F: mm/mmap_lock.c
> > >
> > > It would be good to have more M's here in the case Suren is away or
> > > whatever.
> > >
> > > I have worked on the mmap locking due to the maple tree addition, and I
> > > have helped with vma locking in some areas.
> > >
> > > Lorenzo wrote the locking document, which Suren pointed out last mmap
> > > lock meeting and does make locking changes.
> > >
> > > Are there others that could be M here?
> >
> > I mean I'm fine to take an M here, based on having done _some_ work in this
> > area and being involved in the meetings and documenting, though I'd largely
> > defer to Suren who was the true expertise, and I also feel Liam has better
> > knowledge than I do.
> >
> > So I suggest probably, unless there are other viable and active takers, we
> > should M myself and you Liam?
>
> Thanks for trusting me with the maintenance. I'll do my best not to betray it.
> I agree that you and Liam have reviewed this code enough times to make
> informed decisions. Other good candidates include Jann and Vlastimil.
> David already reviews the entire mm codebase, so adding him is
> probably unnecessary.

Thanks, will update my and Liam's R's to M's.

David of course will always get my vote but I feel he's far too busy on
this one.

Jann and Vlastimil are also suitable, I believe Jann is away, Vlastimil can
shout if he really wants M but I suspect he's probably fine with the R :>)

>
> >
> > >
> > > Shakeel and/or Jann might be good additions to this list somewhere
> > > (looking at the edits to the file).
> >
> > Don't mind R in these cases if Shakeel or Jann want of course :), though I
> > _don't think_ either Shakeel or Jann really actively work with mmap/VMA
> > locks (forgive me if I am mistaken) so wouldn't really be suitable for M as
> > I feel that requires some active development.
> >
> > >
> > > > +
> > > >  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> > > >  M: Andrew Morton <akpm@linux-foundation.org>
> > > >  M: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > --
> > > > 2.49.0
> > > >
