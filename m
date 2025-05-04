Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84659208CA;
	Sun,  4 May 2025 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746380331; cv=none; b=K5WZtAqugyl+4tMsi0fuKXaOjmd13SablBpetn7wKv/sQvXbDKgzjHK+0lQ2LHIHB6cOuwm+gHa8DqTqq56t5InSXnJiT923xTnypjEsO0WRXxayh7qOrd9iplLs5x++JngFS7XP4n2QQTnUP5f/e8taCVQc22OZvob1jx3jJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746380331; c=relaxed/simple;
	bh=n37hyKi33LeDMvALklQL5Uxbof2nImxoQ0ZBuc6q0DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FC2XcFVnR5OrX3NIYU5Z/ANW5/lePGy+PJwpaGLCLEWbBD9u054RFW6Elsfvgq2KNWCi5v41t8//M8tPwPb5HoVQMI8XZS8c3N9yGLruDd33O37BNy0tacFx7wk//XR0t9mL2GDPJOu7Dp0nj90FkUtUCRgsz5MexLroEQpz0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZrBYC5GKDz9slL;
	Sun,  4 May 2025 19:31:59 +0200 (CEST)
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
Subject: [PATCH v4 0/9] More Rust bindings for device property reads
Date: Sun,  4 May 2025 19:31:45 +0200
Message-ID: <20250504173154.488519-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes in v4:
* Avoid code duplication in `FwNode::display_path`.
* Add missing safety comment.
* Replace `PropertyGuard::required` with `PropertyGuard::required_by`
  to associate logs with the proper device.
* Split commit moving property_present into three separate ones:
  1. Create FwNode abstraction.
  2. Access FwNode via Device.
  3. Move property_present from Device to FwNode.

Best regards,
Remo

Remo Senekowitsch (9):
  rust: device: Create FwNode abstraction for accessing device
    properties
  rust: device: Enable accessing the FwNode of a Device
  rust: device: Move property_present() to FwNode
  rust: device: Enable printing fwnode name and path
  rust: device: Introduce PropertyGuard
  rust: device: Add bindings for reading device properties
  rust: device: Add child accessor and iterator
  rust: device: Add property_get_reference_args
  samples: rust: platform: Add property read examples

 MAINTAINERS                                  |   2 +-
 drivers/of/unittest-data/tests-platform.dtsi |   3 +
 rust/helpers/helpers.c                       |   1 +
 rust/helpers/property.c                      |   8 +
 rust/kernel/{device.rs => device/mod.rs}     |  20 +-
 rust/kernel/device/property.rs               | 557 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  71 ++-
 7 files changed, 654 insertions(+), 8 deletions(-)
 create mode 100644 rust/helpers/property.c
 rename rust/kernel/{device.rs => device/mod.rs} (95%)
 create mode 100644 rust/kernel/device/property.rs

-- 
2.49.0

