Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D02E11D0;
	Sat, 14 Jun 2025 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749888801; cv=none; b=aIPm/dgILoiGem9JWiUKE9ZxNIUVDF4bAo+VziUDWiNmRRYWzgFUCZh+PJ7rCgjebdFh5XOAdItlzxx8hxPhAiCZyY2Wmxkl2TTd8BgChomxDf6AF8bk3bXWKpdpOfIwayaahI9H7/LguLQntKP3l4UTT/1XQ/iEdSAHFf8eTPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749888801; c=relaxed/simple;
	bh=pAiTp92MQbVYil/WDHprtKpovWyNqzcGwjy/D3IfNaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EE1QNixRPVImr7CIyeujQZs1DcBkyBfPTSl5LB9Dki5CVv57u18S7AD1D0u2bMt29DHBeRklEP2pXAXzdCbvDSV/AxwmW6wdzJLljpQ6uk+Xh2jIT8MRxAuZN1/5gze6PVj+WQFI0eG0rXHfW+hOzigg7eqcvmiJa+qKg0t8lzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EloiLNS9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EloiLNS9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235f9e87f78so30771055ad.2;
        Sat, 14 Jun 2025 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749888799; x=1750493599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V725DdxLAoSNvGdG5GbooEBhwiSKBKZ8moj9zUpl6sI=;
        b=EloiLNS9LoKoNXqzSi8ELOQt7sVTkMvrrB/tQcSpu29vLVQHiVg2M2QkWsoEmMwTxc
         4u5D2T0Xsc73OwKq+hdA8dvIpLDTptfg5wuD/W3o9hs9RA6CfoeM0wsVxwfYUPtnz9V4
         8cHSENKYiMtNQnqUcu4o9EWZZZHsPcBvX5gNWJyLmMS0SfOw1icm/jKlZrOk40cSdEzW
         VUCW94Heg/43II5pIM8TvhajjWuNHom8JGiCaz0evx3HfcT4TQq1VWLLsQcBUBbtCRQd
         7wrYtj6T+Z6XpQ9GwNv4xtfTYj6/m1pE/RTeOEdWEk/655XICR0+4W7icv/mUFjH7sCs
         sTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749888799; x=1750493599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V725DdxLAoSNvGdG5GbooEBhwiSKBKZ8moj9zUpl6sI=;
        b=aqKmeUZd51fL3nojL7joJjxdnC5gDhgA5+a/mm6u/dKTN+5ds6QBieWeX0tWLqGd0S
         ak/79i3Np9evdELRU4kr4qTGpI2sHSNpDHz7insNlb892EntPZ8gDfMmv0nn8vlOWTF2
         oQdqbfD6auta/zR2Q7eqE3KWzr2Ez4Ju58m/9Ge6zFEoUz889BXwWHXvp1Ix5heDjufc
         bWxWSUxwXY91NYi6vY18FieSadMUQZQN7wRSRQPHp5rA5b7J2hrbRnzer2GdMvBNNzzD
         bfbSdi0X+ziYK8IpGWLZmyut9CJknCOLV1V022iLk8iZPtF4+UIlonccdBrcZEhQJF/K
         s6/Q==
X-Gm-Message-State: AOJu0Yz+6svwMoJjhbgx6eqCz7W19IPHxSwOaC9gjxSTgKcabN6lFxeq
	A5Enz223uQlv66C840y5BQIcbJJkuZ3iCFQSxgurTgKpTr4LPMG4DKoZRm2awl68AVs=
X-Gm-Gg: ASbGncs/lTmzA1PKymdJz88kheaKqodpEEhphNCLgnz3JBE7F2Biu3EKKhhrdjJepv+
	JBDT7mjV7ktYwo06iRlIRQeyoz+yS9Pkme9an8MiY8imDNNjn7+eX4d2qgiuHd+3sL120RJFYgs
	U4J4w88ZYFppUrnQ2dgWFlXyOCgYLM5sxNz6oXKjbgoaIFsu8fVy/6QLHUkp6IhiRsWWalKp7pt
	dnLPtEyK5yXOIQ3mDQvh98oTun4gIu74FU1mCFkT+HpYW+ApvdwTBuXxEYq0m03dRzEDqWLkiZC
	qP5KIRJ3LKvLfnR4TryjZOpqYeutl5xlU5XkuVSuY+MKvlQkJ37QvOx06nUsdbtVfC1kB6w3SdV
	UIR8U7T8=
