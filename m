Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A01E1A20
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940553; cv=none; b=RCRsVFWDGUse8np7vjZvNWGRMj7r9jKDsz3L/tdhefhx4KzyfzDWj91QCQ7fqdKrC7hmbErr/0LXfxgl8FdHaCV5S6z1YFs95iSWaX23zJaLXlyfee5ntzIZge8jRNT77KOyif2YQS0/uWoSarUYB2fz1ajjXRC4zE/bEahsBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940553; c=relaxed/simple;
	bh=Ec59Z3Qvws1Qw9XaIFeOZjRAl6VPKpW0Y9E56g+uil4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGl3s2bk29YoywfadmlEVITWzOv/zvJ/tmIzV/N/LHJoksI30taetUwxc+QZHry/eb2VrWPR73723BoqjZxcjFVIoyM1DoVm7Hq9qtcjaJVDTndKSKW41FIRpXxNoQ0Iinb4iX0ilDj16Uw2/+NSFtLGYqM2OlOkpq5f7Ah0tk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=REGRrFor; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="REGRrFor"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f6ca9a3425so16009087b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940551; x=1745545351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PjIvWcUxbUxFBC4KLvkRiaDLRPa3Rzcaxbmo9IqAl0=;
        b=REGRrForbY1zlaIrAlyp7EIPjVUoJ3IhcoOeAQAYnvuAGVz47HKs0FOYXEjXYlc7Hg
         ZGPUM/pFNQ0pHwCee91bxo6cNfYA/kfSkYXIPZ7g537yinXAnx3vZ4iHKlWniOl0Vp5s
         F1KOmJTAiwqHZwaGrXpb/nAVBwTTh5NUTMqHTLeUTAlaLYNHfKzutumK+4+QSypHkVTs
         2UmhqbP0s5DxENB9KdiP8BfDozXh0s7vD7FvCxUi7eRBjO08U6y9FsbTBJUiX7g34Kvz
         sydiOtqsoOmCJY2JXIEDJ87mcHmV8g0eIMRT0zhG8zuFsldKDTImjd6F//tGR9e4ovXS
         z/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940551; x=1745545351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PjIvWcUxbUxFBC4KLvkRiaDLRPa3Rzcaxbmo9IqAl0=;
        b=mFy3mwwL3CZwCWwETXxf3lecBK6PnVbbhcpIYDzB61FgLDpHXYbHkJ0fHhMQuXkqJx
         wpiJ/4Tpu5Mtu3B8V8RkD9SiQfyQZROVQ6FmzQOMTSc397sqfMojn5LiQkERbbYZS1eo
         /0RR1yQVzomv5VpG2+5mIbSRzpco0lYkBunitOBX/GNYrAz54xRSCzKzLT7l5LqO9owh
         9Pc8VkWUUVw+Xn+XYaPCUX0EDQzhM9uEo9Kk6aKtdJX4iOWLwxJMhCIGQgyRqZh06YiU
         LB4bURBQEMjsIiBadL+5WCMSRa1Un5d0lIw7uA/gAyB0WOilmpQnH0nbRniWwign+nX7
         GflQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZR9WsVcSXnx7pBP/q5tqjwcpRHIUDwcqZbpJ5pTnsJp+KrFImbQIbJeu7T0O+3IsPPw/9urfTFYUK5Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46cbn11qn/DQVsTvZg5FDje4Tcf3jbGAYGf8APJC9sfsjzy7z
	yh5uKZXm1cTKBJSRvSAbTbDlYo0XCWSPcZa2ZxG5B68J0ylIYts8abB0CrTU5Uo=
X-Gm-Gg: ASbGncvmDgmq0/jt+0j7duIovSi5HBOL7S3fvVR2oCeU+cxa2/xiZPHcbhl6vkLMYOz
	+FdcbR1QJLHJnxD419ockh3vQU1UMgQVeo6ygRIeIR8vpxQXh0TXvtHDQqqjgPb6DUUG7a5YwHh
	oB67EN14L8TjtIW+AA2UkL4Qpeu9Si3oPDWzgYGILo3r14wNs6kzwBD6I96xZX9D9L321BfqF7R
	/b7R/S+pbWc69333cxojVvW+/K54Zsu79CRyWEbVLuolCmFqpYIraEf/RqctMUJe9/WIX4jIRpr
	Mpj8gJuNj9J31RK8WTF42ic5KSP1iloqhKnf5fgBXqThqIg6+lQ1LWnsGh1hO8fJYUGblwlFn3q
	6WOm867rQjzVjfkwaQvWYn1qrvzG6lHAfoHMr
X-Google-Smtp-Source: AGHT+IF1IDf4AANAXszAyHxGtAzkDD4UFqIlC4hdRXYFFZRS1Da/UnM1hupPQ/UawPvszZxTmtVOTw==
X-Received: by 2002:a05:690c:64c6:b0:703:ad10:a729 with SMTP id 00721157ae682-706ccde3cf9mr14065487b3.28.1744940551265;
        Thu, 17 Apr 2025 18:42:31 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:30 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 11/18] rust: jump_label: refactor to use `&raw const`
Date: Thu, 17 Apr 2025 21:41:32 -0400
Message-ID: <20250418014143.888022-12-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/jump_label.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4e974c768dbd..ca10abae0eee 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -20,8 +20,8 @@
 #[macro_export]
 macro_rules! static_branch_unlikely {
     ($key:path, $keytyp:ty, $field:ident) => {{
-        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
-        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $keytyp = &raw const $key;
+        let _key: *const $crate::bindings::static_key_false = &raw const (*_key).$field;
         let _key: *const $crate::bindings::static_key = _key.cast();
 
         #[cfg(not(CONFIG_JUMP_LABEL))]
-- 
2.48.1

