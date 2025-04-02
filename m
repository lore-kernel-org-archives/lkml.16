Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980F1EFFB8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595233; cv=fail; b=r3rFIK4yywKw9tUpT0/0sK76lpvbqzvdBzS/V7gu0Eyk6v8NjoZMrlwYxQVROD4y6xadsdnPpAcWelkMhNgZvXw//P9d85rM0p8CzjGBt2vClILZWhJaN4MVGzq8+FYzR1TvMGH+Sga7L3vQ5j4mHkfDOs+dpkNJVuh0cHPKbYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595233; c=relaxed/simple;
	bh=46z920Bd25qQZWasCzDpwozvoX8Aglt7Dq83Gt+Y8BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hRENPzogWND3I7lKpXaAM0Qx89u8gvIVN3uc0Y6UbKyYUfVrTR22rDRHbP3ialSdEA61XcriuurmB/A0HjbErc8dlSdJD2ykaaT1QwfxVEyDqDufmjrDgoY+o5cqjZLgF6oxPT709EBZjdMJlXsReImvsdGYMLKBzMmU0qJPlb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hoSI0u5H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=phKdkmjV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hoSI0u5H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="phKdkmjV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g0xm012893;
	Wed, 2 Apr 2025 11:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=IRB6wzigMTViPcqBAt
	5UcvfLZOO8/2pCZSBilF92FCE=; b=hoSI0u5H+IiF3EoWDURBodIQgZE+K8TVbL
	ru11mpvT/BLBCMRcIOYVsT+MV32j+ItXN99+cafFXeHw2oywcW6CIbDAnfD7Jh1L
	ALprpCTdm+wZICfWzndYLyPZfSPwK7GhRjdbdSwB0W+RaH/BH6wppEHWZ/KJRu8c
	G8O9+pCSC/MK+rpfwZtm9Nh0QFUW21CLOhiqrGdEe2XSyc9zuuwlrkD+E5bY5p6e
	M/RP+f21/gGzJ96RxmKmFhG0l0iM7by2RpjkuOKGK6uzqmr2CL7fCx7ryOi6UE2y
	LLKvzR58lLtqX0u2rB3dG64pLKJDUGfsIh3DQODIMbO6xgguzo4g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtj735-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:59:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5329ue4F003397;
	Wed, 2 Apr 2025 11:59:38 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aagr4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKZfj1gVZus8VBSoAYBPDP/+A80N6t0ONrVi+49TFIOZUVhtHZQ8/2k9E31uZIQbVsVMrGwH9MWKuxWeDmjigCWnYFP7UzSamWeOgZ//qeGbOTnr0vIvOlH4Xudf82qg/Ri7Yqn0NQIfCfDvfzjKG3ew0gz72aQ2iAHWB0hz6RVmXyatprkvmmWkHIAGKIUaLHHWF8rqwRSGqQv3JdHPrR6C089hkx3mgDnHwHz6Gc46rsUSPm7MTV1oi/ywNBb+k4/HXdXPOLupLmiyR142W/NyJOkvgCtfOz9vaW1OOGtR6XZk4V+XFfA/le70LGdsohavu95fYS1VomCTq24+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRB6wzigMTViPcqBAt5UcvfLZOO8/2pCZSBilF92FCE=;
 b=ELnkVFz4EhcIfVc9dLWRWu5G4fGHi7BMSjJAXJhTlWXpf7rFbw3pkC/WfJjc6kT0Dcx5XPhluCYANiQzxMubv2w1IaYQQabrNBK7pW+nibiE8scqXpjEF1Qwe9UKDPDayV04vng54eOEnNXfoPPy8JDTuRATXPPHrtTLvQTmnUC+/J4w/VB1Uk74szX1pVqv13oXeCm1h0Yx2NLyQlI9jbS2yz+xPYCVfW7IUkTzuvW3JCAI/jEUpi0rrpJDk+kmauvYdNqeAX0D9XU/ySekNBYSVKuM7xOnQhPEsWCnvwsdYT0ZLOT7svfUEz5BnfCrtoXOgn/5KliPrk7IJHgjNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRB6wzigMTViPcqBAt5UcvfLZOO8/2pCZSBilF92FCE=;
 b=phKdkmjVtfJytXmL5YkiCvaOmW/y5lMGausyvn+zh9d3EmqxxOfGCnpVOZXRT00TiK2Y8PelRbDa8TEiCJyVj9mIcK/bmkZmOv2BGgP/xU/fNAIC/ipeJIF65ZqXaED4p3Dt+EhMV52lLLHHFZPGOmQiySFWyYwpq5OsEjWboOA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB8211.namprd10.prod.outlook.com (2603:10b6:208:463::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 11:59:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 11:59:35 +0000
Date: Wed, 2 Apr 2025 12:59:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        xingwei lee <xrivendell7@gmail.com>,
        yuxin wang <wang1315768607@163.com>,
        Marius Fleischer <fleischermarius@gmail.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>,
        Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <abd1c60c-e177-4468-b097-f637bda6ff3c@lucifer.local>
References: <20250325191951.471185-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325191951.471185-1-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 8660bd18-0e6e-4d32-2ef0-08dd71ddd654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6BJWkvCDxDLNo74F9Snciy3hup6euNPzxLkJQrnaFmTO/FswVYHDBuriSKU?=
 =?us-ascii?Q?8x2mS+hWSm3gGS0RyFeFhBeDFETifCP/objrk7/DxOLiTUsxYdn0t11rtOg3?=
 =?us-ascii?Q?vQiMlZ+dl93r4dOKuf/Qd4VFPyl3/nyZI/bqkYdrYiSjY9E+9JeshAUZtKXk?=
 =?us-ascii?Q?nP94+lG7df2nT0ZS/BiHRQwLSa5//gb+VrS76KL8stmQmFA9KkUrGKQXMH7p?=
 =?us-ascii?Q?TNAJ/Lr9aNxHXq3NNDdam39PrHAAimaS1aM3U8YyMlJ18aSO/iAl2JdxOo82?=
 =?us-ascii?Q?sxIpx+X633IIUe5BkZRLeCcKABLZfNhrJCuGxjcwlwbJGkefLFoyIemdWvMw?=
 =?us-ascii?Q?lx3mm4mb5/GNENEbS92d3FLmByyX7uElj5hykNTfRCgTKtqggO6jmRwE4yXY?=
 =?us-ascii?Q?J59TWAMYiHQtbePnTlP21A1vijovlJjTHHyov2eNNnW4u9Hr6tk46iKttvq1?=
 =?us-ascii?Q?E61DioH4J5wddNXMgKWEW6HHTU8M0vqxHiv7N6wSntK0ttbql+8hCQDqVCgV?=
 =?us-ascii?Q?0X3k9KEWAZ7aFy8NVk1lIAb9cvWzQxKbhEmEC+l9irSPnlgN7QBfAW4CKfTv?=
 =?us-ascii?Q?/vO/NJxVmVMrev6u4GjokVwdPS+GvSODB7V694erEDMa2C/3Utsd5Qf2Ohpy?=
 =?us-ascii?Q?tLwitKIZW+lB2TSNIR3hcKGCiidqaGBAq+U2ebeL/VbYF6zyKQ+kLH5cpnq8?=
 =?us-ascii?Q?i5HLswH4/R+PcKy50btHT9ChokYB+wKi7GJNgYHySygjNJK74u4aEMfsnqKV?=
 =?us-ascii?Q?szURrLrC+w0AG3tEKaX1r+n9azpXBiYDtLsVxwslPtayHlPp2XT9g5TZgUYt?=
 =?us-ascii?Q?zWya96gLKHr5dLBabSphV9rRF/dA6hwgXF9HAGQpLv4DOyRpEtW8uIT5QdNc?=
 =?us-ascii?Q?VLRzYkCVfddZ5q+wJoFFtaTtr2MYIAqSJ22NwdsXn8mI2gEkSzVC4XO4oMZB?=
 =?us-ascii?Q?61ngN/+HtIEVPDp0O3zYmypuArpfTdI70PibHBLm2BNRUu1/TL6/kjptarPk?=
 =?us-ascii?Q?gBM1EPR3tvhYnu5cW9lTOh5+jApbGDD6Gfcbbsnv8h+4xKSKIzsDjwyvGMGz?=
 =?us-ascii?Q?X7L+QnBW5Gnk4VvjP1HMLRMQu4EUKLWDYYwik9P8q659fxMzIc7BJsbzhOUV?=
 =?us-ascii?Q?fy5i66FO1f2WVeu6Z4Na9p7BT5KlE50XZP9YsxtA+1gYuFVWHk+6GzJSSpx4?=
 =?us-ascii?Q?31U0DyGLLXsKW4FFGLxlI9gNmhTW6HAJEcSCTWJRYLqjXuOzpbcOcUvtpVAM?=
 =?us-ascii?Q?gpmMmuyusQxGThabxMghoZJvYvwqLYIsWpPijL1yvqxrBekq937jFHiEA/Zt?=
 =?us-ascii?Q?nhgPNj/Fzc9sc5lzPnhY/IbktB0qM5XwnyV7mk1020QNfjgeI7g8S0laSPPg?=
 =?us-ascii?Q?WCxev3kqx91JHaOj9K212K2dptFi7veNHhlupScn9VZG/7V3LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eItftRRXC6s4UtNBoW5oBgSyuGHlirEBnAxHPbEyWyd1jxOtfhrQk5EfTAEO?=
 =?us-ascii?Q?/bvwNGpVaIjK+PS1wUejqkcXb9WoLQbetoBVE1LWnHQPkaQAGQAhdvKViddR?=
 =?us-ascii?Q?6x/qTD1HXAjdcL3/MXjb9UKeDRcbCwgtSs9/+dVwL6RaywZZOGtC+LUCROTf?=
 =?us-ascii?Q?2AoVee6vJrE/Atpg/L1prVrnGTtFTcwmCrLChamvOp8ZcH/91yaPTLAuTYC8?=
 =?us-ascii?Q?75bddP6jZ2FE6UvgYIX+TSTnJctniByRJmPBzvDtgpbj64otiswSq46TKDGw?=
 =?us-ascii?Q?3/Py+Oyv1NJoJ3AJDJOdWF7r4Yar5CS1rZLHBpWZEYmpFaShyYs+TNVuDTfS?=
 =?us-ascii?Q?gt5VHQd0gmtozjmqfMpNZQ+Mke9g2LaXUuzS/6fNqa9DkT09W2bsspEy/RaN?=
 =?us-ascii?Q?8oHE4wPrtul6Tw+K1CFMoPhtWfn+0YP0J9rV342vChRtOPrO43EwkugUiSDX?=
 =?us-ascii?Q?ci0CIMWkdqZS5wF2Z6VIVMqdW8gi618ey6YU1wrKS+cjHYEJiOhDqd7ytQ5m?=
 =?us-ascii?Q?Tfl4WDx+JYtYMQtdQXdjdVZOLNHTEzrfEFAhI1haUxRuDEjb1o7YwW0bPzGV?=
 =?us-ascii?Q?4gXKYYUK2bidyB3Onlt2wQtTqCe1EkyLtRK4YtVmkAY4gc0+b4XU/0Zyw4Tk?=
 =?us-ascii?Q?n15I6Vbajm8Ojfm9SuOCpOtSP8qKBetvRGGEbZk9ybAkHFml/ACkhrt4Cc7n?=
 =?us-ascii?Q?UM567piEuJhf8LVb8lg+xVsxQdrs6IMmTT5InrDms9lOAiGmhoBac5ZZ1CDu?=
 =?us-ascii?Q?1FAHvBjfIyFdZRdPy3C+rNlRUlYU54m0YmGBgEQCrZD84iFtXBTxN1TWHmp5?=
 =?us-ascii?Q?PQIHi0GC1MHRqnYLJsJMec5WNWZen+y6a1/q+duK8utg2urheKMKcVUHNOab?=
 =?us-ascii?Q?n8wA54fhhcbj284CzOwGC5BQ/yZvY/CbbxJ8GxxnH4Xx8qkLVlFBqD/RYmXD?=
 =?us-ascii?Q?k/wG7Cl6CuR1btmPUtKMBVyyzlIdhwHL4SBzWH80DdlNP5H8nIW6vk0yO5BG?=
 =?us-ascii?Q?lL6zsxUvG5sstywXcK/E2xOH0h0SGxiIG9KUjzJ/mOsdU0G1Hf9EUsrLm/yT?=
 =?us-ascii?Q?5s6+Uq76w1ulbdBkCALTyoh6lWUxhzE/JutoOyJ4qU6psxatWb+DOh8mBnqX?=
 =?us-ascii?Q?Ltw0qEZRcl5avZkhWJxFAXv6Dc5JsHtY9EZLC95p+Np1+AbYRCfgwqkFgSxO?=
 =?us-ascii?Q?ngu+JXZjV1EyP0hJqU6aC93yF8ymIIQ3Lsgg4G3cb75VGWDn3wGPiND7OQn9?=
 =?us-ascii?Q?/l8FtOoIUoF+AgBqC7a0suFbcUI+757NFM27yLM/4ovsXYucsN9+CkQTIn4T?=
 =?us-ascii?Q?1CCT5iW7V6flaJ7E43PjBLTPJAWNenXjwGjDoNsFqW3zQEQN9CKAgqWxudZl?=
 =?us-ascii?Q?s5pjnn6tAEeKhVNxzCThyPed8T6r9NriCM6tD3/pp2u/9Nk02BmyDpNykZbF?=
 =?us-ascii?Q?UgyrNyEwf+/CK2gOaNj+9d5W5WvHp84z43HSjRBYQ4z5Uhel5aQfcCfWrG4V?=
 =?us-ascii?Q?AeqG4ffVBE+VUsJiqATD0+3yZb95TovVL6Rp5/zjg4njvfiN4lsh0PbQrovT?=
 =?us-ascii?Q?6RM7rbm7YEUfBpcdyCx6p1Cc+545BYRQoIzNlydwVYMF7nvt2jBMds7wk2v+?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	swZ0ed4hFypcitKr0GlcAEBAVjVHDNCeo25k9Yi1c5TQt2hZEwIyCZ+Ocx913b1Rb7Tm1d/uPPi4F9d2K3nz63O+KhhSRpVhxjweesZ4+SMKgx8ASCIptMKEsG5Rmca6FCpNeZvx6KbkpEu7Vd0nOCPlwXbST87Yp6oIg6kOIx+huqarJlWH0KrfJABLYYCb1V018dcBIwbACngN6cpGB7xptDuClCszXCbzvZEVJ3Yh3MSpiighH9USI+QRrnQzpdoliawqSkyE9MTII49xprvCXDSi1tTf7cgSUldq92yWTBeRTc7QF48rY0awcwHpQAL9ao/lrT7VohL2iQbgytawHWBIMUbr1qk61HBg0OEi/rZytUhnpI4a/os9jfrxTefct9zADmJte2h6Mmz7ffZi/Rk7d2v7czNi7dR/3aVLA+TZxYecV2E9ZLRdknQKtanCRf8j6tB36Zf3iG8JDDp+0fBU+vCYwkKT7rhC4u+c+UTc26ojNenbr9ESvynkk9PfpzqkJkwYEBKg1sQptw1WwsQBUadrQSqM+aaZhcKRFnrF1wBr75lPuW8Jqr7Jdo44fiEJ+jcD1WevD+1fJbIbnB+Pm9xdUB7rhsQIX0k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8660bd18-0e6e-4d32-2ef0-08dd71ddd654
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:59:35.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeMVmxgP9qZRuFOU8SISfb6fX178Z+K8GbWkBBlJrpm5IKmukfolnlptE7F0aagIwpunYbRvScnWxy9voQB04xjYoxHSmVovyfpTl6UU2QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8211
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020075
X-Proofpoint-ORIG-GUID: MYJDvy7B-dtdJBi4SSMFEVe0th6dZ0Mj
X-Proofpoint-GUID: MYJDvy7B-dtdJBi4SSMFEVe0th6dZ0Mj

+cc Liam

On Tue, Mar 25, 2025 at 08:19:51PM +0100, David Hildenbrand wrote:
> If track_pfn_copy() fails, we already added the dst VMA to the maple
> tree. As fork() fails, we'll cleanup the maple tree, and stumble over
> the dst VMA for which we neither performed any reservation nor copied
> any page tables.

Ugh god.

This code path seriously worries me (and also Liam :), we have some very
weird cases that can occur here.

>
> Consequently untrack_pfn() will see VM_PAT and try obtaining the
> PAT information from the page table -- which fails because the page
> table was not copied.

Good lord. How have you found such a satanic combination of hellish
factors... :) I'm guessing some terrible splat...

