Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4C4A24;
	Mon, 23 Jun 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701706; cv=pass; b=ZR3imBd1W7lGyr9gol5ms8jqLZZqyRQr895YWKt9ydYlaWKz7lvsQCnmALaJeo1mTx6gIcf6uk8sUlFSnp/LtpjVodqP6KFmen9Sonc88mbtdl4I6iFkGP4kDKIMrXml8UjUyu4vmcJnmYMtCfw7AzWhVmFyhzWRK4xr4jWwewI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701706; c=relaxed/simple;
	bh=3ABmXlKrjiqd4HRJxdZbkhOnLV7tX+mhN+KVs9P5JZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V965W1y7hv/c2jbUSxznV73t0tLXfxU2PfSXVFTOoyf08klcPBrNFai2hxuNYjJY6OkvEFngkBFTRy+OgRNPxcAUVqheMQ1XlW60Fs+puu4quZopvtZF+P7GJDJptv1v4nRor1PFjOGrs8mLknFPh7yYFu45921G3RSRmSJKpW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hwr/1EgJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hwr/1EgJ"
ARC-Seal: i=1; a=rsa-sha256; t=1750701681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RCeDR0TqQ5SeK1uDLhT0PJ3x3YPEnXRujqXTyuRbmoFnCrn60JY4CYodnqoR0DfEQgnLN1XeiLs2722Yt/czxvUmJjMGpuMN7fqEFwaklZSLVYp0pRNe2YDNs3DePx0RABANcTi8C6NorHcLXclTJTXBEAHXL8ang0ExscvFFaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750701681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ME0xJ7/PTwHE6wU1CZHHGmKY+7I+KO4zTzR993OPCbw=; 
	b=Mq08eyPAncXPFI2XyVhBcUTgTTzSUDTsGsrwWHVG3aq92nmnq9V+eEu71+rJ49wDAVftQVyXy/DeH+CcEcVVCc44rvDKrsf5oYog3YaOuxzSBUXlfAE/eoDgsjGCLDCtQo7Hfssx5PabnKkhKbUqktYTuY8Twniw1i+ibTte5NY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750701681;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ME0xJ7/PTwHE6wU1CZHHGmKY+7I+KO4zTzR993OPCbw=;
	b=hwr/1EgJbMyLx4vQ/s+xsPCWLvy2J1bodF5Ccgeq5pmumJCblohKYc+riSaKNvrk
	zoLm7T0if/aO6Rl49XcJtWxRUhdbAaN+WX3HLWDTXkJNVcIACQkpVikTtoaOQcF3E8M
	t5U/x8+Jx953i+e1ogy/aGPzyatlttKqgiDY8vTQ=
Received: by mx.zohomail.com with SMTPS id 1750701678958193.92622678602538;
	Mon, 23 Jun 2025 11:01:18 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v10 0/4] rust: platform: add Io support
Date: Mon, 23 Jun 2025 15:00:57 -0300
Message-Id: <20250623-topics-tyr-platform_iomem-v10-0-ed860a562940@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmWWWgC/43OwWqEMBDG8VdZcm5kJhpjeup7lGWZ6qQGjJEo0
 mXx3Ru9CFtYevwG5sf/IWZOnmfxfnmIxKuffRzzQHi7iLan8Zul7/JBKFAaSmzkEiffznK5Jzk
 NtLiYws3HwEGiQSA0hrFzIv9PiZ3/OfDPa94uxSCXPjGdIpagFGhli7rWja0lyo5Gz0NBQ2Df0
 Ucbh4G+YqKijWFnez8vMd2P5NXs+H/iViNBmqpsaoudZWee4D1wbU5Ng32lNVlj69AoTRX8yTw
 0e2o1lK80mzVShqFCbbjkZ23btl+FhuHHqgEAAA==
X-Change-ID: 20250318-topics-tyr-platform_iomem-1710a177e1df
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Changes in v10:
- Rebased on driver-core-next
- Fixed examples (they were still using try_access())
- Removed map_err() from the examples, as it was not needed.
- Added a pub use for Resource in io.rs
- Reworked the platform code to make use of the pub use above
- Link to v9: https://lore.kernel.org/r/20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com

Changes in v9:
- Rebased on top of nova-next (for Devres::access())
- Reworked the documentation to add more markdown.
- Converted to &raw mut instead of addr_of_mut!()
- Renamed 'from_ptr' to 'as_ref' for consistency
- Changed the IoMem examples to use the signature for probe()
- Changed resource() to resource_by_index(). It's a better fit given
  the existance of resource_by_name().
- Created a separate patch for the resource accessors above.
- Moved the accessors into the generic impl block, so they work with all
  Device contexts.
- Take Device<Bound> where applicable
- Renamed "ioremap_*" to "iomap_*", in order to be consistent with the code
  in pci.rs
- Switched to Devres::access()
- Link to v8: https://lore.kernel.org/r/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com

rust: platform: add Io support

Changes in v8:
- Rebased on driver-core-next
- Opted to wait for 'rust/revocable: add try_with() convenience method' to
  land instead of using the suggested closure (let me know if we should
  just switch to the closure anyways)
- Cc'd more people
- Link to v7: https://lore.kernel.org/r/20250318-topics-tyr-platform_iomem-v7-0-7438691d9ef7@collabora.com

Changes in v7:

