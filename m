Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7911217659;
	Wed, 18 Jun 2025 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280313; cv=fail; b=AhASSB1dPnsW731o0xsO2QPzsCjmX/ASZZG0lRsgF+lv8pt1AkVLnqKvhvsXYCL4HzILoSyb+aDGZQWenKd0Ge9gu7mjnKpgj/cX4QMWefLk+MkYpkNmFO/EjNa9yi1HasusUwz8pFcKEIfj90l8qg0gMla/OYgVHlHcERms0Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280313; c=relaxed/simple;
	bh=vaVsep8PWee1v7eW0dO73NJ4UpA7q4RmU/ak4LVlR5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rAtVSWags7PvJJ9MXbipY3QF4vBa8t5KKl1ehyRJx9W9mKiejtVSfEJLxXZFqvS7+Nd784YUvRk8ygko1ZK607pvRB+PkOf+HFfvf36IinaaDQlhFjfFTngBw/sL4sqeWuFlCDL6Kr0ZYW1f7fHuOqh6rJQr/wMClZTq0uptc1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pFCiPVS8; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pFCiPVS8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfb5qkisO57mZq+kKn+MW1baGjVLOTDeNB9fFW3aBvrD5paqc3jxmdQufrwUcoo2KkdpOUZHyuPVloH7f7PHijp/rlNOIR8PWKFYEVkEoc6uBj43h8OJVU4Od1+RuP1pu8Z6FmDePjwbb0C//ID5v9NK7PHBI5vEplfNvWUoT8yxLehLq7EextsI/o1UtO6aIxgivFRM58GRvsjW/zwBIdLqqdGZ+RCC8X//z9evBWmYq5GroiLu4/Ms3n0Vmt+x9yzeQxOUbJuyQM4NYK3qGZ+S+YJABNocsCUUeKLmNDjX8BO2rnizjw1tPDNbDqyZFB/jHdlhv2rYBvkph49UqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUD80gkpvl9RAajYuw8ckpTMHWivOWPywhCCqLichZE=;
 b=wRrpIe71Lw1J2mxKbBl1vLBhMnkaudGd26hzUeKXOgp23aFA/SNXcEfkUCjCkaewqqJz7sY2a51RLqfPQXESsYBZRrwZiiCxk78mWXXmUYkw9eNgP6MNEpjKK4uvaoAT754+rQRNX6+rtbbIxLB83AW/hMuuCy2KhWbmAjLDrwPT4pS54Ta8aC6AObzcOxiEU8ncqqDUBA7bXS/s9lc4lcI/SRijl/WJy1ygeIfSPCbLAqVCsQ8Hnzwy541MPLePG05Y/+Mv7JNKw5fnU87SJM2YybxkD27UB0BHNzX9wyGbNOf4fKpxCb5IETTXz6HtwZJyosesCGpgu4Zj43yG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUD80gkpvl9RAajYuw8ckpTMHWivOWPywhCCqLichZE=;
 b=pFCiPVS8SNFxu5B9bAxTcp+QiTZ1G46tQawZSNiP/+I2puDICczW/B/pZhfG9YnyIoj3vOCLij/rjk5gVIbqa+aVP7zFwJIg9U7/wJJU4GlOz0XP4ihgIenRIOpm/ByBIArOtMcIA6BpgAQ9koYdT2Nfb9+w04XFqXBPg11GPnavifaU/f8rDLPZdAbLzLt7hA3kYdhftFaV4N7RauS7CLg0QE8jKj6l2geYxtY5PCa1VUxkphGqU2vKZLu+biE5wD8f2qfXYVRRawOE4erLtYnnb9C0FpkA09j9S/Upo013Fr6FGnXsx1tO/SUmbw6aRuu2WQbGoDdIwWNKz9QGcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 20:58:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:58:26 +0000
Date: Wed, 18 Jun 2025 16:58:24 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
Message-ID: <20250618205824.GA1682301@joelnvbox>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <aE2P3OBo1Ufjctxy@Mac.home>
 <aE2btHiDP5LRmBTL@Mac.home>
 <aE2d1RdR1-pxurzj@Mac.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE2d1RdR1-pxurzj@Mac.home>
