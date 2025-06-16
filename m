Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD145C0B;
	Mon, 16 Jun 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088724; cv=none; b=L+iuLNjrE4W3lMaw+Jn/q3o6vSOwMymCVZksDOZx0VZVcg3xv8mOsz+dRxKTUFlMOzhvsarOUU7Pfe/kTA0C6Mto0MMFM7muk4vV0tBLbhO303OGMU5NO04vh54ACcbkNvJT3WXwJuKyE+oR+gYiX3R1RbYwke7GGKmf6QGLisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088724; c=relaxed/simple;
	bh=OmdmJGziaB0kKJKLg50TcUb1C6yOxIqtgjogQETwV2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djvnLYId6WoTypTcKWZjgGIfJamIdz3QuuQoP5WEPb7hQgU4dkp4dkuIy3u6VTR4Pc2rVR25KWsKBIl0hjU22MtI8r5aDcsoLsjtH+L8YwOTleowCWbFZy9P1ogNivZ0bS7ZWAi1RQsffHxt6HcmltWHboZlm98D+BH2f9I4jKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bLZ8G49LMz9ssn;
	Mon, 16 Jun 2025 17:45:18 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 0/3] Add Rust bindings for device property child nodes and reference args
Date: Mon, 16 Jun 2025 17:45:08 +0200
Message-ID: <20250616154511.1862909-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series was split-off from an earlier one. [1]

changes in v1 (compared to previous patch series):
* Fix resource leak of `FwNodeReferenceArgs`.
* Improve documentation of the type invariants of `FwNodeReferenceArgs`
  and how they are upheld at crate-internal use-sites.
* Remove derived implementation of `Clone` of `FwNodeReferenceArgs`.
  It would be unsafe according to the new type invariants.
* Add `Debug` implementation for `FwNodeReferenceArgs`.
* Add examples.

Best regards,
Remo

[1] https://lore.kernel.org/lkml/20250611102908.212514-1-remo@buenzli.dev/

Remo Senekowitsch (3):
  rust: device: Add child accessor and iterator
  rust: device: Add property_get_reference_args
  samples: rust: platform: Add property child and reference args
    examples

 drivers/of/unittest-data/tests-platform.dtsi |   7 +
 rust/kernel/device/property.rs               | 158 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  13 +-
 3 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.49.0

