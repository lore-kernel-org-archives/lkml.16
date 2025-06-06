Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D520330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749209477; cv=fail; b=ZDEVl7oewhblT8A63oojqoGq359sYExAFrQWWQCFslDiYv8BeAs9Y+u9i72bctccQvO6/RGRkgLcSQpCOmALDBIsPvNY5Earqtfq9HMe/UkycLuKkcP4dMzoeL86P0bR1l9GMSyV2XlYYsT+qEwWml0zTyp/XGG5uj/fQlluwVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749209477; c=relaxed/simple;
	bh=Tah12cOkZAyq6+kzY2NoOPY5IxqcjRfL/zqOYvrR5iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oL0jdqwqCvlLgNDbrs/hFSMW1M4vwFbATizNZkASsuXig0SpCGpPhC7G+zuPYXIox0xdyqka9rMHBlEq7xZSQm8xEKRIgtNCPTrLQ6eEUTzWvo56bqj/YP5yCfGp4KAW/r4JMOi48eBHDJiNZ9bolvhYRFKnPKPdLvD7qPqDwAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P/F46xx0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HTO5c23F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P/F46xx0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HTO5c23F"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MkAL032120;
	Fri, 6 Jun 2025 11:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4UKP9VEvd6VufNPloCe9remfsAlw0e6WgnixysXks9I=; b=
	P/F46xx0bCOO15suoX1xOpXBeI6OfEGYXVrabNPgLzvqqWbvREeTYEaDAW7lVbsZ
	LOpFD3d7V0VJ8piYt9l3WHBThiUft6XR7R3nVjsbWFOeVwCNsJ/DRRtHXz3vEyVj
	BHMrEuZXZAsNzqiuOzgnw7IYdIawv9gNtvpgC2uz/2er60IB2zNQ4NyYXnaQcYhv
	gCaEk9AaMJOW+jzMD6m4HxmbnwXA8nH9kaHs9kxXGpuDGM3Wt441P2zrDMR8wtu0
	2MbutHEmcY09Ghopo7710XaN/AQ65awyA907PcoUF54/ylUMQHQv2iD/Moe3VsTX
	8+lOMIAjH62Uek+j9oF0sQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cyucv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 11:30:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5569E86u000561;
	Fri, 6 Jun 2025 11:30:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ddyvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 11:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DraVTxodNgV3U3U5Xkz7MIHh6a2oNo0AVdV1Mye6kYDkVjbLaDMfO5vlV/OVKnkEM4GuJZV3BzZ44o+V6YMHrNB78B3qVVCTFPNmert/IF5h7mCBP33n5F5tv3evmb4xa7VO5edS/iKjn4YOvQ+BJCJnB8aWPcb4q8Cf9WEcppmrtN7DoIO5J44lXeudVr2JAYBc3ucT61QSZfji8w6H8t7tCAi/Shl0aKRiGlE3Bkg8nctIGk7w0XRQ4QF2SyVve1MDDN7TjICUO3IOGQxCu/2GxKeMSakfOvumnJPa8Hnavt+2uJmPgjLYVdZEcJfDqzS5VeLZ/9MgshNJKCzgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UKP9VEvd6VufNPloCe9remfsAlw0e6WgnixysXks9I=;
 b=ACfyzE7zWpdPyT0v6yJXOmQpZRJmy68LYUQ7pY/Q+kt8xBNZ3yeVhSdoOuFkFZlfoP8e4A/M4IEheOJ/o5EkCsYtNpx4zXaYtR6WfLYAU0ogyuj7wAVmI43gooyDI9HHOzLk33R/Gv+BaT20mDL4QIhBadsSJcRANGrCoMya8u5PXNUxCfWQKaHA3e6nDFKrf62LuzQ2B2hL60vv3ZsZMrZRz6wyRutWxjmuDLijJBikMa1GMwrBQazSYIrvnT1AFBNHGGGwhMbN/YMoeRvZx2hwSaj9xcJIUTst3rvUDbsxafwX+LtthrE8mwObizmFurLkxxBDF8NygDth7wBdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UKP9VEvd6VufNPloCe9remfsAlw0e6WgnixysXks9I=;
 b=HTO5c23F5K5DDgdQ+dAGQhk6qTzytG5OdzqkjYMR/DKQMi+mgiWN405V6sMNuEyjLyVYEHvVBO4IvPi19JytcFtWQmjKi6CnG2r+9a0gbvjvKPGKEiegXv2W17nm5qV2gJYMUg/xAACbVCbZV61TzrGBrFEi2KT+QE5GvIC5Sq0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6777.namprd10.prod.outlook.com (2603:10b6:930:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 11:30:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 11:30:46 +0000
Date: Fri, 6 Jun 2025 12:30:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10]
Message-ID: <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
References: <20250605142305.244465-1-osalvador@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605142305.244465-1-osalvador@suse.de>
X-ClientProxiedBy: LNXP265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::36) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: f61e5254-8c36-4934-f8d0-08dda4ed93e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW1PUlBWOVpLTS9UYUFab0tSUmhCOUhyTGFlT1hodVhKdmJWRFNqR0QwTWQ0?=
 =?utf-8?B?amVTNVREZm5XcDhLNldmS1RKdlYrK21Vdm1ZOEpDZDJHcFhOMHJKbDBuYm5k?=
 =?utf-8?B?WTJ6UjBaYWRoc2tQTTZtdUtpQVFicERLejBlZDE3dm1heC9Ob1diK3M2czZs?=
 =?utf-8?B?VEovc0ZSU3BSeEFaRGIvYklWWVdKZ09Gb1F6OTQ2bEg1UkNqdTl2MnVJQkN1?=
 =?utf-8?B?cW9XdmltTElBK3E2WXQ4Qms2MHJCellUc0ZxekgxOXZsYUxtemczcUY0MjBL?=
 =?utf-8?B?SXAyaDVyQkFjTTNyckNjaXJJZGV1OFlLVTFWR1lydU9nK29qQnB3L21DY3FQ?=
 =?utf-8?B?UEZNV21NZGUrK1VJb2QvSlhmYWdVdHBLQzBPSHE0VHprOG45YW5WdXA5dzRG?=
 =?utf-8?B?YTZoUjF2MFZWTVVJR0Y0QWxKcVRDNXpKZmk4TzBKaFlmUHQ0YitBYlRBMXZG?=
 =?utf-8?B?eTJ4MXNORFhpMWxEeVpQaEhpcm1ybTVlYVFDbThjdG5GZzcyYzhWeldRVGNr?=
 =?utf-8?B?OElJTWZZZFpBSGRWQUk5aUZ5Zkh0RTk4SytPQmN1Q3p3TDY0eGtIT3AwYjRE?=
 =?utf-8?B?YlI4NzhjeThiWC8zOFRiMysvanAraW14QkZ5VDV2VkdQa2RITEJ3amt4WTk2?=
 =?utf-8?B?T3pnOE5VU3RtbHByM0E1V053c0JlYzZRT2U2UElJSkJzcnZ6WTUzeXJjZHZT?=
 =?utf-8?B?YXpaYXdLM0pZWUJrU0ZONjhta1FlVHRXZHZsQTN0ZnhBSzhwamFNOURwaVRj?=
 =?utf-8?B?RmVRV1lzMlhicFpzTjJDYkl6bDJXNTJ4Zlg0TXdlbzQwejY1TzFSMHhNaGRH?=
 =?utf-8?B?M0pNMVF0V1VDY3pZT1l2OUNHTUEyUFV4WmJJZE5wa3gwUHNtYTlLTTZNYTdF?=
 =?utf-8?B?cGljdVJsU2tKSFBHR2dhMVoxbS9pbko5a0RzSTZuVmRONmowdUtxOFhXeHVv?=
 =?utf-8?B?Z0xvek53Mm9CNUVXYXp5NlNNZXhOa3NoZXYxM1UrNGlzV0l4WTZuUlBVR2w5?=
 =?utf-8?B?V1BNcjFDWnp1cVozZ3MyMEl4QXo2aU9HSjlHd3RDaW5lS1J0UU42dnRTQk1x?=
 =?utf-8?B?SGprbHQ0UkVkMFBzRThmSS9Qa1pmOVdKd1E0OVRUU1pxR3hWYUlCNFVhR3Vz?=
 =?utf-8?B?c2lrb09JTi91VVlHdmhYVWZUVURRb3Z4c3ZrUGt6c0NNcTFmbVFweXArNXZj?=
 =?utf-8?B?T0dYbDBNa1ZnQ3U1NUI2TzdFd3N5dC9LTWYxL0h1L2R0RXdSek05cG9Mbitr?=
 =?utf-8?B?RWdFSW0zOHFVRm55SEp3OXUxQTNkVWd1cjJqdFB0RnRZbS9EVU05bUhNZmx1?=
 =?utf-8?B?VitVNTg5b0RwdC82YXZ1TFBrUmpFUG1mUXNsemNsV2hPTlFEUHlsMUVBdnZz?=
 =?utf-8?B?Wmd5dytrTnhwVEZKK21RbGlxeXNlN2JybHdjU09ob21kSTMyc2tPNVBvcWtx?=
 =?utf-8?B?ZlArTUR2b3prdTQ2SGVINWFoKzFMdVExNDl6eWd0UlF3RituQUphOU9CRUFW?=
 =?utf-8?B?WHg4bnF6ajdGM2FVOU00ZHdvTzJkSGFZeTlNNUo1NzlqVUlUdFdkZUtxTG9y?=
 =?utf-8?B?WGxGcUJUSktsMlV4VjYwczBValpaWFF5cGl2eEdSeEpoNit0VllpU1FtY0hJ?=
 =?utf-8?B?UUdMUWhhcjNOVVd4UDQvV1dPU2hrRWlLL2psV2w1N1VJVDgrRkdzeVlDK2VJ?=
 =?utf-8?B?NEJSMDNqYXdWbGd5TVVXT2wzY29FMG1uaXFDQUF2dENER0NjUlRwcE0zMVJn?=
 =?utf-8?B?S2ZLaEFLdDZ2N3d3VlordUZUV3lNbkV1OEpyaVBzczBhcUF4SjRkQ3ZPRnRQ?=
 =?utf-8?B?ZFRJMmhKSnljU3d1QUdua2dOdWtxazlwRjE1aHpSOGNuQ0VyblFkZTYxbEpF?=
 =?utf-8?B?QmN4MXRsdDhQcTd3L2lpMnNoS1c2QXNJK0FLNVhlL21YbHN2R3VRTVZHUlYw?=
 =?utf-8?Q?uyhZUqBHWfo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVES3c0UmZxa3ZoOEtTeFBpVmdWd1M2aGRsUno2b1JTYU5HTjA2SFFNcVE2?=
 =?utf-8?B?eFlKOW1HaXBrYVRySDBUcFJudHo4SzN5cFRQdDBwZS9rLzUwdExCRUNiK2t6?=
 =?utf-8?B?Nm9sZGl1a08weFhYUkZHLytIYkwwblFaanlXb2tSSkVUaHJhQmxWMlpJSnN3?=
 =?utf-8?B?eDcwMjVERnRYSDR1Q1VRMVhnbjB0QzhOYW5pd0piMkpJN1kvZ2cydXpvRzM1?=
 =?utf-8?B?dzdLajZac3ZwN3VGTXNBU0RsRlgxVWtjRGFobnRBQ1Nac1p0dHh3Y1M5UFA4?=
 =?utf-8?B?a0U2ODBYdzMxdjRRZDEwbXZpYnUvTlhSUUtZUG5ubnhBWHVZVEdqM2xkWlox?=
 =?utf-8?B?QUhHRjBuYVh6OVZRWGdLNHE2dlNWZ0h1NXVYTlcyUmJFdm03OFJQZDdhTXN0?=
 =?utf-8?B?K1oyL1NsekdrQXVOWjh1N2pnaVFIdVJBYklFMjcvL3hlRVB2dGhEbmIzWmZW?=
 =?utf-8?B?TWVNT3owa3hmQUxpYitJMTJDaGk2NTRXYXp6ZW50UVNRR1VYN3FvaHdPQmc2?=
 =?utf-8?B?bStVSzVCUjJPcUxsellrZW5YK3g4TFhCTzVsd0NTL0ZBUEk0aXpSRzZlSzlT?=
 =?utf-8?B?Q1E4Ti9PamZkRzM3eFVVOHRoOFdTa2FaZEZIcEx5a3ZkbFllQlA4QU1uUVJw?=
 =?utf-8?B?WUNJQU9iYW1Rc1c1ek8wemR5S3pPbFU4OVJXMU1hKzZiSW1MaU5vWThBeldB?=
 =?utf-8?B?T25ZaTBkNjBwMWZaemdscHRXeUFyelN2czVRR0JvMjU4TFhLa3NHUGQwNUxk?=
 =?utf-8?B?a1NZTlF5TWJTODFmKzFUNVZYZi9WSXpPNDdnUS9IMFlvSHdSQ3BWNFVxUDho?=
 =?utf-8?B?d2JDZVNoS01vaWNxTE1xTVlxSFZnUnk5YlQrOHhVUGJucktQWnVUZ2UzT0FX?=
 =?utf-8?B?UUlGY2tVUEpKNERuelVFdnd6dEFyNjU1c2RvN29VZ2x3aDFjY0VzdzdzOEZD?=
 =?utf-8?B?Ukp0bmVwWm9oazRrT1dmTGxHbU90ZW53cVF6anpDZ21hYTFTZS85K2hTSkph?=
 =?utf-8?B?WWk0UXJFK2xYVG1FK1R0b0V1cE5uM1JqQmF1YWxHZ3pvTmg2cjJFbjVpdW15?=
 =?utf-8?B?VG4vdFJpNHFDK3ZLb2dnOXptTVFaNUpLd0liTzhpVXM3cmlpZHhXazNEcG5N?=
 =?utf-8?B?d0dGS0RLdU1odExMYXlBL2V6NjM2cVpYUXZPK2ZBb2RpZ2VmMVdiZFlualA4?=
 =?utf-8?B?bDV1SmFPaGoweVBlY2ZQd3h6ZVluMFB5UGswMzdGbm4yeHhSQXNPcFVuc0JH?=
 =?utf-8?B?TFY3enlUbjMzZGhTRmlmc2xrVjh5dFZUSkhZVS9ObUUvSzJHYnROQldCNDRH?=
 =?utf-8?B?eWtsb2tTUkNaL0hlT2p4VUVmS1FmdkFoUzZVelJycHZqVE94RWdudVA5VUdz?=
 =?utf-8?B?LzhjMW9kdW1NR3BDa08rSU8wU0JVTmpOcHN0S0lsWmJmeXhidG82QUIxZ0pT?=
 =?utf-8?B?eEZBVFBDei9OelZaeFR0cmVmbjgrc092NnJlUktDSUxsQm82anpma25WWk9M?=
 =?utf-8?B?U1FaMHhzUXljbTkyRGlqb2swTmJtZjU2K01PUVZsQ0dBZ3BRaWd6ZlJGYnJp?=
 =?utf-8?B?S3B6TjRiKzl1aEZsY29mRzZTcFhYNUNpYjRUejFxZkRmOTVGajVUeVBkMEhU?=
 =?utf-8?B?SWd2ekFmZmltaWhaMU9IZXNHeWRVNkxxb3FyZFV0ZnFKOGdOaStNVGhyaWZt?=
 =?utf-8?B?cnhZWDV5OHZjc1NyNmptZlFaWEgvbnJ4bXYxRkVzbnBJcU5nT3hMeS93QWt2?=
 =?utf-8?B?ZHZNa1p5YVhXYVZLZE5pZFRyWE5aOXAwd2ZOSzZrbXg2VzB2d1ZpVTd5Mkw5?=
 =?utf-8?B?MUxGc1VKbGNGTktuWSsreVVmQ3hIU0pyNldXSTNNclkxc0Irb25zVldLK2hG?=
 =?utf-8?B?WTFVZjZRaUJJVUV6RFFuUEFoVFBHMXphQ1N2a1lMT2FFZjhqaS9JUmF1UDJl?=
 =?utf-8?B?Wmd0b2xncGRySFRPamZlS3lpSUJ4dEd3UlEvdTV5THZMc0xvUDBNK014d2xh?=
 =?utf-8?B?ZWhBcnNwb0Z5YVN1YUZvMnNtVFBJT01XcmlEK2hGZjNzTnB0Q2lDVUx3MkJO?=
 =?utf-8?B?Y0J0VHZnTmpRaFNoaW1EL3pCS0dYNy9nNGJnYWU2VVhqNzJHcE4va21YYzdZ?=
 =?utf-8?B?ZUFvRGttQWFzdDRjN1hUcVN1Z0YwS0VFaEdtRm5WWTdtSDBqVzdpdHN2WjE1?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xeqcusLxVEAmVuJRQqxMBvqUJTwHP49Abjj3UupSGJwTdKpBQkd3VOnMMl1upehvL6Zd4G+3Bu31fB35hhyiKZxuWHF2J7h4ZZIKbdmAXsAwNfruwiHK3Rrz+73H/QbnRHquxm2ese6jvsAkSOeKSWbQ3b5vZov+QmBLxUijqzI+UF+Sw/mNw46j6bimTdtMOfk/+cMgvUknpMd1Y6fdnHEfYbjYLhTCC+7ana+2nJA5vyD/yRaAUn+G9ErtSp9OLc32P3jtjEFKUjiia26aNaiAa7mxR5fJJXCFb6NMF6hvIum+tOXqmDf/9Fbd2HBKuuZNTWxIT+8HfBo7Fe4MHtMkqqgCAPtAh8PHwDo0DVQFB+kCOI/rrezfUsonVPwbaIkD7ez6QbQrVoqyjK90fequDfe3ZwUJatpoFyvZVwnwsjKpEi9l0er8pY4jf0mvUG+Xdub0B24yvwgq11IgFK8DdzBE0HMnmf65df4Ax7GrG5bncKbYJ08NhiybfdEQUU91pLcq2q2tJwW6WxWnSKF0LZrGSBkWyVl+Sw1hcrFCAn8ydfvVs59qdFOGEsQBip8lbQi3vxsKVPk+wxi0DJkZOFyxKiYJ6SF6CqtJgKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61e5254-8c36-4934-f8d0-08dda4ed93e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 11:30:46.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJ/FweE5xlhu9jWROIZcP+gst40MYZMXRy4h/EPfKIl3+b8uDKz+E4j5B7TuTVeoDpE6lqni5vWKNefEiY3BXqLLlGTAp1oLe2koSnSW1QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6777
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060104
X-Proofpoint-GUID: 2E1h8_C6ZgTKbWnXjlLU569zwgoGLfV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwMyBTYWx0ZWRfX8Tdv739N+kZD 1Zu5R9Y/Z80mbRfdUwf/URCYwuN956jD9EAKkR5vQQCyy9XbGpqi3Tmje86GatELA7wmtMuTS5X G+9Ya3yJiSFr0Mc6RwmLsdKi1x9qegJXMiYt2GCfM0+dhfnQS3dAv8DYRtk6B+ms2ZGo5/bJVYx
 5ienzLHn9La/E9FvFUbR1ICXIl5UCOjZwBucqinKcPDkKacAwDAJ0TdIsbiTwDlsfcGQUP2hGaL iv+9CMVEqusnKRaMn1poY++u0L+Mxah6Vf6z11RFtSHkheAt+D8slTFb31ca3vjWfRILTcdlliA 92zGBZFTTqZ36ruqA8mThi/Hk0r5b9qS86fO4zfMvax49lCBOx8XeQOvycG7ECdzUr1fA0z0a0k
 yO62lfo4WAQC7oC+NLl4QE05U6FSK0THab2HwbpTCs3LAHd7FSjhrBejnnV50V2yit71kAEu
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=6842d16a b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=_aJ2he0yhPmxFmETX2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: 2E1h8_C6ZgTKbWnXjlLU569zwgoGLfV1