X-ClientProxiedBy: BN9PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:408:ff::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 352bb09e-40ef-4aa8-4dea-08ddaeaadeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ur3yVCNYAeWEYChbdbKGpcYl5M0hxXBI5ZmyK2jpaJrwtuQBaRjwNBOvQuC6?=
 =?us-ascii?Q?Ow0rY7w0DOPp8v0IqJ7pvjqmaPb8qmVFlhHf5Wb2Yr0JIf9oRc9es9qT3Cdp?=
 =?us-ascii?Q?SDb+gil3McSsnefPgKARjCyckHXwv5xAqe5Smyt7JyQrkSOqlBdUtGGyVp8/?=
 =?us-ascii?Q?HMbQ04EDoibwmOhif0V2aAYlK1xyerFkKBCBLEs9BXr6G5KocRCHXHSlD+8W?=
 =?us-ascii?Q?BnkFEgMiGrsPAAFr1y4HfTrHwlMaRYwRjsfcTXNfPWq9T+wj8yS2lgcmA5lW?=
 =?us-ascii?Q?tkzvo3rWiu04LPnAB+5DsCb3k2FqStIbFMscCiPUaLLx/sHU6EI9+zJ/r2js?=
 =?us-ascii?Q?J16X7f1/xNbd/bzlqRajPxXk1B7et92MvPmZt661otIpEeaV7bMBGVRcd5Hx?=
 =?us-ascii?Q?6V79D9mfKA3aMRYORJZ/LB2KCCPtUBXndbEOTymJRAgBvDnDurzH86briWdx?=
 =?us-ascii?Q?iDaNp1q347d9uy+ItiXlXCg9s0BphG4oOY0bHwbCfMrQ/BLy2FhrVZySuuDQ?=
 =?us-ascii?Q?+OhhWrCoZSyFw76IJOBaVPEjSb8M3RLrYaqicQZ3eSJWuQhE70sIqm1D9BnC?=
 =?us-ascii?Q?LosLnLdiDX13ipXM9W5nVScYMm3fpeTQeFLfblRMYI8YEgcJhGtHQke+2xkP?=
 =?us-ascii?Q?PspIhsC++20s+rtm98eMcol4E8B48J2nevqK1GciX2Gakh+p/9xHsxzPKZ1B?=
 =?us-ascii?Q?rppZ//MJwaDFwQ+N76A5q0xvxV4psNCd36ervPlnDAgqf/vxheISXf8CMGSR?=
 =?us-ascii?Q?D+p41GP5fxIR9e1IM81vuUlLLZk0JQm9JebVcVJILE5UkpluzXOmNTQwjkB/?=
 =?us-ascii?Q?Oie8nqrWpSgvq0XrcxPYZIQN91bhuzvyA0O0iBuKeedWsumzL9EEMDaokiwT?=
 =?us-ascii?Q?QaLdc6r1CKbpIaKcCKqkwzWOPfrOmHDjzVGMOCIluotsnYGAI9d7yMm/sBIq?=
 =?us-ascii?Q?05S2DUA+21OPuc7+FbqC/otXMpq9Owff1QCwfxWAx0fhLT/HablaNxYFT1Fh?=
 =?us-ascii?Q?oPRaG0ALBZ7BahUof3SDr7mqxu/BiSYVcI/PE7xnzsgR7wl4ra0Mwn/MWxv2?=
 =?us-ascii?Q?rzkCzSfubIYFCGp8nXngwJKRz4qBc2zk/VUSNfv32W+OatWLXaM1MW1gG4DI?=
 =?us-ascii?Q?+JKTXvUha7KG/V6jhUEZF0BJQTQTyaHGli22d7OZuXs2gwONWA3frNZwtxa+?=
 =?us-ascii?Q?P4R8pCYSoGUIL8IQuExwHIRamfmh8ImytEG9Ng1SSSivLylISXWPSu4I+15u?=
 =?us-ascii?Q?cJoyPE8b9R6AoXCkWkB9i8CaG01TRj0C01/MYXNTX1Z+w0m3aLgckKzUtS3k?=
 =?us-ascii?Q?AbWEh2LcFEiYIJNXWCG1lX6BpxvZ5tFVYpYMXM+KNAgzbX8oQ311fqj9Kjdo?=
 =?us-ascii?Q?4N2/g5fOsJQkIGWT4xC038+xH7g25zoZA8frxY10bxjJ1dVikfq9rXIuPDxj?=
 =?us-ascii?Q?w3VDT8IEblA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcZEqyYA2mny+DjIR/Ft2GcDhWOjCchx/yXW+u5ZSaq573Psx1XoLZIA3u8b?=
 =?us-ascii?Q?+uLbSdFds/vV3DUls4jbbAR+pNDE961cQj2dQHiy3H2+z7xoTO2uaNr3q2TS?=
 =?us-ascii?Q?NgZP96zQKBFh3qcLnQ8f55VomWY1/cUHj74CQucvdjuN3drKn4YOWmQW4V+w?=
 =?us-ascii?Q?62mOUXDLdffvUyuVPW2ODgoDg2x+qCqN0C2xtMFfQNDP696HompE258JNagQ?=
 =?us-ascii?Q?12dfi9CqD1MYz1UWtWj/vJuodoxyAmzUntToMeg9vzBIaPZreTVed41O4lr9?=
 =?us-ascii?Q?cuxxZORlO+CtC3kfRjYjyoaiobRDkZmmr/9LtW7hzNh3dTOBX0Kr3aPkYJM4?=
 =?us-ascii?Q?uGC1UxFW0gNvIz4vrDJXr1Z8o1GTEOrnpJ5q/NbwDBYdv9wE9kYohrL7r5a3?=
 =?us-ascii?Q?uoDZvJttOSN+tDi1Mg7LQCiTP9zC0kXn1eN+OLK8kHati+fWvfdO/uoZyHjO?=
 =?us-ascii?Q?+Ra5LlD5OYKYygT2B2jk2uSL88x1u+bYG6c6XQwQFlQQ2CmFvDLaVtX2Fxwk?=
 =?us-ascii?Q?XyH5W1pkx09xRRqDX1zve573wshJYRWjF/Bh0BcySZMADIHibMdSLgRnsWAM?=
 =?us-ascii?Q?zF3QsVmJlGtuR6IUkOBxK4oTTLiiup5g9Rt9pbaBQkPyPtuDTZqN6Jv6DdXY?=
 =?us-ascii?Q?vaKTWSYNKmJFLnbE8xoILAXg8K1re67PTJ17q/9RD2/f7+euI/y7a7u+namL?=
 =?us-ascii?Q?H/QCXA1KlNdr6xvrmul77Xn1304Jx/8kWv8S3x185GLlRuuJD3UjwbTT1ZYp?=
 =?us-ascii?Q?FJCtMHazLpZ0BzyOZknM4dotJbd8A/QWA3M+tKiD2vrZAbFgBQ6YNQGRGvEE?=
 =?us-ascii?Q?C/FwmXnbshDB3asp6iHAXL3meygHzQt+c4Kd/p0jI+F/P6U2CEGPqlJ9w4Su?=
 =?us-ascii?Q?ehyAtTg5npBfcDFsURffwqGvu9Qfkflf2TnA1MRsyR4Gc2qsUWZkyLad8scK?=
 =?us-ascii?Q?cpvBXsYypUHjMm0C72nL+2pTD3XfH5yRjNgZAU94PhddytCHVESqhi3/V7sE?=
 =?us-ascii?Q?I//M8wL90qBuaRGF6BKnEFD/uPzb7SkUndE4dL2mL8cjjYONfFz+O7Zmv39t?=
 =?us-ascii?Q?+tH7WCMV+uLg6Axbmu+Zn5wxmyMFM1Ec2J+aBSY4Mlm3J35Ufht6HYElSr9+?=
 =?us-ascii?Q?NOA3WkGo7/QLPa95TjJthAieqvR2VxytzBeVGr9AbM44+KbAAQDbg6utn35q?=
 =?us-ascii?Q?kEIZe6Brj+4V7RbZCs8O5MjUivxaGg8bV5c2PNwUZ1Z2N0alkHtEkIdE3Qku?=
 =?us-ascii?Q?N45dPdvQrhxy9J3QLsVAlbNAlB80Ywke3c1xQl1e5cDDEeK+Q+7qRvWdUPQC?=
 =?us-ascii?Q?gZeNSTxFDCJqbcwtFapOcO8gEWo22geRPnc3o2on4rGpgVQQRzM8F+GwQg8+?=
 =?us-ascii?Q?o61IFGcXKFPBjCnyVFofw340m2pIUFGY8jOKgCozxGPY+uiUdCtX8TI6P0kY?=
 =?us-ascii?Q?2nfj2Y/ZO7VzRAn/a2C8e8nwMtb+Vy7htOYNL+N+0e0koErx/Jbhwqlz0GCP?=
 =?us-ascii?Q?3vf+rAwwPr3CAUnSUsLID7LEsTwnSOk8NFmBlNec9pmikm2YFQo2JDC4u9eN?=
 =?us-ascii?Q?DunugXEVlH0bLXkbvKY2PA2xz0+mNDNmizQPQkwE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352bb09e-40ef-4aa8-4dea-08ddaeaadeaf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:58:26.1781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbM6oJXhqD0gcytkj5YlIdY22x4M8EP4GnC/1pSy5vLCw3dKHGdjPJWc3I0kYKlodh9fwNCsgAYgVwMrStZLVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

