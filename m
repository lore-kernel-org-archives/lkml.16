Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8B202C48
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142349; cv=fail; b=uFcxzb6v5ns6DeEdiNv16eDyPI85KV3x9C8+saQ5W3d9I2IVueMk35siMTCXIj3PYjp6bfSStNSt7eGHmtjAmIguORKv37H06+6wZg+EOVOOrRYYeOa6quntUfSlQN/PTLsnZkyjytRijW7CBOaS/83UF7nqtwS7W1Uw1yzuS3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142349; c=relaxed/simple;
	bh=0MI4xrcUR5UONpb8daAkzW4rgljSc3deWLHwRP7YjS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hbI6mrCYSV9qA2kvjhUnNYT4KkCvLmvN3ZPvzHMRY+7tlSeh8rsVTNQQLecubl0nPp/Qi8Ac3GSY56vcdVTKZ5fhSIZk3ZHsjaN5Z4SiZ0Cq2Ra7HL+18kq45a2C8PoAYjvj2q6AIckgolRUFw48ezUXI5nIm15LYQjUivIE3P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rdo+Zm2w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QnJ+5Ce+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rdo+Zm2w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QnJ+5Ce+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GLuSKF015758;
	Tue, 17 Jun 2025 06:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ok5epqXN0IsJKddsBV
	VU/1P+2G+7dlwdxI82GIxyGbw=; b=Rdo+Zm2w7VAlgJvMisgQD8oDiH2Ftx9WzM
	kKZViVmz/htSFBU2YU0dHTi+2Mxy5hUpHxxZcz8LOh0BbmC+79gqR6Vhm887Q4kK
	P1LvJTnp5bHD4GZCDSU5W0TJRAfecT+p1VWcDIoJIXQM+tt7xubh4b8CvBQMlYvT
	VN7eKecuahXozndO6s+g+5lHbsszoN/tbw2e04zSnFJA/PA4759sNgutvyjoXJ08
	+S68pEnz0n503PKBMPyZ3Fpu1uIugDhcqXjWxuMCsFjFtwDf6U8U9DU9mx363zA1
	3C/ciZVN3RNaFb7OaBhOk6jH3JkjtpbiVNkbwO6xVUqjELQy55fQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv54jyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 06:38:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6Bt9e036379;
	Tue, 17 Jun 2025 06:38:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhfb853-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 06:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3cKzWjqKL/NUJ5ji0a6UrMYQFK7JYAxWo7dT+tX3Hro2akilfdK9M3CSrA22lLFNKBZ5a2bLsKc5Klqls2Sp3qWa1PA3GVxuCt/Q/hfwkNx5AeeDlJX0LL1HKadTcnzkpkdNBYGef6OibKxNGteL7kj35izX+NV3VdzUhjhAqeDdYeO3GDTsK22q/1efpcqldaxBlGPjW80S8U1MOvAnT+oIsgw9s9lVrHepeUrwIT2GKoqmSWOPP4Vote+mCshu3DNRRK5W4h8rWE5U3LHHfOA60bap9TotFdEFzytpaUxkRGqxMyJKD//h4RCs/oIF4P6v1BW3yVEn7wdziHC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok5epqXN0IsJKddsBVVU/1P+2G+7dlwdxI82GIxyGbw=;
 b=pC6V9Nom2ONzQTnen1ycdU8QxRLAYIwbqlqH8LVJW/gFSCo9RiO1Yu1TXqPvLVTNfmvdNg5rDd2dKiRcc7T8NIR2WfvJZopYJ0w5SvNMtV4rd1ZIVKRRfKNsjCWUqqSdKdzrntbZrlr+/HC1Ny+ycNUO7T3SeaGuUpfwR2G3bXBEJN4Hn4HKgVrOgJKthyS3U4ZFPu7BhoKpKylitE5z17GZx8ADfAiCazKlhOIk8QHoqurfLVDw0FCfXKshyHHZ57SYwaHKv6hyTikyymUgR1rOkREhCUbdD/jPhbgwCZmSTVfCli82pDXuQcvvNaZPoTOh3J3PK7s97vsCkEj59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok5epqXN0IsJKddsBVVU/1P+2G+7dlwdxI82GIxyGbw=;
 b=QnJ+5Ce+yVxIdFdWZWmLfZ7QRN+3xirFeAGqyXXGSyRcsWbpVzIHAKtM9NsgzhW5br0e0LGDaR1px8lxrqsTC8a8lIMVQ/tHCobyun2SZGSNarFtLxKEERkJBxMy2B3d7UzeTPrmJqynnbTw2rZPRuOifeBprv5RT3pT7UdYDGU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS7PR10MB7191.namprd10.prod.outlook.com (2603:10b6:8:e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 06:38:06 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:38:06 +0000
Date: Tue, 17 Jun 2025 15:37:52 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <aFENQMQUDx4GeMuc@hyeyoo>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
X-ClientProxiedBy: SL2P216CA0102.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::17) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS7PR10MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4a2a59-da9d-4943-c504-08ddad69844e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OpY/CtPghvBejD9a9lq/idEGICOmUlwFzBeBCjpMZRyxYS9EHFde2O/2ZAd6?=
 =?us-ascii?Q?bv6ini6owMNrKcBWw+TRFKpAGH7dHMH8CLqlYUqSD2aJNTnMaTXdxyB0Oddc?=
 =?us-ascii?Q?avS1soCJ13VueWYTlQW42cHeUzKBaBmvjlHIjePgJ2HG4tBD1fte21Srx8Tb?=
 =?us-ascii?Q?yJu4t5GiTaK7R1sv5A0IayFbKPvpGWxm+pzCMqHl2TTkjA50CABMMez77HP1?=
 =?us-ascii?Q?A97veW0YmHKJDr6GfATYtPNZqqpNWilRdcjNhvl/O56wM5Myusd43xIJHVIl?=
 =?us-ascii?Q?0shEBqkCoIkD3Y/gLs1aVBIwVnNxhmmgHPpHg/3GQiqH2WYP7Z9+ZY6gVSvR?=
 =?us-ascii?Q?c7NJsXFpU7KeL/LW6fo18Ykc6lB569IIoYI2HPINLO/PcHtHmtvRXq/KUWAP?=
 =?us-ascii?Q?PCcMDNjFIfNKjHU+7EmVx71lCZqGXS5s30OehiwNj8azoT6P2GAVUlC5otnf?=
 =?us-ascii?Q?8IbvSW3RIuwA7Tiq3eyAJ2qLvpkKOerfj9rjOd6uR9gz2hau0Y8lkvdeeOdR?=
 =?us-ascii?Q?3WPpA/frs/CAifj+akklMBX8Ig1YUFwXyoWVnxa4mKgnHaoy4quFcG9HXF8w?=
 =?us-ascii?Q?UeBwx5d0uaWu/yygGbHf0k+iEQUAlh/tGUp4TJa2CA7VTk6Mi1ejfp+8x5TC?=
 =?us-ascii?Q?Qa9IroN9sBBBJ7w2QhM+IvlOqldb0aUiH4QXdFR7pqBZnQZSjuSWU9lQbGDI?=
 =?us-ascii?Q?6V6Bg5CjArAddI4/fHGb5/ENalOLfg/KDIvp+c+Ry/IygSsHtG8gidUiiqz0?=
 =?us-ascii?Q?ByPme8PXy5cajTFFmDehcQ109VJl42be5e+k/rWiC5TUt1BtyvDgqJYH9pSG?=
 =?us-ascii?Q?tquyiCxpEYa9sjLOEKyZEdSIQakCiPYVEeDGpJVvkELZ5z//vHpq8fdx4xFp?=
 =?us-ascii?Q?5r5ZKOaoPd4ZeSA7PypRacdlUUCOMgIMG28grkwwP9g2hpBDoqmhYRcja1ZM?=
 =?us-ascii?Q?wkZ1DSrCAUVKE2xl/GEZ+Q+t5b0TykMG+obKTtIvIRRQqDSdqU0ZdgPdqC52?=
 =?us-ascii?Q?FtE0Ced3B41X65iKKqN8Nsw1cIeHeywtDl9Yb8N4krJxLqi082pstA1rn5hF?=
 =?us-ascii?Q?Dnp0eTLgTNyVpYAPHJkuuPDPNKjdCPcQAkivV4682yrrbrGYZlmIIVf6YaTE?=
 =?us-ascii?Q?mY1v/THZYQm0pBY3WK96WHuu/xqURQY2UsraWaR1tC1qkSWg5i6IjFu9fu2r?=
 =?us-ascii?Q?1Ch/hfJffugBpx+zl84H5YEMlkBuxHJa/49uoL4npGDBumng6SkXhbM/pto1?=
 =?us-ascii?Q?JQVKfbKOJYwZaHqgRy7HYZiiAyMQzJOczlgs01vYiiQsfZXVxdyH5tM4eiJk?=
 =?us-ascii?Q?RG5Hp4wWmj4kDymCgjQoBj3LtFgl2A6YUD6D505r7GkzJaDthZApaSs9PFf5?=
 =?us-ascii?Q?cOHflm9cSO8/UaIDSwdVTM/Tor8gnKoa8OOA9IpMs59iz2Uuc9djY3iCQv3h?=
 =?us-ascii?Q?myC2954AG+s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rHlTVodGoqgdFuCxjazOjIUAiX31XakWt340+vbr8j/fAgrosFJ9WlvrsWlK?=
 =?us-ascii?Q?AckBL8SnL/NGNASB5OHiQPZ3HZpl/58WwU3I9gA6POWoZjLNQAOqWSdQ83lJ?=
 =?us-ascii?Q?CxKWmLm9ZgJm5ov7bNc/mShKyP9wacqqh+OWCWtmMxhgty0rF4GFacKlOefl?=
 =?us-ascii?Q?OUUCc1hIQSUg5ZGHW7hnzSgFjx/Cv2u/SZHyTIBQSzL223fDLPCIXWY6IMny?=
 =?us-ascii?Q?yHJBR9VdtORmzxj4cIX74W6wjhBBcsELVQOi5Rmv3Kjd+BOpCSH7YM+jNFll?=
 =?us-ascii?Q?qE1oOeVWs1cGHI57TAPQRRPv5ApkoFRQ8Q+gMXRw2nS4n06/OSMZdUrQU46I?=
 =?us-ascii?Q?xWq0GCxClLyq7Aeu8u+hYx/KE46rOXzYoz3AFMxtwYNjR6Fjzu69QadCDaZu?=
 =?us-ascii?Q?0sEnvNeXeMh2bdgVdHUfpP5Ikt5vXVDdKRfL0vzIec8foZi9W3xHvmInAbSo?=
 =?us-ascii?Q?brrHBl5idtU6i98Pl6FVedwtnqpdnlW2Veoqw/ja7EVa0lVBtKpexZqcfU1J?=
 =?us-ascii?Q?kuLy7s+NlDPal4CJE0FGUoCFCvb31+UD3JkYn1kjXIbcTqo4hKrCk/GIKzL5?=
 =?us-ascii?Q?6rbGCuezYU82oHXK0GKi7GAcJmUw5Id+jqKJ9Ovd10uPOBznufA+n9IHNZNY?=
 =?us-ascii?Q?se1E0hq9nBtTm6yQ84NS3W0tIONI27CxeCJ1I3cv3h34tFfcOwk52KP+sy+7?=
 =?us-ascii?Q?Tq2THFkdZwTQpSBHWvSijnzpUrZFZirYw94w7wOmp9whGGVJiLPG864mnbM+?=
 =?us-ascii?Q?YdQ0AG7BxN0iiA6cBdBBeaIglEzNZGYhdXXheSDebk5dOqbSr1HR1DDGTY9o?=
 =?us-ascii?Q?4Dy/MKbPyfL8lCuvWnTv6s9RqTQOAF2jM92yJQFY/ZCTgFMEylblWuzgAyCz?=
 =?us-ascii?Q?M69k54hLdTjckrar2mhdn/A/kHT2rGRDphY5TpvFeeZ+53PdXjwbp/32VoEE?=
 =?us-ascii?Q?SK6TkQc50PkeL7nCGJJgO45Vkt+gAGIJbt/7yVIkx3wj+7bCA8dV5dMIQfpu?=
 =?us-ascii?Q?2uNdPY4Y/IkS4u7YUOLMmmXt5SmLRklJAOrQLsbRTFevDFy3SsLmD+u3Hw7e?=
 =?us-ascii?Q?1Z+NjyVToYYfCf7nLGIhONRD9G78B1GhreFzhglTM8MI2TqJBIwcsNSp67jN?=
 =?us-ascii?Q?eWCeDBq5GzRH9Sa8ZCH35FWMrfv0nt9umeWNp5Hu92h0Z/0hTfmb1lV2PLVM?=
 =?us-ascii?Q?iXzeYAWVqlL6wsQbPZSkXJEWrvvfVHz6wFuH5QgRo3j4usSJW90kT6TlsxJo?=
 =?us-ascii?Q?fvqfIu2oRDhiYUuAWyPr4GETYYsc6ujDKvkBoOc8ldSKMhaJWnpC69DKiiHM?=
 =?us-ascii?Q?g35kp8g1mO0mrSEqCdpSRO8gx4YwqQEtWpVxMka4CNPqV+CXMXISkOYII/XZ?=
 =?us-ascii?Q?9w0NxscmDBN2QRNyO1GYQIdEFNs+OUrNaetNvoErsTsMf4mC317dq1Fbmh/6?=
 =?us-ascii?Q?uFxeHjsKw5pHfpDPOfQ4HssWu69eK7uE/HhpWfPa1jsRon0BOqy+3eKJbZZm?=
 =?us-ascii?Q?L2gX5bD16bGCdqIF+UC4tXXBZMlMSqrwxR8yIoNc0IlRZWOp23lmhY6qUmrw?=
 =?us-ascii?Q?4jVT4ZjisY1E8Z4bh8i/bjzS6Mwl5xLRTkq0tYEY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zZs3RKG6eo+86+kz/r77I8WZ0Uer73+ZLAv/oiR1rQnGkDcuubtS2m6QuWciRas7Ab3S6+tNOYpa4TrFOcZArADWMbqrnfsSDUUDGGSW0a3McH/GPGug3z55UpsDI4cjRnftTkKlHBhz4MT2nFUXR34wDHbXsf4U+euFZAt1DkifdG0JU8LppF0c1XjtDq+tHVlqNJxWpzwfUjP9rd1B7TcuvYVNme48JI2NZKBgVLDzajxrNPSVlZWMFBGAT+Mvtepzq0IA3fk3QlMsBUap9BLmJPwiEsBTCcB4o6Vtjfgg8fEwdEkuBcGx22YRceIphXcXL6NyKdBdXKd4azwgWkGb0X9LfzeEQ0JmUrpGVQJzYnCz7/lK2LiAye4k5b2IByqkDffQn6Sqy3rT1LlNY4Btyy97zMekc6cgLux112aIDWSGxKaowLo5hy0kQOFvDVrXXWpzKfsYCtkjFCSLlT2gKS8yar5gzFxaGp3nN+qcqI7JtRmEyX8H+vKbo8/nl0H0rbx7+ouEMpjRF7s6I7clzqx8VVGES+1qnRviANKsTS0ZacWLM0YUXt2xK3s8YLooRLWI2E6koK6IsaxdOXdXnjl95oVHnrz89RpgA0k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4a2a59-da9d-4943-c504-08ddad69844e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:38:06.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9e/UsAlgoa/4TyXqhnT/K6T0U7cElqXFOD3kPWW9kZKh0emHWS4y51twCFMdinaBFhOewxZCGhWkVIZXWRV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7191
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170053
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1MyBTYWx0ZWRfX3Lk3C3o3YAK5 ub1HZg8dcQURBiQ/bBbMxFZi+7Zhi55Lum35r6TR6XmdZ0SkSm15UBqMr8DG66pTKjt+UWE41ei tUeETBnCDSHBCNpD2GSblBcGnnaib/0s6vHISsdAqwQSbRMPIiEvN58Rao+3rk8OVYRub42tJ5S
 2i+H1FOBWOH3fU9RfBRITLVIUNi+96mKh+d3cN/V1CdwdoTzQJf3hnqsRnwBn4Y/2MqjBgAEAyu VSUbepT9NsmW8PvpIhZ4Xy5iA6nekEcV3hzcfc/pruCmRufzWfZ6k5h+u0sDzc242WrCvGrKuDF W2J/7ku37FToXV6/d2SdkmLxQXCg+dr+FFm/0oIUvEMvsMU8FLTuV3R3lhtC7C1YRAfYFeei8zM
 4INTMDTiKEizv/BISuy/Xor+/GroxFDb51d7TqYL0ZhufnxVJ9kq7Cf2Y5jzLE2LjKSg/UJk