Hi Oscar,

I don't have time to dig into what's broken here, but this series is breaking
the mm-new build.

NODE_REMOVED_LAST_MEMORY for instance doesn't seem to be defined, but there's a
bunch more errors.

Are you expecting stuff to land from other trees that isn't merged in Andrew's
tree yet? Maybe from slab tree?

We probably need to be careful with series that have dependencies like that
during the merge window, maybe RFC or wait until after merge window in that
case, or maybe add a note saying 'please don't merge to mm-new until after the
merge window' or something.

Thanks, Lorenzo

mm/slub.c: In function ‘slab_mem_going_online_callback’:
mm/slub.c:6168:23: error: invalid use of undefined type ‘struct node_notify’
 6168 |         int nid = narg->nid;
      |                       ^~
mm/mempolicy.c: In function ‘wi_node_notifier’:
mm/mempolicy.c:3792:22: error: invalid use of undefined type ‘struct node_notify’
 3792 |         int nid = arg->nid;
      |                      ^~
mm/slub.c: In function ‘slab_memory_callback’:
mm/slub.c:6220:14: error: ‘NODE_ADDING_FIRST_MEMORY’ undeclared (first use in this function)
 6220 |         case NODE_ADDING_FIRST_MEMORY:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~
mm/slub.c:6220:14: note: each undeclared identifier is reported only once for each function it appears in
kernel/cgroup/cpuset.c: In function ‘cpuset_init_smp’:
kernel/cgroup/cpuset.c:4054:9: error: implicit declaration of function ‘hotplug_node_notifier’; did you mean ‘hotplug_memory_notifier’? [-Wimplicit-function-declaration]
 4054 |         hotplug_node_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         hotplug_memory_notifier
