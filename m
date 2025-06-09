Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF78219992D;
	Mon,  9 Jun 2025 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483168; cv=fail; b=QCE+6AdkfKCCh9aW3Rqm5YjNVIwIFxTcni3MzUeVPpfE/wZS0eUPicLOl3Lj9DrobG9c0y2AJ1UIK2scSp5wW4838QO1lM/bmSvboV0hAjERL/Yaghi3jWAHaJvgEOHBepL1kdA41niCU6gz9S0/r1+qEVB/a4XMmfEHEGbv8X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483168; c=relaxed/simple;
	bh=tigHB8So4bFv+A6AVN2PqqgXohYP2194BECxmZp+pBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VCtuSszMHNruHpFCFg7HOvSn5ihaR1VUeb/ZD5BCSLFGT4M0YGUOzQsaLjh7RnGUDNaPwFxO5bWTxS0A3lGDa0CXZqj2ySP10igRwuQEJX/RrIVka/Bc9R5u/Ox9EPx/hiT9rrRDZqeAVWwyAygTe+RKkEM8+BpQ28T1twxBHds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oz9QYfM3; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oz9QYfM3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0W9hoG0/ROplAeS/s0nTg0q8ZJhwwbhfTMpVM7u4FAy9d+aySLU+J6pVBEvxlNEMIxP8M3Qv184GFBMJbCGzptlwkK+On+gSRCcCVH9vFe26WRI/H+kBH3Dw0d59dap61htC9ZuckiVEnnKjsew07r2cKpQebQvfvaJi/C8oi5Nuv95aBX2YgxYT1kRZMRsSqIp1eZop2y11KzmGRcBbtZd0iXHaJzq9j60YvpYWzZZp8DJ5cDhWmNLEE5qR4S/QrfNx0WnGF8akXvW7Km/ldmdA8N7cQ9gcv6YR3StEXl47OUu9WnghYVeXI/Ls5VUps2/0FvyWN/uBCzxlxJ89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWyGu8X1wtYm1EuoNO7BEw07FMjl2KJGoiij70EkfQc=;
 b=DPCxTb7MvcVSnV3rMtIlica6iIrr2+3yqXr9zVajvWQIPkxIK9OHnE9Ki1bajOJvs0JBt97SCmPJ/g/wK7EF0fw+HETNN9WuffHlOFWJRtyVEEnElqqEDxXgWc7E1+xPST/jSxKRTC+WvcZpEkfdjFCbujUGMCnECX6NyioRXpD6cNS5aAcP+e2NtMNCBiq9v6uB9N/yHklUXCH2kiOht59/MA+g9/swF48PyR0T3Ugr177jG5WK9S6fzPKzUKN0oIQqq3BZZjhAIfHLTQtnm9EXSWK0bK7mkq7ukRMKkBoaqzyQPZL9eZGlLe2qVQ3ATdYqWTZbUYJoBe2swbmEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWyGu8X1wtYm1EuoNO7BEw07FMjl2KJGoiij70EkfQc=;
 b=Oz9QYfM3ouGxpnKUm+c6/i4s1yjngx6OSAlDgOCc55oHd/7Pyv6uruuSo2n5zxekVE9EbPZhSw41vtx/UGLWUTjjX7Ow2Fjui4co+7pw3V+79aAdlvw2b3t9KOq+bWpKJuq9SSZpawqWyat1Gp+EMHpJ219z5jxNHIIVHQotpJt9v/+KaxNCSjT7JMeFGzljIT/V1HT9I5xuHk0Ypl1rm4/6vDEP56dn4tkmnuyI7ALduKtqicVg23XdkA1htGYMMVIWbdx4ws25h/4MHZ/itqmC/67Cmmz3uQl/t+IhNFkHXKd6kzlyLmSHZ0dt4nHeDWaO6dl71liSVCtkQ6G3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 15:32:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 15:32:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: lorenzo.stoakes@oracle.com, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 11:32:38 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <7A15E4C0-645F-46B3-AA62-13763D256C7C@nvidia.com>
