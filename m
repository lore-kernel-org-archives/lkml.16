Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18D1EEE0;
	Tue, 29 Apr 2025 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745901632; cv=fail; b=IppoRdOmR6kVJtLaF/SbOBBWU8WAY5dEV35I934YTuDsK/IRajt35OFn/efR1mRYuILsOCTQikdoG2ThSRBfqX7b38xXUT5KNhOlOe+SZb3B2sajeJTOyYQv0VLZ4q31v+OveUzqzKDC0TtRDHoDWCpkhTyEiOWpcSw1P8B+5vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745901632; c=relaxed/simple;
	bh=wsGkBG5TVpj5TV91rqNlQvSKBbMizbZxvS6N32JfLK4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SQ1y0n5bmEv0J4BDxygGlcK+/YaZ7AWxzffsWdoG1O4U9ydfCDMprkROLkRahfJcBD+HVe2u5DhJjBhdR+2wnrjRo86Od4X52hr+9NlhUkKzRz0vWu5ZppwXochFbTrFH0Ofrdl0H4Uf4D9UekFwsSajpVqX3OJkBJB6dCCyQM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kxnk6Lm+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UUEgw8G6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kxnk6Lm+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UUEgw8G6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4a7ue016138;
	Tue, 29 Apr 2025 04:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=S3y7VekM3WhkotBFOQJZhsxqkHhWZovFE8R8aY+afpQ=; b=
	kxnk6Lm+jjfF9t8Y86dpeD8Qh9NwBwWLMspCD9Hn2oi4RAE/YcUr16eRAoBIwI6j
	DTXi79QXwnlamB5WffApa8XgoKwxcKYpksnXEskzf102S04CY0t9L93VO1GaoLsD
	ItO5QTlAKfKbe10GXZAZ15l3gt3cghNor884OSPgVn5OUEdoNrylV31DDjf9RxBR
	zSwvf1KlDLftkSvOs8dDR5AFaOtMZy6o4QWj0cojUjvDK19SRydUSuTCqn29a4q6
	rmirXeIeNhwi/wKeKST4w7zZ6pKV5nUQN2EODalVTTwzia2Gf/pnWOH7K7zyi8pQ
	PYzL88qrRLf1ziMntR7DxA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46aqvt804a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 04:40:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T3t6lF011409;
	Tue, 29 Apr 2025 04:40:06 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011027.outbound.protection.outlook.com [40.93.13.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9tt6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 04:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmuDgMzNKzIDqf3jMecfrrdIPpu7y6cRCAg+WqUclc9kIEV61JZahjKn4PXfxbyNSmCQ9+lR0dix/4R2JtviNKLImeir69FTOAeeoX6bOHv8l4MKKSIfhX5kIkHwq7ycIhupx51oW8oM2w6EGE2F8T888ndc1xZcoGlsUfr69TRX+11u5J8Ac++kgnuibrpqRjczcK5AIB3pMawPS+r2KQpXsJB9nE11gxrSN7TyS4y7/dEwu5mBlqWFNlSuArdSFfxrNJOFhCo+NVR+ZfJAn+bYYyNTaBvtEaO/gyVxD9scRfXKUZiBvKEBqxnNaq6p94Od6gtjikv9ly6+FReeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3y7VekM3WhkotBFOQJZhsxqkHhWZovFE8R8aY+afpQ=;
 b=zAMcQU2dSmIDm4iPxrLpLaRpDL41Ncot+UP0TOsuoiPRywqwWNYwbYBuS/Nmh1z/d4CTRmuHx53dZkWaAJ1prCEzwE8cDZAx0mK1IUYkzpZk54U6Ik/bDTr/gO92cCNpQz0pbKBUsLKiBI8xw4ErJu2q5G76EqTafDyEz6WboQYnZ+cfmxNW2vB8lWm65jRW7GcVip/Y12Ft95hIpQTwScLePH62x/ynyYkQUm9nntqxDcMsXDV+1GVuW7EKQ3n8pC5oXbJCZ47qofLlOqacGwum2qx42/WNUG2zI2QaICpBh3no0FAMd3JLBuj2bPQp9a5//PsE+mLLNpF/ZThKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3y7VekM3WhkotBFOQJZhsxqkHhWZovFE8R8aY+afpQ=;
 b=UUEgw8G6j/D92ObP1Zj4uO6SX8ZTsU+1xC4vAlYJ+LHMqhi0gD14FqBqkZREYQyDJFCayn8Gy3+UmnEEfaqyv+Q5YFow8lJWfRKW70nbP0cAJ9S4wHyl8l50BCIkITQ9WccHW3GvDr5GAvn5KytnHQW/8BIzOcxbFe/FoqNZoFQ=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS0PR10MB7051.namprd10.prod.outlook.com (2603:10b6:8:147::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 04:40:04 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 04:40:03 +0000
Message-ID: <a18175cc-3513-4621-9d8d-e9556ede1022@oracle.com>
Date: Tue, 29 Apr 2025 10:09:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250428012029.970017-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS0PR10MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: e787893d-85d7-4882-e4c4-08dd86d7e8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cURFdlBZU0JEc1NGZ3hGdnJndXpUTzJxZWVvUmE1VVJ4VndpODRkWDRRY1ZJ?=
 =?utf-8?B?bUcxY0NYbkhsSTlCa1BBeEJleXhoVFFpMWMwR29lc2dIZXpmUEFkbFp0WkFi?=
 =?utf-8?B?WkdNUE1VY3dWdjU2bEFCSkpXNWhYUGJQcm1CNWhZUkc1RkczMDgwMWJUakpJ?=
 =?utf-8?B?U21zUG9pZmdOeGVlQjFYWlVTbFhkSUVubDJ1WEhDSDN3WnN6QkVoeTRNTGwv?=
 =?utf-8?B?OGhuUHlyeENxQ01rNUEzYkxtaDZUdkJLNjJjL3RCcXF2eFJsanRaQVhMbHRj?=
 =?utf-8?B?WlhEMWJJK2cwQkkyaklSZlRmN29ZYjI4MEFNQ21LRFduWnoxSnhvb3J3U1RC?=
 =?utf-8?B?UnFISVVFdE15c2ZFb1VET3BUUWZDbXlpdmdiT09YWHI5dEdFZTNPODQ2MFdL?=
 =?utf-8?B?bDhmY1FtdllmVWtVS3k0RjhhUUR1bjNrUGtEZU42Y212VlJaR2xNUXhqbXZk?=
 =?utf-8?B?NUR2M0FES0RHWWg1S1RpRWcwbDlub0FESGpxMmRqSU1yTnEyTVpnRWhHNGVY?=
 =?utf-8?B?YnRHeERTbG1IVk9UR0dpOXdPMVN5Ni8vZWdSZTZNbHIxVFk4MXhueFJXZzdh?=
 =?utf-8?B?UVhKVWdwYkZSNW90SHhmWWY5SXh0OHkxM3BVUWJpbUJtcVcrd0VkdUxmQzlI?=
 =?utf-8?B?dUpYMVBQSEtwTTdxUG5BNDVBLzI4VWhDSUVMSHBLMExFbk1wRnY1andUMXFC?=
 =?utf-8?B?OWloL2o4Z1JHWHNUN3ExUmN0VndlTnNucG1sQnBkLzZwbW9mN0J6S2hJc2k3?=
 =?utf-8?B?QWxzWUo3STdqRjVlT0F5dFlGc05nbW9VL0FibSt6bUNEbkRtVUc0emdLV0do?=
 =?utf-8?B?NjlVTG5vQVdJK1c3a2FJaGZjQmVST0puOUhmY0Y2clRMT2NJa1FtcUJuQU9x?=
 =?utf-8?B?WVNZbmN5M25KUFBKaGNPTU5aOGxseGVOODZsWUZpSHhzOVEwc1VEMXFuR05a?=
 =?utf-8?B?NTZ4L0RMa1FqaG1MRU1mdGdKNmRkK0NYazk4S0NHM3JFczBwendJQWF0WUNM?=
 =?utf-8?B?Ykp4VFNSRVp3Y203N0Y4TzNJYnBXNk5nTVByL3ZBMndWSlgyb0tmSkV6WmJa?=
 =?utf-8?B?YTJqMmo2aGoxa0gxb2VBZTN4MVhSNk1CTDdyNTdJUGRzTk42QXdVNGordlAr?=
 =?utf-8?B?VWZWOUZNdit0YW9RMEVxa1lCeGdXdlpVUWNid2dXMk1rZ2ljR0R6Ry80dm5U?=
 =?utf-8?B?YjJmYTZZV2xTWU5Tendvc0VQM1M4L0M0WS9DRlIxSVpqZlNEbUE3NjdiZkxz?=
 =?utf-8?B?Mzk5d1R3OXlJTVd0Wk9vdW9PRVRzL085NzNJcS9Kd0dmNVQ2TWU2M2Vjc0lj?=
 =?utf-8?B?Y1JyekhZRVZybTFPM2FlMXk3TGx2NVM5QzB4RFFMeGg0ZXJaTXpOZWg5TXlI?=
 =?utf-8?B?T0xsMFA3OW1ub3EzQTJFKzNiZUJLMFZMTHUrYTAvSkl6NXFkaWJacWZOdTZ0?=
 =?utf-8?B?RXhoaWJrY3M5VGVISW1qY2hFaWJYeFR6b1QwRmJrRGV6SGN2Y3kweEVOU0hS?=
 =?utf-8?B?eEgyd3Bvcis1L0xtUUJmeEVvNXY2bC9QTkVpa2dFaFZDa0d1Y29yZ2d4a256?=
 =?utf-8?B?Vk5JanVpUmpORDhEUlFLV3FqdnRLd0ZkQjNqSkZlTFNuWnZUSTdYd3kvLzBZ?=
 =?utf-8?B?SXlUYy9aSk1FaFVQVlk1V3pXRUpxUXgxM2U5d2xVVS9IM29qUUFqSEhPdnBk?=
 =?utf-8?B?OEt5QmNHbXRYWjhDNkptZW1jQXdreTdaSkd1eGEvSjV3MVVhRGJtQWluWWNI?=
 =?utf-8?B?aVk5WjI0Q0UrL244WnVmLy9qb2NtN3BFYzdqQjVqeURySk0vUEx0YUw1Qk1y?=
 =?utf-8?B?VjBsRVFLTlF5VVZuWWVqbkVjRHhwL3owSjVGbWJKYzVab2RXelJ0VXY5WmF0?=
 =?utf-8?B?eDZOMVhMSmV4TkVhR0JPUFdJcTZJQ1VLYmxSZjVFWXU5QXlFaDhVcGNpdzJU?=
 =?utf-8?Q?trvp5ioOn7o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEtwb3ZUblRmU09BZCtkVXB0ZjZiVnNhWUh6OHNKQTcrSDdOejI2N01qY3hO?=
 =?utf-8?B?Z1lhMytiT2tPdGhhV09HTmhjZm5Kb2srLzZKNzdzYmpGZDV3TkYzMXM5cnhP?=
 =?utf-8?B?aktMQU00RGpnTlZrYXpKaFY4SG5WL3AzRDFCai9rU3hETmhvL29MeTJ1b25t?=
 =?utf-8?B?bDdvRUtMWmpxK01iaUpIZis1NldhN0Z4RkJzWDhrMTg2WEZTNjhldUFrL2xN?=
 =?utf-8?B?YmtYMU5ScDRGZk9iSFRyb0NZYWZMUlM4UkRTKzBMMmtyM0gzWExlYkhybVhF?=
 =?utf-8?B?Qk1mVldYNmtxOEVpOVVUZmdMNmprcnVyS1RPNDdDbGJFdWVoalgvTnVnVFM1?=
 =?utf-8?B?RFBEZTgzNE4wdGpmaSsxdzkxS0JvQ1k3Wm81eTdFeXRueWUycHByYzJmbWho?=
 =?utf-8?B?UU1VMklET3pyd0lybG5oblhNOGdXcktPeHhweGlGeWVJT3FYbnlqa2FuMmRD?=
 =?utf-8?B?TmtITERENnl5RjVZM1dRSVVLK1pET2kyd3BVM0hROGEzaXRGS2wvQnRSbWFW?=
 =?utf-8?B?bkNkUFR2Q0QxSGlpOERyV0lnVXVMcGVLSlpzcW52TldtN2JuM0tydHlqN2hC?=
 =?utf-8?B?d3VyZkc4Uzdmb3hqVE15cXVpYkxuSkM3TXEzTmsxKzhyeTdoWHJId0syRmJM?=
 =?utf-8?B?NUZyVkZqSDZ4Vk9VMi82WkVod1JYcmMxc2NzYlhIRFhsaFNFd3VNV2toQlVi?=
 =?utf-8?B?S0xqTHdVcW9XL0ZQd3FZREJSeE5GdVUyTGM4MUN4VDNTNTFnQWJFaUhsQkpC?=
 =?utf-8?B?QXV2dXBEMW4yajBaV2k4SndxWmZNK0w5dW0wV2JxeXVSc2xyeklhVFcydDV4?=
 =?utf-8?B?Ym5EZ25ETHFVVFNpYzlXbTdjZDg5NjdlYUk4UTRvSlpjUExRQUswSXdjVDNE?=
 =?utf-8?B?TjNBcG5NeUxpelM1VFBOK0Jkd3JHY0VjWS91U2FPSGNJWGtkaDFJV3ZVVDV5?=
 =?utf-8?B?WkkzTmp5UExzNURQcXZNN3pLLzdhMWJPN1FDeGJyR2J6aWErL2FwY2xFRG9p?=
 =?utf-8?B?N2Q3bUZaSE9HYTZxTkViL0llSnVUMy9FTU52V1ArQlFaaXE4OFBOREJ2djl2?=
 =?utf-8?B?ZW1rZXZRY2FCMDRwMjB2OXFsWGtjaGMycEpvaW9zNW5sT0tQZFdHbnZuNGN0?=
 =?utf-8?B?RHVBZ3RibUdOK0hPWm5UMEF3aVQ0OEF0cFVsU1pHS0RWaUtJc0R0c3FoQk41?=
 =?utf-8?B?R0FSMWR2cGxBdVpBSlQwcjJWK204RjErOE5LYVMxNWVzVXR5UGx6cG1KZ3R4?=
 =?utf-8?B?YWlvSy9tNTIvWExIa29DNGZlNE14M1NSVDYzQXlLdS96b2V3VzVqTFBiNzRC?=
 =?utf-8?B?dXIrTFEvSTMxSXBSK2IvRDNTMmVsMTdjQWZGRnc4bC9LQTlqRU5KUXQwTkcw?=
 =?utf-8?B?MEtKbnJXK1l5Q1RwRDRYaTQzN0hOL2E2WDlDUzJ4RnN5K05mcFN6WUJwRW1p?=
 =?utf-8?B?aVhLZ0JvOEVVc1Vrd0kvSTR6RmljejBXZmVSTklhd04vcVR0aC80L05sd0pN?=
 =?utf-8?B?WG4vYXA5d1BrbFcxbStRUzNSWVExNnlEUVBCUE9TdEhXWmlSb2Rhb1dHWGtQ?=
 =?utf-8?B?UjBwQWhvLzRCZVVOYWRHa1luQy9sMEJPU2xJWGx2WE5IdTJGc1RtWERPclBZ?=
 =?utf-8?B?WUJsT2tyTDdXaThSdy9hT215azFWT1Nkc1R4bndDS1lyTlNYa25aY1BUek1i?=
 =?utf-8?B?R2xEbDNxR2MrdE9vQmZiUEIrUXEycFBhVEF2RDVxVC9XZFhkci9aL2JJbUlW?=
 =?utf-8?B?OXM0cmdQYnBzU2pPTXhCbG1rNzVjcW5xMVB0ekhzYjlPdzh6cFczU0ovNzJZ?=
 =?utf-8?B?WHAvUEFvTzJFQld0U0NjSDJpa2thd0FnVk44MWVVM2NSWjd4Y0hSQTRPYzRh?=
 =?utf-8?B?VXdMakVEK0JwMC9qS25QZFNxcnBiQWtBZnlpV2ZKd2QrNUNwMWw4VzVPSjh4?=
 =?utf-8?B?bWlGblNsVUNLbmRJYnlmeTJhT09kelhOVkN0dkExV3VFeFZ6SWZDaWx5RjFC?=
 =?utf-8?B?VXdaYStnVFRyVlY4ZXJyNE9acW9wbmpyYi9SRUQwcEpsb3VmYUx1Z0dLcm55?=
 =?utf-8?B?OGd6T0FnM2F1NXBXRGJ6R2dhcmtHMEk3Y1RFbkNvWFNIZVNZc216MXRFSEx5?=
 =?utf-8?B?ekk5ejRLSGprOWdzQUVSUXorT1ZTYi91QkZXbzNoUWZ2QWtVLzFDWFpRRkhF?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMXqONJVon9gtRIkdozVt7avhOH4kL2MUGMsqswL1CMVvjmbw8ZUOTSGG678vVFXwmDSx5LzTV5BWvoDdCVAQF1stIF2MPUlPl1TFpjC+F2JkCM/ETHQCDhAL3B1wZ0xtTjro3YCPTRLyYglQPxWYJoaEqJ/Uix+tIiA9EcrwrJl9eW/mvmhXdXsxAzveeWtpKWvl+DNPegAlcjBSaKl5xLNSHhs8HPSeODgQiypta2qJ6RD8Onj1AI3JMZIg6on4FXn5CJuOJlSvKHqczxiSPJKxx++o82M1hfDRS0w13Iw5RyvP8gugazRAUWMnr3qYA+GsbWHZ6krW90BhLZYTD7GCAtd4UP99t0+hVTO6sDLtpgZa/XM8yfwsVWgbAYe4FBr+LM3Y6/SKHbmoQuc6G8hPOsAJ5jPCDAUWWLpU5FabawvOuY8XL3vycftTmscwKTM+SIiqSn+kNEFbeUfNyoBLwBgzLqgXInGKIpk9MicjGMCSMpj0lh0wRNw/fobKYfteBPK1Olce9JzsV3kKEnIg2fIM1afVEhN3S6C6ZbN61RikJm8sqyb76f9yH5+h7rZZcrr4PIM4dDneYKGAp/PjwrXSAeYxstMgntGHgA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e787893d-85d7-4882-e4c4-08dd86d7e8a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 04:40:03.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FP4c2Jbzt3YUwQJB9xBj86EJ+Bhv5W2emJIVjjzshSoE/VtqH1jKIPuSlYhY1glg7Zl1HTO1SpGFPwlyLAd9jLFDBvNrXdgm7ddYjIj0sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7051
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290033
X-Proofpoint-ORIG-GUID: 4qwIwA6yExG5x_wUJB2_zP30DuBi7Y5i
X-Authority-Analysis: v=2.4 cv=NPTV+16g c=1 sm=1 tr=0 ts=68105827 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=ZE1JG91w5hGI06fx75UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMyBTYWx0ZWRfX/++g+RCHao33 QvyXQM+SFA0YSzB5FCOgM2lQ1sR5Mo5bNlmBROPhlhgiM6BdR6jbHRgXyNAjpMtiAANVC10T5D9 3jJ9H6ChCTgQAJP74rcDMdhVuYc6+kN3a0ynKkKbdgorEPIGUm1KJi1A+hI/Zfpt4qtRzK7Nkwd
 M4tPq+ogTPChHpJWXPMB5uhDv2R8GldEWhcTZExtCP98I/lESLYxsw3VmSEjHTtiFV1siuCcCYk OOoLXtMg6EBA6xZChjWMv+RQfSr1vW6GYLTZFeGpU31pwqDd4NgHRN5zsBbEAN4iSjuAytyMkb9 q+ziqqyYFKih/NKyN3OyF17gezVDLI/gbGyOOVj4zaOqGJ4Z5z0O+GNlPTvsy8VLfXsWz0RlXHD HIQTH4qs
X-Proofpoint-GUID: 4qwIwA6yExG5x_wUJB2_zP30DuBi7Y5i



On 28-04-2025 06:48, Derek J. Clark wrote:
> + * Determine if the extreme thermal mode is supported by the hardware.
> + * Anything version 5 or lower does not. For devices wuth a version 6 or

typo wuth

> + * greater do a DMI check, as some devices report a version that supports
> + * extreme mode but have an incomplete entry in the BIOS. To ensure this
> + * cannot be set, quirk them to prevent assignment.
> + *
> + * Return: int.

The function returns int.
But logically it's returning boolean false, true

> + */
> +static int lwmi_gz_extreme_supported(int profile_support_ver)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	struct quirk_entry *quirks;
> +
> +	if (profile_support_ver < 6)
> +		return false;
> +
> +	dmi_id = dmi_first_match(fwbug_list);
> +	if (!dmi_id)
> +		return true;
> +
> +	quirks = dmi_id->driver_data;
> +	return quirks->extreme_supported;
> +}

Thank,
Alok
