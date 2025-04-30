Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F3214232
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055927; cv=none; b=tODY3UIJh6Hpw2FBh7D42m1aykKUEyTkUPnEvKhgH08yvhhENsCYmpfPZG/klBaU22Ru70HKn65Ub+28EszjM0Acysshb+w2MweoHTdd1mqbJVrsqVe7PMf9VQI4+q1ORnSuHYI8m8eB+Gw7OSkiRkWKWmL7m+S97WwT51cMR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055927; c=relaxed/simple;
	bh=2IXSCxAQK1IjoIyyJV6ZVVYNR6HstECu0ze3b1Aj3e8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k6jpORuG+Zf5rXiPxtLAoytkN+rR2/tUawbgdUnMMKEyzX0YGC0HY6wTEFNW2o6tRLTy20Jgw0pY3Lnblo0MLWtN/UONCTuCZo0qc0gdGXbDb7vToVNiCcQgYRcTufmeqpwbqfbiYr5Fg6wzrKklvx4JFR41e73XWbg5UT4YlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbMWbCYv; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbMWbCYv"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a960f9cso3559165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746055925; x=1746660725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UUPNpg2SiXJoh3gDjKGaVXeCqAprq8Kt9y9t9/VYvQk=;
        b=lbMWbCYv50bpv+D4KTzvrm6VBZfLgC0l//AYmJX4xYB61+iYEFRYn6hoBAbU48sHjd
         KCK94GB0zZ1UeKtvvTn3vExNVHqA0OmmkCU/Ve5mCuygYe8/ZNCWlNhe9px6F6w++UKD
         jOh6KHpBPuf3o07E57HTk5YnAA+c5Vim1CSBErE3KkXCsdsNb2synQsbGhOWrGvsqNqC
         V0qwqj2oIwlRh0NPTb+ep6x7qSpu8THq9QS8AQmBU5YuC5RPqFQdrGsV32w4DD1zKuDo
         kLlqIhNRLHU58QoAulK3mML1W1BJJWQjsMOvao6znV2oTknI26D8spzanSiiga4cfVeb
         yA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055925; x=1746660725;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUPNpg2SiXJoh3gDjKGaVXeCqAprq8Kt9y9t9/VYvQk=;
        b=Yv8D3hEMjFhmihHD/p+1bkukSWeNWX4r4sGE1+Zgiaf4hsoHfQNWoqmJ7Xwj02Yahe
         /gC4NckwFX/I2NxhZykJqcgHHW15W96pWcGSS4jRQybX1bzm2L6O0atiX6FlEDxiFuvt
         b8WmOYs8bvIGWBOCbUz3Id8e80nlUisE2lDVPbkYFVghK2WT6mmboRRf8IODM6Z28Ax6
         1Z2mrt8KWbRnhYH7zPCv0DkIIWGOyr9GlCZ+MLp8RIADW8hM2QlioQ5d9IoKU0+tqUFP
         Q+qHA8Ho7iS93Z4GRthGEUcPcvSschl/TvytMqh9c2JTZufs208aY3VN5ZDr28ck5Ckh
         mkNQ==
X-Gm-Message-State: AOJu0Yweth5h4PBCY4lJvBbnaG83J3SgOAOjra1nVDIKZmk9l7BFpHZK
	ctAkGH4XahINgEFWdGQxOgSzJ302wNQjaQDERwjGpd6J6j+F9XQIVV5peoHQ/NI80xDMa/Qu+sp
	IbeQ6Mg==
X-Google-Smtp-Source: AGHT+IEoFBZzzwGVgh7Jcc7yA33g8yDisN+U3HY2n97eEDTe4IEERnku1d4CRxQwNvjFLgMPyO/hKmcfFPU1
X-Received: from plbiz15.prod.google.com ([2002:a17:902:ef8f:b0:223:5693:a4e9])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54f:b0:21f:61a9:be7d
 with SMTP id d9443c01a7336-22e042529c6mr12584565ad.49.1746055925617; Wed, 30
 Apr 2025 16:32:05 -0700 (PDT)
Date: Wed, 30 Apr 2025 23:31:55 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOuyEmgC/1XMQQ7CIBCF4as0s3YMoC3iynuYLgQGSqLFQNtoG
 u4uNnHh8n/J+1bIlAJlODcrJFpCDnGsIXYNmOE2esJga4NgomVHcUJLevYuY5rzhAdjW6MkaWk 51MszkQuvjbv2tYeQp5jem77w7/qD1D+0cGTY6Y6k0VIJ5S4+Rn+nvYkP6EspH/QeudqpAAAA
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746055923; l=2454;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=2IXSCxAQK1IjoIyyJV6ZVVYNR6HstECu0ze3b1Aj3e8=; b=Wu4XT1MSnUdPyyHtcHEzocFIXWRxUkBuHva90Eb853UM3JZtAKOtNV2d8B0qxgoYPzw/XK9hS
 429CiACJrYKB8WhKasKdlKkvhhm3Wm8BOJuCzixo7VmMnHFUwEjC59h
X-Mailer: b4 0.14.2
Message-ID: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
Subject: [PATCH v2 0/4] rust: DebugFS Bindings
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

A few points that might be worth discussing on the API here:

1. The handles returned by directory and file creation currently remove
   themselves when they go out of scope. This behavior can be suppressed
   via `.keep()`. We could flip it to the other sense, and require that
   a returned handle be *explicitly* upconverted to get removed on drop.
   If we did this, we could consider making a different default for
   `subdir` vs `Dir::new`. The downside of doing this would be more
   complex types in the interface.
2. File creation currently returns a handle to preserve expressiveness
   (the ability to delete a file without deleting the directory it's
   in). I see (e.g. in ceph) explicit deletion of files, but this
   appears to be legacy code from before `recursive_remove` as opposed
   to wanting manual deletion. We could choose not to provide a handle
   here.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
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
 rust/kernel/debugfs.rs          | 345 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  11 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_debugfs.rs    |  37 +++++
 7 files changed, 398 insertions(+)
---
base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

