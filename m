Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E1330E852
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386031; cv=fail; b=N4dKIycY/iL9D9AAfGIU37Ck3Y3TkBEJW73giTUfap7S5fDXVNy1UFo7JsuqzOzmzM5dJAdzALhAKMy314Kmkm+8IrzdPIEQUpPEPAM9vr51NFzsyXQpV21j+jvvzujRMx580+oSnkhtwmLDNXw0dwjIG+6lOK3oOF4OQgbr49c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386031; c=relaxed/simple;
	bh=koOPqsb3Kf7EywW1zAyyvrRtZPzg/v3PY6ltiOsZieU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gUR0HDvFbleafcLoTcMqdMt3OwzX98XCvEXT134i7fgh+TT1aNsxXkkEnm1wRhEP/PZ+ufnyHibF3AahZ6AkZgfqPfKO9Q+ZzsQaDWCaa0daDkkOtNCCt7CFs9S5ManxecRyXikxwf+V7VKvr4CT/w+6BT2NRLbBVXTYfVQsPEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AHiHIErn; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AHiHIErn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMSX9CSpq1bo5BVPVvJ7l1CmdURnaO8xY6nbiu8YVVc+KnM/dukit8CUHRV0e5ef5wsMqp37G6pMlZuw93b22QFCqdz8bgQ3VOsMVO7uFDmeYrweu3InxiKRxewDYT3yEXW6DP+9k3+kz41d2rqKFtOv9ZyW9cze9Rv1Q4S0lbR5cpGxra+pl3uqDxeHg7a92JLZkrM7Uqc1t292GmQvBIJKb8xor4CAsSH6UMz+tjBMtFa+EJHoFb2AUDjC0VndQysqhlRjXP+1WvV87pb84WLI9kbs6AY9Eywy8n29CgoQSRTZjklnSKnMV83IKmI9faR+Li/f7zE/DbU9PlNE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FaZfnUku8pooNqcfhFQKT5/hDbpAFqpbK9Z8+C7XqE=;
 b=Bzklzb48hN/TKfCWX9T0XdporPweNiMFtkvX6RKlZ0JKjsGA0JBZzjC8m3uP5U/dtWB9vhlYrUSOGGSLGksEMLmk+KzOPAZIjmH+s7CwTe8ux7sE9xLsuIWcuDbq0IFstYemlj7av3FGrcOcQmwHHkmiohjD+uOYD0zZ+yT4N3XGeEgN332d/aWvhfyI85Bd5SmsXyDTs6Lozdkh2UFHNZaUSqlcNI95q+VE+0zcvcuoSGOKq91z5nSAdVDsabyKJ8MtEa6rlZMvbvO14PtVA0v9u/0M5FZU+8it8ThAQn3Qbd25tQd+nYnJuKn6rcw6qRFfpoEzwQa49pUhAKEewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FaZfnUku8pooNqcfhFQKT5/hDbpAFqpbK9Z8+C7XqE=;
 b=AHiHIErn0sqIyuRfJGKVdTRmjzDRI12cDnG+yx3eLtWBc47UZ4HHBPH65LpWcMTPDIiTHlYn+z0m6Wl0yJlpz2VlXNwJpn+p0T+3gB+Rf4Mrcp+OXh/qARt2195NHKAUEAle17mp7/aNkeDuYUvPoyX+CTpkymZPlwSGCF1aJHIi15xzhylIIxiyWZH1Xz7j96S2HZi9hHQNVgaZNo03f8hjzWJl6LdwSrFHPS4jQzltm2WGsw/9quW4IdZ21Fs+rnseWC6S8lpFTa5a2QWvR0k7e8vI0MbgdaJirKLKzD0hPCqImZs71vTv89MKA6cywUhzY4r3Fpl0VmFXXs1PBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Fri, 20 Jun
 2025 02:20:25 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 02:20:25 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Date: Thu, 19 Jun 2025 22:20:23 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <70EF3B55-2F36-4980-9944-E47E6C64570B@nvidia.com>
