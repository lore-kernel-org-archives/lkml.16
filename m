Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060728D8D5;
	Mon, 23 Jun 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691692; cv=none; b=W/1vpNq338Get9o+ZofuWyHAu6ot4g8/5aBl9u0bZXk2j5Uhl3lXMWGFnd7y3jH0Ysr6g29cDNwyLkNrTfi+bEHvyFjxbmlgp46+q4e1yaMVxk1TLSZVDSFpXtHvwag2OrdeLKW29KkPWJbFZ4XeaWllgcHxtwOI8WTzOefT29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691692; c=relaxed/simple;
	bh=9HLDxDHCQ3M24YIM9qCCru7ri37BgrydlZsGUsGK7W8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWkS8/uo4Yh076G2KoBM7AZ+zK2q7/y+x1wZahs2bfqbodNbj334EGKZMgBz4aPm/p2i+OS/M+36LvDOkJYnhP7cVAAjJSMVVmY4ISZ7mG9186NJtC0JYKY7yF0oS7TjTJ4XAPlGj95AnQvDVXHsA71B4falUTSeYLN+F3VHWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2XLvP08; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2XLvP08"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3220c39cffso988241a12.0;
        Mon, 23 Jun 2025 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750691690; x=1751296490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxVvDAMvkM375HX/zxtZMIQJuoJ7i7/DvaZjzOiyFTo=;
        b=e2XLvP08j0nShTwdzm7Py4fwUGz6oZg4KmmxXCmpcH2uHDyG6aSHLEdS8yP7ztVKi+
         anl/KOVZeNxlPD8VCu/IiFodxcKoNTnLWYlf6US1ZCRGoiUVRsW1fmTwTfzFo20jmRxI
         HBs7EmlMbnRdB3cwrh99YRODqDn6/1+/PxbNiH+IikRfezLqFQMh1SBwjf/OqGRC0DsV
         BUPcm98VKf+tqnRMHKNC28Ydwy01Pnh7z0eBnyUROp/hM3qdIL9q/VzYdoy0q3RKc0Hq
         203p/9I0IjPV/5xg+HqG5b98USuIQbpKNXpeScQvZSmIdywSXOcZB7pR4FN4o0LfSqzi
         Mxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691690; x=1751296490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxVvDAMvkM375HX/zxtZMIQJuoJ7i7/DvaZjzOiyFTo=;
        b=LshM3cH4S1mzrDk4RFKW5c7FHfJ6BocU5m3y6FFMxf6iIAYh6SaxmEZAKkBsqTZc3j
         s9yHH9+yCGjOeTcuMWIkhlCUZuMUTULB5XKCtpBne7lTa3NYkRWw2bbxw2/akwuIxHgR
         3rnuHHn08kw6OicsNMuaqVpbJIumQZ70qaJ60ZYaQAJS4URyfk2apVi1AysYSWaf9/7n
         nQ1yYCpl4+0PvPhozHsYsREAstPaCy+PnZKioMw385ptDk4avqf39B7FfudQu3cGYAH/
         rN/orrbKaySgU7Ie+c1TbY5l7m6pFOn/hzTrCRko1gj0Wl+n5mrB80795hUnriFOedeV
         mq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOuCRhXxrMS+4Blqh84CX/Cth//umdMfuw/ObsnYJbHJ6l7Cpj8HT1nnmb1W/d20+fO3wznm6YnaSCEt12kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywKtrjLW3VB730839fs47aGX25H2WrGNeFNRFVhY+2s9mIs+UI
	76M4SMiksz/DPb/S+jt5XURF8pFqLwml9W3psB8N0fmeATZgvGWbOXbv
X-Gm-Gg: ASbGncupD0SpF3tLt/+7JhNm+/TfwK8CFkZZE80Ck4A+T7goZt1ZnkKJtArMysR3v3y
	9vCCoLjRnctc7iWzQI6XePQGpUuCuLkkiLsWyZpnrQE1bhd3ESujAH739eXirWdhnauSyJFGSy5
	R3jOgqI3hzAyBfGklklRDaowOKY/zpB7ypy5tlT763C/WzuOuMSmR5aFGaqS7a+4YSPv5UbpeRI
	bfjjg5ixTrn9+TruIOAPHMEjEEwgLT8CdLme8MoflsVajbr6XC/EGaqDPKTgRAiVm1IoI1L+DKQ
	vilvTQCsmDuS1MeJpMvfvl8Sa7Z+hY/bsTE78qW5fEZfnb4kZfT9hPDGXgHbJe2z1VotXjmCmIZ
	AGnBFXOE=
X-Google-Smtp-Source: AGHT+IHZ6b3VUpDC1c2zoZYui2q3WO6oIWeoRkRFN9suemWLWo9jP+W3JOYotkgd1zwMLlo2zWW6Rg==
X-Received: by 2002:a17:90b:574d:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-3159d624244mr19128362a91.3.1750691689838;
        Mon, 23 Jun 2025 08:14:49 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:49 -0700 (PDT)
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
Subject: [PATCH 2/4] rust: macros: extend custom `quote!` macro
Date: Mon, 23 Jun 2025 15:14:28 +0000
Message-Id: <f75b20619c4269edad12ad826caf83ceeed89dbb.1750689857.git.y.j3ms.n@gmail.com>
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

Implement the `ToTokens` trait for `&T` where `T` implements `ToTokens`.
This allows users to use the `quote!` macro with references directly,
avoiding the need to clone values.

Implement the `ToTokens` trait for `proc_macro::Literal`. This enables
the direct use of literals in the `quote!` macro, which is useful when
emitting numeric constants.

Extend the `quote_spanned!` macro to support additional punctuation
tokens: `->`, `<`, `>`, and `==`. This symbols are commonly needed when
dealing with functions, generic bounds, and equality comparisons.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 92cacc4067c9..d05f60f55623 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -7,6 +7,12 @@ pub(crate) trait ToTokens {
     fn to_tokens(&self, tokens: &mut TokenStream);
 }
 
+impl<T: ToTokens> ToTokens for &T {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (*self).to_tokens(tokens);
+    }
+}
+
 impl<T: ToTokens> ToTokens for Option<T> {
     fn to_tokens(&self, tokens: &mut TokenStream) {
         if let Some(v) = self {
@@ -27,6 +33,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+impl ToTokens for proc_macro::Literal {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.extend([TokenTree::from(self.clone())]);
+    }
+}
+
 impl ToTokens for TokenTree {
     fn to_tokens(&self, tokens: &mut TokenStream) {
         tokens.extend([self.clone()]);
@@ -144,6 +156,36 @@ macro_rules! quote_spanned {
         ));
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident -> $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joint)
+        ));
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident < $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident > $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident == $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Joint)
+        ));
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
     (@proc $v:ident $span:ident = $($tt:tt)*) => {
         $v.push(::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
-- 
2.39.5

