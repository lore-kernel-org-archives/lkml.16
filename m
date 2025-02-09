Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969D1C9DE5;
	Sun,  9 Feb 2025 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739114977; cv=none; b=OUEjoVBALBhhVcvnCKwsQksIn3xwDs+juOz+iQTg/KQtzyg3HGSiJlnuXWDIv26gMoU5fuP6f+5hv1P41jFDOshDbe2V59ZJGWofjQu2djJw1p2rVGonnaCEaBTkA1J+YJQYX+eqKYua8oXUKV8xwP8J9Y25476ts2pnrNHA2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739114977; c=relaxed/simple;
	bh=nn+F784cme969JZprjzGDWTCY1UXx2JrC4XU43UgClE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aogFNWr1wTm0Saj2tl2FI4PRSeN6PbqHtoqobcMQzJ6zszSumMpTaOc4tCQPjWg7VOzi+rOImtcNnROSD/2WwTJLCwUYTbg+jMHnPsqD3f9htebQDTEB7y+JuwtjkQVoZq7K7vv/wCg0hcSIrbDXskwrQ+3p6I7kKkjT1UdhpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhqK1dWd; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhqK1dWd"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6f95d2eafso415139885a.3;
        Sun, 09 Feb 2025 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739114973; x=1739719773; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KrzsogpKopD9GE+hb8yo8bm2io2bXCtX8qocb5h560=;
        b=lhqK1dWdGete36bEM6ewY0sxVBX98Xgx6vYhbLDyMJIROoiY6LZi/OIG/eDZASAymb
         I66o8nIofJVXVJQTfNiIYZ5yu2dobO4dKpwtPFrBmQRxAkxn5ce+fPoofvFt/n7Xc48V
         X4IfoDwS7+eNcTIgUkkKVQmgDM+pOQEGfqBg8EmD9f9Qy+mxcQNHSJ32a61oBAPX9CFf
         3617czsjFZJB4tvVBFmOE8zTvAx5j9M2WTv2FujNUeYHT967LoDa2kvxHE7afOD+5ua8
         HrY9EeMeoNaFN/uWs76bOUW23yDy3z6OxhVdKt7fpE8JMsrdMHqGziDq+gBHRAfhyZbs
         5qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739114973; x=1739719773;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KrzsogpKopD9GE+hb8yo8bm2io2bXCtX8qocb5h560=;
        b=LjhnArwVWA7RcApOeYNsJ9un+Tx/yC9nYkRombpd9spL/ZuNfIYXKWVrRV9owZogjq
         5ANDT3YQpXOgNlUmpca3ohpGd4DVrQdmRX4oFmvq7BWfp96+VRYBkua99aaQNxMvAhK4
         lKJcaQ1iSSDoLjXSpu/eydoBDZPf4n0hGIQZ/JSkmdSuAwoWt7+2Q1WdDe726swXjBMK
         ScQ/I0Cafi998jCKuNObylX6ThAyG1XHt7swX/tYRmS8t/ZCQgoZVSpmzXbch4PL7+Tp
         9/V8MUlgKc4SChXIPwl19JYq+kgsQGZ9MBLD3uIVvCabqinfrNhIZ/+anr8xDkQl4ilm
         nSdw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JMtAUmZc3hJHQpn9P+8GmIHiDswdsUz3V7xAd9X1IzUDbpG3OhsTGAzUtOnYdYJytTVhUsD+QshtpcJutHk=@vger.kernel.org, AJvYcCX2DSD0dfeZPIChtH5/HhCs1kx21QT81RD1VlyeFM4ZT9gzohNSOr7Xhgvwgy6tQPvQfUAhlg18ugzR9yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHBTnBVluiR2isks17J0zms0XWo7J8LcwdjMrwvcHlffytVsr
	ODPeU6fNbncNQOlPUZCPi6fodqkfFFR19GjCgjQtal1KvRhHrRUmlkFSRqIQ
X-Gm-Gg: ASbGncvjtc1AD7urv+fzbIJ1uRUE/3h6AgO9hVqR+9g3wOE+0jO9VJu6yXw/J5vocNu
	M9mxRJ19/S3+uwnTcCPNIetJELUdaHnLx6JkQ8WNGRMPLwLKUhRFMQ7FkBXEz82S+2xQEQ/cnRu
	SKgDOiyiOAZOPwLBZk4p5ptZkjqh/uKrVHRXgDQ0krvbF6gmLTiiIlPCBtcLOJIaq1bqGOJaIZN
	Qun3YzPR7rSt1kplyYFEfE2BcwN5HCAwO1Nu2/XaashruhBM/RjzPKqsY8+qBLOmm8qD8Cv+ata
	L2J/RVTJH+vat1SAPOPVY+J33EA+a/rXQQgjYAc=
X-Google-Smtp-Source: AGHT+IFY2tZIl0/BSgpJkuDysM56weVkj5atD8thaT+RjrnVHRtEQmWDr79smj0ypPr0mSHXFfZhvA==
X-Received: by 2002:a05:620a:244f:b0:7b6:d241:d4ae with SMTP id af79cd13be357-7c047c21ee4mr1546717085a.42.1739114973341;
        Sun, 09 Feb 2025 07:29:33 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0564ad890sm135704285a.109.2025.02.09.07.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 07:29:32 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 09 Feb 2025 10:29:29 -0500
Subject: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
X-B4-Tracking: v=1; b=H4sIANjJqGcC/x3MSwqDMBAA0KvIrDsQA36vIl2EZGIHaiIztrSKd
 ze4fJt3gJIwKYzVAUJfVs6poH5U4F8uzYQcisEa2xhrBpSPbuiSe/93Elycl6zosxAGWtHEpuv
 bPoR6iFCOVSjy7/6n53le39M5hG8AAAA=
X-Change-ID: 20250209-rust-analyzer-macros-core-dep-0f57868dd19f
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Boris-Chengbiao Zhou <bobo1239@web.de>, 
 Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chayim Refael Friedman <chayimfr@gmail.com>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The macros crate has depended on core since its introduction in commit
1fbde52bde73 ("rust: add `macros` crate"). This dependency was omitted from
commit 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`") resulting in
false-positive warnings emitted from rust-analyzer such as:

  [{
  	"resource": "/Users/tamird/src/linux/rust/macros/module.rs",
  	"owner": "_generated_diagnostic_collection_name_#1",
  	"code": {
  		"value": "non_snake_case",
  		"target": {
  			"$mid": 1,
  			"path": "/rustc/",
  			"scheme": "https",
  			"authority": "doc.rust-lang.org",
  			"query": "search=non_snake_case"
  		}
  	},
  	"severity": 4,
  	"message": "Variable `None` should have snake_case name, e.g. `none`",
  	"source": "rust-analyzer",
  	"startLineNumber": 123,
  	"startColumn": 17,
  	"endLineNumber": 123,
  	"endColumn": 21
  }]

Add the missing dependency to improve the developer experience.

Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index aa8ea1a4dbe5..8f99af38dd09 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -75,7 +75,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        [],
+        ["core"],
         is_proc_macro=True,
     )
 

---
base-commit: 6273a058383e05465083b535ed9469f2c8a48321
change-id: 20250209-rust-analyzer-macros-core-dep-0f57868dd19f

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