On Sat, Jun 14, 2025 at 09:05:41AM -0700, Boqun Feng wrote:
> On Sat, Jun 14, 2025 at 08:56:36AM -0700, Boqun Feng wrote:
> > On Sat, Jun 14, 2025 at 08:06:04AM -0700, Boqun Feng wrote:
> > > On Sat, Jun 14, 2025 at 10:38:11PM +0900, Alexandre Courbot wrote:
> > > [...]
> > > > > +macro_rules! impl_genmask_fn {
> > > > > +    (
> > > > > +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
> > > > > +        $(#[$genmask_ex:meta])*
> > > > > +    ) => {
> > > > > +        /// Creates a compile-time contiguous bitmask for the given range by
> > > > > +        /// validating the range at runtime.
> > > > > +        ///
> > > > > +        /// Returns [`None`] if the range is invalid, i.e.: if the start is
> > > > > +        /// greater than or equal to the end.
> > > > > +        #[inline]
> > > > > +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> > > > > +            if range.start >= range.end || range.end > <$ty>::BITS {
> > > > > +                return None;
> > > > > +            }
> > > > 
> > > > From this check I assumed that you interpret `range` as non-inclusive,
> > > > since `range.end == 32` is valid on u32...
> > > > 
> > > > > +            let high = $checked_bit(range.end)?;
> > > > 
> > > > ... however IIUC `checked_bit` will return `None` here in such a case.
> > > > Should the argument be `range.end - 1`?
> > > > 
> > > > Your examples do seem to interpret the range as inclusive though, so
> > > > probably the check should be `|| range.end >= <$ty>::BITS`. But that
> > > > triggers the question, is it ok to use `Range` that way, when its
> > > > documentation specifically states that it is bounded exclusively above?
> > > > We could use `RangeInclusive` to match the semantics, which would
> > > > require us to write the ranges as `0..=7`. At least it is clear that the
> > > > upper bound is inclusive.
> > > > 
> > > > ... or we make the methods generic against `RangeBounds` and allow both
> > > > `Range` and `RangeInclusive` to be used. But I'm concerned that callers
> > > > might use `0..1` thinking it is inclusive while it is not.

I think if they use 0..1 and consider it as inclusive, then they just need to
learn Rust. If they are writing Rust, then not knowing Rust is going to cause
them issues anyway. ;-)

> > > > 
> > > 
> > > I think generic over `RangeBounds` is a good idea, and we should
> > > .is_emtpy() or .contains() instead of comparison + boolean operation
> > > when possible. Seems we need a function to check whether one range

I am also of the opinion that RangeBounds is a good idea. I think it may come
down to both classes of devs, those who have used genmask before in C and
expect inclusivity, and those who are using it for the first time in Rust -
the latter may almost always want to use the non-inclusive syntax, no? 

thanks,

 - Joel