- Rebased on top of rust-next
- Fixed a few Clippy lints
- Fixed typos (Thanks Daniel!)
- "struct Flags" now contains a usize (thanks Daniel)
- Fixed "Doc list without indentation" warning (thanks, Guangbo)

Thanks, Fiona {
- Removed RequestFn, as all functions simply used request_region and RequestFn
  had issues. Only request_region() is exposed now.
- Gated iomem_resource on CONFIG_HAS_IOMEM
- Require that the name argument be 'static
}

- Correctly check for IORESOURCE_MEM_NONPOSTED. We now call ioremap_np if that
  is set (thanks, Lina!)
- Remove #[dead_code] attribute from ExclusiveIoMem::region.

Changes in v6:

- Added Fiona as co-developer in the first patch, as I merged part of her code
from the LED driver series (thanks, Fiona)

- (Fiona) added the ResourceSize type, thereby fixing the u32 vs u64 issues
  pointed out by Christian

- Moved the request_region, release_region and friends to resource.rs

- Added the Region type. This type represents a resource returned by
  `request_region` and friends. It is also owned, representing the fact
  that the region remains marked as busy until release_region is called on
  drop. (Thanks Alice, for pointing out this pattern)

- Rewrote the IoMem abstraction to implement a separate type for exclusive
  access to an underlying region. I really disliked the `EXCLUSIVE` const
  generic, as it was definitely not ergonomic, i.e.:

  `IoMem<0, false>`

  ...doesn't really say much. In fact, I believe that boolean parameters
  hurt readability in general.

  This new approach lets users build either regular IoMem's, which basically
  call ioremap under the covers, and ExclusiveIoMem's , which also call request_region
  via the Region type.

- Added access to the ioresource_port and ioresource_mem globals.

Link to v5: https://lore.kernel.org/rust-for-linux/20250116125632.65017-1-daniel.almeida@collabora.com/

Changes in v5:

- resend v5, as the r4l list was not cc'd
- use srctree where applicable in the docs (Alice)
- Remove 'mut' in Resource::from_ptr() (Alice)
- Add 'invariants' section for Resource (Alice)
- Fix typos in mem.rs (Alice)
- Turn 'exclusive' into a const generic (Alice)
- Fix example in platform.rs (Alice)
- Rework the resource.is_null() check (Alice)
- Refactor IoMem::new() to return DevRes<IoMem> directly (Danilo)

link to v4: https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-daniel.almeida@collabora.com/

Changes in v4:

- Rebased on top of driver-core-next
- Split series in multiple patches (Danilo)
- Move IoMem and Resource into its own files (Danilo)
- Fix a missing "if exclusive {...}" check (Danilo)
- Fixed the example, since it was using the old API (Danilo)
- Use Opaque in `Resource`, instead of NonNull and PhantomData (Boqun)
- Highlight that non-exclusive access to the iomem might be required in some cases
- Fixed the safety comment in IoMem::deref()

Link to v3: https://lore.kernel.org/rust-for-linux/20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com/

Changes in v3:
- Rebased on top of v5 for the PCI/Platform abstractions
- platform_get_resource is now called only once when calling ioremap
- Introduced a platform::Resource type, which is bound to the lifetime of the
 platform Device
- Allow retrieving resources from the platform device either by index or
 name
- Make request_mem_region() optional
- Use resource.name() in request_mem_region
- Reword the example to remove an unaligned, out-of-bounds offset
- Update the safety requirements of platform::IoMem

Changes in v2:
- reworked the commit message
- added missing request_mem_region call (Thanks Alice, Danilo)
- IoMem::new() now takes the platform::Device, the resource number and
 the name, instead of an address and a size (thanks, Danilo)
- Added a new example for both sized and unsized versions of IoMem.
- Compiled the examples using kunit.py (thanks for the tip, Alice!)
- Removed instances of `foo as _`. All `as` casts now spell out the actual
 type.
- Now compiling with CLIPPY=1 (I realized I had forgotten, sorry)
- Rebased on top of rust-next to check for any warnings given the new
 unsafe lints.

Daniel Almeida (3):
  rust: io: add resource abstraction
  rust: io: mem: add a generic iomem abstraction
  rust: platform: allow ioremap of platform resources

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/io.c               |  36 +++++
 rust/kernel/io.rs               |   3 +
 rust/kernel/io/mem.rs           | 125 ++++++++++++++++
 rust/kernel/io/resource.rs      | 252 ++++++++++++++++++++++++++++++++
 rust/kernel/platform.rs         | 123 +++++++++++++++-
 6 files changed, 539 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/io/mem.rs
 create mode 100644 rust/kernel/io/resource.rs

--
2.48.0

---
Daniel Almeida (4):
      rust: io: add resource abstraction
      rust: io: mem: add a generic iomem abstraction
      rust: platform: add resource accessors
      rust: platform: allow ioremap of platform resources

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/io.c               |  41 ++++++++
 rust/kernel/io.rs               |   5 +
 rust/kernel/io/mem.rs           | 142 +++++++++++++++++++++++++
 rust/kernel/io/resource.rs      | 222 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/platform.rs         | 156 +++++++++++++++++++++++++++-
 6 files changed, 566 insertions(+), 1 deletion(-)
---
base-commit: 63dafeb392139b893a73b6331f347613f0929702
change-id: 20250318-topics-tyr-platform_iomem-1710a177e1df

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

