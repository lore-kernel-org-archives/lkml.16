Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D145419F12D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139667; cv=none; b=IBLcbOEKUaw93/QY1GCxh8Io6nuq38g2JcWqEaOIGMNw2WFCHOO73f6wPkRfvTk5wjZMdKSCeQ3FENF+khBGlXQD8IrfiMAJoHWKpxPbO1AD2pnnK6R1ouhIbbwIOjSSCeNd4c2lx263Z+/WVZMpNztmfs1m+plrC0qTOPS4p4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139667; c=relaxed/simple;
	bh=+sEHQ5a6ov4c05sHc/JUKrhbuajuBghx/mSe8CxfB7Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iVZPxhRwFiBFSVjK31nye7A8+Wr2az0eVuthjdCSAROOGFlSam6vKdBLILhqpcUy6W292Z+tXaL3Jn9urBAHJ4M5uiFfMEvEOmFqX9qfn0bXSwI2M02ux5v7KYrByVBsMZ8rtIvbGr7yyDk7W8yp4B5UfBWUCHYZpJreKCjAgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F9YeMzTX; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F9YeMzTX"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7395095a505so1133509b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746139665; x=1746744465; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NivNxUC2NDqVrkobtJmoapSJ3o66sFfu75Pr8p73xkE=;
        b=F9YeMzTXhjywf+Mc7+WWYTbvPcNWVRrQWdy2oJ44ePEqYIQ+Dm/zYJmuLzXO6A5Qyt
         yeNzXfVCCotnWvSjb64LcKmd/xkPFsb7H0eHPYS43z751SJ42lnV4dFHUjKfgGSe70XX
         JsXEfqgDHN58Y83y7nl076pxR6qLTkFY9P+5L3DaV5xpuCloi1BXu55bLEC2EX8SLVtm
         t0YAgFzsgFDZ/0gBmLQq9BIcRibssDXWDO1/xtbj+9HgsV1aacrI3KzYUGdIYSoxTC2C
         +sev0Y4l1qvtqsotDvR/PwjEPuvxWfavKPZsCQ7B7Nw7JsmheQW35trbqae790OY5nV2
         Jccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746139665; x=1746744465;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NivNxUC2NDqVrkobtJmoapSJ3o66sFfu75Pr8p73xkE=;
        b=SWmkps5NrqspetGX5Kg7WDkopVa09PZ9xm9KRTtxyTiwWaYG0xPLcSGu6ZlXPUhygK
         OeE5kVxVEkQzUE06KUZJQjk/bTugyrgWMhDbcBfqxDdumjNi9GA3Y929z5PezfvzpUbk
         PMUSxMaElE7JUcaF986/bwApxkS16N7FYwtZYK0mYbnbPQEFTCv0waOVOEcLUfr6JWtZ
         XI6H51DEcb5y1b3p0sY6TauoIPBmwY6hFUfwfmyh8rly1XhruTsNtOwLfBcmaohcgOeA
         deTFUFozPCbF0m7pwVXAJIXpID2ND/DuBiZwrPa9XQvZlVmnpUIHNz9VlDNvPeCbvVrz
         Zmuw==
X-Gm-Message-State: AOJu0YzWan1PRzEKvp0MQfs3MFbGvrqyrGr5F2bo1FkhKOPXy0yJXYMM
	WpbWYjr+5TJLqrJB7L3bhSu+c+MPyTR+0OWxn2C6uIi1kmVvvxvC9NLqHGRz1/nebQdPVsV4l0B
	Qp4bsRA==
X-Google-Smtp-Source: AGHT+IEQ7LN6nOd2RQOaDvcu0iiE3EfxbAhqLFzbuOYSZdCZwIty37mQeS1DKKhzAugu+3PL5hVpAPVxJNkz
X-Received: from pfoc21.prod.google.com ([2002:aa7:8815:0:b0:739:45ba:a49a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9304:0:b0:736:5438:ccc
 with SMTP id d2e1a72fcca58-74058a20e45mr825131b3a.9.1746139665007; Thu, 01
 May 2025 15:47:45 -0700 (PDT)
Date: Thu, 01 May 2025 22:47:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAz6E2gC/13M0QrCIBiG4VsZHme43za1o+4jOkj954TK0E2Ks
 XvPDYLW4ffB+0wkYfSYyLGaSMTskw+PMviuIqa/PhxSb8smwKBhB5DUoh5dl2gc00C5sY1RArW
 wNSnJM2LnXyt3vpTd+zSE+F71XC/vF1JbKNeU0Va3KIwWClR3ciG4G+5NuJNFyvBTc/ZXQ6kBp eVKNrIGvannef4ArceSdOcAAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746139663; l=2353;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=+sEHQ5a6ov4c05sHc/JUKrhbuajuBghx/mSe8CxfB7Y=; b=xUdA9bF7k9AvDp1lDH/YhMaQvblGwM6xdSrhJY7APgWxQz2pHAq6oJ19paTdmACQfPXxDiIPT
 73D+HSeLeEeBizWelj+x5f9Wz5Uwyp1My0XEhCY/3kChOZjN1f1nK+p
X-Mailer: b4 0.14.2
Message-ID: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
Subject: [PATCH v3 0/4] rust: DebugFS Bindings
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

* Directories created in the root of debugfs are assumed to be owning,
  and will clean up after themselves when dropped.
* Subdirectories are assumed non-owning, remaining alive until their
  containing directory is cleaned up. They can be promoted to owning
  variants if needed.
* Files are non-owning, but can be manually removed by handle if needed.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
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
 rust/kernel/debugfs.rs          | 405 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  11 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_debugfs.rs    |  54 ++++++
 7 files changed, 475 insertions(+)
---
base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

