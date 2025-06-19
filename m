Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FEC21CFF6;
	Thu, 19 Jun 2025 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345816; cv=none; b=ZlIDHqlqEbbvmWZTczz+qOSWl/NRJb5bfstPWPTD1iLvnuXdD3Et+SfL3v+BoJH29giJF2cOi4HgK4SltrUjLUGeJIMC3t3UgJQZjEka2WvtFYnmOqO0Iz6j6P/flIWmtQQHxTP7vMwcI6Q9TzRKIhmdAr/poYwCqitxFFdkWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345816; c=relaxed/simple;
	bh=kQXX7TITUnzSi0DiThiGXRdKKlBN5at9r3O4GIIJzCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnCBV3qdf+1pg3LaebZvGP/ThED7HRNjbCeHfnwwijNxrQaXi/4cSgv5NA80MTLTYbNNLRZovOmGTYrCF7ywgH7Ul7Mro0ma5RHIrjivvy+V1WahxHVFmwT0ujNGWJeH3E+4o2d0N0XOm/Ib5wKBYV29So64pQcLX7KZjVzjKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuqzGztA; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuqzGztA"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fac1c60e19so8543026d6.1;
        Thu, 19 Jun 2025 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345814; x=1750950614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sbxx15DCwxiOaMLGiUkamK5osNO5BK3Zu4sD7EeSEz8=;
        b=SuqzGztAX2FM3C56yfJ9TWIB4hWNYULIuzOgbygV116syMEiXH9tiGqT7zSad2XutU
         wRrzv+3fCEQ4ukdLjZ/qzhTWfiMzucl9/WC8p3N79s7f2oVwKXUHbbW9PwW69ouqh0n0
         9CE+3u3Wde2ZNtOb2gTKF/JYUmiaKKtFm7PsnvlIusr502uTGMs3dSrHTKqhh5ccIM9M
         LlDpwMl55bhKgFvzWt1KA98jFcQBGI7EUiWyhGjZqYIbHmTegEdZXcazeXTIrVVlA/OC
         g26UuDmOtzZnBJAcyNZ56utO349ACaIrC8K7cLNlY6i0XkP/ymLbwsMuh9jX8v1UBLzU
         5DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345814; x=1750950614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sbxx15DCwxiOaMLGiUkamK5osNO5BK3Zu4sD7EeSEz8=;
        b=DJMzCF8X93ulHGxEQYyrE6tMYXdmUlfetmHWSvgNNAE4v/kjZ/k3f4p1HQpx048Vg+
         ire27qgviOL1DpsC4jk/71SPRxySyy9tu/eqNNO7MPm7Fr/maCmnZeR1RuSTWInvo25+
         Z0TkeaEjilVKaa5KgxRPzwLdDts67gf/KhTe2GWyCGU34bxyy8Z9poy4+2XKqjnzTkZy
         KughLyBAyKVW1/jQOqxr6kSKVIoJH88jZGkIa/gCjRN4mxI30GmWsm5+/AYANblvVdxD
         TPaWt1gtQOdHcrvNolzxv/6L1SYtbXWs+3m/5r4HM8SjX8XmCPeXSceKlY52UkI7iBSg
         ISJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHbr3+a/g9o/Nzsq4pfb/4/uDmUo+Bxs/63p+vJy19Ncc5gj4iWVpU4VBu/J0SERbyAVURub40x51RuNAOVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5R9HvzF9y2eXmfMz8JEyNKItiqfb4nzeb7RAovR2PQY22szK
	soMsrzAjVpip+xH7gPdQp5jEvQcYnsyTa2Px6ZbtE078AlORDbapAGmD
X-Gm-Gg: ASbGncssQPp6Ae19U3hNibdubJkC+Op3LfqwoOm2t/gl60YOf+Gx+zQtsXdBt6hDeEU
	M1sCXmykWNFZVxE23vE3vHBdTiWftRK0xqa55av19dkY6jcroS6k3fDPdgzyNRAXA6F8b1pSJlI
	5AwXu7WOPRwvgEsdnqjc8BsfwmZluAq7of6wSUM7i+lv8MjvhfM8mEtZv/T7gkHcHzY9UsDBMhR
	4BohgBTuJ5sf3upCUQ8QjBpPf8008tB6QNzu2d20E8q9dxPDaUMyxxJUPFaa5dAVIGrPWj3zo6t
	RmaBv/z+jybMPTBvuIsVbpzIG1ekExngXzI0VI9m7hjJO0LtxHkXWtZovFn31m249d89J25+SaU
	TQNtzj+m7QR/6+rzfFqNwyAieZ90Y9FjgZ9P2Ulazd5OY57WWRgsw
X-Google-Smtp-Source: AGHT+IFCHzioCrRqlfEiyZaohxWFSZD095UKnC0f+eNqcwuEef/h2E3+eKppS8t/Q8SxMh0MP6/ZHg==
X-Received: by 2002:a05:6214:5903:b0:6fb:265:a2c3 with SMTP id 6a1803df08f44-6fcff773418mr53806106d6.17.1750345813925;
        Thu, 19 Jun 2025 08:10:13 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0957756esm678866d6.83.2025.06.19.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:10:12 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 356981200068;
	Thu, 19 Jun 2025 11:10:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 19 Jun 2025 11:10:12 -0400
