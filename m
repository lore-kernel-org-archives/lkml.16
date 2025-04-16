Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426011DA60D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812878; cv=fail; b=F6/uuiS9Wmp55EE/z8Ib2FZS9g7QPdjQ01dISXlat55dYAmsjGr5OIpu8ClEbwIfFezt60vDs+qNz/wCSWmQUUhyoyUE6l/jr8e5/XbeDdpziVfUBTI0ik3y4XlA3OMGq7ygN5sHulyme7CohypDhsuc+L4f8aLA4WGdjYlpuPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812878; c=relaxed/simple;
	bh=fgvmkuqf2DzEOW/HBVKlkIxy+kmMU4GP5+6x4t9XRvA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SRqH1cIAtmNHwQivYI+AJRV9s5Gu8YHARwVRQOqIClXyhbPe5lf2hkVyim0GIvh4Xu1QbXzOfAdcEkhZjWDwf8h9Q4nm5Q/R6Sr2yXAnoiTu9mH0Zi6Q2T6iyuJeXWOgT0aSCAuoUHhtHgE5XbqWfLDNCkGurTmHkptaPsNBIyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYROzgme; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYROzgme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744812876; x=1776348876;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fgvmkuqf2DzEOW/HBVKlkIxy+kmMU4GP5+6x4t9XRvA=;
  b=mYROzgmeoSjOvUkLv76O50l+CzrKMsTnuz556dU7bDfLpjRA0fORgD/c
   i2D3MdP9d4HeC71H2ToWfDq0z/8DSCSKbB5H3rb5beT9FrOxdf1GbHuYT
   YskE2WOaKxNGgDdNr4ZcvLdUVF3MBXug/0CcoT95QqFfpYtiDgI95kRC+
   kl71YnyGnt38au4dton+6w5D7Pj/1ODD5KHpKfZqmKbYhoso6D8wFljM6
   CfKPRUaJAQ/owialNJPfbwqBuwIf3dkBml8aK0ZybgqDwL4aNh1/jFTLD
   C7TV68e3lFSKtftS4giL80ijDs91T95AMOiL28yowHoeS2dwGtsrSBBjD
   w==;
X-CSE-ConnectionGUID: YP3vW9ldTGulUemdHO5bTg==
X-CSE-MsgGUID: nkONSzzyRti4GW2qidpwkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46528033"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46528033"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 07:14:35 -0700
X-CSE-ConnectionGUID: 4xh5T8EYTXaD9P2QiGOimg==
X-CSE-MsgGUID: NltQlpD5QriMoDBbEVAyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131401259"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 07:14:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 07:14:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 07:14:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 07:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLV++2XHFb/woVqs82tSfm9ZMpUqg3PBci60rdb2XbVVMhOQ/ZLQovW3lGPOL3Qyb4e0Al+fjSe7vxpuwrCvrjAu/mgx3algUNjmk1RWx9nhNItlCaWshUR/rLDiF0tjRH/TEYw5cEAZdTa74tQBrHD/WvfUIhpI84roYFrnvTeIrI09qnE26zeL8T9pOGhVwNzndUuFFaUFXfXEYx3an3XWxRha2bnBJR/Ju4Jd+adXLVJKuD8hHabnAgBDCoVp0AJ2B4H7aRobrgolmja9w4q2d81i/J6/3benuH04gCT9EKAciQbgUtDhKxuf76mQKk5jAw3mye5Zx5KmwCEFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLjZqN98fUxGKJO5DWaOSuvItUU979cMNG3u4G7Pnmw=;
 b=gdOxAEuatSshwLPRVW8YSGae6888N7iLElA2wVs1UT6hbzsHSlZ1ScgLswGSqPSeiP6Mq2EztQ4b8a3eo7Rfa0s+kq1S6XYJykmlf0XK2j03QOstJ9ERVIn+hCZdRlI49PlVX9oWouxayJj0MuFb+G0B2WhQnJvRBvpTNFpXAWoOciI3ZBMVy/zZiERtFTKizEMY1KzMfDgTJ0rUvjm2tc7nPI62KuD4PFcvoRxP+zkVEuVMKuLJrAPMvcSkI974LXQ+wwk6oPJX4kPEB0/bYgcumQZ7oMDTuED1wL+6YaptAmF3Tbog6MSyrC9qbT9pCeX+ZCh5SV37AlrIv1pOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:14:30 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%4]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 14:14:30 +0000
