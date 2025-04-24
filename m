Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540D2500DE;
	Thu, 24 Apr 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491139; cv=none; b=m4xzHrihWbcRQFTyv1Qt47BxtAEeQk7wGbZccwSKmPmA5Yp7XzPFa6sNvuC+ajPeZdkWCtqgjlkatZPrTSEW532cfbON/W82Yea0WjgxNKdV2In4XV8sWubYj38CCNbqkdTvCYBjqcigwkM7cfKhiUpxcIEAtBA65dYLa7+YKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491139; c=relaxed/simple;
	bh=JtWsgJdqzpOvASOT7WRwB8FfjoYVHf0AMIY8APWE/dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTac1Tp0I6+E87iRjTbVy0MuzcPVjAH6W3zCgo640k6NIdQRYOfgYs43Syr8lC0sBqW0lsJzQxC+qCTUU+uTQ+EzZdIP39SlN3UGmfHNASIJ5nbW/pOBZKTCifKgiv850hvZLk0aCoVIJqRX8kc7SaQ7YTeCVwPRuRlnkH/qNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD5nfSmW; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD5nfSmW"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so11125996d6.1;
        Thu, 24 Apr 2025 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491136; x=1746095936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXK0H6zzA0WRgib5JCS7yzC4HEXXFraFNcAiDycuZII=;
        b=lD5nfSmW1XxAP5KjsDOes9+UMeMNrdFG6LdeyMuXqtWYRyb11IKfidIrvuRqQV5WmH
         IE7lcp4ooMXu+t4b8tlWD/XEdeHxI2LI9KZQdMb6X4697PocmfAJFgvvgCMnoUb6JjcN
         qnqgcCZv2WbShI9wZUyRdzr9PpGF8B3Y9vzWj9ZDFeNzqRIsNIQFQh9PxS5Is8v/DPpH
         xbCRNQv0nkSRv6/4yqD661PXscuzQDRZpaJ2iZ3vYT1ON/yGbybVLY9iRzU11r9hRoS0
         gE439KM3w95Ujh6Wz+o7m8pVcMgr8u0KVOGyBRYbo4cPojfXSUPGvuhEWbp7G/1ckM8I
         Mfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491136; x=1746095936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXK0H6zzA0WRgib5JCS7yzC4HEXXFraFNcAiDycuZII=;
        b=YB0d+lrgy8tEpCxbL8BTZZzTc5vUsFXWQjU9R+yRlo8Tuq5TVjprSSQuKyL0i/uy8T
         AQF2GNWMAvNDHJyz6Eg+yfmKPDvPqvsLMm6KGftMID7Jd+i4J2MvXOde3xw7Egki/vUB
         0TEPjeI7DVxfjM+O2XQ5b0jl+ETwEs0KsJxczxxpXB1k0/oz8wzsvRylCYfbXrAsvgdf
         lXMQPq6as9ey5GDBFObpMBmTKZirR2bWEkUg6K43WWZ3Om41wENNZljcu7hbG/C/T0Av
         Ivje1d0l4f2kslEj8KpOXskv0zEnPXcELu5t7bLuRVjcl7q3iL38RzIEJyG/Xq4/oTQu
         3eRg==
X-Forwarded-Encrypted: i=1; AJvYcCUhOQywP5Klt362O7Z1Rtk7U5AKhgODhQVQ2IWGk+A6Bo+sLoeYAKVyVwWsZJ45yhU1IvM1cfC3mJ6DHfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjogDNzcV9RkAXJFSx7KKDOuSy5Vtmh19SWOYeXTrOxgrKbEb
	DYElxAY4VQHbpYnhr7RiwRSUANPhvOqcOZjMACWA75g7S85n/OF/
X-Gm-Gg: ASbGncvRU1kZ/MzHgDiVPd05aUInHeOTSR9fGxxzbBrzOYO4KMgk9KtVVLj0B+p/Ojw
	jDxs2yZ2k0ZXuauIt0XnvHKBtQpxAMpQ9xI3R7LiVenLhNHC4vA2wImqS516Fx720BAReXoLjsF
	XXDQ0ljAKK4bEiOG6/S8lVvfsxUYdDvwd/OJsvhNpsqSf7awEf2iTLS3wd74OHdb3IkmF2FIApj
	VtuCh5nXM1IoIQHc4wzdSSOq5ng3eqoGm5i0YXUzzDV3YykHvQCfnsp6ZFj+VJUVsA9cZLzxKD/
	ZaaKcL+1f8R5DNCis2QfkHkNOhOHZ8526bHf1ZQAfm644dJby+QqSA6ZrrBOdPTF7pLYvs18G5O
	oggA=
X-Google-Smtp-Source: AGHT+IGMxw7Qs4xcTzOr9nM+tAV30r0ggCbF0cODYXiYjC2D2bU+xonaDHNUlwJBWWbji5EUJhnDcQ==
X-Received: by 2002:a05:6214:1941:b0:6e8:ec18:a1be with SMTP id 6a1803df08f44-6f4c1176b19mr23842796d6.7.1745491136389;
        Thu, 24 Apr 2025 03:38:56 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:40 -0400
Subject: [PATCH v6 12/13] scripts: generate_rust_analyzer.py: define
 scripts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-12-40e67fe5c38a@gmail.com>
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

Generate rust-project.json entries for scripts written in Rust. This is
possible now that we have a definition for `std` built for the host.

Use `Pathlib.path.stem` for consistency.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 93b96b219a42..5f04e3785854 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -257,6 +257,19 @@ def generate_crates(
         cfg=[],
     )
 
+    scripts = srctree / "scripts"
+    makefile = (scripts / "Makefile").read_text()
+    for path in scripts.glob("*.rs"):
+        name = path.stem
+        if f"{name}-rust" not in makefile:
+            continue
+        _script = append_crate(
+            name,
+            path,
+            deps=[host_std],
+            cfg=[],
+        )
+
     def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
             with open(build_file) as f:
@@ -273,7 +286,7 @@ def generate_crates(
     for folder in extra_dirs:
         for path in folder.rglob("*.rs"):
             logging.info("Checking %s", path)
-            name = path.name.replace(".rs", "")
+            name = path.stem
 
             # Skip those that are not crate roots.
             if not is_root_crate(path.parent / "Makefile", name) and \

-- 
2.49.0

