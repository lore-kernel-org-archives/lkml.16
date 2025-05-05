Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A807313045
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489100; cv=none; b=JLvgN1ZqwpuArec7oQBapbbgIuwhjcqG8FyhYdCKh0rU33uH+ppdQpGBJZFrrIKKsSST94QmPPGv/Bv0cDz0ECJOmjkzPZJYF2bV3niszf88aDmEvx80hQEDF/LUn9k2ShSUZkko3tvhO7D7GV34i+psm6HhDCkjHlENBcUwcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489100; c=relaxed/simple;
	bh=oH2RxIhmFUSmag5J1kvWxnXU9MlOOp1OHBb0BWblYV0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WBCBLUODoAA4f9/vfO5xnVyOKkheV9UwIddG0N4tj/oGDdTHxIl4miV6PZRZlNZNNZ25+YSPaADvLBwbYq/yzURng2hG1/59M8Fj/Ew6tcoVafENINNQBwEU6FE34Y7CzcVS1vRZyQIXRJMoVlFYhHXOiDyOEuxL15/VwLZetB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cD2p2LXu; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cD2p2LXu"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72b881599f6so4629667a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746489096; x=1747093896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FDGoua/e8KWqIF27Mp5c33qsl/9R8H4EmsNGwJY/Apc=;
        b=cD2p2LXu/j++2oNyq4lzpCQBzWnQIKW5I1MjKiF1L5Da+OP84fyRvuik9l8P1f/8KC
         uQW93fTHcZi5MngQ9G779T6/xTgBFO92DTPv4KdQjUKVDxx/ComxPEnxIqShGcd3Q4lz
         A74Z7Nze4Lb9S7oOeardBBHQHhnhkaK1GRNa3iK3WdG9dDfi7cPVNbuie7BXH7CmMAcG
         SF7L0wTYVQ99F7e2rGzVOP3hfWpYo9ewTqeq6Xj8cnKWCNO2O7y3YbpanQfxr991CBZ1
         GpU4UC7sbsDfe2ceNuZzZK004wLcHJNzve/iZrJmjW1x7SLWTtZqScfoaXrZXhYRQbiI
         899w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489096; x=1747093896;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDGoua/e8KWqIF27Mp5c33qsl/9R8H4EmsNGwJY/Apc=;
        b=Q73J8Zzcv3Y0MXmCAX5YFEhI6CfDhlEE1EA9dnDrg+TjoadaVysCZ5gwXBbICDySBt
         Jty4+3MRT7FFzzffOM79OiFRjSxmNZ9iYhiyUInhoYi+B1MevR48w1L1eyD4PAwlLVb1
         lThMxBURD1zGdYNbwc/+MISELQ3HN68USQMHAJ9nRAU/nxWcHRrh8yN4296C0V4/mZyb
         Pnm4acA0iVVLlbQIeFuO+GQQ9Kb28Q9okQoZ6acIpz6mypYEH82oM4WQGmXX4V5eIwZo
         h5lPfHtYwY4judMzF2P5E5NkkoO9q2M441f6YTfF5A36fEkJFKnd1i/dpjcrcrLURvuH
         9/dg==
X-Gm-Message-State: AOJu0Ywc8MA10JZ8TdZyeYUO7RNikfDhnhTCKU7c7GbZBAHc51Gfu5p/
	tt6i1UN1pBV0iqzdGF/2bK4CbhSeq00tAtSPsfnfG7IUVsYbRYXKU8Y2KmYz23qPXsPI9dgXfNF
	HH7kEIQ==
X-Google-Smtp-Source: AGHT+IFdNILGYx2as4dzVzS1rhwBE0zNfGJsJV6nVjqTNJ7vWS0WN3DU1uhjpaI4rhOTp1kJDz7mhIcAMuN8
X-Received: from oabsm3.prod.google.com ([2002:a05:6871:80c3:b0:2d5:5a26:d92])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:2b0b:b0:727:3664:ca30
 with SMTP id 46e09a7af769-7320625f60emr879774a34.16.1746489096481; Mon, 05
 May 2025 16:51:36 -0700 (PDT)
Date: Mon, 05 May 2025 23:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAVPGWgC/2XMSwrCMBSF4a1IxkaSm+blyH2Igya5rQE1ktSiS
 PduFEStw3Pg+++kYI5YyHpxJxnHWGI61SGXC+L37alHGkPdBBhI1oChAd2l7wrNlzJQ4YP0VqP
 TgZNKzhm7eH3ltru697EMKd9e9ZE/33fI/oZGThlVTqH2Tluw3aZPqT/gyqcjeZZG+NKCzTRUD WiCsEYaDu5Pi4+WjM+0qNpIZpTtWqc0/OnmW8NMN1VrY1rrlQfU+kdP0/QAlioow2MBAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746489094; l=3113;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=oH2RxIhmFUSmag5J1kvWxnXU9MlOOp1OHBb0BWblYV0=; b=COjhn17B0S4RdtTyxEarzqeSXyEkFtw/vyrwt56VVgTmE5u2IgBI/gUjT+Ql9ZfxulTQ0wR2K
 mZPai76//pODjz9jSNWtMa0HW1DQ6MZkrmcKm+QzlXcYCAxsm2DVtvp
X-Mailer: b4 0.14.2
Message-ID: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Subject: [PATCH v5 0/4] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
driver using them.

This series currently only supports referencing `'static` lifetime
objects, because we need to know the objects outlive the DebugFS files.
A subsequent series may be able to relax this.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
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
Matthew Maurer (4):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: debugfs: Support format hooks
      rust: samples: Add debugfs sample

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/debugfs.rs          | 392 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  11 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_debugfs.rs    |  60 ++++++
 7 files changed, 468 insertions(+)
---
base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