mm/mempolicy.c:3798:14: error: ‘NODE_ADDED_FIRST_MEMORY’ undeclared (first use in this function)
 3798 |         case NODE_ADDED_FIRST_MEMORY:
      |              ^~~~~~~~~~~~~~~~~~~~~~~
mm/mempolicy.c:3798:14: note: each undeclared identifier is reported only once for each function it appears in
mm/slub.c:6223:14: error: ‘NODE_REMOVING_LAST_MEMORY’ undeclared (first use in this function)
 6223 |         case NODE_REMOVING_LAST_MEMORY:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
mm/slub.c: In function ‘kmem_cache_init’:
mm/slub.c:6300:9: error: implicit declaration of function ‘hotplug_node_notifier’; did you mean ‘hotplug_memory_notifier’? [-Wimplicit-function-declaration]
 6300 |         hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         hotplug_memory_notifier
make[4]: *** [scripts/Makefile.build:203: kernel/cgroup/cpuset.o] Error 1
make[3]: *** [scripts/Makefile.build:461: kernel/cgroup] Error 2
make[2]: *** [scripts/Makefile.build:461: kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
mm/mempolicy.c:3804:14: error: ‘NODE_REMOVED_LAST_MEMORY’ undeclared (first use in this function)
 3804 |         case NODE_REMOVED_LAST_MEMORY:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~
mm/mempolicy.c: In function ‘add_weighted_interleave_group’:
mm/mempolicy.c:3843:9: error: implicit declaration of function ‘hotplug_node_notifier’; did you mean ‘hotplug_memory_notifier’? [-Wimplicit-function-declaration]
 3843 |         hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         hotplug_memory_notifier





On Thu, Jun 05, 2025 at 04:22:51PM +0200, Oscar Salvador wrote:
>  v4 -> v5:
>    - Split out conversion for different consumers (per David)
>    - Renamed node-notifier actions (per David)
>    - Added new Documentation for new node-notifier and updated
>      the memory-notifier one to reflect the changes
>    - Make sure we do not trigger anything when !CONFIG_NUMA (per David)
>
>  v3 -> v4:
>    - Fix typos pointed out by Alok Tiwari
>    - Further cleanups suggested by Vlastimil
>    - Add RBs-by from Vlastimil
>
>  v2 -> v3:
>    - Add Suggested-by (David)
>    - Replace last N_NORMAL_MEMORY mention in slub (David)
>    - Replace the notifier for autoweitght-mempolicy
>    - Fix build on !CONFIG_MEMORY_HOTPLUG
>
>  v1 -> v2:
>    - Remove status_change_nid_normal and the code that
>      deals with it (David & Vlastimil)
>    - Remove slab_mem_offline_callback (David & Vlastimil)
>    - Change the order of canceling the notifiers
>      in {online,offline}_pages (Vlastimil)
>    - Fix up a couple of whitespaces (Jonathan Cameron)
>    - Add RBs-by
>
> Memory notifier is a tool that allow consumers to get notified whenever
> memory gets onlined or offlined in the system.
> Currently, there are 10 consumers of that, but 5 out of those 10 consumers
> are only interested in getting notifications when a numa node changes its
> memory state.
> That means going from memoryless to memory-aware of vice versa.
>
> Which means that for every {online,offline}_pages operation they get
> notified even though the numa node might not have changed its state.
> This is suboptimal, and we want to decouple numa node state changes from
> memory state changes.
>
> While we are doing this, remove status_change_nid_normal, as the only
> current user (slub) does not really need it.
> This allows us to further simplify and clean up the code.
>
> The first patch gets rid of status_change_nid_normal in slub.
> The second patch implements a numa node notifier that does just that, and have
> those consumers register in there, so they get notified only when they are
> interested.
>
> The third patch replaces 'status_change_nid{_normal}' fields within
> memory_notify with a 'nid', as that is only what we need for memory
> notifer and update the only user of it (page_ext).
>
> Consumers that are only interested in numa node states change are:
>
>  - memory-tier
>  - slub
>  - cpuset
>  - hmat
>  - cxl
>  - autoweight-mempolicy
>
> Oscar Salvador (10):
>   mm,slub: Do not special case N_NORMAL nodes for slab_nodes
>   mm,memory_hotplug: Remove status_change_nid_normal and update
>     documentation
>   mm,memory_hotplug: Implement numa node notifier
>   mm,slub: Use node-notifier instead of memory-notifier
>   mm,memory-tiers: Use node-notifier instead of memory-notifier
>   drivers,cxl: Use node-notifier instead of memory-notifier
>   drivers,hmat: Use node-notifier instead of memory-notifier
>   kernel,cpuset: Use node-notifier instead of memory-notifier
>   mm,mempolicy: Use node-notifier instead of memory-notifier
>   mm,memory_hotplug: Rename status_change_nid parameter in memory_notify
>
>  Documentation/core-api/memory-hotplug.rst     |  78 ++++++--
>  .../zh_CN/core-api/memory-hotplug.rst         |   3 -
>  drivers/acpi/numa/hmat.c                      |   8 +-
>  drivers/base/node.c                           |  21 +++
>  drivers/cxl/core/region.c                     |  16 +-
>  drivers/cxl/cxl.h                             |   4 +-
>  include/linux/memory.h                        |   3 +-
>  include/linux/node.h                          |  42 +++++
>  kernel/cgroup/cpuset.c                        |   2 +-
>  mm/memory-tiers.c                             |  14 +-
>  mm/memory_hotplug.c                           | 167 ++++++++----------
>  mm/mempolicy.c                                |  10 +-
>  mm/page_ext.c                                 |  12 +-
>  mm/slub.c                                     |  45 +----
>  14 files changed, 240 insertions(+), 185 deletions(-)
>
> --
> 2.49.0
>
>
>
