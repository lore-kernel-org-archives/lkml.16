Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34A291C29
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771035; cv=fail; b=AN3h6WEvmHyn1zV2EcIJnDiCZ4ICC0Qs+/ICXwX2JFyRuznuqaHkd7PWw0tdmIB2XYbQ8FdKms4HSruG/b3w22bTjA6eZXmEmEYYSPmnNuIP2Rs8z5fovldgvV9LoFdcMRrneM+D7Mbs4PnVJJ0TbLS1jjdtqly8ub0ij+MIzm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771035; c=relaxed/simple;
	bh=irxNMdVny0ySOIgz1HZkL7e1Lhwncjy6HFBh8NqB1HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NwsoILxPTAv4yBPS71Lr9fHFytKcivUbtAJRj/SdA/dY8+eUyo0lzqYFRPHO3yI4DWYTYuT8G+o996P2AMuNijzQrLDHoY4KOBNldWtjdXA/KsJhnDmB1xyKFyZB01lSyvG+ZPqnt4tZ9o97AHiufM8PGN5DnoPZUfFCdbWFwhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KOSIqbHF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YcQsEIbx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KOSIqbHF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YcQsEIbx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCiEUi002210;
	Tue, 24 Jun 2025 13:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5uiCh/qLAqmzXMvaKY
	vuhCp/0b2Ept51uqvLAVc02Go=; b=KOSIqbHF9e6EcfpnUtAjOxLHvV6MotFaRC
	513xYSWhgwHNSdxE0GQze/NiexNm+K+Hdx4YQGxxJPLG9eoe4EbZ/xP4sLpjyjma
	JKJ9a7D8pOChP4y6dsLpLcKufLx/lXwgjxzPuM1NHPnH0da4YB+FafsAiVhabryY
	g8eA3dMjHI0gcp/zbUaTDOiFcYAnJLE51v8VT+RXwTxPOQcMqulGu7DQGEDiTkKX
	Z3B4ANWem4ukxuvNGouRWpjcL8tGohWgBGU2QwqD+0XL7Kqydvfl9Cp6n4DwaPpB
	LOyCk8Ux5JcYg1AEZXAQ9DqnMm9ZUZ+1IKtS244SNEEdAc0zMm3A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87w40d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 13:16:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCUKvn031390;
	Tue, 24 Jun 2025 13:16:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpq4hqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 13:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+XPXc4AqWgye5w4W3r3tMM9qHv6aHhYnBsNjgujn4o2+FQjPyNwMwkfYr1VODDgj9h+KtLxTIlCb9Ezq3Xxh/ymzGiygTo+sL74dltLquwsdwm3QAof/X+1o21A4fRBDd24DI1y+hjKEWPSUKOferljUxo5EGEFlTEFPLhNLNydUq8iygVePZtAU8QW/TDttahCiDx5X8VKfu9ncZpj99RO0Un1jwK+ZkIV9gMAPtxvKNyYc+GIDFQBlpBRa1WXnHiwR5KvxHcwJhfA8N5cB812pXX+jTtUk7dHkauEJ9OD3mOe79y4GjmDZjaSMmwJ/t/gComDI/mFEGMOthPThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uiCh/qLAqmzXMvaKYvuhCp/0b2Ept51uqvLAVc02Go=;
 b=mOqP9dxdgBZKW0YXzWEw41VwNyYFRgAkdcyosQIIBenU8cU8m6L/mKFAxCx3AWNUpWkuL4WFN3aNM59CoWldIeMnJQPn2OLrMHorgkhdrKodf4i/VEoE2VMKYPrDsE5zmJEwyiJ+VtDbpXGhRbwwHjNCiMt60xqYDdFSFnjCuWyXgoqqo3KhihOLkVQmzxKPQRYu3hkweY9/328x5Y045AA15WTE457kQ+oyEQ3I/LiUfWnMnYDbM7zIBjZmfiXVVPgO37NdGXgXdcIgOIwgeIFNsrS7nwOPutk21hK0jWwle49HA5dC3yBgD5s2CYC5bQpKT3CigSCYAdqlrhlUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uiCh/qLAqmzXMvaKYvuhCp/0b2Ept51uqvLAVc02Go=;
 b=YcQsEIbxlFx2qEUZSiLEZZ4StTT6ULoP73w/pzrt2ewt0admzCqFYx4nDVG+naGi8C7IrWNKLwn5/3ql6aTsZJU8KVUV7euq4nZuUkY6rmRWY+EVh+mCjuee39CQ3pr1WTJhLBVk+EubOSQqJzMTGEDLQ74bGe/dR3ELk0ZQndY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5974.namprd10.prod.outlook.com (2603:10b6:8:9e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 13:16:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:16:39 +0000
Date: Tue, 24 Jun 2025 14:16:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 5/5] mm/madvise: eliminate very confusing manipulation
 of prev VMA
