Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8A1DD886;
	Thu,  6 Feb 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876090; cv=pass; b=JpNFSNKCtyCkX2KhZ/MkNHQ84iTuLa17KGpeLnzM1lgocWUwWjc0HxIS7wU3sT4DCLLepd4p1sQBcUbIcMbap2qJlq9inAJAkPTXDTDhzEwHUmjVPW3vH6qg6JJD8yZc1HnoTkfTqZJksuc5X7KYAPwgRrZJnnNrPpUJ649Fm50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876090; c=relaxed/simple;
	bh=wLsWvO7G2CDgvUsTos23isyBxWnJ4B7OEzDo0wRP9YY=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=jgV4bzhmrezO4/CcYpOe6Nv1ynKxgM4ZmoS9PcOAC2LGWcqDwMN1Z2NfcYzX5QPZl7DM7XSUBZ5vs68xUcIFMmvt/trtcc9jK62lbhEPX45IrGaVQZ+nrkfMUxidYn2hCKIXmJP7Lop+YXDI4FgbhZ1CfBTfZZYo4ciCsb4Qsvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=dke2mQzD reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="dke2mQzD"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C3D2D843C48;
	Thu,  6 Feb 2025 21:08:01 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-9.trex.outbound.svc.cluster.local [100.124.213.208])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 44C3684430A;
	Thu,  6 Feb 2025 21:07:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876081; a=rsa-sha256;
	cv=none;
	b=KjYspCEyLbv/6H/C7sYirwxoOFyx5/XWo1k8cD8iPHITFKGhTBtRXTpStFz1Y+wbUNYTJv
	zaGKn6iuKPNeBKVvapPfNhA6NxRjQH4ptYuC/mnYyjqhd+bjKlN9Yq+ALgAH1pmmj8UA6m
	/R+tK+tRiUCyTM50wEkpdJQ+WVrd3HXXKN2AxZ3GdtgDLeAcAYTTyYyNDVXoUc+hKFYU85
	ilAaZ3Vjxtz9dunn89i8WfRiqt3HLIkFIjaEKKEp5yNx2aB92J/6HdqIvV58krkCn1OSLT
	gobzjxbJUXe8zpIpvDQ3gmT5cC3Z2sj8CacxAbpV87KGVy5QA2ynAzehTvU8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xe2WLiAkBcHSDkUXsXHhELtyJUZydrkz2mL+/UvVSF8=;
	b=c0FQ7NzYDk2UGA9PdM7K4NWGAHSrJIDrfEEeVGkA7BP0PYf9hu6mLcJQasxThhd8+up4rr
	7F0YysICHtSof+IpwrizZPTYeUyQxUpsvhH1we4BQFjL5XtaODUU/kM+ijPYm4C+vqhgFr
	Ca6jgMSPQ5JxqnhpuOgVRwAo584ovpz8isbkLu6bhPp9haVCcNuFVjA52GRue1N8o2kh85
	7Es8reKNmgu4lHmyrfQXZRWq0XXzjW3OUvu6bERNN+kz9dw8eDho7HdODp1CDHkMWUOSf9
	X/gJNJsovEZrr+/263gkHGhqbnHBgwXe95P7+3Q6fqwiu+Wud4ktH2dHPRpdlQ==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-zkzf8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Cure-Plucky: 2d15b524697e6a68_1738876081662_2443359273
X-MC-Loop-Signature: 1738876081662:3814102582
X-MC-Ingress-Time: 1738876081662
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.213.208 (trex/7.0.2);
	Thu, 06 Feb 2025 21:08:01 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xe2WLiAkBcHSDkUXsXHhELtyJUZydrkz2mL+/UvVSF8=;
	b=dke2mQzDGh8SPTmOpPHa5ct2vJIz7vgu+ZEYTRaOWXYDC2ave2y17ToaC4vXgDN6Y1FiPe
	YfonCxNpSJ/o7FPbNMH8GlriVDws9UaYv/x92+tyLhmiMyRJrrq+ZbMQZFZEV2nWF3oZme
	UehaCzejoMvGwmDEm1epUROgpNwe5iLI20h90YLhqisR5eiXVSPQQI+NadiWDbsBai9dDw
	H0pbQBBppkbdVdLiSWeged9SUmb1NzLfrdv2YEnpC1Xb4mIsYxwdGLmswvWBvRIOGNfa4r
	JTkTu/arGexU07Hxh4zY9ibydBmagpXv9QI53LocwMHhKSNwXlWpaD29K+DXbQ==
