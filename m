Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191313213E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342421; cv=fail; b=PIrZGaMDogPuPdwU1UfR0FQf9EUAsRQzEqyj9RZt5e0b982gVmkHO2qq8W/8tnLPogFoEmBwulqhg1t/d2h3EzSYqqwbWWfxyUdEZ7LS+YtXXgKWMda4xkKOxGzzn2gP2DotWJZcRemT6ThEbLt98nNAoFmZZrFZRvpubrbG1Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342421; c=relaxed/simple;
	bh=zW47581p5W0sP7O5ZBBIaKlj8n+3ukTYS/JI4jeknVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lzw9THG7ciMhAG3LfnxgCOgufd/0vndi3yRYnbUTc85Ya4nvkGJI8y196JCFJchhmHa1s4BdaOY3XrX/OhVJ3r5Rrf2L4egpdVX4yWu0aQxRe1i3YT3d48r2bIGKbvcp/iGbWR8rPSk8THisoZfjma3vPhR/fnzvtOZAuxkWaZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DSgvqP6M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O9aKKhys; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DSgvqP6M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O9aKKhys"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFvBjd020694;
	Fri, 31 Jan 2025 16:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=cFyqkMHJGqxhori01x
	3RhVLUC+GKRR8kulloqU/DuwA=; b=DSgvqP6Ml/OwBh7lj/ejJrf3n3fVGTpOw2
	/O1v1aIcQpU9Yneip4na95v2uRJD3PILpTfS6P8ZOjnj6p17gRIxIumUl+d8L/xt
	j9NdQpbxD28VbsdgreYp/jThSjkHY6q3iilLsikevT9w8e6X2ebBJjdxHap+2dZd
	r82dGD9Sc/AbRj1lWKF61UpPyFPf0SkvMleyyARxgzsIFU5iksi2vzYfSBckywyF
	uvDsIlVNjCFoLu9789Zi/9STj8jQ6HZ7bRe4W0nVfBIdqOuX6bavIRd0R9fclzjx
	9qKEQKDlBQvxylxcDzJplBbEcQNbqOJZ1hrFPr6HdcTNCJJpA6XQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1kx046f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:53:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VG8bmK009040;
	Fri, 31 Jan 2025 16:53:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gg1gm0ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SStr5SJ4A/W5dudPXlCx2zFf2p4vnRZdjFN6O7d9QBHHIk2Z4nP2lDHqANEm0Njs/iO59AC7bFkvCyN3or75jLmp1FzV8FWNIHJ6qRRKW/ojOg/da/co8lPLphs7HWM8WkKoICMxC0wimkaieAjTlGTObPOng2p9ewQ1RYwmRfVhjEEPz1ti+eRGYXXD0dT2Zxmbi8vT+NdvcAPVvtKzhIqGKvTjLjlwejOz9oB9IzuLp8KSEfxYTWih0f3J7Eg47NsVNbtzcKWylY/pakkJC2X+T0UcIVnachEJkmThiiOA2U82Jqiyu9v+6L2ZCE8yKkjM8Aj3V8lF8aThDcG2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFyqkMHJGqxhori01x3RhVLUC+GKRR8kulloqU/DuwA=;
 b=xs0nngr62DAaK+wpEQD0g7/dIJa2qjozErMozDZVzPrOzfkjYpi452IJC33lmTW6Rup/EsRR+nxAVvXd/X6OfWo/MPg0DC5KMGuFf3pZePvTj5mVv6LqgDJoCGLPyDE1A/3EVQ+5KYoGTzmHzk/LcQfpXmQOSwzb/upKgWpLnlSxbJ+cIiNX6h/QFUsGitr4ERcnPH19e7QhmlCIzt3mxoqEua92E0WK3hCOySkYOZ1Yj60Q+H9lG5ub9pUmw5FIP3PCo8kbfqM1VfZar6o0QAPKZmO1uf0o+QbPSCFWM7+TwTBybLXWByAmluyIu22WVp/aLpByYmi6qqIsEFY9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFyqkMHJGqxhori01x3RhVLUC+GKRR8kulloqU/DuwA=;
 b=O9aKKhys0LK1bSFFPEciXSknAGT/zy56Uw4qclhWUvqB/zYnniX+Nqg8lDy3uAqS93hGHvqxCiY65Y5YdGd976bo2CnaUvo9/Nrs+wVaMMROPczp2XIO19VNYQPeUi7n4SM6ZvMVhuyaK0ye2s6E/WqrE45uhiT+aIIjVCPdQHY=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB7061.namprd10.prod.outlook.com (2603:10b6:510:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 16:53:21 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 16:53:21 +0000
Date: Fri, 31 Jan 2025 16:53:17 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-5-sj@kernel.org>
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f65231-e7a9-4d99-95c6-08dd4217c4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A2xE38GN8ny7P085nnZC7+BtuVIWdCDo4VgE2frp91q62jy2B2yD2ZXGzQLJ?=
 =?us-ascii?Q?KAZKuZ27EqIokNXyWFCKABDp1HefZ/u+nvbx4KdCVRnjqLx8f0AYT3IW5zNn?=
 =?us-ascii?Q?99LiT7GXeOkuuiWgGY9J0hjUTAHQs11rUY18XjFf62Sec/U+ydIuvJTM5Jam?=
 =?us-ascii?Q?DY5oci6NkoXe5j7C9kASgKxWxLv1fd3IfK4CzCB/6WLCe9JwWs5hA7Sj1M6i?=
 =?us-ascii?Q?2Ve4X8doZbYMujZfDGrfH8gMuo61zFTHFOJPG4oOrTTXiV4nSQRhnz+cLjSw?=
 =?us-ascii?Q?1dmrUJBVkXuTWUANoUOmv6k0s/SMwvU35fjFMjgwju6OzKEeNL4vOukyGD2x?=
 =?us-ascii?Q?OA1/gYocmgaIcgvuMsLlUlwrU3OZFUEsnIIWAAnX30yz6UQSOxdpZyWJmxir?=
 =?us-ascii?Q?YmR9NsYtKDjpuV6nfMq4p4cnuWJgoYBDYfslV4wAdE46y433GODwkMWh6x+p?=
 =?us-ascii?Q?jsq6tsoopMYrtWRSaisT9q86dKhYtjf+6Ac+x2dPzsxpVRotbuOXKWtbLnMG?=
 =?us-ascii?Q?QC/cn0V0Rm06jenhjxND7oBDSA5AZ6VZnEg3rUpol3cGmSdI2p1EO0sc86dR?=
 =?us-ascii?Q?M0nXZyZyiRxcH9QA8u5EWniJZx7YmGf5UvwIAhsV5tNlwGXA+Tal8KdQ1iLb?=
 =?us-ascii?Q?hlkI9qgoJvxMKIsXJDSjRTvk8Yw6y/DmDh07A8BxIeoe2TprHPWfARBYFVkb?=
 =?us-ascii?Q?9thj4PDkIywdBbrkbxPsDE2Z5OoEe8PQhsbfVDUh6xmr91W7gPS+rrkZZ5JO?=
 =?us-ascii?Q?+JMX7UEtKN7Tkekv/peX6aNabaS3WX33vreWSrS+z+oPKWgj4B5Wvt8cLo8W?=
 =?us-ascii?Q?wNDA9+VLRntVVPMCrz3PfD0dkjpnzxTqWCpCeeVIXHZ0cOsihhIGphjIubwb?=
 =?us-ascii?Q?IQY6b5gI8F3yMTbj5IPeq6L8FJCEP0OZwXu2rH+MyumlCmgrN8C2pZzFTtMI?=
 =?us-ascii?Q?PXaeyA/nJC8pnd72rJQgNhfd/sMl8/y3XXZdAZHdfRw7XHOFf4sj2+b/et7Z?=
 =?us-ascii?Q?HC7fczSqznH/KIcDK3tYLsdgkEmo+4ny/AjsLFDOm/Fdozj0NMiRp/CuI3TV?=
 =?us-ascii?Q?K4iR0u+Ea8K5CMpdK2RhWD6wn5jDuxnkAM7zjJaYjVvBWoSJcV+mXorKKzyl?=
 =?us-ascii?Q?rUm3OzF1Y/Vw+LvuvKuYcZKErDrtB5WYcEAyeHnI0fQpurx1CBR2PKK5VOdh?=
 =?us-ascii?Q?pDeCB4AjRhX8ppLHJvWvt5rIhrw3HbxgZYxrHzazGNRb69/CAo/0/XiWB04g?=
 =?us-ascii?Q?2plFJdYgsc1YY/uRXs90MFaamp5EQtgbLjPjeRq6aOvT4/4FnXmMmHtbMa8w?=
 =?us-ascii?Q?qF3EX7SI12HEXHlHdpWLOhuN8t5RfcJJdc6gHbpx98cXzsJoVWurjpmmzSnp?=
 =?us-ascii?Q?PJjzPjKat/+BbgaDNE65IKpeTO7p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryixb7pXRYG11lAf3SxlPZl849XZ7OxrmYVNQZ/id8quIrMKBEfycMlWteeB?=
 =?us-ascii?Q?8FN6ZX+sIAaBK8ONI2sGaKy5yKZfuiS8Q9A8ykAuuI7uDyxBmTssWly8hjOT?=
 =?us-ascii?Q?CBz2u/V0tg7ytLW1HZ9Wc6sXX9jugMR9omt67D0USTAcU09LFd6+v8aYIfNO?=
 =?us-ascii?Q?HayFTO1jClx6VfOZ+6hl0Mt4mq3ANDVcB1MJGOO1MUlLx8u4Xc9hVREVQY3u?=
 =?us-ascii?Q?vTcKTReh3gKTf1i0MSB/yW7NuKhSjHTOxKv3KmxnWXkF80pPs2VjtXJbA/Zb?=
 =?us-ascii?Q?oNFNZu5uacVeiWTg9jp83fc1SOfrEiT8rdAEHNj6jSzhGzQ/O7k6g1lNjOMr?=
 =?us-ascii?Q?BBY9nj4O3JmMsVMdc+b6xklFdgOLDxoZdcs/HnKbEqEdvFMrdB9oTbncsded?=
 =?us-ascii?Q?GC11wS4V0lNChQcqNzIQCju4uCvWaEfLjxRPvlsNSLdJvQtB2FTp42dpsaS4?=
 =?us-ascii?Q?1f7ym8aLRrBUODjN3gSJ1Nnkkqw8qgcZoiYSQ64sw+3hATbH8/yG1MfEIvcL?=
 =?us-ascii?Q?oYKwIiMEyyfhykcL6uC5CF9RIRSlWrJvZaZT3SP//nPm3LdWdtIAjfw6WrWu?=
 =?us-ascii?Q?ua6uhIkT5ZMbp5GWKMHm/g7bqbk9dLxEjpIadTgA1Sldz1CN93O5JBZtsK/j?=
 =?us-ascii?Q?E4+JmwYZr6qSzeCZAkho9epuhsEe+YAC9p+MfMj6rgGIDKMaoQrxD1PMEoO1?=
 =?us-ascii?Q?bJw97FFebCSYh0WE4tVuTqmVOwOUQ9H6aNn5zbX/sug2CQ0bCiusxgIo+BS+?=
 =?us-ascii?Q?n+YxOBBpzRmpmseajB0sVsWZ9ymqibbEZdTFGmmUIJehHb82mz+RifUY/W4q?=
 =?us-ascii?Q?p1vmVVGIxTmjfFHUL+qkmpiwHV3zRZTb9ONisrKjKmn3bwe+oAg5RlTQLuLF?=
 =?us-ascii?Q?/iNaHtfOlpXEdDZtR9TRqkLdxv8b2e5Gy3l0RoeBWYMIZkZ6jIjKqeW4ea4z?=
 =?us-ascii?Q?GLga1CMQs68oXoYH5dtkQl3R3auRykLCOamOj6/Ikx5OGnYBPY2JjQaiuVVm?=
 =?us-ascii?Q?Y6/3XvcDJ5bPoHyomniYIlFaZWSY3e2vpwYtbaKl2u6w50ub9CJ9bhgRfxKq?=
 =?us-ascii?Q?ohpQMq1vJC+AM7j17hmApmhwABqPXoDART4jrxrGre6qXuQJSNUlB4CJ1AF2?=
 =?us-ascii?Q?y8/o4rU6z52aoNhzm6bTBsctMOH1Gn6UfCCRVWlmd+DRDzPALcEvgrFQJdrM?=
 =?us-ascii?Q?iwIgLxMcY6cih3vDAdvmsifWRcry9Mf7aQ6jFeU1jz8OkxWgisfDo78VGm4J?=
 =?us-ascii?Q?XOW5p3O2XHxyhvc3TBzuYCLYJ2mbpPVaNX+iYr6fk3Pwj4SDzipYDqbPXoi+?=
 =?us-ascii?Q?EXmCxovnzdpme9wcnz7oO8k4/3OMhdOFHkq4wXk2I8B66AOW9p4I+GI0ml56?=
 =?us-ascii?Q?Z7ghzTE9zNQrWQbfYLgYcyUnhqxJz4YJIj85wieFRtksoizhioooCb/moalo?=
 =?us-ascii?Q?aMrmzg+pEkg9oTh9dvl+fByhy0HIXxc53KfNHX6iymZ0BaAWWpmu5nAU/Kva?=
 =?us-ascii?Q?/kbDFXLtrqgvK8rryxUYKPWfjORpBr+Hvc7TOUJk3KU/4WgT3ZAaDLFoLwAp?=
 =?us-ascii?Q?kuo7aFP168+Fe8svf/a07TfwN+U4bhUzgeW2IYS2F8G6Ho/nMTNSor/unqP8?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K+vcGWHMDI3SIlwF8ErAvWLFeHglxzqyzpM+cJ2TagR2Eeu8X4Sb96LiqAUlXZ5PIvmoKKw7Ukv8QguwCytJjFZr+wrndy/NEq9JJatmnN4WSm4sdJIiUpP81o4ZxBLs5v4BLa75rx5FNvLoYQ8ceAkqgkYBJSGuTQFPh8NE9AA74zWZnkm7JIuVxuvC9FGj8rtE0jxVzADtPb/tWkJnaTuPijsPRNHV4W7WBiZ0zKyjND7/oNz86uU4NdN958fx3Wq5GKMVmY0sf05XY3K7ylS6pkmckYo4jdgg94N9JCq/HYzx/57mvldk5E7JA2IZp7JtNAAHqVZI78kFgS5GZtiT8qMIPyuoQBec4pl/PPZa+vqbAhKftJmEMNcsH/ebXgSUpa2tybKDwu3mbULliZyVBHb8OA+MtEp5U/u+si4JzFRLDHxxCXHk1DyqiYLDkXdGuRRcg+DUcinqXGi210DGcpjvhyWbbsy5e0a1BpYp7v2z1KX3eQJiG0+70nqI6kSCKZYIC9Jz/8zt5wVDn/eZ5dGVWPVIDxiXqkXQhe9DuSxuValZDp4F/jhV5Mtyrb3Fn9RkdnkPANktHZ6c2cmxmggBOAKuTFbHZlcHPuk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f65231-e7a9-4d99-95c6-08dd4217c4df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:53:21.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwfJTyGn0G2z4wnH2cuisZCrz9Ot3HFmGhHoKbyomHD61CkVQPw10vryUvOs8MUy2YDERCwodX/Bi+b0IRx+Er2nkz5NI90Yvv2v/zhaApw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310129
X-Proofpoint-GUID: S8PSQQji8c7vkbR8tTXusp1TkhErvjiL
X-Proofpoint-ORIG-GUID: S8PSQQji8c7vkbR8tTXusp1TkhErvjiL

On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> Optimize redundant mmap lock operations from process_madvise() by
> directly doing the mmap locking first, and then the remaining works for
> all ranges in the loop.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

I wonder if this might increase lock contention because now all of the
vector operations will hold the relevant mm lock without releasing after
each operation?

Probably it's ok given limited size of iov, but maybe in future we'd want
to set a limit on the ranges before we drop/reacquire lock?

I've tested this against my PIDFD_SELF changes [0] and the
process_madvise() invocation in the guard-pages tests which utilises
process_madvise() in a perhaps 'unusual' way so is a good test bed for
this, and all working fine.

Amazingly, this appears to be the only place (afaict) where
process_madivse() is actually tested...

Buuuut, I think this change is incorrect, I comment on this below. Should
be an easy fix though.

[0]:https://lore.kernel.org/all/cover.1738268370.git.lorenzo.stoakes@oracle.com/

> ---
>  mm/madvise.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 913936a5c353..1a796a03a4fb 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1752,9 +1752,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  	total_len = iov_iter_count(iter);
>
> +	ret = madvise_lock(mm, behavior);
> +	if (ret)
> +		return ret;
> +
>  	while (iov_iter_count(iter)) {
> -		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
> -				 iter_iov_len(iter), behavior);
> +		unsigned long start = (unsigned long)iter_iov_addr(iter);

This is nicer than just passing in.
> +		size_t len_in = iter_iov_len(iter);

Equally so here...

> +		size_t len;
> +
> +		if (!is_valid_madvise(start, len_in, behavior)) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		len = PAGE_ALIGN(len_in);
> +		if (start + len == start)
> +			ret = 0;
> +		else
> +			ret = madvise_do_behavior(mm, start, len_in, len,
> +					behavior);

Very slight duplication here (I wonder if we can somehow wrap the 'if zero
length return 0' thing?).

But it doesn't really matter, probably better to spell it out, actually.


>  		/*
>  		 * An madvise operation is attempting to restart the syscall,
>  		 * but we cannot proceed as it would not be correct to repeat
> @@ -1776,6 +1793,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  			break;
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
> +	madvise_unlock(mm, behavior);
>
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;

So I think this is now wrong because of the work I did recently. In this code:

		/*
		 * An madvise operation is attempting to restart the syscall,
		 * but we cannot proceed as it would not be correct to repeat
		 * the operation in aggregate, and would be surprising to the
		 * user.
		 *
		 * As we have already dropped locks, it is safe to just loop and
		 * try again. We check for fatal signals in case we need exit
		 * early anyway.
		 */
		if (ret == -ERESTARTNOINTR) {
			if (fatal_signal_pending(current)) {
				ret = -EINTR;
				break;
			}
			continue;
		}

Note that it assumes the locks have been dropped before simply trying
again, as the only way this would happen is because of a race, and we may
end up stuck in a loop if we just hold on to the lock.

So I'd suggest updating this comment and changing the code like this:

		if (ret == -ERESTARTNOINTR) {
			if (fatal_signal_pending(current)) {
				ret = -EINTR;
				break;
			}

+			/* Drop and reacquire lock to unwind race. */
+			madvise_unlock(mm, behaviour);
+			madvise_lock(mm, behaviour);
			continue;
		}

Which brings back the existing behaviour.

By the way I hate that this function swallows error codes. But that's not
your fault, and is now established user-facing behaviour so yeah. Big sigh.

>
> --
> 2.39.5
