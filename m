Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A925A2CD;
	Wed, 11 Jun 2025 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637773; cv=none; b=GQa3EaJvFCSSIPtxakhLm9ZaeqmyJ7C2KHXRV/+tBJhJalNez28JASimEKWYnd3Yfc1h0o6PzBDsQnYhLaBzuuoxegz4U4EF4NkbQWH9DwRzJLigLW4zxSptNtNoxaPBgrTCAVEKJHjgu42vWZVajQFIwReho1a2nclNCNlbAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637773; c=relaxed/simple;
	bh=GdfdVxxvPpEPnhvwHt+aDqH4owJvon2RBxJusb+XMv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HAYJOFrK5gfE084uPChyFUCCVXOcf2jAD4Ezuc9I+omomnUZXy4ijiB/1W8W3w6BVUL/hRr1HAk5OELCv6taHBfZrakNfWF3f5OX4mKG/yP58IrbiMN12cMi3iatYk/eJPAvJAW1WrJyLeOSo5MT1r39IZ7xFmM4m6E8znYoLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bHMN81QxLz9tPP;
	Wed, 11 Jun 2025 12:29:28 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v8 0/9] More Rust bindings for device property reads
Date: Wed, 11 Jun 2025 12:28:59 +0200
Message-ID: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHMN81QxLz9tPP

changes in v8:
* Use a custom enum instead of `Either`, which is scheduled for removal.
* Add Tested-by tags from Dirk Behme (thanks!)
* Implement `Display` directly on `FwNode`, which prints the full path
  by default. Printing only the name is still possible with the method
  `display_name`.
* Rebase onto 6.16-rc1.
* Remove `property_present` from `Device` and update users.

Best regards,
Remo

Remo Senekowitsch (9):
  rust: device: Create FwNode abstraction for accessing device
    properties
  rust: device: Enable accessing the FwNode of a Device
  rust: device: Move property_present() to FwNode
  rust: device: Enable printing fwnode name and path
  rust: device: Introduce PropertyGuard
  rust: device: Implement accessors for firmware properties
  rust: device: Add child accessor and iterator
  rust: device: Add property_get_reference_args
  samples: rust: platform: Add property read examples

 MAINTAINERS                                  |   1 +
 drivers/cpufreq/rcpufreq_dt.rs               |   3 +-
 drivers/of/unittest-data/tests-platform.dtsi |   3 +
 rust/helpers/helpers.c                       |   1 +
 rust/helpers/property.c                      |   8 +
 rust/kernel/device.rs                        |  20 +-
 rust/kernel/device/property.rs               | 589 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  60 +-
 8 files changed, 678 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

