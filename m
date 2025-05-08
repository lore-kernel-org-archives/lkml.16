Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A2E659
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730316; cv=fail; b=iC5o9fReiqsfMO61L4AnyGk5KJfh6Cf9iECft2PILtTwCd1O0Ce3DnUzDGBg8MwSBhQV66c5gbZ0B3ensyeElnLa3sZfdI98hLquchSLR4CwN6MBYqr+ZizWw2vpsDaKRwf307pJzfd6h5Tskpz/T1cae8VtXvoILtb4d9BuRTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730316; c=relaxed/simple;
	bh=7BHODYgNYMtjy+cnHOPFxgoh+WqdmRZKjKGPDOejPVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BWYTAl2uB4yoDcQIB1soYb4ih0V9uEWiOx8OvI9FblHVinrEZSUDIJ1Gr+UFlA+JUdZlXA4jgLO1QOiSYGIPL8q/iKQ1IYVz45MSu74hY/MwefhbnFGVJUO+kamb9RIEJJLjnsEpP1qQU7Wo7salSW6EU0MzO0TR/ONxJkEPR6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lj5CNRdK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BiYLCwfI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lj5CNRdK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BiYLCwfI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548I2jV4027163;
	Thu, 8 May 2025 18:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7BHODYgNYMtjy+cnHO
	PFxgoh+WqdmRZKjKGPDOejPVo=; b=Lj5CNRdKkV2xqnPTZTZE8i2pfy/rtO/QVM
	I5PpqR2L9uXbiBbNQc5k5NUV2Ojy880V4VQ9O10oWX9of5r4etoHwIQTQdc8riG1
	BF2g+n+27fh8dF/6Nw1ta5e8j2DOT9oS78m9agAnGkEFXtuyci9rqybpqXOttxAD
	HILbBoDjpd/Sjbzi6FLKbcoyXwbUi32E8Mskb74Nt1rg/6L1q2PIve3ht91V1fTa
	v9Ww2I2LxN7NFK0QJxAPdUPCzFrP6pACKt4rLxtgDNTGyYcNCsSY8N2H58kBoHbL
	/9PUXzvI/I5hAqWPkjAlme/ivr/bqpk2Hx0Vxa0A/kicEQ/VaZyw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46h1hn8427-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:51:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548IHv8q007298;
	Thu, 8 May 2025 18:51:23 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012052.outbound.protection.outlook.com [40.93.20.52])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fmsanna7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnD+2Xgz399euH++oPpU/Og+PAwdfLxeHEmoKGyl3CbjLa5v/c2K9RBarDrp3I7rY2xo324cmaSk2OtKEBsRxAJ2plJ5lpSXG/DzFstrDXCea8cJl23Enmz8oYeZnzKoCtEz2uY/xHXjwpw0VxX30u+E91d8moFhXeDx3JZvg/QPAlNaKKWhCZVQf8xAVU/Tmy6INCkvIfNxpF2bVIEZkTNPG9vj3CM4Pp3yhFSOe5TySJM0qJ7g9XeFTZkkzjxRXYlAZDLuT+Z73sdby9OEbLx8tf8MOSHsUuf3OnbgMj2VPuBogpwt0aY+GkYxkK0rdDUZSLAxPkjGyE17ppXmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BHODYgNYMtjy+cnHOPFxgoh+WqdmRZKjKGPDOejPVo=;
 b=p1N5ZXbl6xs+4Z5DTUreHY7YT4gIeB8oFLOkgIvRfNgLTDHHCJtKU99OlMI5VsPnW/TGo0wiazykCoB8lBRcl/rI2pL4ooyh61sZrHX5A2iOY/4AyCk80ufQm/fTXuG1/hlnxG/ZMuUIDJkRkNAY/qhh+JKdGSW5nMH9LeQkWaUslJyn9Kbkso6L4nSvycbDgfMSZX0TTqbXSTgmKbrK70gBgifn+4J6+2ioSHVbsvtzbUVqsZyjjaVek+umwXDVTeJvLd4rEWVSo7rt0T2ZQJKqfdOF9RJCzLH1XeIEVWgNimhoRhY8SCGAgyyeMkDqFTuNdIzJXExgyVW+WO7Erw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BHODYgNYMtjy+cnHOPFxgoh+WqdmRZKjKGPDOejPVo=;
 b=BiYLCwfIeoboyKtUlVXbpQHTnA7gyv+aiCjgQ2rEGylrMGdO31q1yBnc2VzQ2fCpRC4fuFifmY/1SsI7CZmo0vo5MtfgC9thgcHSb2JMIWYWDtvxiMZUAc7Ndyn+Hf7E2g8Pyn/7m/7tAKxlwPXvEgbE8H5CLQON9sGpP+YcEGA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6360.namprd10.prod.outlook.com (2603:10b6:510:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 18:50:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 18:50:54 +0000
Date: Thu, 8 May 2025 19:50:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <642e64e5-97a5-4c3f-8c4d-8cd4a6e3da58@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <6050270f-1556-4df3-beab-63e907b28d82@lucifer.local>
 <0faa6c1f-26a5-4d96-8bd7-bfd344a80ff8@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0faa6c1f-26a5-4d96-8bd7-bfd344a80ff8@redhat.com>
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b83999-74de-47c8-3de7-08dd8e6142f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9dRXwstvjIW1/Cm9SEiJV4JXN0Vbu2pv+rcag8QOXeJV/HqHG+ca3d3wbGjH?=
 =?us-ascii?Q?WIJCoCZ+laSZKppaAuu5sK4I1VFrMKId0gNZ82Z7ExKLVsgpZCL1Ugm0sulu?=
 =?us-ascii?Q?OTFrCs1vyQ2UhvxU/glKcrK2ln8YMwYeRK0KWOuPu0kaFjDkirrosl4KvRbi?=
 =?us-ascii?Q?TIJNrtXhgv1JHD5l8+R5WEeHae/f2mtqI7Krwufu7/wGoo4Nb0F/oq1W+KFp?=
 =?us-ascii?Q?BgF2y6fy/PepDLjc2LypbN4MSj/lhaPDVojp5dq3xaSHIemwN3JboZ1YzuaP?=
 =?us-ascii?Q?+mvdjFLAPn8mKtmGLYTsNGWRWnKdiyBoHBQ28ZaQkCetjZb+MGkN/ttClhju?=
 =?us-ascii?Q?uyn2J3xE9RL9KKUHCbzzrSAilEuDksi/S8dofq9z7yXEiDTFGfqP5yoJK9Pu?=
 =?us-ascii?Q?3nGwBbSo0mk5sJugma4OvpRYAG8qeC4NsA32I6VUcwfdZY2r0+D7RjICqgS2?=
 =?us-ascii?Q?VXOC3IfoR1ez8gybLDMiJpzFDWaL/t0/u01ucO8UBMLR5HZ/aJljHRtgqrqW?=
 =?us-ascii?Q?ZETny41e8E46afKM2NWWm4rpyLS1PZNSkZK0XgYtciIiYYnaUWQkp4fDF7wr?=
 =?us-ascii?Q?zF6h4s+qHhkgu8eie9D9yw9eoeyHWXd0GariT9sapHQ4MJeE2exzUJKNt3wM?=
 =?us-ascii?Q?LSnWjj2u//bOXJdOTabrBeOsduq5LBqfTpVsNoXJJ70fHDSxUQTz9Y/96p4F?=
 =?us-ascii?Q?TziXFK0Cd0HnsgdwRclG6bavo/bdJuNdCtxNaWI53RGJgGrhcrJtb0sW4oiE?=
 =?us-ascii?Q?pIUCPuWa1SEWb2uiLRzdLVT9sjnLFTGJUd7xem9cVcAy6olqWJpbdXSEL9AC?=
 =?us-ascii?Q?35DRodHLoSVCCp4KT8xhDMK6fgQVQooI2vVtoNnxnrAgQhANvocImTtJCSl/?=
 =?us-ascii?Q?t71/NK7A3gBOqrMF5+EGWk57/+HAy1cvEqC4PKcKV0MwW6YtgNvKZPtjZtrM?=
 =?us-ascii?Q?GRawRNCliBnopuJ1HUdi2gjU+ERE9aicEJd9+JeLde9vx7REVmUXvhgjqdyD?=
 =?us-ascii?Q?IeuFE3JEWYpxfJOcRtfS09ubLRA8yDaknqC/hd+INlUGW/ry2YfOcxTlU0MQ?=
 =?us-ascii?Q?XqLPyOEJzL68fo5yrsm9S+vFNf6orYnFxtg7m64bNEdza7X9gMVDww0vfEkQ?=
 =?us-ascii?Q?ZGO39WxNou/9eGuOcRuFAYqUfBLl7cXmptjZTFv9STaEW1MHnx1xd+BsMeuv?=
 =?us-ascii?Q?+krKCjJ4DEblNr/3ZyPI6Li2h6uizQ4RpLn31Dqp9OORzMmpYmLvI+dwuhIb?=
 =?us-ascii?Q?55XZMk/097ST2nUYVWfwwLlg5aINw5Fw3okDSwjMiclCQpMbRvS6reCkei8A?=
 =?us-ascii?Q?edPHou6Ri+0Wh0BE//GtrJZZYfbkiLavR311AzjkzUDRDd653OJEHwUk6Qdw?=
 =?us-ascii?Q?rrnKxoetOZcyITfcUpVAlEsM7FkhqlxPnz1x1s6gH1+w/UroPST5RKtkfnMO?=
 =?us-ascii?Q?xtHxA/9k9Uk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W73bvWSWRKQi3pzzPpKWnAFaDqltNSfYOLR6mG671FusdINvdxvSALLlKQS6?=
 =?us-ascii?Q?UDTZYLyShUB/OD9k9X/lzzw8xXL6XiX3LRoMW5/HCtK7aWQ6qdE6kqOB9sx/?=
 =?us-ascii?Q?qCaIrVRpRa4kuQ5VuPDodPF0YJrD1iEmU3NPvMW7Te1Ele/tWL04Ag88EpKl?=
 =?us-ascii?Q?RqqXO8JoNgW6B16qmcCRd0Dqu7i8F7h/P6oOFRA73UVz2tAubfDtRmwkxTi7?=
 =?us-ascii?Q?ctMFtaJlIJlmW/VAq+2F+/a0UpI37PCEkRh2CkMva0vAhk66eySUX17sNadB?=
 =?us-ascii?Q?VdS0JsAMxdkODkfdlK7x1HcdUlGfUiADY2o7nSCwkb/LldVIyy3I1KeF1158?=
 =?us-ascii?Q?/pY4hazvchg6bNPTKJnsJRwQnfrp3BVf8aDzKeF1fRuXSjj+KI92kjhCa7GZ?=
 =?us-ascii?Q?wEVsecMDVPCx/kTllz2c2bRzZmLc+0EkmgSg9VzjyFgPfOKGGmB8SucZlL7n?=
 =?us-ascii?Q?lLPyfGTHV8xmwTCwZosUWwtx4u0AOTdc0w5POM+fjQ3y2BOeA3h4zZmv88Dv?=
 =?us-ascii?Q?5CewH+a5Ubmwlin4Le2+T6nIbQhVGmR3sKgNoDskozv1/oTpDTKRcf6bbnRm?=
 =?us-ascii?Q?KfGMgD85oO5QdF29tlegwU59bH8/V6cjkfN/b6SkdPBUbrn4ZUJp3GrXioeE?=
 =?us-ascii?Q?4IJnIug0BlnCUTejJ9SM/MetEIblVQ6V306OelAiKhbTedV2a/4FKSOw16gY?=
 =?us-ascii?Q?QjsPBK30zVIjJZKpA+hsth5zOF7CfAjKqO+iay0Ym9dJXaO9DQUkwt/PDFvB?=
 =?us-ascii?Q?MhAXOFeFUByxJRfFXIUkN1YqwuW0jOW/lNBTi+t/90xVg0naAZV5qFD1fyxP?=
 =?us-ascii?Q?XUB+sM/inHbTAHnwCLgI+aPoCxdrKervR47t8m6772jEJq+DQCxvPv4Kvd4b?=
 =?us-ascii?Q?1ElAihvMPCtolXney+R/FUxJ+p8NHUrSK+zsp4RpxsCy0KzZ0GCrdNgKMBAR?=
 =?us-ascii?Q?Xxm4ikzK/dSZPR7v8pXZGYi94MgdnjipK8TE+KhvbGQdNlgV7Ef/My8MAyNK?=
 =?us-ascii?Q?6BkYt+ybpmD7p5Z3U9TGhUCe9whD4kPCLUoJpAM/EHotPGTbJQdAn/hU4UBT?=
 =?us-ascii?Q?hnXw1cQNFVwuhkul6CfbiEzpSRmstl1lNbnPtAwAxPc2H4ONIGjH+3muBsbu?=
 =?us-ascii?Q?FG6b2mXaQJJqJn9Zi5ZKAkTfR/wIBVfxpLmppC3/EVYS/CebzHq2xYIxpSU0?=
 =?us-ascii?Q?Xe7ZsfgZ6Bb4QqW2/6UjBTP7dVP4sKPOe+Sf2TOCGhCS74qJ1xukYSG3NeDx?=
 =?us-ascii?Q?7liW1qKyuetZBhKz8uI9LMlZCNHTdW5F1VLFQKM7JHZVcZqN/CsiP6xXarC5?=
 =?us-ascii?Q?gbujiESLnZM1SP/Zvr9dE2Zw/nV9SofzP+JQE4FKq6G4G9sY8CFvHmrQ7wef?=
 =?us-ascii?Q?BNOlNwIzfFbQ8PsYHVpXgYtdlssOzJQ0CnwHzP9a7Tme94OXol+TQWiISOt/?=
 =?us-ascii?Q?vAdF3JP5ERbM6yVdJGwxka5Ej60nzKPV0xdDKJz8wRfPCYI61Hqq7OckwDie?=
 =?us-ascii?Q?taOUvwRQn8Ou6k0jiWzYmm7ewEJ2HY/Qw9REepo8fN9rXmgWcW3T155WLjIb?=
 =?us-ascii?Q?CJMvB5/ueKMK+/eeMBaISqOuKSp9j6vmrmqf2aJeGtn3CGONpfyRfW2ofNNp?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mUt/vavPC9vsCoG3RkjxTCoOf06jka0iR2/mctj+i81BopLCPfiOB5MEkKJ1TV/KzonYsT+dV7i54LmEM+Ur6l5mCcZINRpjNLwHb/s8TJjHhYoknknsdsBjK46p25MFrhIYQz6qB29TvaO+8KSl+2UGZDTK6gqUtOKrtfnS1TsHI24cTcE9bMXT5sdcwElfxpJs7KI39xyLZmZEQ+d7iPjkmu4O3qu2nxElLO+6ODP4Zxp6sRV/oEgVNRhgwQK0oKPMNR4CKnN+S5oHtcEx0T8E7p2cAJ+30Ay8mqxD97+xf7U3Lax3HczQyh8wr5ewsMVFtrGIE4DIjhlOkncVNQkYsgoFGlSwp1Tbq7f8T8lpJGcxESSEjq8N57vcm3mkIpmy1aaFpxDUk+Um0K7m6vyMvUtlHuYrRgR9h8Yxk/7bvIQAUW/yGf8Tt7MLLHbeheFVO9zP968Xdu6GxreXljF5bMEIV5BEwOUNtLB2DsHqJThIr56Aoofs7lYwDXdFO/ULrefDkAtrOZ0onH97kFCjisbblXsyz6nZJned9gqwUxiUzRFVtWH9C4bEr3iGHrYwSubuCzxKj+j7QR/K6dXnAgJbqqIakUJzG/JSVyM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b83999-74de-47c8-3de7-08dd8e6142f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 18:50:54.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf4Y3D542hBQWLuHog9P6IZlOpj/qL8qrFCcuw/MWQz8+xNwpijULY1mibZRYixYq1tCHoqoJHQsS2fyFYrdA4JfcXwdbLFvMkbP4W9tBKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6360
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=880 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080168
X-Proofpoint-ORIG-GUID: 0lGPi6rRuehhP6Hgo0JAO_d-m7CwvMBJ
X-Proofpoint-GUID: 0lGPi6rRuehhP6Hgo0JAO_d-m7CwvMBJ
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=681cfd3b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=wQzNB6q1j4mj96PeFzsA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE2OCBTYWx0ZWRfX+I3dS8gljHSe 8fZKzPJKcbFEjdJr9noT1ZdL1HdRBSi+heIeyl1RyGEIa7YIjA4ESGYgvstyevXXpm5XzSpgt7/ rOlhNBPVPyQF2XsrilIWxIfLr/Cgtw6Pezj5pDbO44qdgBc5odOCWgvSOEI6/FefA4DcIyzIQu+
 2xnekRskyxNGkikY79etrCzQNUJJzPY7f/JsVuoObOFjaPQe2HKY/j6s+3eOFdjChETWmnxac+x tY1RrV1kZfKtRed7nDFg12CG73Y0dfN8SDy3aRKLSGKHBg17kFJNSuT5PEOn/Fa54tWn1onpi2f EDN234gy3IrnZ4p8Jyjx4hrHhgwS07wvXpfsYMCk/mEIH2hKRmKanak4z4a1LN/C8pLWy6dkYz7
 +EBwuPqfluqb+dfBeeJcwd4URMnOAObZ7YE9IekjuNc0VOJxRfS+Rw9+57FUy7OoyBVtxbFq

On Thu, May 08, 2025 at 07:43:44PM +0200, David Hildenbrand wrote:
> On 08.05.25 18:03, Lorenzo Stoakes wrote:
> > I feel we should probably add mm/oom_kill.c, include/linux/mman.h,
> > mm/internal.h to mm core as a few more key files. What do you think?
>
> The latte two likely yes.
>
> Hmm, one could argue that oom_kill might be memory reclaim related.

I suppose it's an extreme form of reclaim :) or the ultimate state of reclaim,
and of course invoked by reclaim so yeah that makes sense...

I guess when I un-RFC the reclaim patch I can add it in :)

>
> Fortunately, that code is not too complicated ...

Well we're about to have BPF OOM killer right? So this might change soon... it's
also why this came to mind.

>
> >
> > We're probably going to be working through a bunch of stragglers for some
> > time I feel :)
>
> Yeah, there are many files ...

I guess key point is to lay the foundations so we can iterate more over time :)

>
> --
> Cheers,
>
> David / dhildenb
>