In-Reply-To: <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CY5PR15CA0053.namprd15.prod.outlook.com
 (2603:10b6:930:1b::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0e742c-2b48-4c52-11d0-08dda76ae001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dRTMDE5dXE9H3tPcG/8ocNadzYlHW9PNn3u3Pmp7CnZ9MJwXO3gBkz+rohPJ?=
 =?us-ascii?Q?hgppxz6XHIhz0MMoEpHxV3+PZRPUHeWqes8cUOHb5t9ncFOx9UK2leAOsjVo?=
 =?us-ascii?Q?RcZLUoDVMi2QRrixHJ3dP3t9DxI87HN9G+4QrtYMwrU2zCnX6uDiRGgvp517?=
 =?us-ascii?Q?LgCS2dMz1+9dxinApDNDR36aQYtaFM/2uP4pNwLDyokmn76XdfDOX5rKbsOK?=
 =?us-ascii?Q?3GQ6I2cAomksb6+TMpKAS6FmCnMZkMMkK1W3BdMS5KFLpetIHE0hlRbAHOUd?=
 =?us-ascii?Q?vqzi6SK5mDeZOIS9S7w8jPJJ/iAcj4o6s6TCu8C8xMrWPaIA7uJdlmh8hx9x?=
 =?us-ascii?Q?Yl0j7/eC3oqqeHq3KX0VmYHqjOUKQ98Z906UYOqMgEwEbfyb//geGaRu0pO8?=
 =?us-ascii?Q?opvasF2TSYJh6WUpFhStJ4NHGPg/Td324fMxj/jnKOznWyFps2AVeB8c/OpU?=
 =?us-ascii?Q?dN4osiBd92J/GSx3GD7tTlax/8Wc8u2gcvte8TR2TpHhI+V85Jrfnbx3SumW?=
 =?us-ascii?Q?jasNaGhbPdYuIkdUIqBNhnPtzHqBEuoFt//MvdXOEafKlCEFivlGrdo5PmnY?=
 =?us-ascii?Q?w03ISyEsGUZ16mZZcnCUpLeXtBAmy6u4BtfEcn0sFxDgmGSgkHD6mGlNNDyj?=
 =?us-ascii?Q?mnzvn8zxRjLAlyCK+YfnEa91loFVUnP7KIQvjPx7hXSNn+U5xARJyt0wzP3s?=
 =?us-ascii?Q?ndhhavJteuHDH5LOdLPF3IQBj423FF7TzyW/X6Hz7Ody0n6UkzLoro73uGPY?=
 =?us-ascii?Q?eyLx+WNsVJtHdnfW/bMDY1/bAUVVicRyG+hqlD7y5/rW59TpdY07Uh1/KTmY?=
 =?us-ascii?Q?9pqDMF7RGVsglO2QwXjqlDadcAAX9qnfmXaLi9sOaE6t2HrmY5MtpbJ2tLm+?=
 =?us-ascii?Q?iN3lg28d33OgH8uuq6gGmDZBpPrRVcamh+U+MJhsn+MsbVnQ6334ljSbcvKd?=
 =?us-ascii?Q?Guj1A5Ru4YBD3CMJGprwowhLJOebDxYrqNpSGdVAI2+z7GGYCY0p/p4e4HQB?=
 =?us-ascii?Q?w+l0XUn1vMw3J+KmXRPLCIVyO7L+zQzoRWIVHJzR8vndu1L34eNdsB7ZnQZx?=
 =?us-ascii?Q?u+UA8K2LCnvN9JrWyYBvASFOgRzOuivlxFqHQdd7Yjn/JRjGYwAFWv5ddjpN?=
 =?us-ascii?Q?ctbNrXcdQf4PYe/ulJNm+KLE07X+OflqADkZUR+/SxYmzC16eQDYjXMMQ0Jk?=
 =?us-ascii?Q?LU91Q71Tqt4xJBWnmTQuB/kv3C1k2Tk2ht5QZzOkjer9F8Ev08WspMKBYoMM?=
 =?us-ascii?Q?g+QcSV1vtfGXhERVsr2BBZXwrjY+Z7R9BQjHwVMSfHnfYZBUmTZVrjyx3mlH?=
 =?us-ascii?Q?ke1DkWBDqctQlQ7Q2nL8MctJ6BpoDyjpyIsx8MLvt6qPzAkMkL5VJeDYHE7V?=
 =?us-ascii?Q?Suix4W5I/9cPjvgXzN/tzNMQl/u/wy0eQktfkUh05ThxIsogxBcJwf/HV+2l?=
 =?us-ascii?Q?pk86a1qpjpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pSL8DoKGC2YuR0ol/vQfRmjSeDyuxzQ/hZU+IS3sVrAdfsVGgEvbgExvgPPv?=
 =?us-ascii?Q?GMyj9/qbREmigEkAEpSTgs/z0RxTGQXjDhGuIW7ThGDCzOgZFfDf+OC22Nx4?=
 =?us-ascii?Q?MkAsNpF8GyB/UQ2nWK5VanuGdQKOCTpVOFKlRyZxEgSrcg9PgFHOaOk+eh1T?=
 =?us-ascii?Q?LqlEEPvpeDHMuXOlgVST9Giq7XqvE/hQahy3blFp/bzV2Lwx9uPVqV4cPr2c?=
 =?us-ascii?Q?xMqC7taSIBiTL7wbQWNJgvXNqKBESGJqo9JW0s8XJT08lSqbNPpzwPK1qnM/?=
 =?us-ascii?Q?tiwAGhnSpAvsf6zxoptcsv2yKUaNR9CUuywk+uyOhvO2DjrAfWc3WcUoK1MK?=
 =?us-ascii?Q?TcUsu9ifz0i3pjsSQhmdEdL00UgozLQysJzPU16dHPUvNtZTbp387xvINg/z?=
 =?us-ascii?Q?VGCA0CuL4ZpmmIM7raqFlkx7sk6Tt6Ndv8dYcKCfSeQTPLAKqrkb+2GWL5Uh?=
 =?us-ascii?Q?pZZvzt87q5e187m0RuPTArmgoYIBizUeKyGSvgD2VZwYa8U/xu3SvDcfEq43?=
 =?us-ascii?Q?XpptZRPDivjp3JUYO1Nmx8UvA0xMT0ynl/z/YPti3SRJYHkfFgy/fX0NbYiy?=
 =?us-ascii?Q?IQym6vdLTQ+gL6wUrWMZFwq+zYOY8BbDXUkhiz/gk9rtC3ZXoXnV26a0i096?=
 =?us-ascii?Q?n0Kg9fVPkZ70VdfRmOUnNpopAsGwv9c6znZk38lM8vPYSXvrDyQPSufz2DNg?=
 =?us-ascii?Q?IAQHU4YOVnoDjmMj7o/U5VCILSKW0ffS7dMfwRgKql1flu9fVPIsS0kG6SlW?=
 =?us-ascii?Q?6VlEen/LYqLGe0ff58KUUGsgtgeW7NC+QaRxUSW0TbjODqq8toOC3WWzFbim?=
 =?us-ascii?Q?/em8JWG0pEC6ZQo/Nl0pOiV/iNa1rhC9jLU3wbcnMUTcUsZ+qvP/Pg7QC/zd?=
 =?us-ascii?Q?N4lnSjBQH4oTSH0KUFvjgVb69MyARG/nxFqwHGqstlQ69eAwtQn15FtF/T0V?=
 =?us-ascii?Q?5PTktXguZdMwqQVMnJpk/PIwfGMxheLDWzMFd70gVwWtSVgibg/Fw7PyQuMc?=
 =?us-ascii?Q?hQhe9FVLGhi/k3q7o/JtRa7o51wzYKDT644ZDoSFTDz5Wo4Jz+mRyPVPJ9vd?=
 =?us-ascii?Q?BhEPIXuE+c3gYeYxsQTTVWVyULRXUCFWlmMx38OcWv7Ks7NFCZMXz8zgIGRE?=
 =?us-ascii?Q?NJ9tuDjLDSe1CTE5JCKl8fqqiKke85Dm0yCwan4W3fdKm2NxqgRNdTMP2Y98?=
 =?us-ascii?Q?lxvCHQ929elR1i213YXbrA8pMqpLllHaR3bemGVJMRcj/Tk3fa/XHKJjCI6u?=
 =?us-ascii?Q?l7ljnllAbTCPA38a01THmRSLWlt17Xjnxrx3FgMVjo2LBmNyPe1rDA87OWAH?=
 =?us-ascii?Q?wBANbPJWz0nFOrcSIG0dkRDhLQQ27KIMXXYAKPU7LuLjoYHeggM+i1u3cQXW?=
 =?us-ascii?Q?ThUo60TwTt6rd/WBuFNpVXx9phl4vgZJnihBz/o2aVut1WIOWVRJbwX5MbIW?=
 =?us-ascii?Q?VtjnSESzNUDzvGN6Vy/h6DvK2CoQlyVmeZi83K+/D+2iqtJLpbFZl1Ug58QK?=
 =?us-ascii?Q?CkMBr1G3ELBycHbFGukfd0/JFCAHTuCGuElZiw4QgZRZWvP+Pl/gNumkFFDo?=
 =?us-ascii?Q?8H7W9ZHqc2tpkVdDU7E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0e742c-2b48-4c52-11d0-08dda76ae001
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:32:42.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEc3+nQN4FlP8jib8H5DRbUDrmDB6QZQEuigkMXDbneexDYFw1z4kRLW3kiUl/Yh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977

On 9 Jun 2025, at 10:11, Usama Arif wrote:

> On 09/06/2025 14:19, Zi Yan wrote:
>> On 9 Jun 2025, at 7:13, Usama Arif wrote:
>>
>>> On 06/06/2025 17:10, Zi Yan wrote:
>>>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>>>>
>>>>> On 06/06/2025 16:18, Zi Yan wrote:
>>>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>>>>
>>>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hen=
ce the
>>>>>>> watermarks are evaluated to extremely high values, for e.g. a ser=
ver with
>>>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with t=
he rest
>>>>>>> of the sizes set to never, the min, low and high watermarks evalu=
ate to
>>>>>>> 11.2G, 14G and 16.8G respectively.
>>>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M TH=
P hugepage
>>>>>>> size set to madvise, the min, low and high watermarks evaluate to=
 86M, 566M
>>>>>>> and 1G respectively.
>>>>>>> This is because set_recommended_min_free_kbytes is designed for P=
MD
>>>>>>> hugepages (pageblock_order =3D min(HPAGE_PMD_ORDER, PAGE_BLOCK_OR=
DER)).
>>>>>>> Such high watermark values can cause performance and latency issu=
es in
>>>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, =
eventhough
>>>>>>> most of them would never actually use a 512M PMD THP.
>>>>>>>
>>>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the high=
est large
>>>>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>>>>> With this patch, when only 2M THP hugepage size is set to madvise=
 for the
>>>>>>> same machine with 64K page size, with the rest of the sizes set t=
o never,
>>>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G=

>>>>>>> respectively. When 512M THP hugepage size is set to madvise for t=
he same
>>>>>>> machine with 64K page size, the min, low and high watermarks eval=
uate to
>>>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch=
=2E
>>>>>>
>>>>>> Getting pageblock_order involved here might be confusing. I think =
you just
>>>>>> want to adjust min, low and high watermarks to reasonable values.
>>>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages=
_per_zone
>>>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, th=
e changes
>>>>>> look reasonable to me.
>>>>>
>>>>> Hi Zi,
>>>>>
>>>>> Thanks for the review!
>>>>>
>>>>> I forgot to change it in another place, sorry about that! So can't =
move
>>>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>>>>> Have added the additional place where min_thp_pageblock_nr_pages() =
is called
>>>>> as a fixlet here:
>>>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gm=
ail.com/
>>>>>
>>>>> I think atleast in this context the orginal name pageblock_nr_pages=
 isn't
>>>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>>>>> The new name min_thp_pageblock_nr_pages is also not really good, so=
 happy
>>>>> to change it to something appropriate.
>>>>
>>>> Got it. pageblock is the defragmentation granularity. If user only w=
ants
>>>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
>>>> kernel will defragment at 512MB granularity, which might not be effi=
cient.
>>>> Maybe make pageblock_order a boot time parameter?
>>>>
>>>> In addition, we are mixing two things together:
>>>> 1. min, low, and high watermarks: they affect when memory reclaim an=
d compaction
>>>>    will be triggered;
>>>> 2. pageblock order: it is the granularity of defragmentation for cre=
ating
>>>>    mTHP/THP.
>>>>
>>>> In your use case, you want to lower watermarks, right? Considering w=
hat you
>>>> said below, I wonder if we want a way of enforcing vm.min_free_kbyte=
s,
>>>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestio=
n
>>>> is lame, sorry).
>>>>
>>>> I think for 2, we might want to decouple pageblock order from defrag=
mentation
>>>> granularity.
>>>>
>>>
>>> This is a good point. I only did it for the watermarks in the RFC, bu=
t there
>>> is no reason that the defrag granularity is done in 512M chunks and i=
s probably
>>> very inefficient to do so?
>>>
>>> Instead of replacing the pageblock_nr_pages for just set_recommended_=
min_free_kbytes,
>>> maybe we just need to change the definition of pageblock_order in [1]=
 to take into
