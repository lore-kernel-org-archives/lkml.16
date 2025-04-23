Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99C13BC0C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419377; cv=fail; b=u61rEYLuJCp7Sqy2HFONYHyc+Pw33Rhi0L+tR9T2md+wV+kJT4FUP4weG1whtgydnDlHPRPTHpNBGmM/p6fxRDwIkdjJE6RJBPh/0Yl+58AAd8DX+kcAF41X/nNMN+GSu5iNQrawB6aGPJvKZG02AbthNX8GwS/GUbfN8ZgLehY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419377; c=relaxed/simple;
	bh=GgjjvqZZJXSNfQ5agxdR81MK/Uwe0RvVTHZDSoDJgIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jiBBaLMEm7cMSZMtqjFR/o8e4JCW6Kglb9RPxSKPvN7mbm1cc8Sx1IGBBGzyYk6eF7iJ+8QqCnu2q95qViLGZJasCcL7GHOxz74sD0UMHYeoetcNqbNUyzn3TnYrTPprnkoDnLUcxmbM4OX9o7MXQ0/gnyd0nJHoZv1XT1l42O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RdNIpksI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Exf3Eq6z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RdNIpksI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Exf3Eq6z"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NEfxsW010244;
	Wed, 23 Apr 2025 14:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=GgjjvqZZJXSNfQ5agx
	dR81MK/Uwe0RvVTHZDSoDJgIA=; b=RdNIpksIJbxatBImcK+b5uJ1tGv6RKYah/
	eDFp8R+gk+DP1+J2g5e5LtHrQYcyI+ETKcUottSQD8W/5LR1m+49LmDeaMNXIZXB
	fHEXd0UY047NrAeTvQNJ8/ch2lYqkkBTfY8BsrTFEOmpEAMYp1Smc4ZQb7krmNga
	Mu+81FjoguKh82A89noHcM+gQSDpIWCQw6x4NlYmXV3bhFQy1rcQMF7yBY60CBRt
	TQfpSzoEOm4b7qa6dwmatipCIJ4WdruGZxsOLNKKwEa4f437PJILQT+9g2dvz1oK
	lj8v6G501EcIpPq21laOQ6i7bJY0bumqg5rcFyUFf2OTmHaPAFeg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jha1dsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:42:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NEMkr5030988;
	Wed, 23 Apr 2025 14:42:08 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466k05xs5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIzBm2fOJhRkgw7jjy2nL0hJ6dG4GbUUvSFYRnvrEFvlb7ldKz9SEkhEJiDeXUMNKsQZQHrIkel8zCLPBISfdOnNO619tZyL7Ola7oLbyq2tC6aUJI6Xl1xBeQQsZI2BmDODVJAtsaKX6lzHmhssXnIZ/0UC1U6zMlZ5ii8I0Q5Xvryf1HB61Lltpn9ihHxw8QU+7Q/nXataE0U8Td8P4d71ftAJpeuawKNjQePh0IPEKx5laj7kbbz9pTPfR7Aci1FB/tGHpT6fflLmJ45rbXDE+YwZn8MR7YxBC4ysAQagjr8WjSLN54EBI5WAZP0un0HVGdEY/ZSuO5MDeEzEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgjjvqZZJXSNfQ5agxdR81MK/Uwe0RvVTHZDSoDJgIA=;
 b=NbymKmNEQZiriEJGLpDup5WfxMu45q3KyM3+4ySI1bULH7YTamMp9Yg1KdjAcHk8Ia+A6YCbp0Vp13h+HXrATFWQDL3Akt9blhQtYB06cBNfRJqOAG3osW5zuwnzOXQTe4PD5psn32JSPFdGtCG5ry0/0eGlFSWzQDG3mADw/Huv0aA34Fr95A1q35y8M1nCRh0jKgektHV1CH5evjf+QMw4f7GIpR7z10gGg2yFHMH2wxguNxBh6vbKfOPmJwTThiRYKfw7BmK/iAl2S6fF7g3eTQ3jCEJVelRUZ9dJ2euFPi0LLoKwWwawFQM5Q47Kh1rdGEC+GChRZbRv2Tkb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgjjvqZZJXSNfQ5agxdR81MK/Uwe0RvVTHZDSoDJgIA=;
 b=Exf3Eq6zELf50zZKBxRwkHU1mgS1PU7z2viAgwUPToJ4VJBxjrivTkcgJcnAcdpN5wy2mbm7y5UPuWjgSsz6ftKCHcraa1isfEPOifTQNUAMAo/7vSN79sRmQpuu09VUxZvlkkeHl8OLuObmc3xkqZpaZlpgk73MURjhuCaD2Ms=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 14:42:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 14:42:04 +0000
