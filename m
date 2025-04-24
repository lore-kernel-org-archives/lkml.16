Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3543F22B8D2;
	Thu, 24 Apr 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491128; cv=none; b=hVGZfh408GtFWU/9m8iq0WEmvE+Q3s3HS/yC2wKTq0V0SsW5RDzIYPgkXHO762PDX+/bxFmiYJERnMbFmhGtwra8fYZEubDpXiIwDNCVl0RGw4PLvWEf3d8HyCX1WEvR7ZshcQj+tAAE92sr+ppG62Y358I1JmXgkvucY+uPuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491128; c=relaxed/simple;
	bh=czHMEsKts/SrSjo7ZDUiLoXe0U8kkY7AEF9Hmqolf7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZpM8bVArzbaQL+ArtxEMnzhHpPMrwBF7VUE4v8RD9x/z+xjVNrOG3+afU9p5lwpbOKHrlY0aTy+ptfPalHaJ4B5EDuwnthFhbun3v0GnzPU5KSTJxtynPBuxZ3O7s5zBzpOyJE/s5tuyy3O4wjCjPIYVoaPANEhzGccU5Ns7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SamR+qj3; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SamR+qj3"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so13043026d6.2;
        Thu, 24 Apr 2025 03:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491125; x=1746095925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wAFfNlBLKjoMajAf0mitEBr0rJSl0FPvZuMNfzz9MM=;
        b=SamR+qj3YEVfA6WaY3y4CjSZFzmZYBJ/eUFaphOTmWwojwy80hy3G90MXHu2MLZ5qR
         l4mh3w/glKqpHhZ7S6bk3Sh3dd6Keol7W6QIy22tuw2LVVH30Gl+tUMc493c9rjg8rrf
         2coKD1Sax06SwRfAqyhWEqg9dVEQWu7g8t7JFxslpy+lL7x5k054oXtRKHKbBk0FJEi3
         O0NTEBV39c3aq0qEfE5KlIoJmuEr46I73l+/6pp/YrFJ0jvc58Ac5CjHXhTokA+lD13I
         gjcsv6dAywOLjdAkRzkAIlilvyjHcKuhGVB+YPvR2ZNdUIIuoGXBIhtnPjB4lxAVAat4
         +a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491125; x=1746095925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wAFfNlBLKjoMajAf0mitEBr0rJSl0FPvZuMNfzz9MM=;
        b=J9Ox5YOM8LKBlr5nFOCpmhV0ewVLSbCO1vt74VmwYJ4pWZSppCmpnmYS4xLLkodGhC
         06gwTLAqUHl8A89E72GQDR7JjZQ19SWCVa+yrl4v/RTRXofSA2YHwKhTCAEngTFCQrwd
         f+rAXrmxH+J/QG06rQ9P89whfDpMGUFrrcZOwKmp2nJ9XdacBFGmVHkx3+N+Wu3Csu+o
         hxdEzu+BEsDewOkoS6I5q4tkN+6jysBpPSDO6+m4ZB8K8UJZAFVTWUX6tXFZ4Laq6DIZ
         IQNyTYyjnGeGrOBCo2kZLFGf7W2xTclgo3ruS2HZAJj6+ddQLhkyp9I0rZmVjug7X/0O
         Xkxg==
X-Forwarded-Encrypted: i=1; AJvYcCV6sKOD8z9lmErpIZxXLrDr403iNzczHXXaMp+at8LjlmQqz/J6BcfqpmFO2kAD33T2MIgXo9XYkpzqXBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJ7ZeLx5F8diOpFHsCPZuuYwRm+wbqha63oroZ2r3MNUx8fVJ
	hgRZMPMy6xGUD3QcCAYHipfNhWI+HRcYD1KOD8cwPhRh672SujXP
X-Gm-Gg: ASbGnctFdviPHAiJOjJTxY053vZY9FC/DAgwXZEycwJ/guVxjpl9JyJz22ga+S6NG6g
	Go6ocuNNHmtEV8XjT2CoNCRXGDRdYYo50a42r6XKQ8gwKXBDH4NK7aBsizp/8Qgs5avS6QVoN02
	UvU5Kt0rMTHJ1v/DXikjiMg0A3HIbFVlQ4eJIIpL1+00dfh/yKIkFbe3FrMfB4mqQXoj0shPcEm
	X0R+YgEKO9V2c5Bc5n3c8PtnrjZUyb3r6hLkUDOzsBrAKUac2THyJyjt3CguWGH8wWyNcWsGAoH
	Oebpm6GpysLfcVeVhgp51YKPPdxaOb+LjIX+gxWEvYWg07zZkwUgBSvD/SW2389cldo5
X-Google-Smtp-Source: AGHT+IF9UzKBXtysPgDtYOXmVfX7H9W627JKvObDfhBu9InNEkJdJ4ccnsER/3lZxXY/jmPIZn7a8g==
X-Received: by 2002:a05:6214:d06:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6f4bfc78932mr36901986d6.33.1745491124707;
        Thu, 24 Apr 2025 03:38:44 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:44 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:31 -0400
Subject: [PATCH v6 03/13] scripts: generate_rust_analyzer.py: add trailing
 comma
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-3-40e67fe5c38a@gmail.com>
References: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
In-Reply-To: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
 Tamir Duberstein <tamird@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev

Add missing trailing comma on multi-line function call as suggested by
PEP-8:

> The pattern is to put each value (etc.) on a line by itself, always
> adding a trailing comma, and add the close parenthesis/bracket/brace
> on the next line.

This change was made by a code formatting tool.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index c473e7a2d6f4..828e7797d253 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -187,7 +187,7 @@ def main():
 
     logging.basicConfig(
         format="[%(asctime)s] [%(levelname)s] %(message)s",
-        level=logging.INFO if args.verbose else logging.WARNING
+        level=logging.INFO if args.verbose else logging.WARNING,
     )
 
     # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.

-- 
2.49.0

