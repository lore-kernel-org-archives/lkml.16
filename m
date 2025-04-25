Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7CC25E44D;
	Fri, 25 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593322; cv=none; b=po5v0AMSWgZwNmam/szuH0dHRJK4pGL/ZcrETRu3bE268vSWmZf/d0UXXI5aAw2usZg63JnEs8qdXoU0Dkz3ugc4PMPwvu2Qf6YE1O/vNveQDEJ/BiRP7E8YEDvXd/B2SrYrmBwpW8MwsC6eXNltsOB+8qHDSroe7nqgoYaoqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593322; c=relaxed/simple;
	bh=TATDdWHubxkqnktZL0woFYkT0+jsr8JhaVnmyrpNueQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gaAFOqT/THsowV8LiIxMuqAZkrEiK8bPIuBE1BZkZ8nuqBKXPJUPZeTBFD+rEF56Yq7uOMa2Kxuc4dQP9YFYIGWP3w8N58sCJaXD3tRNEDSVV26l/azVAxU1EI8fF+8O4h2cjSZ4omFhFbf5REAE+8QEIWoUIruPSi1VWQJpmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZkbfB0qCVz9svM;
	Fri, 25 Apr 2025 17:01:54 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
Subject: [PATCH v3 0/7] More Rust bindings for device property reads
Date: Fri, 25 Apr 2025 17:01:23 +0200
Message-ID: <20250425150130.13917-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4ZkbfB0qCVz9svM

This adds more Rust bindings for reading device properties, based on
Rob Herring's work. I'm working on a driver[1] that uses these, but the
driver has more dependencies than this.

Best regards,
Remo

changes in v3:
* (started testing myself with Rust 1.78 and doctests enabled)
* Fix doctest and platform driver sample.
* Move property.rs to device/property.rs (a submodule of device).
* Make `Device::fwnode` fallible, avoiding a panic.
* Remove the duplicated property reading methods on Device. Now that
  `Device::fwnode` is fallible, these methods would have confusingly
  different signatures than the ones on `FwNode`. It will be clearer for
  users to explicitly convert from `&Device` to `&FwNode` first,
  handling that error case separately, and then reading properties on
  `FwNode`.
* Split off separate commits for:
  - printing fwnode name and path
  - adding PropertyGuard
* Do not access `fwnode_handle.dev` in PropertyGuard for
  device-associated logging, fwnode_handle doesn't own a reference to
  the device.
* Rename some extension trait methods to be more descriptive:
  - Property::read => read_from_fwnode_property
  - PropertyInt::read_array => read_array_from_fwnode_property
  These methods are not meant to be used directly and won't be
  accessible unless their traits are in scope. (And there is no reason
  for API users to pull them into scope.) Nevertheless, this reduces the
  risk of confusion caused by non-descriptive methods like "read" being
  attached to primitive types.
* Implement fwnode printing logic in Rust directly instead of calling
  scnprintf.
* Improve some safety comments.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/with/507874342 [1]

Remo Senekowitsch (7):
  rust: property: Move property_present to separate file
  rust: property: Enable printing fwnode name and path
  rust: property: Introduce PropertyGuard
  rust: property: Add bindings for reading device properties
  rust: property: Add child accessor and iterator
  rust: property: Add property_get_reference_args
  samples: rust: platform: Add property read examples

 MAINTAINERS                                  |   3 +-
 drivers/of/unittest-data/tests-platform.dtsi |   3 +
 rust/helpers/helpers.c                       |   1 +
 rust/helpers/property.c                      |   8 +
 rust/kernel/{device.rs => device/mod.rs}     |   9 +-
 rust/kernel/device/property.rs               | 578 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  72 ++-
 7 files changed, 663 insertions(+), 11 deletions(-)
 create mode 100644 rust/helpers/property.c
 rename rust/kernel/{device.rs => device/mod.rs} (97%)
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