Date: Wed, 23 Apr 2025 15:42:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
Message-ID: <7f8ed4e6-1743-4eaa-916f-25dca7575346@lucifer.local>
References: <20250422144942.2871395-1-david@redhat.com>
 <9b83ba9c-ca6b-4dd8-8f00-1384c22f5c80@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b83ba9c-ca6b-4dd8-8f00-1384c22f5c80@redhat.com>
X-ClientProxiedBy: LO4P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: f01a9741-6894-43b4-7544-08dd827503bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rzmJqIfLzvFoerpvOjdLxV26tdMTNkvT550WsaQ56Jz2+qEz0TWMhiq+Op5/?=
 =?us-ascii?Q?BllGaTuUOwFTBEzRwP6c4mysvZGiopOsXHOt6iFBcBD1H8EYCkbAat++yk3j?=
 =?us-ascii?Q?0EAkQ3vZDlh7PywIUdjyw+Un6UVAKhgBrL38Xgd6eYWBLNktvDNrYA/DKRSa?=
 =?us-ascii?Q?jHUS27XPbnFOQtAJoX26888egY4mm+9nZXa/TdTapOU9T1CfGxGVS2ZCSUqf?=
 =?us-ascii?Q?hvyS8ddTUpicePZrk34VlZVVpbsE389bJyc7yRqIdYgDJOKGlQstCKXH2Ft7?=
 =?us-ascii?Q?n5PaziQRuy6ZZoZVW6hwTKX9mHek4RSktdZ3hRBNspyV0bbAiM/oQHinT1er?=
 =?us-ascii?Q?Ml2qvtpiUTbMVDt/eBT5stBhAwFBuQsbVecROsAfdMXiDgFAiNNBvpbTiJuC?=
 =?us-ascii?Q?5q9xhYDXqye0JkNpi9Lz5Vk7pBpWTrKHZErbdtUwMv6JIqGiqnAAMdvJrOhZ?=
 =?us-ascii?Q?tHiS7QDrn2CfzC64wkLtfaXNLFUA62cDS06Y8s8sEuS5Ai544IsAuNd0cVD4?=
 =?us-ascii?Q?/0EwFzaITz0GB/M3lZagpcvA6Igfhel4fqTOEUnjTfwuRch5u+Do6j32MnYo?=
 =?us-ascii?Q?bj9y3GO0ivFjud/BCSYr+tgmuayHBagmEXZlpfK2yXN7HmAv+rDg2jlfsDkb?=
 =?us-ascii?Q?KlQPxSkrgZiRtuuDVr96WkxNIpoCTFonEsH32WDddgxQwuV9fF17ZD//efFh?=
 =?us-ascii?Q?jICb5jbxVcgNUJ2pw85R0MEVMS0AoHFC+Ap6vbBvgnhpzAgUz9p52FzhVvre?=
 =?us-ascii?Q?MZpjvH0UqfQgZwYCNokqe9qFYvynbX5Dx/IWVM231C2xGrwDdFay4+5TzEKE?=
 =?us-ascii?Q?n1sVMWMK75db4+MgCmhgdVNn1Ke3jEfehTtexN9rZs02FHI27ZdUj+qSrQQB?=
 =?us-ascii?Q?oS6UghRgDrUNWSbLWGt3mOrdIhSo6/PcDR/+DV3GYI/FMXMco/P9OJ19c/mG?=
 =?us-ascii?Q?8UGGY860RakC+svW3vjhPB2ixdivCDrWlC8rfkYLTW685K7Ib0tcimhjhDZz?=
 =?us-ascii?Q?AisoA9qJsCRTsA71tSpgtHOvhJoMDA7iiDZPU1lW1JoOAeBTsfaQQL6+aVU3?=
 =?us-ascii?Q?aNBU8AwpAC4i/F6zjLOyJZWVqc+tmIGd2wAzFiJDkBn5UG0ueBM3jD2PDb3L?=
 =?us-ascii?Q?35LTMSSmClCZLv/sOIXaMhVpezqEWYIPnzaCcGrR2XeFX1tTkVy/LQn8zmyQ?=
 =?us-ascii?Q?UPdIpfDKF2vzLCfZl54FIf66pkTBKNvEmRXCMqY7Q/bxe3uMYTisUAUFt4Jw?=
 =?us-ascii?Q?I0gqmcyBKtBs233azSAWK0vTxZjMVivH+nFfTillupUP6NBqpLvDgUaSHzVH?=
 =?us-ascii?Q?bBq5f+bMUevVcqR6eedTryCL1EIXBKd6qgSq+eEPfiEpEArFqijiskh7oprw?=
 =?us-ascii?Q?K47EfW9J/u8QAbGR70Td4BJ4Aibtmx7xDfQsKFx+KTKjTisqgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ykKtOX47ZVFDZc+Ey/b3UdcwPPN+PAujQJKwuqohKj9Z5j73gncvU60qD79e?=
 =?us-ascii?Q?1twYyAdFza1RT3PnFYoxJupzOeJZwigbpqHvsTRtskv+38SpnLWKYJf+Goyn?=
 =?us-ascii?Q?iMp1ofjJUvIuRttd4yzLsPMeh51KxknuqIDAZnIv216JCihclrvUqInIralM?=
 =?us-ascii?Q?+iD+pJiUY/bDlmIBlRuMHhRFmjymsdGdsf+V7xYVM0ZGmUMPDS6fDeel+FIm?=
 =?us-ascii?Q?jJngBBGnCFS3R+fMQMZ6XbLOLqePYa2DlW3KwoasW8Sx+RV1dEnKWE5AkREN?=
 =?us-ascii?Q?OU79NCh6MmYakLrksPEpXwJQJtZ1RBw5XbC8olk9KbS3JK3alI5s19qiXcGD?=
 =?us-ascii?Q?BeDiRAR73iE3kUFr2m9XgNbajWK0uAKrHIZFCdKjOEYERNkvtO/pbK9T7Roh?=
 =?us-ascii?Q?BFc7Co52hk74tf24XZVUZ3JJmaMcUD+Fpc7F+K1uzAVrL+5c0kBA97xtDMJg?=
 =?us-ascii?Q?cS1DVKd4RzjghYlDzS0v9iJLy05EKznNAnv6sO4qI3Qmoqy24Zqq+NX9YE5x?=
 =?us-ascii?Q?GN/4zcVc/JWAQJCZzUBB8bSgd3cbzSnixFZ6QV1fhKJsF1duuue2SUTMndcX?=
 =?us-ascii?Q?tWc8fwLHu66hkV/0e4Dz60XzYoIoortzlmbn6eFmfmJuZ27ZLRMvr0KfmPTx?=
 =?us-ascii?Q?DXveepUl8u4Q//pAFdziHHrr9yQ+fcpBj2JOprYDlMT9PGglr1KPl55jdW/7?=
 =?us-ascii?Q?qSifpkz8KmiIHbMJrYN3Azs9/pvbSIccAwnA1REyttyE61Crj6b5spAj9D/L?=
 =?us-ascii?Q?1d/D5G0COXLbiV28xlYld9KnBtxwxYy2ozrUOFXPq0LV/r7j9d4X6c0OA7wT?=
 =?us-ascii?Q?U4yp1XVVHFgl4g3U9gLoH85QCkDZwz2t6JPCqJzhy8PlR//WiNU/YR4ZIJ/N?=
 =?us-ascii?Q?KqHY9DYr/og13a+l5mf922FVMjXLQI+yw5DYtRfoIuhlTXRtDzFO1xDI93Zu?=
 =?us-ascii?Q?Z9PWRkay10g7rmD1dm0Kgn5DKz364GQFd5faOHT36t+lkYZ5/eYa3ckc75oy?=
 =?us-ascii?Q?IIy6+C4InQf7bu7OSFLyj/lOVLjzC0SmwqpWTObF8r2e28L0Hf2wwTVjzRoB?=
 =?us-ascii?Q?QYJ7TH6NezqmRmxrRduHtcqplBse8T5LDtiT66Hvad3Af15PBctrEq4pBzsi?=
 =?us-ascii?Q?1qIuYGd6Sl4oIyj15fHP0Um2LX37Pz/fD6EVL/lgexIsNdkr+UIbpwvv5ShY?=
 =?us-ascii?Q?jM1OooBC+zsAu390+qTiF7ESxDpjZs6KK5PvvfQUHdQUA9wasjQWPHHmNhXZ?=
 =?us-ascii?Q?Dpqj/oc9dfiO/x0yK8+NdFq8LAAEqGWt/kX5UkfDeft1hpkpWhc0SNN4Yiyv?=
 =?us-ascii?Q?Qiw/8Z+miy6WqgB945XhvGdXg865fkgYaNBTL4i/BDCGEaNy0V8+JLfLfWu9?=
 =?us-ascii?Q?7nVl6hRWzegFDc+DpKogfroUVG60QE5+MMGI/fqQbKMYUECRfUa8Bldu+VMJ?=
 =?us-ascii?Q?LZZGmDqzLkpERExHGa5rHG0MkZBysrI9qG6Urtkt9TZty8hSh+cnsLhsZv7L?=
 =?us-ascii?Q?HdxC/4Nd1DSE/efBwKBtyedw2vBwDHuO4A+rFsRBbbYq+5kZIUT0jMgWp448?=
 =?us-ascii?Q?pfFVMIvHtGyLk5KoxcoiP5MQFkAnt+VuoZKm+A0ZOXZx7k4jYl6SjNAh0EiV?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eKcqnOf4/+dZoiPmU0cea2jIPy9BZ/fTRYNp0eCq4VhOGwQniWC2ATpNtm15WhLMjlb6Mwgl0Phg/hhdoT24dXGFuQVxTn+r5A2rlDSa2ZyAKPULZBjJ09g7s1SlfTQFJ3Lh9tD9l7LJR9Kj3mk6x9vtozw7QJEAskVrxBN6So9VB0Bou+9TxXUo/vNRTfQiCj2qZx0ay9aYJGAJjQulWWqrpo1GXF77+HIKqelvvUQ9tYl0DY84bv6exzYSmRtjhfFmPGmyN81j32Y1JWxdUdA34jcWVupn2RDR/Yy1dZd1C4eooMCZ66M8K23kGbxGFEVjgfvfdXsoBKjCQ9oRbo4gBB6tdt7NNXKuov1rW4/wCAoSwGSHufHzhyhs+IHwxBSv36Nkzt3xQCyFcg1UDbjjb8H5X+cLRqLnRRMd203DNHb/jqp7o4qfmsPr+Ydr0BZ1+G2vVxSzm0SuTZYikIYFDOSE9z0+SnYhUJYlu/oLcN+wK0bsn1xXUaUaYVNag7EbRcy9ztbzf2MQjAUS/V+94kQyX4vzYHNcR85byS0bKjuqA+kX8vmV7GPKjyR7wDosdiNFVutzIxRIvupxhwPnSzeiT1XCuq7Pt0jLEOE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01a9741-6894-43b4-7544-08dd827503bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:42:04.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6xf5ykRiOF9o0lKG9PjWFVsbKWGEhMXWLXDra+ZITJE/semOg0HPg9vWU9q3az113Z+izBu7i/DsTRQEnube+lCzp5ZD2NZ4skM18X7WgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMyBTYWx0ZWRfX4yORfXP4O6Ey vxFvDaOQs08qI6pRE4WJ7RdoiQ7xHG0/MU4W+nBIug2ap9UeBTN1ZhKPvIpEBLhjjSv+kN6wAv/ soKkAd8lWX4vE/eQcG3dL9pSYfq3Ow8CqNV938giQNgYh0bR50HBcu4gRv6FjbdgXcZFxEhsc9V
 1wIiPYlexLhZqYnp9knUPah7ollPpyV8k5iER+u4Opj4rJf2G3lcV0MpZXceff7AdB5qab6ZzCA I8Zql7nsIQaDZaXwjQeVKF3bNFd74K40cR9/aHT4Jr1MJ54dssU+x+2Hlzn1A02XHmGf/8JVpYQ utEnczXO2g+XKVos4gueQtwpJvEMNHZSidhyhHsKn9I8vRyx+J2nmCqxqjGrwOGe1pA7F1ROEif pz+peI1p
