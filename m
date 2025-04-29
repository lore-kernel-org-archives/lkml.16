Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100C111AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968559; cv=none; b=kWDDnFHZ61AH2OVIbowBtWH55w8EZPKPyv1Pmo0X3N1XEyNjzDUCezjA3MQD2ygqF3xHP1xMxB/k77vivIgqB5pp8Lv8iQ/z+7AvaM9ClY1U1RFFw/EfhCfbGTlN+KANbbeL/ohBj8sj73MD+Pt9FxXMUM7labyvxfhE33fFnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968559; c=relaxed/simple;
	bh=Q/SqXSGrDUVNXO13SByCVzX5f60aYdl/C/Qfm4Pd+HY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qw91J3tWBLSXA0z17GlRX4OX1C/3H7dpN4CvWac/gEQ7BjNaiTOHbwo3pHUX/oxTSvV/3eWjkQD/6/OQp8dxyJh4pGhfT9Sa3cHK4r/kHLNuU95vh5NPMGTwqZW7WPKSp+CliK61OFm6pCFCRIuYbErYlIygdNJzvkOq1rxqDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6GBQBJO; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6GBQBJO"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so3730658a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968557; x=1746573357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvHasbdrqHnRr2bFcoCGhq8YWp707coUbqqX9FvGybc=;
        b=e6GBQBJO3KjZe7wMnCy8ru0Idlkbs39bk+5ywGVt1zq+T8fiwWSA6bKw7WepQQLH5B
         NRgbX0q5RXw7t2LQWEIOQ3/X/Z1hACEvcwixaFQkifwjQGSaYAbDTYlF3BiGHY8VPMiA
         mxdtab3PSzFfOF1WsYiNFxI87qoKCv8anMtEVqv/ss/WNLeGROIgyoQT3Czt2ap19i8v
         +yidXGzg36Oz28eJNZKc0XNc41xpebvVwboO5LiWKmnNpD329CNjTLF5aShUzqI5yGnd
         KyMxCfKyUhjZKKx6QsR9rLhW5ZCe0B851zNbeoFOL+qI49KKPgqDR8xSt2HPBrPyDvio
         Gttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968557; x=1746573357;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvHasbdrqHnRr2bFcoCGhq8YWp707coUbqqX9FvGybc=;
        b=nzBlzohdFGVO8mone3uKqhzhN4mWM4DA+itap//cbNdw1LQvVfSbX2my8s1vyD6Foy
         gnsY/fQs9BcyzuVgH6VkM9aW9Om5jdpnrsgve19VCOrz++PWdgFGfTO6zFWZ2iUkcu+9
         eQ3vatzh69dS+soJSJnYJ5poieqt52eeT0VwX0gPcmpstd0Vc2Md3eFXGFbG//TtWAJx
         AwI9WYuNguy+PUUiFVvcLf/tY1rSPY06rH/QlUW1nGvU1hPlX209hBXsS/VSp//djzWz
         dcpzcLGfDVaqDy9qavkZYTgemIttQNufXzoOREyN7XRa7t0LsZLq3RF5RJjJ6XKVnxyj
         S0WQ==
X-Gm-Message-State: AOJu0YwRZoy892m8lg/aGHBlCn42O1UQtAGqCHnA8wZSB4LO46Lwm/aZ
	048icNVSyTk0AzU6vhXezSIavGo4xFBX+61W/gM5hHaLm+21ImruAYDKyy3+os/qKF95uIfK1xI
	T6CFTEw==
X-Google-Smtp-Source: AGHT+IHq+w2cCbO/M9HoH8b8h4DsTEAjLlYCp3EEJURNXFTxgJl5mq24l5c6RY3b/U6TDHJGOvIe9FGvZhRF
X-Received: from pgg19.prod.google.com ([2002:a05:6a02:4d93:b0:b0b:2032:ef98])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8cc9:b0:1f3:1d13:96b3
 with SMTP id adf61e73a8af0-20a87644941mr940076637.5.1745968557335; Tue, 29
 Apr 2025 16:15:57 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKpdEWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ZTUpNL0tGLdotLiEl3j5BTTZEvz1CTzFEMloJaCotS0zAqwcdG xtbUAgYl0Y14AAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=1626;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Q/SqXSGrDUVNXO13SByCVzX5f60aYdl/C/Qfm4Pd+HY=; b=LY/oTLNRim6nOlJZ9YVR66AfhzN3K27e8w+SOfhDoVN57g2W2k0JAWaDs7xt9VZZ8Gx6iWYgm
 eXUCXY4cNDHCto5eEebOOOAmtrrIBJYEF9hx7FFoONf9k8JRzk8lK8D
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Subject: [PATCH 0/8] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
driver using them.

The primary intended way to use these bindings is to attach a data
object to a DebugFS directory handle, and use the contents of that
attached object to serve what's inside the directory. Through a
combination of pinning and equivariance, we can ensure that the pointers
in the attached object will remain valid until after the DebugFS
directory is made inaccessible.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Matthew Maurer (8):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: debugfs: Add scoped builder interface
      rust: debugfs: Allow subdir creation in builder interface
      rust: debugfs: Support format hooks
      rust: debugfs: Implement display_file in terms of fmt_file
      rust: debugfs: Helper macro for common case implementations
      rust: samples: Add debugfs sample

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/dcache.c           |  12 +
 rust/helpers/helpers.c          |   1 +
 rust/kernel/debugfs.rs          | 514 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_debugfs.rs    | 120 ++++++++++
 9 files changed, 663 insertions(+)
---
base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