>
> The easiest fix would be to simply clear the VM_PAT flag of the dst VMA
> if track_pfn_copy() fails. However, the whole thing is about "simply"
> clearing the VM_PAT flag is shaky as well: if we passed track_pfn_copy()
> and performed a reservation, but copying the page tables fails, we'll
> simply clear the VM_PAT flag, not properly undoing the reservation ...
> which is also wrong.
>
> So let's fix it properly: set the VM_PAT flag only if the reservation
> succeeded (leaving it clear initially), and undo the reservation if
> anything goes wrong while copying the page tables: clearing the VM_PAT
> flag after undoing the reservation.

This sounds sensible.

>
> Note that any copied page table entries will get zapped when the VMA will
> get removed later, after copy_page_range() succeeded; as VM_PAT is not set
> then, we won't try cleaning VM_PAT up once more and untrack_pfn() will be
> happy. Note that leaving these page tables in place without a reservation
> is not a problem, as we are aborting fork(); this process will never run.
>
> A reproducer can trigger this usually at the first try:
>
>   https://gitlab.com/davidhildenbrand/scratchspace/-/raw/main/reproducers/pat_fork.c
>
>   [   45.239440] WARNING: CPU: 26 PID: 11650 at arch/x86/mm/pat/memtype.c:983 get_pat_info+0xf6/0x110
>   [   45.241082] Modules linked in: ...
>   [   45.249119] CPU: 26 UID: 0 PID: 11650 Comm: repro3 Not tainted 6.12.0-rc5+ #92
>   [   45.250598] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
>   [   45.252181] RIP: 0010:get_pat_info+0xf6/0x110
>   ...
>   [   45.268513] Call Trace:
>   [   45.269003]  <TASK>
>   [   45.269425]  ? __warn.cold+0xb7/0x14d
>   [   45.270131]  ? get_pat_info+0xf6/0x110
>   [   45.270846]  ? report_bug+0xff/0x140
>   [   45.271519]  ? handle_bug+0x58/0x90
>   [   45.272192]  ? exc_invalid_op+0x17/0x70
>   [   45.272935]  ? asm_exc_invalid_op+0x1a/0x20
>   [   45.273717]  ? get_pat_info+0xf6/0x110
>   [   45.274438]  ? get_pat_info+0x71/0x110
>   [   45.275165]  untrack_pfn+0x52/0x110
>   [   45.275835]  unmap_single_vma+0xa6/0xe0
>   [   45.276549]  unmap_vmas+0x105/0x1f0
>   [   45.277256]  exit_mmap+0xf6/0x460
>   [   45.277913]  __mmput+0x4b/0x120
>   [   45.278512]  copy_process+0x1bf6/0x2aa0
>   [   45.279264]  kernel_clone+0xab/0x440
>   [   45.279959]  __do_sys_clone+0x66/0x90
>   [   45.280650]  do_syscall_64+0x95/0x180
>
> Likely this case was missed in commit d155df53f310 ("x86/mm/pat: clear
> VM_PAT if copy_p4d_range failed")
>
> ... and instead of undoing the reservation we simply cleared the VM_PAT flag.
>
> Keep the documentation of these functions in include/linux/pgtable.h,
> one place is more than sufficient -- we should clean that up for the other
> functions like track_pfn_remap/untrack_pfn separately.
>
> Reported-by: xingwei lee <xrivendell7@gmail.com>
> Reported-by: yuxin wang <wang1315768607@163.com>
> Closes: https://lore.kernel.org/lkml/CABOYnLx_dnqzpCW99G81DmOr+2UzdmZMk=T3uxwNxwz+R1RAwg@mail.gmail.com/
> Reported-by: Marius Fleischer <fleischermarius@gmail.com>
> Closes: https://lore.kernel.org/lkml/CAJg=8jwijTP5fre8woS4JVJQ8iUA6v+iNcsOgtj9Zfpc3obDOQ@mail.gmail.com/

Oh OK I see it was reported previously.

> Fixes: d155df53f310 ("x86/mm/pat: clear VM_PAT if copy_p4d_range failed")
> Fixes: 2ab640379a0a ("x86: PAT: hooks in generic vm code to help archs to track pfnmap regions - v3")
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>
> v2 -> v3:
> * Make some !MMU configs happy by just moving the code into memtype.c

Obviously we need to make the bots happy once again, re the issue at [0]...

[0]: https://lore.kernel.org/all/9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local/

Which by the way you... didn't seem to be cc'd on, unless I missed it? I
had to manually add you in which is... weird.

>
> v1 -> v2:
> * Avoid a second get_pat_info() [and thereby fix the error checking]
>   by passing the pfn from track_pfn_copy() to untrack_pfn_copy()
> * Simplify untrack_pfn_copy() by calling untrack_pfn().
> * Retested
>
> Not sure if we want to CC stable ... it's really hard to trigger in
> sane environments.

This kind of code path is probably in reality... theoretical. So I'm fine
with this.

>
> ---
>  arch/x86/mm/pat/memtype.c | 52 +++++++++++++++++++++------------------
>  include/linux/pgtable.h   | 28 ++++++++++++++++-----
>  kernel/fork.c             |  4 +++
>  mm/memory.c               | 11 +++------
>  4 files changed, 58 insertions(+), 37 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index feb8cc6a12bf2..d721cc19addbd 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -984,29 +984,42 @@ static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
>  	return -EINVAL;
>  }
>
> -/*
> - * track_pfn_copy is called when vma that is covering the pfnmap gets
> - * copied through copy_page_range().
> - *
> - * If the vma has a linear pfn mapping for the entire range, we get the prot
> - * from pte and reserve the entire vma range with single reserve_pfn_range call.
> - */
> -int track_pfn_copy(struct vm_area_struct *vma)
> +int track_pfn_copy(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, unsigned long *pfn)

