Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D387C22ACDC;
	Thu, 24 Apr 2025 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491127; cv=none; b=JKgWpJYYyeMpufOUdEcHI51FtCxH1iNapn5wT5IqfBTZuaDYTU2Ws1xdYHEDqsh3CuRvrn2Q1NZIXvhRDE8Rpo3hGBwYg2DQ1sXLxwCfSaGoi1MaLIWIkpYP4xOGvbZS0ZprY+bpdkj7oU2ecBG9KTKAqky3RK8Z3Ne7JiHhXic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491127; c=relaxed/simple;
	bh=9z8l/dFEhuQOiIab2nWRpzikEglc8VJiThpKHkuXvN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaXtDLGolUJQYYYepG9n6/0yoFsJXxYKdeokTuZNdFetx2NlL4ocWgixPcDGeiGf1Rp/i1oeP144CG/UPIw7sMt/3OEnoXYfMsOzZQiAyAj3atQDO68sO21LydQM+RD6l8xiBYrCqUwadZEnkW4I/Bnwyuj67OabHKVHBeYY9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKcTSeuF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKcTSeuF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6eeb7589db4so13563416d6.1;
        Thu, 24 Apr 2025 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491124; x=1746095924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuzymJ9n0BC+qMvDBmG7AY9Go4UpM0QvCNINZtBLgXw=;
        b=XKcTSeuFbmUcg7WsBHtoqdNn3seA8FsfB44dWbkuYGfnK1p7rWBw1Arsd3K0Mm52JI
         dDZh6YXuTuS9/iIq81eGxk0v0SIiMPg+KW0vuoxSfcUwa72SBnURmRDq04BgXLhtI+Ce
         qhLx6+g2a8nXdsbtv2VAemCqH1uqL2RdMls5i9lqHTH8Arwp6AN9GyLDaVrnR3C5Z4/W
         6ax9uSCSVW4SixvbXbks+0Qw7w9Get7fnZuxykIiKzryIF7w18mr4FCz8aT/MKyj1i94
         8FvCFqnXBSvgNGuGSHLaGXUAkKuI21RFj5n93aHwmv6u8mZVO0/MW1ZSb98Y3lbXUGDg
         r2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491124; x=1746095924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuzymJ9n0BC+qMvDBmG7AY9Go4UpM0QvCNINZtBLgXw=;
        b=OCcUlFADlhpR3bouMvoOd/t2xGoLcmyLdJor8GxCWINBds+ZUQRN30KcL7F9qDnNRu
         e2cH+ogWrsIJV/4opItNs2gudVi7ovUG7vIPEGnSfmQcH71VMhQrQ1JWIkSXO/xZxW8W
         riyxiOZpwqtEV2IO07iYS2WXMhLOKmbr0UGtJ1KmDNzyGgNPmHWDP+p4utt+kcfv6/no
         Adqegh4a1eG7KVVpODMQNmktTZFaEiubggodKoM7pyyt/eDQ/HqpcWYwv5M6rpm9NiZz
         rB6+0pseD4H3/qfZonZUXH3xty1EfUr6V6nb05orm7i0teK9gKKA+IF4krQyt/Q3pL1f
         DfRw==
X-Forwarded-Encrypted: i=1; AJvYcCWf9x4tXJU7N9L3F18skMxgxoYPoTunC/9oQhsA8J/G3/xs8UsNg29MerB3p4eqEsDTimFwGmuXciK/uqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10okaUt9pAsOycnoomYAGKg+fMlSuOmwn0LI6aCHte88TcORx
	pRmqoO5TNDIc7XRE2U3n5gLcf7ooUyZ69VLg0ZeLqLOlA2FxIyag
X-Gm-Gg: ASbGncuZ8y5r0Q07AVINbKEXysEci4UHfFPXF8aEOdiSzbg40rXq/81BWilQT85Y7qz
	YkCTBfd63wFTUAoSxiZfFlTpAnz/5loOZtjKI/gC9NNcCkhdPk880ocQgt8U+GSXUsCMRSmxu/Z
	QExps1W8pcpGQ/AHjf9DNX6pRN9RFIwaRmRxKKTsQHdk181s0Q4s8fRIiuGbTa5X7mn5e/GGxRy
	95RqBWEw5NI8HT/WI/SqFNr9RgBcw/07RKXaqpoYiOarzFg7tsKLEO/spVHVUxjt7nkF4izM1iP
	Uq3ixmO8OVeLH7plOW61tFGxs0imAUx9UcZWKY1AfkVAzdDk3aUsmoF/Z01jXC6wbAdo+21K+ze
	N1J8=
X-Google-Smtp-Source: AGHT+IEMGKsBLUAJF3t0OlabtV2yGV38LocH7XfPYD7+JltokkDcvLkPrBeYEs0c0gT8d12CVYJtDQ==
X-Received: by 2002:a05:6214:1d26:b0:6ec:f51f:30e9 with SMTP id 6a1803df08f44-6f4bfbc3f00mr34261376d6.4.1745491123607;
        Thu, 24 Apr 2025 03:38:43 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:43 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:30 -0400
Subject: [PATCH v6 02/13] scripts: generate_rust_analyzer.py: use double
 quotes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-2-40e67fe5c38a@gmail.com>
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

Replace inconsistent use of single quotes with double quotes.

This change was made by a code formatting tool.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index f66c74dd4e8d..c473e7a2d6f4 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -176,8 +176,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
 
 def main():
     parser = argparse.ArgumentParser()
-    parser.add_argument('--verbose', '-v', action='store_true')
-    parser.add_argument('--cfgs', action='append', default=[])
+    parser.add_argument("--verbose", "-v", action="store_true")
+    parser.add_argument("--cfgs", action="append", default=[])
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot", type=pathlib.Path)

-- 
2.49.0