Date: Wed, 16 Apr 2025 22:14:19 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
Subject: Re: [PATCH v3 5/6] x86/microcode/intel: Support mailbox transfer
Message-ID: <Z/+7O6pYQ8FkD+Xj@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
 <20250409232713.4536-6-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250409232713.4536-6-chang.seok.bae@intel.com>
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3a5a94-bbb3-4084-b405-08dd7cf100a7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9yH2CWjVKuLL08/ZBIpT5ehn+K/NBo3IBfeKySiXqpgZ8KOz4u/lEQOCEoG?=
 =?us-ascii?Q?GLfgv/ESx3+8pIz48nBMgdU2cxa31BXOIuGbF+CbOmKLQKt84PTW+D/Qj68z?=
 =?us-ascii?Q?QRXVooByoCTQl7JHlbMZBIjWlMKqKvUdHw29Wx8/lmY13EhzBVyDYnnHiA+O?=
 =?us-ascii?Q?Id99Nlj2eL0FEeDt8KLw+5WsLC2FzIIaDEFPp6lCqM+CUaTJRtKi+J9T3I1T?=
 =?us-ascii?Q?Ze7jnERaz0cgSnXNjk5xOMn3ZXaU02DhBebnFNUPFOUfqxY1vPPdJ7nseAd/?=
 =?us-ascii?Q?zkm2wtWFxXYCZTzjPeZmVPumoQ+x/UZbYK3uF6kJJb0m4j3HW7wrvm1ySfJF?=
 =?us-ascii?Q?/3sWdYpAKmfryzPdw0NHwI/6NTQGG9c75lWfzQPtqgIAJ4MhU2cKmElLeW2C?=
 =?us-ascii?Q?mjbtwO59FupZRdR7eZ4X8lIZTr5gdupC9aQuvuZPU7X4rjfEhrbp6pJna+Wj?=
 =?us-ascii?Q?kAbJlYnWbg/W69hQKGZiizG+qfQMlNZirqw8UK0jQAN4RARxCb+rLXuNU6TG?=
 =?us-ascii?Q?eT2gDy9tLzq3mAYXa3xZUZxWVWHdz6ciNfVpnkkh4fHP/ZWhgpGwm4C9j//M?=
 =?us-ascii?Q?/iXo2pDgXxTrOFa6Jj+txdTGm4IfrLcetz1BFtiuwMM1Ug10Bp4NTIdCJSYe?=
 =?us-ascii?Q?hu46qdFg6mAtbkWty+uaQ9N+gOixXSA5jUCFYFD4sahNngKH2T97jW1efqVg?=
 =?us-ascii?Q?6uZ4LQrGdXtNmuStSjSXldfiBb9sTp8snrW1ylTaTvwVkVE8r74ak6R3n0ji?=
 =?us-ascii?Q?kBEZ203vrPi/ps+dLZrzXKF3fXboumZwvFLbMgPvQlFBGlENyvo6BlNpujHP?=
 =?us-ascii?Q?yflqmYuXdbYelNvlTyWlh/pGOkB/F1lIseanxf5/GI3Ukpjzu1TMlpAzGBfV?=
 =?us-ascii?Q?3qTPMI0nvSmGoynSEt8VXV3dLqOf1oa7Pmq6I040WTxgDLsHE/Rzh0UzZscF?=
 =?us-ascii?Q?j5dRe4xI7SscjrsPDS/ZdA4bybFMLj6bLvjO6OJx0wGSvMTAC861innxMNIf?=
 =?us-ascii?Q?u74UEKDRp0lIA7y2czu1Ue9LJ6hEQIcv/v4AFfkd1Asw5KGvxsK4aeKWRWWj?=
 =?us-ascii?Q?d6xnK0+MnMeZ5HY3mbiXAuvGTNHhKkzmgd40dJ+UNKzwDXZ1Z7LYfYKQ0ZYJ?=
 =?us-ascii?Q?3H2/fRo705mK/hc0pM49QrsNJZnmYU85igjSaf6VThIG3pa17/3FVZrp+8om?=
 =?us-ascii?Q?ZFkYnac8jdv6lovYv+tb4EX4rT6jgR8/ZKPuWuByjMCgT9xyAFnVvlZpHanN?=
 =?us-ascii?Q?1Pyt/F3G1Cq2El7vAVDEWUvlPVSQU+TnVj8p7DW9lwOYnEkdNxvy1xZqUCg9?=
 =?us-ascii?Q?WbZZzYlM4TIqN9cqJ0oARvPHIQEIkMYKGg+XMh8Z5u92yphycAE+GVufWHXc?=
 =?us-ascii?Q?o+MrsFBZkxxIgl7si2bRx7jdYFtLlaT6wPcv8bC/YMjnHs3ID7gkehe1UyoF?=
 =?us-ascii?Q?2h0QbQDpXzo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1VaBIEfrbx5jMge7Ts2QN4z7xUQ7zsiDM/c//6Cjb6A7M06aQ8C+IAqS14r?=
 =?us-ascii?Q?su48fRvZ/kEihZUhf3jSmrioDdgIHaCOBUm68LZ9Z/iz7uHidDdMSe7yZRHP?=
 =?us-ascii?Q?/X+U54fJ4gDzbJr7Ng1tLi6QzoR00rtPsWEw/eIxJDrnNGcQk2qvCjpBeKIt?=
 =?us-ascii?Q?4aPldi4hm40nJzb8COwspdKtdVu5G11ONmxJYeEdoD3tqCF9iF0aVX2yOrDH?=
 =?us-ascii?Q?Q30Jh3Z/6exl5iVfbIZbIUxkGZkMXxm/VF65qj16czhQwZIgcsa/vQBp7Gz3?=
 =?us-ascii?Q?jM9uqbbhY5FM1C3u3l6mS1GRL3t7ckOSbG/dwuRDVKqe8SsSONtsr9m7B5IZ?=
 =?us-ascii?Q?3yPHQdPcSBqMGuxRi/DkHG6FAHqm2iZkmg6F/PpB7zI0rkDdA479nTrOpqpM?=
 =?us-ascii?Q?rpSm0OYX6SBUBPLGNsDuyuK8CCjlwemD3qU28nRisirzGSQJQmXQkdNr4fkw?=
 =?us-ascii?Q?VlY0K1kfxs+jkhaAGLHoAkJRGNpcgxjAD62YrjSRWwZlso7TD1FHhn2DQRBj?=
 =?us-ascii?Q?R6FdtYmEe5AjeaJ6QSdAV9aDDDJCJvTiYsqzKYSoPKPbVOMqr3UQSjtq6vrJ?=
 =?us-ascii?Q?k8W1p4Lrb3m26d5sP2BOCHH6qC0i565DKma/ev9uJ9rkX3vsOcwD71H+dea8?=
 =?us-ascii?Q?OXM9w6j9Xz75xMSJiy0ci9PaC1RSIwvJOh3Si8/Jc3YRMbnkh+sKMhfh6UWj?=
 =?us-ascii?Q?4UGQB9QR0+yXKMuA3EbelauK5jURgV3xBi6aW0TKd+yeZczd7vlldzGxVCfh?=
 =?us-ascii?Q?/QhJir2P0qsntrTqWsue64UjVUFhYdCcQqLLcYDJtm91YTrBlrT5tEyle9C7?=
 =?us-ascii?Q?ekMhf0b7A2ZDb3sIKY6e+imdUK555uW8qTbvufB4jJ5mK+sMWcLCN60E6379?=
 =?us-ascii?Q?rfIb64BpzwcyebTW0u9bg6z7duohPrtPSTfyz0hGWQ0QVWaRGKGA9HUJ07Dm?=
 =?us-ascii?Q?bt15PXYcO8DngQ7MmilO39tCkdG906ysImzRq0GX5ZmZwkAPne5CL/8QLoS1?=
 =?us-ascii?Q?we45W8bTA+TIXcT6gz76AD0xNQz1GMHlLY15qaJzxSesZr04fZ9PEXEDXp+L?=
 =?us-ascii?Q?t3AlEnmiXVDtZjmui0XPaFOL9PlsnM3kH8TcBUG/NgWGROQRsXMGTm0xP59H?=
 =?us-ascii?Q?m/dwUmnezEkMFOL4grUWLUU1r2jxknUVqAp8VMjMklFmhq0iWrOZajJn+paL?=
 =?us-ascii?Q?6ZX9487yfcKo3nh6vrUB1Z7+EAcQhOKd9hJTV9qPRSa9x7QBnjjVsJb3hBmq?=
 =?us-ascii?Q?ysO3a5ZN4kV6sHTqjILOTF259n0t17kUvx0oS89Lra3U5emmu+6PY7n4sSgG?=
 =?us-ascii?Q?asxq9Me5OPA1LzbbdheoQ6e26gx+Bt9GR7JMtJ1uBvL0SOHXbL7Dl5Uo8HaR?=
 =?us-ascii?Q?snSyc709g4sxRxu7rrW26wCpFfjBC9sSMQW2SZ9cSrGyLPILywE5q5fVaa9Q?=
 =?us-ascii?Q?JqweHtOzli11yr41sfkPdN1LTWH9r/STOIvyQgYJfecqVtYoZRm0j3mfhXDX?=
 =?us-ascii?Q?1QFrdM/E9TnsjDpYhLTGks4hobNy5QBe8p0BsZXbZ0Tauvs7g0JVE9UGbmLl?=
 =?us-ascii?Q?HHvqeiwqv4Jumkz4VUig/J2N5UySkSJTuhtn6BHK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3a5a94-bbb3-4084-b405-08dd7cf100a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:14:30.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mMneiuaYm7g1rnhuhceOjKQUvRdhFsggKu1Jxv20pwllTzoBM0wxlKatjYxZIIk6mhlpR6sjfmBk54YpmBrbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-OriginatorOrg: intel.com

>+/*
>+ * Wait for the hardware to complete a transaction.
>+ * Return true on success, false on failure.
>+ */
>+static bool wait_for_transaction(struct staging_state *ss)
>+{
>+	u32 timeout, status;
>+
>+	/* Allow time for hardware to complete the operation: */
>+	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
>+		msleep(1);
>+
>+		status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
>+		/* Break out early if the hardware is ready: */
>+		if (status & MASK_MBOX_STATUS_READY)
>+			break;

Shouldn't we exit the loop if the MASK_MBOX_STATUS_ERROR is set, or is the
ERROR bit always set in conjunction with the READY bit?

>+	}
>+
>+	status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);

I still think this read is not needed.

>+
>+	/* Check for explicit error response */
>+	if (status & MASK_MBOX_STATUS_ERROR) {
>+		ss->state = UCODE_ERROR;
>+		return false;
>+	}
>+
>+	/*
>+	 * Hardware is neither responded to the action nor
>+	 * signaled any error. Treat the case as timeout.
>+	 */
>+	if (!(status & MASK_MBOX_STATUS_READY)) {
>+		ss->state = UCODE_TIMEOUT;
>+		return false;
>+	}
>+
>+	ss->state = UCODE_OK;
>+	return true;
>+}