Message-ID: <dca94cde-8afb-4eab-8e57-3f508624d670@lucifer.local>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0498.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bda32e3-3993-45a0-15f1-08ddb3215af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yKDphybUgfuzRevU6fcE1n9h2d3XbFLzDCyBXL8woD7arfZKcddQpTmDZ7tg?=
 =?us-ascii?Q?npoiqNo7rgSl6jcdOau+GnEJ6QhUq9tv2AjtsXD9Ar2bu2TQdnMw09/rvnWK?=
 =?us-ascii?Q?z5AC9pGvZwBGMjOa97Mop9IQO00eLLxEnTo2VVBCJMyc3HK1Mldg6MtjAgwg?=
 =?us-ascii?Q?+Gca5lDzUnMEhHuR3gknUcFrbaPKyTKAKPJVCKf0EzU966WNhowgqfYcSwyV?=
 =?us-ascii?Q?Gu+F4N6LemPmPnjuL1XDd8Z7UPdCxMgk8gDgLkrG+I73z9xewCSarHCMmVZs?=
 =?us-ascii?Q?qNP7OXAMobRocBLYBD6H5MCta6ppB7ULqwql6M71zzIOHzM5R+/kutwlNvs0?=
 =?us-ascii?Q?Xe2SQx+yqF9fJ06ll7LIA4GUDUnN1G607CFzUZwRkXgaL/ejkQHPjzd6MEDy?=
 =?us-ascii?Q?x1pnVTElmO/Y9Y8sxRC+vFvsjTo+r294kbM4BOThaDRLgRRznNM27DVxhItC?=
 =?us-ascii?Q?3cscl4lGRCIjFmX0p8fgEd8qykPe2mE+Z8L4PeQYed1RfnqUH0NGzmsraBls?=
 =?us-ascii?Q?+CdA+ysedalzQx9+kuBHU/8BziWB30RTB4ylMak+lG/w422tt7VwdCr2x/kE?=
 =?us-ascii?Q?aZ9dWt8WeNpPXjET1ryjJ760qETlxXiuD/9Tnp2aWSRHq6hp7iUL7SZQR07Q?=
 =?us-ascii?Q?N2+Cht2cvVW5ObqTjRXnb5a/0cWfEhbOUyZAB0f1imRLkk0c4ZKvWNw5DN04?=
 =?us-ascii?Q?TRUCzRq7G71VGyunlQRPTvXnWUDj/5XpsMiMoTr9bRYJDh7Vdz4TdCPylHHx?=
 =?us-ascii?Q?pvhv40/ZI4rvH22ne5X6TZFuYRAC5wLSg2hFHUbEB82ARDr1pKWG+XqcS+L4?=
 =?us-ascii?Q?IqnM7RJ+yalJTl1fU5gSOq2cBKP9lgnSyify/xX7D95S4ANABhKrXnyEMpml?=
 =?us-ascii?Q?ztyaeUCoj5t+BVmsvsSTMG9s60cVMTXSZTjJqxcXM3pD1rQBNRv9RQH9hcuq?=
 =?us-ascii?Q?jnxO0ga67QYcdGNf99p+AQnJsJgPgKfE07Kh8oJBkJTB8lOaJiiZIwXHznjY?=
 =?us-ascii?Q?O24szXcuN/VZORRnhuF1tdvLsdcaoJeabfPjqgYEdN9lEc5hGbNLPPqUfvsy?=
 =?us-ascii?Q?V6ZtNBda5DroZ5RKrCPxKTX82WuBzw1+WXvVQ2emVhzP24belki7FnnPZ4eq?=
 =?us-ascii?Q?UDnO3L3dIlsG+gQfx4Jtc0V+t+EBD5Af5aWJDpg09nIqiHJZs3HVRY3ud6KU?=
 =?us-ascii?Q?OS2L+WmYIl9Jvu3LKhyID9Ifk9WpWCArfQ9JTkLO6kMNJCkzq9h5jMMDS1QI?=
 =?us-ascii?Q?A7yUBJKYvzcHwkpXtQgSlk0tYCogz9baxKYvXCvmKvUNjSkAkwwNYVVzgsXq?=
 =?us-ascii?Q?PZ1BqoXeHVUry3e/CIGewR9w3mwq8WJHVyL/1rQPBQ8PM8sL8TguOr08Jj0S?=
 =?us-ascii?Q?7JfdXfhtBtG1I9zwn43scCDYmaYpYMttHPtol0XA/18eHeElHo5sFOudmLEu?=
 =?us-ascii?Q?4KqIAyfUUjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkDjHvOeyNY9VBJupJIvpxtNmfHKqEKfrt+kakueyqE/3HtiJzP3nZKlBX/i?=
 =?us-ascii?Q?AWsaIoLBbEQng5pnwBg3TVmWbBZVxqCI+P8+WmJUeNB+87gb7txPU396opTw?=
 =?us-ascii?Q?/0y4eroQcSriJKzqqzpudSPNAyG6szBC3kxbNgFJKQbpNmynPn1RYGfppD7L?=
 =?us-ascii?Q?2TPgeHIV+aUGxiBLy5oSM8TGEgnsmYiEc0HCY7bBdTQM7pPSQVBzSnhwgQf6?=
 =?us-ascii?Q?m8c/oXc4oVHXduWeamoN0hBK3M8DxcE8txjIMFrzbATYu0qZSfBiA/KlYMeS?=
 =?us-ascii?Q?f1uiHXkLWbYK6MPp8jtWECCpSWCW0nTojqjQ+E6Cd7MHqKm+VjpOTUPb+Jv5?=
 =?us-ascii?Q?PqI3CuWkEgeCktZs/w/+UKuiHX2RZfY7hV1PrjLNrW4cDH3dxLs+g/NCLE3N?=
 =?us-ascii?Q?W0M4HiYZTRwOnEGgVCa2GCrlbIktzjhKXA65gRhagjQeza8k3U6rYjKEzhGG?=
 =?us-ascii?Q?6lResZh56VLx7apmT/s0CA8uXRybS4pZhxH44xT3o4s270FkJp6zzbJb3Oyq?=
 =?us-ascii?Q?whqSn+y8n5VktsJF4lH60oEsn37d7qdF+VfntibR7ARONiCejsgf+uDN8Lv/?=
 =?us-ascii?Q?q6aqRqdfw+hwFfUIB9WHHdl3FRi78zAFZuomCWznC56XpBgZe5GZm7f7TQGp?=
 =?us-ascii?Q?VHNH2J/Ju72pX7uzTqo3qzey2gdFF+dem0PWKYc5HnFlKWv3IRk7aYhbJDfG?=
 =?us-ascii?Q?Rm2cqs7jqyXC9zWiCpVn/q0b0eAy4G7JZdD7VxDcS24SzyOIDk2m9z1oo4gr?=
 =?us-ascii?Q?q+scayL79UMQBEDGz3o2c3Uz6NEg0CGcUUNvMJ1Xc/V2tbPJSiyJl9fwzj8w?=
 =?us-ascii?Q?B0pankxmxMzzsNo3evoP2Ad5ycESiz1qzAoVoDuG1Xu8lg5kDRVHcs+kC8Ia?=
 =?us-ascii?Q?IpYt8pE+BtkU89BaKYP43zvu8Am4dhlTdxMnI0r3S9MWINjfZ9BKt2JctOBW?=
 =?us-ascii?Q?zTd9yorv3zmLBEYyU5/i11t+iZ+MUisQZ7Y1u2+yC5K/oxP3AoIZpmVsHPY+?=
 =?us-ascii?Q?zinvToZJz8vF2TwPxt7TZ3BvQsHTq0otQxSdqPxNepBAE5T68b2N346fas6D?=
 =?us-ascii?Q?d93CB0wJ72Tdg0WS3+9tzrdAJOWXO7FvsUsfv8+m4NtnHqVgnujjOU7odp/W?=
 =?us-ascii?Q?fd94MBm7wxii7dsvmdU9wO5IePoi33ouDUvvpWB0iV52kVvjbyOnEg1amKuR?=
 =?us-ascii?Q?oAoDjLnMdn8C+gVb8p4Tdj6SvswHMNJDzKCRnk3EnabOU0tGj67fyakhymcQ?=
 =?us-ascii?Q?+o87wsRNnTNQQu5Q7bF+OYRdpWdkb7NvtcxsnO0oEZWnrfDCdpURBfceWFS7?=
 =?us-ascii?Q?s/BqF0wl4UuIdtgFVhRlF47BARur6GWWyAEOAaHOfIYm+sxOWO6nY6+JbmTW?=
 =?us-ascii?Q?O6jcrrTP2IpPRdZ3yai3RuDthzmUXqxYg2a9dlr7kqWoG4K5xbzadtbGF6w3?=
 =?us-ascii?Q?HsFMHgor1yA601URm0n0igup54evZXvF2s14tliYR0L/MgNesupvHRiTiShw?=
 =?us-ascii?Q?Zg655qX7KuyC6zMNvjQQg5wYLGFWKD/UvnuVPs/b8XJ1uzYdH3nTX4VkkllF?=
 =?us-ascii?Q?ZtZogd9uiVhBrKsqw7Jrw/iUAf1LAtLWyDsStQrmC74MpacdGp7oYMNjUvAX?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RYw7SSHxQzTsLCybn9Pvl3CRtbxnTpoken3KAURcCffq7cVe8Iq5xDXjuedarzaM3/NR/FoDIQQuhQWFVtbYig1PGCHazoWl2qSd4R7wvhRdHf0PZIglpu2m6dMylTyRQoyCLq9Cr+fCu4bA3h1sd370pGV7xmR5OZ7Sf29hNEc5vme79lgcoY+RMdZoMtXXr/H9naY7A7HVSVW3LQLhPbVpn0yk6jmyOujzmLcfBDAGe6wqKWlg6enb7Zstsvs7x4KGdN2NHiK0r/zeVckzoFx9x6aWDK0aoHdg2MkiaNdshM9e5MSlJ5uxOgE7ZYBOOe+SB48xOgDflayh0YfJO9qjWoGEokESqvAihTKfgGGZDgmyi3In0UulDakj5iWEADz+1qG5wLe/bn9HDbwC/U+7R7nfCNbtBQHTsLbYNSN1SZCwbHjr9rh7bVAqA67G4lkHq7UbsmoAlZD6ALrYO0//wNuJToSMIpbmZzBqNthzKnRbpdHaDrL6E06oQHAJzyP0WmMKaayxMqAoGky3zZMDTw3ZL0uEO/tAkQ4B1e0xYOXLPDsYHnDep3gezVYU7yA5WUAalzFw5wmLC4BdKGfkRrrjx9aiJemSypvfej0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bda32e3-3993-45a0-15f1-08ddb3215af0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:16:39.8664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nahTJxxYbwQ0ZB1Sup4pLXY+wPWk8yoIMFRmVtb9LRlbCfPXurhhJq1vplckFOJRWJpVedo39GYGslVE6JJJUygeEopC84BPRQQNwPf8Tys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240111
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685aa540 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3FgZ_6gW1XzuPjeXG1QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMSBTYWx0ZWRfX7kPXcpfol9s+ bLk1Wwh4EOnjxKzVDaccqOz2b8QkdfnNPsv/S3CLvetU11ryvox9rI4tfch7yf5UzLHHqfLZoMI ZmthlxfE69hdAww1fMbBDwRlyhuLJD92nJGU01VhYkfSGQQTtTXb4irNTAiyYl3vLaaukdLu1b7
 bHYySn0KJ5vyDetStiKnt8mb+TsfkmE0rG4FQb+Jv9tUr10rvRPxHfR5twVNPRWmWGjQHZY46MZ 5S7yBagcm7S8D/W2+2WqeeFhAVjTegmMzs6JM/jg0DLLnPx6jQxiBxxy+XZZPZ3gfa4bF9CoRCA KRNL9KhE5HoykhYLSSiDOjlJuA4VGWLGTv4qBTGh46nPbrvJfMQUfNcWTbZPOmsrzoE5MVv0K/L
 /6vANRLIBEEM9VT12XMz+T1xHPnTjTEfN/A0b1bUHHOmkJoynPeVergMiIiVf8yzuOX1U8xx
X-Proofpoint-GUID: P06tKGxaKKhb-TX0-QzUyJbdxI_gzEA6
X-Proofpoint-ORIG-GUID: P06tKGxaKKhb-TX0-QzUyJbdxI_gzEA6

Hi Andrew,

stress-ng picked up a very subtle bug here. Please apply this fix-patch to
correct it!

Cheers, Lorenzo

----8<----
From a04de12e1deb50e708392b0e716612f26c6b386a Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 24 Jun 2025 14:14:19 +0100
Subject: [PATCH] mm/madvise: fix very subtle bug

With thanks to stress-ng --madvise :)

vma may have been updated (in the modify call in madvise_update_vma()), so
we can't assign prev = vma, we must first reassign vma to
madv_behavior->vma to account for this, before setting prev = vma.
---
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 4491bf080f55..c467ee42596f 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1665,8 +1665,8 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 			vma = NULL;
 			madv_behavior->lock_dropped = false;
 		} else {
-			prev = vma;
 			vma = madv_behavior->vma;
+			prev = vma;
 		}

 		if (vma && range->end < vma->vm_end)
--
2.50.0
