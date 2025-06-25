Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800D17BA5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859459; cv=fail; b=ppS+D2/Usluxswq7I6yiy5e0CnhycMlJ6owdxwuVPlDYbxrlDE9Z6gQDPcbpomAtS7AovdrkbngMXiu+hvl9p2GYEQBQD3qNhFO80I3v29rliBXW0GOmdrsEeqj9yQoahRWFiwngDyUiCHJLitQLlykTKTKt4Yki+5SBN/+aoec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859459; c=relaxed/simple;
	bh=z/FNwkxVhY9/71roIpOiWHeULS5NZwUMtlwiJ7br37E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aXWciF+ptWNFMDnZNCE461Nk+mAb6yQ0HBUOhIYxrDDMpeQbLYk6o4RwWZhCVWQj7Vcvzrc+qIMMcRN8eHZMiXnvXUgYjE8ZkTfOs6FPpyy/eARb/o3jwnk0RBSho9AR/vMJZ2bWNpVJo1TCWlwR8nULf/HsUZXcP6+J0MSMlho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qGek8pHC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z30zxBqQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qGek8pHC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z30zxBqQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAqAWb015302;
	Wed, 25 Jun 2025 13:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=z/FNwkxVhY9/71roIpOiWHeULS5NZwUMtlwiJ7br37E=; b=
	qGek8pHCknaNip5IFLf/1OTJ5F27DPg3/MNuqp9jVgtIyALTaNJsR82lV11c0kgt
	tswn5WIZpAOY3vWjr0SKI6Jcn53EM1HNsLPl+MJRZ8WQh9rzAw+m3QUiQUiKya7D
	0qhzTZeTjb3SppGSuLm8yC/iXPkXAP6Kf3qwshH3hEJBgKu/uczSeXFGuFf+2NPo
	gGO1zaSFKNJJMfylrsx9apeNHirHuX333WkP/S66aeDbaxlu35XT5xYMSvpKTzfM
	FUShSLnQNf1INMPA4HUmx0VwhQW/XCWeAS/SvDdXGkBXC925FuUdvu+Zl4ejtBwU
	92XQVD6WERP4embt1pPgPg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8myg0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:49:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD1wK8013462;
	Wed, 25 Jun 2025 13:49:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvxku4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 13:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS7WkJu+w/U5gqEC+5BqzGgVpV70G1MtXLqezbyXLx9KGnfmtaf9WzPoMke/yC42wzvqdCZZG0jkvpK3PBk2IlyqMwoxH/dphZCkWpcLerW++x/DqszeXuXce+D5Us/1RGC0cmigJYyUejTTzJa0xBZ5ONi7WsdDqrB97rrZ8AZFUfDpi3k376snxwHjeOsv8P6kwGErd8qNwmpOSZXmN13GMxbqC6YOxB0QObtcM9ZuyxktN7bHUNgLBci9J29SvnKVMZRy9fzih2BU8v6w1vwCOwZZehDEm/C5LMgyaM1zcoh3e8bWAVIUEGeLtBPuwmApc0Kc1TrUslxC37rQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/FNwkxVhY9/71roIpOiWHeULS5NZwUMtlwiJ7br37E=;
 b=YpXtQCP52pXaZBDcvOVyCsYWdNwc0V1HUv5NIK9QQ94SY3ya3PHVGreh7pl3rfbOBuu585rx/zIELC2qWs6/a3amtusTT/SJ4xu90oiSReT3Qn7046Jnc9RqBCR6HQVH1dq5HXPXRrfduyEkUjWpjr3JIkfvxWOcgUuAtYESkg/ZUaN9iYwyDynM7tsNcIyFfZHkFo7ppSU4keIwqx4R/iZGshewPv9aFnAIEuk5K18l1p9if3Q3HGDDKcywmfXDf44vwk1DxVmcF1bn6ixC6AxGtf7YqQR15R5xLyvPxk/+svzrPydev9RcFIhxZthk7qSB2EjFNSZzsihbYM1khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/FNwkxVhY9/71roIpOiWHeULS5NZwUMtlwiJ7br37E=;
 b=Z30zxBqQE2HroAQ5ZoF9q6rXLZpdqG1Jg4D5ve0F6m8ULxCQq8pXLAA0jk3leVYFYkNyNYWrw/4uafdUgUZQ3M4aPkF4ChcDbBRNAJBVQ9CQRZ5nVV+3Vq5f8EyXZ23AmX71JdccCr84ziHYGT8bnw06pJZIo8SDcuXRoOi9EWs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6611.namprd10.prod.outlook.com (2603:10b6:930:55::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 13:49:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:49:53 +0000
Date: Wed, 25 Jun 2025 14:49:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com,
        ioworker0@gmail.com, kasong@tencent.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, ryan.roberts@arm.com,
        v-songbaohua@oppo.com, x86@kernel.org, ying.huang@intel.com,
        zhengtangquan@oppo.com, Rik van Riel <riel@surriel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v4 0/4] mm: batched unmap lazyfree large folios during
 reclamation
