Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797018DB14
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213698; cv=none; b=XOVBJtCyvKzovsXN7bby7hcdPPSmZmh7hykvqZFw2nGLLcfOLfJ6L0A05NjNQqKvq3Cd2YSHvjydyTwza8t+1eQf2lmPMvMObP2fMCepd0+8Z0Ci8xo/mzdEMg5LbUPHu7XaJYoJbEL1jI09aY4QSF6cfToZgSDH3/EA8ph5ces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213698; c=relaxed/simple;
	bh=mV8ymfE8IJCTlr57pIaUkjjQqv+n1PVhQwCW8ON3SlY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P24UnJcKSahrHDOlkRMvGKIdmVnjqQqelWmi0iOySn440/r1IuO4aFAywWrbqsu/sIK5fEdIE0prT+PD1sjJZ7dGIXTFrTHbnH24CdnT9pUiuj1+cyoI/ChPc3BOCR0kZ6NctLA+T5y3KLbD1VE/suS56ZpAj/one1EP92TdKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DkGeu4jE; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DkGeu4jE"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so5516062a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213696; x=1750818496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i5VdGopPyPlPv6tW2nbP0nPRJ7+YO+9k+z/SUgGDroc=;
        b=DkGeu4jEzchL4jRtVlYN0HMEK7x6yZs/5WBYOuRUcibZ/PDYphsD20UOjeFYdxXQ6y
         0faRHZ7SPYgIQc0oPu14hZAHke2aVLDLXeZ7tR5sCX7HW7uTdnGmBpQ+OQOiF0LkVLI1
         GQBcZcPY3LRH9/YBQJj5t5vI+PRFujufT5jPfQmYkeZLqgofeqIa4kPVNeA0zVoR4QsQ
         d360tNZW1ro7x30evwtslW0ANxphqcv4x6xgcVg3FjQ9wXZICQRgDKgzrzXZ3dYD99ov
         fbX4iqVjTi2t03R0qDn2tjbN4gyhiBijZG95H+YJ4uPnE9IUoCh0rwvImIoJSWWcubqF
         lMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213696; x=1750818496;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5VdGopPyPlPv6tW2nbP0nPRJ7+YO+9k+z/SUgGDroc=;
        b=NWoMHgVRiCj9jcL9Wf3HdTkCzmkJiLagBLsKrG8dERwh7yfQptsrVX4Q17s8IRu+eU
         CqHuMr1mnaiOX5nX+pCBYkaMjK3+fqOzRcsxRB75rbHjtytPbtzN9ja7kBPiQldECCui
         wpu0G451EFgdD8GpHrVyd5MltQrBEwPUMF9OKp0NiEwYXvhnc7vnmm27vA7TleD7dU47
         VKMcLmlJUHCoh9RKIA6mhur5Q0qypznb65QOahCngXiWQ8Qrl4py8ofvHlK1io0qYb/I
         3TI0N1UJ7+EveS1BhDTphymOwEtRoggUZvOx/0J7hDGPg1GMvwQqusHjGyzrrR8sYAsd
         5yaQ==
X-Gm-Message-State: AOJu0YzYDGoDsMRQmmShD2KDC85UL+lBdCS7VP/ff7n1tGzYM5YEhKZS
	7EtIY9SrB9T9brBJB4QMXeDDdeDR7CawyMKTA3khxiL+aB5Ce/dSW7KxSjUAzh/JXK7Ftua8st5
	7QH5FhiRXHQ==
X-Google-Smtp-Source: AGHT+IFFbtijFnq4O5ryIdfCSLf7A2AFxkgV2jgmILFr634vxpqCgeIHxrpO9JFhDPqOUHK4dMf5lgIS2n4C
X-Received: from pjbqn13.prod.google.com ([2002:a17:90b:3d4d:b0:312:3b05:5f44])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a4a:b0:311:eb85:96f0
 with SMTP id 98e67ed59e1d1-313f1deb681mr22268508a91.29.1750213695911; Tue, 17
 Jun 2025 19:28:15 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADwkUmgC/2XMQW7DIBCF4atErEMEg2Ggq96j6sLA2EFqQgWJ1
 Sry3UsiRXXs5XvS999YpZKosrfdjRWaUk353IbZ71g49ueReIptMxCgRQeWR/LXcai8XOuFqxB
 1cEgeo2SNfBca0s8j9/HZ9jHVSy6/j/ok7+8z5F5Dk+SCG28Ig0cHbngfcx6/6BDyid1LEyy0E
 isNTQPZqJzVVoLfaPWvtZArrZq2Wljjht4bhI3ulhpWumsare1dMAEIcaP1UuuV1k0rcioQeo+ GXvQ8z39RTpSooQEAAA==
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=3520;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=mV8ymfE8IJCTlr57pIaUkjjQqv+n1PVhQwCW8ON3SlY=; b=6Dnru6CcnPrhfLk1jyilTXuaRZiI1FL7MVC1kuiu84PrNk0QBdhSazcWdf/T0xqPogln8yx95
 dPKTJ0w9hsyBJkm9yyvyT/wL6OCRk3VoidsHNpv/1PeoOutz0pmho6S
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Subject: [PATCH v6 0/5] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
driver using them.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
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
Matthew Maurer (5):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: debugfs: Support arbitrary owned backing for File
      rust: debugfs: Support format hooks
      rust: samples: Add debugfs sample

 MAINTAINERS                         |   3 +
 rust/bindings/bindings_helper.h     |   1 +
 rust/kernel/debugfs.rs              | 218 ++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 115 +++++++++++++++++++
 rust/kernel/debugfs/entry.rs        |  66 +++++++++++
 rust/kernel/lib.rs                  |   1 +
 samples/rust/Kconfig                |  11 ++
 samples/rust/Makefile               |   1 +
 samples/rust/rust_debugfs.rs        |  76 +++++++++++++
 9 files changed, 492 insertions(+)
---
base-commit: 6a7635cd013da3b41bf1e66bbdb9ae4a570d7449
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

