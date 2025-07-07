Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0218BBAE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 05:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866120; cv=fail; b=SA/s+bLQy/cyrW4a2QldURO1BAIPhccXiDS8e2MatW3RHLd3ysD3MYgrktgo7T+zaPNbMqar4XH55c/CoV8X+aNE6w3hYFgojH7KNWH5f5NsFQTu1tY7/w5q4gzNDxOIgsaMEqIJJYflucjB8OWH575jkNtZDUf4gT+Zi1/BZJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866120; c=relaxed/simple;
	bh=65LCQ8BqSD0FNxJDQ0DOf78qM0ABqW89kt3PATqaemw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W1YuhFqQu7FHYCFzSPPfC5YXpkthQdZN0d/PKoECedSFEzLuuUDhmrw+IRNQ+h29uGYKvnZPE0d3EvD/SEYNRSl1t4RvR+ghaLalGOFsY5JSEUyx20QiZk3HgdeXXnS0KOEpma2q+Wrof6yppogKDoJW6js43iXQQeXn0P40EsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LgtoWNEd reason="signature verification failed"; arc=fail smtp.client-ip=40.107.96.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LgtoWNEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZtf1NwpglQSlXO3wh3De7odNYVicI8hUqBiehRE6oHDRGdwGW982eLO+FfG2637n0/sZO9ezUUW5pfMDm1ms5ul06Vwtm6Jp4be8ON1Qpy7/IeOB3q4/FzMznOGXDlnERqqE3GzSjHfRPxCXmGoFpjsBrMvA5S8FRSGbwA6B5n7FdsOeC7HidTOjR6AvqJykQVmcgh3xpUkwNQ1D7olrdK8WPseNMYWAnVX0QBRWl0ow4PwKjt2RV/hLgdpfIHGpYU+9MekYbHuz2GsklTqGYyAuuDDsrRH6CYWDr9F69eg1tJc9hCtswtK/sCk8HAN7H4I6y52Gd6ReDf1iJPcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRVu2/2VTOfDNclvFsJ/oVQwSc3bDxFxilInfWqhKf8=;
 b=c5ZwU9FT+LHDEcAQo5834qxiimYYsdj/mRBunih2n7wPee+x5+mT52+lRsDnTAOPxKcre1S+tn8p4abInJMKFwwktLx38PmNofv7b6Dntzo0hdK2mznrPtPPZf2SnggIEsxOahn8aXDXmF6tTzEDW7+49J/jL/bK/oLQO3OKQB4YOzYz39qXlHJQYcPrasrptJbWWY3k1fQ/K1HYTv4VfztLg0pG8xLd6UKCqbqUK8+WQkVFoWF55SK+QZeucYVlcTHOLfYlpkZYFemNe6u33nhndV121RgEMTYPlBTenXUtBCzusM5YMn0xovd4genRONLc/Os8RYrxYBBKf5sbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRVu2/2VTOfDNclvFsJ/oVQwSc3bDxFxilInfWqhKf8=;
 b=LgtoWNEdiGvaO0jxVmtInq42q1q12J3EgP1m4Xsp0mfYerGBnz3UFJ2Ud0Ly/D4aMnNiijUpPk/jyBkTA9Z4r100Iz41xv83ASW9mD7Fl/azeLO2cBXqzPep5yoadTEPjX8+wpcpspyOiuCojdN9xDo+OOChrIaNrgFD40pTZpc/dsxVHK60bUKMbkJR+FxwPz8SN0tYrH0AsKkFuG7K84krfoG9U+8hFxsso/QN7n5wEtq7oQNyft09SJACnxd6e18TkzcQoDTsW+oqCUOjQyw0PIBAveFjq2gq+pcJ1G+0Do5xY8GKzpgtOTdsBHCrkmk4v+CRg8dRlHij3lUNRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPF68E8581EB.namprd12.prod.outlook.com (2603:10b6:61f:fc00::611) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 7 Jul
 2025 05:28:35 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 05:28:34 +0000
Date: Mon, 7 Jul 2025 15:28:29 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 01/12] mm/zone_device: support large zone device
 private folios
