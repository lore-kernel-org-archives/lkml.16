Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4B38384;
	Sun,  2 Feb 2025 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501944; cv=none; b=ExxGvN2zbtZ8erkA9m6u+bfbLhSdFt1Qn9Ebzy7pQn7BleUO6elrMmDqZ/dH3TqR4bj6+Xhay0YYouKNeFP2OlTEeDD+5Q69fYR4HcE+6GIczhDEDtHV6/Wrh/MO1saXgG67HOx/JRlBrcUgDzWLu2p5Xv+SOCLC5wG9eGIX5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501944; c=relaxed/simple;
	bh=lYa739FBsMmfPZUrxXPgYM7y6ANDDXCOgs8EeLdJuIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W0I/H2ELzipJhamrDCXocGUJvDAUzjyX6VEQL8wpBqWyXSqFKJV+UCuXTldzBxkMM5kzg/LoCsvBrCtzDbmphO7I1lPNLAZHndKR2cGzI4kjuk8TYyrcBUmminDwAgw1rGqvyKY6IbZWDVZZSbQV1VJn4yXBj/A1LuO5vJSCssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=sHtpEBEh; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="sHtpEBEh"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7E9F0425F5;
	Sun,  2 Feb 2025 13:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501596;
	bh=lYa739FBsMmfPZUrxXPgYM7y6ANDDXCOgs8EeLdJuIU=;
	h=From:Subject:Date:To:Cc;
	b=sHtpEBEhN8aV54g4n630xVvX5grEtjQF6eEzFIu6irPJ2o0LOElCtM5i0h0mmdxbl
	 wPoq6uAj3SMfjGtyRDZ7Z+DdKm0UGzLuHwr41mtlui6hgWnIz5z7Jqrxpg8UrqfSAE
	 X+qH5dfBo8BeBOUMj5RVAFX9Bv4W/glyDKIUICvzSIQlcJ4TohFhkbhwp4WloTikuk
	 +SnF/wY7Sd5geLJIaxj/QaydPj44xbCGWWpHC+PqHLo/nWAUW6leAoFVZK8BglNE1J
	 5d8aKOeJ6o9X+rrHwnqtO250YNsNN2KY6ZPWBK3VidX1jrYPbS9UdzMobjPpSqO+IW
	 G0nsm2+VuMIGA==
From: Asahi Lina <lina@asahilina.net>
Subject: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Date: Sun, 02 Feb 2025 22:05:42 +0900
Message-Id: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZtn2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIKFbVFpcoluQCJSwMLCwNDIws0xLNrdQAqovKEpNy6wAmxUdW1sLALQ
 AkMFbAAAA
X-Change-ID: 20250202-rust-page-80892069fc78
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Valentin Obst <kernel@valentinobst.de>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=5446;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=lYa739FBsMmfPZUrxXPgYM7y6ANDDXCOgs8EeLdJuIU=;
 b=F/JZiGpp7pVG5cTzcCbqbdB1Briqb0CLln0Ql7ruoo0pkNq6xVwI5VO+3SILodtMfPrJtDrIP
 OJxPqS357wVDzcDfaHa1+XGEvfN6Alc2PpHDzUP6O/JBAcS0Wuz72nq
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

This series refactors the existing Page wrapper to support borrowing
`struct page` objects without ownership on the Rust side, and converting
page references to/from physical memory addresses.

The series overlaps with the earlier submission in [1] and follows a
different approach, based on the discussion that happened there.

The primary use case for this is implementing IOMMU-style page table
management in Rust. This allows drivers for IOMMUs and MMU-containing
SoC devices to be written in Rust (such as embedded GPUs). The intended
logic is similar to how ARM SMMU page tables are managed in the
drivers/iommu tree.

First, introduce a concept of Owned<T> and an Ownable trait. These are
similar to ARef<T> and AlwaysRefCounted, but are used for types which
are not ref counted but rather have a single intended owner.

Then, refactor the existing Page support to use the new mechanism. Pages
returned from the page allocator are not intended to be ref counted by
consumers (see previous discussion in [1]), so this keeps Rust's view of
page ownership as a simple "owned or not". Of course, this is still
composable as Arc<Owned<Page>> if Rust code needs to reference count its
own Page allocations for whatever reason.

Then, make some existing private methods public, since this is needed to
reasonably use allocated pages as IOMMU page tables.

Along the way we also add a small module to represent a core kernel
address types (PhysicalAddr, DmaAddr, ResourceSize, Pfn). In the future,
this might grow with helpers to make address math safer and more
Rust-like.

Finally, add methods to:
- Get a page's physical address
- Convert an owned Page into its physical address
- Convert a physical address back to its owned Page
- Borrow a Page from a physical address, in both checked (with checks
  that a struct page exists and is accessible as regular RAM) and not
  checked forms (useful when the user knows the physaddr is valid,
  for example because it got it from Page::into_phys()).

Of course, all but the first two have to be `unsafe` by nature, but that
comes with the territory of writing low level memory management code.

These methods allow page table code to know the physical address of
pages (needed to build intermediate level PTEs) and to essentially
transfer ownership of the pages into the page table structure itself,
and back into Page objects when freeing page tables. Without that, the
code would have to keep track of page allocations in duplicate, once in
Rust code and once in the page table structure itself, which is less
desirable.

For Apple GPUs, the address space shared between firmware and the driver
is actually pre-allocated by the bootloader, with the top level page
table already pre-allocated, and the firmware owning some PTEs within it
while the kernel populates others. This cooperation works well when the
kernel can reference this top level page table by physical address. The
only thing the driver needs to ensure is that it never attempts to free
it in this case, nor the page tables corresponding to virtual address
ranges it doesn't own. Without the ability to just borrow the
pre-allocated top level page and access it, the driver would have to
special-case this and manually manage the top level PTEs outside the
main page table code, as well as introduce different page table
configurations with different numbers of levels so the kernel's view is
one lever shallower.

The physical address borrow feature is also useful to generate virtual
address space dumps for crash dumps, including firmware pages. The
intent is that firmware pages are configured in the Device Tree as
reserved System RAM (without no-map), which creates struct page objects
for them and makes them available in the kernel's direct map. Then the
driver's page table code can walk the page tables and make a snapshot of
the entire address space, including firmware code and data pages,
pre-allocated shared segments, and driver-allocated objects (which are
GEM objects), again without special casing anything. The checks in
`Page::borrow_phys()` should ensure that the page is safe to access as
RAM, so this will skip MMIO pages and anything that wasn't declared to
the kernel in the DT.

Example usage:
https://github.com/AsahiLinux/linux/blob/gpu/rust-wip/drivers/gpu/drm/asahi/pgtable.rs

The last patch is a minor cleanup to the Page abstraction noticed while
preparing this series.

[1] https://lore.kernel.org/lkml/20241119112408.779243-1-abdiel.janulgue@gmail.com/T/#u

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
Asahi Lina (6):
      rust: types: Add Ownable/Owned types
      rust: page: Convert to Ownable
      rust: page: Make with_page_mapped() and with_pointer_into_page() public
      rust: addr: Add a module to declare core address types
      rust: page: Add physical address conversion functions
      rust: page: Make Page::as_ptr() pub(crate)

 rust/helpers/page.c  |  26 ++++++++++++
 rust/kernel/addr.rs  |  15 +++++++
 rust/kernel/lib.rs   |   1 +
 rust/kernel/page.rs  | 101 ++++++++++++++++++++++++++++++++++++++--------
 rust/kernel/types.rs | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 236 insertions(+), 17 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250202-rust-page-80892069fc78

Cheers,
~~ Lina

