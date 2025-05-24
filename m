Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6E1C84DE;
	Sat, 24 May 2025 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748114579; cv=none; b=Hm/4a+Az/BrHFxSOgMtWHY6cNkjNTbYmcgFxfsaY41EQl9yH2nH2f2M2GADE508wqiyAJxN2H7sqnJbsS/8JmrQYxVgAYXdXzkyt5wMV3CXqqSaMVqFytuD/7NnSBWxShfR2iEeBri0jWCWZ7hX0qHLuW+Dab/OPCYas0/LEZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748114579; c=relaxed/simple;
	bh=3Te7J8p+9tjm4i+LynXkCtRx7rheKIHZDoQOWxOPhG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3akVTgVql2DA4zvmRMkmzIFwM+0607+zc/Twl9xWqHdS10ajeQ6vA/fNdpI2EdVl+1xqepeURQdgQoNcSz/um3Wj5sKYh/Yqht/HqwklK2XDEsVzNPO8JX2qgDaRMjmvOYJSI0fkOzbCcs8WMjlHF3aOfcs3dcn6tZ0nzXt8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b4X3r4095z9smm;
	Sat, 24 May 2025 21:22:48 +0200 (CEST)
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
Subject: [PATCH v6 0/9] More Rust bindings for device property reads
Date: Sat, 24 May 2025 21:22:23 +0200
Message-ID: <20250524192232.705860-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes in v6:
* Consistently use markdown in comments.
* Use more lists in safety comments.

Best regards,
Remo

Remo Senekowitsch (9):
  rust: device: Create FwNode abstraction for accessing device
    properties
  rust: device: Enable accessing the FwNode of a Device
  rust: device: Add property_present() to FwNode
  rust: device: Enable printing fwnode name and path
  rust: device: Introduce PropertyGuard
  rust: device: Implement accessors for firmware properties
  rust: device: Add child accessor and iterator
  rust: device: Add property_get_reference_args
  samples: rust: platform: Add property read examples

 MAINTAINERS                                  |   1 +
 drivers/of/unittest-data/tests-platform.dtsi |   3 +
 rust/helpers/helpers.c                       |   1 +
 rust/helpers/property.c                      |   8 +
 rust/kernel/device.rs                        |  17 +
 rust/kernel/device/property.rs               | 588 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  60 +-
 7 files changed, 677 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

