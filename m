Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ECE2505A5;
	Thu, 24 Apr 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491139; cv=none; b=imRRNjn5ejI51wohMACP+cYl1qeh/w+UHnyDns6UWRqTVRIH9mJe64mNisHdCJ5/fNZBqOAM90Y+c5Qbxj8O/v/iEMRAakbx/xbReUtwRHMLbPb84ZBsIY/KPDSCSmZqhY8NMsdmuIOyQh+u2rI1jYyAIAHSdOJM9SKfh8DeJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491139; c=relaxed/simple;
	bh=Xrx463TdqKnSYtOxeuO+3XVkAUZ4oyvHi6sJQIMghZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOKkaZuxw80DwA5dhvxlcVqh1sS1ULB11uu8BzUZWGCRanAyHUtYAMg3b3Xh5n8Hemj0c+vAN39i1JeOq5n3q9ISptiVpJN7CkLVmUIilepMBeI5Q6MKMce33uKJep6Ybr41TuxVYW+66bznJY0NAzd3dXC1pGz/EbRmi1iMzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c26WCUFW; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c26WCUFW"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so12417696d6.0;
        Thu, 24 Apr 2025 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491136; x=1746095936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQJYPvxnII/djFNWkw3q12jVDRZSj5DEmt3+yziiYbY=;
        b=c26WCUFWA3Eq6++3rPY8qtdG6CHr49VApU8/5NTz16Fpb1FqD5kiuQgvZfxMohN+h5
         CcOnjLH4g8Etz4hjkO5W54r8zoJ70vc9fzU4ysS9nVr4WW4yiWfUPyRWC1uOX73EWuzS
         P+b/azLqtHYaET+OSj3XcNJSVE3QhwdAHhUqE7DMcv+wB04mPr2mJa5xtToH6Dj0rPJ4
         SQkOnyeMW5gU+zZk0eDE4/ItLbhswv8kkxYpPYeMuAM04qoqITHXYA4h03wZiSNcPnF4
         ELxrory59vmxjxdv6J7v3hTEtAgp0fZxxqMfZPq7cf4U3D0qhS9YiFLknFNQckazKZTP
         aYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491136; x=1746095936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQJYPvxnII/djFNWkw3q12jVDRZSj5DEmt3+yziiYbY=;
        b=n631qt0XP2jj2VoQ5XQYS+sT/tw63L2Aes+7a4A6x6VNkiF28q0rECIia4YRuaqArG
         GmHNjwhb8rBW8pzVhDK9SyesoKhomIthI7QxIWQgeTGdnfqZEEHKTn/ag1EGaAuYhNzU
         3NJDgM1mKRr/uqlKMldHuj+BpsjXif4QHC21vHrl1EDJgviiqvEJc1OhMW7bOMm8UWAs
         gCW6AsAK0Xim6aokrwlxPwWYxIa12cUBDWvrdmQLYGt/zWb82Ntio4AzJmktt6XervK5
         qpsB7+6ugCj49ESfjzZ4Ik6UvvUR+qmX/SiDwnrwZ3BF0nY4QXY4alcGqIP9+OPrehNc
         dyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt0Ll7Op6adcOBgRZi2crHbE+Z8EZHbnk9oujYpkHnA+hg8eNDrdNNdSVlbvfKOmKgv+0XJ8STgQI2Omc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHK3rXXkmJszBaMTxAU+Lqif2CAnHf5620i275R3vi+qwcec7
	z50Z45jQagZnWxS+OucDL3l9hJmrJa4ErkuvlByvX08Y45hbmGIo
X-Gm-Gg: ASbGncu6XDzz7Dn6RpvF1ElBEIZSohs+eP1ghmw238/xM4YhkGDgvjv2UqlE4WO5ODx
	TNw84v6iZwbt96sQ+obBt0HO+dG3MTk/xaIzAtEDbu2sMi4zcmqnph8TW0ICpIiDBhp7CJhBbuT
	jYQfVejNn12MwzBQdvwea/Ffv7hPkPxptheF0Kspn/7C7x5Ga54A0fW5qWWL2UfBGF6s5GL7YdY
	kcbFZm8ZywHtyBf/oo+6nOhdkUltUzBgPSpmQKIO77B5oP7hbp9bgZiOJyEyBThFIb9lb0/7LiE
	kKr7tKD1/z+q0hCEJcL9bUjJMsKQQ0/HifpUw7t83BAaij8IITvhqFZObIMchSWYSILBIQ8G9d3
	aGaY=
X-Google-Smtp-Source: AGHT+IEa0IAt68rzZnp2/heJ8uIhBAqol1LzXEm1kzXsKkCDh6WYZsrrWOpA50wv4pZFbtZq1NoqtA==
X-Received: by 2002:a05:6214:f6a:b0:6e8:fbd9:169a with SMTP id 6a1803df08f44-6f4bfbca34emr33258016d6.11.1745491135279;
        Thu, 24 Apr 2025 03:38:55 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:54 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:39 -0400
Subject: [PATCH v6 11/13] scripts: generate_rust_analyzer.py: avoid FD leak
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-11-40e67fe5c38a@gmail.com>
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

Use a context manager to avoid leaking file descriptors.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 0e3bd64f857f..93b96b219a42 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -259,7 +259,8 @@ def generate_crates(
 
     def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
-            return f"{target}.o" in open(build_file).read()
+            with open(build_file) as f:
+                return f"{target}.o" in f.read()
         except FileNotFoundError:
             return False
 

-- 
2.49.0