I think we need an additional 'tracked' parameter so we know whether or not
this pfn is valid.

It's kind of icky... see the bot report for context, but we we sort of need
to differentiate between 'error' and 'nothing to do'. Of course PFN can
conceivably be 0 so we can't just return that or an error (plus return
values that can be both errors and values are fraught anyway).

So I guess -maybe- least horrid thing is:

int track_pfn_copy(struct vm_area_struct *dst_vma,
		struct vm_area_struct *src_vma, unsigned long *pfn,
		bool *pfn_tracked);

Then you can obviously invoke with track_pfn_copy(..., &pfn_tracked); and
do an if (pfn_tracked) untrack_pfn_copy(...).

I'm really not in favour of just initialising PFN to 0 because there are
code paths where this might actually get passed around and used
incorrectly.

But on the other hand - I get that this is disgusting.


>  {
> +	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
>  	resource_size_t paddr;
> -	unsigned long vma_size = vma->vm_end - vma->vm_start;
>  	pgprot_t pgprot;
> +	int rc;
>
> -	if (vma->vm_flags & VM_PAT) {
> -		if (get_pat_info(vma, &paddr, &pgprot))
> -			return -EINVAL;
> -		/* reserve the whole chunk covered by vma. */
> -		return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> -	}
> +	if (!(src_vma->vm_flags & VM_PAT))
> +		return 0;

I do always like the use of the guard clause pattern :)

