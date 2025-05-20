Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED428313A;
	Tue, 20 May 2025 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771252; cv=none; b=n1EWYkbUxdEl+5kMXt4fWyqnhTWHnH+yvMSyNjy3aY1eoUtPKknQNz6dkCScN4A6q+Ryxons7xhnqdPke/BTyvM5Vdn1bOFbOlCv2Gc96rubCNX5hk5rC5oDjhWIC4U3ZOZ/9vK8B4kHrc1sBzrgyElPaQ1HkG664t3S6pWMjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771252; c=relaxed/simple;
	bh=3jMdP6nY+nDa5rerPzG+npZ7bqrZhfxIqKBZATbtr54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KH1OXoctntXRKXNazEW2NAb6xddE/GgXYiqUb6KSFQsooClyCiuqfCav+lNeCFJm5ybRzNd1YpqHqSMCQ0OSvROLsHq9eZStdYQdwUnDGY/cKLSYopa6AoOS8bYc07iX/KVBHFx+TCsvnMHg5kOTLkf3dNBh9L0RdBi9X45+ji0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b255P2WM7z9sST;
	Tue, 20 May 2025 22:00:41 +0200 (CEST)
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
Subject: [PATCH v5 0/9] More Rust bindings for device property reads
Date: Tue, 20 May 2025 22:00:15 +0200
Message-ID: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes in v5:
* Move rust/kernel/device/mod.rs back to rust/kernel/device.rs.
* Reword some commit messages.
* Leave property_present on Device for now to make merging easier.
* Cleanup Rust platform driver sample.
* Fix conflict with alloc-next tree.
* Improve documentation and safety comments.
* Seal the traits Property and PropertyInt.
* Move more logic into the PropertyInt trait, making its methods safe.

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
 rust/kernel/device/property.rs               | 578 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  60 +-
 7 files changed, 667 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

