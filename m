Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430C2A1D8;
	Fri,  7 Feb 2025 17:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948927; cv=none; b=s4k2ZspER7lnivIoMlibpuGNyAiYyzQJGvU8Yq3sg3tK2u+ILjV1UXpXYO8813aidhVXytp7zuNmpop0NVCmJXabalddW8xTcfRgimsQImDDUhmD8xPbpf8quEki9m6GpEn+QCliRZD7Yj8u2G4HpF6ZtyTwu7Cfl0iseTWf/kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948927; c=relaxed/simple;
	bh=rplEWC3mIBItyLKrzqR3t90cR4oeIXgRNP1p5tF6AoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AinhWLdV+qVSGh6c6kAxHPyum5gZmhPgL/+wl0zwL2nkx4BsdM8ABLTGyX2ELo1nFoOMKYJqkpEi5f6YEKNP7cgKipCdhlTpq0bFBXUJowI6K70sFwA0znMwEobRq8cr3zxaUphugfBdMW1eaVtjX43wXRGsFYBMw0uXvGHGCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k54CvoMJ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k54CvoMJ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ddcff5a823so16433336d6.0;
        Fri, 07 Feb 2025 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738948925; x=1739553725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl2ewbpSBXwSbJYZCakj2C/Y+cQMARWfY2YjN9Hp2zg=;
        b=k54CvoMJSG9HvRlLMsZHzBgo0pOTxfcZEq5QXXl40eXNmW8IeP0lsqp63Oi+3GoZ0C
         G4Mwn+1f8W8cNeNcZqXwCyEooVQpEZFzIxl9wosYxIzxYA8oMABoFvEDvhjaTJslnRs6
         3138fPze8LJ3TT+hcvvQI00SBUrWv8OV97BcU9Ieps/YEjQJnbakRKN6cB1wT0gNn18i
         rbfERdYAddemdhn4GuZWXnOda3BXUR+EOu/Rlk3W6pW4agpcTNnt2Bz87emNHq73A3ys
         W+TSF8TWcu5N8lHKf6qCej41HKmB99GxvCCYsIjPStuPlD/lVIdehGUZ3Ot5PSp+ByMv
         3jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948925; x=1739553725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl2ewbpSBXwSbJYZCakj2C/Y+cQMARWfY2YjN9Hp2zg=;
        b=Fp2lx9bJqMLwSJGCme+pYdI+NlVvrlZzOwiCFSIReO0Bvqv9OxCcwQ4/7HB0Kvpmnj
         3g0nd8FK+T9x3sBjZ7OkYKc4wUvox+k+iU7llar0bFunTmEji3ae6yV+gIbw8lDTXcR9
         OBUtYK/gurahRTR9qqcKiCtNYPuSOD2qVIfxLR3pp4GE/tpgv1ROxpZ4xeXESF2VktUX
         6xQV0pqD+M7HN/ujujfVbzj3WwJv5If3dPWuSB1mpCvmqStZYxvMXb/X6mcRpKicejGD
         2vCDt4bDIyPpLbF16O2kX4EIVmydiRZAUtRmy5xCg5qFP9utHlAsGY6vVwcErgfD7zLc
         G8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXcdWlo2FFQoO7D+IBC4su3uERXBPLOhLUcSPkOaK4Q0L2fWCmjz12+fTeB5cdKFqwDUzR3f/MnOcaRcGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcllr2tGMp2QN/EAC+3Xi1+KJzG4Hd9ucQKX2Nl/iThbKkea1f
	fE58kvpzk3QlkigBxC9FoN3Ef/MHNI/3c1zxfDJdtr5sux0NA8w6a8/YaBGN
X-Gm-Gg: ASbGnctAG34dNASnHcOaCIYAhyfc6KL1FA2d3IYHL65Qs1i4XR/0ZJHsmg1ZiMYMSLc
	ClJQU9fDcmPYWUV5nU+Su4j1gYACV51YWl3Rn6CN22+jFuRfRiFhjUW4wyP0XD4SqXcrA6aeIlT
	Hsnw3PzcqQvbTIafdH2QXH1VnSubVuSXOIFw8GmuquVFsp/O9JKDyaeklSHiMLcwFKIqX5tC4DS
	Jqa1o7OiPitk7tyLEfTqPYrXXZwOdycrEa4EyrPqvBT30Wz8O6jPYs6hj/dim4frj+q7WPDIQkR
	5vEOn23O3Z4DKp9Xsag5fx6uCeTx6Co3MePfCvUPDs7AO9I=
X-Google-Smtp-Source: AGHT+IHt28GS190mBAl4IpR180mJYbIbeex/7iXCj/a1Xd0f5NY44xRoM+I4jsgTNzKGlSUaOWYcJw==
X-Received: by 2002:a05:6214:5098:b0:6d8:e5f4:b977 with SMTP id 6a1803df08f44-6e4455d6e05mr53394416d6.5.1738948924558;
        Fri, 07 Feb 2025 09:22:04 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:fb:aded:686f:8a03])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44eb52460sm3159646d6.8.2025.02.07.09.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:22:03 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Feb 2025 12:21:52 -0500
Subject: [PATCH 1/2] rust: macros: improve panic messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-macros-section-v1-1-8f018cb05a20@gmail.com>
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
In-Reply-To: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Include unexpected input on parsing failures.  This has the side effect
of avoiding a spurious rust-analyzer warning:

  Variable `None` should have snake_case name, e.g. `none`

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/module.rs | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..ca1b7e6a71ff 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -11,12 +11,14 @@ fn expect_string_array(it: &mut token_stream::IntoIter) -> Vec<String> {
     let mut it = group.stream().into_iter();
 
     while let Some(val) = try_string(&mut it) {
-        assert!(val.is_ascii(), "Expected ASCII string");
+        assert!(val.is_ascii(), "Expected ASCII string, got {}", val);
         values.push(val);
-        match it.next() {
-            Some(TokenTree::Punct(punct)) => assert_eq!(punct.as_char(), ','),
-            None => break,
-            _ => panic!("Expected ',' or end of array"),
+        let Some(token) = it.next() else {
+            break;
+        };
+        match token {
+            TokenTree::Punct(punct) => assert_eq!(punct.as_char(), ','),
+            token => panic!("Expected ',' or end of array, got {}", token),
         }
     }
     values
@@ -116,11 +118,10 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
 
-        loop {
-            let key = match it.next() {
-                Some(TokenTree::Ident(ident)) => ident.to_string(),
-                Some(_) => panic!("Expected Ident or end"),
-                None => break,
+        while let Some(token) = it.next() {
+            let key = match token {
+                TokenTree::Ident(ident) => ident.to_string(),
+                token => panic!("Expected Ident or end, got {}", token),
             };
 
             if seen_keys.contains(&key) {

-- 
2.48.1