But here we have a case where now error = 0, pfn not set, and we will try
to untrack it despite !VM_PAT.

> +
> +	/*
> +	 * Duplicate the PAT information for the dst VMA based on the src
> +	 * VMA.
> +	 */
> +	if (get_pat_info(src_vma, &paddr, &pgprot))
> +		return -EINVAL;
> +	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> +	if (rc)
> +		return rc;

I mean it's a crazy nit, but we use ret elsewhere but rc here, maybe better
to use ret in both places.

But also feel free to ignore this.

>
> +	/* Reservation for the destination VMA succeeded. */
> +	vm_flags_set(dst_vma, VM_PAT);
> +	*pfn = PHYS_PFN(paddr);
>  	return 0;
>  }
>
> +void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
> +{
> +	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
> +	/*
> +	 * Reservation was freed, any copied page tables will get cleaned
> +	 * up later, but without getting PAT involved again.
> +	 */
> +}
> +
>  /*
>   * prot is passed in as a parameter for the new mapping. If the vma has
>   * a linear pfn mapping for the entire range, or no vma is provided,
> @@ -1095,15 +1108,6 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>  	}
>  }
>
> -/*
> - * untrack_pfn_clear is called if the following situation fits:
> - *
> - * 1) while mremapping a pfnmap for a new region,  with the old vma after
> - * its pfnmap page table has been removed.  The new vma has a new pfnmap
> - * to the same pfn & cache type with VM_PAT set.
> - * 2) while duplicating vm area, the new vma fails to copy the pgtable from
> - * old vma.
> - */

