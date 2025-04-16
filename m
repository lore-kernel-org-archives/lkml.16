Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020103.outbound.protection.outlook.com [52.101.195.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651C221D90;
	Wed, 16 Apr 2025 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828126; cv=fail; b=CwTBIUIRHGAEaEX4zSg7z6qIH7eRmONZz7AYv120THOlUxB77UT403tINAE7gAgcvkFjUNqaiWutP5Q22KqR6278WfF+r3U6WV9QIlvggTJXvsQ8PmpT8bPNSLDrOeLrOG6pUM+824/3UlkznyFdeBC/klmkBT5ddskKqrw5Fc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828126; c=relaxed/simple;
	bh=5XgOheKBWARkWZf5zzB6rOb3Gv1QQoKglsPDhdx/CQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSRU9wCaY1ebuzi/V46ZowC4giG9bVTh+bnkC0hyt3i9nmNml5RiPCZfrtzmYHAVIuq6vvKHNQPB6GhzJnTaHyyX/Xw7PW+/IzzgeDGs+iWC4BCPM3heNDM99tQNZrEPX6xorVA/hZ2v0qgDTBAzAw4tD1924gUr4or64dXokUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mGH9HVFo; arc=fail smtp.client-ip=52.101.195.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mGH9HVFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9EN0Gv5KjC2envaUePUW9oe3Wbfli8RK7FsWbeTTa2zDk/icq6OWnFevASEWQU5JvfY2oy7Q5KYHdQN+cDDALZciZIDae3ZQuEU0VfW6k13v4YeiMVlaD6YbA09oO19cTJoFAC6E6L92Kn6SGEVC6lXsEdWgDyv8DDLTwJ2hDQLohXTX3Zb+sER8CdzsNIjWJIUQuXGvbg954l93UeQfFvi6aFS3mvKTVFaFDP83emblDAY/flV8/TFROo7/+Z9wsJh+kUizpvpyREeQV9kYTe7wlu0DqFvPQqUWNpsBlijqpYsyWJ+WSg0uEg9trUBqD6acxXy9CYXSRByZF7P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HvRPEKm/i4u4wGh29txAzMa1DsfWy8LqyzebOyHYas=;
 b=OgZgJKRXFosRPyFFIPz2dkIjfsCX8P6Ik9Hl4mIaI9pSvSK9e0/23NLGNSpisuDaQfSf2e8pbeZTbwMTAIz46GVtdppSC8qR1DL9EHJwHbdfRNQEzsvr91QYprjUoH+aFydBbudx8OQJRkRzyoyAcf11yBzKknCNvAq8sV87tbO65NORnLkLtJoN9YQLyC0l9DQTt7FTkA/C9Mw/XGq8ymSjq9ikzaSJK6XVNvjDlqyLjaw6zdl33nbOvtI4pEa5ieSL7DFiRWB/Q23Q51DNPeuSM2/7bTSb9n/7JJAPT5G0yxGQP/aEc25aUOXR1JqugLhULUfGHFYAOYa7w+Ex1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HvRPEKm/i4u4wGh29txAzMa1DsfWy8LqyzebOyHYas=;
 b=mGH9HVFovyzNGM6QxE3I1W9PU0TxYxqOV8zd3PrZ7uqYuLJypASLntxYOMy9ChPDo2vWQgk6FHUTaYidq7OtTI3hzQ9PZAVLDJxOREevogHyeJTUGLOSSQS/ihbK5SgZDdHxD8QEnsYymhfNiGqs7I0zsMHLr720K0Lix7p9hgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB3474.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 18:28:39 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 18:28:39 +0000
Date: Wed, 16 Apr 2025 19:28:37 +0100
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
Message-ID: <20250416192837.1632d5a3@eugeo>
In-Reply-To: <Z_4rVyUjK1dlnTsT@pollux>
References: <20250326171411.590681-1-remo@buenzli.dev>
	<20250414152630.1691179-1-remo@buenzli.dev>
	<20250414152630.1691179-3-remo@buenzli.dev>
	<Z_1Jfs5DXD2vuzLj@cassiopeiae>
	<D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev>
	<Z_4rVyUjK1dlnTsT@pollux>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB3474:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e40636-fdff-460a-4d70-08dd7d148206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?35nYRS1uD4ZGioLIq8To2F+FEBDFAYFP4ldCKfBN+TsvEyKB0XoRO/+DI/oi?=
 =?us-ascii?Q?Slrl3mocs3Jv9AHbPlophEJxk78PUZgQ3G22lI3tw7juGeCvEXCGiBEFbFOR?=
 =?us-ascii?Q?IKHreu/t/XZwZLFtmLZSrtCf39fmXgdRHdnFVWo1+bWmqYqTs22RrFxp4q9n?=
 =?us-ascii?Q?ZuYF407bH0AyyYrVy4YaqLTxu7xks20a349y/VQXqq22ftnWvcqpqVJvCS3Y?=
 =?us-ascii?Q?jXvKy4SXb5rcQJGrHFnmXD5Mn9zY2p9eKFi3IF6l9DSwcCxKNawWCyUTuj7Z?=
 =?us-ascii?Q?3CXGQeAi1KeAdGWiVe3iQYuQrlJ7G+3UtBXwgiCnZIbyjXpQkXiVTzUlAvb/?=
 =?us-ascii?Q?ncZZNlkRCbiYHbI/3r33e3BeIyiByKVsqtA7Uz+oa5YbLelIiRHM714UyrFe?=
 =?us-ascii?Q?DKmsEoshNtGNy1DclMRg7RoM6q5U+243gf1gp6K6PBoYyUkPX8UEwliv7IMl?=
 =?us-ascii?Q?fKuIANQfOLzHIccNJnIMNaCzAyYtGy5For9RAUhqx9JwNrx7PT25nEL38wUp?=
 =?us-ascii?Q?tuvhpIsRQ/iwlE5K8VKJ3WZKt8UgVoM3EnVLP8ms2zMQsYeFxipRWaUAWWAG?=
 =?us-ascii?Q?tQHSUav9KH8F2uWuc4bwLj60TtfqgcNonCAyTS7KYfIXAWfmmSffGM1TqNqC?=
 =?us-ascii?Q?4ofxf66EGGOs+EuJuxHRNUw7+4e3UevR6CJIhwwLKaTsajxff/yP9vhLEg9J?=
 =?us-ascii?Q?4YNoP+Abm56eMsU8RGeq+6z7mqcj3lab27ANtpanKgrV5mnoJtQS8z4RtE8H?=
 =?us-ascii?Q?CJoMm1z+0B4Hd/6UkPOY3gj3UfRtHO2JvKzoDMv4OHe1f65P9jB2XagtBQh3?=
 =?us-ascii?Q?hgXBbrIxak67nKfLmw8rP1Uzbbcdzijkn69gIKt09u8spxpV6XYSwNChZIHR?=
 =?us-ascii?Q?uKXQjM5MRDldO11FlWpUf7kGOtzhNISUKAZZUa+Y94iXeWd+dCWRCSq+PbZw?=
 =?us-ascii?Q?VdmS57lO/qW8skb9DBfGqYsHbAxLbTfDe13VK5eEtSiaDqg9E65RZUiphHnE?=
 =?us-ascii?Q?K+IHN7bAsDpXrSrFYoXUUk5fMKux8V3Ev/q8gGfonQJWtT3r6U3c+KFNq08L?=
 =?us-ascii?Q?+4i8g4cnxJmjtmISeNeX1RWswAaA1rSthv0tsuNCaw1Oh/ikuuDYZeb3CiNG?=
 =?us-ascii?Q?WoAP23GlgcAp20SEsqKzjV4Z5Gb2j8BuPCybWk+Yne10NLGbBwZrmsvkTAYW?=
 =?us-ascii?Q?hQXH592h/N2ydlvurTfwxR7MoNeaga6YPG2PE0pVIMXiESAfYmJoZ/yRfm6v?=
 =?us-ascii?Q?Hmiola5NML5rl0wknZjMu4QN129EJOoX4WufAE/EVbkg+imXSQkbP8YjtfGm?=
 =?us-ascii?Q?FtDkiprXg/ZZ64pGI/UPF5mSCikdjNtYpz+//vgPCA/lXC/epSilm4GuEiZq?=
 =?us-ascii?Q?/xMkNNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jf40Wj5vd7j0m+kFHpX3XhTA8WBaI11gLaC78sJMxJ3kbAQOZ/6WCIvPSx5/?=
 =?us-ascii?Q?jXIC+hnrtKkfOo/1vxnmpkovHFcZf1mkUUvsZW/XwOFYgLjvf3Sb/Sve3I+w?=
 =?us-ascii?Q?sQM90YjLGB1TyYimWwiI0dqexQcQkFMpwZnX0GUtu2ithUAdQ8fBQmEI4YCe?=
 =?us-ascii?Q?4lL6pUP0Gg8BDRyWtX5gSueF1GOAyjbtp+FBVp1gZxbYR3QaGcvDgdjXiuqr?=
 =?us-ascii?Q?Gk0vWfV/r41UWZHG7JBhNtjQPcnpnxdKqia01fASP4dGlyfKGncs3mRuI86v?=
 =?us-ascii?Q?NBzJz2aWmbo47xugG237ILlYbxfMnyNWnpd7q3bkoyTBBlZiTgPPStgtRqG9?=
 =?us-ascii?Q?wOmU9GXjSYpBmqD97csepRTtUiq1KtLoTBxooiuZZISIN25FM2x8am34nnv5?=
 =?us-ascii?Q?3UpDRNem3gg/TWq5rVGEgr0ftqMbeRVBUfs+tR2+pwSBaDe0ilK8MLKf/bWk?=
 =?us-ascii?Q?Gx91q9LBLAXeJ2RAzKIkQAFT2r70tOMEdnmr75gTf23PReCsrAUOivoVKwub?=
 =?us-ascii?Q?8FqxNYeFVDKDEE64lr2xcVpNeg61K5TLBwRqVGnNMCs+5nBSzk5TauOi62F0?=
 =?us-ascii?Q?eUdtLAi/EFoe7YWFiReSXkgOH0+JF3cIsxzEpAp+ArcVlNvlQLbXE+weJVNi?=
 =?us-ascii?Q?PiCfXE7/AQtSViHjqueDVUtiLpdp9b9BALRHM9VZMbnTWWSHlx4qWTdRLkqE?=
 =?us-ascii?Q?LFYb03cY71PLCd1AeueoBUYuXrITlj9/2dgOiR5RAC5TvOiDFGUmfB8Za6Dv?=
 =?us-ascii?Q?v7FxPkWz2iVq5bPzCjzxOu2m3DqWHGFvYxSNKvZGvf9K4F0TGDPLjNzPGR/c?=
 =?us-ascii?Q?EvHb+lhPP0fKMJg182apAQSX5GTiYC2basDPdrqckHFiEzpu50lWrP+W4Vo4?=
 =?us-ascii?Q?60L+1VKUreS6WSrHNxKh/9IAyrQTjxabidzAgqUzOj4Apl7MdT4l3Ck5xkY6?=
 =?us-ascii?Q?UEYFEXAvyDeLdxO1QEo3P8QB8AmQZ9CX89OINAz5KR9BiY7FFuj5U3D/yMmK?=
 =?us-ascii?Q?wvYEh9ubNghIB26XS96ohpgTmR7ksu78GDfB+JsJG4NKqPS+BeEpx66DVG0a?=
 =?us-ascii?Q?g61N8bML4liLQ/1evjKE54Aw3deIapadtBWNE1RrIMg3j7DJycChY3LUDWzN?=
 =?us-ascii?Q?IJDui/+/oRbM+0pAIXTYha83PwBNtxovk91ca3jMTXUwJUap6MiohBZUCfXL?=
 =?us-ascii?Q?fCedgE8DELwyn8hWuIpyHZ7BCMk0+cFpvD4U5KKjQ9sBucgyNMUMUfDEmEaQ?=
 =?us-ascii?Q?32BSuBaLM/gYnYS8LbE8q/JqNPm7opYdtlBCFafBg7JgoL+ctUzJuOG2VjZs?=
 =?us-ascii?Q?wXnBQQAhiw1aaOhVNkCZEZ85exhpahnirWJ66Cf2dfPXWG8UnXI9P+dDU8eX?=
 =?us-ascii?Q?piwc2ArS3zhYHdMAX+SYa0fheQ12iaZLgGB3XK/lRvwU/IG4knIAEFv8LqJg?=
 =?us-ascii?Q?pGSJTV3MobxTPPCuply9Ns1WEuzyFIaqCrXWIQAwcv11/VN3KKXRM9hl09m9?=
 =?us-ascii?Q?IJsAa2KTgEFD6288tbGc/T7V8hRZgQYvBFKx36DZr08METCz5BJKeGTnu/v3?=
 =?us-ascii?Q?mUw/1NVl0visgBXEJP/osB2pECQEkfD5OyNcDETjfbTCUq8lyvkQ+FO4SI3f?=
 =?us-ascii?Q?/cdgAOcgkFmLYQznOsECSbRmXLgRd059fCtRh9V8dovr?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e40636-fdff-460a-4d70-08dd7d148206
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 18:28:39.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRl+YhEs3nOhWtUYT1vws8dqWZRdbWHhOsx74n269aM1jWPgRgmEHfchSKCe2szuOpTXvQNsnGe+G20jEfSkqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3474

On Tue, 15 Apr 2025 11:48:07 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Tue, Apr 15, 2025 at 01:55:42AM +0200, Remo Senekowitsch wrote:
> > On Mon Apr 14, 2025 at 7:44 PM CEST, Danilo Krummrich wrote:  
> > > On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:  
> > >> The device property API is a firmware agnostic API for reading
> > >> properties from firmware (DT/ACPI) devices nodes and swnodes.
> > >> 
> > >> While the C API takes a pointer to a caller allocated variable/buffer,
> > >> the rust API is designed to return a value and can be used in struct
> > >> initialization. Rust generics are also utilized to support different
> > >> types of properties where appropriate.
> > >> 
> > >> The PropertyGuard is a way to force users to specify whether a property
> > >> is supposed to be required or not. This allows us to move error
> > >> logging of missing required properties into core, preventing a lot of
> > >> boilerplate in drivers.  
> > >
> > > The patch adds a lot of thing, i.e.
> > >   * implement PropertyInt
> > >   * implement PropertyGuard
> > >   * extend FwNode by a lot of functions
> > >   * extend Device by some property functions
> > >
> > > I see that from v1 a lot of things have been squashed, likely because there are
> > > a few circular dependencies. Is there really no reasonable way to break this
> > > down a bit?  
> > 
> > I was explicitly asked to do this in the previous thread[1].  
> 
> I'm well aware that you were asked to do so and that one reason was that
> subsequent patches started deleting code that was added in previous ones
> (hence my suspicion of circular dependencies and that splitting up things might
> not be super trivial).
> 
> > I'm happy
> > to invest time into organizing files and commits exactly the way people
> > want, but squashing and splitting the same commits back and forth
> > between subsequent patch series is a waste of my time.  
> 
> I don't think you were asked to go back and forth, but whether you see a
> reasonable way to break things down a bit, where "reasonable" means without
> deleting code that was just added.
> 
> > Do reviewers not typically read the review comments of others as well?  
> 
> I think mostly they do, but maintainers and reviewers are rather busy people.
> So, I don't think you can expect everyone to follow every thread, especially
> when they get lengthy.
> 
> > What can I do to avoid this situation and make progress instead of
> > running in circles?  
> 
> I suggest to investigate whether it can be split it up in a reasonable way and
> subsequently answer the question.
> 
> With your contribution you attempt to add a rather large portion of pretty core
> code. This isn't an easy task and quite some discussion is totally expected;
> please don't get frustrated, the series goes pretty well. :)
> 
> > 
> > Link: https://lore.kernel.org/rust-for-linux/20250326171411.590681-1-remo@buenzli.dev/T/#m68b99b283a2e62726ee039bb2394d0741b31e330 [1]
> >   
> > >> +    /// helper used to display name or path of a fwnode
> > >> +    ///
> > >> +    /// # Safety
> > >> +    ///
> > >> +    /// Callers must provide a valid format string for a fwnode.
> > >> +    unsafe fn fmt(&self, f: &mut core::fmt::Formatter<'_>, fmt_str: &CStr) -> core::fmt::Result {
> > >> +        let mut buf = [0; 256];
> > >> +        // SAFETY: `buf` is valid and `buf.len()` is its length. `self.as_raw()` is
> > >> +        // valid because `self` is valid.
> > >> +        let written = unsafe {
> > >> +            bindings::scnprintf(buf.as_mut_ptr(), buf.len(), fmt_str.as_ptr(), self.as_raw())
> > >> +        };  
> > >
> > > Why do we need this? Can't we use write! right away?  
> > 
> > I don't know how, can you be more specific? I'm not too familiar with
> > how these formatting specifiers work under the hood, but on the face of
> > it, Rust and C seem very different.  
> 
> See below.
> 
> >   
> > >> +        // SAFETY: `written` is smaller or equal to `buf.len()`.
> > >> +        let b: &[u8] = unsafe { core::slice::from_raw_parts(buf.as_ptr(), written as usize) };
> > >> +        write!(f, "{}", BStr::from_bytes(b))
> > >> +    }
> > >> +
> > >> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> > >> +    /// printing the name of a node.
> > >> +    pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {
> > >> +        struct FwNodeDisplayName<'a>(&'a FwNode);
> > >> +
> > >> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
> > >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> > >> +                // SAFETY: "%pfwP" is a valid format string for fwnode
> > >> +                unsafe { self.0.fmt(f, c_str!("%pfwP")) }  
> 
> I think this could just use write!() and fwnode_get_name(), right?
> 
> > >> +            }
> > >> +        }
> > >> +
> > >> +        FwNodeDisplayName(self)
> > >> +    }
> > >> +
> > >> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> > >> +    /// printing the full path of a node.
> > >> +    pub fn display_path(&self) -> impl core::fmt::Display + use<'_> {
> > >> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
> > >> +
> > >> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
> > >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> > >> +                // SAFETY: "%pfwf" is a valid format string for fwnode
> > >> +                unsafe { self.0.fmt(f, c_str!("%pfwf")) }  
> 
> This one is indeed a bit more tricky, because it comes from
> fwnode_full_name_string() in lib/vsprintf.c.
> 
> Maybe it would be better to replicate the loop within fwnode_full_name_string()
> and call write! from there.
> 
> > >> +            }
> > >> +        }
> > >> +
> > >> +        FwNodeDisplayPath(self)
> > >> +    }
> > >>  }
> > >>  
> > >>  // SAFETY: Instances of `FwNode` are always reference-counted.
> > >> @@ -73,3 +257,200 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> > >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> > >>      }
> > >>  }
> > >> +
> > >> +/// Implemented for several types that can be read as properties.
> > >> +///
> > >> +/// Informally, this is implemented for strings, integers and arrays of
> > >> +/// integers. It's used to make [`FwNode::property_read`] generic over the
> > >> +/// type of property being read. There are also two dedicated methods to read
> > >> +/// other types, because they require more specialized function signatures:
> > >> +/// - [`property_read_bool`](Device::property_read_bool)
> > >> +/// - [`property_read_array_vec`](Device::property_read_array_vec)
> > >> +pub trait Property: Sized {
> > >> +    /// Used to make [`FwNode::property_read`] generic.
> > >> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self>;
> > >> +}
> > >> +
> > >> +impl Property for CString {
> > >> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
> > >> +        let mut str: *mut u8 = ptr::null_mut();
> > >> +        let pstr: *mut _ = &mut str;
> > >> +
> > >> +        // SAFETY: `name` is non-null and null-terminated. `fwnode.as_raw` is
> > >> +        // valid because `fwnode` is valid.
> > >> +        let ret = unsafe {
> > >> +            bindings::fwnode_property_read_string(fwnode.as_raw(), name.as_char_ptr(), pstr.cast())
> > >> +        };
> > >> +        to_result(ret)?;
> > >> +
> > >> +        // SAFETY: `pstr` contains a non-null ptr on success
> > >> +        let str = unsafe { CStr::from_char_ptr(*pstr) };
> > >> +        Ok(str.try_into()?)
> > >> +    }
> > >> +}  
> > >
> > > I think it would be pretty weird to have a function CString::read() that takes a
> > > FwNode argument, no? Same for all the other types below.
> > >
> > > I assume you do this for
> > >
> > > 	pub fn property_read<'fwnode, 'name, T: Property>(
> > > 	   &'fwnode self,
> > > 	   name: &'name CStr,
> > > 	)
> > >
> > > but given that you have to do the separate impls anyways, is there so much value
> > > having the generic variant? You could still generate all the
> > > property_read_{int}() variants with a macro.
> > >
> > > If you really want a generic property_read(), I think you should create new
> > > types instead and implement the Property trait for them instead.  
> > 
> > Yeah, that would be workable. On the other hand, it's not unusual in
> > Rust to implement traits on foreign types, right? If the problem is
> > the non-descriptive name "read" then we can change it to something more
> > verbose. Maybe `CStr::read_from_fwnode_property` or something. It's not
> > meant to be used directly, a verbose name wouldn't cause any damage.  
> 
> Yeah, if we keep this approach, I'd prefer a more descriptive name.
> 
> However, I'd like to hear some more opinions from other members of the Rust team
> on this one.

I think the trait approach is what people quite typically use. The
additional functions are usually not an issue, as they won't be
available if you don't import the trait. Using names like
`read_from_fwnode_property` would be remove any concern for me.

Best,
Gary