X-Google-Smtp-Source: AGHT+IGTDfwbb8Jj9/Kca8uImi41QpK5Q4z7fnPnVUyoxzabdMSwGDEnzkJRJ3o2/teQeIn0gOxpFQ==
X-Received: by 2002:a17:902:e94c:b0:234:df51:d16c with SMTP id d9443c01a7336-2366b149ff4mr35830625ad.45.1749888798574;
        Sat, 14 Jun 2025 01:13:18 -0700 (PDT)
Received: from localhost.localdomain ([220.85.17.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781b1sm26170055ad.89.2025.06.14.01.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 01:13:18 -0700 (PDT)
From: Eunsoo Eun <ewhk9887@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Eunsoo Eun <naturale@hufs.ac.kr>,
	Benno Lossin <benno.lossin@proton.me>
Subject: [PATCH 1/2] rust: macros: allow optional trailing comma in module!
Date: Sat, 14 Jun 2025 17:13:09 +0900
Message-ID: <20250614081312.763606-1-ewhk9887@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eunsoo Eun <naturale@hufs.ac.kr>

Make the `module!` macro syntax more flexible by allowing an optional
trailing comma after the last field. This makes it consistent with
Rust’s general syntax patterns where trailing commas are allowed in
structs, arrays, and other comma-separated lists.

For example, these are now all valid:

    module! {
        type: MyModule,
        name: "mymodule",
        license: "GPL"  // No trailing comma
    }

    module! {
        type: MyModule,
        name: "mymodule",
        license: "GPL",  // With trailing comma
    }

This change also allows optional trailing commas in array fields like
`authors`, `alias`, and `firmware`:

    module! {
        type: MyModule,
        name: "mymodule",
        authors: ["Author 1", "Author 2"],  // No trailing comma
        license: "GPL"
    }

    module! {
        type: MyModule,
        name: "mymodule",
        authors: ["Author 1", "Author 2",], // With trailing comma
        license: "GPL"
    }

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1172
Signed-off-by: Eunsoo Eun <naturale@hufs.ac.kr>
---
 rust/macros/concat_idents.rs |  9 ++++++++
 rust/macros/module.rs        | 42 ++++++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
index 7e4b450f3a50..c139e1658b4a 100644
--- a/rust/macros/concat_idents.rs
+++ b/rust/macros/concat_idents.rs
@@ -17,6 +17,15 @@ pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
     let a = expect_ident(&mut it);
     assert_eq!(expect_punct(&mut it), ',');
     let b = expect_ident(&mut it);
+    
+    // Check for optional trailing comma
+    if let Some(TokenTree::Punct(punct)) = it.clone().next() {
+        if punct.as_char() == ',' {
+            // Consume the trailing comma
+            it.next();
+        }
+    }
+    
     assert!(it.next().is_none(), "only two idents can be concatenated");
     let res = Ident::new(&format!("{a}{b}"), b.span());
     TokenStream::from_iter([TokenTree::Ident(res)])
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2ddd2eeb2852..d37492457be5 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -13,10 +13,27 @@ fn expect_string_array(it: &mut token_stream::IntoIter) -> Vec<String> {
     while let Some(val) = try_string(&mut it) {
         assert!(val.is_ascii(), "Expected ASCII string");
         values.push(val);
-        match it.next() {
-            Some(TokenTree::Punct(punct)) => assert_eq!(punct.as_char(), ','),
-            None => break,
-            _ => panic!("Expected ',' or end of array"),
+
+        // Check for optional trailing comma
+        match it.clone().next() {
+            Some(TokenTree::Punct(punct)) if punct.as_char() == ',' => {
+                // Consume the comma
+                it.next();
+                // Check if there's another string after the comma
+                if it.clone().next().is_none() {
+                    // Trailing comma at end of array is allowed
+                    break;
+                }
+            }
+            Some(TokenTree::Literal(_)) => {
+                // Next item is a string literal, comma was required
+                panic!("Expected ',' between array elements");
+            }
+            None => {
+                // End of array, no comma needed
+                break;
+            }
+            Some(_) => panic!("Expected ',' or end of array"),
         }
     }
     values
@@ -143,9 +160,22 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }
 
-            assert_eq!(expect_punct(it), ',');
-
             seen_keys.push(key);
+
+            // Check for optional trailing comma
+            match it.clone().next() {
+                Some(TokenTree::Punct(punct)) if punct.as_char() == ',' => {
+                    // Consume the comma
+                    it.next();
+                }
+                Some(TokenTree::Ident(_)) => {
+                    // Next item is an identifier, comma was required
+                    panic!("Expected ',' between module properties");
+                }
+                _ => {
+                    // End of input or closing brace, comma is optional
+                }
+            }
         }
 
         expect_end(it);
-- 
2.49.0