This just wrong now?

>  void untrack_pfn_clear(struct vm_area_struct *vma)
>  {
>  	vm_flags_clear(vma, VM_PAT);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 94d267d02372e..4c107e17c547e 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1508,14 +1508,25 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>  }
>
>  /*
> - * track_pfn_copy is called when vma that is covering the pfnmap gets
> - * copied through copy_page_range().
> + * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> + * tables copied during copy_page_range(). On success, stores the pfn to be
> + * passed to untrack_pfn_copy().
>   */
> -static inline int track_pfn_copy(struct vm_area_struct *vma)
> +static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, unsigned long *pfn)
>  {
>  	return 0;
>  }
>
> +/*
> + * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> + * copy_page_range(), but after track_pfn_copy() was already called.
> + */

Do we really care to put a comment like this on a stub function?

> +static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> +		unsigned long pfn)
> +{
> +}
> +
>  /*
>   * untrack_pfn is called while unmapping a pfnmap for a region.
>   * untrack can be called for a specific region indicated by pfn and size or
> @@ -1528,8 +1539,10 @@ static inline void untrack_pfn(struct vm_area_struct *vma,
>  }
>
>  /*
> - * untrack_pfn_clear is called while mremapping a pfnmap for a new region
> - * or fails to copy pgtable during duplicate vm area.
> + * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
> + *
> + * 1) During mremap() on the src VMA after the page tables were moved.
> + * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
>   */

