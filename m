Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93826B2D5;
	Wed,  9 Apr 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216127; cv=fail; b=J7zlrvcfMU/vWoZolh36LrzbX0f823vsEiYQiPVK2XQo/nEsNYpXpw8vvjDM0XrjeUXAUaB3JmSuPeGETQ9/h74DOqVX/lXxA08BS3Rwh/mOV++Hj7FvzLmUzcqrTCY7ThLuqbZzBEjFwV2/vbikD9kF2/GZGbC5gZJhNpSiE2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216127; c=relaxed/simple;
	bh=R0l8HQVG3Sy6exOAPrqqgdmvs1xtSYI05eEiozZtGrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cFzlX1tVkCwEDHzZyYV8uDkaRt0jzLMHDkW/g4nSB/7GLshN0jF1TSajnhHy4rKPXep9uk8lNwcJnaauEdCxLOpHzgRbqs2/gnXiHNkQYB6pOcthpT9WQ+bZvEGczA8gNLaCghSNC0ubzr2kkq8BQSluys+Qz+k6Ueeco3/0FkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YzJ7DsZn; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YzJ7DsZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doci5hV+H+/S7P7ULwiYUobGRvYG5r7NUZeIxsRUb+m5cZsqf++Ps/7K1vRiqYr1psGUI3cTkze1cRIfvrciy0UhBmCBNGDw5poNiSYuNMROcg067U7irfUlw252BTolBWrj27mJPEpAW5bk61hyG4FIvGEPHDfGZEaTWUgPeVdpMpe2JSfr+KS1HhUbAFzkriLzERl4o+4TGANvteNw6Om9P/15ofTCgNwh8exzD6mcKEAd9lG2m4b2Yc1jZifp/0QCntGPpCBHdwHqQg4D1mbUve96TseoMIUqRi9bbgEc77u1FhCYM+UNZzrzouLIviaO/wK6y8QaMp8BN6agHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TgaLNueXKrQeZ5VhRepA+jJUjF1dv6EPUmQblRWkv8=;
 b=OJgEPyDHHkJP2QqFkqQ+VvBa+Z9uwPYLNxYnjLriB6uyozIMK3ItoO/t43VpQwu8rlZp6iWA8RWn/jOKs1gxsdOTeSo5eaR1OHK1EPHZ/bzkdAfh7Dkugd00pJUkuoTYT4se8lz9sIMiwUZsiPU7VprCbF+3QO/iVB9gr5FU9BGj0X2i3Ur3rNVuDTT61OWXZqBWlCrO5iBQTV7M8T3AkTuuX43G6pOsyDH0LeUt+MHXB3FCGQ2IM5DLwLjXBCDjgdRgRHX/fLHckGSyfGeYa3C4DZpIT7revVQ24MdZYsXrBz4MmvjYQNs6WKIMyzeDc7eNGOQG+XZ2yO7ByyL7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TgaLNueXKrQeZ5VhRepA+jJUjF1dv6EPUmQblRWkv8=;
 b=YzJ7DsZn7lXw9TUEVbwR6ZXclpl2k1ijr4NsgMC8C/Fi133ZvlobwvuNaMGEO27TPxzHUitH66AE5xUHUvUaqzMd07+DukPvmnK0SOHgpG/D/WdMKW1dwJUrR+YLbr5A2xG/4xBDVYHoW13ONIk0UOvhvT0xeLo1O7BGRW2gPHUUKoLH26cQf3hhD4jAnko7NkBz43v03JGS2UDCevsqFSk05hnLbj2PUw1pjcnYSkTckSmCM9n0chFPyEC3rQsmSegzJ+tetw2uWjURpqrubRsm4otS7wDQUX9xz5Wj4LAEBTtzP0msj1d0PHKZF/Q0xbjP0qJSwFsVR00f8y6cHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 16:28:38 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 16:28:38 +0000