In-Reply-To: <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN7PR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:408:34::41) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef75a5b-20b8-41e3-8378-08ddafa10474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ADsHyPSDtUIAF1xynMMDl3hM3j4e40xwNbiRFj/vXzVMA1Y+R8O1CvIfycgT?=
 =?us-ascii?Q?FKaA0FlieFFbQvvlqbldtIUsLbxherjpznA05/Rzv6SpRVT4wFYu5Rleqg/g?=
 =?us-ascii?Q?t+rAaD+T+dUW6y+/3iHrt9/jBnldHRKISKODlCTefeRIoirm92gXI/8DIya5?=
 =?us-ascii?Q?asi8XkMd53dNUgD5Njm9AtEQxCzuReWTlbAmOZUK8ni/ExCb3r9zB9hi7TD5?=
 =?us-ascii?Q?qY0T+jAm6ocqCx22jIehufRDqa9WS+TsJ47jmW5Zl98oltWZEBmljh+PNv6b?=
 =?us-ascii?Q?bvCLtuINjd/PAtxCXrcB/CQ44jqj6kL0cDWtNc8Ssvf2d4AGqKI0PlnxEycY?=
 =?us-ascii?Q?uODQYCFS9mkwJrPtvZXfSBZCEptJ+sWDEHEIz5+XI59e4vUlgPzzIwVbbaI8?=
 =?us-ascii?Q?WWR8aR7eJSUu/kbPknCmrkXXKf6bO7pwS97wQp7LnIWg+jNplUSIbkyjafy5?=
 =?us-ascii?Q?T3R8B6pT2r7BpYNx8lVBI+nAfeg38hNVZkU5cgE1Yh17NwUQ2xs3v8nm6h4i?=
 =?us-ascii?Q?2oBZNj7ZYTYgY3HmNsoAhqZ2Q238Qj6bWK3wOvI+70HNhEIl0+hRQeryeBn0?=
 =?us-ascii?Q?yEnVxqfsDjc0rz8reXWnvqVG3jtWrTFjBrNIJ64pTtGjlizzHU1E+Pk8+U5D?=
 =?us-ascii?Q?qO36Y/xmpjIRRvNVQnL0D2msqGhm+inom2ROhh18zVe0vgNTR2h2nzlHZlvE?=
 =?us-ascii?Q?GQ/vnlN9EigW8ExhVFAVT2E9zZmXUEdR6bDF3ziVGreLxNSOpcD44QnhvghP?=
 =?us-ascii?Q?vJ69GjarzkOJm57XstoCSdR20ATzSYpT5MIASjWi8dBuMEzsN32NEJX16iPY?=
 =?us-ascii?Q?W+FlpBV3rbf8j2ysJY/XmsWHmQxi90CC5zVJwkp8Vj0zh5L7xIvA+/e6wpIm?=
 =?us-ascii?Q?n4VicPEbKJHjY4KmVMHmddpeAuZegYQrCajunBrzVEDD4Mrbj66VJ0JyNdee?=
 =?us-ascii?Q?HE2fFWkjqiTIRDpw2ho6JmWBneC3YxzOAnB20QjxrZTQVBnlJXdAG9muKmDQ?=
 =?us-ascii?Q?iEmoGPo+QtGyPtdOq8Z6DC84e5lE7jGJCYlMUB5EWl66YKXVwI1VZgvmDG8r?=
 =?us-ascii?Q?1qEvRdpvy0RlaixkgnEbS9TAm4Ar82+S1b+3bnBqANXvxvTv6hMcM1cHsQiI?=
 =?us-ascii?Q?PXzyDFh14C/c+7Uo2EqwcztrGJx79PXISKynt4FcSv/h7JqIpo5VXCm1z9+F?=
 =?us-ascii?Q?ohw3b7wYKYuDsaoZNr4J7UU8M87ylssyRVBYVmDDHWpuOeooRBBLLbh7vKHE?=
 =?us-ascii?Q?61IcpeQk9Qd1xHSUtfJXmTC/VURmiTjCIiOkWpExf+/UTQe6135Ru5i3DCjj?=
 =?us-ascii?Q?Jcft55lOqnY6mdRhbAKgTI4UMhJFfysiRG33FH9S58nJLUqy14jayDOJCQZf?=
 =?us-ascii?Q?C3SutzETNkSslNdqdP+iwdUXJlTP7gtRR36wFnSvQao3XdzBlTQl5w/jNFTp?=
 =?us-ascii?Q?o4Thf0ohHx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6uIEE0oOlj1V69NgvEs7vhpftyDjF8D2CQPnZi/3YhWuor88TK4TGUgZWoQ?=
 =?us-ascii?Q?ukwwe5KFSUzt64GNteaPQn4D3nXWzh8qTTByRUKlAsrFpiemswcmlBhWPzX1?=
 =?us-ascii?Q?fPzQSLo/jkhLOiDmf4b/iL5nfRFCBzwidMCypuZaOBdcN8zX/eXUN1qPE66Z?=
 =?us-ascii?Q?2JHpffuZWBFXuS656jyymVYeBOZu+iYYxEC+S3zGWdanLP6j2W4wHlWD5vGp?=
 =?us-ascii?Q?nY6Uw4K7yAiSQbHQxYVULE5xA1FWutxpGRS7piSr9N/gyzQoysWuc23lXgdq?=
 =?us-ascii?Q?mCp8kWniR9AHZ3kmKuXht1ygL1vo18QwhpW8hSMQFRyU9OpnsDGrPGS4X48d?=
 =?us-ascii?Q?7VQMBVanlIR5YNf0K78ReC2DiOy4jGyS0wmfuw9dK7Yv7q+1DsTnyO5Rki4n?=
 =?us-ascii?Q?JNboHdDhWyn+Uh2Hwf8D9mdiupfLvigL+PlOa64rjXHbQKicQdqduYPeCfJ3?=
 =?us-ascii?Q?wuk+aIiBR2sTuISuXi5WOHfvgFWqA92Czim5mV6V7hXLV97EsSWjvqyen2uV?=
 =?us-ascii?Q?cDkJOTIcnQyWzelqkpG2i8FWdkYb/9k5zP/aS+EalUkcs7t7l/OBx1URAMYG?=
 =?us-ascii?Q?Oeunr6d/yDXS0HTo3A+8Meew7DWTWYX2I/hOIZk18lyOCIX96Ob5bJE4oTN+?=
 =?us-ascii?Q?OUVE2WWmdOmKkFZD758PzDKp9mUOtRz2uEx0eBu3s5pvud9C6KTMcYPdc8D+?=
 =?us-ascii?Q?nOuOy1inxxuPoMBiDAcIO7/NmWATZRLV3NcglApgne5NAaW9vsS3DhONdqR8?=
 =?us-ascii?Q?t9h6svKMJ9KpNSnH4F6SgVrbjT2RoTNyLR18P2YLOlIOjK1P4CEa2Nyj68cS?=
 =?us-ascii?Q?lhOq4mfTd3Ph0N8o1BZE+yHYUAmlxB5RIkso5RynRtMYdcYqXkDDrIdWX3J7?=
 =?us-ascii?Q?cJXLIduce19gtDcnN7fxB2zJ0sWDdtMvGp7upZbnkHznwhHPVQNGU5P8hSgE?=
 =?us-ascii?Q?FBJ+CQl4K4314m/CNTYybqGSY5djjy+iXmsY1Wz8ZpFFaH3LNVb74gL6hgMp?=
 =?us-ascii?Q?tjJQQct4T+4HLG6zM8WFsb6aSCBwzo8chWrlcIlo3/9Em+zRAi2tl3WhBOx0?=
 =?us-ascii?Q?iuegu+MzYgi4EvlAoZ2ThS5OIlPJvuouIRe8JHfrRI1cczYsBYi9LgbDMg2Q?=
 =?us-ascii?Q?6Nl6t7Mf0r7yyw5ajqE3RUGh75Lq8Cjmsfak529mzd1qkBEcxfquB1KRvqoj?=
 =?us-ascii?Q?oXB0NeB3iLHzwEHHuOCzaazwbzCplvCmcoSm68yJBApapc3xAxWSWLKvUezC?=
 =?us-ascii?Q?erRN4cLhrkd7qlNwm2piBJ27Cdh2xHjhJ+WoZge3grr8HKU65x3Vt9xcp1Xp?=
 =?us-ascii?Q?5in0AV9HKzwD7LJJJmVCuNoQ+1nRJcpALG8fkX39k1sxTwTvTa8+83RD/uA/?=
 =?us-ascii?Q?kp+hi5qFkZgam4KF+Q3mU+dO3MK6ElWzNM/o2vhPMb+QG+VegVZyO5zOO/tc?=
 =?us-ascii?Q?C3sL61B62S5GqDPSZmgoKIIIJFvemBH9k1xmiWPwa1BmMS/67/LKurvSaQOr?=
 =?us-ascii?Q?JXy7B/Z0MDPeVohcNs21TcZBkzMy97TFr3mv+Ug4lJWapjEuBC6qrb/YTXN+?=
 =?us-ascii?Q?bVDTbIFmWzXFHlVMYnifIqqF4c6u1+lTxkBBShu5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef75a5b-20b8-41e3-8378-08ddafa10474
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:20:25.8315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJDg8EtPD+seoOsZpIvF8+NSL74smefmP0AHKaQLwExP3LgmSi9KlK9WeJXA2FIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140

On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:

> Doing so means we can get rid of all the weird struct vm_area_struct **prev
> stuff, everything becomes consistent and in future if we want to make
> change to behaviour there's a single place where all relevant state is
> stored.
>
> This also allows us to update try_vma_read_lock() to be a little more
> succinct and set up state for us, as well as cleaning up
> madvise_update_vma().
>
> We also update the debug assertion prior to madvise_update_vma() to assert
> that this is a write operation as correctly pointed out by Barry in the
> relevant thread.
>
> We can't reasonably update the madvise functions that live outside of
> mm/madvise.c so we leave those as-is.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 283 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 146 insertions(+), 137 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
