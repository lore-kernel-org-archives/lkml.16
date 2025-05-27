Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF625743B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343065; cv=fail; b=lpTqyJrQoMbfHS56cxfG3fcpw03DX290KiT0k4Z9iYVzXMmhIEhsd056YAUsOUwM8m0aK5y/PiAj+/etVqx6JBjBfQgyGfAr6NsiuZA3IFqsBTSij/27QDlqz9unmWuLY+hyaDxyvmTsslyLkRbVUcmiMuX1ML8run3ZpZwvwr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343065; c=relaxed/simple;
	bh=uxpU702TVckPw+n42Z1TTV0SMO+SGc1bTE4ndGrMbrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S9Ua+B+8tR15wjYRlzwxVmWhJE5ynF0j/SnQrYVH/j6d/rT3wxo0fXKnn6zGcVpdOUNTSoBChGMOvpq84bIEFWsS2wRRIYtEu8rmeaSnnhKYhg19hrsLiFHeWQh1gId6F1x9xPM2KTXYuG0nhfEfFqrtb1Mv2ndMGiREL+sAu+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fGqTiKeB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NRvK15yA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fGqTiKeB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NRvK15yA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69bK2023661;
	Tue, 27 May 2025 10:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=siQUPLE31O98FVd9cR
	qHafRKcQqp/S661Z5e966tbJo=; b=fGqTiKeBekGiEH3xurJusa3PzRSdZ9NHaY
	FGaMloJSl92qWFz3Sz5IfqTOldZ+cLHqXLDVe+RA3HPOp08GDV1sgvv1GqrTG+Kq
	Zd9pAxSDqegX8EOmzT3NBSefq11MAtiAIIiqPn4OW90aO5ZxyqUjmBQ9upBSMdJa
	bEY2cIrlOnCgmljOT3E7Fi0dgxLV0Tzmc6zhGtrWtQqF0Sd+FQ69ESGQq0OHljbg
	2kawhxnQDSOgvQcQngu+6NumGby36B0zEsdaOBSj0m+xuC+B8vtGqq06Uw3eo6Ll
	wY11Z5AKgeHFzfh5tgJGrgzzQ6w1DA5BF/Qpsdtmycg7ZiU0neZg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0yktyhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 10:50:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R8wJhS028540;
	Tue, 27 May 2025 10:50:14 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j8qrej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 10:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgufCSHI7ckUuN8CjvfqnZHlLd3gfWcNrQH3eZp1yuhDIPP42cMb0PimJQJG6p1nude5155otKnhij7Kg8hTcwFHi0YSsUZkcWzrrwsrqfQCp9D/KGcWKjnoQ5Dvpapy+AcRVz621MIt6cwexJ/oD+cLjWH0rc23FKln1paKgCcfbiwt9KpfdHwFB28v1FDX5RoPgW7OWQzxt6iAy1Da7RNuCCV9BJj4CdGQwLM4lEuaFchfdCpfxAsrG2OLoMnDhqV5d7dCpdLZs+XstIdeQ1D57SxHa2rGG5NSJ+wd+iuY4Pl+IUeZy3Mp4RIu19enlIy2KxBGyv3o7AxW7f25ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siQUPLE31O98FVd9cRqHafRKcQqp/S661Z5e966tbJo=;
 b=ixdGLbL4BMWTOsgdDvY1MHmSKHiFPfq11QgT24lMMuBQVi9YNKvahsQvw7oIGlAzi/3Z4UE2YV5mjLqh5a8L0uOTYWWX+0+cQBndhOqLoCI6fbPP1tJWYaweYY9n3vDAU9q8NinuJ551Mq+M/BCj0R7UTmYgojUACuABcMHmh4YGim9O/glza4vLW14NOn/gZD6nzs6hDe7GCO8v4KJObgf4VFRm7V8qC7WAJ5EUW8s33PXDErMeSmD9GkVWSJ53JrqM7kO3lcTO2gxUht52oia6rRY3ttCL4nnc2n4EGgeu8IhCO3qtvZOw5f1Bg2iJhqIDapsDC8ZxHSEF8dxl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siQUPLE31O98FVd9cRqHafRKcQqp/S661Z5e966tbJo=;
 b=NRvK15yAuKRJVFxjFF3/7SKscUqefkVoZC+tOJ5P4z/o4yRoH19WsVKQBvD4s7dNqLxneFlfhjLZ17SMr1RYt54mIobDYFDNjfN+uM9gIlvfGKCDlVNS224qrZJWnljMSZTad5U1t0GFfiZbwwKXyi8e3P3zEU/5bGqnIfLd+WA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5846.namprd10.prod.outlook.com (2603:10b6:510:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.38; Tue, 27 May
 2025 10:50:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 10:50:11 +0000
Date: Tue, 27 May 2025 11:50:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v3 0/2] Optimize mremap() for large folios
Message-ID: <8df598a2-4147-4f96-b683-23e0957fc769@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527075049.60215-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f8b37d-ce94-4ddb-3dc7-08dd9d0c4149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ioAaNzxgLXeVOTS6SiATGQmk1Qbns5misvso8fLjWYdPZhcCD3SaiJzR1uqt?=
 =?us-ascii?Q?WDwH1SLdtQlRntt4VX9GMlQSp0bhEkzcZeCIqUr+SThF6RV2vlm9LxOPZT1j?=
 =?us-ascii?Q?xyqoNwkxHx0luabEYCXEccq1xXaD53dD5lm5ai56AcYfvnxlvD6NasGFn//a?=
 =?us-ascii?Q?vtmwlzCXbgDIMUgR2pKFZ/1GD/4rS/WJnO+7MFt+qZS0AhzF5XzXijKWdOeW?=
 =?us-ascii?Q?9cUMgM/Xhv+IgvuL3PD+Cv5dKyshWMCVsgiPHN6EnrUHzre2M5FkHckOzVCD?=
 =?us-ascii?Q?VNPhNTrHt6GWTvXCT4hgyJy2Lj0vMQKNBKeaTo+KlmgJuWlNFWlSGCUHEjqh?=
 =?us-ascii?Q?zPDUBU9rmHGmwna2sx47WvP7uZWjMP5Kedw2fargVLgMHlaoEfK7tMhvoVKD?=
 =?us-ascii?Q?fvoXlnOx9NkAeZBbd1jlZiEg9mZ4Yu2NQSD/m+TkqbEWl1ppz7m5zLubd8TF?=
 =?us-ascii?Q?9Xjhjh+5BLJWy24Y2F/gG32vruhRUHJPNb5G5HVbnoFmRWSUu2lzVWVq20OR?=
 =?us-ascii?Q?qHwPInVzvffMUUyRKUZKJGwoA+VhBLvf2ni0ATicICnatYEYLfeDFo6Q5hyd?=
 =?us-ascii?Q?9ueRxs3QXRwO5LyXsZvTeAXJSesOYRPuLhdiE0gz7A09Mt636jv3ngvakYLb?=
 =?us-ascii?Q?RN68dCfGEJV0yaM9WKI01ghh7qfcHyUXMQsqx+iqXSxedtLgsxcGUE8rB/WM?=
 =?us-ascii?Q?QTGQlfTOiz2ZjHF8Rs9w5nLrGTzOQYA+1V5JM9tO+w7z7RwYvbk8xoP0KD7u?=
 =?us-ascii?Q?oqZ0eGUtLfk6ZQvt2LgNo9TttCTPGxZve8UpaetiDOob01/Eg/c+mVbt/MTN?=
 =?us-ascii?Q?9HpJJYCOPEEmssyPXeP9QzPtPYHcnFncjpwryQ/NYqpDIq1+/V1DB/3BfI+O?=
 =?us-ascii?Q?vrb22XWJO1FY+SjNWePhkS0QkH0xS6KFr4BI2w0wKDDvqjwCO7YId9Tb4u4v?=
 =?us-ascii?Q?Zqii1u0vEoMI8KtUIytbPcl+b60t3kTAMYq5CzJ11shK22SFijRCVB7roBI6?=
 =?us-ascii?Q?StGe1abGgQcElj0Vr12Yp/ht3B/jmkytd/JRV+3JUP2n73CYueE0pKmcpGpS?=
 =?us-ascii?Q?Z7cS0TbMIuzv74/whwoTjLmkWRBO7iB1x7tKpVjb4x0xhzF5w5k/cv4Q0YlM?=
 =?us-ascii?Q?r2gPL9DZ/M5WaD+b0lQViuBbZXej0wwJxNU19qdsSjN2PcNdrW56XJVHJbMw?=
 =?us-ascii?Q?NZRc4MOs+sPjGn+N/JVtPboZF5BbawkImkaS/BueceRqkIscSb2ljqznicoG?=
 =?us-ascii?Q?rWJX15/jPvm/0juMvXjfPRpGxsU70WmhgmXeKypSKgemPeyWuEHVUxjGc46n?=
 =?us-ascii?Q?ACcExX+wIJZ79QNYoMlsChlB7hbXda3xYFgqKOqdlI8NCvEzILc0tobCoVuO?=
 =?us-ascii?Q?Qe7y3xKjmB99rW9baOCZlXxvUJkGYz9nPGTA6jy/HcAXRpR6cPcJ+qe9LYC0?=
 =?us-ascii?Q?OiTjmVm9+j8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GM30kelwm6EqysnGDcif2JolWoouEPniS0WM6jdlrVCbQcfRwiHKP8T7eS0i?=
 =?us-ascii?Q?y8aPDHtrfBFe3T8e5kaHCe95H0+3y0L+wgjVxlxqf4iDW3nDD00WboJtjLtQ?=
 =?us-ascii?Q?NyLaKrtyzTZR7O8jqA41saO9NJGtWWohMdmYvL52p/EzWJTTEd/7fAYkl7fZ?=
 =?us-ascii?Q?WkKddr+LBngWTSe5AYy4k4HHxSkemPgEzH7cOkasOV67EM7i2ZuIeN68orOu?=
 =?us-ascii?Q?AZ0JR42z43QjOWJS5i45JpjJ0+iFb8qj/40R9CI0g6NRmg5IQnUGYERoPP4U?=
 =?us-ascii?Q?LMQFRwUVUaPpUYWhSEFrC00PTGa0hysXcqyjwya8p2Kuclus2+kf2FwyYeXY?=
 =?us-ascii?Q?vcRwovncbrvJCIcqZ2lN4WsuirBRaROjqW0i8XsDWsJYhgPpwjUh5mSzL/O+?=
 =?us-ascii?Q?iTr4BtfEoTsWQeXX/XqaIAuYi2EqDSgM6l3MXmV+Xs8H8XnB3evbFMUKDXZI?=
 =?us-ascii?Q?bZDg/ASGPgVrprhJUoCyCyTImY1F2n1rIIcIsYB8qJ3IX6kw4HUwTf8dybfn?=
 =?us-ascii?Q?cTgf6uCpFi40OhzgewSZ9OPPdRhugNm2fuTXLfJLwRYmez96lAFiaMOYCc7Z?=
 =?us-ascii?Q?OVxzbXu6j4gDrXGQ7+F2RBiH01zHWHc8TVgWAMFypPb1CsSubP+1qWzjpduk?=
 =?us-ascii?Q?QC8kwKJ2GGr1Cqk8fUNaHYEBvq2OV6jYEF44cKhDwpkACZ5fgdvEBOE1jVNj?=
 =?us-ascii?Q?8Z4ElIH4avrPGSlELf8ScVDhPn8VDL/vbjYd9xBuHc4SVb4+8iPwlHGDluf0?=
 =?us-ascii?Q?QzyJNTUCGF3TNKMbSyjgQA2UocXvkSvX8zXOUQkZlXliEu/5Rjv0hsyD8Paw?=
 =?us-ascii?Q?7gdEUaKcks1CcZvwoDINYTS6ypAfwktu3cBDcDH9B2i5sqqrgAFRF2wEnX8C?=
 =?us-ascii?Q?V6L1ny148LeMbIVLrfaK4jbBaIKji+dRh6Wn3E6zgpooelyLlMoXLzjRrBHC?=
 =?us-ascii?Q?ceCeL2fcecZdu5C9CRIFcMInylGrmU5xcKcmogl//zDQOodDJk58htLM2e/T?=
 =?us-ascii?Q?HKgxoM1qOfQKxLTHRoiI61Uovd+Z6j3Zjwp9QDybqlh/Rvmzzb017ZYzf0+z?=
 =?us-ascii?Q?SvRYFnGlhOZR2RVhK0twOJjETIlc7e+F97Nyu0wH9G3EtvMxsVEZ42/qhDtr?=
 =?us-ascii?Q?KwYGimRpwSNVS/x+mc9tUi2LPyh31U6iYWBvPMlMHC4xz6tkEIGWVaF853Of?=
 =?us-ascii?Q?IaEMXzgI/Ph4VEP6PmV/Hi6Wpi1qb2GVGP9SxmyADyWCjHLfZ4D+i01QlJD6?=
 =?us-ascii?Q?A7bKtXS+MZpRt5/GHQPHOk5FQvzjwlB8469Si9Td0Mk1HiPHYY/9o19ZPs16?=
 =?us-ascii?Q?U/U/i/553v4/xUmQr0nM2GqESchVs3EFcOjnnVZXhY6iVv0BDLOtbOWbVGmA?=
 =?us-ascii?Q?2EHEhH80wyctvGdkpr18Fwj5B6Pn8zqb8Ii7S0fiL5zgjwnu2eFUqM9vgeZz?=
 =?us-ascii?Q?WEHehTrA2QF5C3IFtv5dz/ggS/eT7s2p9bh1qbaXSdsx6St0FwjVGt7I0VeR?=
 =?us-ascii?Q?DGnkAWEs7hgxRsCLn0uC91te4bS3W6eGqbCSYRDoGbbUnCMfxfYKudlUO3G4?=
 =?us-ascii?Q?5m9RYcSU8P51m79obG3uDJ07aDS7hG7evNtLQax0fnOdYnrOAk5/dgC8M5qH?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5K3TnkliNqnaJNF8IdM6I/AC+jB9ZdXdehrvrt9O3C7FuULxI9hUMwomK125N5MzWhg/zwR+x5evs8wCYk6BOgSU7V+4W0K9G9PfMfIzGPvU+FhwO+0IVROezEFJ42YGywNShKndQyz456ptiGWyUHgx6jjvdyj8D6Msq8j3QyWpe7UKcdgtmejLj9QENGj6zFYyp9jBHdLe7fwWhWpcejrykv+NexqRf2zuMpwgi4HDPYU+bl1WQhnknqTthr8Ok6P1rM3meIk4S/ayFxlCHCBRZTR+XfXYcyZq0DFw9wlxpV8TW+whin3rEusGQr2mT4PAsWvTRe4xV2SlbqjVMgjb2MmwjQoCP4Rz4cUtAvh/GE8vheGyQ7WY8ZJGTavj0r97FLFGxUm2NOdxve/w73f61PX+3DlxWhN12xHHdaqSkLUwFkI9iIhPtseo8WdQ6pYj2/4uMCyi4EstTDe5enM9zrghjilAE+fj7e4cytx2SbpPlrtVCpgCXR2bWOGy8zDwmNPh3Rf8GRi0EzwwDsnMQ+D1WGFeWKOTDBTX7vQhNR4ZjyIdke5OX856JcnCwwqZ7hD+YLzeJYTLNK4YKBAe4al7f+6YILPToZeNGh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f8b37d-ce94-4ddb-3dc7-08dd9d0c4149
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 10:50:11.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHMgSvNRZheq4qZ91QrWRlJxZv5wYEBTQGhAIZisxrXywlEEnLAzJQSdwpApqiCJGwbrQ/J2DqSiDG2/+7ETQodvBD1xqDX4SjIZQCk2zSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=736
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270088
X-Proofpoint-GUID: FaCKFLbxgz5k1HYVaSCXnBA0sM9MVW2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4OCBTYWx0ZWRfXxkuzM/nN8/dr QBLjIKwNXwmtjlK7d+BVqshvoPUtlFU+G0MVBYbGvlkOj8IgLxEdl478WgzonacCRQ840qQziF9 ONeSWAT+mAItuHdu4B0U7FJbkWxVO63XSwO55mgJeVV9yuQtveqZO823his8g9plyohd0yPIfBU
 zZC6fF2sPwk6RGkbLk9vYHKgtfTfAo7s938qMNW+2vZkoddz9PWcP6MmKTXMpqVcfeKHVZprckM jI9sAAM2vR60hiypauYraTXUX2OcjT05U4c5z1hKRHZGdRZ0HugvYMia385Skbg/341R3z6ekIr NYWpCHcYmtfD7aMoCb4qIKduVrh60N/zysmec6/17bWxAG5ZAtwB7BbFRhLcQiRTCWDjBNMxRyw
 59DFHE4rms9PIc4eP0VvgR7LzX+a6pQZGfIWDQgu3BQQw+6QOuEeju+3olmNMVDJI7EpFE77
