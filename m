Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29FC28DB54;
	Mon, 23 Jun 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691696; cv=none; b=rqH6eMdDBCvShphd3ILrGqbQgA2YWXZSUtq2jN2C2BLBfqiSNMGBNZM0bYdyBQQ5WPZHczkDc3YaSvxg7yUJm2ZAZFSoM22Or9jXMOjZF9Q8xYfFp/1ur2c9F3C+JEH3BaGO6LnhbVlU3TPi/3xamfJFiG9nYoQDjpcBfbYg+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691696; c=relaxed/simple;
	bh=xAmznbHV3hCSsoZUINUVnkaj02XcHozp+B0zTRtfSKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pHA7Xd0Rje048OW2JtLLAYuqbX3vjwW/r8vT4TZf0ugb5C0bLfrWNeBb1nI03RasQ5DlD38XNICrHlfGF3MhRHSNdM1IpadSrSWbDYotfYyyL8+nQHD7SILFx7mPu4q+pDudR8tdyK2Vgl7TH/zvz/VrFkCAtxOt8Ob+Zmt7JqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZyj55jS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZyj55jS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3134c67a173so4687626a91.1;
        Mon, 23 Jun 2025 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750691694; x=1751296494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqJIIUX1RcMuJD/oxLXivkAND/EflsQl1f/q6RQcXXU=;
        b=GZyj55jSCKmUo7j4Hnn9So0eW5z/C2/UwVYxYSVu3Co4urlmZai+WpR0phl/Ni3eA7
         +P4axveiICiJNZQZWSMsj7Y54auozZrsWmjLaQFd3e6rd5oYatNP/PMrYj2jzFO9/NB3
         cSeLWw66pLtIbhr4012CIcHu1GLbh/hSUOafBpUbnJLPTbu22d1DlDgLPn38rigqt9qi
         Gz+ErnYG8DlP6HjUp3msPDdtn96Q9drkt9Si5ImBQzYZy2fAFZWr3CA8WXthWnJepig8
         p831YiECSeE2G1U5XXCMTt31Z8WP3KTi6pI9w0IGOUbNWNmEfyPaGfhPas0cysJHmOiw
         TyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691694; x=1751296494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqJIIUX1RcMuJD/oxLXivkAND/EflsQl1f/q6RQcXXU=;
        b=r7ZPKjm1HSuCB26qFnFfNtrZipQnUPVSZkDwNNlsY2Il3t+LSvQqyEdIxzwEaMAocu
         URSwzNhTyXRiZgsx02rPq52iA8Y8t7piGCSicMMcOKIHNBDVtdksXiYcTD4XsT8/4nC/
         uar+UqKYNJJPKhg9H6jk9U48raz1Rc+Eh5cgsv4msFkbi6rPNs7IrRMUwyeUroPdpYzJ
         MJv4VK1ga5xDK1DT2uIyLTsmdrBAc+ICSITkI+UFoFpH6M9Uhp8TU61lUIRmCGwhueLl
         XzzVBb+JCIi9sDHlVG/gzTyKFBQPHtWQJYNoqv6M5YYuPpFCKAyc1OypWqdFH0FAlzWh
         6xAw==
X-Forwarded-Encrypted: i=1; AJvYcCXAsxG7OFb8QigSV7X3pcgJKLG7FxL/OvpkaYGgp4eQ1/6N7tPVs5NKvRlNekfbl42Eurm4X7MGVHf0OY6iDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFFgQf/WzmT2wgLSkhqjhy9n7APP6B9PnHEJ9zTvvYX1LLc7Wd
	rWz3zRT9M2TwlUUHDGZ2hwNiZV/DNP72OvuCpOOw4r2vjXQMqCF95Zte
X-Gm-Gg: ASbGncvfL5oPAtFMqEj1fg3pZ04u2nT1c5qkbLYKuTMZfOiju4TzHRIhkqKCrYJSpD8
	omO3Wh1CpsdplYmbQKBbeNj3w6CVBQjJ/nm1fqJEkCSKa78+5S0EuLszokZrx11KGCn/O/YzsQd
	Obw2Wi07t0vud0lYBB9Kkcqsc4tjVG+/PzojC9CtxMlBMUgRP1eNdAPHQDsKQhqTFh/cYPYapCE
	LPZZbSK5qUpk8NSRszLxxohrV20Ux8VJFShxeMphXEpxjFV2iRz9CnKdsBqAqAwxUZ9YhNjocH8
	lRXqNac9pdr0ONMqQ9z9zdYTDfXhwF4x8wBQ2NzQc8IU9CWU9kNggGRmjQLxrRHvAKW3NUIoBfx
	FLUut6CA=
X-Google-Smtp-Source: AGHT+IGyPrHLryPORGsprOtDMijB7hbNnK12I6gc10XEvKh4YRH0MVHZxU7ZJO4C5upE0HZ9B5wtGg==
X-Received: by 2002:a17:90b:1fcc:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-3159d8d6282mr22412103a91.24.1750691694156;
        Mon, 23 Jun 2025 08:14:54 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:53 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 3/4] rust: macros: prefix variable `span` with underscore
Date: Mon, 23 Jun 2025 15:14:29 +0000
Message-Id: <eca1e3239800028ee7be4971fe10c145bd583913.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefix the variable `span` in `quote_spanned!` macro with an underscore
to silence unused variable warnings.

The warning occurs when the macro is used without any uninterpolated
identifiers. For example:

    // Triggers a warning: "unused variable: `span`"
    quote! { #foo }

    // This is fine
    quote! { Some(#foo) }

There is no good reason to disallow such quoting patterns, so fix the
warning instead.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index d05f60f55623..e6c36bd7f925 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -63,8 +63,8 @@ macro_rules! quote_spanned {
         #[allow(clippy::vec_init_then_push)]
         {
             tokens = ::std::vec::Vec::new();
-            let span = $span;
-            quote_spanned!(@proc tokens span $($tt)*);
+            let _span = $span;
+            quote_spanned!(@proc tokens _span $($tt)*);
         }
         ::proc_macro::TokenStream::from_iter(tokens)
     }};
-- 
2.39.5