X-ME-Sender: <xms:VChUaEPQm6UGEENimytHkaN6SIEoPqRlMSp-kaHHhOEcjEtpCxXYyA>
    <xme:VChUaK_6LeC47-0FAirEgevpez0g0EW3Nij80jT2oeHiWNVqfByvP8dOJW49IW5rb
    E-gkORLEbMrylttkg>
X-ME-Received: <xmr:VChUaLROgZWK3sR22KCAY9_2Q0MTfIsiazZmzEQeJiFlRN-K13k-ee16FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertd
    dtnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghi
    lhdrtghomheqnecuggftrfgrthhtvghrnhepiefhkeefgeduhfejudekveelueeuleeuvd
    efkeekffejjeeuudfgudelhfeuvefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhope
    hojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprg
    drhhhinhgusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:VChUaMuml790Y8WTVjIfzrG5Ta95dqcx3KzMS5vmtuRoFT6Reg_IFA>
    <xmx:VChUaMcq1Nx-6qaSEvxW53IbU9vxt5YDu5LcXrN1yTuo9etFj_v6Ew>
    <xmx:VChUaA2dHycXiwbr1RxOTpHxyVZaGpmkA3k1vmGCvAUhpMpjc-zM4Q>
    <xmx:VChUaA8eKZADrcngh5JAd1XJ5o8HAYvi1NU1i4TslxBrkhQwkNvZAw>
    <xmx:VChUaD8TCBPmG5C1_pnOy0PNBKAKHTlGa5Pkq78LVamejANwkxNQ8sl_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 11:10:11 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com,
	fujita.tomonori@gmail.com,
	mingo@kernel.org,
	tamird@gmail.com
Subject: [PATCH v4 1/2] rust: Introduce file_from_location()
Date: Thu, 19 Jun 2025 08:10:06 -0700
Message-Id: <20250619151007.61767-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250619151007.61767-1-boqun.feng@gmail.com>
References: <20250619151007.61767-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of kernel debugging facilities take a nul-terminated string for
file names for a callsite (generated from __FILE__), however the Rust
courterpart, Location, would return a Rust string (not nul-terminated)
from method .file(). And such a string cannot be passed to C debugging
function directly.

There is ongoing work to support a Location::file_with_nul() [1], which
returns a nul-terminated string from a Location. Since it's still
working in progress, and it will take some time before the feature
finally gets stabilized and the kernel's minimal rustc version might
also take a while to bump to a version that at least has that feature,
introduce a file_from_location() function, which returns a warning
string if Location::file_with_nul() is not available.

This should work in most cases because as for now the known usage of
Location::file_with_nul() is only in debugging code (e.g. might_sleep())
and there might be other information reported by the debugging code that
could help locate the problematic function, so missing the file name is
fine at the moment.

Link: https://github.com/rust-lang/rust/issues/141727 [1]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 init/Kconfig       |  3 +++
 rust/kernel/lib.rs | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index af4c2f085455..6f4ec5633ffa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -142,6 +142,9 @@ config RUSTC_HAS_SPAN_FILE
 config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 	def_bool RUSTC_VERSION >= 108800
 
+config RUSTC_HAS_FILE_WITH_NUL
+	def_bool RUSTC_VERSION >= 108900
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..57cff1ca8b90 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,10 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
+//
+// `feature(file_with_nul)` is expected to become stable. Before Rust 1.89.0, it did not exist, so
+// enable it conditionally.
+#![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -274,3 +278,42 @@ macro_rules! asm {
         ::core::arch::asm!( $($asm)*, $($rest)* )
     };
 }
+
+/// Gets the C string file name of a [`Location`].
+///
+/// If `file_with_nul()` is not available, returns a string that warns about it.
+///
+/// [`Location`]: core::panic::Location
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::file_from_location;
+///
+/// #[track_caller]
+/// fn foo() {
+///     let caller = core::panic::Location::caller();
+///
+///     // Output:
+///     // - A path like "rust/kernel/example.rs" if file_with_nul() available.
+///     // - "<Location::file_with_nul() not supported>" otherwise.
+///     let caller_file = file_from_location(caller);
+///
+///     // Prints out the message with caller's file name.
+///     pr_info!("foo() called in file {caller_file:?}\n");
+///
+///     # if cfg!(CONFIG_RUSTC_HAS_FILE_WITH_NUL) {
+///     #     assert_eq!(Ok(caller.file()), caller_file.to_str());
+///     # }
+/// }
+///
+/// # foo();
+/// ```
+#[inline]
+pub fn file_from_location<'a>(_loc: &'a core::panic::Location<'a>) -> &'a core::ffi::CStr {
+    #[cfg(CONFIG_RUSTC_HAS_FILE_WITH_NUL)]
+    { _loc.file_with_nul() }
+
+    #[cfg(not(CONFIG_RUSTC_HAS_FILE_WITH_NUL))]
+    { c"<Location::file_with_nul() not supported>" }
+}
-- 
2.39.5 (Apple Git-154)

