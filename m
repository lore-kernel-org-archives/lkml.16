Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6093B19A;
	Tue,  3 Jun 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963844; cv=none; b=rsuJ+sDNTlZclFx7j020HrjS2C4qmUoyXXGas9/1fFURW2SBSx6YnmTISctj/zoYJt6S33p6Ay7dK4390CWVhyzlDFYl+G9fF1jnGmbyskIRrTTIcg5ecYa6V85pHY7jrHod3g6JR1dfTHA+hW12zr29fBT5R2rzICLekdjWM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963844; c=relaxed/simple;
	bh=u0wLuH2cwR/Io0pT2k69E6jWCKO2MMsmHRGhMCK6qTo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WSj/xp1/tSedDRQ3ixyqTMn+FbvZ+dht8iTUnoeL/tIdnfx0RgB0rGoOYRxYssORwBmj1yLU+BKcTaQGtizci9Gh7v+gP8MDW3rxzw9ETwviA4Ecs2ifXz9T9q5vNtkLY9aXuCYdj+gmjnZyoBz7vkzI6+Q8Y8+IMKfAZB0gC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaMH0rpt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaMH0rpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748963842; x=1780499842;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u0wLuH2cwR/Io0pT2k69E6jWCKO2MMsmHRGhMCK6qTo=;
  b=iaMH0rptVl92985q+fr+A/vrEVTrvqWE2cbt2bqNCQwYGdurTu9OyOlg
   b81mPaY2bpbBF7cb2opOsZsepZz+vILoo1vpcqILcpAEItNUqIm+e1bU6
   OoCbOczzS2UvwqIh7mFDukr5z5Z7EeSja1heJyKP0oPw2fU71whoBk0yd
   qZRx7fYvW/18YwHxJW6GtrzBrlf9vlJXtMvO25FpS3bMzYfdP4KSo0snd
   sdZS40tnGUz7liuZTjNzcKPIawiiwWOZm6YV/PvmSJgmnx3OZP0+ut45D
   0B+yrwRhqafqu5rzEOMh0JKP0FhUuGfUouzyx1XTyEYI6zVkVC7FdNSvy
   A==;
X-CSE-ConnectionGUID: LNzuvH56To2PNJ20lg98Ng==
X-CSE-MsgGUID: x2/F2QqAQJ+OsqiOez4kqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38637739"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="38637739"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:17:21 -0700
X-CSE-ConnectionGUID: 0rm3v+2ZQCWVdYSqQSTcnw==
X-CSE-MsgGUID: pnDgcdZURwi9Yk3TCMqCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="144919364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.141])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:17:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Jun 2025 18:17:11 +0300 (EEST)
To: Daniel Almeida <daniel.almeida@collabora.com>
cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <benno.lossin@proton.me>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Ying Huang <huang.ying.caritas@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org, 
    Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH v9 0/4] (no cover subject)
In-Reply-To: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
Message-ID: <c26b223a-92cc-4064-ae5f-7637aa85af98@linux.intel.com>
References: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Daniel Almeida wrote:

