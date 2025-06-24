Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB525B1F0;
	Tue, 24 Jun 2025 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803100; cv=none; b=Z10FD3PUw0qSENk6TsAJyziusxFP7qYOZcjJLAG4Wpx7KD2kQUkbKjrZZrI7BDR5nNuKcvuJ8QOJ6YI130XAOJZaji0drXU/K/fUbrENZxIhihrCJUpIEwUKIMh/G80kdcb7pfphUjmD2Fkb3yPEs/xnWfrbNeF9xPcmhssS81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803100; c=relaxed/simple;
	bh=AP8shLBDvKbYuth+8++0JymfuCshZQX8ezE8AjEF8do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnZjRDlrJVVfIXFQJKmgMIZ6si96GfVXnPeKVJeWlfm+3lZNhutWmQ9XfpUqERlNac3MB9iTLkRayDaHL/YHRorggfKSx7KvQ5vMPkIJsAQnEC+lh9Movy0j5fjTpKR+vZ5I3KhHXZpSJQhPaBn3Tx87NbgiYYapCqs5U0x4RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDIcflTt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDIcflTt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235f9e87f78so65114745ad.2;
        Tue, 24 Jun 2025 15:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803098; x=1751407898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO0TxQnKvrLipyxCSYXSthueOvIoODhR5Ygf1iirZRk=;
        b=fDIcflTtHEnt/sU4fHvmfUByLBYwd1g6Hkdmc+qSao/rGUUiI38NjCMfRStSvugrNq
         +bMyghlvomxLos7CNN3hROvJknWer/NsxwR+ZlaQTmXjJJ3ewSFzT3qNALEPDNZykmlw
         IV2T1Py5tLkKi/msc7IwWlQIkey2o/VpVoyTpDe47ppDfMY+Xk05KO+MclbCbc9zWukZ
         8+N5bzeu3p+3/OqPQUIUnSXX5LqiA1C5Hkuq9myt3zhVUe/6HPe70+s9aZAS9yPo1vbQ
         cpd2EHsvrZugD2rn8TxTCdXS8KhakFTIOONpwwuu9sxu85FTKgLJYNSi31ZWQ3l6GQao
         bSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803098; x=1751407898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LO0TxQnKvrLipyxCSYXSthueOvIoODhR5Ygf1iirZRk=;
        b=JzJAIBsmZ83FhVf1uWBQXYHHN9e2CyfHtZiy0sawUlmtW9Cidnzr46K114rWeh6iFH
         rCBMp4ScKwfX/Wrz+WLjhPfI5Wkj11tdSsKCavqMcDStFuJe2c4mf6nlfri30YhROcQe
         66L4t40XyB43oQfaoL6SrYafG91Z9AxGOCNANgflj6MmHfNj73VTyzdNFUbRx6KVtlAq
         vjGlMcdbAoiKmtuPVJkvUMFYB9kp4L0ydxqppcn9EOyVnfFUxCoOhdy0vZRGO+pYJA6G
         7g793BWWOjYC8XXmgXCjPAA9el7YXnT6gqX5hAgdLlMMs2R7JDayY6qgiZrEf9N1odVt
         y25Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkVgOU3npGvp1tIkx5+Zwx+R19LR4bTCAxcgbw1UC7iKuCZkQzTR52/0HGoAmwV72OGiLIStd52FQHFlhsVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpx05r1LeUGZgNMSZ+X/MPS4tN/mbRAzgILWNPbupdsdwdrc2M
	6h8xmUnOwRertuJTMyBjRVARZMlyxi2MQF9UTsgYGRihlAu2fuHGP0p0
X-Gm-Gg: ASbGncuoKwbOHzU+Oxx6LnTE5RADZ/Y0/tiDgoeIGzlZ2HKyIqKyZCISTCZhDG4qTVN
	PS6EDp29pwQkuD6zcl36hxD1oYam6OoEhVzd81IZvJkmDjAvm5SlWQ9J5ecaT/w3/Hw4MVuCCNp
	stMrAZr5FblkCEgj22YQJ/cfGDjPuyGgDOtxsx30O2SkaNcCoFYJGTf88KFu+hilPV41l2E+D6x
	emQHY45YzMExlMOBjEaqQg1Z8my7LWRzS3XbqtZtAN4+gqgrQwXetUJ0TgyU2fNimk8/czM+aiQ
	RfEA/aCOtWv+Rr3Z0gwJeT7haJP6HlGMQGpQsgqYYp6+m9tycd+QFZmFQayNI+hji+qmyTrUY2b
	hfCRgXFu9yrE1zgl8TNPcWgDtHPc/hfpIuJqy
X-Google-Smtp-Source: AGHT+IGzZk9ONGaeRCWEvkO3+3SKQAxtuncFrLeQo0zxqC9J+87qEA1081aiDzNzrowwqKyJ9OPZ4g==
X-Received: by 2002:a17:903:4b2b:b0:234:de0a:b36e with SMTP id d9443c01a7336-238240827e5mr15140935ad.49.1750803098144;
        Tue, 24 Jun 2025 15:11:38 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:37 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Tue, 24 Jun 2025 15:10:40 -0700
Subject: [PATCH 2/5] rust: rust-analyzer: add lib to dirs searched for
 crates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rust-percpu-v1-2-9c59b07d2a9c@gmail.com>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
In-Reply-To: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=925;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=AP8shLBDvKbYuth+8++0JymfuCshZQX8ezE8AjEF8do=;
 b=pBKHWuAH/AUFsSJOOF+za31dYJq/Odb5UdYfMzE5NloODzCBbzwlWo+IzJHKrBnsWJ9iyiTqR
 AgI5GoK1RQoB74TbmGU12txIA42xh1HK3QuuTVPKYNnXBlWl9AQ13os
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

When generating rust-project.json, also include crates in lib/

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 7c3ea2b55041..08e14ae9c1a0 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -152,7 +152,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers", "lib"))
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:

-- 
2.34.1

