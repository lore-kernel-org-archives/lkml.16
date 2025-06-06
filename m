Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54184039
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234873; cv=fail; b=PbIH85opt9rSy2KZqJW07Vdbi/29L5MxOVMFNODk0GixV4BiAsydZ3qWjZTAsan5uxDkLrS0FtsATDPf6/1JvlINoNXpgHSoaslJhbnr4EbSFzB4cz4Hup0sXHOqyilSngVoSg5HCG+tUv/QU2y9hYi7pdiDBZlmB62jnX/8XpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234873; c=relaxed/simple;
	bh=mMRhTPXVymSRQOupYYum+FUivyuy4C+W8Kr+75eTRqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JQoCIcKILZj/vdrJIf2o0+59RhCBKkJU9UyQy9UyEPRy7CfxUfUV7OfvRZy3olytpnIrwpX2PnnZUDeiMWWZ2Wt6YkSIrdBrb5DGZ+pScN1XhBf46kmsAPQanDp4OIRKBd+HbjFcK6qrOIjS/UaPXntQ5/YjkQ/osfYmPIAtH7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k5SjJqhb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hQj332Jb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k5SjJqhb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hQj332Jb"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556IMYjQ007862;
	Fri, 6 Jun 2025 18:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xwGW4SXK6t1fmAMuoY
	AX18HVEgcsdTm7bNBwe5X4+4U=; b=k5SjJqhba2Xh957g7kExLNf9v3Rv05mgXn
	S0a1KLpvhSFA3DFf2ftdyTbOV+kmNR8F7lDYTaZGk5C65SUd4INPv1S0NwowFQ6F
	of3L3hb95P4KC+ikp4K6GVIfJ5o2AVRlQIX09f+zIvIBBiXia7tD3nvLQOmSXYjf
	S17tW6wUrDnVo/e8y+VVCjUDnrhQR3VWd6bFwnTMwFjfBv/igNEVI0uSICwbRK2W
	x33KY0ATKH3EC9XSu9/QWQx2I78XgyA6XXAwnI2ZByZFKZUYNwiaZycIq1kz2O6g
	j7Uc/ORrFXFkKOzC3Hyzvz3W0nH3nHMIhZt23MR/Tb2z3Op+wc3g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j8k8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:34:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556ION25034538;
	Fri, 6 Jun 2025 18:34:18 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4745jxr935-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 18:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjYCW5FRRqBkpwAQuoxXdEioGTRsCaZRryKVHEt0zNfHvWvmEhhuRUfvthn7hpxtpC1nEsCottbhZPv2YMUVWKvwpJcIFlInWZSWvHFUzcNTb8SCCVmasdUUzZiE7i0KqPWlKM29+0ektEUc9yz1/Nu8MfBwNwyFD3zdD2Fvx0fefRxdAFrxHTBvlzsWoRmJm2N0vgKMmLkkt37kbNpXeLbC50lpEeNvbRMKDbbRqEXywoMj5nmIhzOoPcUpn/m7QAkDC17v9TgAOEEzjpbcE5rRcuJT7L4RAjJrAaHVdnpT6hAxGJ1pERLUf/GKt+HqXLmQfhWp9qLcAx9PYt2TAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwGW4SXK6t1fmAMuoYAX18HVEgcsdTm7bNBwe5X4+4U=;
 b=Cc0iBmnFQm7WohC7zIVFeXwCulE2dBJgzxup2q7NcaVhD8AHZ9jIe+YmLc0B17TtVUey1FGHihL1jyuDaY15u+GNuHyFyaACqv9gTjs6NkcLQP1XrOB2aexixkG6WapwRv7jUlDTftiqCvMyDqfE56EPC11eO4/3oHTh2eKHE2tROXSh9NnfPxFFtoyXYwaAxIzffevNewZb215RKPba7pZbVgBFo5yBn/OFIetkN0CFL0VHK503tt9V11pBZuiEXL2FHyGC3ip2TRxg/R97Gpp6Id0X9tIBrIPpfCrQBmzLbX9T5wCVxk/WyKaBDIKrw1nrB0+S7QjnmfdOalEIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwGW4SXK6t1fmAMuoYAX18HVEgcsdTm7bNBwe5X4+4U=;
 b=hQj332Jb8/wlYuECeQpni+JKdAK1rtt3osaBXdeeJbSJgPZ3BGoV7uSnVYKstslEtj16vZ2l1uRN2EB/qZD6SAQbpLWQu5FzSTeG6X3Q5mzSkDjtkl4IK9IxxailVxBgDhgJrPq8KXS3lHofoJX2Lk+fP2yUikOLL/dvUOJnTbs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB5868.namprd10.prod.outlook.com (2603:10b6:806:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.38; Fri, 6 Jun
 2025 18:34:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 18:34:11 +0000
Date: Fri, 6 Jun 2025 19:34:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Michal Hocko <mhocko@suse.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <34cafa8d-caf1-4257-8545-33aa55214c90@lucifer.local>
References: <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
X-ClientProxiedBy: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 935dd941-8eaf-40f2-67f0-08dda528bafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1BeI7mXTJkJ0dtj8VT/DEjMdnYkYpVFid4w9qVQeW3R3rfaxC0FyNgy4jrvI?=
 =?us-ascii?Q?jj0oazbOLjasLQATad7YwXu2n3B+Sk/TGCBoLtzb8kE1wcYruZDKJeJN5NHm?=
 =?us-ascii?Q?5XN++vM52FLHcfNjX7FHrCM9G1ln33/gE+Zcn9JidHSd9L85DSoBZIHB6Zkb?=
 =?us-ascii?Q?yJVB9B1FbOo/gXKMd4epYgyMWKUfN7pf0BtulqZrxmPkq+JfQlXcv71aOdZH?=
 =?us-ascii?Q?noMNv2R+ijjaO/npobxMQfOcCUDY8cZWTVx4PfIYMhGrX6OxZ7am8I9ynU5Q?=
 =?us-ascii?Q?B12bJrTAo7jNJ7dFNqurRApZQgNYExz0yY2LvslkFW0mhdYTwRyM3MOLdtgB?=
 =?us-ascii?Q?1JMppcU0LTX5avd3rYzg1o8rqrmk6lKqz5hQJYW24DSsQ1WDM4injf/ppFLk?=
 =?us-ascii?Q?YVVknXqGxQYDDzCgKcsqMBFSI6+HzXhaDOlbZjCCiopfYDp4x4a13OB0Zi25?=
 =?us-ascii?Q?QBUCgsPbvwXWjCJwHQAQiTvTOKPtZzlLHCI9T7vh6syL6/G3yJyt52ABrqOH?=
 =?us-ascii?Q?j9Za3rbIdy0KbddEAivjg/70nU/AT2lCAssApZ5dUk3QGz5ckAgbv+hnc9B3?=
 =?us-ascii?Q?e33beQY2LU1qu6grBEgxUskf3+X4PLrqNliHnzTMyHCHuczI8gm84qWDZXDY?=
 =?us-ascii?Q?xUzpt8DCeh8pLgaqfPdtw/iYv1ZKdP50U1K4s2sLQmbynaoAm7SDQWvzUKSP?=
 =?us-ascii?Q?ec8ujTWorbwoGuRGvXNcfP5NkGDHNFzRgnGCTcuemGqgcxJjYqbCGV+Sy///?=
 =?us-ascii?Q?nhTkK53uzt9n+M7f1VXuKFQRGuT+04uowMab1FScgu6HQpm+jxrGlehGbJJh?=
 =?us-ascii?Q?J4sF9ArJABHSVgyxfyDzq5Lj2wleQurRoMQcQARC9d+e1gTWlgNfpo4kxlSC?=
 =?us-ascii?Q?C9RPY6cDGwmS/MpZ+NHnT8HBYY0EAZQ3Rp4FdWTIokA0FainQsq1TFMHbCAc?=
 =?us-ascii?Q?HuMocUM6ViTrSQNd4bH/AZeic6XAAr/n+9tQbJ5nmhIVEW753o4cXSSO0DUM?=
 =?us-ascii?Q?SKwDihG5kQmNQ5ACwkv7Vu7nS8+bZDe2rm4pzZhVp+KutaVWMZtW+KUa8nMG?=
 =?us-ascii?Q?sFkxfzUYX5WjyMeWPjksp9vEXD73VfUC5k9MaFY+8kfEDEkmhZhSlVa/27zh?=
 =?us-ascii?Q?F7ioX4xCHE4VoYxf09i8W1ZF6SC3sqoHNz8v3doG0RgooTKSu9esEajt7hWI?=
 =?us-ascii?Q?oyjEIDCE31kME4/hB39uK/AVD8kLMGj7yO6MQNJdaEoCd9zTYVTHuGHxzIcX?=
 =?us-ascii?Q?Svq9vjK8ySW3IWrC8T2AQf+G02Bg14qLQEEVtOFOFf5a+OnXhXdNGQrkbbi6?=
 =?us-ascii?Q?rNJZGiLgIaij5DgK01YgKw7kIUxqHDdUZre0u1izGUowcBaYJU92QBPW0X4P?=
 =?us-ascii?Q?+erMTyvGKk7hApsYGSd3R9BLDHJ+nm5xQos9o5un7sVeF3Chm3ekI/GfRVBs?=
 =?us-ascii?Q?VJVATb5IIUg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4AdWgCJWV+wigqADi1wiqeUoLLxjlxG/v1TXXyKNtIy7WPnHmwbWDcWl9B9q?=
 =?us-ascii?Q?fPiR/9WaocOuWYSTVu+o8vRsRwkINOtTiuXiK734WmCgtgAbG7MSkJdwr3sw?=
 =?us-ascii?Q?JthY/gFpiR2BSE2p3EmMpcueBqS2MwwfE7qZDB2xD0CpCUD0+wczt9jXzJlG?=
 =?us-ascii?Q?EGRRHPd5/WZVRVHpTn7tqNeySfA3udT0SlME/je4qHYd6GSWvLRwSrG8dXxX?=
 =?us-ascii?Q?IC6vDSXfAXhRm6Wqxe2j9F4D/1OeYlorHNjTX4Rm2+3IaITAThEqen/PLKX1?=
 =?us-ascii?Q?qB/sreShy+UYb0YljnFFS7zTDUaxctgrdmQleK7Bw0EKu0fLGmBsbhwwbdJZ?=
 =?us-ascii?Q?/Di0WboFlz9Bgf4bPjLBq93HLHF4SDc6tIxGvOQOO9WZ4+wVkUDmtwMGNMZO?=
 =?us-ascii?Q?UeILQyIgcfBboBIOqgEkBMTGqQ9pkMvDGYjwlUEKIehGMshlaLygPXsx3F6Q?=
 =?us-ascii?Q?NXxBWL5y7ThJn2rJz5HEx+eUqfFP2OCgxQudmNH5TOOAHPv9shr2+R6+XlTS?=
 =?us-ascii?Q?+VtZdkBXSg6EXftF6hz7u47anUewMpQKhX73mY/mnf01/SyAa2Abpx3MmNLm?=
 =?us-ascii?Q?3e7MyG5PMwRvzVq3rbpX3WGQcdWcX8jht2HZaNtCvOy6alv49IwO4NGHwFWo?=
 =?us-ascii?Q?7RQBFRue7Ibc1DNAeETRRuJv8N8FZrmfW2toJ/9kgxNUTibaGhu/dN7QBPOj?=
 =?us-ascii?Q?DkJHSGrQfFVquAD+Cb5g7MKShTYZ7OC0owwuBuV9ID95mdSSonYJkQ1qnOpw?=
 =?us-ascii?Q?V4GyAbGBTqjrM79wHmHrDbfghWfNPNf6Mv4LacgJJ6W1bZkhb6wcPyRX9g+z?=
 =?us-ascii?Q?H5MUtEOhMlUc302sdIyJrkSICB612x0OqVbXhxVP3aCJD7lEDmnA6DUlzyfn?=
 =?us-ascii?Q?zB/Atr5DDusytFoykGCghztB4YBc1ttPF0cFJ5rC3a0OEfgODhMYZDREu1QE?=
 =?us-ascii?Q?xaGT6luiO0sz+NTNOw7ZvyLTIo6xlKsdvsCyaS8IcxJx6AwFTJv6gmxBiGT0?=
 =?us-ascii?Q?f3oZSc0Fv4mUq3xVHooM8WQmJc8cdnA6H8mSOMdRdOau9TbWMfKOdHO+UvEW?=
 =?us-ascii?Q?+8+3Q7Dm9AcWjrgBQRglLhRTHEgX9B5zXscXwZG+V0EUix01dh1wxezYYddo?=
 =?us-ascii?Q?9INLJ5E6+lOJteB7+lL6jw0Djp2CJQPhDdidgCvxoJSpwArAAGtlFpg46ptX?=
 =?us-ascii?Q?s8M+R1wRwhNv80phkL0mHr12/x5xpxNQ1g1HgdwwJRVsJvDcHlaYM3S5La18?=
 =?us-ascii?Q?UDpV7IpRUNA4Ls7L5J8KWwuAA+l/DDOasvpYfRS8DN71hmV3I47IWTvtF7ZR?=
 =?us-ascii?Q?bGCxyTp+5tc7sq8fc4Cos6CGluuqjiUBuj/WXF2zFSkzYt+VitFzaKY2voG6?=
 =?us-ascii?Q?0kDSJS8W6IhJ2xzoxT4swnZJQM36Tr5iU8WpNygujjIxZamhSigQvVHgAMpa?=
 =?us-ascii?Q?rsNseUhYf0WcQDn9/ifGXrgf32q4+AwImwq+KGsk0b5Kjjo55pMh9YgCOvFR?=
 =?us-ascii?Q?apQ0EwSWQDvQxAcLSmJ5j+1rCkuby4EAzIHbdBgyz1zZsiWAyISJLZYpgB1d?=
 =?us-ascii?Q?4ESiAvvbTTZevHbi8IMth6Kp8obFVTpia1z7wm/ApSM6KwzNEdVHdKwL0fIW?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2cL7/20JLdRzfRBIXdHfC9rFuHsKqdOU6j/3DDJHGanxRvx6sAKGmGxBypX9X5EsEvktCzWdXidHGLyJSfqw1aeoyeH+exnMoAR+m3lkEAN/koNlZpyIjt15kWDlUnfNgOFS6ZO1UbFnO5VIFzYGZplLq5HQtEOAiFQLPOGaVa7ZBwT48+qHEUxpEEv5ySD/yP7i7oGz5MO1slFnNnG++CzI7D7ZTDByfl5hhfmLqEAT/UZzg8d/+2K0DW5720zCrROCnFkyfNKnvRlmGMxSWrU1Np/Wwc+RbtUfYkwsvqGdd34SYUdtRIcxKD/aIk1E5bbH0CKwZO2goqK7dIEd1I8jJRakdJH3fX5CqA9hJMAlVVb7QM84InGSVNNyh/WADAUX40C4OK9kBv/uoVklGdBtbAX+g6r1uJezabLAMaZd6MISDQ+uLAcOs3eOSbNeNUrG/XNSaefLWsgiWrMRNzeJAkqqOiGFTUCcRh7QRQDe4Svt8lWLRBWuYFY58CpchblKMNQ0XI2zGNqZp/gcaXPRKVPsmITtI4mLNxgUAUuTZPJNtmi9iDEMK3LbPIJ2LYOosGfFuqLGpk3/uX+eU9RHLxwf2v97Dw+74+J9zPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935dd941-8eaf-40f2-67f0-08dda528bafb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:34:11.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLzE8KOIZcNKfOrUTmRG4Zk/iKwE6LvlubgQOuzBnmJFeo1fMAyenjbGwRkfVHi0Qcu/D6E7E2YVnRIBR4eUQ/5hiBBAdVsCHFlc7BdQTfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5868
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060160
X-Proofpoint-GUID: ebyIDUIJ_nPtZo01qK-L-ktoGsXiiMJp
X-Proofpoint-ORIG-GUID: ebyIDUIJ_nPtZo01qK-L-ktoGsXiiMJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE2MCBTYWx0ZWRfXxvbz8WEpkIns qyu7Hj34LeHLODyhJfnBfZcINQUvHA9hl7ZYaAUn0zILOeA4KsTc2GpvDGPkuZRtOTArTaZbEKa Kyyi6YuI11r/pKDnKNuBcFAvn5MYuBu+yMqTSwjAZhh4QK1jyEQJuzN1eUhDG4EKINNiNpLSsiN
 AZEGKrQPmvIad7TWQJixlzjy9JUKAuKcZzHLtne7Wms9cGodSU0rf4rnhrVt/NuzguWEXXB9635 UJ5PYlMWaS0+behbongwmdnvULY4/rgwc3w/IgVs5uUksPMYeD2aDxI/WfMlxeNV3L0SFQclSBj ArnKkAwxGKAyO/30OCsNr+D49S/jPoe1Obs8Ctnhu9vzwWiMwMStvoOHv6FlFr0eOVH05zGi22y
 iRC4e64crBUxrKkSM8+dxadMWKoRP41trhS0X3jdQ8QbriTK+rusnCFuwMU/+wllb/O9wZMb
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=684334aa b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=-pN6YscyihrUBHfe6UYA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

Overall,

Since David and I are somewhat indifferent on this point and you would very
much prefer a VM_WARN_ON() - when I drop the churnageddon I'll go with
VM_WARN_ON() :)