X-Proofpoint-ORIG-GUID: FaCKFLbxgz5k1HYVaSCXnBA0sM9MVW2s
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=683598e7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1vCDX5nvQsokeVuML4UA:9 a=CjuIK1q_8ugA:10

I seem to recall we agreed you'd hold off on this until the mprotect work
was done :>) I see a lot of review there and was expecting a respin, unless
I'm mistaken?

At any rate we're in the merge window now so it's maybe not quite as
important now :)

We're pretty close to this being done anyway, just need some feedback on
points raised (obviously David et al. may have further comments).

Thanks, Lorenzo

On Tue, May 27, 2025 at 01:20:47PM +0530, Dev Jain wrote:
> Currently move_ptes() iterates through ptes one by one. If the underlying
> folio mapped by the ptes is large, we can process those ptes in a batch
> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
> For arm64 specifically, this results in a 16x reduction in the number of
> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
> through get_and_clear_full_ptes, replacing ptep_get_and_clear.

OK this is more general than the stuff in 2/2, so you are doing this work
for page-table split large folios also.

I do think this _should_ be fine for that unless I've missed something. At
any rate I've commented on this in 2/2.

>
> Mapping 1M of memory with 64K folios, memsetting it, remapping it to
> src + 1M, and munmapping it 10,000 times, the average execution time
> reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
> on Apple M3 (arm64). No regression is observed for small folios.
>
> The patchset is based on mm-unstable (6ebffe676fcf).
>
> Test program for reference:
>
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <sys/mman.h>
> #include <string.h>
> #include <errno.h>
>
> #define SIZE (1UL << 20) // 1M
>
> int main(void) {
>     void *new_addr, *addr;
>
>     for (int i = 0; i < 10000; ++i) {
>         addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (addr == MAP_FAILED) {
>                 perror("mmap");
>                 return 1;
>         }
>         memset(addr, 0xAA, SIZE);
>
>         new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>         if (new_addr != (addr + SIZE)) {
>                 perror("mremap");
>                 return 1;
>         }
>         munmap(new_addr, SIZE);
>     }
>
> }
>
> v2->v3:
>  - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
>    indentation (Lorenzo), fix cover letter description (512K -> 1M)
>
> v1->v2:
>  - Expand patch descriptions, move pte declarations to a new line,
>    reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>    fix loop iteration (Lorenzo)
>  - Merge patch 2 and 3 (Anshuman, Lorenzo)
>  - Fix maybe_contiguous_pte_pfns (Willy)
>
> Dev Jain (2):
>   mm: Call pointers to ptes as ptep
>   mm: Optimize mremap() by PTE batching
>
>  mm/mremap.c | 57 +++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 42 insertions(+), 15 deletions(-)
>
> --
> 2.30.2
>
