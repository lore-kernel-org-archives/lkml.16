Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD4198A08
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543925; cv=fail; b=gVpPm24nvqnsO0MCbD3EGvhjIEdIMeXF0HBFWeAvFSusr/QND9rSsRsN/kfbF4N+6jguKyW59rrqxb5UGVCxnH4OxNevMJ62hgOraJeCaIezyhaeIvjqJQGDiNNYihHOkIef/c4mQ+hMv5sEIhwgIPwi3uMvkw6BFejcEmFoOzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543925; c=relaxed/simple;
	bh=1E3mWlIAJIS4jvvBEB209GceYnF9c8xQsKpzfB72obk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X7c7EvLSao+8WUOTs+BuF9BEcbl1Evckw1IAlYvt1sONeua0Ienhh679MlZJiNpn+y0Vdn/cNk3brN5K6yP1wKldaQAPJHwDfa3ECqMH/YiBlxoKJfgj6UF8/bzus8wJX79CbPu1P6M1xMh6NWB5bmy1IbAxcktp8hVaQ1hQNEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aip9JoY+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZZ2SrWUh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aip9JoY+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZZ2SrWUh"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546F2X3O012196;
	Tue, 6 May 2025 15:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jAqDJY43bk3yx/+aN2
	P1CCnb+K13jAJVYqupriW1cvE=; b=aip9JoY+TwlTC1OE6Iui5+MhQfNI5FvMIr
	Qk9Qs/wjmdx3CtsbwvO/1Emg9afgdgBFljGlBiwQeS+I0hvDQ6+/pED6DI7rVhMB
	JiAAmtTUBKf62CzOIJZoS2gLpDaInsX4zRbn44QifaGl4dL5jcpCcG9n6gwGgMNf
	3b50K7fyB6AkvLQZcNug4/gCQv24QMqsYEJDpNmWB5d2xrwn5DlfdfXZctVYlOkO
	KqtDOzAgYj2/ilLzd9Ypm0ozyN8o3S+hZ8VanCl7gurJ9R8P4jPJ1WXrepSJdeqN
	jFYTXQZP2hTvsKEKM/k7p+SAlS5HhPPKsy6ZNSPIf4BzdSguSg5Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fmq8g06r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 15:04:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546F1Z8a035493;
	Tue, 6 May 2025 15:04:35 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kfcu0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 15:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE3Nh12DaApT5fcYZgbDObgl2fbpuU8cFoJ+376YVQQrdeR3d8nJi7OCikNk0lHWfFSmsCJROPWYsr7j00DPDOO90oKSbzJus96uXXMs6uGNkWjB38GyzS7eKvz04PxX+96gdtQX47vMWQGhaUxbULpxQSXi18q7ObAg96aZmTbs8jn4kWLJs1q1SVoOIOiYCkWyddhGh4+wlJmsBEuKrg5g6c8uM1vPnVkZHb/aZuP6T1z/cwkuYhXHSU1PbTpRmFflpqeG5YbM1tIf+7YFxyNr0jzPiOtznyRs98KLt9kEzvZVZxUnkfHchI/jOBxpbJnemcK+r7X8kU+A6NPv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAqDJY43bk3yx/+aN2P1CCnb+K13jAJVYqupriW1cvE=;
 b=QN9e1cYz32VJiOSOYRse9dKD+R+Tk2hfarTfYXXwhSF+lZYwu/NtM/Bo1h8/4IZIG+0hemgjn7t0UwFVRTRsDemKLIGFHwEn4cWmyFXPv5G+aV4b41JWazdKPECmcVV/Ku5wc+611fExKUfp/6kggF5yxPOn4mMuEjFWIjyuvkXrv6cNqgF/UdKHHGngiy4LsYzESCVV/fXkyDakAVuSxK4BGXV8YsRrrdW/MEAic3PT0a6UG1DpbJrI5jgr5aguCb2sTj1SXFpZy0WwwGtt9Vk8tpbZ2wde2htV0gdYfrOy1y4arUEi8dFCgjqLyFaUB1pxLU3/oA91MoGtIINcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAqDJY43bk3yx/+aN2P1CCnb+K13jAJVYqupriW1cvE=;
 b=ZZ2SrWUh/iJNLAy/vCvUSLS2XIKj3Y4HFrzbcPsQmx2ogc6qT7GbCTu/zZgwYHePjWq+dLOvh7LapbpKgLpap2yuAvypK5Z3x1FGHRLSqsmMpRRicTyYOVDEceON2RVuK8PyY2IpCsI7chTL1wX+ibzVwsQSDVns4yp19G/rJHo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7226.namprd10.prod.outlook.com (2603:10b6:8:ed::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20; Tue, 6 May 2025 15:03:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 15:03:48 +0000
Date: Tue, 6 May 2025 16:03:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
        ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
        quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
        yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
        namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
        ziy@nvidia.com
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <2b66e535-301b-4ab0-932f-46db376be410@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f52746e9-f57a-4e65-af48-f5de3c5887c6@arm.com>
 <ec68b9ac-5d89-4048-a680-788525870e15@lucifer.local>
 <f0c57d50-075e-4ff3-9bcd-4b223eb9fd8a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c57d50-075e-4ff3-9bcd-4b223eb9fd8a@redhat.com>
X-ClientProxiedBy: LO2P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: e80eb4c8-1726-4f14-b781-08dd8caf348e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6GJ6Cs6TsoHH0lSZcaLZ0OpFlQn/vaFT7MpmjgA5kuAoKt28opq5WquqLKDv?=
 =?us-ascii?Q?2jpOmXhJLkQuQx7FtmMl52QUOUVXNxfRiAAozmS4+G0YwW2yzYFuYnBo3gFd?=
 =?us-ascii?Q?JunUNLOYrLdU6vyz7RFQGveWat/alb7iff6lDVB3fCx+DWo/bcp7RIQDV6Jn?=
 =?us-ascii?Q?l+eHxRa+Lse8zYK1xwZ0q3HJEtoy53Y3BcAZeO62ht3OFpq7FpKHKbOoLSqi?=
 =?us-ascii?Q?AK3VyJ+WS7gpvbpyNFO/QrqQ7sWvIZC0jAL+FCe84rkHWBMH0C3zjw1dYpqP?=
 =?us-ascii?Q?r2E+l7mIr6grazlyCb4gVBhafr/VAX7OnZSWRa5voWFUXW5RyqOfjIBG8pVA?=
 =?us-ascii?Q?Sg+FN9swL4AVFOWAJ4Fu440S1o4tzvdQVn8Yt6V0n7DsSO2NHV+pb06v64Ul?=
 =?us-ascii?Q?orqDS4KFc+xdGW1hFud4jZ/AZbw3bHdxn2WS2tqyFoas+to68ctrWAAMICL2?=
 =?us-ascii?Q?s0932BElBvGNnwxBBRt4ygzswbSHbGRtPay8oKOVC5tj2MoCEOHmlfNeN2B9?=
 =?us-ascii?Q?fjDQRyO7wyY2zNo0ojf0afdl4VQZ7wC6PvASpxjslX1ETxbk0UsEG/xNOmUN?=
 =?us-ascii?Q?tzaJwWRtwn8/LWX8FWWOMMDkG5Kq//q/ntvFEy8VFglUAHcQbnOAT9xreZjT?=
 =?us-ascii?Q?JLHsaieljb9BNvNDGts2VLyu+whtUry6NL4wLpVN/l/3ZhHTLjl4avdeKkEm?=
 =?us-ascii?Q?UEiaJp5h87EOcdqvOneb3NYAjV9QZA2TFvLzPvaP73wed+1OmDawqGJheDWG?=
 =?us-ascii?Q?kHvrSOOpXB+lPelbI9qOY68qo8b4UmqRSnTt9R4MYA+lU8ECoeCAyREDxQoK?=
 =?us-ascii?Q?1lgjZ2Wg+6sfHrwdas5btjlQsaytAj4uufeLq/d+NUUwAAoNi4BSMjb07rlS?=
 =?us-ascii?Q?zRvbcNrhEYxlkwtcXrmx3+smW42HGJ1PBo0h/L0M5wfHMv1ncKmxMXLkzOa7?=
 =?us-ascii?Q?wIcQKF7wUxQb1C4K3AZffoOstOYNJOv24SJLwS6VRtoCerQqKFLtdgiKpz+1?=
 =?us-ascii?Q?qLTgeRM7oHm1OxFFdEX3tCIQJnjJ6baL2yK1r1F2ICco6UDObisP5lKinO3u?=
 =?us-ascii?Q?qAJ7qGcB+Tkc6FCLLfEEyq4AEhlC7k6bxwGgxM9iQzhlAhx8EN2vsS2UJ/te?=
 =?us-ascii?Q?5MnEndlJcjNLx6FdakvkDsyt8eudx0ULiTWGIwU9dpeIIpuMV1E2S3rw5q4U?=
 =?us-ascii?Q?rygvR5NY0liVj5k0chhuwQjiOqcePSQwwJbIq9f4VfawQqrXA3SWJj1yV4eN?=
 =?us-ascii?Q?vEZwrjjb318iGbapk0RnuLMMgmN7LB5X+O3e8Q6BgILMnjBfQO3zyOnH9EKj?=
 =?us-ascii?Q?W/N3F+0XLI8/5UWUMtJVqb7hRIMGUVRrjm9+PmlN6pMUVEI40FFpsxcfW9ds?=
 =?us-ascii?Q?fSLDNtQvtzZEc60cJHRqNXrJcI92wI7hURMNoWmxVWfKEgBPpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?us2U0W/zjBVSPxVO2c0UDdf2PNdWrMUGKBwFJIPNdd3kS6VHf8TYqSDxbS2e?=
 =?us-ascii?Q?aqDMClIDUQW+tAAU29f9hxz/eb2nHkiz3VzMg/ooMdrSuaj5UuXRDS90ZuwD?=
 =?us-ascii?Q?3bkw592pcXvBVHGwzATFwrUj/jpMt081D1RPw90pT1ZNhUz6wnjEfkei2iUF?=
 =?us-ascii?Q?9AdBcMaPBcpkgo8miKf98b4KrFytdY8I29ZkU41fClYcp603LiMnJtXNWDRp?=
 =?us-ascii?Q?GctVIDc7NFTRaSQqnEkWZZvDpgyX7o9Yv76/kBOdnqvfEmi1/BiWiBFsC5lu?=
 =?us-ascii?Q?Od4+40qex3XV9AF5Nx5H6qiJ+aTq+PaWTi8xIFGP5CJ+ZK8oQEkg/VDH3rtL?=
 =?us-ascii?Q?XbtVoxloeJ/wAjftHS1U6DUicPNHsCPPCCobz2xB7AgD0FJFW1hYxmBBlYJz?=
 =?us-ascii?Q?4TjIQ/LnUGQRsrb4ZTjxINBeW9qmFZv2P7HMNlrm7MsVGn8qKLzrGinagc18?=
 =?us-ascii?Q?PZJZsTZsSPhQNI2V57q4U+pwLrS9P2MddJcQmLTeUiKQ6fu0XlM87MnepDzx?=
 =?us-ascii?Q?y4NMqZeS3TGqiHdIqSRJRT8Eext0qBqdhH4qsikQ5HDzRvqi1x0jyF792YDC?=
 =?us-ascii?Q?zxvVWcwtNDyS+HuNmghrOBKIMTLooawsgWgXzR8WqtyBhKAY+RQEZ1EVXpKN?=
 =?us-ascii?Q?eAeCaqp+FlUN80MBlVtQJUY2lB6TVovyASIqqoG461mmN6AV1+QYaKGoMfJz?=
 =?us-ascii?Q?aGzbILJxMw+/01oG5ej+RU0oKAPjpmF1FGoSDzzaP/csFJmmzcIxDiqurf4t?=
 =?us-ascii?Q?UEpBrpyF16znPkckj20uoVfdH3XmkgUoMcvHBOe7c05mxYr5JsFFbvFJHkU/?=
 =?us-ascii?Q?+WqTXJomdHdKsK7EDQvfC/DgklRhImr8sTANXz5MtSFTtQPIPfHniI5/AF/z?=
 =?us-ascii?Q?LRMwiZ/m6lwGoRaDTGTPYVL27eSxTqUpypKkx81s8L6enJx0jFxjEELOUd/9?=
 =?us-ascii?Q?HkJy6GCGkuFevdgkuEbnRRXjR3kq5kVExMhRWEixDfALWGfEv6PuDKQpC+XB?=
 =?us-ascii?Q?qg+eRV9TR/lKM77WFOOPdHqR0+I16j06yIEE5PA9gtQLNpLukJVEiBQF8LLr?=
 =?us-ascii?Q?9/4Iw50nRMeF5P9BWGrqkkWKsqdouB5ayntnepB7eNjf3kcpv4gfC5n+FVFR?=
 =?us-ascii?Q?eImigF9QIJMKZZQF4YyL/3tG9FE6I8kRKUwXnkpjTuB9TW2MiffvDES2i4a7?=
 =?us-ascii?Q?J2jbHRaFKhiGyiG28gqUf1gKTAmpqVmmF46wcVoC5EozG+G/bLYhsnmAIkjj?=
 =?us-ascii?Q?dIsCj0O3MEiifOSE5EymHRJJWAkw439EOkt4K2gNdSY2mpiV1/iu7+ncUuys?=
 =?us-ascii?Q?eqBNi8aiU0pcMVKGv3aVvAejibwOtwe6hxnXimKtkfl1re+rke3SZ1RXC/n4?=
 =?us-ascii?Q?TSUyno8Ka+4nvrGA1c0RpzCgdW9nEToF7uYpO95B0jNBsmSZ+O5KbGo9I0xD?=
 =?us-ascii?Q?ZwkLb+jN3MKLSWR5kNO3D0sDxFPDRXHsJNK0tHS2fBzMab5G/yh/qE+Licy1?=
 =?us-ascii?Q?0C2pCFeySBx1YTFPtimzSkwKh7p/riJUzZePELBkmpttUg5VURMuJuOX1+eF?=
 =?us-ascii?Q?MDzIUo6oPE917QqgFwfDg1jzs0n7THzLsitE4HraPqABwPlt4TGj1YCmjjjw?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1hUBdL7XMkQdaeGZM41OhrnfvDIUp7mv5sD1RakVDDIz5IO2u6Sl6lXIoP6u6zF1jZJTFDuxLx11aEhOSmlZCRr08Q40097JuPTB6RYhy0zOOmTCIe63shXiK8dwkZOvQjEbBWWBfV3hsmw/u+TEEFxdGbos5Cuvk9qAd11W9f0/ME9/NJboBcrYp/cOQ0iR6jZmMpAiQUJTZwjCH8QNNq2P0PWMQoSZsUMePr4YEIhaxLhTApyI8wi5xgg9zppFYGY2PWRGu5V//esA+MwpmptO/YKGVFfuVzCEA0ch/eFhUn8ZGNhrs03QgAAhEuzz6r+W3ogix0WWFnHW3eA0nPfHc/gWpsaEqWSfqLhnhi7C6Ah4cfIHOytUYEDakicKF3qHEmxjCXQc8a3m0ZYNYxGzmrMeeKr2Ygzqfso9a4mNfy2NG5dlG2UC0U/22H18OOuzgmNH7L30DKh6vtx3OKuqOWL3lTELiOhhpTnLkq6BPvvl7OjDCx6nT06zb7Z7+pURULxU925ckWyfF8+RXwi31mmFzk03y0ty+BiP8u00RTpVrMPon7FFRvsRULOPDDcF5RPSXGpr0xROQaBajP2rwnFhLvPXK6AryP5hNmE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80eb4c8-1726-4f14-b781-08dd8caf348e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:03:48.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1KtqJooqJLFWBgUpomlGnCiYXLU/tAER/M5Hhh5XD3LKLFtzwJA+sBmMC4A9wvY0M6xagkfaGIStBs2PC79U0gGn7d13PU229TjsfJuH5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060146
X-Authority-Analysis: v=2.4 cv=V8B90fni c=1 sm=1 tr=0 ts=681a2505 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=99iU96PbFBZkkQbvcO4A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13130
X-Proofpoint-GUID: YfYP4xXnHaa1X_M-HWyof3aBNQndx5qr
X-Proofpoint-ORIG-GUID: YfYP4xXnHaa1X_M-HWyof3aBNQndx5qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0NSBTYWx0ZWRfXxzTmOwsIrMqM P6yG6YSelHU1P59owo77Hr0tdIXiKab7mTcFGRhsZoE46/2IU+TlJxZaX9l4TtxMywuy8FZcYZe i1zJk6k5OdmXPurKDUOd3lNslverYaaosE8hTLD2/KEfxWmSsf/BAjHAYOXlpY8watAA8lZOxkZ
 QLOitX063USrQVPZafzlNthxwRCR9B/HhgqResqkQg9VB4Gro9hyG08rFflTNEj6h1KyaNB3nkt 9f8/lwsFPPEdg8exgAz6cE15FGcdPUZet7LvX+hd7/criZ8a9LUBg24f3rTrPA8Iubmd0QZHfUb V1eTXwvS4b1S4Kw4nRDaW4a+UsFGvHE3FlYYrMFQWjNlZ5VUK1A7W/s/Gys6xxuR1SZ+GB6NcCO
 +6IoUkOoTTyBLvs2OaWSNKnYA1WRl+U/GggdwN/Of4mfQgTwP+l6eH/bNdxvfJb9u0OIEuaf

On Tue, May 06, 2025 at 04:30:18PM +0200, David Hildenbrand wrote:
> On 30.04.25 16:37, Lorenzo Stoakes wrote:
> > On Wed, Apr 30, 2025 at 11:55:12AM +0530, Dev Jain wrote:
> > >
> > >
> > > On 29/04/25 7:22 pm, Lorenzo Stoakes wrote:
> > > > On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
> > > > > Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> > > > > Architecture can override these helpers.
> > > > >
> > > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > > > ---
> > > > >    include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 38 insertions(+)
> > > > >
> > > > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > > > index b50447ef1c92..ed287289335f 100644
> > > > > --- a/include/linux/pgtable.h
> > > > > +++ b/include/linux/pgtable.h
> > > > > @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> > > > >    }
> > > > >    #endif
> > > > >
> > > > > +/* See the comment for ptep_modify_prot_start */
> > > >
> > > > I feel like you really should add a little more here, perhaps point out
> > > > that it's batched etc.
> > >
> > > Sure. I couldn't easily figure out a way to write the documentation nicely,
> > > I'll do it this time.
> >
> > Thanks! Though see the discussion with Ryan also.
> >
> > >
> > > >
> > > > > +#ifndef modify_prot_start_ptes
> > > > > +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> > > > > +		unsigned long addr, pte_t *ptep, unsigned int nr)
> > > >
> > > > This name is a bit confusing, it's not any ptes, it's those pte entries
> > > > belonging to a large folio capped to the PTE table right that you are
> > > > batching right?
> > >
> > > yes, but I am just following the convention. See wrprotect_ptes(), etc. I
> > > don't have a strong preference anyways.
> > >
> > > >
> > > > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> > > > the name?
> > >
> > > How about modify_prot_start_batched_ptes()?
> >
> > I like this :) Ryan - that work for you, or do you feel _batched_ should be
> > dropped here?
>
>
> modify_prot_start_folio_ptes ?
>
> But I would rather go with
>
> modify_prot_folio_ptes_start
>
> The "batched" is implicit, and "large folio" is not required if it's more
> than one pte ...

Yeah that works for me! The mention of folio with plural does neatly imply
the rest.

Naming is hard :P

>
> :)
>
> --
> Cheers,
>
> David / dhildenb
>
