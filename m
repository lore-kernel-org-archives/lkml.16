Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CF25A2A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807530; cv=none; b=NKOwn+0JCZWhH3PC1sR758oK2oYP7PS9/2EMETG4poz/Ae3IRM0Y6mpxcJAFLmEQ7A+cGKU1y75/dxguPNTcFlgz1xvzVFjSrZiPIf7v17wHYTWV1HC5LOFkrEcE+1adAgUrga6m77JIUadKBLGziqjNqTLqo43xDrOUyA3cZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807530; c=relaxed/simple;
	bh=8mT8UjU2qMxjhD8yCgsyMcRfzpY8fJjWHf0UoLZXEnU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZVod0a2o0T4d1Z9CmL5msI52wmnSvz9TcCuu4BmwC/uZXSXoW3TS2IKnbxua7n9cDwzR0x7BPFnDO7NW8PH7WjlAj4h/sjtRKCdADWkPC55G/ui/6QOMzUxEjBxBqu3ylmZeFGGMlZOe9aiR8h91plQjp8WD00NwAa0iOpYNZjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipTmgdgk; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipTmgdgk"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7494999de28so1095502b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807528; x=1751412328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xwR9Ph7xL6FQw1V5U2OC1itqD6M4ob5dCKvBhGsmml8=;
        b=ipTmgdgkrUK9uRq69qSZngvFkX0rZ+zKYd4w86LrcLK1MRnZ6EfypPQxE7MJSGSbPw
         NACJrg2zG1VF/BaDsLAAQE/7t1LWDa/BgSoC2SYVGk7NoAvmxiD8sfPtk5WOWnKg3IdP
         iGSi69T3ks80UvfJmhUBZO4SISSRiFIqSTxLMmghRfX6pMb0+Fe5SyVMqdyQMn6qOw3Y
         w+i8fkIuTSJ1OIIo0VCNVEZyiuR61hbF1kztS6wx+OEIF27UtQca+6k9zQsX53h7Bv34
         LLcvXbkhqzskpmvg+9mKJvJkkne0d53x8E8QDjqrKLitdK0riqMNTJffrrOM+rpBjMec
         gw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807528; x=1751412328;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwR9Ph7xL6FQw1V5U2OC1itqD6M4ob5dCKvBhGsmml8=;
        b=GIH+KaHqVPtAzl/v2AiV5+pIGvDODTLPCH6NEYvaqsLIcG8itwC+N+FFybJQmkXKPi
         RlOk5NfY39ZChReRZKGZFVpNjxX+aNHsA1vUPqNUl6zUGWoFX99C6hRNqhC7iAwTxfpT
         mkKkaAHdW9in20l7+n5D34ZR9Jn5p2PnUNgFFfZ1gurHiZ33C/wrxLZOiTS1eL5tv/gh
         0YYZpKUht7GnxpTV8gpvzobb8zpmFg9myUCrzPkQnLCyHKwdF/VuJihblz9aKMSiP3Bq
         oRS+ulAdXQ0QyRWC5Mj2/yOQRFwyklALERApY1lf+TXw6RWVr0ATHJMWjOqdm3VfSjO2
         pKXg==
X-Gm-Message-State: AOJu0YyarY9tIcm8iEQXaKB0deGtyAfr3bWsmAnxhg2Zmop85qNszT3x
	l442zOTJG3EgoPLATHCA6sfC0dZ2eH5amwH8DfAEe/u+Z8bROjAs9D6SMVaLMpTl3LmgHuUY1Gs
	h/M4cq4vYNg==
X-Google-Smtp-Source: AGHT+IGjkD/HdN0tP/LQoRQJzm3G6ocPxi3Vdt8uVdpw7Lu6XpLNIB32v4m9MsjHwWpbYwslFrjXBB/v9GmV
X-Received: from pgkf12.prod.google.com ([2002:a63:f74c:0:b0:b2c:4d7e:b626])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a10a:b0:215:eafc:abda
 with SMTP id adf61e73a8af0-2207f1bf7dcmr1340775637.18.1750807528176; Tue, 24
 Jun 2025 16:25:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN8zW2gC/2XQ0WrDIBTG8VcpXs+hx+jRXe09xi6inqTCVktsw
 0bJu88URlNz+Qm//wFvrNCUqLC3w41NNKeS8qkOfDmwcOxPI/EU62YgQIsOLI/kr+NQ+HQtF65
 C1MEheYySVXKeaEg/99zHZ93HVC55+r3XZ7m+/ofcc2iWXHDjDWHw6MAN72PO4xe9hvzN1tIMG
 61Eo6FqIBuVs9pK8DutHloL2WhVtdXCGjf03iDsdLfV0OiuarS2d8EEIMSd1lutG62rVuRUIPQ eDe20eWgjm++fzXobQk8gpZdKPellWf4AhAQrhN8BAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=4099;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=8mT8UjU2qMxjhD8yCgsyMcRfzpY8fJjWHf0UoLZXEnU=; b=HcKrxNl3SaLDQxS+3PcZfK0hCHT5/5U5vICAcFvIKYRffXIZTRSay7dFRU0n4NktYMKcJD64E
 4V10CRNDRLmCbgD3fFQCAl9i/AzZRM10Q0i5WqgLH1W29D1MMG2s82f
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Subject: [PATCH v7 0/6] rust: DebugFS Bindings
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
module using them.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
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

