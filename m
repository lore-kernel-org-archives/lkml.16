Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7881A83FF;
	Thu, 30 Jan 2025 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275282; cv=pass; b=lfoR8clmvHeSpELZiAR9Va91HbLn7mbZArqW+LoWJxF130jYKdWEImGRAkWZGr+3XvLHyFWRsOZNb3nvk8ExpjyqheigpbIMfuO3/QDH3/WJuSFNMdnzPrt6d0MNDYuN1H5SwDXEDbzIPEur8Z85eCv9Z4CPI4m1NYpN9gEGhw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275282; c=relaxed/simple;
	bh=fbfiaVMl6L2bbAvT/hyHjcQ5Lhez61yBIEau0QH8jPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vA0FTK0GYmlG1Huch4BvOqthPGMkeCJo3RhQJ7MBaWTCbhMrC+/mleWkfNlIrRgB94bL0bGqaEjPwICpAw7NLFfbVVRVdkWFUXKkg0LVY95kSemwF+H9FrY9eWxQMT8qE75T5ZPnoFy1yCgTjdFnaWXV9tmJUOzWj3JJelcH8p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CdTYumnD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CdTYumnD"
ARC-Seal: i=1; a=rsa-sha256; t=1738275262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DwnooMHrbllwW04twfg5TkOsKbXUyAvl+72RUmaTpAoI1QIZTSQeFUwrKP0ChXR1Dob/RAoZtNENQnEDl97xKSGU8I1Lb8Taz7SFCwx/eUhkT8C7wmtaYJmVDCPbKJ5CY5Jmh+3sv3E87q68bpqDZyEeqO2/cCnEtyLfT6gGVn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738275262; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mHblir7ZzbIrVXH6+I13EXrbtUaLe8zc0rFUvXWi08E=; 
	b=A7+os+ERQ4ftdd9Fu72eoh50YQNQJ9HNzdgc5tiIE6YOvwh5z7CdYwLLGV87+P3wrdxe3hNhXOWd1gGAuHkkFBvFOkpvtaOwBLHmEnfaNDU3r9v02cAZ0g+Tl7oYh8Ib4vqy4+sTh2FwM8dkh0yUopdY7o3XMsqa0e/KO88Y+io=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738275262;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mHblir7ZzbIrVXH6+I13EXrbtUaLe8zc0rFUvXWi08E=;
	b=CdTYumnDq+ATchYZHj0E0OdxWPNZdbUMnZt6I7SXkIjj2z4vnc08VTWNmisElstO
	atES/BlKMIDcDgoSxnwdrSG1OhVH+LEIx1woSvtSOv1Eb3kglUfWrG5Bb4KdisXUnoc
	JpafjJbPCSQecuMf4aOljuUwBbsSYh1ziyJSsyv8=
Received: by mx.zohomail.com with SMTPS id 1738275257577947.6320559063956;
	Thu, 30 Jan 2025 14:14:17 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.mco,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com,
	robh@kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] rust: platform: add Io support
Date: Thu, 30 Jan 2025 19:05:20 -0300
Message-ID: <20250130220529.665896-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Changes in v6:

- Added Fiona as co-developer in the first patch, as I merged part of his code
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