Date: Wed, 9 Apr 2025 13:28:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <20250409162837.GN1778492@nvidia.com>
References: <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
 <Z_Z8-BLWMkiWpaDY@kernel.org>
 <20250409153714.GK1778492@nvidia.com>
 <Z_aeEn7hKqGOG3Cf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_aeEn7hKqGOG3Cf@kernel.org>
X-ClientProxiedBy: BL1PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 806f2467-9e78-4f91-caaf-08dd778394f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yd0A62UsT8FX09JRjKDeSo5A06OPT4bdHh0nY0ZfaRjtyNy7HNGYXE2fh0xX?=
 =?us-ascii?Q?6uM2fpq8h8c6JIXzSGCBQLfm/8bBmJqahcQKh4kXm37o1aGjbWcjGIebBDGT?=
 =?us-ascii?Q?bS1cVH7YepQQl2YSxW6XxGFwUo2GvzyPrLY5pu9t8IoGewSmttPO9jLIBTy9?=
 =?us-ascii?Q?AEtNj0c0qQHsZFivM0sfLcKYjR1GyzPdpEtTWPvtxJC/mHtpnbfpgJfTqAFf?=
 =?us-ascii?Q?2YyzzS9OzGnsFPQCTP+TkJtvRzZigmwKt4wpxCM4ZyF9AQnaRcAWFG3fcDUx?=
 =?us-ascii?Q?yNLp0mqfalZv+9qEEl+0FVhvP2JeIBGr24VmGJ7s3uCPj7KCzb010G5kD1b4?=
 =?us-ascii?Q?ZFx/q5ZJGgcEi7GDAXHdJVrIpwDUDOpXHkPodQAoVpu4jf/+Jb6HCZK5fvH8?=
 =?us-ascii?Q?MJ9xHGHPziwl9gVfT7DWgZCPDQqzSC4/L3ITGGAXTFLNBbJ75rIAO6WpawFY?=
 =?us-ascii?Q?TYk1D/8rbp/sqguh2wwdEsHcQziBWUNH23TCdQWpSw5JoRHykgo5T6FZxeaM?=
 =?us-ascii?Q?7cgS2RbmL5RTVJTpBql1BSAllqDuy4R6BSXeVSk3qo3xelx6f++ovSOcFwpK?=
 =?us-ascii?Q?7pIFs+BKGTFQH1R+pJTDmU6mcDQQrg3/ThHVofD5nNmWTDhhtI7vk45RhTWP?=
 =?us-ascii?Q?H+s3MogmWlDOZHFiWtjGrwsCd3BDSrViD9wtnYIyuTak06HTP7QemnuETFVR?=
 =?us-ascii?Q?1f2qfBU2Mf+NJj9Aj4QPT2x0s59h30WyI1njFDU7nnET8fbUBCHqNJBkL9yG?=
 =?us-ascii?Q?GgSYGIKE8wQ7WkygxFGNOWW9yKlUyVigSG9Y6q7WjUF2yjuFdyOB5dz17ALn?=
 =?us-ascii?Q?ibj7tVbagIbA3x1fOwRZxmy91mLdZ59QSOXNFpbhr/5wyp5cVQ1FJ0thxAwG?=
 =?us-ascii?Q?iJIj+DktceOtS8pAjFjPl3TTrJumgNZabANDGZr/tmHXLXEnaSqei5PW8c6i?=
 =?us-ascii?Q?dCxUTz5rABuESFZVKmmA7ebewRniMzxa6Puy+kZsHwVH1XfCSV+9JiczqK8K?=
 =?us-ascii?Q?EwLk0yVjorSv/R5+UwnI1ZbVeG6AKtRZXyRwmUuqYtHxu2CMdstGM7SK+k7x?=
 =?us-ascii?Q?KQ1TIrJyJk0k6mcmUJHr04YQOkK5y7zgxq0WedJ9UYDGRpUZwRIHMF4ycx+f?=
 =?us-ascii?Q?l5HxJgEMU/4o+ibbW7XGDRv5LH8tIq+bc9wRmFmDO6GgEM3nhthTPhzmLgYj?=
 =?us-ascii?Q?AG/Pk5D91VBgrVS0O4RdVRJ18U97LYBrxNy+V5AVs+V8AHbQ5eoEKs4nhNZW?=
 =?us-ascii?Q?dWnGMJ6/dvODprO2tbFfsgjatvK5jaiguu8ppGtx+HVamQod3bk42lAXVL8T?=
 =?us-ascii?Q?/K5XcfCxmfSvTUo6ILxS3hEk9C7anlLpWhyBM43V8YlQ+FuJ60ilYxmi/kEB?=
 =?us-ascii?Q?J+RrXHEkUVYfsepo/gU86jTWuVtt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uF7Eji2dbT4V9W5iGGRpzT6AbtN/rgGs+8CuzMwV8o+28L1Wau5Gn5/xl501?=
 =?us-ascii?Q?sXuBSlStmPKIMsa6Uxtry67UfCRzA0RylN2RpbToAX4kI88SMnKVM5Jel3FJ?=
 =?us-ascii?Q?dIWgaUk4XQZIeqG3qpVEMEeCfEb7ol3Y22Xon1iyl16ALxyvkhl0e4Oqeibi?=
 =?us-ascii?Q?ZNTA+JJBQdbC5YptA0UvQ0DCbzRGmbIck4h+5f3HMHikttQTdQf2iFNQlG7B?=
 =?us-ascii?Q?hmQuaUzUNLw016vqqE502Ua+plR/P0eqXL7k+yxkSNo8g8z+i388lPBajDTh?=
 =?us-ascii?Q?N18TSk+L6m8GLkhU96GSSm8zkhnSQ5402MDW0YQfnt3a7BZoKJrwbwuqlpq7?=
 =?us-ascii?Q?wznI4834ski9inV8uOxaWBA4JqxAmsQ30tuMmtg6kCsgvOIDwP5iXfoXwGFE?=
 =?us-ascii?Q?OBuroI69sWY/C/LuXxL86ULLChiEouP7ek6U/DaOGz5IXeHZihCCReMe5P0M?=
 =?us-ascii?Q?ylp/EFhzMTl24MUJWMuBUJMMD7uiYwB9zopzq9dx8TYJ3pwidgNsHNQNT0Yp?=
 =?us-ascii?Q?lD7Eg8C0D49cafKcn9tlivEFSCLDEfTmUXYYqFNchGibSPyeY0ZLnYTt09mr?=
 =?us-ascii?Q?MflsVsJfN6bJeMxEFeWNIZModz4tPci5Qrh+Xzj50VCY4NgWMV7ia0CR/lGw?=
 =?us-ascii?Q?Is5cofyFbr5uKjPAaTnGGTvrO3x5tOUteHozMpSTKu8l1IW5zizPPwMbhXvC?=
 =?us-ascii?Q?DZRDSqYv/+WP0s/Q6jmxj1yL4dCCkpR2mZ/uMgdmCwSq4aF6PpUrqZmcLoV/?=
 =?us-ascii?Q?xZrXk5cUugYZbd8yBMiB8h9X4kjJYMaspsD9bumgkYE46pqksfZ8+vWA9FaN?=
 =?us-ascii?Q?lDcHZkCar0+6K8yagSgyVHsFWwz27sN7ytCnv3MqU6x47BtTbCIuokMavDIA?=
 =?us-ascii?Q?Cm9Q9QE7r7jzjTmcXLgVcWgWYlWlz70PSGidEWQM0ZKQ9fCfWzqYCXTwCJRL?=
 =?us-ascii?Q?+XTkJ0+ZHFLijgFV7CyEt2ovz8EnoM12PpXrw98BHZbcNRQqiB/S1axzkjA1?=
 =?us-ascii?Q?bpf3L+HDsIdwFXDiRVZRAhJtDdCWY/GrUTlRsDC0x9eS/6aJjHdmEnufcK8k?=
 =?us-ascii?Q?yNYfVS8uiWu9R+y/9AugmYJtLKX4hda2kfuUm8IN/FJ4oT3nVD7rf2Bx5Xvc?=
 =?us-ascii?Q?n9hoANCm6ULMzK/eVwqwhy9witg8iV4sZ5Rmp8RaCLYv5afg+03yh1us2NCC?=
 =?us-ascii?Q?1a/iMfOK/ECEngz9eWwEs5sYnQksA2HNSDqQBf9ByUTuSlS1560xN8/7Q0hD?=
 =?us-ascii?Q?GcgtznWBTWkhp5IlUUK0pWqKed/Kfv6CrTiv/UY5HgGE086ds2UnQ69CCtfl?=
 =?us-ascii?Q?AT6Ago0X1lMOq+SxDG8L7DgjZxtwwXcEjSI3p0wN805fjfuaydHqw00jlmRc?=
 =?us-ascii?Q?ycJkasPTsQfygAOriKfG8YS0MTAvwoBZiY501aD+jBfDr1qc8jNAIkBG6iLS?=
 =?us-ascii?Q?+bH7rEk0ObGgwVfDBkU2ogie2pXVGXwYdz8UiSml/Sd1am2Bcdw6ePrl+xMf?=
 =?us-ascii?Q?Whm/oVBxKz3495dA3WgdH1m1efkyAqmGOCrbj+aj3W7k+bXNT1QCFv47Iko/?=
 =?us-ascii?Q?kkMMtaSh+wySTbMXV4o+/usY1z4/BSLqQglwOgWh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806f2467-9e78-4f91-caaf-08dd778394f1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:28:38.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIgyE+yD8RFyl5KB27rr4ZVvT2uJ304046gNqQsgExjwrS4mVOMlxfLbb7hZW+7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628