>>> account the highest large folio order enabled instead of HPAGE_PMD_OR=
DER?
>>
>> Ideally, yes. But pageblock migratetypes are stored in a fixed size ar=
ray
>> determined by pageblock_order at boot time (see usemap_size() in mm/mm=
_init.c).
>> Changing pageblock_order at runtime means we will need to resize pageb=
lock
>> migratetypes array, which is a little unrealistic. In a system with GB=
s or TBs
>> memory, reducing pageblock_order by 1 means doubling pageblock migrate=
types
>> array and replicating one pageblock migratetypes to two; increasing pa=
geblock
>> order by 1 means halving the array and splitting a pageblock into two.=

>> The former, if memory is enough, might be easy, but the latter is a li=
ttle
>> involved, since for a pageblock with both movable and unmovable pages,=

>> you will need to check all pages to decide the migratetypes of the aft=
er-split
>> pageblocks to make sure pageblock migratetype matches the pages inside=
 that
>> pageblock.
>>
>
> Thanks for explaining this so well and the code pointer!
>
> Yeah it doesnt seem reasonable to change the size of pageblock_flags at=
 runtime.

Sure. :)

>>
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pag=
eblock-flags.h#L50
>>>
>>> I really want to avoid coming up with a solution that requires changi=
ng a Kconfig or needs
>>> kernel commandline to change. It would mean a reboot whenever a diffe=
rent workload
>>> runs on a server that works optimally with a different THP size, and =
that would make
>>> workload orchestration a nightmare.
>>>
>>
>> As I said above, changing pageblock order at runtime might not be easy=
=2E But
>> changing defragmentation granularity should be fine, since it just cha=
nges
>> the range of memory compaction. That is the reason of my proposal,
>> decoupling pageblock order from defragmentation granularity. We probab=
ly
>> need to do some experiments to see the impact of the decoupling, as I
>> imagine defragmenting a range smaller than pageblock order is fine, bu=
t
>> defragmenting a range larger than pageblock order might cause issues
>> if there is any unmovable pageblock within that range. Since it is ver=
y likely
>> unmovable pages reside in an unmovable pageblock and lead to a defragm=
entation
>> failure.
>>
>>
>
> I saw you mentioned of a proposal to decouple pageblock order from defr=
ag granularity
> in one of the other replies as well, just wanted to check if there was =
anything you had
> sent in lore in terms of proposal or RFC that I could look at.

Not at the moment. I only discussed this with David recently at LSFMM.

>
> So I guess the question is what should be the next step? The following =
has been discussed:
>
> - Changing pageblock_order at runtime: This seems unreasonable after Zi=
's explanation above
>   and might have unintended consequences if done at runtime, so a no go=
?

We can try making pageblock_order a boot time variable. At least setting =
it
to 2MB could lower the watermarks and at least 2MB mTHP would work. If us=
er
wants 512MB THP, they should be warned about the watermark issue and
change pageblock_order on their own.

> - Decouple only watermark calculation and defrag granularity from pageb=
lock order (also from Zi).
>   The decoupling can be done separately. Watermark calculation can be d=
ecoupled using the
>   approach taken in this RFC. Although max order used by pagecache need=
s to be addressed.

In terms of watermark calculation, I wonder if we can disable mTHP/THP or=
ders
that are impossible to create due to low watermarks (as I mentioned to Lo=
renzo
in another email). So that kernel will not waste time on creating these
mTHP/THPs.

Best Regards,
Yan, Zi
