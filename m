Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CE13B2A4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203399; cv=fail; b=gw6gCZEJUpD9h+lE9skRl2wvljTTXcfwQbLYyIbT2IHb7oL8/MR8w3g1zOlraO6mND5Lxg4vulW3VVldKyPSDiFgoLizdTUhW0ENTOywB3JVk3s25gPv6wJCYZA2mukymYAocg5wbDc65IjfLUsoQolFID342jdvXPirNotkH9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203399; c=relaxed/simple;
	bh=apnPGc9hD+zPRQMqfu6ZjzLY7n7iepmwXr4gR9q9W6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hYdHHVcrS64JlSUJo+EeKR3AYlM7S936gHfjs3ZO8+L0K8vhdUV6vjwNa6CpACA21FcnVbijnnOzexwnkvlkN9Pvo8N5Jyt4p0lJICKz9BeLMc2A1v0kQBY2umeDR4LNGoBoKVv0QfTy2Z2rgFmBmY6I5bckBtE0N5DVsu4/dQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YB8tBlOd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yWnMby0j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YB8tBlOd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yWnMby0j"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NI3r028785;
	Fri, 6 Jun 2025 09:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aiTHPi41M5uyqgqdpA
	uI1PwyGUv1RzJoq80AEPCErDc=; b=YB8tBlOdhhe2G2mGIdpswyE9nwYjaJHXNG
	jTsFpsJg0dhbTamlnc5NY2yyXv5cmN6yEEyQZo0yHZ5+473LDerDsZFtBgp0w7oH
	2tvTfio3KjvGADv1sFYfvHxanmN9zq+ybNO13ETRWG5+beyqgomv1e4u7dPRHTN4
	OaZqSepcdFJJjVYMEyz5aOi+MpjmJDvtodxDrACk5vSkBF1j7F2rENiL4Y8deZKn
	/rm2iG+8rWUlq4xnqP+D8EuSUgZXovTHyWLfBihNc7I5fXI/0XLRWjb6euHL25Gp
	WvxMhPY6RilQcWMokN0jwN5oAzdakwR2vbxzbOY5Lbb0fFaWCRnQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kfsmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 09:49:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5569QZkU039442;
	Fri, 6 Jun 2025 09:49:30 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d4wx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 09:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY2rW74YtOEbmMWPiY/RjX03n5z5Wmg3iiYSqcm1rsCMtDlfALCgwxpUL3K+K4ap/E4+ApokaM66KhRNgmO1v95r698Vn4o7naDw1ZJdh2iholJWHtlFy++gLls0zYscmQshGjqP5UF9D6911SFM/+TNgv7kfyQa9sZ5l4d7h14OYPlisMoehH4CQI009kxFdO8zJ/7pK2DgDb+SpBs6bK+2NVKesT3yifXlYJqBoE5F5isjPd7YiIaLMo633bhZC4cbvgm7ecdfE4ej5grI8Qgb7QQA4cIQUEnhzKcBW4Vo4ALbtbnKBn8dYZpP+59wzpAhowFhzPtEuWYiLVDr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiTHPi41M5uyqgqdpAuI1PwyGUv1RzJoq80AEPCErDc=;
 b=sqTVLF1MDbTLmA6mf3EBoHYvOE77cvlcdNQ1qTqd789+pxtzqdrLWtuk1+b5UTghWNx/v6aQ5L/MjgC5c3cNYA89lQv0Pxt9oJOY/mgomuNwjtVakocSQktRdoepYQBCiNQvHaG2OHn7WRltE2F6RJDieP4UMKf6UDG+igUajpG7d6AwS+P+V2EU7SuZqZTUEFlwMQFYN7Jwq//FNEMZ2Kj6p+Te812PYKQMLqN/eL7VygqMAwXem/jhqz2Dl4cxYg4eh3pIsmvbq40sLkwrG7s5/2yTwmHCOQltvUjQUUJtQ0UcqhIilGtJdft+pJLpZ6SDu97YIf2b3WoyB1lG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiTHPi41M5uyqgqdpAuI1PwyGUv1RzJoq80AEPCErDc=;
 b=yWnMby0jXgvff1HQiYszMjA2IBiklHziigCv+GCSoyP36Rcjm4DvNQt1tcCf3jvsCw44uaWe90CYmNdMKhmIDE0kKLYMfzkgDDHtJziBv3U1R4yB4nS62l0/jFyE/NjAeCwa1QgvHW2ZYFljM87LRGZqMVY+Oo1nHAdrUE8XrPg=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH0PR10MB7063.namprd10.prod.outlook.com (2603:10b6:510:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Fri, 6 Jun
 2025 09:49:26 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 09:49:26 +0000
Date: Fri, 6 Jun 2025 10:49:22 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
Message-ID: <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530090407.19237-3-dev.jain@arm.com>
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH0PR10MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c766257-da34-40c3-8b9c-08dda4df6bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XDGIbOz6P+54ZLmz2k5CeyfSDDMBkMawrnysJ7lciSeO23mKJIDph8Lu7afH?=
 =?us-ascii?Q?7CSkZUVNwROikNG5+tm5+TvW2jDwcipAbsqBT7LsZiMCU6SxP+/cK2xKvL0F?=
 =?us-ascii?Q?bMRuB9qY3IO8F5LsLWGFjz37jqrBQDCw3CeE3LrsHIU0+Pwj0D/scW40fZSl?=
 =?us-ascii?Q?sPDVhIgfue/dPbAu0e6Uvp/nbqkBoFMrfpc+t4DmptK85YCeLzSbimtxyv+M?=
 =?us-ascii?Q?DU94qzEG91moAczI+9gMkBPxnh131DrFZJg2/lla+13987tXkQj9au+yZ3Wl?=
 =?us-ascii?Q?BAyBKYwwHRv13d+kW21Dhl/0u8DDEDvTuDAUlj0yFFrYKMnUTVCjceecuRqY?=
 =?us-ascii?Q?Xt+d51ILrbWlLBsf3NXIRXBg++KADhVP2+kWjiAn/mAP/Vm5GnMJut4+X58T?=
 =?us-ascii?Q?fLIsjcVoFUCgol9ZXWik3WyG3I3UBkMXojuIQ1nfucyu3I/MPhYCyemcqpZn?=
 =?us-ascii?Q?RRt8J3AVRD4479iYdDS99xm0HYH0WeVYHZLQQ0qT0O6OvuG7M6xhBq6VPU8h?=
 =?us-ascii?Q?qiZwcZEmdkP5NKuiXNZM+WvssHh4vH38DUwoKeDyJQt3U+5P6JgiQt0q1qlc?=
 =?us-ascii?Q?nOOQ4vnq756xkcf+jc4vRAcap5Xnrfp4amTio4xytpur3t3gELQwiLKCvqeL?=
 =?us-ascii?Q?Pd2NooYg1JkQJ73AA5k0CpV5A/kZUDLmzYHHv28leyajtuWfDytXURIUovyt?=
 =?us-ascii?Q?/JtwSMPPd3b/5x3cYe1slofaOmRI3QA/BGiQNabCa8nNkWZXjEgv/vhoxQkO?=
 =?us-ascii?Q?ULVBXuNJP/Eu1lLWUVam4E9zP3rkgJqXKnm6Oa+9e4hdGKRQcMdb59DZyMXN?=
 =?us-ascii?Q?GOTnkG/oAb9AJkW42i0WafELjD64z/7WHauGd/rsrU0cJdMIVNKJSx5U9PBi?=
 =?us-ascii?Q?qPFsuYK8YgYitzvhnzju0g7CzFVYVYz05roYbkmUu9Uz4ReSDe9mQqg0JuB0?=
 =?us-ascii?Q?x5OH/Jc6l8U443TxSc1x0T2ptBy5YSlU4TavnSczlWXPOrMRIx68TzqetNEU?=
 =?us-ascii?Q?u6xslNmk0MVuWN5Z8xGh1NPJiTggxMwO/K6PePaiVOCWa/jQp014eI90ssEL?=
 =?us-ascii?Q?/zAHKr+V4fOtJArsUrgdRXuObnyFXWMiFMPC5zt+OdcD4ACD5+uWB5tfTquy?=
 =?us-ascii?Q?/yZw4TlCIxsHfS5ayr6qcpZLrcLha+RzcBy5dzoi3RIPc2yCzFD6VMp+rKwi?=
 =?us-ascii?Q?Qm/4v7wUYN4uNQ+sIsii+CUaJow6bc7wE/FHpf8sVAndhGeVALCcRivMUYwS?=
 =?us-ascii?Q?AaqFRqaJ6QQQT8gclWJv7Q9wt5t9lVYOsN+BCy2tIicm49y4xr02PV14U1Lx?=
 =?us-ascii?Q?cgf5lkknhFjNeDS+ZTo+nBnZpPgxlF5iRHShLl5X+mRxqLs7dV7aX4LIsvHJ?=
 =?us-ascii?Q?rBxfIUKplwxj07jCo6oA3jaN+OxRPKVE6Pvv2AvKeIFvsuIeybiEhl8TBtfE?=
 =?us-ascii?Q?+EW2pmkbst0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfwGq8OnBopw6hLORpcar9NgU8Gs4FaEn8wANgkwdmmXQexDwIqF4uP41Af9?=
 =?us-ascii?Q?3BUUaOI9PNw3w3a+hHZAvwQO6fZGQLYygCy8ei+s4yPWAQC+tNnlNlIhZ1oO?=
 =?us-ascii?Q?tABcZhcysPu76QMZlutIpKEfyJGFg4kUvaXmblKXWMW9LX26v3ZAH7CtxSsQ?=
 =?us-ascii?Q?erlpxtXpSWkRdiERZlCK8mdxFj5AZ6vEtGYoEpjK01kPYj+i4HKUZR9egVux?=
 =?us-ascii?Q?S4lPbwmj0wfwkiaIhxhUrtqq09gq+XmB1JJNKf3WHolWXa/1UGS7CsPnU4pe?=
 =?us-ascii?Q?hiTN4WUvTdfky2jld9gTJZZh+ng0nG2K4SQ4TNGNhthGI9W5mlzVFjbntRJ2?=
 =?us-ascii?Q?uORyqCU+vnfluQfnRWBSo8ps7Rxqv4Wa5/ebD+qCzQa8GNbdwE8MY36TDg5K?=
 =?us-ascii?Q?UKl0Jx914RFm5SO7ucGOrPFVfJgT0wHF3fCIfxCpS5iBtBQWEnlGfMowtHIO?=
 =?us-ascii?Q?GQFULDwln2yCJKbedm12TVV7pfDMMXhZXZqSRO/EgLoYZG5c81FQIS7kFnmA?=
 =?us-ascii?Q?IPOsgnKPWLDSICdJhGi0l8JQ73HnYipj6NWySPo17NxcB60xIb8lz21e2X9c?=
 =?us-ascii?Q?wduHXHU3XWE8swlaeQb3gkrCPJudtx06hQQdcGPk2AdgAiGZySowHq4mPjU3?=
 =?us-ascii?Q?7SbvdZMr8uGlw7kJ39r1K/Kq9IGAgCDCA+LxFfoAdWwrJIq0PZweWYmcTfSz?=
 =?us-ascii?Q?oWJvEsq3HhCKq7Qg0NfXKPKeFbVYOUPq1bSmLg3+1egxi+qBof8eLH9DSlf7?=
 =?us-ascii?Q?k5AycG/5Mv4vaCz9Hanpx+YGrQwqOb8wJQFD+iUzARg5EKurfmIsouZ3pxKj?=
 =?us-ascii?Q?JFxEMSztFey8IFU9zkyoZbaeXWM3+WOLL8HjbqWQkV7c3Kr6dU0+4XxZRaIa?=
 =?us-ascii?Q?FWuh0ywUqKLIix0YoDCZpYDkLT6BbVCqhbTfJzuvpKFaACUc8CuIAEMhCOSG?=
 =?us-ascii?Q?etiqfX7sY22gHPJ9ay1EHUrnKrX3fFqgtn75v/OhJWugRZDmQCQM5v6QSJM4?=
 =?us-ascii?Q?530M5lLn4ijb95g2szU4qtH5gv821Amx4dl3BqRMUOZ/W1gqKNZQC7WrSkhT?=
 =?us-ascii?Q?85iGh5h8E4YjUX5WwK6T31zaR/sKRWYGHnTihIZ56JIA43hcIdwz2qZELP/e?=
 =?us-ascii?Q?YjCd8f4KjvWu0tjQkO9Pau0tjd3CBMjX21B1S/+W6cCzPl6p6OOpYGqtO4vm?=
 =?us-ascii?Q?kHwyzqOS3c4hIrEIzOxsJdageglTzTIFs90R7XnvJu/BJXKw+HhlGAf7VgHV?=
 =?us-ascii?Q?FwwwTVYarbX6F0mINPPMTEmp8t/uXf+Z/5Le+Uwxsqu+81/szQf6jw93Xh/x?=
 =?us-ascii?Q?9ZmUYjUxu2ezEyai7r6ybJvEVtXJiv8ioyJuUO/CpsYWvP7gG6zj1Ueg/U1X?=
 =?us-ascii?Q?97eFumfWEGIna/URO06PU+Wb9ax8I7uf1w5yGo+uRDmCV6V6IwVcxNtaWVlT?=
 =?us-ascii?Q?ahJcORUbgYwQJfGCBGqgaJw0UVXGP+UiArNOh9TaQC0wT170fSGky/5x73t0?=
 =?us-ascii?Q?Uo76C8dNaJ5jJjfsV6642Y8wiKcxMqC3RsXoDO4K+o3mjnMGyi/+ix54pK5E?=
 =?us-ascii?Q?tM6K0wFmgM9aGm4J4UoDlIeCTZAI6FH1pxh/bA9q1xfSBZ/+B5ox1DWiVUhV?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pt7SVIZVIeueYwtF4OL6K1fIGWhtBpUvgjM5eq3X7yR26WnvpWF0axHvwwanHEwscSTCsKk+VGRcPq0RjnAkznLeEf73nElXRmQPZzQXYi3PyomenS4oFVn8MwpnBkrXgyBDPsh/umNspHit7C6Lz8zIIqo3mz6H8xv4yU3UmJUhYgnP2KmjS7fJKmzhK0zPUPdzzHVTtEd/XeBEcHagj07B7lYOEwstKDrJ8WJcItaia96gPj2HWvgG5y+xcyWhPZgpByd8XSKgPeOwNmqDeSQDPfsRBCFCE5dlzE/fsJKdeTGB9uoZp6yF0YL8UDbgBQu374/8zEHEFaz7n8SC5OyI/AWyxNPDH+3nnwGBrlL/A0dXirf7Sn3OOajI57qIlu2W84QoFAlR6J1fsogD5yp6yQuGbTgwQ1iqpGjF4g/X2blFllESugVvmWJtJvmBoNLksMZMBjIUM/lwTl3+3S/3c4C7jiaF2R4nt13Vt5JanFvajUkfYszAi2jZ27mCDogJ+3udksipGK9K9P/N3IcWDE4egJ8t3uBa+DGYgKiBA9BPFhvJg2QulGDlWhV80cPOVbB4o6btwS924X5kXLPBUKgMuN12HlraHrWoMSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c766257-da34-40c3-8b9c-08dda4df6bdc
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:49:26.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPcigJs4Ig50ZzpDbS6Ge3D8iGrxIX1ooU3VBqUs+sm5bO7iygHikv8lq82qd60VZ9Ldb8304Vrd6JagQQR/stXiiRSdUyurPD7HC8crczk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060089
X-Proofpoint-GUID: CO2cNq-VpipxIERsRv_lJPy-pvykW0cQ
X-Proofpoint-ORIG-GUID: CO2cNq-VpipxIERsRv_lJPy-pvykW0cQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA4OSBTYWx0ZWRfX5JctetuRuKjg wZ8NCIpSR8LPa1C/59OrqymY6MWEa2rT5pH+8HeIiLUpCaA5V9q/IxTYprYTPO1P8fwor71WiHv ob4CfOyPxDLBjre0bYPJF/eIppuLzIJIRTY5zcJmK+Yi1NgcsYbmjiuY7Le+SkRT8ZeJw5/GYPO
 MDMCT09Mtsj8pOwsLYI5JZymUoNyvvSE6GUGn2ZDH8xgQ8kaGEsquWRZ4B+f6Fxshp+iISG/gFB o2feCOwt2YdS9aZiFbTwtpolHf3wtqSBAUwspRHJLPxXEAmjdc06bU7jMEsG2WyadD4kowqJ7f6 X0NOEknVGfeo97ZFidOuiC6JrwrjVvdugcPIk4qS7g8H/5ldl7LjM97OKCBS32ZBBCcvpZV+Kq/
 dmRx5hf05h/pcvIHB9mUfma7L/Mkq+Jm0cRDLrADzML4mjfvA7AaMWuB6D7uKkVUk5cV4Ez0
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=6842b9aa cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=kIOOWBL0crzjPrg8fIkA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22

On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
> Move away from apply_to_page_range(), which does not honour leaf mappings,
> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
> if a partial range is detected.

Hm a follow up question here - why not just improve apply_to_page_range() to
honour leaf mappings?

What does honouring leaf mappings actually mean? You mean handling huge pages?

Would it be all that difficult to implement?

It seems like you're pushing a bunch of the 'applying' logic over from there to
a walker that isn't maybe best suited to it and having to introduce an iffy new
form of locking...

Can we go vice-versa? :)

