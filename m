Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B991230BCE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066335; cv=none; b=B6QxMV1TB77K3gN7zkggAfpMfAT3cO1HTFfVUwrAkzSHxlyeisf6lUGO01TExLHHYse59078oqXwdXwMMM70mlYpm4IBWYQ26FZDJtlmlnLkVJ4X/oxzgtb18HNtzQmNbbXAQfQYsKfRe/h4suyEbZ31YRJLGD1i50iFpwXASHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066335; c=relaxed/simple;
	bh=V6cqGxp/ZuL8qxcLVIVgwPl1l5uM7kE5S5r5utUd/+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=s5/pkN1PZOAmz6ZxV7rIZLMtUZs4kN3mxNmld7aLZHj82CzWMiu2yNa2W89W3DWQSZlM999cPRagjTDGo5QlVytP6/RI87pWyByU+zcVAJ6TsF/hzMOGMctVfqbihGgLD0y5I8WFciHNRbMYznxwLtI5UU8U6Ln4I28RB7sKFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QUTI9tI6; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QUTI9tI6"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-60bf020e4a1so309775eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066333; x=1751671133; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NibTw2xmj+O05zXi1sGzVHQUi3irSfaYgTqcAGb3xWI=;
        b=QUTI9tI6VqxqXN2D0scqVq5gDTav0rxYFFkhNooAsUgErKD5eWto9bLovZZGzksxyK
         /PU6dNQNCDPG7qoBlGxQWoSztQ/n7F1awl+oawLMc5ekORw7nqciw5FNSLfox6G3hda/
         oVVXMn/3g/l5/CZe4DFMjGRJe0DQt6UXzP0QWuUesc4x8PWp++hddEzZuS4yrT2AUvjV
         WBfnFCv/pHwHnUMD4jGaqlzvnQ4mqzIGtTCR9XCP916AHeUrM4ULT8GaEezoW3ddTDTX
         k5Lk0FPaE4NQqyN6nnkwLC79jFYVVFx/ZDS3lFUuqrMmB3P9hHTRccDNtJ2TBWsxChBH
         nCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066333; x=1751671133;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NibTw2xmj+O05zXi1sGzVHQUi3irSfaYgTqcAGb3xWI=;
        b=oQQmrMN9SvqonNAiW0XFP1+z+xPxupzp1IwGZWa8ztSd4q6Ty2InpJujMpNVXEjGXz
         QNXZ/HjHEv2MW7mPPb/ZNJtgNQi5PwOuPcU6YTYog6DN/wZd25kwwrQOoe8Oof45ePLm
         yWPWZFNMhgGLF6NrKZ1tx/+IlVMDI7L73iTtC+A+ZdVeuHZzUNGrhwL27mZd7zxeSsCb
         lBTuuIYPHce882INhqVs5MCc1MHYDH/TWrfrIJcvSYGIiS3P+tHv8Wfe4dNrKz3MJRTK
         yQ9UAbiwLpjiXRnJH4UM3C/GUyXd2YbSQvo6BIDRuKifRfXZHcKgVKyYtOqeiQHPsRdv
         pk+Q==
X-Gm-Message-State: AOJu0Yz/l+gjleA2M3bE0GGMkMwolxRslG/tIzub8X/f/IBpdBv1g1EX
	NO1SGEsOvE6NJZ/E1aY4x68NoVQrAbhZyzFcgjyDyyaZ/PzCqncDRBK45FZqQHEaJxUo+Q1xbHV
	xOPqzgzL36A==
X-Google-Smtp-Source: AGHT+IGqDU6rXGYciOyPtptdlc+ILdJduY1SSfjvrzHHEl7hp08rtRCiXUlDSkUZ9O12bt7rGTyAyUImpEbs
X-Received: from oabrb8.prod.google.com ([2002:a05:6871:6188:b0:29e:954f:9ae])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:6c12:b0:2e8:f216:7b23
 with SMTP id 586e51a60fabf-2efed79329fmr3132161fac.37.1751066333180; Fri, 27
 Jun 2025 16:18:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMAmX2gC/2XQ0WrDIBTG8VcpXs+hx+jRXe09xi7UnKTCVktsw
 0bJu88URlNz+Qm/v3BurNCUqLC3w41NNKeS8qkO+3Jg8ehPI/HU181AgBYdWN5TuI5D4dO1XLi
 KvY4OKWAvWSXniYb0c899fNZ9TOWSp997fZbr63/IPYdmyQU3wRDGgA7c8D7mPH7Ra8zfbC3Ns
 NFKNBqqBrK9clZbCWGn1UNrIRutqrZaWOMGHwzCTndbDY3uqkZrvYsmAiHutN5q3WhdtSKnImE IaGinzUMb2Zx/NuvfED2BlEEqtdO40dA1Gqt20VqlPXoQzzdfluUPAxwF4x0CAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=4274;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=V6cqGxp/ZuL8qxcLVIVgwPl1l5uM7kE5S5r5utUd/+8=; b=fGEyLF2D94Kk/OjcGu+yKeb71tWimPkrfHELFcwqxw+hYA0HsI0pXWphb9tEjUY0h7aYkNdr9
 9GTVghNPnFNCNU4pY7pZ03xhLQV9Dnv7AHAHgeOZULKuIh2lFymKHLj
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Subject: [PATCH v8 0/6] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
module using them.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v8:
- Switched from casts to `core::from_{ref, mut}` in type change
- Link to v7: https://lore.kernel.org/r/20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com

