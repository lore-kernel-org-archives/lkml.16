Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAABD243370;
	Fri, 30 May 2025 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633374; cv=none; b=L9MTWKMomOrSxgLQ81gIrOqNM2lBxAgwMc1FNUYhRviljq++eJYZm5o6eMDmUB3YkW0DHLHeh8dTCHiBh2rt4e2C5TGNSXarBPcDzSdRh7eYJyh+lwYKU4gT5qDY3HYGtMMeFitsWqtMiBXrYq5zGomSyaLDj+YV6UeEAmEAvTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633374; c=relaxed/simple;
	bh=Bg1CGr9WZYQeCoR4Ep58Es28vcVw6k5/RLjf2QaPpAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MzieK2SYRx9AxmullVep3ygN8Ch82hgKpN7in1b1PPZ4UvSvXmbA1LaXWxjJcMf6Nn2tLb2Fbpk6Yx6bp+YDkJaxJaoAdKa0NW6zlp9JlzikNdrxUIrbqSnf6qqSXLceMqLau7k7/FdD9l1FeVf+7h55JOU6tQbaU91l2PwDFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b8Cwf6Lf6z9sn8;
	Fri, 30 May 2025 21:29:22 +0200 (CEST)
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
Subject: [PATCH v7 0/9] More Rust bindings for device property reads
Date: Fri, 30 May 2025 21:28:47 +0200
Message-ID: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8Cwf6Lf6z9sn8

changes in v7:
* Fix a typo in a commit message.
* Fix bug in `FwNode::display_path`. I took a slightly different
  approach than the one suggested, using `Either` to handle the
  owned and borrowed case. That also removes the conditional
  `fwnode_handle_put` at the end.
* Move `FwNode::from_raw` to the commit which first introduces the
  `FwNode` abstraction. It is needed in an earlier commit than before
  and I think it fits better there.

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
 rust/kernel/device/property.rs               | 590 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  60 +-
 7 files changed, 679 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

