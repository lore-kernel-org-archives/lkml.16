Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE728221260;
	Thu, 24 Apr 2025 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491126; cv=none; b=JtIDwrWvfBy8oXj+UkcY3vVQOisBi82WFHKhVZ3/Lw+IRKuImTIbprEac9lM+9DspeM2dqhCq3fiTGMBIoW9+3bzOWp8xGdVfZjZbr/qhdAXDd37ZzxgfvnBMuR7nkANEgTsJgCd5h8lRMsQi2aj9Iz0ahvSFRuEZ5lUVM0La2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491126; c=relaxed/simple;
	bh=EcgjYzcNAdicxTJFoLYwwyNYeIc6l/+cClMgQZ8ucjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnlCnhZV42zLP5Bujxeq1VeapsJSPmd4IUGYlkN53zJpbhxlpU+fJgXG89WsBRdU1iZ6kAJizWfvkN5/zoz7l1fvtqmmn+2Gax9Uoui/s6V4UlPxO/d4UaVLFc/InMwrHvXzC9LmV9mDr2s+slZNYKr2gc+EGzRlfRdJnIBJj84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiOgBvph; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiOgBvph"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f254b875so9359586d6.1;
        Thu, 24 Apr 2025 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491122; x=1746095922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YfkggDtpS/kJF+/fc2cefmXFqbpg0MphTpGixawO1o=;
        b=SiOgBvphB2rKSeiZmt15ApwRFBwAxInmkrbXnK7CeNXx+wvX4qmFNMyZ0BVBp1ww7v
         gkx/P8SrV195DpAw6g1KjvQXYNtGJXHKhp6d4IrMnPyspWGyMlpBOcmwyM0i2lIWFbvy
         HOKCUL3towH4WFPFY+MhvqNyM2MF8Lg+KJeSEm9kPkGkkSajGXPbZLexIpSKl9KoC5uu
         FY+eJfysmONiEq50rd6Wv+MLBedqnsTCdR2JNYVpicTTiYUx/93x6cSepDA7VW8dBjf2
         zKsbPaCv5NqcU5ZChPa+QWAFtri0tLHMY4/hatismorqx95dXVINTvAUilM9KkdDZCIo
         iFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491122; x=1746095922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YfkggDtpS/kJF+/fc2cefmXFqbpg0MphTpGixawO1o=;
        b=UMNg2MmJom3YAxpwp29PhyRF0+NEMQsjzr4N87uLwdCJY7L3GY80zSVclhHk+xHqY8
         AQ3SoD7Tl7Skp2ykGROb5rSMLk8Gf897RCItND6ajAtHwjRPQWzURI0DLV8e2Qn3aG5n
         HsJnn67N/qxzRBZJU7crOK64MbAOaxnBhRgKm3NEZr1yXr44tge5qGx9GES2pgN6dwH3
         u2dEpL34kjUPukMN49GKAa3baQYzNVA/ADTuFxy7SxFVq0iKWWbj3YAKjxvliq0Jzhx3
         lLvCe2rT7EsYohmAONJV8auNEhN03na0xXDixese29LttKPu7nJH5kKWZRvYxzhSJuDc
         18Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUpmrkulWZ24FIlFmWraBqTVZZAcvxN8S6LYomBStqbC6u5T+05BblByCDJTvQ3e2gOTRJo99Q9QUEBi9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIBfHdUq4eDtuUIkomeEUsuh59xZQ1CGWmwL0lkLwmN2fktqA
	Ms2Yt2Jsrrg74T4mhtWB7dfyxyzbH7LGNmvu8HGun4AAV62QMktZ
X-Gm-Gg: ASbGncustABZfS+/btlIkQGHjIi7zjQqXa1xgcp5VXdUQfMbsa1G8UTCkhN0/d+Rc1p
	jl3uWulWma3KSJyNodcPYCwfxE4BGjtSWUpwqow4fkfkhe5ed+eIwrZ/a/PG11HkHqYffo2db8n
	zJXcSFwR5OINp2vhCeuNhQP1FWijb/lMTBuK2/ZPg9nUDiDEqk80M4dNOi9K5xVJgsBVvyL5Cjr
	ZEibsNojMhY0z6YJUA37DTWWnHR2vKUbxV+MLD5s5pbdiD35SJSxxcM3k2pEphRP5NMignWjvy0
	E7q+knTG+DK2+2iQqqenSmXQXaQ7l+pPIDTvSZxwfCsGiXyJO6lkvkMBpLorudUXcZA4l9O0AIF
	SRK8=
X-Google-Smtp-Source: AGHT+IF79EH0ohCsuNjsnRVdasXaVGugAor47aN7eBTvmzPTDhsInoRRkA5UwfX1gmZYyS5/94u56Q==
X-Received: by 2002:ad4:4eea:0:b0:6e8:ebfa:42f9 with SMTP id 6a1803df08f44-6f4bfbe0984mr39360816d6.16.1745491122489;
        Thu, 24 Apr 2025 03:38:42 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:29 -0400
Subject: [PATCH v6 01/13] scripts: generate_rust_analyzer.py: add missing
 whitespace
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-1-40e67fe5c38a@gmail.com>
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

Add a space before the `/` operator for consistency with surrounding
code and code formatting tools. Add a second newline between top-level
items in accordance with PEP 8[1]:

> Surround top-level function and class definitions with two blank
lines.

This change was made by a code formatting tool.

Link: https://peps.python.org/pep-0008/ [1]
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fe663dd0c43b..f66c74dd4e8d 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -124,7 +124,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     ):
         append_crate(
             display_name,
-            srctree / "rust"/ display_name / "lib.rs",
+            srctree / "rust" / display_name / "lib.rs",
             deps,
             cfg=cfg,
         )
@@ -173,6 +173,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
 
     return crates
 
+
 def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
@@ -199,5 +200,6 @@ def main():
 
     json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)
 
+
 if __name__ == "__main__":
     main()

-- 
2.49.0