Message-ID: <2lhuidibe4vn2wvoswvf5s35s6yv5iflgkwo7c6q6uvy3khe3a@qsunrew5l4re>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-2-balbirs@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703233511.2028395-2-balbirs@nvidia.com>
X-ClientProxiedBy: CH0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:610:b1::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPF68E8581EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e564c69-261f-4f51-d180-08ddbd171dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?66NY9LSph7xTUD61bL0AlrZ7UUiFEEF5RqD0n8iOkq2acXUu7jFRf/SjNW?=
 =?iso-8859-1?Q?4N6ncY2T9Wiqbi0xS2S/zFiBIoKugrqI3UoSUQvzY1FIUMEUihyt9NP6qy?=
 =?iso-8859-1?Q?CXhaaKa0mKg34xWHiIhFr6bY+Hy3NJn/OvmKQ9ADZG5jKKMWLOfK9c8iC3?=
 =?iso-8859-1?Q?XecI8oLGcjilT3WREO/b/sD+C6InNZp7TEcqWO1LUtMNv0mCEBZT0dsCzD?=
 =?iso-8859-1?Q?x/xgvjLN/LqJZsQVZzLjNUQ8e/uI9QCJ0orxXEvkHSBrERkBkbNdYSPPZf?=
 =?iso-8859-1?Q?UH/lbYRYDYoG0PhM6zWynD0pV2vP3SYrDn2zJ81rp6+t2Wk8JkKwNMtocK?=
 =?iso-8859-1?Q?7aI/qjregNd5cZbNOqioHij9P83krZiOzdmnwj4lTY2goEgi6kQ418fci3?=
 =?iso-8859-1?Q?XLS034jr6QPyVXtxmr3oEn2KRnyM+tjLKIJkGEmi8hNsLyJ5VOdeJI4in2?=
 =?iso-8859-1?Q?Z+azF6s+1rHribMSuwo/iZaH2u5TPShz8xEfPP4lqapqomtjlSVB2UYnN6?=
 =?iso-8859-1?Q?4ZnTL0U4QhHOu+m1O8bkhca0BvfGYbCev4MLw3P5uLTMIu1PBfFXCIgnuY?=
 =?iso-8859-1?Q?hcNyP9uD9+7WvBAKLd+8sWLvufLGHJmm6ZpP6lKyaMRRoJfowOenIFfvjZ?=
 =?iso-8859-1?Q?67sBvkoCyu4ISmjd4y6wN7E8NaHqW7TqexKnkVAwzQmgF+zSKVYAYq0aqD?=
 =?iso-8859-1?Q?hs64aznTl/0IN0dmYqBwlwmHl98G+PQe3g+PiLhSFSQOBqoB+xBN2Hhs42?=
 =?iso-8859-1?Q?2buVo1g3/umgVMougvzMM1mmjFjHdB5brDLYCDK1sI36p781VVVFAICUmN?=
 =?iso-8859-1?Q?qOdOX1je4km8FL220tK/5OdqBUq0REgDbjK4LcSSCVlor6UCS6txk6z7Jt?=
 =?iso-8859-1?Q?AqLLDpf+dzWoafVWwFRd3RBB5ZWbKR0b6YVlJOPsFiP/3ouEpaZtRjdA4h?=
 =?iso-8859-1?Q?u7QLNmSRnXj/dQLDoLvIfAAOaDH3uFD17bDniZ3BSlkfSo76WYaAZYUpgT?=
 =?iso-8859-1?Q?CBO0Kg5BW04b4yMxz/jOgzXD67WXDYdt6fhxxN1YYQpB4L+F3phAX9vRU7?=
 =?iso-8859-1?Q?TRR3K0Em8xApgV0cGz43ZFLx+u2HLayo1vSdZNeQv0CMRV1+RwhNrEktIq?=
 =?iso-8859-1?Q?ti/I06ZmlIAPYSJ7flL251qzPqy6lxDWVjDl+83iypnzeSpBlvVFQnUr1k?=
 =?iso-8859-1?Q?hdRYGMf7RLgsCuvxMxa6iXqL0ydZAjz+2EZv4ikqmyn1c7t4NiyDG82+1z?=
 =?iso-8859-1?Q?ob4YM5F/62Q213oVSwnPalVbrO+Uue/iwexftpdcCBB8uBtIfssYE64hq5?=
 =?iso-8859-1?Q?JhbeNBcF/nSTNv9ZNJipO4ebYQ18bTNE8ydZGMW68RpGaKpieUN/wYVlwd?=
 =?iso-8859-1?Q?ybJ1Ft61kI7B+P1n/4vJS24O2T8Xnz59/CUniOpnpshV7nOMlHAT6ugq3m?=
 =?iso-8859-1?Q?WBf1A2TJK9EXXo/i+2a1jC2fCbjZwf8Cm2QfShuXxqb73/kDXUCCYRhuCM?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7O2XcXvy7BGzO1MWF5sOmHGcRTGyi50urtcEZcYP94j7RKzT3/tN34zGaB?=
 =?iso-8859-1?Q?fk4LaRsnMLzG6BvRDY9V4TTj1N4KFnh0fCDm51Na9gjjqfznUJLX7wtznd?=
 =?iso-8859-1?Q?iCSVS6FhWvVF4iZULkmQzv3V0LYUrybdyUCHERQZbHgluWCGgANAxXgqmk?=
 =?iso-8859-1?Q?ukkYoNsHs//ejJggmdGP0PZqrWAZGi808nOQ3nz/RSmD6PnEiZUdLvDxhF?=
 =?iso-8859-1?Q?l4MK7A0zCJzMTs5chcGnEsysncYUt/1tHgq5ba61Ptw3HlxW0kc1r0OJHJ?=
 =?iso-8859-1?Q?eTbSKaDQJ0vUJ9VOdzqshVu3K/0rF6La64FgpXVFR7u+X/ZyJQyRDwZieJ?=
 =?iso-8859-1?Q?Vq9H5gT/E7feuDtP+ffwRaqU2Yo/ib9cYzcfXPy05bzlulQNM1hxBBlVrh?=
 =?iso-8859-1?Q?gzh8ScOLXNxODQAz7sRaONEG33Ujn6yxDUvhV/FDFB3Zv+bBJO/rfPIZz3?=
 =?iso-8859-1?Q?sEEbDFIvuKjzpf1czByTK88qbDyhi/pzq/9XuCv+NR0bl7xZaCb9SBBmjd?=
 =?iso-8859-1?Q?wIy7+AAAEWIJB+b3TPLj4Z5iVwk/AyrPfo7+AEhfREk0xism54rbaa985u?=
 =?iso-8859-1?Q?ynMjOlQFl00eh3FxU8G0y6EfK38qn5ro7fsYDXz2Opc08CbeCUcC97xJ//?=
 =?iso-8859-1?Q?0P1W4B+65AoXzKmIsxtgnDtGyt//nriJUImPFVnScgUGP46lz/qeExSmtT?=
 =?iso-8859-1?Q?NtNsyHGiycqesEJndpi9spSMNMizKK0h7RkKcGXDslrd47RZtK4IU39wUC?=
 =?iso-8859-1?Q?Km1kt3ml0P7PpkXTKqXBv/HlE5CO1Q2C5upZTMqtmdJ55no9TYdtJ/AvPC?=
 =?iso-8859-1?Q?D6Ou7gj09EYJPRMx/1WOdoll1vuI3t2ObW1AbR+Oh7NfFAmmeWERfiadlA?=
 =?iso-8859-1?Q?Y5eUjiMIIYsiUaT+kmSmYaDBrjJB3eC3K6DcRy8JEZEn2dQtv5MBdTuVUc?=
 =?iso-8859-1?Q?DKIg3g8p20x/LS0743LjYJ4P6nTysPpuKrEAQqSw4IahVhjSA5KoMjshkq?=
 =?iso-8859-1?Q?R/gjuKlBYstlP4Tb9TyrhE/1f5vbJwkN7xIXSX8Pag+GTf9b4yQtItJis5?=
 =?iso-8859-1?Q?qcK+nseYW7rhibNqRnzpa7RRsqJwwMxX6NZMVRysvw8r7/94Mo/XsPcz2y?=
 =?iso-8859-1?Q?p3dnsWitpbtgRIouxu28sugP4k14vfoI8/vrHatqiBQX5lApt/3ACIzapk?=
 =?iso-8859-1?Q?jXlJFipqwDzE0O8V+swIxAcJhosihiRK7Azx5LyNSHFjwTyWbqzMzX4cDP?=
 =?iso-8859-1?Q?fnZrfNWGpJ1PcN2pH6SaH+TWtAHRcnDrBrC7RgD9EdEGvcWY7qmRgWUQ+w?=
 =?iso-8859-1?Q?LIOakHcXFnw3XPQ9ohO/kSQAMuba5fkfdKnBuwYaDEco5ZmwZJ65Msk1wQ?=
 =?iso-8859-1?Q?2hXyXW8JvNx1QBB+K5riPNVxSoVyB/K9KLl6tHFEuW+O9+T5qIUt9i+0Iq?=
 =?iso-8859-1?Q?f9cze8OSKtS1hRsjbukoKA2g3tmkTUYqPhPP4EhSd5T04zz0PjJrNmmuHU?=
 =?iso-8859-1?Q?hmKWV8GpFn+0aDO00ujVlBrPm1P/as0OwBEKNI+XoBZ8r6vKQJRB0E9Eac?=
 =?iso-8859-1?Q?H8VYf7UpbPhU33nXjZ5bv5v4aNYG9C03LjWTo/XW16JkJNYL7WqU0r4qkX?=
 =?iso-8859-1?Q?uTvjyiqJkdZ0u8OHXG2nTnfHjUNV5BooA4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e564c69-261f-4f51-d180-08ddbd171dd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:28:34.3929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rl1as8+xNcCfMLoF972OSuZGToYKgJsUi7X68fq63Lu3ywmveJ1jsj+P37s+D97aDHiFHva/r0GtoComSmIGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF68E8581EB