And we can obvious adjust case-by-case after that if needed (probably none
of these ever trigger tbh).

I think the general feeling in the room re: VM_BUG_ON() is 'kill it with
fire I don't care how' :P

And you know, it's understandable...

On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> On 06.06.25 20:21, John Hubbard wrote:
> >
> >
> > On 6/6/25 11:15 AM, David Hildenbrand wrote:
> > > On 06.06.25 20:06, Lorenzo Stoakes wrote:
> > > > On Fri, Jun 06, 2025 at 10:57:44AM -0700, John Hubbard wrote:
> > > > > On 6/6/25 4:04 AM, Lorenzo Stoakes wrote:
> > > > > > On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
> > > > > > > On 06.06.25 12:19, Lorenzo Stoakes wrote:
> > > > > > > > On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
> > > > > > > > > On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> > > > > > > > > > On 06.06.25 10:31, Michal Hocko wrote:
> > > > > > > > > [...]
> > > > > > So to me the only assessment needed is 'do we want to warn on this or not?'.
> > > > > >
> > > > > > And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
> > > > > > we will get flooded with useless information.
> > > > > >
> > > > >
> > > > > As yet another victim of such WARN_ON() floods at times, I've followed
> > > > > this thread with great interest. And after reflecting on it a bit, I believe
> > > > > that, surprisingly enough, WARN_ON() is a better replacement for VM_BUG_ON()
> > > > > than WARN_ON_ONCE(), because:
> > > >
> > > > Right, these shouldn't be happening _at all_.
> > >   > > I'm easy on this point, I'd say in that case VM_WARN_ON() is the most
> > > > _conservative_ approach, since these are things that must not happen, and
> > > > so it's not unreasonable to fail to repress repetitions of the 'impossible'
> > > > :)
> > > >
> > > > But I get the general point about ...WARN_ON_ONCE() avoiding floods.
> > > >
> > > > David, what do you think?
> > >
> > > Well, in this patch here I deliberately want _ONCE for the unpin sanity
> > > checks. Because if they start happening (IOW, now after 5 years observed
> > > for the first time?) I *absolutely don't* want to get flooded and
> > > *really* figure out what is going on by seeing what else failed.
> > >
> > > And crashing on VM_BUG_ON() and not observing anything else was also not
> > > particularly helpful :)
> > >
> > > Because ... they shouldn't be happening ...
> > >
> > > (well, it goes back to my initial point about requiring individual
> > > decisions etc ...)
> > >
> > > Not sure what's best now in the general case, in the end I don't care
> > > that much.
> > >
> > > Roll a dice? ;)
> >
> > One last data point: I've often logged onto systems that were running
> > long enough that the dmesg had long since rolled over. And this makes
> > the WARN_ON_ONCE() items disappear.
>
> I think what would be *really* helpful would be quick access to the very
> first warning that triggered. At least that's what I usually dig for ... :)

YES!

I wonder if there's some systemd thingy that does this somehow...

>
> --
> Cheers,
>
> David / dhildenb
>