> Changes in v9:
> - Rebased on top of nova-next (for Devres::access())
> - Reworked the documentation to add more markdown.
> - Converted to &raw mut instead of addr_of_mut!()
> - Renamed 'from_ptr' to 'as_ref' for consistency
> - Changed the IoMem examples to use the signature for probe()
> - Changed resource() to resource_by_index(). It's a better fit given
>   the existance of resource_by_name().
> - Created a separate patch for the resource accessors above.
> - Moved the accessors into the generic impl block, so they work with all
>   Device contexts.
> - Take Device<Bound> where applicable
> - Renamed "ioremap_*" to "iomap_*", in order to be consistent with the code
>   in pci.rs
> - Switched to Devres::access()
> - Link to v8: https://lore.kernel.org/r/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com
> 
> rust: platform: add Io support
> 
> Changes in v8:
> - Rebased on driver-core-next
> - Opted to wait for 'rust/revocable: add try_with() convenience method' to
>   land instead of using the suggested closure (let me know if we should
>   just switch to the closure anyways)
> - Cc'd more people
> - Link to v7: https://lore.kernel.org/r/20250318-topics-tyr-platform_iomem-v7-0-7438691d9ef7@collabora.com
> 
> Changes in v7:
> 
> - Rebased on top of rust-next
> - Fixed a few Clippy lints
> - Fixed typos (Thanks Daniel!)
> - "struct Flags" now contains a usize (thanks Daniel)
> - Fixed "Doc list without indentation" warning (thanks, Guangbo)
> 
> Thanks, Fiona {
> - Removed RequestFn, as all functions simply used request_region and RequestFn
>   had issues. Only request_region() is exposed now.
> - Gated iomem_resource on CONFIG_HAS_IOMEM
> - Require that the name argument be 'static
> }
> 
> - Correctly check for IORESOURCE_MEM_NONPOSTED. We now call ioremap_np if that
>   is set (thanks, Lina!)
> - Remove #[dead_code] attribute from ExclusiveIoMem::region.
> 
> Changes in v6:
> 
> - Added Fiona as co-developer in the first patch, as I merged part of her code
> from the LED driver series (thanks, Fiona)
> 
> - (Fiona) added the ResourceSize type, thereby fixing the u32 vs u64 issues
>   pointed out by Christian
> 
> - Moved the request_region, release_region and friends to resource.rs
> 
> - Added the Region type. This type represents a resource returned by
>   `request_region` and friends. It is also owned, representing the fact
>   that the region remains marked as busy until release_region is called on
>   drop. (Thanks Alice, for pointing out this pattern)
> 
> - Rewrote the IoMem abstraction to implement a separate type for exclusive
>   access to an underlying region. I really disliked the `EXCLUSIVE` const
>   generic, as it was definitely not ergonomic, i.e.:
> 
>   `IoMem<0, false>`
> 
>   ...doesn't really say much. In fact, I believe that boolean parameters
>   hurt readability in general.
> 
>   This new approach lets users build either regular IoMem's, which basically
>   call ioremap under the covers, and ExclusiveIoMem's , which also call request_region
>   via the Region type.
> 
> - Added access to the ioresource_port and ioresource_mem globals.
> 
> Link to v5: https://lore.kernel.org/rust-for-linux/20250116125632.65017-1-daniel.almeida@collabora.com/
> 
> Changes in v5:
> 
> - resend v5, as the r4l list was not cc'd
> - use srctree where applicable in the docs (Alice)
> - Remove 'mut' in Resource::from_ptr() (Alice)
> - Add 'invariants' section for Resource (Alice)
> - Fix typos in mem.rs (Alice)
> - Turn 'exclusive' into a const generic (Alice)
> - Fix example in platform.rs (Alice)
> - Rework the resource.is_null() check (Alice)
> - Refactor IoMem::new() to return DevRes<IoMem> directly (Danilo)
> 
> link to v4: https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-daniel.almeida@collabora.com/
> 
> Changes in v4:
> 
> - Rebased on top of driver-core-next
> - Split series in multiple patches (Danilo)
> - Move IoMem and Resource into its own files (Danilo)
> - Fix a missing "if exclusive {...}" check (Danilo)
> - Fixed the example, since it was using the old API (Danilo)
> - Use Opaque in `Resource`, instead of NonNull and PhantomData (Boqun)
> - Highlight that non-exclusive access to the iomem might be required in some cases
> - Fixed the safety comment in IoMem::deref()
> 
> Link to v3: https://lore.kernel.org/rust-for-linux/20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com/
> 
> Changes in v3:
> - Rebased on top of v5 for the PCI/Platform abstractions
> - platform_get_resource is now called only once when calling ioremap
> - Introduced a platform::Resource type, which is bound to the lifetime of the
>  platform Device
> - Allow retrieving resources from the platform device either by index or
>  name
> - Make request_mem_region() optional
> - Use resource.name() in request_mem_region
> - Reword the example to remove an unaligned, out-of-bounds offset
> - Update the safety requirements of platform::IoMem
> 
> Changes in v2:
> - reworked the commit message
> - added missing request_mem_region call (Thanks Alice, Danilo)
> - IoMem::new() now takes the platform::Device, the resource number and
>  the name, instead of an address and a size (thanks, Danilo)
> - Added a new example for both sized and unsized versions of IoMem.
> - Compiled the examples using kunit.py (thanks for the tip, Alice!)
> - Removed instances of `foo as _`. All `as` casts now spell out the actual
>  type.
> - Now compiling with CLIPPY=1 (I realized I had forgotten, sorry)
> - Rebased on top of rust-next to check for any warnings given the new
>  unsafe lints.
> 
> Daniel Almeida (3):
>   rust: io: add resource abstraction
>   rust: io: mem: add a generic iomem abstraction
>   rust: platform: allow ioremap of platform resources
> 
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/io.c               |  36 +++++
>  rust/kernel/io.rs               |   3 +
>  rust/kernel/io/mem.rs           | 125 ++++++++++++++++
>  rust/kernel/io/resource.rs      | 252 ++++++++++++++++++++++++++++++++
>  rust/kernel/platform.rs         | 123 +++++++++++++++-
>  6 files changed, 539 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/io/mem.rs
>  create mode 100644 rust/kernel/io/resource.rs

No MAINTAINERS entries are added for the new files?

> --
> 2.48.0
> 
> ---
> Daniel Almeida (4):
>       rust: io: add resource abstraction
>       rust: io: mem: add a generic iomem abstraction
>       rust: platform: add resource accessors
>       rust: platform: allow ioremap of platform resources
> 
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/io.c               |  41 ++++++++
>  rust/kernel/io.rs               |   3 +
>  rust/kernel/io/mem.rs           | 142 +++++++++++++++++++++++++
>  rust/kernel/io/resource.rs      | 222 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/platform.rs         | 159 +++++++++++++++++++++++++++-
>  6 files changed, 567 insertions(+), 1 deletion(-)
> ---
> base-commit: 276c53c66e032c8e7cc0da63555f2742eb1afd69
> change-id: 20250318-topics-tyr-platform_iomem-1710a177e1df
> 
> Best regards,
> 

-- 
 i.

