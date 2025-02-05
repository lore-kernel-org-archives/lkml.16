Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B3188704
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769702; cv=fail; b=PDKmXKPD3K/3Sr7oP+RlISQsSctb+z0CNwu6AMnzVHS0+7TOMpx+FUL5rzIbB542OYYHsI1zx8jlwUyEH/StK40DQSmRdW6zQV2FIEolnR/hUAQhZH2aMBy1irHb+6qd93wlTI4nPMjzhnfonO/2FZlGVAzaH97FUbXbSOaqy2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769702; c=relaxed/simple;
	bh=FmN5Y+c/mYWeakvygBAgUkMo9BJEVeXKmVBl++ZRaTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hhZzrMPAkF6jLeD5t/O7EB/nRMUKebuLzzBv4H0pg6kFnCGkW4n0sHJlWCJvuhN4jmVTPMwEvabSRQOjiPARfY7+GbKIc2Uo6eNjdLxa/ELEKcpj2Ri6cIecL2f4A7028/kbsrzzMEIvBZ+5OzVoZxvJq3JTVToyeEpoHxjMPzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YugMXiUf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kClKI2Yy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YugMXiUf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kClKI2Yy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRRMC012754;
	Wed, 5 Feb 2025 15:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=X/ahvmrKRLEHK4Cxn+LfU9YqyA+vaDLuG0DNfPzkJYw=; b=
	YugMXiUfI58fmWaFxYmYeFbpkjz4Q6HVGVZ+C4e6QlVJj/OvcpPwa7Z6lB6ij+8Y
	2A7J4v+cfMqspgX98SCp1s/0W5yZLUcZdZ/aSA0nPYpRiy0B0UErbg+Z4UUbogdc
	XkMhkbMuOxdwoKn3EQt7hHliBH8O6lM8EJGJitaIbOWKjtPxrxW+s3izwO1L1oyh
	SWJGmgY1ggmcg81KnHujS/57RAMe8lgLB8ltAN3/Zzf9JOq4B06R4UQNLHNgyxVN
	WsnIrHfjm9Suq44OBhGMC19ulwKBcVzu4RY1Xz9ATEGbgj8DjaGhF+xjAKTFu7DJ
	IkYTH9FA0r2zzKRaPwKzEg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kku4tkw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:34:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515EkDEs020782;
	Wed, 5 Feb 2025 15:34:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fqjaep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN3KEWchDwCCPXvIB2qblS7gDtlDNpEtSnBL1e83m8ZVEiq0tsQrYGn/7W3WA0sAtwKIxRaBxU0R0ch0sV3qyS5aPJPj4579KAhUXFqok0RMP80nHaLelm9DZYvnmnF3uO99tst4MelXU+6proPfRmrvhNScT/A5M+ZeE8cLzE5o8fiWu94tm3raCtEvkH/Ty2WmP3GwnRtFJcTIWab9McDVwCZ8nAO93XEOFl2m+AtSk93ztZqddUrwEpMWw+9ZMP4B5JB98c3YXeXe6KH6OJ0IsNmyHuB3Dpr6VoiO3CwSmnRqbbZT5mbEYe4c3vn3ayxD2WjbMKkLqfPwJEPDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/ahvmrKRLEHK4Cxn+LfU9YqyA+vaDLuG0DNfPzkJYw=;
 b=XLTXUSiw7gwF4l7zqv1yuJpKMo9v5/PsY4+vxa2ZAC3d9nRN814MInvG4NESZn9oWfiWrLK6abAzOK1OARG7EdIjNL+zljwG+ZFl1i3ZM27py8x/XSIViolMeumnTNXTxLn5kiXU1QuCK1IMrKaUM+cY7UsOq/BZD2o3/73AJGVKbxSF4/643DvLUPxv0CfzdMy83tv7D1kZIEm04mFVqWaQIg56EOFlJ8+KU8mY9jHnIxpJOPV+/Tg53kjqLRDHjZeufdzYkoJIeGPz18tf6twli+jiFPWtul/GdcG9LZvgwrbkyXnL8fFCVxIxP5joJo7XxeE6om0cjV0unKIHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/ahvmrKRLEHK4Cxn+LfU9YqyA+vaDLuG0DNfPzkJYw=;
 b=kClKI2YyakkKsjuCRpoAKRCzELxpFdtTCIjBRsn5mI3L0QRienufywbGEVVq84716mOZPlsxStEKbCqWgcsYBoKolJAmPKGg4h4cb3pGh+FPcUJ6RP/usaxU3o4s0FcKlDRABTr8c4km8h7d/9zfsk24CfGb9ymaRprzjp/D05E=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH0PR10MB5132.namprd10.prod.outlook.com (2603:10b6:610:c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 15:34:48 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 15:34:48 +0000
Date: Wed, 5 Feb 2025 15:34:45 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
        syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <74308437-2684-46d3-a2c1-c55ed4dde042@lucifer.local>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <9fc6212e-0f1e-435f-b7e5-72058f7fd6db@lucifer.local>
 <CAG48ez0DYnDKikFUrPQOppsW_-aa2_hcoyOcRJeCMRrEm6GVTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0DYnDKikFUrPQOppsW_-aa2_hcoyOcRJeCMRrEm6GVTA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH0PR10MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 031e31f5-dfee-4f8a-6320-08dd45fa9ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ni9qVFBSMVlTTWthb1pqeUVRNlVCRnYrU0daZysveG5GWXREKyszcXN5NGtM?=
 =?utf-8?B?VXZ3c2xzTWxScDgxbzk2SjV6bGhRUit5b09MZmRpZlcxSkNLVXRwN1N2Z3Vm?=
 =?utf-8?B?VlVlNXMzTGliYlZFQnVZV01jejRvc2FDMjBINXFHbmhJY3lsMFNrSjl0TnYy?=
 =?utf-8?B?MUpTTVhyS3hhNTd3M21OVVpXaElRYVloVTVvRFBEcHVpdzNIdEo3Y3FFc0Z2?=
 =?utf-8?B?VmdDVHp0UWsxMG10S3BQS1QxQnlzc3NTcmxHVnl5VWRsYmtKYU9LR3l5Uks4?=
 =?utf-8?B?bVY2bVpMbythZTdTRDhmUTY0cGJxMXZUSERQZmJIckptSWdiVWIrL2tYUSt3?=
 =?utf-8?B?QzdLZ0FVVzE1eEtLOTRLLzlldzA1WUdleG9WQndKQ1NGWTFZSmRwMjVoOEpw?=
 =?utf-8?B?VldFalZRTFd1dmZSdzVobHU2MXU4NjFPTWFJMjcwTGUzUGh3cFdHU2FJL0ht?=
 =?utf-8?B?QVRjUytVSzArVjZGcjJzeC9QbHdJR3pKOElBUVRuYVJsOW5lM2RId2lDNTRu?=
 =?utf-8?B?dzIwTUN3QS9FeHJZWGpGUzgzb0wwc0UvNHhMZmtvaVN2aTUxMUlOSTVCcG1H?=
 =?utf-8?B?MlFYc1BIR2dadnN3bXVSRlZPMTRLcUZJSDBLSzNydHN0K1dDelM1d3puMXBt?=
 =?utf-8?B?ay9YKzY4dWVqdW9XbHdqRlpGN3pVQjZROHo3YlRNait6MCtSMnVzcGJndity?=
 =?utf-8?B?cWZYQ2lETW5FY3pEdnFoVlc4bmhIQUhXbWgzKzQ1Z1JCcFFhR1drY1p4MG1F?=
 =?utf-8?B?NndkcXB2MkoyaFdRcHJCMzl4Y0d2S1BRUFlnLzJSaVgrSXN5NkF0dGJaZ0RO?=
 =?utf-8?B?L0JlKy9tckxTbXovTnRNWlpKdGRkeTRQeHk5Ky96eUxYd3hpZDNGVGhWMng5?=
 =?utf-8?B?aU5WRW54N3RnZ1ZJS1lSeGhOd1loK1dJeDNUR1RFdDRqTytNdFg2WDYwVE9S?=
 =?utf-8?B?ZEhadm9yVDhnOGNBUCtPWFRKUVBCbWxjRDVEaEF5NGdJL05ZaWJyZHlZY1Zu?=
 =?utf-8?B?Lyt4eUdzTTFSaEM4YUM3dmZqSHNXVlduaHp0Vitac1NISlZMMTF5cnFpVlBh?=
 =?utf-8?B?RW5zZ3oxSit1bDdVa1VzVW5XTWRxS1VmamVtb3R6a2xZcmtDdnNSV014V3Y5?=
 =?utf-8?B?U3ZYT0FEaE4wK1JPQkMxcUJFaGlqVm55MzZFUDBzK2o4NHJFV1lOWU5DTDBQ?=
 =?utf-8?B?OHZ6dkw5blNLajhrTFdjclRZSVZlS0VsQWRPZFJSWTkxSSt2cmgxQ3ZWaCtG?=
 =?utf-8?B?VFlPR0tuS2VGQWJyME9xQ3JuYmlRS290azBUUHpZZWR0YzY2WkQramZDeWxB?=
 =?utf-8?B?MGtwK1E2T0JJcmxzeGJWVzE0andEWXJTRHVha21xK2ZvUTJRZGVkbVRvdXBB?=
 =?utf-8?B?Smk5c2JXM05JMk1OSHN4STlabXpJNEYyWUxBaVM5eStBNy95dmY5ZC9qb1BX?=
 =?utf-8?B?dEQvSkdWVEp5SHVDbktJR0tKL1pZdFNQVUlxZVZ4YUdSS2oxSTJ5anBUV2Jh?=
 =?utf-8?B?YXJybmVGU2lkYUJkSGFlL04rWFJMVFB3TFI2SXBjS2dGeVZJaXNCeVRLV2xX?=
 =?utf-8?B?TUhBRURzUlc1anNkVjV1aER5YXV1ZkcvamxMVjJEK0R1RDBYeGZ0UXFhT2tl?=
 =?utf-8?B?a3ZOMU4wL2JOckZ1WjNKdXRoWWFCQVhBcG5zYTl5azlONDRTTDZNcUZZWE5L?=
 =?utf-8?B?NExoS3poUlVNbU1XWitDdUgzL05IOXFRWDYxeVF4WTVBZkpWMjJld2dNVG1z?=
 =?utf-8?B?OWFJS2IxMldOVFpDU3Z6eWNvUmYvV0tkMjZqMTVTZnBBeGNVaFJwdEhSNEQv?=
 =?utf-8?B?YXBRN2RVZDAzeVVhaURwa1dCSTFCQ3RlQUxSQndrTm9qTVFaRzhXcmltbkJq?=
 =?utf-8?Q?R9s1MqqvJuJY1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzA5R1FKYXhWemVCdC94Z0dOK09IWjZTREZKaWZDNi9FbDNHdjNPZjRkdnNV?=
 =?utf-8?B?Y0xDZXgwY0ROR3RraVVrOXlFZU54M1IxRXlRQ01SOTgzMTJ3MXNpRU4yRnBp?=
 =?utf-8?B?OTNlSjFaNUt2bE03V0NlU2hGdlUrZkovOTJXSXNRR2NsZUdGS2xnL29kaGlH?=
 =?utf-8?B?a2tnZXk0ZVVaNUlUVnBodlB5L2hNM2M3WjFsVWdsTktQWCtZaVU5V1gyQ3lO?=
 =?utf-8?B?Rnk1WVd3Vnh4RU43L2ZsRVRVakYvSEVuQ2hGZ1N2dEJnS1c2ck1HQnhSUVpW?=
 =?utf-8?B?SktpdVdCNmdiV2Y0bXk4dG5mMWlZc0kxSi9GN1BEbURFRyttOTlLakRLTmt0?=
 =?utf-8?B?UmxJc3dOd3hwM1J6bXpDWFRyL0hBSlJKbk5FaFRXSXZEZFRDY3BTRzd3YWtL?=
 =?utf-8?B?TWFtZDk3ZGxWTEt0MnpnalF6bExtS0RMYTJkRW9yc3pyUDFRT3orbnp1Z1VB?=
 =?utf-8?B?VmwxM3B4THlEU2ZxQ2ljR2MxOTkwWkZ0dWNwN3NCWUkrRFdlMzUyWDdCcW40?=
 =?utf-8?B?WUNKSXg5SWJJQm8vREtVby9Td3F1RG1vK2xLbWc5YitWY3FjbkZHcmVuQ3V0?=
 =?utf-8?B?dndCaWU5K3h2aDlKZjdFWFh1TmdqS1p3R1lSNmNydDc2SHlJNzhEM0U4a093?=
 =?utf-8?B?dzcwbWlXcmhWbGZmUzNUT0ZTRk5IOFpBTDd1Nm9NdzBUKzUweEhmTFNsZjll?=
 =?utf-8?B?NXNFMUFRdjRPUzgzMFZkeDJ4VkRJWW1uMGc0WEJMclRwYmltZUpPY2RmaWhj?=
 =?utf-8?B?K0g2U1JUeUVMK2pEbG45bDFhRHVWcjc1ODkvVHowNkFLL2RQdUtzcUhDMVpy?=
 =?utf-8?B?OXhvVkQ5MVduUWJDR2xIcTV3bzRUUkRmb0RXR3FMMXNTYnlkTkY5aVdjUDRF?=
 =?utf-8?B?M1I5eHVIcmtzK2FyWi9TZDAzVGYvdWIxR01YOFlyQWRla2xJNVVqRG9Lc3hY?=
 =?utf-8?B?WDFaREV6Sm9ZQkxKbnZkS0RteU5na0hqNW41RGZ6OVJTc1Eydk94NTUzVk1D?=
 =?utf-8?B?alJXTUhiL0pGU3d3MG00cS9jQ1BkcXZwVWdZVWhwVDE3NElhNExjOXlHSnc1?=
 =?utf-8?B?WXh0MTJFeVNhVzBhTHlYQXc2RjNtR0RRSTJTVWRMMzY0YlU5KzFLWVZ2a3c3?=
 =?utf-8?B?eXdRcFpzNVdISGNiZEQ4Z29rOXVvK2k1Y2N1dFljT2lYb3p5anpkbWQ2cDNw?=
 =?utf-8?B?ZmNFR2U3Y3B3VDFDaE52cGRKZCtyVmFtU1hoQjBOWWU5Ukh6VHpVNHB0a1hv?=
 =?utf-8?B?ZE1BQXgyeERsTkVsRnJ6WmlHMlBoSXBCRDk5Y2F2ZWdZQ0VDejJIM083NHZK?=
 =?utf-8?B?MUU1aTd1eWwvL0lHZjdaNnlCNjVLUjhpY2o4NVZpT1IxZmcvaW96QWs1Ungy?=
 =?utf-8?B?SGhTTCtwY052ZUxjV2FNN0k2SllMLzhEa0d2MlRBVWthaG90ZEVvMWg3RlhM?=
 =?utf-8?B?bDBFY0h0Uk5ld0JINW5peGhFdVZZcTZad1Z2dmcwT1BJK1A5VE96aGswbmJa?=
 =?utf-8?B?RlR1MHg5cWs1YWFYdmx5aDhCTWhWS0xyamtycDROalJRNTA2SDlkWVVwMEN0?=
 =?utf-8?B?RmNIZGFXendRVmVOR0dWbERjMDQ1UFo1V0pOTExYNmlldXE3VndrUmhOS2RU?=
 =?utf-8?B?Si9SQWRZdkFHb2E3ZERzODMyNXljUGsrWlRDQTZleDNzam9scm5CZnhOVXUw?=
 =?utf-8?B?c0RveHppMFNLNUtMSGh1YW5jWXdxcEIzOFJTWnlON0tnUFpZb2VVaUY0bUZh?=
 =?utf-8?B?K3E4RWhFbjAxNXQvakpZTDVpNmNWRncwQTZ2WEdlZ1BJQXFQNkhWakdJM3h2?=
 =?utf-8?B?TTZqcFNnR0h6Y1ZFT1VLVTB3b2JiVHRuWjBJZHYrSk1mTmRxaEdYZHhVRkZY?=
 =?utf-8?B?Lzl6RjJhU1lCMmpJUzgrQlRyUUZVcTBCalkvQitaTmNQQlBzQnNBRlJ5Zkxv?=
 =?utf-8?B?bm9pNzVwODhWU3VlYTJpTHBXNFQ3YWl2OFRScDZ4cUxnMzZoekwwNWdqRTVK?=
 =?utf-8?B?STFBMmV3c1pVZnpkaDFaL0ltNk5hK0xlVFZmejBhTUxlTFRUQW94bXMzNlBv?=
 =?utf-8?B?RCsrQVVqTUk4YVB1UkxPMXVqQktzbzVhUnlJNTZWbHpiTU0yVUZVVDZIdXJH?=
 =?utf-8?B?c1NYMjJ1czFxdHd1OFgxKzF6ajdCVTIzZ0lxbEp3T2VFZ3RnVk1yWWFXKzFJ?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VJXePVoMcsGH8H1HsEqU2pktC0kqBal49WS21kjpmOnMUI7MbwZYrKG2zPMq69qEouANH1nUzoqRH7Dikb+3HchCa+rMAz0Gt+5CuOl3f+miMqbReBu2Cgr6fDfMd+oNp12NUZw4jCPOF05KIr7Q+CgAWYKZXm4mncBxAYl9wxT5AfHcQ9L1iDlNlHgiWwP72+4u0xLX/SrHEZ1DsqYy2jPoug1WLwy04RbGscwn9TWYyaCRN3GrolOSVGQgWNyKT4v8j0v3BTabHYdFoD3K+2ycGNYekjuwKmr3M0sQRbpkijS10fzyjPQenZCZvj6RMoQu466chclbKejLxTkYOyn0Xt5j2x2QyXhN1+Gp1VayUuovPuZciaE9LTli07IT0XzpxO9jSXCTo7ATDIRSEtqyJ3PvnaZH9CC66ZLKnIXyFIxYEbEWB/nrDGILkNSBDGX7npKnTIY2OYNqB9SnGYMc1Ml+Ny4Jt0Kl144jaMGVZ617aZvgtvk6Ct2OJyteLJ4/A76ik9HRASi0ZsqolVgdsNjRtAZ4fbAlWowyhZQg53jwdEKinteydj3rB14BPCaRMbjWoevcYEtBIhdW3EJeh5ZEJznQ0ndqoW7N2/w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031e31f5-dfee-4f8a-6320-08dd45fa9ffd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:34:48.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6bKzUKIuRs5fDhcO38ZwbmXjhNUD3E7wLVyX4ArbvX6dkQtcKgcOGZPEdML34zoPRaH5o0rYaHecQu+/9HlyQizezVx6Ie4ggXlu74wN0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=496 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050120
X-Proofpoint-GUID: 64DiuuIH17nG_JfS0n556Vp1-9m1ibvg
X-Proofpoint-ORIG-GUID: 64DiuuIH17nG_JfS0n556Vp1-9m1ibvg

On Wed, Feb 05, 2025 at 04:14:03PM +0100, Jann Horn wrote:
> On Wed, Feb 5, 2025 at 4:07 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > On Wed, Feb 05, 2025 at 03:41:20AM -0800, syzbot wrote:
> > > read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
> > >  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
> >
> > Be super nice if these reports could show the line of code!
> >
> > It's:
> >
> >                 if (vma->vm_flags & VM_LOCKED)
>
> fwiw if you follow the "dashboard link" in the bug report, you'll get
> a version of this where the source locations are clickable links to
> git.kernel.org at the right commit.
>
> Also note the "syzbot engineers can be reached at
> syzkaller@googlegroups.com" at the bottom of the message.

But but but... I like shouting into the void! :P

Anyway I see that they're cc'd and sometimes reply, this was more a
meandering thought if somebody happened to notice rather than urgent. A
'nice to have' if you will...