Message-ID: <38c757b6-4f60-40e3-9b77-69c9b4ccc004@lucifer.local>
References: <20250214093015.51024-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214093015.51024-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 872868a6-4645-4a07-6fd4-08ddb3ef29b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzRsa3BRb0xSUGFsWkFKN1ZFRXdYS1hsZGdwdzIxWTRmUlFQUXd0cllSZ3VV?=
 =?utf-8?B?elRXSW10NkNEMUFTQmZmRnRIREhJdHFwWTZDZXhGS3RvNXR5dTBtcHozcWFq?=
 =?utf-8?B?WUhVc0dxRlRLdmNEZnp6UjYxU29JcUYyUFVuWnR1Mm1CMmZEUFczUWJkQnF0?=
 =?utf-8?B?NTNFNlpUcWVLNTNqcXliV2tHMk8wbnpvbVpGU3dFaFdreTY3dkdpS1VXV2hr?=
 =?utf-8?B?dTl1OFcrdzN6aCtqc2JpTW5LZW00bUVlTFhHWEI0QXd2ZGZUMEdvb1ZXWCtp?=
 =?utf-8?B?MFFvYm1Ja3Q1Z2h3bWwxamttV1p4bTZzTzlDT25GOEdiQkdBQko4aWRWaFpK?=
 =?utf-8?B?M2pVakhsR0dESVIwbWRFSVkrSDIyV3ZCdnF2V1NjdkUwN3EvUGRwUzRFSnYv?=
 =?utf-8?B?K294dEZkVlpiYVFqaThTdmd2WVE1ajJVRWpxbFY1aGg5N3lSNFpTS3c4bms4?=
 =?utf-8?B?emZJeWNNbDhBUm1hT0lHL3RKektWbUZzMzZtRlBwZUVSaW0xWkM3cmIrQTgx?=
 =?utf-8?B?Mjl1OGdjdUdYUVFHYU9pdFZ2NUV5TGl2a3psaXA3TnNrWWpKMlRjRjNCMEgz?=
 =?utf-8?B?aU13Rm5FZzNmOHoyZzZLVnBqOXhyZWI4cDlNUWtjUEhCOWNEd0VhSjNLZzd3?=
 =?utf-8?B?dXNpd0ZaT1ZoYnc4ODVoS0dWdzY0R3M1Ym1UWHZqZkdXWWRZNUFydjZkcHRQ?=
 =?utf-8?B?Uk1oNnJIMVNIcE1OamdDZUptZFp6MzdGZDZ2U1QxZjA3NU9EQjRiVTVNNnJE?=
 =?utf-8?B?OWk3UVQ1L0tBdGtkbUVGZEZ0a0NDRWF3UklsamlBR3UvMnhSbHkwZDJRRFps?=
 =?utf-8?B?L1RrMVFRRmNoYStZM1FTRGw2YlA2d0lBNXVnWFpqcjNtdVZ1RVpkMU96dHRy?=
 =?utf-8?B?cmt6QmZhVEpYMDJ3Lzk2YjBiWFBWWFRUSkFxQTgwOTltT0lwRk0xd3FwcDAy?=
 =?utf-8?B?ekZtWDhXK3prNFhjakpPbCtzTlZNTjEvand6eXVERnBuNDhBWVZtd2ZRTnNX?=
 =?utf-8?B?WjdlTitOeGEyeTQ3OXprWXV5ZHpWQ1hseno2NGw4TWVRVUhXU2N4ZHlZYWo1?=
 =?utf-8?B?aDZuUG9ud3RhRDlla0NsQjRwSTFnNzRJd1FnZlRTU1FCVzdNOGt1WlBGb0pF?=
 =?utf-8?B?eUt3Wm5KcEhVSzIxTXNjWnJUWjh1OUZtM1Z6b3dnZXJyNzFRK1BuL2Vhb1NH?=
 =?utf-8?B?aG9oN1AyNVhNWDVZWVJBdEV0Njl4bnd3bWRoV2kxY1RMVk9qM0F0bHVBU1d3?=
 =?utf-8?B?UGNJMHM2dEQ3Z2luamo1UEl5R3FRNVdPUFZYOFVXMFgzLzN5d2xOajZ4R1My?=
 =?utf-8?B?T3gvSVQvR0Vudnk1NWdHcGo2OHdHY0VCSkNrVmk2eXBTTnpDcFpMdDR1MHc2?=
 =?utf-8?B?dEJ4TzA2b1JEb3A0Z0gxNlJreWRZSmdkQ29nb29tVkM5NHFheHRUOU40NEpi?=
 =?utf-8?B?YVNSS3ZHOGtiOW5wRm8zUjd5d1FIelJ0aHJxMm9iV3pMS2g0djZkQm9HU1JC?=
 =?utf-8?B?cUxRKzNYaU1VNEFUVnArYXMxN1d3MG9zNHJJUEkrVjg0YitydGRQWnRCUkJS?=
 =?utf-8?B?YURHalhVU2h5SmFzdlJrd3lKdVJVTmdvRzYwLytMa1IybFFnNFc2M2RTUlBG?=
 =?utf-8?B?aUVmNmthVjA0M2Y4bDY0bnJZdStZRmx3SGZKZlJzSlpSbkRsQjk1TUVYdHFi?=
 =?utf-8?B?SDNOMGRBUFZMWHk3VVhodGg0K1oyemtHa0FObjREYld3M2NZMTF3S2tZWkh5?=
 =?utf-8?B?bDluSTF1NTRlakkxOEJzNk9aa3N0c28raXJleStVb0p1cE1ILzQyUjBYWmNS?=
 =?utf-8?B?aTBxSWhmMEViUDZ0eWtDdStUaHQvY1NQaHB0MGtCQnhMSEtIbUxGNUhFc2Ro?=
 =?utf-8?B?SFFuTUhkSHR1SlpyWUZvbUxsdEtwdzljcG5SelY3TVJtRi81SmZ6V3VSTkRQ?=
 =?utf-8?Q?W72YL8q4P2A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Unc5M3d6eTJ6V2Z6bjFtbm5VN2tVRHVlL2V5andESEl4MFpQOUp2MElsbU9a?=
 =?utf-8?B?eDdMeER0cDlPdVBMUlh4Wjlwd0Eydmk2SVg0eStjd1JiWE9ZRGs2ZHhCS2JF?=
 =?utf-8?B?YW8wKzZqRFJLdTZJM2tORWh5bE1ycHFRUmxmY2ZURFJ5dG5VdEs1UUJHY1pB?=
 =?utf-8?B?UXJBZnRVS2hreGl3ZTE2MTBXcDYxYmZaSWJqZXpmWFhzS044Z0pNeXM5WTlI?=
 =?utf-8?B?QURjK01nMmlhUDFvWGVsMFlyWWV3a3lqdjl0SW5JU3NqSU5SM01vK05QL1VY?=
 =?utf-8?B?Uis1QUtZc1BRRlRyeTdDclhjaVJBNnBuaTVQSkg4NWxUWFNCOHlCMXdDWG10?=
 =?utf-8?B?dXZFbDJuYWZKRTllNU5qN1AxMGwxQ0lUWkRXSWRjenZJYWJwODIrN1Z4Tk5V?=
 =?utf-8?B?Y1p6SXJjM1lXV2VPSUlSRndrSUpaRE80aVl1MWlMMVVXQ1g3OXdvdEFQbk1Z?=
 =?utf-8?B?d1ArRnZxQVZ4cElTMXpDLy9BSkpuNEVUdUlXZXlLNzZqNVlsNTRmYkZVMWgr?=
 =?utf-8?B?bW1Ia3Y0VU1saG9ucCtnTDNJMkpWYnRSZWRkMlA0Mm9SditKWGJDOXZtbmlz?=
 =?utf-8?B?SnBUSGV6U3pscjZqNWhPbldqRWJXU1BRa0JQTDdBZnRRNjdnWEFFOVBML1du?=
 =?utf-8?B?aGw2QXdMYVAyT1U5aWlMQm1GRmxVeVQ5emZ5cEpHVG5Jb08rR203aU5XUW5R?=
 =?utf-8?B?N1YzRVZ1QnJRSWdmNzQ3cWNsZFl3VkprZjh2UWdVdTRNb01kQzUxai84OVlm?=
 =?utf-8?B?RnpwNW1WR2tjOHROOXlja2hCSkY3OEd0RUZJUkxMWmVXaTBlV1duS0svNmZ0?=
 =?utf-8?B?eGV0S1RGZXNBbVRrN2wwZlIwVCtkUExoNVRCdUpKYWx0cmNMaUp2T2t6cVVj?=
 =?utf-8?B?RGZCTGRQNlAwM0NSSGtNeHlxeGZhUmg4d0NhZStBYnYwRUVGbVBDS1ZySER0?=
 =?utf-8?B?KzFTOFZ4b2FRR3paQUpyRmFjUDFEK2NZNkpaOXhoNm1JK1RRK1hPQzJCZUln?=
 =?utf-8?B?cURBcys5YW1GMDJTN1FycXZpaUF0WjA0MDY0NWNqY3preEYrQzQ4dDM4MUQ0?=
 =?utf-8?B?SktjUjBvRldWSzRxQ0piRkNZbFQ3NTg3WGMrQ05DMjBJTFppOFE1ODJPM0d6?=
 =?utf-8?B?OFJOTkFxS2pUYk1xdHZEdldEM09Cbk1RakRtV3p3ZmlxbjVxdUVyWGNzR1ds?=
 =?utf-8?B?TnpEMXU1bWRvYmlhd2ZmWm1BdDJBMzUvTm9DRXdrSTZ5czdxdlZLd2lQdTNy?=
 =?utf-8?B?ZnBkK09nbnRmRjFaamVmTmZXYVFqa3UrZkdPam1WM0JWeVVUaVdUdTlYMldI?=
 =?utf-8?B?aEliUFR6ZTF0dEtaenYxRVBFaytONno3eW90bUYyVm5QekRIMHBvVGR6SVRE?=
 =?utf-8?B?c2s2ZFlNa29VQUZ2OW1lOUJ4MGREQ0w1NEtiWXR4VnRFdUhrZE9TRHdsQjRn?=
 =?utf-8?B?MGluK29iVmR2cTQ5QWxSREliWVNPelpSc2E3WHVjQWl5a01scVNpOU53MUU1?=
 =?utf-8?B?WVRISjZza3dGYThKeURwV2poTE5yTzB5aFRoZkp0ci9jcnlTZmxRVVNkNDhY?=
 =?utf-8?B?TnFKalZEa091aVhiTUpFZ09GZkxBUlk3ZWlOdm5QL2RUL0R6Z1M0MjUxT3N3?=
 =?utf-8?B?b0djU1VYVVI4S1djR2paTlgvYittclBNdVRGZ0JTcU9qa0tqNGd6SVgxZ3Bn?=
 =?utf-8?B?ak8ycFZTVGhnSk5tZk13aUFONlpoOWpDRE9iRGxnM3c4K3NKS21XTlRTY0o4?=
 =?utf-8?B?ZWFZMnBWUHB5RXFLMkV5NVUraGpHUGE5WU5MdEVRU25qejFiVGV6OEY1bnRl?=
 =?utf-8?B?RDg0ZlQ0cnk4bjNiakttWTBCQUhYS3F3Z3p0MEt3ZDd0SWpnbmZIWGNOUFhv?=
 =?utf-8?B?WjhaNTlnTFlYVHhzUlFVNVlVZDZGR1drZzlGWjlCVmFKNm8wS1NuVDg1QjRi?=
 =?utf-8?B?cmtQWXVJZmVCa2Z2UnZGR25JMVQxMTB4aVJQSlV5V3l6RzVSdDBtekNGdnVt?=
 =?utf-8?B?d09lSFRNeGZ3WWg2b0YvOGczZzhnWlZWS0lweEcwQkVmNlRrV0pwekJHbTcw?=
 =?utf-8?B?QjFscllTa3lCUWRvZHJGNzBlR0krM012TEdVcG5yZDVLWEJ0T2VNNDJ0dlZv?=
 =?utf-8?B?VWZDRkZBbVVab3piZXpPUTJOTFBaN1h3N3dZNG1OR0l6K3A1YVlIekgyWnVQ?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PBgrshhYoESKir529BXz2Rb2+IPfwBU48YvtbIz5Q2OV0GjLtnlynjJ16dLf6hUHWnFJqV1iSk+ZWCDl/XsfQ8i6vVOYRIWBsDvhYuugtl+lHqOA+RV5nohLtY1lBeRRav3teVy1OvcYn9/wt8bcG9j3BPgHCJ+LAzjst/+Y+1s9kmbVp3BN7mppJk77PqYxFoJEDbNVbK6ryS/FVoSKRnz9GBzyEDIcFXhVyrTA2WhXtc9hhvJQ7RJ0JGjyiZUKTl3GkqRx04pYTqQ4iYffE50Z6P0BslBs5WJnLY1CMvY3XxFBnL2J9xearaoe+v3B6k16ubRYoPPsHGUJO/BFHHOmLqCX/Sf/VDQfcRE7L8NsAqqATigfCjVuP09xJBeADsT2E6Cu6nBw3NIj9tj+crKrv40Q7U2wdKdx7Tk4H7BdU/+eDZKwHWuM1QJS0K5iU+C3vhZrgSiLIo+jwS8DcoKhNz/814rap5IPh46bZFuYX1ElNvPUBOuKNFtZYF4D9jxMn0FOHsFB9er5h5U2NFBPNHcin+qBhe8v9o3PMmc9GpQLe48kV0N9YFHRt4sq4a11qnQVHgpl/XvUy7QqyvKCA5pr0jROW2w6SiyuYao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872868a6-4645-4a07-6fd4-08ddb3ef29b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:49:53.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPj2j212Y2/8qPgGK7PB/t7rrxsfd10KKjAliqqMOQVEv8PWyyampwAQkpTy1hZzKrGBd1EseN99giLAiGCEeWM6qtlmcmwDdlhyVBXRSfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6611
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250100
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685bfe87 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=p05n3T9mSRr592LumWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: VvSn7hkvAjm9xMZwKgLwGhjk25nL3JEK
X-Proofpoint-GUID: VvSn7hkvAjm9xMZwKgLwGhjk25nL3JEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMCBTYWx0ZWRfX4SFyKRu85yYB sDweyk8LCyGxgiC9Uba+8JWJ0H+5P6MvkRFoJdQQtqYX4YOKLmjEdx45pW0DneEc7t5VyWFkCLU q3S1rrHcLYlJx36K0Ol8stiUxNEYAh/Q92/Y2aFzlEYQvNubf/YlPxDItTpbpUweWPZHJB8/H1j
 3acEjsGHCixIYrayyQpNLuZGnPeREdoKl5NdmNopJ7w8bwX7pExuThELYKc4m91shP+6rLhPsBW qLJQVleukLAQwGTgGCBnB/1YiFAQYLkqOvnEVAchY3jZzeAmL0eAZdf+huPo+sHWrLnPUJzqWeU vpFQJ0EpIxxBSAWVgjDi++7mw0Ez72re0/WlsvG/BMbqtgNUpvRgkGgGEZtzWgN1C0B3Pyxtc8E
 vB1dMK86TC/JMFxqxQKYkvxKsFsWYpFZrEukoLE01tZQY41S4JgDdAWqh4CewRHUwfwKCWrk

+cc Rik, Liam, Vlastimil, Harry

This touches rmap so please cc rmap reviewers. On future revisions of this
series!

On Fri, Feb 14, 2025 at 10:30:11PM +1300, Barry Song wrote:
> This patchset resolves the issue by marking only genuinely dirty folios
> as swap-backed, as suggested by David, and transitioning to batched
> unmapping of entire folios in try_to_unmap_one(). Consequently, the
> deferred_split count drops to zero, and memory reclamation performance
> improves significantly — reclaiming 64KiB lazyfree large folios is now
> 2.5x faster(The specific data is embedded in the changelog of patch
> 3/4).

Nice!

>
> By the way, while the patchset is primarily aimed at PTE-mapped large
> folios, Baolin and Lance also found that try_to_unmap_one() handles
> lazyfree redirtied PMD-mapped large folios inefficiently — it splits
> the PMD into PTEs and iterates over them. This patchset removes the
> unnecessary splitting, enabling us to skip redirtied PMD-mapped large
> folios 3.5X faster during memory reclamation. (The specific data can
> be found in the changelog of patch 4/4).

Also nice!
