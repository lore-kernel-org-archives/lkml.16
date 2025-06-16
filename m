Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9F26156B;
	Mon, 16 Jun 2025 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088173; cv=none; b=cVUOv3P8FwhiB8IGQbKpceeZ6GUZaxX5mMTT5s3hI+x61pZNJWkBfH3nTPN1Eh2J6YnTtBt7rkDZI4DFmmHEheDUSZ8yePb5Xfzozk2BXKh9FE+iE6eAP2A4cLd9PXm4tmIpK+Tg6+jDsMg3h9/zYhjQZJ8hiL3mWqptOuaSdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088173; c=relaxed/simple;
	bh=zzsMyrPbS/8HNFX7XOV8PrrfxI/4mqA45NcoUDg4xLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ljp+YJgQ1GfOeTok64ok+YTrL9m8ZMXSUXzB3M2cMt5dm0cp+5cGMMf5vxZZR0Savl3wuSvZ0bZwfa0beKOZ4rhMN5eqaKSjWxCavK5nCBYfWZLEOzYepaDK8y4QX1EA66Ih/uEP7vY6qNxL/Qnvd+DHZ+6e0H1r6ZyJlFPVRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD8j/a/9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD8j/a/9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a44b9b2af8so27450421cf.3;
        Mon, 16 Jun 2025 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088170; x=1750692970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ELoc9/eHFkq/xFaasXWNgk7mUrK1hUGLY4FCwkl4kmQ=;
        b=VD8j/a/9wApXa9+1r8U98bmwQK/ykiGRi2468SDW9SfDdu8jTAYFSqK4dNIfB5rqbW
         d8zJpkSZ6CeRZDPWQBSUnH4y7CtwjrhfZXco2gBjJTHRox3QYx+AzWuPqlWeZu0ZAPp6
         2sIEBy4V1lpN5gpqrJlcTM3TQb3hdweeQirM7+BfkPrVmVQxNNWnxC9LR1YgPuutggHk
         plPXya1TSi5LA4h89gtc8e94NTwz8dj8ClObiIZOFK6EPWlw3YJxhWrbL9BSbDNxkNJY
         fm2teUdAHX2pR2u6VafdD3RV2RqJ1yq/+MIWc4SudwqwsTakkIe/cAx13IW0PmTaDQwI
         SHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088170; x=1750692970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ELoc9/eHFkq/xFaasXWNgk7mUrK1hUGLY4FCwkl4kmQ=;
        b=ewc0jtrEO8bMkcrrjaSR9xXfFmD9sdyCYiimGC5bImcaYS3Ft+QoyQg2a5RmG2dfLP
         UicyhC/saWxNlJUTvUUnI2WSEsnTAaiB4iMwNPa3MUln5ejqnDN6owvBUHQOF4N+lDpM
         fKGYhgmhj3GP6aJkNfUXoCrClqadVu8ycYff39Gw95jq+0pf8CuAOdwDgpR35Yu9vh89
         nP7B189ev24UBZkYrJxbLMpAKSCvLCthgCVZqnymx4SJd9wa1htsVffxdsyErlRbmIe6
         Tlz7yGjNKLpkYdANF/6ODJq5HVTGj9W1JqPKnTuSoqEKwW/PH/9vtmFQs8+sADJaC4VQ
         xE0A==
X-Forwarded-Encrypted: i=1; AJvYcCV8ePjja4UXWP2j3pbjSe4TEDMSe1bZP5BtD0bwYi23I+v0NvhwvxqhMQzb1zrdvFW95kPDzWpPSekPPLWijg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6wzdNUO0Gk3HNC7I13sCa4/ufa89qrPKv+dMGLXcWw56xrZ4
	jBaW4hdn2csF7LeLSQEORLUzhOAq2EYGFYQjUYWE7BTfj6rsiA54mrx9
X-Gm-Gg: ASbGncvAHrh4CTYbsGODiwHqL+2pwFAI6wWmgBslNKQH4KABohjWlA7G11rOcAMFDiL
	MeBEvubW9FbydC6FmQm2yO+zVfjUTa1qYKSeNqx/Dpf4nfmt6dEOsOPN8oD3gcvYiYRTU+b1ee1
	rn40vGKBKVaNqCAz6woWYm20f/7CcMNRyBtUvWFUz7FgS3CYDe6+MVzdLPw1qoU8/9zgwalNMX0
	v1XhUpg26Em1s1PU8asRJhfrJOvtc8UMybKd+nr2/Qxn7d9YbSwdvxJBmljx3THG7oOHnVMfdMf
	gdyr6dtCWzV0uoB6SXzPsvNCxTYHqcsPiCEqoaBjAFtF/f9MMxTRsq9r3dd3AyEpEGSNVt2TFlA
	vYL1lRPQdQQoiWRLZxeiwnLgEW3F9C9B6l+yIfiWYeQ7zpW/w3rQR
