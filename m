Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A5E2528E1;
	Mon, 10 Feb 2025 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199073; cv=none; b=pEKKoBSQK+WyMyQ096L8pp7dbp5NleiG43kiK6BxRGkONpDgCgymnH15+thCnXNHfFQd6ix9Q2VLs81JBkvgpn68ciqYRKJCuj4c5G9GA4LiNY0WPZGkq0SEhXlqUmGCIgF9oNrl8DNk2UjD9MxkLDBqoHS+3bTjEsbgny8el64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199073; c=relaxed/simple;
	bh=rR7CAkhHlxOEIyBoPmZ+EacbBYBbM4AutI1EgmTQD5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L2H86GKcmgR7GMgmVucgMpYiG/fXRsFburjS+OsLhpI+iiPrpznUQ6D6f7CVQZpNMCESl6aPr3ig45qZS/b9nJA1od6/1rr1M6GoQUfLUXCAuwbsSKo317wOgi5mIWSerQaOz1sMbWrTq4R6sjO2SHZ6AwGRu6//Q6a9/bHWtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+OX/BmS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+OX/BmS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ddcff5a823so28812886d6.0;
        Mon, 10 Feb 2025 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199070; x=1739803870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mSL3jvTP3EaUTQX6jNXSfuKoP8a/JSsuBzpGEfjoHX0=;
        b=N+OX/BmSbSO/BVPKx9ZDQuFLIjtx2i0m8tzw1pT2a21+bCNfmpUqAG/298/Gq1Z1mB
         AMUKffzcqE3SHo4Itb14Ubt2K3wh1oN0C5dM0PJQxmzdm5BTAKqdX4r0uL76hf0LdOHB
         Q/M3slKW10M5N7wynSHjj6IZ+FY3na1VRpyfm584+qej1OSs5C+a6ipnqliHTM9Mgu25
         f07UkRGemOnZWS8cZGjhXqIyz3pKWIAoxYJCM2FVEpH4IsV4ALWkzAum46m7f0TpJoZp
         T5hRReOqS1kKOBPetNT6TAyDyFXq2c9rTHpKiyjo7nSLQQC1RHdrm+AdehoHDU+qJ6jY
         rgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199070; x=1739803870;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSL3jvTP3EaUTQX6jNXSfuKoP8a/JSsuBzpGEfjoHX0=;
        b=PLw72yYaLbiwpXzaHssTVjAfd6gARgKG63mCYQDVOwFzzVQp5CoGfQEdAj1sKlOw0f
         GLGbMthzUP8GVIFgIU/mO+TxZCVigZN27KtcC8OW0RoOOysLCxohj2pwkLDQpeAzasTX
         qPfXeAYpx5lfZrlbJGkjJcsetrLgsnqIfQ/Umtx/LrExoqV5Swxt2VBju4QkVwf30OVi
         yRqYJFvKCEXj8i1CudYa7/MLrFo+r3dbPIPSuWs4rcKIHGbpgOjkA1O6sf7muCUBdc0M
         RvD1HYzkuIaZ3/AEb4f44PQC8qHiaMwhFzBmUI06AUeVX3AyLH7NCtVtMos1nkabHziW
         OOEA==
X-Forwarded-Encrypted: i=1; AJvYcCUs5Bs1Y4buV+Se/RohbHvzdpCJE54NEflwqQTLTFWu134qMRG/iomISfC9jjvRnaJ5TgYDZJwA4N/DdzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5f1rrO8pFoxSrWpkzfjTyG5vNhIws1uDTB1ZQA/deucSgHeN
	Y2LKLegG03iXUxHicRhklzv/6HGbW8Q3iNxHDlnvJ1mRGX+iMfPA0q2E0VnO
X-Gm-Gg: ASbGncui2DEQvIIn1L4EVFU3pZovcX//dT7DCXoNp4wnH4sv0OQBxECtHoS/4jh5NVA
	4GXajECxIEbGU+zjNKKzOwD9hl6Mv3LG1XQQw7HpVivaZH5f2ACWcqLSU+sFBAd/HZkXca3eqBP
	stnw/71o6rzgHMWGB9S6amvwLl7I8L7NbFebuIHauXMshpsHYaxQ4ynfzM4BW6qprsYj4M3wDAn
	iQcFtN38cGqXKFUniPNj9OfjMW653PebWaUEx5FrVhW6DWc2/oMFzwLW0uWrn5DDp20PbQ43oUz
	1x4dsSUyw9Ln4VkFHYh2qtSXrkqAnuJjyop95QYM3gLvWn/u/87F8kXkBB0lkC9IFRDHZmQ7g/X
	IurCWi0j17howAnVWusjLM663
X-Google-Smtp-Source: AGHT+IGlUk4ezvIas53mgk0d/RIRo+Dl/QlUk29r5Je1fSG463sUoMMg62gSeZSRxWV/YmiU+AH9aQ==
X-Received: by 2002:ad4:5d68:0:b0:6e1:a253:b32e with SMTP id 6a1803df08f44-6e44564c2f6mr198008286d6.18.1739199069943;
        Mon, 10 Feb 2025 06:51:09 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43ba3813csm47516086d6.45.2025.02.10.06.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:51:09 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 09:51:07 -0500
Subject: [PATCH v2] rust: macros: fix `make rusttest` build on macOS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-macros-section-v2-1-3bb9ff44b969@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFoSqmcC/3WMQQrDIBBFrxJmXctECIaueo+ShY6TZKDGokFag
 nevzb7L9/nvHZA5CWe4dQckLpIlbg30pQNa7bawEt8YNOoBNRoVLKWYVWba21XNhrwn45xnC01
 6JZ7lfQYfU+NV8h7T5+yX/rf+TZVeoRpn7EdyOFiN9yVYeV4pBphqrV/M0i6ZrAAAAA==
X-Change-ID: 20250207-macros-section-f7cddc7bbdea
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Do not emit `#[link_section = ".modinfo"]` on macOS (i.e. when building
userspace tests); .modinfo is not a legal section specifier in mach-o.

Before this change tests failed to compile:

  ---- ../rust/macros/lib.rs - module (line 66) stdout ----
  rustc-LLVM ERROR: Global variable '_ZN8rust_out13__module_init13__module_init27__MY_DEVICE_DRIVER_MODULE_017h141f80536770e0d4E' has an invalid section specifier '.modinfo': mach-o section specifier requires a segment and section separated by a comma.
  Couldn't compile the test.
  ---- ../rust/macros/lib.rs - module (line 33) stdout ----
  rustc-LLVM ERROR: Global variable '_ZN8rust_out13__module_init13__module_init20__MY_KERNEL_MODULE_017h5d79189564b41e07E' has an invalid section specifier '.modinfo': mach-o section specifier requires a segment and section separated by a comma.
  Couldn't compile the test.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Drop patch: "rust: macros: improve panic messages".
- Rebase on v6.14-rc2.
- Link to v1: https://lore.kernel.org/r/20250207-macros-section-v1-0-8f018cb05a20@gmail.com
---
 rust/macros/module.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..56f746be4ab7 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -56,7 +56,7 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
             "
                 {cfg}
                 #[doc(hidden)]
-                #[link_section = \".modinfo\"]
+                #[cfg_attr(not(target_os = \"macos\"), link_section = \".modinfo\")]
                 #[used]
                 pub static __{module}_{counter}: [u8; {length}] = *{string};
             ",

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250207-macros-section-f7cddc7bbdea

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