Subject: [PATCH v3 3/6] rust: init: add missing newline to pr_info! calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-3-a85273b501ae@invicto.ai>
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 David Gow <davidgow@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alban Kurti <kurti@invicto.ai>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Fox Chen <foxhlchen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=3757;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=wLsWvO7G2CDgvUsTos23isyBxWnJ4B7OEzDo0wRP9YY=;
 b=blNhu/kuzLz7yiGjHnvKuuO5uLg9p3v4Nqm53boJPkRRSrFD20BmDnHi4fGqLoWh+mxhRXP3Y
 QOW9uTjo3xFDxqJPLzYgSAgZBUO9HPqm0EPqqp5eDPKX3dpAJJD6y7m
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:54 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524ab a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=nqqMFtM_d8z4v-URY_sA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfI1QtWnQWDJVkIqxxdYYDI2N7/H3n6ylZ4xMK6AW5efifmRGYGF/gQ93xH4PKYnFzfGACypazeEmTS08dNiHZE+VDMU0Wx1bGzPUK/ZmT6mORtQdl6YZ kmmQMr05jUP2nbZ5DhkuM+MLNuNb5hW5wnHsxGq/YNoj/Z6+azZXBnoaGXxENRZD3HxZB8tAikIArKpYNhJzul9hxxGLN81zaxLYR71PW2eE9HGlskE3TDop N/pY7RUinWClmSKzIsGuCBg6P4AokQXsnxZcs9x/DN0wOxNaFzHszd91Rbxza919ex7HWFelOZrGbYMtNhWDv2ynw0H5jetE0+STe4g4kD2AyI3si9MRlIFg An38XVd7HV9RggzZCj+3gOBGRl4FemAEfI2quzShYKIJ5NwptrazPtw4yh5HBTUW908VXhm3dXHEkm+gPShAHj1WzU0eo23qQk1P5bx2KTvqNvlf/zYBDL/5 OdIY2QYQoDElHPMAWRj71HRu6y0t9mNuAwoZcIBl3Ivw6ZkABgwdiuVwjVfyEK6vbYqp92wJ/Ep/oUhRnXW30/Dek3ifMVowu1coDLbDGqooh2LObs44m8qH fSCDzx6RoYcgT2PwZao1gFUnTJ64f5J9kOOSZnmmTFemi9k9w3SM37k3yB0nGWC1IWCmOvNgMYuLqo06hyLyN3IZy8ghKwCo83Aq4ztk4/I1qy3T/Colz+C3 LfquipRHVgVNWUVbla6mJpWq9xs5k6tcUAwwD6kpRkhLxpEWLItJS9a7/XVg0joOVEdZsa/2LrIpOkyphR/LB2F0B03eC8x6RQyIhR4ZHVWHlSHtuXHMYYqa TupiEbk2N7ZqWoiz6eyRDhaSBDlyKBnGCAJvPG73VtOPvxq3x6qcO9Oy1yH5WyS5KM1ZCoskC97A99ME/MVqoGVPuogWdXI0zb2IA47MZiQxZN24KZBKmdBX FSbz4gY0X+H+7o0
 o9mXu/gv3AZSxJiN88uD7hAaQhIPUAXoQ
X-AuthUser: kurti@invicto.ai

Several pr_info! calls in rust/kernel/init.rs (both in code examples
and macro documentation) were missing a newline, causing logs to
run together. This commit updates these calls to include a trailing
newline, improving readability and consistency with the C side.

Fixes: 6841d45a3030 ("rust: init: add `stack_pin_init!` macro")
Fixes: 7f8977a7fe6d ("rust: init: add `{pin_}chain` functions to `{Pin}Init<T, E>`")
Fixes: d0fdc3961270 ("rust: init: add `PinnedDrop` trait and macros")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 rust/kernel/init.rs        | 12 ++++++------
 rust/kernel/init/macros.rs |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 3f9236c1c9d56db33aea4b76f8116175b9b6ce23..8f57d164cdec8aee6c07e258a512ff8171a1b065 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -259,7 +259,7 @@
 ///     },
 /// }));
 /// let foo: Pin<&mut Foo> = foo;
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// ```
 ///
 /// # Syntax
@@ -319,7 +319,7 @@ macro_rules! stack_pin_init {
 ///     }, GFP_KERNEL)?,
 /// }));
 /// let foo = foo.unwrap();
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// ```
 ///
 /// ```rust,ignore
@@ -352,7 +352,7 @@ macro_rules! stack_pin_init {
 ///         x: 64,
 ///     }, GFP_KERNEL)?,
 /// }));
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// # Ok::<_, AllocError>(())
 /// ```
 ///
@@ -882,7 +882,7 @@ pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
     ///
     /// impl Foo {
     ///     fn setup(self: Pin<&mut Self>) {
-    ///         pr_info!("Setting up foo");
+    ///         pr_info!("Setting up foo\n");
     ///     }
     /// }
     ///
@@ -986,7 +986,7 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     ///
     /// impl Foo {
     ///     fn setup(&mut self) {
-    ///         pr_info!("Setting up foo");
+    ///         pr_info!("Setting up foo\n");
     ///     }
     /// }
     ///
@@ -1336,7 +1336,7 @@ fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Ini
 /// #[pinned_drop]
 /// impl PinnedDrop for Foo {
 ///     fn drop(self: Pin<&mut Self>) {
-///         pr_info!("Foo is being dropped!");
+///         pr_info!("Foo is being dropped!\n");
 ///     }
 /// }
 /// ```
diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index 1fd146a832416514a2bdcb269615509d75e3a559..b7213962a6a5ac167c445a4fdc77f3661639121d 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -45,7 +45,7 @@
 //! #[pinned_drop]
 //! impl PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //!
@@ -412,7 +412,7 @@
 //! #[pinned_drop]
 //! impl PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //! ```
@@ -423,7 +423,7 @@
 //! // `unsafe`, full path and the token parameter are added, everything else stays the same.
 //! unsafe impl ::kernel::init::PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>, _: ::kernel::init::__internal::OnlyCallFromDrop) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //! ```

-- 
2.48.1