X-Proofpoint-GUID: sJj3t0bWmVehc6IOPbebD_0Seak6COvv
X-Proofpoint-ORIG-GUID: sJj3t0bWmVehc6IOPbebD_0Seak6COvv

On Tue, Apr 22, 2025 at 04:54:54PM +0200, David Hildenbrand wrote:
> On 22.04.25 16:49, David Hildenbrand wrote:
> > Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
> > used for duplicating VMAs during fork(), but also for duplicating VMAs
> > when splitting VMAs or when mremap()'ing them.
> >
> > VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
> > size) and apparently also shrunk during mremap(), which implies
> > duplicating the VMA in __split_vma() first.
> >
> > In case of ordinary mremap() (no change in size), we first duplicate the
> > VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
> > the old VMA: we effectively move the VM_PAT reservation. So the
> > untrack_pfn_clear() call on the new VMA duplicating is wrong in that
> > context.
> >
> > Splitting of VMAs seems problematic, because we don't duplicate/adjust the
> > reservation when splitting the VMA. Instead, in memtype_erase() -- called
> > during zapping/munmap -- we shrink a reservation in case only the end
> > address matches: Assume we split a VMA into A and B, both would share a
> > reservation until B is unmapped.
> >
> > So when unmapping B, the reservation would be updated to cover only A. When
> > unmapping A, we would properly remove the now-shrunk reservation. That
> > scenario describes the mremap() shrinking (old_size > new_size), where
> > we split + unmap B, and the untrack_pfn_clear() on the new VMA when
> > is wrong.
> >
> > What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
> > first? It would be broken because we would never free the reservation.
> > Likely, there are ways to trigger such a VMA split outside of mremap().
>
> As expected ... with a simple reproducer that uses mprotect() to split such
> a VMA I can trigger
>
> x86/PAT: pat_mremap:26448 freeing invalid memtype [mem
> 0x00000000-0x00000fff]

Wow.

Might be worth adding a self test for this if not too difficult, even if as
a skipped one w/comment just so we have it ready to go?

>
>
> --
> Cheers,
>
> David / dhildenb
>