On Wed, Apr 09, 2025 at 07:19:30PM +0300, Mike Rapoport wrote:
> On Wed, Apr 09, 2025 at 12:37:14PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 09, 2025 at 04:58:16PM +0300, Mike Rapoport wrote:
> > > >
> > > > I think we still don't really know what will be needed, so I'd stick
> > > > with folio only as that allows building the memfd and a potential slab
> > > > preservation system.
> > > 
> > > void * seems to me much more reasonable than folio one as the starting
> > > point because it allows preserving folios with the right order but it's not
> > > limited to it. 
> > 
> > It would just call kho_preserve_folio() under the covers though.
> 
> How that will work for memblock and 1G pages?

memblock has to do its own thing, it isn't the buddy allocator.

1G pages should be very high order folios

> > It does for vmalloc too, just stop thinking about it as a
> > folio-for-pagecache and instead as an arbitary order handle to buddy
> > allocator memory that will someday be changed to a memdesc :|
> 
> But we have memdesc today, it's struct page.

No, I don't think it is. struct page seems to be turning into
something legacy that indicates the code has not been converted to the
new stuff yet.

> And when the data structure that memdesc points to will be allocated
> separately folios won't make sense for order-0 allocations.

At that point the lowest level allocator function will be allocating
the memdesc along with the struct page. Then folio will become
restricted to only actual folio memdescs and alot of the type punning
should go away. We are not there yet.

> > The lowest allocator primitive returns folios, which can represent any
> > order, and the caller casts to their own memdesc.
> 
> The lowest allocation primitive returns pages. 

Yes, but as I understand things, we should not be calling that
interface in new code because we are trying to make 'struct page' go
away.

Instead you should use the folio interfaces and cast to your own
memdesc, or use an allocator interface that returns void * (ie slab)
and never touch the struct page area.

AFAICT, and I just wrote one of these..

> And I don't think folio will be a lowest primitive buddy returns anytime
> soon if ever.

Maybe not internally, but driver facing, I think it should be true.

Like I just completely purged all struct page from the iommu code:

https://lore.kernel.org/linux-iommu/0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com/

I don't want some weird KHO interface that doesn't align with using
__folio_alloc_node() and folio_put() as the lowest level allocator
interface.

Jason