Also obviously walk_page_range_novma() doesn't exist any more :P
walk_kernel_page_table_range() is the preferred solution.

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 64 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..a5c829c64969 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/pgtable-prot.h>
> @@ -20,6 +21,67 @@ struct page_change_data {
>  	pgprot_t clear_mask;
>  };
>
> +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
> +{
> +	struct page_change_data *masks = walk->private;
> +	unsigned long new_val = val;
> +
> +	new_val &= ~(pgprot_val(masks->clear_mask));
> +	new_val |= (pgprot_val(masks->set_mask));
> +
> +	return new_val;
> +}
> +
> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pud_t val = pudp_get(pud);
> +
> +	if (pud_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> +			return -EINVAL;
> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> +		set_pud(pud, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pmd_t val = pmdp_get(pmd);
> +
> +	if (pmd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> +			return -EINVAL;
> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> +		set_pmd(pmd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pte_t val = ptep_get(pte);
> +
> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> +	set_pte(pte, val);
> +
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops pageattr_ops = {
> +	.pud_entry	= pageattr_pud_entry,
> +	.pmd_entry	= pageattr_pmd_entry,
> +	.pte_entry	= pageattr_pte_entry,
> +	.walk_lock	= PGWALK_NOLOCK,
> +};
> +
>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>
>  bool can_set_direct_map(void)
> @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  	return 0;
>  }
>
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
>  static int __change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)
>  {
> @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	ret = walk_page_range_novma(&init_mm, start, start + size,
> +				    &pageattr_ops, NULL, &data);
>
>  	/*
>  	 * If the memory is being made valid without changing any other bits
> --
> 2.30.2
>
