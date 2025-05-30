Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9C1E3769
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596161; cv=fail; b=PRBsz8Jnen+ZHmY+03l64f+yeirpuvKlEkcHM/cLvwB8ifV3J1OK+5TxOj3MGrgCmIPWRnneJigin/FBL9Ur1RYOvvYzGJqYFljlo35r/ddPRD7P+xwBhv7Pyg1gwQ6l+SwybPquIBgvdgahLbYX2YLJOKqpr4go78kftR2EuMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596161; c=relaxed/simple;
	bh=gcyjxFwEVDKlLnvHjop5wPdfXDkcIsCj2uC4t+V6CQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TCxkeHgENFt/hVvQGMqsQJDzwYg/KJQXVNnfJNkooaEnPLayeKeflc9XIHZhcF/hBHKUl15plI0T6+Nfw0RRW5D5YEH4RZx+y/xyqYcD0fykOyJYbVfwk/AUg9vpSWkSFQKrQowMj85ykSs5Tj9v+YRpaxuPrq+nPWfROkfoD+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lDB5jcZA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c3p4Jmtb reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lDB5jcZA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c3p4Jmtb"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U6trF6005019;
	Fri, 30 May 2025 09:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=o+0WkFDl/nLu/BK2nLXnQzO9kdoajAfNAibA7+RUqhE=; b=
	lDB5jcZAqHjONqsi+AgImEBqfg6wrGGp5VvTB+9WXuLcjir9DBGjgUZg+bSOmD0/
	tBBfNcJHyq8xRYr9HyDf/z08S9L3x/QYmOGUnoMDDeZthyRoYxE5ysMCL0u+4iJQ
	zmvk4Qaxc9i1e7h4Bn1yvhSSQMm0qKTxn38Pek8ilt1sTW1rfJiYYjOzmfJjedKD
	3C0/Gp02sC+F8pAYzklXQKn3ubcDT/m1uR2FwZNVfuWMP/glJq5UILNw76nnOx9m
	wNMrLoF4srcEpZbWKtEKhdUfHVoL/SwaVuolNN3OpzKd7avQCZYZVRlL2Jad202A
	u9XIX68wVJSd/xMORT++5g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcnudq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 09:03:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U8NwvQ026702;
	Fri, 30 May 2025 09:03:49 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jd1c1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 09:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS1JRtdCJs4MdK6cV6uzT+BJEEbV42hzgwmRKvuDM/G8DuaWVnjoFWleL8JgvvrngXfqyFgBivErimRwopb17IZPz313IDUqsIJ7jkRGYscsAR6g5qaXIWfD1qmLLuiIsn3niz08KcbkS2TkMpkLWl/jiJVGkbfzeAHmQ9uoEB5uG9OyzVjsM4v2J8Lhrr/0UbRXOmkqmL3427PDlUzhfIU7NIGL8p6A7xCuUVMblXU90w//XFjj1qfnzjMcHMaXtM5qNjsRRxsJrmbD9D/PucicevyrWYuNFTjEhDprEJZ8Ed1Cghz2q5rISVhOxoLzdczYLJnjGuqlrOsGxXS8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q60Cklp6/T+1mNpP3E85IzyFSebAgOq7YV0tDJ1IyM=;
 b=fja4dE48B13wN08QvVSUL+KIMbEVaIbPg+sd3ecg6GfS9+i3qBYOqRCa5WqpFbNJ182UV2qc0VLBlz8UsvVtyxF+yvZenR9ogVeEiIhsPqYfcP+zpHPMjbHf5TVDxXSJCVNB+b/o+2SYhk+9miyfxTvSxrQlFEYWgwUJfJVAKl5dmHMlTCRDWnyc/FAgEPJqDiZxXUkgmo/FeuuNUZd0Q+bi898AAtTK2KOxcjSgd1o2NGiI2UJ4WMh6wkssc4isXPwnLeJsxMQ8QYS5oaenUQSGbzZ3IMeG1gxtSxuAaVBbB7HXHEDMd11O+4rs2K08iOu81WabxrE1uTLaLObP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Q60Cklp6/T+1mNpP3E85IzyFSebAgOq7YV0tDJ1IyM=;
 b=c3p4JmtbVdXOtCohAf2t0Rim7NPeLLhcORcvbQ/6UoPVMjoIXuo50BQFNYmh29IW+/mJkCcKlvG2CsP/fj0G/NaTZ0NMiwA2virovGK7fn3QxEl7Iu4BDMIDiOq+jFmAH7NHQq04tb3rlOBjumCN1ny4TuAlTPY2kvcTizbF7X0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6361.namprd10.prod.outlook.com (2603:10b6:806:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 09:03:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 09:03:46 +0000
Date: Fri, 30 May 2025 10:03:44 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>,
        mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
        akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <205f8165-449c-441f-8ee9-58f69d23dbeb@lucifer.local>
References: <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
 <b2dd29b0-aa12-4cb7-9c05-d3a998f7b0da@lucifer.local>
 <172df994-7f24-4fbb-876c-4fab22937177@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172df994-7f24-4fbb-876c-4fab22937177@redhat.com>
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfe7952-2a57-409f-3a5f-08dd9f58e2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?eAwd5tivdw3ZGf/lwYATHD6A/IWsSty72P4FhH+clJGBt2JFJ0SqJnbHVB?=
 =?iso-8859-1?Q?sh8217sV6+Mz0fTczEif3FLWl+DA93X6QrVSbLvH8NylnySc7KHDHovlHX?=
 =?iso-8859-1?Q?wxxHKZk8meAbRMD0Ie79rnu8cHcJB8bdbIJtD+4WoGaq7X5K2f7wodGzPZ?=
 =?iso-8859-1?Q?qXp5yhfbNszKzEO8xlEH1zFk/YnTpysQfGEeEsbjqaPT40aAERTKEw4clC?=
 =?iso-8859-1?Q?BN7lydVjjxz2L09qyZXM9ydtFNe4eoXigjTzIYQ1VNTTA5Rq2icnwzIP01?=
 =?iso-8859-1?Q?VqbaCg9h35xTcVElM7zplKGYum72kQlcIcArnCLz67onsXO7kC7yX+4ZTb?=
 =?iso-8859-1?Q?IxVesKL/8Vem72d16MO3AytdZ8tRzWZB+VY+nItgrfapI7IsaIYzQ+wlEJ?=
 =?iso-8859-1?Q?4oX8xVYYTiF1fs1xBlfv/KrbhS5npyJpsk6aNvxoPUc7V2Y2QYgKXvonoo?=
 =?iso-8859-1?Q?8+XAE2zWT7pU8Vp/yhxrwbnrjwIbXpxkXpS0wHhQ1OBh1WXryv/gjPPl31?=
 =?iso-8859-1?Q?hKf3EXXcBwLJP4uvOLD7OC19+K2NsO0CHSjdtYTlJNKXc0+ifhsX/DUs7P?=
 =?iso-8859-1?Q?DSBoiBj6vMI0VKSV1eP3Cvc7tqOgSzRuLxWot8rPH0TJmdFA30QjQTesif?=
 =?iso-8859-1?Q?HmTVhA1/CrWMF63oLWfGnqCPnbdWhlXFXrXrlVHtM2Vy9sdL725S4FSynA?=
 =?iso-8859-1?Q?1TvpsdcNgRqGw8gPQf+zmZoX0MI9sD5XJCNc7EVtXSP646t0QAwWU1zcnQ?=
 =?iso-8859-1?Q?znHG7i36pAST3l4NKVfzynVIo0XEFF/odRb5tm2kj7jFiw2rcopxefxPI2?=
 =?iso-8859-1?Q?M7WTnSXoNWxE5fuccFlmaktHfq8M1cFuYkgVaLB9ONKI5UrIVC3zbkXKt9?=
 =?iso-8859-1?Q?3apnMMzdAccGizokbwufL5taHDNgFUylNKRXnBwMRrImdKWTZSIdwlNCir?=
 =?iso-8859-1?Q?j7bV6h5kJ1AW88hROetNCV1EC4YnMamV0umMIge8FC6ssMgRQ2qoMi9BpQ?=
 =?iso-8859-1?Q?XVXHWFKXsVW1+fczwtwDLZ2T8B4XrIadU4fvTQ8y9M5/MGEYBi8oUsdcS1?=
 =?iso-8859-1?Q?BWKOtWd4WHosfbd2cZ3BvrbipG92+dcA3un+Z2F3msqjVSgBP/k+UJXjLz?=
 =?iso-8859-1?Q?JOfs7LOGq1u8RlAzJsr9igmioDHEbUmYRMdUaZpZDLSDIexNdGXzJHRIq9?=
 =?iso-8859-1?Q?bIY8S6GS+fLg/+xfhJcUWG6McGDxj3kaqpvBP8W7OFuj4Pa0KiwmUoQsVp?=
 =?iso-8859-1?Q?TGANtYTQDxYFqbDr0k8NLFJMyT/oCajKu+bwVYDdMjvn4p7ZROPUAwUfHm?=
 =?iso-8859-1?Q?qWjFF54c2axaVVIwMa6IV7+Bc22Lv7GQYuPUtoN7sh3JXyiH7tGJ5V4YYK?=
 =?iso-8859-1?Q?9MXqapJ3BVb0FkJtpTYBQ1mp7SJn3U81vKFG2yOisUsJa25veNVWKtY2vH?=
 =?iso-8859-1?Q?2VJv/2tymgOzRVzGACs7AfPE4RIbVf0Wb1oxitPGp0i0FqBsA4JMapcQ49?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?nE34zQm9NWjT6QAuQuc9vaTTeIhw49huOq36IoXGiqxeEVkpiHOSAyn/ux?=
 =?iso-8859-1?Q?JDW6EpNhYW25NbIMflTQN9GLyLXkj5E719IW2JvBbsAJd97LsK7lfVVgxV?=
 =?iso-8859-1?Q?gmJVHXAvkPFKmepxpTLYWnPzodfPSrloilZPWJ+XVQpfhJOeiP/Z03hDJQ?=
 =?iso-8859-1?Q?r5USZ9tEq/hgYxv2nG7EFGcaL0DnMfbzEgivF7GRQP0Dg8uGxqgViSQfS4?=
 =?iso-8859-1?Q?clXSby34uZ0foEJDjEX49MudgmaCjAsZClW2U6L+832bL69EIjMLaB9k0o?=
 =?iso-8859-1?Q?Ht9PVHJpqX/dPN04LvmpQprw2A80FGW22W/4UHYRXJx/9wL277R31jBO9J?=
 =?iso-8859-1?Q?ZqHegcnOZGqlqyO0wrt2Vplm5L0OlwZQsJnteGNvDgzOoIsgGhfvIYuHD2?=
 =?iso-8859-1?Q?350/lDsMZG1Tl9rRB+SPeDggmoG0oZyMOHBkHEjZbM2cXndAKZGkyj4GpT?=
 =?iso-8859-1?Q?MOdwfUL75zYmy4BPHl1asVkfmAaddk9slsrgcbxfmr/kP4nGM8LBklq0zp?=
 =?iso-8859-1?Q?yf1XmHwJbWVffRPA52yYGMFqpwbAp6NXTNv06tC/SuU2Ukgdy9hrBCiJRV?=
 =?iso-8859-1?Q?XIx6L2z+HN9KXtuTlZyJMue9eZ2292QyiZi+CByIC9HeeA4ENNAAdAuKgC?=
 =?iso-8859-1?Q?JDKMcBFxcaH9tDUauV3VhijYl8YZq36/H6//CqpmDs3CwwjT6q2kkdt5yQ?=
 =?iso-8859-1?Q?x+/U4pYoeTXsSZySjrjuKtdSdmoBp4ORP1lauEwcH/0aAm1I0QPgk2Z+AQ?=
 =?iso-8859-1?Q?WLtUsOnx8vYwP7n1gMJJtuxIKTC+lFXe9w0f7whFocFt74KpK8HnQvgrVE?=
 =?iso-8859-1?Q?I1EcJV6B6gTkVP5eNrRgy37ni7ONHSLWnORdwP4KwZ6pIjrqj48VlPLoB+?=
 =?iso-8859-1?Q?URZeq+X3ZyKt4vDiF4WjxucE/8s8E4fDN5gznzd3Fag/72HBIsaQi4tG52?=
 =?iso-8859-1?Q?vKXs15rurGcx0avigdScvZbQcJd5QfUoSFrblqfzNBpBk6uAo6SeMOcQ3Z?=
 =?iso-8859-1?Q?j4pb3NEoBg9oZY6Ef6dwSRZdqeKTo/sJqpKoCVrtpH+AOeGIsX4MI8e0dt?=
 =?iso-8859-1?Q?zM4fHn55bWMNDYvMhHf5WQh5KE2gkhnZSm2NhLTdvPTm3l7ED/EeDqRMZu?=
 =?iso-8859-1?Q?TrSbru5/WG9aF70zMMegCyrH08CG/PAvCBjVt9bBMoS8f7xHq7hNxQOffK?=
 =?iso-8859-1?Q?c0IC4Yge5HMwjPyy62NTAhEI+4wciCE2GWpCpi//acfENSSwGkelmhOxsH?=
 =?iso-8859-1?Q?FZkSGuc8D5ZiBqdImEnylM1nA8Avi34qi0nD/yIKavb25A6xyp6Lbhmp5X?=
 =?iso-8859-1?Q?5U8xwZ+ccPV+LO75UGKx8WjNr+c7didmGLkiM8S6kWS9jN6KM7XplqoPO5?=
 =?iso-8859-1?Q?0MP0Qu2AsGymoD3j4grOVymNkPeC58twyWu8eYYBpMs57WxQyMvyOIb9PQ?=
 =?iso-8859-1?Q?4sFhLJVoDo0NC9cb2QOGFC2igPwnGnP/QJ6GAe8CHOs9WqsmkvOZaWBIrM?=
 =?iso-8859-1?Q?I+3V/ISNnSdgISdlJFJsQUYnG8t3gaAe3R6la1okxZLoiwuWs9L8f7yYZW?=
 =?iso-8859-1?Q?3OiFHGvAfG1vyqNdPg17StuyBEgNGvyi4EOMivSUD46gBLSwvEQcaypnt0?=
 =?iso-8859-1?Q?2Qou28BzCjIx/2K/kGnyBlPwr5cs/r49PHlOkHWec5u5DMIjNcFg6YrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+ddTqyvYoyWdjIrX58v4sKMWltnQUdYKyfXI/8Lzot5Vs4cdJIO31N/1j5W8WUfLB490DOmSlT1khH9/leN8kHxqp92ibwyPAyfJSaSdFEwA8FJWX0woOsYFy2CedXwMKlazGRyYPhtNLdl7FEJREMaGEGGfnmk+GA1aPDCljN+2tGVp5AEgGsxg8HxoE4bFYKsxAEbVp4IeHm446B9pnAOQRhi9Bp9MFwobu/eUkVPBKP4ICvYfqNDSgOv0bsz9Ppu2BTcJ27yjvfifSKryBX9OQmiUR67QDnaoXzAWUqBMafS98dg4MlPlIuUAR1XIDcDcpBYrDScQ0hgahAWCwm4OoEWAMCSX0NZ0SePl0xzXupcK+oVkrmAAKRWCIW9F6Qu/+o8BK+EvzpMONjZknM/JiusK9LwkKjsioxDej+2iPyCVPzvWwGGYANJjsLKcIfGSC2n7HSZnr2QzMapf7zoPY4NmgP/KYQ0cwOw8DaF/Qyd3RB773CZ7Ml3Ym+B/TpEaSOwr8BJLvEVgg598KOHF9HfOHjVN/J14TnAkU5r/9JGbxVpidPP4vPRx2CyYyMY/uJlU96Ob+8gY9MvTlKWcV/2d2PwBB5LmEYRuq8M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfe7952-2a57-409f-3a5f-08dd9f58e2b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 09:03:46.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fcPxWegZe596AGrgH+/28pRVHPK8vkn9p4zQGQCeBfDT/U70Cg2nfqk1gjo96HuNjtPDkizlIGssetJCZWptRP/tufc7zHZsjhMJdKYjek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300076
X-Proofpoint-GUID: Jce1fhaMxWJONRmXOfRbWabRsScpALEo
X-Proofpoint-ORIG-GUID: Jce1fhaMxWJONRmXOfRbWabRsScpALEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA3NiBTYWx0ZWRfXyGG7xmvUPNBj JLsFOrLj88RXHkIgTSIZIZB4Gg6IdMSwZv2R0jxgd3LL8jczjzwxQQbaCQ0H2L64FcgMZq9BMGD x+kzqsdjkbQXCTCIIxCz5DRfeO4bctGQyNTG/w5WMXBlwDl7koCRk9DtfSQPhEJdP+uctKZzeJu
 VhPGPWO/yCEBiIvNtEZGT8Y9Yz69Lpy8u6/9139IesmsqUV/R7QZc+r+ZgFxsEbtltW/QOQSOHP WOM7zUpZ9eWYgBgjj5I/BvwKt27ELMS1UBvBoeY6Dl8T/xlnjvIcLVOh3uuNOAH38JC7u3w7NVP on1BHF+7oKzLhijntutL/6BY4bNVawSR+Q5YhKZzF3jtMUr94c5xPH/ckUZcRdUjGztQkYuHuJO
 bZ8QUD/GpnMI4JWaNbz66/dTdOKW+hdCX0mIJ3O9NPINx4Nh6zv4opjyfBdWocLzEt5Rr5ld
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=68397476 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Yy3iyKY8KCAegk6HaBYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Fri, May 30, 2025 at 10:50:25AM +0200, David Hildenbrand wrote:
> On 30.05.25 10:41, Lorenzo Stoakes wrote:
> > On Fri, May 30, 2025 at 10:33:16AM +0200, David Hildenbrand wrote:
> > > On 29.05.25 18:07, Pu Lehui wrote:
> > > >
> > > > On 2025/5/28 17:03, David Hildenbrand wrote:
> > > > > On 27.05.25 15:38, Pu Lehui wrote:
> > > > > > Hi David,
> > > > > >
> > > > > > On 2025/5/27 2:46, David Hildenbrand wrote:
> > > > > > > On 26.05.25 17:48, Oleg Nesterov wrote:
> > > > > > > > Hi Lehui,
> > > > > > > >
> > > > > > > > As I said, I don't understand mm/, so can't comment, but...
> > > > > > > >
> > > > > > > > On 05/26, Pu Lehui wrote:
> > > > > > > > >
> > > > > > > > > To make things simpler, perhaps we could try post-processing, that is:
> > > > > > > > >
> > > > > > > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > > > > > > index 83e359754961..46a757fd26dc 100644
> > > > > > > > > --- a/mm/mremap.c
> > > > > > > > > +++ b/mm/mremap.c
> > > > > > > > > @@ -240,6 +240,11 @@ static int move_ptes(struct
> > > > > > > > > pagetable_move_control
> > > > > > > > > *pmc,
> > > > > > > > >                     if (pte_none(ptep_get(old_pte)))
> > > > > > > > >                             continue;
> > > > > > > > >
> > > > > > > > > +               /* skip move pte when expanded range has uprobe */
> > > > > > > > > +               if (unlikely(pte_present(*new_pte) &&
> > > > > > > > > +                            vma_has_uprobes(pmc->new, new_addr,
> > > > > > > > > new_addr +
> > > > > > > > > PAGE_SIZE)))
> > > > > > > > > +                       continue;
> > > > > > > > > +
> > > > > > > >
> > > > > > > > I was thinking about
> > > > > > > >
> > > > > > > >        WARN_ON(!pte_none(*new_pte))
> > > > > > > >
> > > > > > > > at the start of the main loop.
> > > > > > > >
> > > > > > > > Obviously not to fix the problem, but rather to make it more explicit.
> > > > > > >
> > > > > > > Yeah, WARN_ON_ONCE().
> > > > > > >
> > > > > > > We really should fix the code to not install uprobes into the area we
> > > > > > > are moving.
> > > > > > Alright, so let's try this direction.
> > > > > >
> > > > > > >
> > > > > > > Likely, the correct fix will be to pass the range as well to
> > > > > > > uprobe_mmap(), and passing that range to build_probe_list().
> > > > > >
> > > > > > It will be great. But IIUC, the range we expand to is already included
> > > > > > when entering uprobe_mmap and also build_probe_list.
> > > > >
> > > > > Right, you'd have to communicate that information through all layers
> > > > > (expanded range).
> > > > >
> > > > > As an alternative, maybe we can really call handle_vma_uprobe() after
> > > > > moving the pages.
> > > >
> > > > Hi David,
> > > >
> > > > Not sure if this is possible, but I think it would be appropriate to not
> > > > handle this uprobe_mmap at the source, and maybe we should make it clear
> > > > that new_pte must be NULL when move_ptes, otherwise it should be an
> > > > exception?
> > >
> > > Yeah, we should ay least document that if we find any non-none pte in the
> > > range we are moving to, we have a big problem.

By the way I agree with this.

> > >
> > > I think the main issue is that vma_complete() calls uprobe_mmap() before
> > > moving the page tables over.
> >
> > Well vma_complete() is not _normally_ invoked before moving page tables,
> > it's mremap that's making things strange :)
> >
> > That's why I think my suggested approach of specifically indicating that we
> > want different behaviour for mremap is a reasonable one here, as it special
> > cases things for this case.
> >
> > However...
> >
> > >
> > > If we could defer the uprobe_mmap() call, we might be good.
> > >
> > > The entry point is copy_vma_and_data(), where we call copy_vma() before
> > > move_page_tables().
> > >
> > > copy_vma() should trigger the uprobe_mmap() through vma_merge_new_range().
> > >
> > > I wonder if there might be a clean way to move the uprobe_mmap() out of
> > > vma_complete(). (or at least specify to skip it because it will be done
> > > manually).
> >
> > ...I would also love to see some means of not having to invoke
> > uprobe_mmap() in the VMA code, but I mean _at all_.
> >
> > But that leads into my desire to not do:
> >
> > if (blah blah)
> > 	some_specific_hardcoded_case();
> >
> > I wish we had a better means of hooking stuff like this.
> >
> > However I don't think currently we can reasonably do so, as in all other
> > merge cases we _do_ want to invoke it.
>
> "all other" -- not so sure.
>
> Why would we invoke uprobe when merging VMAs after mprotect, mremap,
> madvise, ordinary mremap where we are not mapping anything new but just ...
> merging VMAs?
>
> Really, we need to invoke uprobe only when adding new VMAs or extending
> existing VMAs -- mapping new file ranges some way.
>
> Or am I missing something important?

Well, this is where my limited knowledge of uprobe comes in.

I'm _assuming_ we must invoke it for merge. I'm happy to consider a refactoring
that applies generally, I'm not happy to see something that changes what merge
code does in non-mremap cases just for mremap.

>
> --
> Cheers,
>
> David / dhildenb
>
