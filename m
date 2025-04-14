Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625E2DFA59;
	Mon, 14 Apr 2025 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644416; cv=none; b=YXu5u+dTvrUV02Z9Lcxqu9k+eXreL84ak1reHjtkRGkZpfsZ+TCcQn42pUtcUM9MqcL5ebgzqPJSp/bCXbRXudcJ5wXGc2ruAy/Od3+eyx2cfJsrb2A4afkWpRwdWwXEiVuwmB1jA6o4RtRrDEkrXIGgULamcXG77/dO4nfTKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644416; c=relaxed/simple;
	bh=ASyripazulCpCEuuh7uV7MNd8L4zaWucOvX9GAjK9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgHvAjwipzEWQoYhHySkFWhYuVYF9Ui+iIghU5HRJCSQWOiSdKMXq9vq1Md3CF3fav64HrNI+hQiU2ph/cBI7O0sKRSzfTLCbPPz97iVI00ZDrhQdjKEKwfsDmfX1VCZlwrQGl0CNhTvqmsbdQgC22JZiJAb3L2A+mbVULGIfCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zbrjw5QPwz9t9r;
	Mon, 14 Apr 2025 17:26:44 +0200 (CEST)
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
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/5] More Rust bindings for device property reads
Date: Mon, 14 Apr 2025 17:26:25 +0200
Message-ID: <20250414152630.1691179-1-remo@buenzli.dev>
In-Reply-To: <20250326171411.590681-1-remo@buenzli.dev>
References: <20250326171411.590681-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Zbrjw5QPwz9t9r

This adds more Rust bindings for reading device properties, based on
Rob Herring's work. I'm working on a driver[1] that uses these, but the
driver has more dependencies than this.

Rob Herring and Dirk Behme did several review iterations over on Zulip
already[1], I'm thankful for their great input.

This is my second-ever patch series. I read through the documentation
for sending patches[2] carefully, trying to apply everything to the best
of my understanding. Please point out any specifics if I got something
wrong.

Best regards,
Remo

changes in v2:
- Add property.rs to maintainers file
- Add and improve lots of safety comments
- Use `__dev_fwnode` istead of `dev_fwnode` to express the intent better
- Make `get_child_by_name` not return a `PropertyGuard`
- Squash the patch with the generic read method
- Squash the PropertyGuard patch
- Remove `arrayvec`, abstract over `fwnode_reference_args` instead
- Log the full fwnode path in case of a missing property
- Remove integer trait and export of fwnode_property_read_int_array
  These are not needed now that a macro is used to associate each
  integer type with its corresponding `read_*_array` function.
- Replace `impl Property for bool` with a standalone function
  `property_read_bool` with an infallible function signature
- Extract parsing of properties into separate function in sample
  platform driver

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/with/507874342 [1]
Link: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format [2]

Remo Senekowitsch (5):
  rust: Move property_present to separate file
  rust: Add bindings for reading device properties
  rust: property: Add child accessor and iterator
  rust: property: Add property_get_reference_args
  samples: rust: platform: Add property read examples

 MAINTAINERS                                  |   1 +
 drivers/of/unittest-data/tests-platform.dtsi |   3 +
 rust/helpers/helpers.c                       |   1 +
 rust/helpers/property.c                      |   8 +
 rust/kernel/device.rs                        |   7 -
 rust/kernel/lib.rs                           |   1 +
 rust/kernel/property.rs                      | 608 +++++++++++++++++++
 samples/rust/rust_driver_platform.rs         |  69 ++-
 8 files changed, 688 insertions(+), 10 deletions(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/property.rs

-- 
2.49.0

