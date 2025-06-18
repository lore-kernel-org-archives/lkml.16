Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5C286402
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244282; cv=fail; b=Z9REYUjOQIt7DdL6ogjy3pfRj1n4Ev6wvJ2e0i3+SYQNtsAVoXWx+QSenSTd5Jd2SH1dG/R4IfalzHArzEZHgZsQVRgRiwVTWQK7XY+U+DZYZDCvxG74OFIvgF7jqAW/D6u1lu6BSeSVLDwGWhUShzlpT+LcxvJ/zgWiYN/Otd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244282; c=relaxed/simple;
	bh=OOsXV+Ug7qX1+UO3yWVAfVYD/03dNlP4L9dmKI8tYyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lwdQPnRlHEseC9u1g4Bh0D4HRT0rbLBewEcnvJMLTWwPJuinYmIptZvaiDQ9arsqMJfdduVKlhDuqzT+739fvPvRHuAVS0uVo/Cw3dzbOV8/UAPnh8ED094lgH5wv05O5ZMKYC+hvhsAVctOSKcJfhlRYl5RKm9rg/D5CemcTMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZjlkREii; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=glHKp3O4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZjlkREii";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="glHKp3O4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8fwhj025723;
	Wed, 18 Jun 2025 10:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OOsXV+Ug7qX1+UO3yW
	VAfVYD/03dNlP4L9dmKI8tYyY=; b=ZjlkREiizTq333ILmP3l1oDWJ9vbV+8YKV
	RIDUHXR1qCmFIcCmta7MPeMoD2jJBDTAqBRUqfAJc2xJcsVDxLsEu34EyBdiC1dO
	CAceczoOOVlsatpk1LaepIlL/ctMmL1PLOmPfudyl53M3TFAPSgtdSaHi+693rCK
	nl+Cmjcq0qjKa0sxsz8q4Nb7W+ySEOvUJta1+wb3K9vMn8Cuk6ET9AfBh64LKeG5
	ukOEIk7BaU8Pc0dYVhsZOk2EVrF7kFq0XjV8TbPlZhXkasZe11wPFdl6lqISD37L
	RLNA1MU+FvyfJxoRd23TsVYPRDqcEoeg3gZtucT6JcnOEozCM2LQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv57ffa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:57:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAZAbe025916;
	Wed, 18 Jun 2025 10:57:48 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhgrs6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:57:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHuoH5g0f5whPSvkkgLyu9BmRMCw02KElyRy8ha3P89zt7ZEQj+h3sjXtNirmxXAZqQub7u646ANWHMjIcifkZyZo+DiOdH3rWsQ8swR37sVg8MRAadMx+diV1tiYhMhtshqpyhZJwkS8ucz05qKsUaP7ToBLve21kGILyCHqYdiZAzXW5hapUTeo0GXKcxvTx75ADeTqdDjnJ9PqR1ihiJl1w6XJIRON/CwwJYBI2vlW1No2UZ/oHl/9dPcieCtgw/hgQnbNAW7Xj0CAIKYvxgQGONw8nlfSs+OQ4Z44gd1xT+7Ow1qJHPvsUtnHDNFFMRxPprrMkh2Cy4RbNYOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOsXV+Ug7qX1+UO3yWVAfVYD/03dNlP4L9dmKI8tYyY=;
 b=gIFgFMSaaLiSj9Sws66hMbJuZ9mx4nx6silc6YE08Va3vsDdnjmeZxWpu79kUbPbQd1ExRd0yT7qhA6FXQz0LoECQVPpQjWLyoTx3exEObwaPf8ow/8s7aHz2eEUCBGsH9VPo+yTyvPbtRBzBhk3iXexjC0ISa22mZOzzIvmOPuPND/Wyhyi4fSBB5Wp1gafditEp+FfviDDZpzmSRHGMvB0MRm1NIXlm3y/ux8oIyOpb45FI2Eebo8yjWFsitZJ9WfGn9R4wvYRW9OTzhN6FhK2D7ZhnqOH5XE5xdUuZSvhQodAErW2wZd1bCYq2kZ1ryaB9cVrgn4nz1beo1mY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOsXV+Ug7qX1+UO3yWVAfVYD/03dNlP4L9dmKI8tYyY=;
 b=glHKp3O4bXJHG3e/zZ0X/YDrcFFrMpNESTVEo6s2VXntD/HCuRJTNj3/Jg7wNVyhd2S4gvbn4tRuCoH/sCbtqQswh67i9RuRBPImw745L77zMTnmoiu81GKBGslg9ga1Ew6kmPU+tViYpi63DKnu9ssity6uDLcuAiuB1zLgBgE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5195.namprd10.prod.outlook.com (2603:10b6:610:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 10:57:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 10:57:45 +0000
Date: Wed, 18 Jun 2025 11:57:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Zi Yan <ziy@nvidia.com>, Suren Baghdasaryan <surenb@google.com>,
        Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add missing files to mm page alloc
 section
Message-ID: <a6cef101-090a-43f1-87bf-9ad8976bcb7f@lucifer.local>
References: <20250616202425.563581-1-lorenzo.stoakes@oracle.com>
 <86f2e9c0-3cee-4062-b18d-d86b10393a63@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f2e9c0-3cee-4062-b18d-d86b10393a63@suse.cz>
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ab565e-dc7e-490b-9e68-08ddae56f4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JqZj3dWwbx3z9TQ2QGr+k7j1dRs23fDSDG8lpJutvum0Ok8+WeFs95zzGqob?=
 =?us-ascii?Q?JstzI1cV23Qs9/jCOiV/LaYo8FdfoD3GGwnaeZgY4Ujxbf5Z8om9rVo188fz?=
 =?us-ascii?Q?9Tnvp9wa+HCKEhjatZb3x+q0+PAtSNnScyKYnd6Bx1IeSL57Grb7BFqGy9HN?=
 =?us-ascii?Q?dbAMxBpUhqfjFRxkqKJ/vcFg7JlbfkI/nv8dHNQxD8IwW46tu9vsUNj4n+qQ?=
 =?us-ascii?Q?n9tul964luo+EM1Qdr7FK8cFFqCtqPvNmbZzr3rY0NMuQK/gbsHQW0QZnF5+?=
 =?us-ascii?Q?Iy1Dxqwt/+UenwC77EdZ4dUx7LxrTDFO933GUnobK7ZNGgn862Ska7V3fUIk?=
 =?us-ascii?Q?PErW75orLcXD39iCCfncKFIuPrQoPSk87oDHlzWL+a5LQRlDDpHl6U/v3nhN?=
 =?us-ascii?Q?06bSyADpyH3faXstPi42GC5qrDILt0AhqM/tUXFwc4ZLRbN2ww7mLBjGdbeP?=
 =?us-ascii?Q?+TL6SP6+AbdUU5D5VswRq9hTbK7gC3hYRyk9X/DsDNCdkXlIfUrpvhpzfTKy?=
 =?us-ascii?Q?F1v9IMpxZpJcdKDHH1S0pDgPZ7BdPNX4UK2HInOkd7IfMdo8HI/D+GVw0QAb?=
 =?us-ascii?Q?2drsdKJ/NoacFhFqCd1RDcZC9BEIsJXv/QFhsg0JZ9x3SAkvS9t9PN3PElSD?=
 =?us-ascii?Q?m948EX+SQEElCCeEtiJcCN/BTJa8Hr9C2Cgi5M343Zt6PJHEBqd/jTA80ktG?=
 =?us-ascii?Q?fok5m67ylTj+1xwrBqCzIOwYsRTN34gO3qwrPxNbsGgRESLaoP5MbzS6NXTQ?=
 =?us-ascii?Q?uwG43GUWRi1SZaUyXz2tNali6RXcwg1URPg1exxSj+OU6aMI1TFY+1mkaKiT?=
 =?us-ascii?Q?OJy41KTgt70vL0tuGVzY2EtI9OrqlBT5N6yEa5XzPgH2x+rEFTP+YhxKvao+?=
 =?us-ascii?Q?2uDV0wpgb8dN0xKnR3qFrN3wljhLw3tEteTew5xqQyhFCUa8qHcaFRdG5SAD?=
 =?us-ascii?Q?LhUzRqQFh5YhmaJc4gLD2DJZ1hE7r3qtgt1yHz0y1sTdmN225VqfgbIMzywE?=
 =?us-ascii?Q?cNXvqeVzl8B/0qBlk8GRp8mge6EJ451DF5hdNRX7Kzifixd26d+tFqDwNrmo?=
 =?us-ascii?Q?nCii9gk7ERzkj602fAZuYOGw6prTVHyyooiCjGZYnCGJOiMGRnlnAg92Y5VX?=
 =?us-ascii?Q?7f/JMiIw0+rGh0PphV9f59YNiXvs+D4krvxe7eK5IJd+HPlgMYaQM3l9NxQ6?=
 =?us-ascii?Q?pdEV49QmJuD9QjBbK093Oy9NaADz8L5DAdkgut3KteX3ZOR2ROIrfiqSRjNF?=
 =?us-ascii?Q?dpi+gF9IKrN2mDo1ibEHBgF0qUlbitZCLH59liKHbaKJGm/5Am+VUAdjTohc?=
 =?us-ascii?Q?JlZahwyL2vdiB6aiNZXNfPL8DhXtgPaU9QJmg2IpwgVkCDyOFwpgOcFfv9tm?=
 =?us-ascii?Q?lviV3ptH3Fb3hVH1rNmDTqy1kzK0Y7/qKIL+Dt80wn6d6XB+fWU8e7X0sqyv?=
 =?us-ascii?Q?XemL4KD30h4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?48vaGHcQ3Bj9+GEZG11DRUJglOve3KAiU2SRJyBWUet/WqXTjTo28tITApiM?=
 =?us-ascii?Q?J/F4eJWzUDmh3LAS9GfxTPL+zuqfrEF4+CoMz2mB3rotqO1xM3VfZMRDgyBd?=
 =?us-ascii?Q?KjpkE8p8cJ/Ov9igqjvxgfzmczMLmJTD11pvX3dgJj+IzQfZrZ0IHUmEruPR?=
 =?us-ascii?Q?/k++Gaguz7yXqVh1L5TtPhHXo0G2gdkiU4+A3RRVCrjHnSHVkEyI1H/Hfjmg?=
 =?us-ascii?Q?9J8YjdQp1zIJggJZRvI/pk1fTRmDREKowuJR60RKZHHd4z5v6HIn/R3LihOZ?=
 =?us-ascii?Q?954kCFCzQokyRmvU6HPNrMQxF1ykJVyDjCHERfyOhYMnqAmbc987YW1aSEJA?=
 =?us-ascii?Q?Zb/UCb5wo+zmbM5fO9ub/ECw2DoDn6u4jRH3VLAXNoB1EOLDL579goB5UdRd?=
 =?us-ascii?Q?giEMNbeekOwnFECTPqg+J0kgC7OI8/8Z3K8w190pFRpinATNaFPIZXKrG7WD?=
 =?us-ascii?Q?Ski6WQ7nGvD+tedbC19HpltlaRg+AhXkB8dj0DHWCSHkm/6M/26yLTPuBIrM?=
 =?us-ascii?Q?uFQ50eKyvtlYym7VdX0aC9tbqI6WoKvSDdU8/Voo7j9X6lVRpZaLtgSVbbHZ?=
 =?us-ascii?Q?qpDhqW8Bwf1wu4FU+kHQMEt/3GdoXLSbR8dmCngbPImbWNX1I/RPZqvSFUVE?=
 =?us-ascii?Q?4/VspjfmA3fvKhFumWfNay8XMtfDR12of33g7eTlWhFVUlwsHUgRdI2JyBET?=
 =?us-ascii?Q?7dKSF75ALnTm4pOFQS1GoqQSzV7gCdEBKyR9bl8bTD7jissiDGyhaV5x3jfm?=
 =?us-ascii?Q?DeZO51ZoQs8w2K0QedfVXYh0kxlwLKsouS8vf4MFuh/p0fqhPQ/0ixSf0Irl?=
 =?us-ascii?Q?O7Tez7MSlzjrFsIptaInu9UNb/5cD2QatcpP9T5ohdu8mTUDxc1HlVvvrQBF?=
 =?us-ascii?Q?Pt5ZQ7xSgwu0cI2rBZmb3+NdT5bR3JmqE2mXuW0rCbxIvAc713G3/R7ZnMmA?=
 =?us-ascii?Q?UBscyNL0XMZEfb6u2j8/9zI6tl4P/5h4rJF0jqSsz2pYGHAiUdfD88jE8crU?=
 =?us-ascii?Q?ph48fFpxWKe2I59NOjoZCXanO1AUaZwtRgZMUB8P8KQhdlC1VwqI4M0ENzuq?=
 =?us-ascii?Q?l8fYsNALT9AFJdyCQPtBab2h628cEAtuNmv9pmtkEsnK3w1A1qVBaoBvWCcg?=
 =?us-ascii?Q?DjTga3c7gjHYNl3abuUsYmBt3L52Jf1sF1hYTJvXOIDPaTnGYulfDGP8pD5U?=
 =?us-ascii?Q?oE8I204vJLLumEaFm9FI8MPUzFMebpsEdkAn+UYGPwKZJHKJXdRPHN1V1oaW?=
 =?us-ascii?Q?Xn7bVgXgnpVI28ucPlBlQ3yM6gsSsuHXDgjca+7tIyWirZxreSbwL3ULWrb9?=
 =?us-ascii?Q?y+fAHx+A/huXmFpVzQ3pCGOxgrE3kbualBqvJ9YSHszBv5PijlSBT0eXP6nl?=
 =?us-ascii?Q?pUpsOpR2EyaWq4GcyDt4D/n7cdsE/Ky5hMX+21kxYivgv49Fizy1PUggIcix?=
 =?us-ascii?Q?EnHd4HL8M895KZ9JqlBRzsb45LXWOjECvaeK5zrn5rII0F4R+ka8lgEt1KpU?=
 =?us-ascii?Q?Yu8oU5BHryA0A/GOKjqseuQjEi87Jlqt+cKqgPD4LeH8QDvWkEV33jXdMVZk?=
 =?us-ascii?Q?apoZs4gLwepoa+v4PJVMKRtW71qnnUId3GA9N7Ybw4Vn+7rhRtyy2bBfnupQ?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	El9lsFBVLbFDCqceaY3VG8iA61dP1DI5oQxMGAfQlfPWJnWL8HIEU1/hj1J1a7WsKGPuBXku/7MzSXvnsEZLqFjC6IVLcM45ErtBjmAVvb8IZI5NB8PI4SCcYUX4XnSxs65WJcKoCphuHYX03Ze0PgCZeG97Jj4JcRpFpKj4X6rKLAI05C1i6SSphwXT/jvwsIWVlZq0Urx0R0h/3uFuqRj+vKtD+Y7Wl7ySkUVq0def3UhHhUNYBoO7Gg18xYUbR3faSpEZZpvxI8tnxTxnUPQAY5gaDhN80rnrwEbG/k3MNjf8x1HQhoE7CY9SCIWC656eg1hjEhDa5/dUqYzAXyF79ZGEUCDEmv9eivuG2chmRdOvslZhexBV7WFvlO9nXK+n0AzZwQFjHtYTI+K2KBlrjGNPWRvEKSbNBE7+mHr0VMuF9ceRT4R7ueuevMdh1xeE8fpRDmPWomnBwV54aiMQfJ5ZF3EQEaGvEm2pLpH6Zb9lw6BXC5dMaqPppQR1mvjHKnLy4eESZTrJAAxNNA3KFj0RIkp6gWao7AjcFQBCfuBqP8viFrAexNDjbJxhaah7L+4xLfZzfl3TMH9h2EeYKSlhv71HeuR/6gdKOGk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ab565e-dc7e-490b-9e68-08ddae56f4f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:57:45.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByWypEzpdPxKB/bp2B4kPK0GoeSar/Oi6JWQY0PUSXcu9qIgB8VdUTsCgA5FeaQz+h5ypEfnCt36EWRHW5IlTI6R3hqUf7VErkx4y6gQv8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_04,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA5MyBTYWx0ZWRfX6HNYoFSVwQZN fOZeE70KNG00BjdJFO0vm8+LE4ewXvPU2hUZHq2KbKzFZwUNzGW7ymvH/zyz05N27BvB9MPyjmh 64QNGeKOhS9M8JvImIXf1ywhyuuXLepLC8WtJpJGFjPAT4Zfd3MCizD+LouMjaIbmpWYrutB7k6
 5PzKgC0MHw0oHxUaG57EmKlEwrf76Q2+QMkW7Ugb9s6r8RI+H2AgBU9OjnM9ivSq3I4UCxU688+ THSQZilnIorWaeMwUcLwVgn2oKTFrIjuSTtj/GMEdXbIrV/N8qthh0N8ZgYymhGV0kNjqIHi7S3 NkUM/8riFNPdnrVBsAsq4mSMXgydMDxV/J0d5EIK+cRqd7AnqpOhGVVf/ll4qccQaRaRBzlMpU2
 8gnUx4G9gRIOnstOiXaMarBj2PPunn3+K/u4MKQB9+JGynK9EfOgpf+88eVQlcgwzC+u7SaT
X-Proofpoint-GUID: ETJOq0BnI1aezYB3P61D6PgcY0lYVFCm
X-Proofpoint-ORIG-GUID: ETJOq0BnI1aezYB3P61D6PgcY0lYVFCm
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68529bad b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TBZdlYzzvtEp7cleM5gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Tue, Jun 17, 2025 at 08:32:02PM +0200, Vlastimil Babka wrote:
> On 6/16/25 22:24, Lorenzo Stoakes wrote:
> > There are a number of files within memory management which appear to be
> > most suitably placed within the page allocation section of MAINTAINERS and
> > are otherwise unassigned, so place these there.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > this. even if they are not quite best placed a 'best effort' is still
> > worthwhile so we establish a place to put all mm files, we can always
> > incrementally update these later.
>
> All look relevant enough to me, well spotted.
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks! Will send un-RFC in a second.