On Fri, Jul 04, 2025 at 09:35:00AM +1000, Balbir Singh wrote:
> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
> 
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/memremap.h | 22 +++++++++++++++++-
>  mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
>  2 files changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4aa151914eab..11d586dd8ef1 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
>  	return is_device_private_page(&folio->page);
>  }
>  
> +static inline void *folio_zone_device_data(const struct folio *folio)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	return folio->page.zone_device_data;
> +}
> +
> +static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	folio->page.zone_device_data = data;
> +}
> +
>  static inline bool is_pci_p2pdma_page(const struct page *page)
>  {
>  	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> @@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page);
> +void init_zone_device_folio(struct folio *folio, unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>  
>  unsigned long memremap_compat_align(void);
> +
> +static inline void zone_device_page_init(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	init_zone_device_folio(folio, 0);

Minor nit, but why not call this zone_device_folio_init() to keep the naming
consistent with zone_device_page_init()?

> +}
> +
>  #else
>  static inline void *devm_memremap_pages(struct device *dev,
>  		struct dev_pagemap *pgmap)
> diff --git a/mm/memremap.c b/mm/memremap.c
> index b0ce0d8254bd..4085a3893e64 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -427,20 +427,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_zone_device_folio(struct folio *folio)
>  {
>  	struct dev_pagemap *pgmap = folio->pgmap;
> +	unsigned int nr = folio_nr_pages(folio);
> +	int i;
> +	bool anon = folio_test_anon(folio);
> +	struct page *page = folio_page(folio, 0);
>  
>  	if (WARN_ON_ONCE(!pgmap))
>  		return;
>  
>  	mem_cgroup_uncharge(folio);
>  
> -	/*
> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> -	 * and we could PTE-map them similar to THP, we'd have to clear
> -	 * PG_anon_exclusive on all tail pages.
> -	 */
> -	if (folio_test_anon(folio)) {
> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> +	WARN_ON_ONCE(folio_test_large(folio) && !anon);
> +
> +	for (i = 0; i < nr; i++) {

The above comment says we should do this for all tail pages, but this appears to
do it for the head page as well. Is there a particular reason for that?

> +		if (anon)
> +			__ClearPageAnonExclusive(folio_page(folio, i));
>  	}
>  
>  	/*
> @@ -464,10 +465,19 @@ void free_zone_device_folio(struct folio *folio)
>  
>  	switch (pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +		if (folio_test_large(folio)) {
> +			folio_unqueue_deferred_split(folio);
> +
> +			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
> +		}
> +		pgmap->ops->page_free(page);
> +		put_dev_pagemap(pgmap);

Why is this needed/added, and where is the associated get_dev_pagemap()? Note
that the whole {get|put}_dev_pagemap() thing is basically unused now. Which
reminds me I should send a patch to remove it.

> +		page->mapping = NULL;
> +		break;
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>  			break;
> -		pgmap->ops->page_free(folio_page(folio, 0));
> +		pgmap->ops->page_free(page);
>  		put_dev_pagemap(pgmap);
>  		break;
>  
> @@ -491,14 +501,28 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page)
> +void init_zone_device_folio(struct folio *folio, unsigned int order)

See above for some bike-shedding on the name.

>  {
> +	struct page *page = folio_page(folio, 0);
> +
> +	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
> +
> +	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
>  	 */
> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> -	set_page_count(page, 1);
> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> +	folio_set_count(folio, 1);
>  	lock_page(page);
> +
> +	/*
> +	 * Only PMD level migration is supported for THP migration
> +	 */
> +	if (order > 1) {
> +		prep_compound_page(page, order);

Shouldn't this happen for order > 0 not 1? What about calling
INIT_LIST_HEAD(&folio->_deferred_list)? Last time I looked prep_compound_page()
didn't do that and I see above you are calling folio_unqueue_deferred_split() so
I assume you need to do this for DEVICE_PRIVATE pages too.

> +		folio_set_large_rmappable(folio);
> +	}
>  }
> -EXPORT_SYMBOL_GPL(zone_device_page_init);
> +EXPORT_SYMBOL_GPL(init_zone_device_folio);
> -- 
> 2.49.0
> 
