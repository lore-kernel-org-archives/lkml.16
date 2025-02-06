Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DE9A2D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873841; cv=fail; b=Z3YlBHPBmp9t/SCwFdcen4FYgUoHjLaEDLMRq5lg5Pvf3I+nxF3BeeXd11pwDcm0PrKIRoWaXWWfd8tsCIOX7o2xixknDNQdKbD2KSHY+kh9Gwf6I9bccp28ZsYbltaaLfcBFdhOXIQNHXx4xa6A2BJiR5n3qFYNjTgk/pozuGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873841; c=relaxed/simple;
	bh=ZM2mQmDKENUs2fCS+UdHa3PfZC8YMPKvixsNTJ4ffYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J3ZPe/b5Huzj7dzvffITEojsI+8iyh6r29mheW0s6czorvKzGBL9vsGUKw76G7Sp5PX+TkaT1ICdkXOoS1EHBEQFEP3K13BGp5R4O+CmP4hwyONBrjkulXR0GYlkTmM9CzrclPi6jjcaakkZf97NGfDLwAvzrm1VNCfLw58KQvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d5CuxgiS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mVHSLJmy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d5CuxgiS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mVHSLJmy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516JfvJC004614;
	Thu, 6 Feb 2025 20:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=JyujLlhr8jX6XP+X2g
	+jT/DM+2rslcr47n7VsScPp84=; b=d5CuxgiSpErwn5J51/P32OV+9Yy/wI3Ai5
	9GLjiYzi33ECl3kqiI//wgimdgDBCagbz2Aq9u9xMyQJ2wwCdH1eZgW8VzGI71gw
	ougjVifcGNvVhOUcB+V5iv4k1G2kbM5WmWR0ed6QFfqp7YgtzQ7+bTXncYSY3Fer
	8y6jp9KTddnEof/y39dwxAtsO7D5cTBams5yz/zhyQbzHsXDl3MOYsvKcO3agQ3t
	69w5Hg+EZZ+1eCT/mdbM350isC9iuv91B4+KxGRA88MlCiFc+ikl/3qxIMf74+iw
	RDTVccQNZp4EaxDviXULW9GjdQ4hCrsw5j/F+UkiEANq4jumltkA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58ckh9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:30:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516Itmaw028162;
	Thu, 6 Feb 2025 20:30:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p6cnfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6luXZhyYYhTincP0x5UXqaTjvz6pyxSH8GxxZNDXfBo9PixnjBYHEWMFQ6FSxfp8vt6CxGGIbyyVu3MK+rTq12F64xk6L9Rqh5KGIyinfVKibEcYgoTMSwjhmNNRf1bfdBcfTqsfJ/YM/Iq0rOc7gfucpMRe/jMQOogxFLvyQnF8NGd0RqBzzqPtBQXb4Tm7baCE4fBhbj+IopC1yG5b8QbdgkXSjfq3BxIl06cizlsAqXpQasmhB7Ay0/e+k7UjnODRXbLXB6ArCkWPcFMloewZv9CNm2m6QSBgdJ+A6yWdpMgwJir69G5PlPsLKonfpZSX5sqNluGtl3Sxi0RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyujLlhr8jX6XP+X2g+jT/DM+2rslcr47n7VsScPp84=;
 b=XS9ldVmz9KFe160Y8KwLtuANcAJFzKaQeptdUhHd3QPajV3me5RyTp8qazYoJFSGUhTCoynEt9bbt8xaoqAtpE/xxyKKimBwX8hoi4lA92bl1zMjrFaroU95+WndbXpKPxuvpfSsxuCBsmwXMYkd3O/7vPePomm7bkyY0RADb6x+2NCDU5DdxzewT7mfjAkje/NMHVlHvojQtaUsaf4RVGVcc5LXuEUxzOvKsF2nEVXMY3gXNBprNDG27m21XsBdSuj8yJHrubeiX5RXSWu1KIryL4HItu6EYelDpmIBGjDv/izD0PZfMkyTNBC2I2TeQIkhLAyJRtwGcSyxBn+rSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyujLlhr8jX6XP+X2g+jT/DM+2rslcr47n7VsScPp84=;
 b=mVHSLJmyOMy5cQRg+Zaq4HkGpCF4DcXLmIN1bU7KDRSBrcSIVuoO4h5E45EpK9Eue37RR52DxmnZX7Wfg5W1opfWDfENdaV8FMdyXGsKZ2f+dPrdTTCTxcBkpQIB/CBTqMCBxpb8Fta4Q2JpHHiEAgfzVqpd5C8ksVk637ORLII=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB6988.namprd10.prod.outlook.com (2603:10b6:510:27d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.27; Thu, 6 Feb
 2025 20:30:18 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 20:30:18 +0000
Date: Thu, 6 Feb 2025 15:30:15 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 3/4] mm/madvise: split out madvise() behavior execution
Message-ID: <lvatr5ha5xekeqr7j6evg6lacr7kb2j7jwhsfvgq5u3wgknvhz@32tlhxkx45qg>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-4-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-4-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::32) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: fadc48a8-56a9-485f-b598-08dd46ed123f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P/3QDdO3cwH+btVDtQ6iqi+9jg7DKbacMngdkZjzFAPH4c8wO5Ds6tMmdsHF?=
 =?us-ascii?Q?s66WSwYGV0WGk667V/2GamJJ1MDwl2zwT7HR3iiKz0bdgKPQ7aFzZV7icrlP?=
 =?us-ascii?Q?8gJzArSdSaz6GvpEhW7+Lobf/qza/eBpHcX3q2ScpfsMfJob4aacPLxatsr5?=
 =?us-ascii?Q?QPIfw3s/+ld9szu8+5sO0A1EoeEGx5vfioPSn6U3KXQg63e37YLQj7PW6C/o?=
 =?us-ascii?Q?HUmS0wNCFRe/vdWZxIlkEsrMixmR7WzbGrXhSNFYAUsreTkdtjL5Xqht6Fvo?=
 =?us-ascii?Q?90GwXa/aMBS3D+HDGOfZ4OE7rew71cjJd5hswwMLQcE3baGwyH2JDcvjVRW5?=
 =?us-ascii?Q?8N+HCxbh469G6B+vU3c8o1A87OhVMoZbCpbTsSzdZjRLMf9HGetio+2UoLeS?=
 =?us-ascii?Q?juLR727P2M6hmNUthrjjqDwE8OT+FfhkXlBByG/wasRVdKqGHoTTY/DYbQGW?=
 =?us-ascii?Q?FjC3Y3KtbBokzrpHjJcbGSA4BTtKnABz2XmJmTq3JXCA7JLCBI5fZ+LTcn7L?=
 =?us-ascii?Q?+4drJjXHqnVDqQewKoT/9KZGUydy3BGTQ5hCFezgU59NIO/ojeGH766tMZoD?=
 =?us-ascii?Q?UJY6qcpeQQZXemuAXCL+RwstFK2FH4FOClsud8MDeynZP85V1bDS4rL/ZI5p?=
 =?us-ascii?Q?5evfLlBQTqbbSDxCUq9nNCPeh2FQ4fkZ3epWNQRutfyGvG85d0RcIBhtCkWN?=
 =?us-ascii?Q?pwQ4sCovfj+E16pt2agfk/EIvAhEvYRLGrtvBSfC29SJ8IPh9EGHK5kWzPF8?=
 =?us-ascii?Q?PXInwdYTn+y25uSEB5ZPBgNh+kifi06tNGKqUeUq/rBFe6ulIgZhZcJbzJei?=
 =?us-ascii?Q?YGJPGFf7HmJISkP0ya2msYObE7vnGRfwIlAAaeCpyz/pWAGYGET4Fwy+Lhv1?=
 =?us-ascii?Q?8v5AIVrHg0bETUueGMMOk0liM2/RtFmgVoV73aHm8JnnHovldGEAvBtGZCc4?=
 =?us-ascii?Q?KvExyHxAYW8ipVNafcLtphmQtlCM5otOzzMdHYSu7pNfyDMg9tPuVTSY8fhL?=
 =?us-ascii?Q?WozpJz2bdlqNjyTuH7eXpN99uI9OaBKcX4kiHUSdB+NmyMUvZUFB/hvfqAXn?=
 =?us-ascii?Q?XHwamz1M4bjKKKqiHYQE1ayVrO1pZcjaiHBeTgP7CIj3pZQiMTh+KZQIJxSH?=
 =?us-ascii?Q?K7HUknrMsWdgWnZHMXux9ZiOzYXrcelFQqFF07jlqnZhAYCxbDtSFMv2vcTV?=
 =?us-ascii?Q?tmzXmt/r+nUEVagg+b9GaSPQw+LlBl7bzaJi/5G2pL807pHQzQTzwV/UjZxF?=
 =?us-ascii?Q?M9RB0emCUa/H7fYEByFUZVyX1y8vx/pdJf4PGv5vPeeDqTb5EYGaRJb8LtVL?=
 =?us-ascii?Q?L0KN4NGE5Hfqbj3wiNuwgoUEKc3LOmUifTkDRlRUY2hf/Vu+fJs89HVDyjN3?=
 =?us-ascii?Q?Vnk4yf35kO/Jp+zEU6AjYRJ6z/Ia?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VkhNxKcfs00vjC1u+T6qrugTJAVwbzI3VASR114QZzsiYht+ry2RWjKL6r4d?=
 =?us-ascii?Q?7qBnXrvCNFIcJ882kZtoglW/Ys+KwsSLoHQNJTEnzNz1WxXRYrQuSZhXCsg7?=
 =?us-ascii?Q?Llrg3iMMbuco5bJJkhwOPWwXVg9wSsjXVN4MiYyTNwP5CGcgxxffmesZTSue?=
 =?us-ascii?Q?Y/1rN9Qlj1w19ra3Jnpv4CbzKtE7dQInJnrkev3qtONZd0ZyXznbjhrJ7l9Z?=
 =?us-ascii?Q?1zuMZtTfQTQeTNeTR7ovRCueeVcaJ+2jLaGTQxj8HWr/OBJJXezvTXM8ma/6?=
 =?us-ascii?Q?B7gGNjRRm2zS2XRiq7olAOImhzMeRko1F435PVEh4pbZe5sViSeFuvyAwhvk?=
 =?us-ascii?Q?3Ns2g6rTZuEUJC048CEw7nqsR5KLnaytFwyw0GRoLyUq+dlPRBydTmhKjvCR?=
 =?us-ascii?Q?xNMMcj5MriRqRc3wAANzeBlHewg1H0yeAb1QVvI3rO75+/q6oVS8azy/HY0J?=
 =?us-ascii?Q?8mTZTBeIbgpsj1XRqz4JZAZCLouSzi8osWKmlX4fqRKmGKxZGCD6tlUofV7L?=
 =?us-ascii?Q?ASDXu6nkjdhcc2EEdCAazuQ+vve72Zu7o5VCL1/KA73+s673nr97k61A2wiu?=
 =?us-ascii?Q?iFnEBgG9Z7FX+9o//oRWenTFpUJPtDzg4jE1DIdp6oBEdTfVsdDJafIWiy/W?=
 =?us-ascii?Q?QXsVRRUxb1fyVdPHRfhqunTXQJiMkz0Ky2xchFdtGn8OYAF+0E4LoRqozaVx?=
 =?us-ascii?Q?NBhOmJbFSafTkFx/yK4g/Hl1W09UPeiUO6Tn9qOtyYXl/SSA2Bvzl4wxJkJD?=
 =?us-ascii?Q?Ykn3z2jM7Us/RzN6a8kdOXVrjd/5l8i/8ejH+NMreofeXjp5mYAWbWtJRs9d?=
 =?us-ascii?Q?m0fecY8ZcXKw4qCan3wPWb5k/fepZDBdrTNe3TpbuiCxYmrW+PqzRXQBGZvn?=
 =?us-ascii?Q?BaTLzZMWga8vupwkxN4DZ1HlPRCRqpXMcxXvi7oYdMSr9XyOkjshIwVJvSm3?=
 =?us-ascii?Q?N0hvNDwl8ZbPSg3f8dz5InoEXMYkpMcD6V+/FO6BPisQfY2Toe89gee+rpt5?=
 =?us-ascii?Q?Jt96vgbvprs9ajuSOw5B7wnb6Civ0wUDdyyYFgR4/526iYghNEqDMLIC4NEU?=
 =?us-ascii?Q?asrGTiQKE7hSdl6YpbljeuQtUkKszT0UvrhMrPbXwfS4jDGyXorssUYvDorm?=
 =?us-ascii?Q?Pv11BmZHCcp/vC15gv3vJn+KCsV0H+bW1Vit+iWn7glsmkKKWoLZ5mI4Z9CP?=
 =?us-ascii?Q?26k26E6BR5DcynoqNrYlLtPpWMrOoOVOTTtsMWGKPqtD7AzPU541Dv+8JEl7?=
 =?us-ascii?Q?t4AhF70GdYoIJh4ss+oyRMgaxj3HaY26ONTZk08SCeXUb6CNmVg/FgoWoxIQ?=
 =?us-ascii?Q?9oV70KFBJCAGr/jk8qrOZsbCL0fClBTqsCLz2C7BEmtrgapgWBO267897Q0M?=
 =?us-ascii?Q?Afg4si9rD/GAX0C2V+gaUR11JfqpbqXsCgogSaVJ5xMIN06I5vfLIas8HgNY?=
 =?us-ascii?Q?ttdS9i9K4aQz4qCNJDxMJReAVWKotzHq9o7iy1eKqaKmNKPzzimzuZEO7pwq?=
 =?us-ascii?Q?FAbV1vCBj86vam3wXtILyvwH9aR6dezxdC4X7ADJLsENU7zcMoajmayVbqUj?=
 =?us-ascii?Q?gvFNdwJWwyGso6gxMkoonp6mZv7NSQ8PJokKH6F3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4+p6jCaX8UF39aQPNkkXxU61Lvi0W++nqSwX1Eeg7YCmjG5FLZTTnEKNeTnrnLV72OfNfBdWYi9f0e4GlSxpKyQedwhdjz/gBxLJV1fWsOgJAGCWUHz379JOrBYSOUSdp9R06cIwBo96ebBHJumU7487Z2u96GW0I6To859sAMqIfpSzmpvnajZquu0hl6rENloDwUfQYd/sza2L5NwxrdWXw2deqf7MNliiuIODLlEvf1rod+xG9IGabSEBy4r5AW4zRs+0eVGMZ34I4qUCLgIUdMYi7UWEs4twg4qLp3ljR2BoZmUQbLKPfH5PnVp84flvZbdXYml/ipnA+AgrxuB8H/WtsDVsOcYRp9snpWkehrtWQtLzuGALgSNHurRHQuJxo+flTukOQ0sSUq/dE8hwcLGTPlluIWPTXbmH29hOy2vd0MXfQAvphs5GY1OBA8Voc2OeSi7eJQAMiot40E8/yo+I9JVSYD+23rTyjuqgYjAEyEMdvJKfpbJY4T7YppeThhN/QgRDQ91uL6SgjTepPdBjcs6Mhm6v2SJHXGT8ikxnyYH+AHQyyd8Xa9TCt/ge/7d1dcZeURZhUlcyS7gLGlfWS24mQ/htoFhLacM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadc48a8-56a9-485f-b598-08dd46ed123f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:30:18.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SavRN2n53BijhuTy8KHGH1Cz8j4pXxgOjMJQyFra41zilMct51EQH3B5IM/ZYUj9tXOahD8jG3acdoUcAV20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6988
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060162
X-Proofpoint-ORIG-GUID: vGlQkvb6jfa-c08jmFvQrU42jM8gqcJs
X-Proofpoint-GUID: vGlQkvb6jfa-c08jmFvQrU42jM8gqcJs

