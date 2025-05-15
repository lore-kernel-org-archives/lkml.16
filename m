Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121725A2C5;
	Thu, 15 May 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333310; cv=fail; b=ubemNLkM0be1Ihz4ytPJuxaUYgUb+xjy3Ndx9nv0sM2m4qDhB9TZYMTQZXSRHCzsU5AhPxE2TTlDV1/smVwAx0xRg8xk3mnK48P7khRpJ1fqvBWhlBocRmlCIRFB/xyP9tfaI3616J+smKRzWC6FvzsiXTZv+kejY8pYYEBKS6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333310; c=relaxed/simple;
	bh=g1vZNr93DuC3BaH8WpQ20yZEYWCAzwJN0vQgeQ4Ld9Y=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U0QShNT0Ct/GpQeOVVK6dw65jkrZH2weD3AGu8+8DfWLBvGZZOcjcbX3BM4Moi6ZpYfT636pZuuEVJDLk/qIpJHFlwkrXzc3Ygdk3dteaxESvmY/Wi4ZEW4o+g0XHWN/xAdSwVpsYJYMNkZvsEJVHZDaR1fN3zNzxDnNboG7GkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ep/y3S4d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mnj5FYxA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ep/y3S4d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mnj5FYxA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1nU7007267;
	Thu, 15 May 2025 18:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=e2MgJC64nJfxVf6lj9
	pLxcC0fTJh9ouF2ZCbblMEy/w=; b=ep/y3S4dBs5HiLP+ZsRfzNk0Mqh3Efoh7Y
	ZNJzLfSHABcIRA+xdYR2A95oq2FI4uTN2OVj53NxbJCw5YhlL3EWYRlt4ztYTs5x
	zhic8T4eJFtH4/u7Zj/upoRzRf0NV2uAxOxmIZ9Pomsb8KMEI6UmKoedcrc0vwVi
	tG35uOgU9fMiMOPvX73YW/TGn9lzXNNEa9u8xCziSF/n4Br1AHfAwr+RuiDE769z
	YaIdJ9drWqlpD3i8nwS9kzxY7+iLSR8yIAy3PpxH+5AJVe+a9nruM1BOOPVU9DXa
	LD3A11S5Pgf/VHk9JLy0E0yr+voSYb1hixFXyG6l1zZHvpE3SG3Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ms7bupwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:21:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FIF4lV004526;
	Thu, 15 May 2025 18:21:08 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010002.outbound.protection.outlook.com [40.93.6.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshkwn2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REjWkIwkPlyYyvnogPzXtja6vWkQT6S8KSZANpv7iP2p6/5kqz08QHnwoZidnP8Dz+lmAxwACxKlCaQFu8LBwqb+X7UFNTXQmvT/CVSoBHDYi1UTDoVnKvUFbsdsTQOyS6g9s6zt7A0U1UCcva7dizb9gCKWU09KmxwTNalsp57LGmW/nteQAEdMIA43UI1irLu9wiEUT2m490n2gbLui8cTJSclMFjyozLmF9VaulXP3spONzjJqEfPikd97uPSfpoRLSjdHVpDJArDz78uI/7v22IxfQoFWCQ6w8Sd1knWO+GfApGZ9pdxTR2dLrlF9mg/gtFi+AtIyQskXCdPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2MgJC64nJfxVf6lj9pLxcC0fTJh9ouF2ZCbblMEy/w=;
 b=NIoo3D7D81GVGJP2DbNjrldrwYfc4xLdbK19mtGvFpcHxGdDDFoemI8t0/Ib64vUbedrZg9Jup/l7HGTS6yRCVN2vOw/8yRykSNr9WXcugmL2aBhVDX8iCVnMCJ+M+/ORqKkrQZ3t0KNzQ4GuYcI7xbV9mTOz/S1iJ7UXoIx7EppcYiryI63nuZmg8xwStxpN7E0C6B3ehCHVUNSVY4j9Nq5gHQQ0LngCeQ/rjGCApFBzLGwCVstbHfaTgY6rkoUIwM+GAk0IjPKJctaa6m0AD6+BgJMsFz6kGZojLSbdON0K4Z0M77nxrVpDYuPrsI4+mJanPCOfuDMAetVXik59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2MgJC64nJfxVf6lj9pLxcC0fTJh9ouF2ZCbblMEy/w=;
 b=mnj5FYxANqpqdl3Bcekb3C7n+TZDJApzo8Yjsdm2iHV2EKq0Q0Bs4OuFJeAyvKWBuW/kFQb17PcS/a58FJY466ALlGtqh1SHInEdhTVW3umrd0NlTbTQitoOxbTfeLt+UeDaV4JJH8IeMWK6Zj/yzf4Ao6KfWOaCeKh09cAH9mQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CYYPR10MB7568.namprd10.prod.outlook.com (2603:10b6:930:cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 18:21:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 18:21:05 +0000
Date: Thu, 15 May 2025 19:21:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
 <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CYYPR10MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ee3c18-01d9-46d7-1044-08dd93dd4130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yhWUypKZZK+waoGqyfmo1mXN797Ot9fL/rDjcqAbq/16bZcNFFFHysPwjdyq?=
 =?us-ascii?Q?R1tAJRmLlCBOKlzdCkydGHxCoSdUMbk7sTVe5qLLc+6evBoHaeKFWc/Rhn74?=
 =?us-ascii?Q?pGEzEzFk0hBzms5FOkuA3d/vguz8Awj3jrBiPHIKH59vD3+iyjGL/rv4Jtcd?=
 =?us-ascii?Q?p1ul/v5Rlc5moP1EuH5vULYVuL+zjcZgvYQdLkeOh9gWkpNbG8MdA8nJHFlY?=
 =?us-ascii?Q?2cy6TcfWU3Ggy14A+5hFOy/b2/wtxVAsIlqu9FpzhY0VeDm95NiLF9Lun74j?=
 =?us-ascii?Q?h/3KUgl3b3XCuR6+ZaD4nhUfNRBg0eGkHgUS0gtX0bNERx/bznq7xNXe3zRw?=
 =?us-ascii?Q?TyXSkoeBZ/mE4BTmnAxs/1oL2UrrJUjtoJyQjd+UtFmbhC1kR26Xnf4+ijIR?=
 =?us-ascii?Q?Q/UQUOsapPaG4DNWGJ7L8MafEt1G2SVrGjP3YjkI7y8A7LC8eJIlW//JT3/8?=
 =?us-ascii?Q?Wk1AhbRc9hjJ7lEEwvbMvijZTqOGYcHqMxhBD7/FW3WE2v1/MCqd3wUY9hQt?=
 =?us-ascii?Q?7ezRNYxsXrFcxNo+AThI9+xf+GhtIZk//0AqabhoF9yy1iXQqWO8KcqXqBGc?=
 =?us-ascii?Q?Z1h5heWOj8GrgzjAq6C3HIZGj4ucXIOwCMHhazz0a5eYfjsUY6XG/lbhGkZ0?=
 =?us-ascii?Q?FANzjBYHGT70P3qZAUbR7b3XU43zytmUkm8oEJ1b5ws/GFO40tLDIZ1gEzad?=
 =?us-ascii?Q?oGtXLB7nLMEqEIqoQvQ5MxNN4F3O+n7hQOv/MjRlXzuUhwgOWu+9yokxzIwe?=
 =?us-ascii?Q?3MA/naffShLOq+HfK8TrgTsJ+aSQHrzlj6wHZnYSssFvGSYKE+ATVWRFBjjw?=
 =?us-ascii?Q?vL5eZUz6Gk0+sCknX+kfpdvuPIyGavvNv6ktF1J6zowoBtiKfk8quhkqfwTP?=
 =?us-ascii?Q?b8al11Pg47BO3+FgC25+nAkGpw2h5CIlNZ54yFjRHzH32YZPq8INiaOepZbh?=
 =?us-ascii?Q?iiUbDqX1JwW81tnzV/fIwXGBYDBm0JKXsl0Y1YnQybn8So/Yh22TG7YXF6kP?=
 =?us-ascii?Q?U3xVV28iwxrvBlyZcFNdF/PELRYlsg3JpUQJA5Akhv4qOAy7zPQgODzH/lu5?=
 =?us-ascii?Q?XfukaK+cDxX2GzQeh11i1GUqebUj8EnQEwIcTp5ih5nQRPBuh+LC20858WVP?=
 =?us-ascii?Q?xqUAkmwv61zIRImfmjXNaxPhqA8eKAd9xS8ScUUeIH+KMbSmT/4gdhdvfe+G?=
 =?us-ascii?Q?WEe7sIqQlH12S/lnEBBJ5nit0sXm0J5kcLo27DhoEy6f0/M+7MkSRskI3ZRX?=
 =?us-ascii?Q?pnBgeaoxCiYXAFXuE18IxJs14WYCjl/IEejV9pxtkGnzgyIh889jaE4OAxyn?=
 =?us-ascii?Q?gze8KzVhY7nWoVw+6y8JN9X/Eq+vvYSMOedOmJnV1e79pVCh3xD1sA4PPIY8?=
 =?us-ascii?Q?dFSn35FUrwkEGBLVovDWGJIe9+FH+8ug5W6hm96cAnvY6ib7LFmDljh6uTab?=
 =?us-ascii?Q?1UVEGTB36twVdwDNcmreQQw6cd5MpB4Bv3lh1yo7h8x5GkU8XwmYQA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbX92DL7mWaltb3VxkbndD5Y+7n1SD5yCGY6LHGAAniuZEPO2K0aktMUO2Lb?=
 =?us-ascii?Q?S1jidZ/xHFgMIyOI+JOF9cGS9srBhKJji2ule39P2hQwV5LObtQ+jrKgSANR?=
 =?us-ascii?Q?naW96aC+UX4ARRAJNLDYAyRiKZyHV7ZATQbpZMNwpq2aTa1Bw/cBTE11bgIB?=
 =?us-ascii?Q?SlQGNW/uQib2rEnQ38qKeQj2j9TdXQsdYm9PKd+Xhq0VI1vdYdhZ2ssy8O2B?=
 =?us-ascii?Q?kMCZvomNq8QYS+2Uo52YK7ExCUzg67bgh2mCN9WfkPYkH42VvxD/IK1rMAhO?=
 =?us-ascii?Q?BaX53MdgFDtzgQaeaYTLacHOAKLfxG9gM3gFiYLEJIFiMcTXSgf0GH6IjCNE?=
 =?us-ascii?Q?/wvNKgXme84WNy419l+/BQ0h3/HiKLktHZzeUTGFwrklaeidQGatbsREt0dy?=
 =?us-ascii?Q?7ev0DPHxGou2ijfMU2DRi6qrl9GBJO67hZkCVu0D9P49nmqHUBDds/AktwXj?=
 =?us-ascii?Q?lt68eC7/9Ep+hshjcYvAYbn/zAzVtR/+74lrDkgVCzW9ZTJ3HvFT1ApeOngL?=
 =?us-ascii?Q?aeokkQoAaFD7MKnfzUt3EmO9CTvDNZ34+wg3aJ19O61U8An72mYYqm+KF0KU?=
 =?us-ascii?Q?OV7F0U+VmnkhW4pTF3Nd16b55Q2uR1SNkkAxFaVOraHJgjRAMLolbsWtE2k4?=
 =?us-ascii?Q?MWv72Zo9YHWf1puj8zmm/0MJxcsJRqYeGDruvyHWUKH6cW1rRThOE9d4uS+I?=
 =?us-ascii?Q?/livvBP4w13OS/s6q9msEAS7NrB/6upIrJMSAvIT71d+x0djR984DGC0cPUF?=
 =?us-ascii?Q?umnXpulIJBA9WPKyeKpLveKN8rpcGL+8lU0HaPKv3oWpEsqt+Spwwa92V4i9?=
 =?us-ascii?Q?PdATLhyin8p9yY/lON90juEh1anoY95FeS1pK00emCH8uJ4rYQBTkNwVTbMG?=
 =?us-ascii?Q?cTFLUkDMPOeSX+gNnLMxMzT3X50XwG7LljRST+uSHlZ2j+2VXgTEufUukowr?=
 =?us-ascii?Q?5fuoiACbMzzorETmfzgoL6ERkLLfKp9Kh/dcEwo+frSnmSW6Ixkxu885/fd5?=
 =?us-ascii?Q?Y7Q4C54iiUcObPajhJoQKulYUUT93G6Ocxz73J1eDNRQOn1zqMpGYA+UyALM?=
 =?us-ascii?Q?N487TmdQ2/iv0fXlW+y143fHl6Nd5FslRvtEBkL4tz7iA4iHlofUDksntM6d?=
 =?us-ascii?Q?488g99wULy9v4OBPFIk1gnZl1iLdKLVUcQFCq7PMX/rod7ns/0q1jekFeDRW?=
 =?us-ascii?Q?ub7epHstB+S1xMjTMzl3MvMAgRMlGhWmnTtyb9cK8MCsFSy0kGssqTJ+92Gc?=
 =?us-ascii?Q?MBkhrwiMpui07/Jar1Z1awbQm788r/n+bUL7enQFqUPFoh05F6CYub4sIxtX?=
 =?us-ascii?Q?ZtNjrTDp0HAQxVvONVSU6tIJTn+uMDwd121cJ7+j7Q8cXFzD07xZUTrOHUB1?=
 =?us-ascii?Q?qxSmxJABDuKi9qrc6U7HwGp3OP8K4fXjO05JDEsGY0UxJkIWae7Bgjb43/Rv?=
 =?us-ascii?Q?pjmEKe60wJTKjvTVubiWKA2iyfBuU0Ad97tdz5H5btt1xFQ4rQgqRhyGwEx+?=
 =?us-ascii?Q?e9uNaO/9Dqspn2bXxI7YZgI2qTKSU23rTL3yUhMWQX0gWInYC1HdmwSiDYq6?=
 =?us-ascii?Q?HnSWz1TBhjIN5fZHljoTa3XLytOdXIonunt0NdaZ0EVrdu0s9MVsqvzUeH2C?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FQTCMwQaKPppFA+NrJU0RH9qR8PXCZ6/xF4WgPMtXFIWN/wba88r/Goqauy0ioXvwZUItsuqECqV6GS9/m2oE1IeMstxRAxAc1iFWmUrtXgln5XHEte2+c69bYF5Kd/tf8de10RM2rjMdtSkqOSSQKMIV3V/H0pMXwKnIk7TRyb2O0WVZP81+Ia9W/RAkeI13ehnOKnSil6oNCOMart1CQJ1QW/P0S4rOUINpQLtLJm2/NJx/4yOvUflqkuTMPKP4OKWDnw7Z2swRA+Hhwp/tsPyE7tYjX5nbRCNhGCcp13+Cz/EWQX+ZHCy26RcV4IpzM3IMPU/tGNlpzA9+vLuGlKdecwHD5PwjQFVz6Eyqr1nkwmQzqSCk1l1sE0h77Qh50pQEO1wRsQXtMgYzuxgClrc1o+UrBn/Im1j8fJneAiyly8Q9TITHT/QncuA339kjBvliDO/DGA3TKyw7WnXMK6ed4cfx2fkszpyOfJ/1GR/4HlUwJZOqWTRaTwagm0wkrlq8VQbquDnrtiuFQkeFiN4I5OJCqtZimXndrezJCGv8+gZh7r7qL5IO8DFCXbSV+FvUxm/8Lx9wvMQn7dOelHRE6uHja8DF+lvSOfvrHM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ee3c18-01d9-46d7-1044-08dd93dd4130
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:21:04.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCeKo3LRwg/zWZp193Jvr7crwpP5q0h/4DFrepdmWwvyKZVjq1NMMrunF5yI3+eBjNGNzTSMK50hGdGfikU7pE3Rzx+pZxIv27LkNDz1eU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7568
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4MSBTYWx0ZWRfX5rRehz9BOtsj V+VKt1Uf+J9KVyHp3gSCqf3y34nErY7fDT1vfwoc755LUl2W0D0n24Y3/GPzlIbVXgLEO7PtPSv mEFpbcgmlbdnVAGJ21EQLSiOMM7OhWBQH8QSqqfTm/N3uv7Cn6Zjck1YLquZB7fYhmkfZdVzmJe
 dD1+ESo9HIFm1y0fgQYFGKsS2ewkLMMEgTZ1GRQZd/1oefTc1gwLYP7nY0DxH/FV51GFZ32RduG dBOb1dtvIwrNpBTD2GLJ7scT0U3WUermt7wuy7An2xbrpbQHfsvT4qCM2Y5Y/Yx8082dQ2Y/OZ9 UUEzlc92vrpbygjWhzIj4mX6iAX5YD+qxcnypbY+fHNSmuoosFWGjiTU4A1am7loEHPQGWRRkYk
 5IkPs+lQu7YSfhXVn7SUX2U4mVG8RICq5ultEAgqKDwzeb7XgMsJy5qUdnSMn9IGGTnY7rGt
X-Proofpoint-ORIG-GUID: 10Wi2L4c4rWtBt1FcNVz4H4XMKnwvSbG
X-Proofpoint-GUID: 10Wi2L4c4rWtBt1FcNVz4H4XMKnwvSbG
X-Authority-Analysis: v=2.4 cv=P846hjAu c=1 sm=1 tr=0 ts=68263095 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=it3rejrvDuAUiFpCk-QA:9 a=CjuIK1q_8ugA:10

On Thu, May 15, 2025 at 02:09:56PM -0400, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [250515 13:30]:
> > > >
> > >
> > > Did we document all this? :)
> > >
> > > It'd be good to be super explicit about these sorts of 'dependency chains'.
> > >
> >
> > Documentation/admin-guide/mm/transhuge.rst has under "Global THP controls"
> > quite some stuff about all that, yes.
> >
> > The whole document needs an overhaul, to clarify on the whole terminology,
> > make it consistent, and better explain how the pagecache behaves etc. On my
> > todo list, but I'm afraid it will be a bit of work to get it right / please
> > most people.
>
> Yes, the whole thing is making me grumpy (more than my default state).
> The more I think about it, the more I don't like the prctl approach
> either...

prctl() feels like it's literally never, ever the right choice.

It feels like we shove all the dark stuff we want to put under the rug
there.

Reading the man page is genuinely frightening. there's stuff about VMAs _I
wasn't aware of_.

It's also never really the _right time_ to do it - it's not process
inception is it? It's when the process has started, now you suddenly fiddle
with it.

Then relying on mm flags being propagated over fork/exec is just, it's a
hack really.

>
> I more than dislike flags2... I hate it.

Yeah, to be clear - I will NACK any series that tries to add flags2 unless
a VERY VERY good justification is given. It's horrid. And frankly this
feature doesn't warrant something as horrible.

But making mm->flags 64-bit on 32-bit kernels (which are in effect
deprecated in my view) would fix this.

>
> but no prctl, no cgroups, no bpf.. what is left?  A new policy groups
> thing?  No, not that either, please.

A new clone[,2,3]() flag?

process_madvise() feels literally made for this, but at the same time only
lets you do a small range at a time.

Some ability to default a process's madvise() state on VMA inception and
having a new syscall for that could be a thing, but then is that prctl()
wearing a hat...

>
> To state the obvious, none of this is transparent.

Indeed...

>
> Regards,
> Liam
>
>

I'm worried about knock on effects too, now we have a way to force-set VMA
flags.

And a working version of this series will involve literally hard-coding
this stuff into the VMA logic and 'just remembering' to always set it up
right on new VMA inception.

It's all very horrible.

I guess going to RFC is also about testing for _feasibility_ of this as an
idea.

But let's explore and assess, maybe there's some way of making this work
that isn't horrid...

I feel like it exposes some weaknesses on policy setting anyway that maybe
we need to think about more deeply.

pidfd to the rescue?? Somehow?? ;)