X-Google-Smtp-Source: AGHT+IGMuk1yHIEtD/xjcGuTwcjGkN1PW4yMn/cyKgSejtdie1UQXUAbVmVFoiSCIL9ne/sT3prEuQ==
X-Received: by 2002:ac8:5749:0:b0:4a7:14fc:205e with SMTP id d75a77b69052e-4a73c5ce782mr192603511cf.50.1750088170281;
        Mon, 16 Jun 2025 08:36:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a315c58sm50492311cf.36.2025.06.16.08.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:36:09 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3626A120006A;
	Mon, 16 Jun 2025 11:36:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 16 Jun 2025 11:36:09 -0400
X-ME-Sender: <xms:6TlQaOHYAYmD5YveSyBGd8TRSf5PWAcxHEEFcCMdtJVUvGVImTQfaQ>
    <xme:6TlQaPWZBVR4cwTNkJS9y8zow114X4ea_T7EaTsVMsaJEA3UuxTP1m9tPA0kDASfQ
    cWU37yFLg3T3jysVA>
X-ME-Received: <xmr:6TlQaIID8SldxTAK4zMpRZEjFxNxstXn-2isWr4fnSCckuIBh5RJv4ZnDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefgfe
    ektdeftdevvdeiueelveefffeitdfgvdekueekgfeltedvkeeuffetuedttdenucffohhm
    rghinhepghhithhhuhgsrdgtohhmpdhfihhlvggpfihithhhpghnuhhlrdhtohenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghp
    thhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoh
    epsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:6TlQaIG2gKFmFX6B7qjKzXRO_0QuSjSxBw_3aDqaFc9pz7ONZKVmrQ>
    <xmx:6TlQaEVf9cCVO6tcbU3jnKrcrIyV6xdeXAk5qvR5ROF9ERMzAWAXHA>
    <xmx:6TlQaLMqlMaOqs9ySkUMkx2HCdVdAzefMeTvSe59zaIRM-Ux0Cyifg>
    <xmx:6TlQaL2RFLWncuH7cT_1oBvB2IoZEOykC_Q2wMBcERsUKvcOG1ySyQ>
    <xmx:6TlQaFWont2l1G05tuBIWOzW7qhZ4mPpOpiShfW6_Edf4FSOU5HrycHv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 11:36:08 -0400 (EDT)
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
	mingo@kernel.org
Subject: [PATCH v3 1/2] rust: Introduce file_from_location()
Date: Mon, 16 Jun 2025 08:36:03 -0700
Message-Id: <20250616153604.49418-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250616153604.49418-1-boqun.feng@gmail.com>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
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

There is ongoing work to support a Location::file_with_nul(), which
returns a nul-terminated string from a Location. Since it's still
working in progress, and it will take some time before the feature
finally gets stabilized and the kernel's minimal rustc version might
also take a while to bump to a version that at least has that feature,
introduce a file_from_location() function, which return a warning string
if Location::file_with_nul() is not available.

This should work in most cases because as for now the known usage of
Location::file_with_nul() is only in debugging code (e.g. might_sleep())
and there might be other information reported by the debugging code that
could help locate the problematic function, so missing the file name is
fine at the moment.

Link: https://github.com/rust-lang/rust/issues/141727 [1]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 init/Kconfig       |  3 +++
 rust/kernel/lib.rs | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index af4c2f085455..16e84f80bcd1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -142,6 +142,9 @@ config RUSTC_HAS_SPAN_FILE
 config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 	def_bool RUSTC_VERSION >= 108800
 
+config RUSTC_HAS_LOCATION_FILE_WITH_NUL
+	def_bool RUSTC_VERSION >= 108900
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..3ea2391c7f91 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
+#![cfg_attr(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL, feature(file_with_nul))]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -274,3 +275,23 @@ macro_rules! asm {
         ::core::arch::asm!( $($asm)*, $($rest)* )
     };
 }
+
+/// Gets the C string file name of a [`Location`].
+///
+/// If `file_with_nul()` is not available, returns a string that warns about it.
+///
+/// [`Location`]: core::panic::Location
+pub fn file_from_location<'a>(_loc: &'a core::panic::Location<'a>) -> &'a crate::str::CStr {
+    // SAFETY: `Location::file_with_nul()` guarantees to return a string with a NUL terminated.
+    #[cfg(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL)]
+    unsafe {
+        crate::str::CStr::from_bytes_with_nul_unchecked(_loc.file_with_nul().to_bytes())
+    }
+
+    #[cfg(not(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL))]
+    {
+        use crate::c_str;
+
+        c_str!("<Location::file_with_nul() not supported>")
+    }
+}
-- 
2.39.5 (Apple Git-154)

