Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0472626
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836042; cv=fail; b=ZHdXq0cc46Nbg2bP5jDZeqFHxFD2hMSKWVbJs+72T3jSAcZa/DSyyFSHr2tqO2xPaH7IUmcudi7ntffpB4FnBueMDwWler9XEHdIJ9MDdPrdZDIWKPN8p6egma3HAQUZZ4X320dSLCIJ6gjywz4K9nA5zsTSo4+4SOOIt/6U16E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836042; c=relaxed/simple;
	bh=z/tG0BpB/5/qMEkBBJ8lzVzGKsVXMAKl8rF7Ti8eYDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HHCF0D5Jz2uC6WJ+kaAFRqOa5cYxFDbJ5C3uQwIxJrU8ANoCMvTHDklOqVZzWMqkQgnV0NY8R2KODf2vQXw7J4j3uyma3DERyz5P8sO1o0Wxp3ihdgk460wdy+4+YwUP/BqtApah6qHY8nsxHRz7S5jaQuxSn59jfrxVPyDXIow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BTR6kSeo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CowIg02W; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BTR6kSeo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CowIg02W"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMid0D018836;
	Wed, 25 Jun 2025 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4KrpQSsnHPH7dYr+lA
	0S88izy4e3AoYeLAon8jWYb70=; b=BTR6kSeoNPhy8vgzIc4v+omWUTlSOZ/mOi
	IVzdrFFKR4M/B/oElCztb79hVmTTR1SoQqL+guyyYzbelQfWIbzhFvcVLMhY590I
	VWvR1FBW8Ut6v4LbiuWx56Bl7KlNWHM4VL90Ip2acJPAnxCgoE38XAbT6FkNS7sz
	QIzd0eKA7JNxzmsA3B7Bf+aKHDqjpfi/DKs+4XDAWP60ye6mlPrtn6wwO1G8nswE
	bHx8h6QWsP8naeCmSKFdoSgJUvI/AdNsBci2ZfSz63t/JLziipGHwkN4eJ+v09H7
	C0jOt4a3/SREJpgZXpQwtE/MoxU3JpcmbovDWqSAkajIhB1Zv1rg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxtm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:20:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5UOT3039936;
	Wed, 25 Jun 2025 07:20:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5pcw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:20:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOVc7kasea/SnSeAJ+ew9UV0FwNXkD206qdnhp6LUwLPJPK5btMLwpfsuiFyc5PdakBSiLh6HkNr/Dls2/c8kBZVcdaIKzV7AWCLOYBXgQNqrMu0NgiOrPGLunAK2WIK/PunhhKoKPl61M/D178XqNLs211fJsvq3C+ttNVronaqO2LaeFI2ivh2E+24iDUFKpWkGl74jBSzAuSVeA9e1flKA/RH290oDp1zLEmBdT0oCKxVj7T3G1Co/ZZ6JedLaEvcyIFssZDwZoE90k3DW7vAYH7A6gUTyjjlFM5mQ//nE8j8X9mKVeYVHsjosZTyQBivrSEqOFaUjZVHW8Sz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KrpQSsnHPH7dYr+lA0S88izy4e3AoYeLAon8jWYb70=;
 b=lDOss/KOu4Fd7AANFGqKyLSsf2Lj96y6Lt6yMVFO4miMXKGvXwQNiJ+b7dt95TibKF38Fka+qkeb3Z2+5/D/fXWzh0h66/y7M4liyRIv1V/GM2XbGpMkKoC6JWzrLOruGUbZNNALjXl3WI7Zez5BMQgnM/7Ame++TKtS3HQHZXraWdMNepc9II+EnN0rJVYwl9P5njarVXzY03BmeR7d4XA1APUCGkC6EzAxo9mbQNFxyhZDdwIxeca8Agah0bln2b0B+MSfgSQ/ygdZ4sNiuvvSJlnrsLgNkXElTiXD8ewYD98cq9IQrOQfvaU74+tD5BGj8tmkeX0RFlYTUoLwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KrpQSsnHPH7dYr+lA0S88izy4e3AoYeLAon8jWYb70=;
 b=CowIg02WBNln17q0s1pcwJPuntRaWeBh4aDfhxITO9j3LgJwMRNvHbqw2bWUV5uAk7udh5ldXTAjHziCvt3ba1hz+ISshczMVX4dL9rIjFutCccC94LWZYhFwCW/ueze6yLXy4Pn2Z+CD10bvUO5PPGeUk72zzH6a1eFWQzIdZs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB8217.namprd10.prod.outlook.com (2603:10b6:8:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 07:20:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:20:17 +0000
Date: Wed, 25 Jun 2025 08:20:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        david@redhat.com, ziy@nvidia.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, zokeefe@google.com, shy828301@gmail.com,
        usamaarif642@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3689a71c-b7a6-4b1a-625e-08ddb3b8bc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nmEbGqiiSbKmySY1K8RPfv7cHti2HUlJ9y6s2qTmexnCH0+XoRQMZpukb2Yu?=
 =?us-ascii?Q?MizLlQP4ZJ1jxRTjkXM4GoFV1cVw+6SGPtuFAe9e49B3lu/iXIvEHRUXYk2M?=
 =?us-ascii?Q?22bKHKK38Xxpyr6D2MYGApvDYwL92OMj9SChizKxx2BLM/JymUdJ3wY2gdCD?=
 =?us-ascii?Q?rNtwptf7BUd9dRSNoZhh27hpytmvDHV7eFLkn1T8byn+XKMa3PTQOWmgp2nB?=
 =?us-ascii?Q?x04HnSxZVvU7KY1L21JqW/Vj55jTov6eKaOCtds/JHyNiGUhmoaZAzkE+rJT?=
 =?us-ascii?Q?oeIFDjTCng9wthCGkrbXYhLZ9PGjNeok1P2MkXLrPMtqr6h/tBRG83Jj4Ln3?=
 =?us-ascii?Q?L1pZPQEq1yyvvGQjg6ZrzxLu2YJsazJRl/9akuQS7937gAWfKwnJxRJ2divY?=
 =?us-ascii?Q?BMdOYwomM7hYL7sWn4KmgiKz34+F4dr1paYOyU4HEvWGas0Ihw+Mz4Ifkn7j?=
 =?us-ascii?Q?JCXqDBoPsH/Hd+foRrx4pMubfxKOTiw0c0FrQxcgcOe9dL3Dbb0M7U1whsRt?=
 =?us-ascii?Q?fWb47uBl1q771181Yr5v6x+/narWW9C2E/UThAyQ00lHx3MwN7bDVIEPhe96?=
 =?us-ascii?Q?nqiLX5R6m6b76AjPcxNT/DH+xVkFOsGToNvKm49M/LvP1OSvqzT8nT9VfEr9?=
 =?us-ascii?Q?B/TfhXIMv4A4vdq3o99Y+oWhf6fWxZw43efWTUlll/M770LbiPCcgypt3ytM?=
 =?us-ascii?Q?E1dc1oyd2LpfLST4Fvd/yixPdmQT95du2C92WBXE6xIZSTza9wpD2oiYb2Dg?=
 =?us-ascii?Q?0Tk7zoS1HjJdHe+vPa0e4mrGUt1k2XnheTaPLm/OggeVPiKQOwd090aWmZ0q?=
 =?us-ascii?Q?icTXSaGPxhgYEa6nshr0za2UlmYXGfsfHz0yvigmFZqYpISXx5XHBZrt0KY0?=
 =?us-ascii?Q?jEUqq7bU0Q8O76H/kxkgDWKmEbKNWKmj5ogJKEnWwIL2cOUR0shWCgkQMsrQ?=
 =?us-ascii?Q?hbeBccc5TpmnUbtI0N+fY/T005EhMM0ZinBIMscZMvYzqzoD6QEAywKyh06D?=
 =?us-ascii?Q?w1nkK9PNRQV3wLc0F35FiiEb42k7w8yfilxO5IE3EFtA05sXOIdH72PbBQnk?=
 =?us-ascii?Q?Nc9iNs7MzSlknoDDUMv9MpbNL9H9ISRU19p2FNa7ELFXTeHxGbRYiYEOGmOk?=
 =?us-ascii?Q?m8L1H/bsz+2Yl4aXhEWkrU6nFrDI3Xu+D2HJ04PBJ3zLbW2/3LjV+64WkfcL?=
 =?us-ascii?Q?/iQXRDMCcIvYpoG1mUVL96F+0z5T10gwnu2o6mxR8Tf9dgGaAugocITbxOSL?=
 =?us-ascii?Q?vy+Ol4HazDKN/DxPepj1EZfAK3HEX7m0JmDD29H3ewm2f0mh0p2ZjoDV7qsY?=
 =?us-ascii?Q?n9gmpWzAfg68CeCntgGVusxZ1umiqNyDZ6G8hElADvKe07XDmURTHidMZuvt?=
 =?us-ascii?Q?I2NC9YfwnPNPhqYyA6VMjZ9bLvbK8T0a6TwHyEY81iU9OgOc58Al7xcd8uby?=
 =?us-ascii?Q?ePvhFFgeQbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rchhGJZPzMcg9NNDWD9bduC9fMSW3JsoGHgLVlJiDMkFz16N93gCsEZ3lOa9?=
 =?us-ascii?Q?nsC8WMjxR6Kx8hbQlCiS8u4vYWtkB/v+0Rm7K6G9PIuO9Ve/Qn6kV3vEuaMo?=
 =?us-ascii?Q?9CpMQf/SuoXwyDjhcedMiHSE1NY/E/goaJtDUmgFvcOELdL6Uvx+zNT+WBbw?=
 =?us-ascii?Q?U6cF4ZbqcQJEMTt25PDNRf9BQMhow33zDsBrKbD79WH89gubaTY4fMNVsjis?=
 =?us-ascii?Q?LGmplIj1W1+5Fz2YDErimoXgjlLtgZPsP/NXtcJgzvtlxm6bIefJluwr1/Ib?=
 =?us-ascii?Q?gTNmb9y7ZovFw6cH/XWtPMuaqYB36Vx90yntrL56LinnY+jx8gofR43PAwbJ?=
 =?us-ascii?Q?TJQKvC326H0I/caApUMTsazvXQ18O4F0NN3kB5mmajjbfg+5r9Z6e8Rgf9hN?=
 =?us-ascii?Q?HCaZttHzvUKwyCv11FCHtehxjEgpp7iyjgG6YyaopQ7iPnsjVi6MeX1UBM28?=
 =?us-ascii?Q?NOjHXqa/FwRZ+V6s/bM+u1oG6QW3TGRwLOiivypCnp6ra04Ko2XotKt5xruJ?=
 =?us-ascii?Q?3yLXxjrywlYfyzZSeECLSmsa+DcQ+iDlVhlR3D27ga+QzttsrroHZvpS+d58?=
 =?us-ascii?Q?8U/+meMDhyryvN/Rk9oeZMiqyNensgG/XmapFz0Ghq3MURbxrW1LPtMqFf3w?=
 =?us-ascii?Q?iP2ujnxTpWADIuNLa3WfgLiT5wBqHAMdKJtcmfsytW7IiJJMKyQDm5hG+puC?=
 =?us-ascii?Q?4iXYXYI3dwMIqfXBmKqFcDHYGLLMXo+A8+hzSs5ntiZsvPyjv6i335Ms8mhG?=
 =?us-ascii?Q?4H/ieI71eMiBp2mIdUq4rrE2lOx6Yo3ASQKEUQvXBMqkb9QOybgSePPvVNrx?=
 =?us-ascii?Q?yJsiRw5eTwep0uQeBE6DBnjKs+QZ7ywLWX46SH2DCvIQTIZ+UfoWQjp5oMCk?=
 =?us-ascii?Q?yQ0q9nM9b0BMpXGDyJNtHpojYhqFiG8ScqzrtxaXqbFZjjJBefSSWXVeeGW8?=
 =?us-ascii?Q?uhIUAZa6n+S6SbG8YL7kkLHpZd7/80AyoqtmunZOrCW2H9n3S0yi0BwmFhmB?=
 =?us-ascii?Q?++L87CjH1kOFRsHd2o0aR+lPnjoG1FUSx7zbO3mPjecYabkNU5fymgiDtVxP?=
 =?us-ascii?Q?MvSHSJIEeaSsgNUXweg7+pdc1PRMnC9MSqpYwjtebEKpCT44zV5J5Hg3hYGs?=
 =?us-ascii?Q?4WOzRja6pgFNQyZILq7SoqpwPqNtMXK6A3WkfxyOcuvAQVi7aa+jIfey3mNt?=
 =?us-ascii?Q?TMSH6kI9wOFiMkBErlN6Pn4tkfwqeCqBfbS34hn52siaaSTGfSsmlQ0Dx40b?=
 =?us-ascii?Q?7O026HPtwJBFUOld67cShQ/DUwOefyprCi0CA6gVIq9pbxYpgZ3y6b0RUZu1?=
 =?us-ascii?Q?nka7NWQAWH4eA16WMOkj6mHPzpoedY+qyAc7EJ9l6AwRAnZwF9s+SnXnDLmr?=
 =?us-ascii?Q?AVCUHZbW54Alu4wkvl0VkUW9GgiVCXGNyNDi34HjYXliSoC7xTkoboLfRqLw?=
 =?us-ascii?Q?+U6RH8hUsP2FWW1X1gwZXv0fdCh6XdtemSoh9XubyBhfziHAxkoRKjfOkJcu?=
 =?us-ascii?Q?F1BUnfjTa6hEhST9LhbfPpIZveTKjLU99yYVootMnELdrUuq4CFpUpLjSKrS?=
 =?us-ascii?Q?xP62QQzUusjFpLxT7M41c8ege2+iRCoc/WE51FPshYXp9hlk667MsuWj6VWJ?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mm+COuH4avWyXZXO6aRl7NBRe99YjRdJdjrNEH4Lus3NLFhA2KtJdSTNyAnVQBoM9MzVe0OTlpzIYNiIcJPAIMElBqrQZuqtv9EW0JUMWSBbBS7Zhw+OoeWBd2/k9azfMkusCXiBgG3vkvAKGwVBhgIObM23BSbsrzDLw40AgvCowlR77VtiRfyEZWqvKnefjMYbgwDNaLHiMg1S2RKnMlqIR+kWl7xVTRvF+MD/yXEL9s4DBBFb0gyxZoE6Wp/3tW9mSTuTIIuDH6XUFkXrhaJvyVk6htHz5BdNYvYcMh9KxEuo51yuMWtkxWS1EuuOaGpCwyppqaoSt+L2Y2ugJQ9NdaVuiSGT39TIy6C6IUQ/sjV33Xh5lVM+FZ36DZxff5Re0ym3jp/UURK8oKjfV7OUerkW1b07khY9OVkPKvECVA2HgdK273cQjrOrvXBiX7tpaJjbWAAeDoaOGPZXsELxQ13q14Gso1/M8DKL9meq2grOx9kxe7N/7Drsx3rYmwibhR5vnOErTeRtAGG2nCXz5kVTsA2nCrwyyJP3J6obc720JqjMMzRrU2oVt1v/iV5pVnh2pX6WAiyl1JDmVsBHS4crQ3IXh+OVPgARKP8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3689a71c-b7a6-4b1a-625e-08ddb3b8bc52
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:20:17.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHf6clCGBb20RvpKH625d/tTnfoNLRuRwVuc/ctFxrgPGxqwsZo2oNmFX8boUbVv/ZdeABaNOlRuobTEdppgbtHgWetbGz98CXqSJ0L90h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250053
X-Proofpoint-GUID: dZkPUQoWP9KzjzXrip2x_5QZtynJvXlo
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685ba335 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=cGEsiFLpUp03pL3Tm84A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: dZkPUQoWP9KzjzXrip2x_5QZtynJvXlo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfXxn8ITJdyjdrK wpYERWQatjb33sHZsgJxfSQBSrVESayKwvnr++T4hYhTKGYhkyS9VC/yGqGta8e2tsMVEtY66bR 7bOkfZhSJq13/wqAMl+4Pgf3qPOI26swn+5Tb/gF08dqbdQbuZA1hR6dHdfnjSxQX9IrpINQ6tX
 iCdVIeMF/HvKA1GiC8BTvexiq1k6FXXiDV/COfiW8gtUFudNfb2LzJ4AF13eIToJpHn9G3JJ7Q1 hVUF5VepPw2LdGT59f1VajKPUYhzL7/V9+lJt5TV8yUw2k4yPlL/89Htn1xTa8Wxj0J/XOUVH2y lwpJW0d8zZOvyrfA9+16Bct6eZrv7XSKEWGuKUOnCFnzhkseNzC048rtziZ6rAv9BLHiVsl8uHZ
 4NcJMaiyS2f8gahAR4mh0lL0z0vFRAnd/ARI8LqNBiruZc+y2ibS/fQDwq8JaBvzO90vEecF

On Tue, Jun 24, 2025 at 10:53:28PM -0700, Hugh Dickins wrote:
> On Wed, 25 Jun 2025, Baolin Wang wrote:
> Sorry for chiming in so late, after so much effort: but I beg you,
> please drop these.
>
> I did not want to get into a fight, and had been hoping a voice of
> reason would come from others, before I got around to responding.

There'll be no fighting :>)

I for one (and I'm absolutely confident others in this thread) very much
respect your opinion - so some civil disagreement is perfectly natural and
healthy.

This is how we get the best outcomes...

>
> And indeed Ryan understood correctly at the start; and he, Usama
> and Barry, perhaps others I've missed, have raised appropriate
> concerns but not prevailed.
>
> If we're sloganeering, I much prefer "never break userspace" to
> "never means never", attractive though that over-simplification is.

It would have been useful to have this discussion earlier indeed... :)

I disagree we're breaking userspace. See below.

>
> Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
> in its 6.1 commits and in the "man 2 madvise" page: which are
> explicit about MADV_COLLAPSE providing a way to get THPs where the
> sysfs setting governing automatic behaviour does not insert them.

I disagree, I feel like the unfortunately poorly named 'never' toggle in
sysfs makes everything uncertain.

One can easily read 'is independent of any sysfs setting...  both in terms
of determining THP eligibility, and allocation semantics' as meaning that
it ignores things such as madvise vs. inherit etc. But it's not clear that
it means you ignore 'never' - yes a very poorly chosen name.

I think a reasonable person would interpret 'never' to mean literally
'never'.

But if we go further, note that the man page points to the
Documentation/admin-guide/mm/transhuge.rst document which states:

	Global THP controls
	-------------------

	Transparent Hugepage Support for anonymous memory can be entirely
	disabled (mostly for debugging purposes)...

"Entirely disabled".

So I disagree that 'seldom has feature been so thoroughly documented', I
mean in a sense - yes! But also unfortunately, and unintentionally,
vaguely.

This really does come down to some poor choices made early as to wording
and names.

But I'd argue that as a result of this, absolutely the expectation of
system administrators is that never means never.

So we're sort of arguing de jure vs de facto here.

>
> We would all prefer a less messy world of THP tunables.  I certainly
> find plenty to dislike there too; and wish that a less assertive name
> than "never" had been chosen originally for the default off position.
>
> But please don't break the accepted and documented behaviour of
> MADV_COLLAPSE now.

Again see above, I absolutely disagree this is documented _clearly_. And
that's the underlying issue here.

I feel like if you polled 100 system administrators (assuming they knew
about THP) as to how you globally disable THP, probably all 100 would say
you do it via:

# echo never > /sys/kernel/mm/transparent_hugepage/enabled

So shouldn't 'never break userspace' be based on practical reality rather
than a theorised interpretation of documents that sadly are not clear
enough?

>
> If you want to exclude all possibility of THPs, then please use the
> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
> who insisted that be respected by MADV_COLLAPSE back then).

While it's useful to have this, prctl() is where APIs go to die. It's a
hidden wasteland that nobody knows about, it may as well not exist.

We have a whole sysctl directory for configuring this stuff. It's sort of
crazy to have that then to have a special prctl() hidden away also...

>
> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
> if you like.  (But in these days of filesystem large folios, adding
> new protections against them seems a few years late.)

Based on a reasonable interpretation of 'never' I would say we retain this
series as-is, and 'deny' could be what 'never' was intended to be before.

>
> If Andrew decides that these patches should go in, then I'll have to
> scrutinize them more carefully than I've done so far: but currently
> I'm hoping to avoid that.

Sure and that'd be hugely appreciated!

>
> Hugh

Thanks for your feedback, it's much appreciated! I hope we can figure this
out sensibly.

Also note Baolin's point about mTHP which rather complicates matters.

I think we all feel the THP interfaces are... not perfectly ideal.

/sys/kernel/mm/transparent_hugepage_2 anyone? :P

Cheers, Lorenzo
