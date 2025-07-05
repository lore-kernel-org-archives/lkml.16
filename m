Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA64A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751674470; cv=fail; b=bglQySBxVgxC+obo/e0Kp/dN5A7c+bhLydVc102tQvYCeeJBG8kkyt4KdVquaUWN1SOivjx230P8TUPYFm3V6i2Basn2SC/bxB0fVFDNmu9nFPcZwYzaKLGfHU7i+MvnLTcKv9ekrW1KwiwJaiuoEfWL9uepXqNwRw0jluFR/ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751674470; c=relaxed/simple;
	bh=gHG4MdO5E9uyN8iGg/yvzjIk4OMC63bG7hwdfQt0Z/I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t5MbsPcXst3SrJlo+7/Yx5rf62Ai/y3LME9/zyqm09kDrPmNJPnKT3HSDyjkG4A40O3Yf/VZTW8jZ7QatLLodJrkRuiyqUkERUjsWUK+sTqhX2KUYEYgmwbIbiVFd8BjKEaScMAnfgfRe+p6PtPodQAA9y0BcDKUBXvVap3wBQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cfjINdK8; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cfjINdK8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIy1zbhqGgMq8qOVpF0zZ3fddt3tx7bMJJ8uym1PbBJb6wuJVYxL/U200IDx9+grmtpcS5j1nw1CMDYs2tkaX290z7h1YwkEmFfpgbnzjQsSFfzncL6bl8p+PjWYeh7NMPKAGYMSGpizkf84XdoxLH92+gq38NLhVNADEgzmSRFhXJpiL62Sa3a+38tgqk+A/mNOLkLW22jEOPfJnXZSg1C33BGFf+m/dgbSwsd/N1YG1BpEcPUg+030b7iBOVaT4JcaC+YelvQVZVJYZ/wloaoB6Q9h2em9U4adeQX49K22/1/ADpHNsTRXn4YfZdkcs0eYyxhSFh430r34eK0c1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrGod04NV9YKeURpHAdqegeTLRl/4NgB7W4gEKEATGM=;
 b=UlkVKFa+X/Eex78/qbXbEY/O+YDUp2e16pc6Af49wxcx4OJ6tVx7+rN5/cn03c4AzN2h1kmM5F64xqpAM2Py+WVMLN4WMmdvScT1SmFl585kbfnr004EJCC+csF52YIvCTb20BpW2sNwP9jmyiT/CvlhtSCuwg/hAd63MHDrzBPEJP5rRPDm8DFV1GeIM6iYGX/pJe1SQ3/FDWq+DZNgRs+eQaXWXn7+1K1p+/3tgtK1PmCyB8B3kV/D5ctsIeJMRHolKpj8k7i1jiUGvpwuRJu9CBMKtBUmDV2TWpi8l8Z3GxE4OYvJ15cx+zmDOw73PbeseiuG8aBWPt+7An9e5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrGod04NV9YKeURpHAdqegeTLRl/4NgB7W4gEKEATGM=;
 b=cfjINdK8hbEj/2MB98bFh7LWjEDm/oBVaqtq4GfbOeXzTSEBwRPzdGrc4ne1q/ynQlQjuuRH1fKn1nI0Z2qlx/pMNpjbUIeLGhHcXFKot6ddy+q8cHskAxYIdVYO3sFhlhdTvKhAllzsmVQ+uLQbFlmFg13WkIOnj4QDSJStpo0w4HQA9SwK37nFsPB3d0j6NH5s4rNaP/C/D3QdetT/MgnXodTrUpsiuY9ieCfSTAnQaxT6Q2fqYUfDb0K6C3SoH9rxxVx939hMRf6T+8jT4ifNFLGUCPAZlsYATfrIf1urUKcbXQLpngIIIFfM75WiSkPMkmVuDaQcYYMXaXGIfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB9526.namprd12.prod.outlook.com (2603:10b6:8:251::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Sat, 5 Jul
 2025 00:14:25 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 00:14:24 +0000
Message-ID: <5ba8cf21-60ca-465e-a524-5dd43b9bbc97@nvidia.com>
Date: Sat, 5 Jul 2025 10:14:18 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling
 code
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-4-balbirs@nvidia.com>
 <4c274ac4-17d7-4d37-aeff-9517731d0c9c@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <4c274ac4-17d7-4d37-aeff-9517731d0c9c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: b38d421f-1588-4ded-d624-08ddbb58e5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlczekJ3R2pVL2RXZHRBbUF1UlkvSXpzeDUrYUlOQWxCeHlpZEZYeXZCeXNy?=
 =?utf-8?B?UC9aMEpubVcwR1VQbUtBeHZQUW40dzByS2M0QytDOThIR3BZNHY3bFJqcDls?=
 =?utf-8?B?Z1JBR0p5NDRsYVNjbWtnZ1JWd1plQ3J1bWdzbGd2UitOQzVDVjMvUStVUm1W?=
 =?utf-8?B?M0pCL2daeWZWZHpRMG5GK0lsQWF5N0dZRE91N1JTS29DcDQzQldva2JFQzFR?=
 =?utf-8?B?aUUwNnRWMklLOWZkQnBRcUFPSVRLTG5ySU52aHFNNHllajFDdTJXY056Ui82?=
 =?utf-8?B?T0JIQVhqTDNzVGt3UzNBdVo4MENQMWZrWG4wZGxpd1ZlaERQbDFRc25uMGZt?=
 =?utf-8?B?Wm42Q3RWN2YyL0JqaHE0UFpaNnVUYWNRMXN5d2ZIYmdRSnNhK3paTko1MFVT?=
 =?utf-8?B?a1NHT21QYzg1MmJzTHY4c290dmZNR3k2YWprakVzUnl1clpKb0k4QmFQYWtv?=
 =?utf-8?B?dllRcjBObDVoamdJOUZjRkJBV1dqLzVjakRPT3huT0F5MnNkQ29LWnd1MnRh?=
 =?utf-8?B?N2NwWGkxK2xtVkp6QzJja2lZNTFUUHBteFRYU01CeEYzK3d0RUlwRldYTWhh?=
 =?utf-8?B?dDIrM2RBdXNyVnRFRy96bVJna3hrNnZyZUovejdHSVNMWFhoU21ZRFhMeVRQ?=
 =?utf-8?B?OEFQUktPQ29WNmcyaTRBNTFuQkp5Qk53YTVsUTkrMUhsRk0wWTlsa3BDV1U5?=
 =?utf-8?B?ek1KTTR6L1dxdDFGN1l0VEtVTmRYZjhKTHdzR2tUYVdhUkl6KzA3bHpSclA5?=
 =?utf-8?B?eXhMakxNaEtJNWRSWFpNZFJrdkpscTJXTm1OSFlOaTJRNEpRbmppalY3U3JM?=
 =?utf-8?B?TFdGMUNUUlVCSURDdEc1enBvMkxtSi9oM1BLV0lvYk03N01QQ1NtcXRGVFh5?=
 =?utf-8?B?Njh2dzlGSjR1VDF1anB5TSsydUs5TGJTbDFBQ011TUJ5TG5PSmVkemJFYTdo?=
 =?utf-8?B?ZVlqeDRXeC9tbmRyem5URHU1MW1WbnF5K2tvbndudkFrM0NLSVZVRHgrZnkw?=
 =?utf-8?B?VXIxN2J0dVV3T010eUdYdlc2dWJaejB6dEliVUhnZUxIU2hGVXBmS01HbFcw?=
 =?utf-8?B?L240cEx6VndMZmtkRTI0NURUMzg4Y3VaLzdub0Q5K3BFSk1IS0ZEZHZQMEtX?=
 =?utf-8?B?dmZHZkVzTWRHOVZVeXRuNlhRcXJLMWJSbGRSS3FoVktrNGNzLzcrdzNsUTFo?=
 =?utf-8?B?N0xjYnB6citiVzNuWFU2bEVEVk9veVdTb2Fjd29GVTdBZjlCeHVRcVRJY2oz?=
 =?utf-8?B?K0VqbVZkS2ZIMjRRZGpaOEdVTU5IL3RqaHNrbEExUDRYODlFZ1ZUTllWem1U?=
 =?utf-8?B?UXk1S0JYdVJDOVNwSkduaVprZGhYZnFWTXUwb200aWJJSVBWYVVYVmE0Vkcz?=
 =?utf-8?B?dXVBVDJYaTRWMjVSUWcyemRYVHRSS2owQjRhdEh5a3BnakdDbzNiTCtobW9U?=
 =?utf-8?B?ZUV0TzU4K3ZYUFlSbzc3VFVMY3BIUVhnazJOWmt5U2hocFVmVnpVWjk3YWRm?=
 =?utf-8?B?ZmJHV2x0UTNJUTJiWFUzTFRrdnlTRkZ3SnZpMS9NNFVxVi94S2U1eGpLRzVB?=
 =?utf-8?B?OHBJY0RBWjh0QytDOUpvdCtHUGZnbUoxWG5rS1pZNzBrcCtISHpKQkpSS1Fx?=
 =?utf-8?B?aWxSYVVVc1pQbXhJQ2M4NE94VFJvV3lBSU0yM3AyL2Q1eWdWTzQ3Mktwdi9T?=
 =?utf-8?B?b3JZYjZKZk0ySThMSUk1QkZuREFrRXRpNkxLQlBpVEk5TVhqOXVxc1NqYkFj?=
 =?utf-8?B?RE5JNzNualY4N1ZqYW1DaTZ4S0ZpVFFMUVczcERMdThVN0V2amVZaGdWNU8y?=
 =?utf-8?B?eG9NT3lMQy9LTkw1cG5PS3RHRklXeHhUQzFzQnhhM0kzY3RXVmY5allteUlN?=
 =?utf-8?B?RjdUNnEyUEs5WW9RZmlwQU11WE1tdUFqNXRQb1MxNWZ3bTlQdW9VaXBQalhZ?=
 =?utf-8?Q?ufOAd2+jaL4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVBkUnh0a1U4YS92d1RrRHRpWjJwbkUwSzAvMGJrZkRrbDF3UGlUSC9GSjRL?=
 =?utf-8?B?UjdRRWx0U2k2TVVFNy9IazJwczFIOXdFSlRYSmpBcFFHQ3doSU1FUWFOVFJq?=
 =?utf-8?B?Z3lmaDRJVXowTkY5OU9RNThwUFdBUWd3d1FGdnR3eitRSHVYSVRmbEV6aTZZ?=
 =?utf-8?B?c21QMjliNlVFbEhpeHBsS2t4allKZ2c0eDNvM0N2UlJTcUN0K2dOeGo5Ky8r?=
 =?utf-8?B?R0JWaVNQcG5RME1uVmlJTmlpdGRqWGNjam9jYTVhcjVDSTNBcEs0akpBOHc4?=
 =?utf-8?B?aGl3eVhwblo3dk9QV2hzV3pzOHhHMWs3M3Z0UTJ1c3VJd1ArTkgyendQMmE3?=
 =?utf-8?B?OE1EWDZHRWQ5OVBrbWRGQ2I5Q2dTeUtBZ1dmemtVRmhEMjlVby93a2dOeElO?=
 =?utf-8?B?Vnp4dGh5STVBZDV0cTVNM3dFYU5udnJqY0o5TkUwVGVMV0ZMeWxyUW4wdjcz?=
 =?utf-8?B?YnI1bHRtamE5M0YwZG5ycy9VbUtLdDF1U1hNcC91bmY0aURzSWtqOHNlUytY?=
 =?utf-8?B?YzJYMWhNOWhZaEhjcGJrZVNYaWZsQ3pacDBIblRFWWo3Y2VxdlpVWHpRZ21r?=
 =?utf-8?B?RDlET2srMTY5NlpEL0NxVENLSDh3SlFDSWxnTk9Td3BaQ3FMeW9JTG5QWVNO?=
 =?utf-8?B?WlZyRitZdGM3QVA1T3krMW1hdjNQTnFEZXlMVXJHMkI2Vkd6TFJLUHIxdU9h?=
 =?utf-8?B?NjhzQUFFU1Z1UlFZMkxXcWs0cDJ6OXU5bkpVVE9KMjRWUXVtb2tzL2xSR0ts?=
 =?utf-8?B?REFxRmttZTE0UzEwRzROcTdyYm4zVFdqaVVpMGduUVo4WHV4cGtNWjFYRGdq?=
 =?utf-8?B?NHlSMEk5M0FtTzNiYTBZMEhWb1ZCNTRkeDlZT2N4WGhvVW9iT1NpSGF0cU1Y?=
 =?utf-8?B?K0pwQk1ZMkJtTTFaRVZGa2JGVXVmRjVDR2VkdGR3dC9qUTFHaVFGL09ucnRV?=
 =?utf-8?B?YjdxNzF6TmJ5NEdvNk55aW9DYjltaEh1bFdGTzR3eEJYOGtUNWt3R0x5blBP?=
 =?utf-8?B?emNsTjBDMmllNHYxcytkVGRlMkF6TnZ0elRnMFp1UTVrYlhPVXIweVBxcWc5?=
 =?utf-8?B?di93M3VjaFFiN3Y2c2JFSmNQUStnSFFzR2wzdjI0VGZCZmgvN0NTMzJubUhu?=
 =?utf-8?B?Z2dYVHVUaDh5UDJmRGdWNDM3VmRrYnV1dlQveGxmb1ZFQmNjelpsVk1BbEtt?=
 =?utf-8?B?MmRpcWpCMS9pRWkvd1pYVkVLUmRNdHZ5ZnJ1VVBkejhTZlUxenVpb3Q5b080?=
 =?utf-8?B?QzE2SXJ4SlZYYSttQXVhMHdiNWhxaXlMMC9reHNGZ1ZVc0JZSERxVHhxQlFu?=
 =?utf-8?B?b3dXQS9VK0ltREpUZkY5YmVOcGZYa3huVnRGQk9Wd0s0WjIwaTdTaEZjSE92?=
 =?utf-8?B?L2ttVFZITytkZTRWb3hTdW5QVTBJR05aVWN4Nlh0bVI0aU9DMTZIUkJNOFJu?=
 =?utf-8?B?a29xZTRuVjFEV2p3SklnVEFjKzlRNnpjUGtVT0ltWkJzQkRrMXRVWlZSWVNO?=
 =?utf-8?B?RWVVeCtGNVdUUlVxSDZIYVlxSXgrMkd4UG1nNXdTY3V2ekpiMEtVKzg2aVoy?=
 =?utf-8?B?K0Jocm5WV21WMW9ReDRzU2ZiZHdaM1EydTZnOUxSWVUyNm0wOUdXZU1PTFBT?=
 =?utf-8?B?REhPMmFZazlWRlVVK21BUkF0MjdnaFVocks5YktremJtZHg2VXdsQ3lwZHNS?=
 =?utf-8?B?MzJuOTJQVDI5WU1hOGk4Q3Y5T2hMTGROU3NFNmxBUERFTGNKVlZUZ3I1ek5P?=
 =?utf-8?B?MkcreVZibFhqMFAyaHkwN21Ub3h1THVsekxyNVlIZy80L2ZJdkE5aUx5L3Rs?=
 =?utf-8?B?Kzl3dXNTREVraHFEcTNBaTA5SHVHL1ZEMUR0ZWprUW4zOWF0Z21FZDd6bnQx?=
 =?utf-8?B?cThyRHFzWGJVYmxIU2Q2Q1lmbDFHZTRIdGhRSVA3VEV1MU5OSWVvbUNpTFhR?=
 =?utf-8?B?UEl4QlpTN0RtL01pZ0JLZE9uRGFWbzdRVENlcEE1Q25scm9PRlhySHhnSERo?=
 =?utf-8?B?c1hRbnRQTGFwbjArZHNNRCtkdVFGTmZxYmMwYldnYkxYSDkvSUpVNS8vRnFU?=
 =?utf-8?B?NnE4K3JGdS9OUDlBeVVLOGZEWHQ5MWpZNHJMVGhQK0VyMUwzUjZYeTVRb1Fx?=
 =?utf-8?Q?0N+qXzF2FTm9tEA0BiEmHZ0e2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38d421f-1588-4ded-d624-08ddbb58e5ee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:14:24.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpW5dxRu8LuPsz2t3BPXgwGIoCF2r9GyudnoTmc5Ovajuutq21Qzy/BfYZ90Vnld0tyF9hlPGq11JP5dVB+R6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9526

On 7/4/25 21:10, Mika Penttilä wrote:
>>  /* Racy check whether the huge page can be split */
>> @@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>  					((mapping || swap_cache) ?
>>  						folio_nr_pages(release) : 0));
>>  
>> +			if (folio_is_device_private(release))
>> +				percpu_ref_get_many(&release->pgmap->ref,
>> +							(1 << new_order) - 1);
> 
> pgmap refcount should not be modified here, count should remain the same after the split also
> 
> 

Good point, let me revisit the accounting

For this patch series, the tests did not catch it since new ref's evaluate to 0

Thanks,
Balbir Singh