Changes in v7:
- Rewrote `entry::Entry` -> `Entry`
- Use `c_int` and `c_void` from kernel prelude rather than core
- Removed unnecessary `display_open` cast
- Switched from `Deref` + an explicit box to `ForeignOwnable` for
  attaching owned data.
- Made `&'static` and `&'static mut` implement `ForeignOwnable`
- Swapped "driver" to "module" in sample code
- Link to v6: https://lore.kernel.org/r/20250618-debugfs-rust-v6-0-72cae211b133@google.com

Changes in v6:
- Replaced explicit lifetimes with children keeping their parents alive.
- Added support for attaching owned data.
- Removed recomendation to only keep root handles and handles you want
  to delete around.
- Refactored some code into separate files to improve clarity.
- Link to v5: https://lore.kernel.org/r/20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com

Changes in v5:
- Made Dir + File wrappers around Entry
- All functions return owning handles. To discard without drop, use
  `forget`. To keep a handle without drop, use `ManuallyDrop`.
- Fixed bugs around `not(CONFIG_DEBUG_FS)`
- Removed unnecessary `addr_of!`
- Link to v4: https://lore.kernel.org/r/20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com

Changes in v4:
- Remove SubDir, replace with type-level constant.
- Add lifetime to Dir to prevent subdirectories and files from outliving
  their parents and triggering an Oops when accessed.
- Split unsafe blocks with two calls into two blocks
- Access `private` field through direct pointer dereference, avoiding
  creation of a reference to it.
- Notably not changed - owning/non-owning handle defaults. The best read
  I had from the thread was to continue with this mode, but I'm willing
  to change if need be.
- Comment changes
  - More comment markdown
  - Remove scopes from examples
  - Put `as_ptr` properties into a `# Guarantees` section.
- Link to v3: https://lore.kernel.org/r/20250501-debugfs-rust-v3-0-850869fab672@google.com

Changes in v3:
- Split `Dir` into `Dir`/`SubDir`/`File` to improve API.
- Add "." to end of all comments.
- Convert INVARIANT to # Invariants on types.
- Add backticks everywhere I found variables/types in my comments.
- Promoted invariant comment to doc comment.
- Extended sample commenting to make it clearer what is happening.
- Link to v2: https://lore.kernel.org/r/20250430-debugfs-rust-v2-0-2e8d3985812b@google.com

Changes in v2:
- Drop support for builder / pinned bindings in initial series
- Remove `ARef` usage to abstract the dentry nature of handles
- Remove error handling to discourage users from caring whether DebugFS
  is enabled.
- Support CONFIG_DEBUG_FS=n while leaving the API available
- Fixed mistaken decimal/octal mixup
- Doc/comment cleanup
- Link to v1: https://lore.kernel.org/r/20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com

---
Matthew Maurer (6):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: types: Support &'static and &'static mut ForeignOwnable
      rust: debugfs: Support arbitrary owned backing for File
      rust: debugfs: Support format hooks
      rust: samples: Add debugfs sample

 MAINTAINERS                         |   3 +
 rust/bindings/bindings_helper.h     |   1 +
 rust/kernel/debugfs.rs              | 268 ++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 155 +++++++++++++++++++++
 rust/kernel/debugfs/entry.rs        |  66 +++++++++
 rust/kernel/lib.rs                  |   1 +
 rust/kernel/types.rs                |  58 ++++++++
 samples/rust/Kconfig                |  11 ++
 samples/rust/Makefile               |   1 +
 samples/rust/rust_debugfs.rs        |  76 ++++++++++
 10 files changed, 640 insertions(+)
---
base-commit: bd243cb5d922cc6343007a3f3918c8d1970541d2
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