* SeongJae Park <sj@kernel.org> [250206 01:15]:
> Split out the madvise behavior applying logic from do_madvise() to make
> it easier to reuse from the following change.
> 
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Liam R. Howlett <howlett@gmail.com>

> ---
>  mm/madvise.c | 53 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index efab2878be7c..31e5df75b926 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1615,6 +1615,35 @@ static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
>  	return true;
>  }
>  
> +static int madvise_do_behavior(struct mm_struct *mm,
> +		unsigned long start, size_t len_in, size_t len, int behavior)
> +{
> +	struct blk_plug plug;
> +	unsigned long end;
> +	int error;
> +
> +#ifdef CONFIG_MEMORY_FAILURE
> +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> +		return madvise_inject_error(behavior, start, start + len_in);
> +#endif
> +	start = untagged_addr_remote(mm, start);
> +	end = start + len;
> +
> +	blk_start_plug(&plug);
> +	switch (behavior) {
> +	case MADV_POPULATE_READ:
> +	case MADV_POPULATE_WRITE:
> +		error = madvise_populate(mm, start, end, behavior);
> +		break;
> +	default:
> +		error = madvise_walk_vmas(mm, start, end, behavior,
> +					  madvise_vma_behavior);
> +		break;
> +	}
> +	blk_finish_plug(&plug);
> +	return error;
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1692,7 +1721,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	unsigned long end;
>  	int error;
>  	size_t len;
> -	struct blk_plug plug;
>  
>  	if (!is_valid_madvise(start, len_in, behavior))
>  		return -EINVAL;
> @@ -1706,28 +1734,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	error = madvise_lock(mm, behavior);
>  	if (error)
>  		return error;
> -
> -#ifdef CONFIG_MEMORY_FAILURE
> -	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> -		return madvise_inject_error(behavior, start, start + len_in);
> -#endif
> -
> -	start = untagged_addr_remote(mm, start);
> -	end = start + len;
> -
> -	blk_start_plug(&plug);
> -	switch (behavior) {
> -	case MADV_POPULATE_READ:
> -	case MADV_POPULATE_WRITE:
> -		error = madvise_populate(mm, start, end, behavior);
> -		break;
> -	default:
> -		error = madvise_walk_vmas(mm, start, end, behavior,
> -					  madvise_vma_behavior);
> -		break;
> -	}
> -	blk_finish_plug(&plug);
> -
> +	error = madvise_do_behavior(mm, start, len_in, len, behavior);
>  	madvise_unlock(mm, behavior);
>  
>  	return error;
> -- 
> 2.39.5