Can I say as an aside that I hate this kind of hook? Like quite a lot?

I mean I've been looking at mremap() of anon mappings as you know obv. but
the thought of PFN mapping mremap()ing is kind of also a bit ugh.

>  static inline void untrack_pfn_clear(struct vm_area_struct *vma)
>  {
> @@ -1540,7 +1553,10 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  			   unsigned long size);
>  extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>  			     pfn_t pfn);
> -extern int track_pfn_copy(struct vm_area_struct *vma);
> +extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, unsigned long *pfn);
> +extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> +		unsigned long pfn);
>  extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>  			unsigned long size, bool mm_wr_locked);
>  extern void untrack_pfn_clear(struct vm_area_struct *vma);
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 735405a9c5f32..ca2ca3884f763 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -504,6 +504,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
>
> +	/* track_pfn_copy() will later take care of copying internal state. */
> +	if (unlikely(new->vm_flags & VM_PFNMAP))
> +		untrack_pfn_clear(new);

OK so maybe I'm being stupid here, but - is it the case that

a. We duplicate a VMA that has a PAT-tracked PFN map
b. We must clear any existing tracking so everything is 'reset' to zero
c. track_pfn_copy() will later in fork process set anything up we need here.

Is this correct?

> +
>  	return new;
>  }
>
> diff --git a/mm/memory.c b/mm/memory.c
> index fb7b8dc751679..dc8efa1358e94 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1362,12 +1362,12 @@ int
>  copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  {
>  	pgd_t *src_pgd, *dst_pgd;
> -	unsigned long next;
>  	unsigned long addr = src_vma->vm_start;
>  	unsigned long end = src_vma->vm_end;
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> +	unsigned long next, pfn;
>  	bool is_cow;
>  	int ret;
>
> @@ -1378,11 +1378,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>
>  	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> -		/*
> -		 * We do not free on error cases below as remove_vma
> -		 * gets called on error from higher level routine
> -		 */
> -		ret = track_pfn_copy(src_vma);
> +		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
>  		if (ret)
>  			return ret;
>  	}
> @@ -1419,7 +1415,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  			continue;
>  		if (unlikely(copy_p4d_range(dst_vma, src_vma, dst_pgd, src_pgd,
>  					    addr, next))) {
> -			untrack_pfn_clear(dst_vma);
>  			ret = -ENOMEM;
>  			break;
>  		}
> @@ -1429,6 +1424,8 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  		raw_write_seqcount_end(&src_mm->write_protect_seq);
>  		mmu_notifier_invalidate_range_end(&range);
>  	}
> +	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> +		untrack_pfn_copy(dst_vma, pfn);

Yeah, the problem here is that !(src_vma->vm_flags & VM_PFNMAP) is not the
_only_ way we can not have a valid pfn.

Do we still want to untrack_pfn_copy() even if !VM_PAT?

If not then it seems easier, if a bit gross, to use this 'tracked_pfn'
boolean parameter and then here all we need do is:

if (ret && tracked_pfn) ...

Which then also allows the track_pfn_copy() to assert the fact that we only
care if VM_PFNMAP also... which is maybe some small neatness that comes out
of it?

>  	return ret;
>  }
>
>
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> --
> 2.48.1
>
>