X-Proofpoint-GUID: 9sPcGdR-lc976CooYVdnp1TeyL1BZ41w
X-Proofpoint-ORIG-GUID: 9sPcGdR-lc976CooYVdnp1TeyL1BZ41w
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68510d5a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=dmwplqIZnf-mfRiTpxIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Mon, Jun 16, 2025 at 10:58:28PM +0200, David Hildenbrand wrote:
> On 09.06.25 15:26, Lorenzo Stoakes wrote:
> > When mremap() moves a mapping around in memory, it goes to great lengths to
> > avoid having to walk page tables as this is expensive and
> > time-consuming.
> > 
> > Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> > page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> > well all the folio indexes pointed at the associated anon_vma object.
> > 
> > This means the VMA and page tables can simply be moved and this affects the
> > change (and if we can move page tables at a higher page table level, this
> > is even faster).
> > 
> > While this is efficient, it does lead to big problems with VMA merging - in
> > essence it causes faulted anonymous VMAs to not be mergeable under many
> > circumstances once moved.
> > 
> > This is limiting and leads to both a proliferation of unreclaimable,
> > unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> > impact on further use of mremap(), which has a requirement that the VMA
> > moved (which can also be a partial range within a VMA) may span only a
> > single VMA.
> > 
> > This makes the mergeability or not of VMAs in effect a uAPI concern.
> > 
> > In some use cases, users may wish to accept the overhead of actually going
> > to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> > provide them with the choice.
> > 
> > This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> > attempts to perform such an operation. If it is unable to do so, it cleanly
> > falls back to the usual method.
> > 
> > It carefully takes the rmap locks such that at no time will a racing rmap
> > user encounter incorrect or missing VMAs.
> > 
> > It is also designed to interact cleanly with the existing mremap() error
> > fallback mechanism (inverting the remap should the page table move fail).
> > 
> > Also, if we could merge cleanly without such a change, we do so, avoiding
> > the overhead of the operation if it is not required.
> > 
> > In the instance that no merge may occur when the move is performed, we
> > still perform the folio and VMA updates to ensure that future mremap() or
> > mprotect() calls will result in merges.
> > 
> > In this implementation, we simply give up if we encounter large folios. A
> > subsequent commit will extend the functionality to allow for these cases.
> > 
> > We restrict this flag to purely anonymous memory only.
> > 
> > we separate out the vma_had_uncowed_parents() helper function for checking
> > in should_relocate_anon() and introduce a new function
> > vma_maybe_has_shared_anon_folios() which combines a check against this and
> > any forked child anon_vma's.
> > 
> > We carefully check for pinned folios in case a caller who holds a pin might
> > make assumptions about index, mapping fields which we are about to
> > manipulate.
> 
> Som quick feedback, I did not yet digest everything.
> 
> > @@ -1134,6 +1380,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> >   	pmc.new = new_vma;
> > +	if (relocate_anon) {
> > +		lock_new_anon_vma(new_vma);
> > +		pmc.relocate_locked = new_vma;
> > +
> > +		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
> > +			unsigned long start = new_vma->vm_start;
> > +			unsigned long size = new_vma->vm_end - start;
> > +
> > +			/* Undo if fails. */
> > +			relocate_anon_folios(&pmc, /* undo= */true);
> 
> You'd assume this cannot fail, but I think it can: imagine concurrent
> GUP-fast ...

Oops, that sounds really bad.

> I really wish we can find a way to not require the fallback.

Maybe split the VMA at the point where it fails, instead of undo?

-- 
Cheers,
Harry / Hyeonggon
