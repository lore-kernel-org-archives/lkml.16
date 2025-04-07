Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9682B1F7074;
	Mon,  7 Apr 2025 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037557; cv=none; b=fO6ID2Jgp4m8F1YifOgiZN+MPNFv1nHenZncqWVbsq6HC1Y1TFZpgFn8eaPmWy3Osz1F3eYfuM/5GUXqOG53oLYTPpBwFCfAhtPC6LOB1adfRREIcdqWWv5B46JLzn/87VK6XU0SwpcdEBgX8Il+XXK+5xe2UhXiXwJgEwXSgv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037557; c=relaxed/simple;
	bh=vG2b/mQo7+BgxnosoSx6pacevmgS07/uJ/cwU4NRObw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jG5YMO2yDOkW69PW1m/S5aIfQfXmVbDx1R0Hx1/83XyBVJX5qBEpEQ9mmghoNAzs2HOMRmCIm4CbwyJ4cYGNLdLEy3BPI+TtKWKoESlhYO/B3R4+v6WQRMqaOKzVhsifTQbnFAd+3yiij2TuhVIEYq9l0UKNmzR1kbXkHWXn4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4OW6FpN; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4OW6FpN"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476f4e9cf92so33529711cf.3;
        Mon, 07 Apr 2025 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037554; x=1744642354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mY2lvpZDIegCTlej9ySCKVFC0gMPohSyMQ/u0Oqs1wE=;
        b=b4OW6FpNdGgve7Zp0l9oB6aNUMsgiRmjWGDwMYJXk+U8p/xIIrE3f86Re71urozhlu
         U4VeiG3uY85jHGXOfr4zWtilPIAd70Hu4pcLnRmWvAefXcDGtvn4M0KBZtoLGMj3iDsW
         X4lYjycODov6DGOYulKYIkbzDLrWb3SFFMSS0iSFp4K54bdannKZ0TSMs2BihIJjEflA
         SYsZnzp7r9vzkABM/L84wr2KepW5siBZNc6uKVz0CET8VrdoljcC7MUOmFaLLRLIOkos
         Ab+4cNh7TG1uwrlEkg54pJM+DxOtljmLuEAu78q5B7/g0uQj02gTx/uSXBn3YUSIWRiV
         GFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037554; x=1744642354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY2lvpZDIegCTlej9ySCKVFC0gMPohSyMQ/u0Oqs1wE=;
        b=T8wjwJjKo/8xcjMZf3ZQ49xhioaeKJ5bTBRphUAHKljzZOqBrwfGF/wOKlG3Q1ere6
         dl5AZRwZpRwq5nteoRxfxS2klXb9+KgxxnsuW2uSBX1BDejjLno25G+3iH19DGvfolDr
         9Nr8X6cfPTT1D3V9toVTx6Iy6V8chQwlG/UV5he7q6lmBZ09PYL/kkPO2x/SALE7NTcN
         fgsrlFnm2n/5Hzhw25zuC/MPS/ZT38IVX8hS0G4Exx5erlkqw6ZAs1PrJNMY8PmXTopW
         NqlPkQHmhhUpucy4MbjuYvo3QzYpiLOnoy8UcyX8b5gUL7vi6rv7UrDErh7bL5vXgZ/A
         8SFA==
X-Forwarded-Encrypted: i=1; AJvYcCVxzEVDf2cUnZStf5nvT4ossI7YZVRrisMCloOHYvDeR6lej6iIU53jHARnGJqsMQHkUxagyPWGCxWbi/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwugP4E1uSEDdg9/wq8/n3xgUM6SP/P7gmzyJLi4LWHKqFF2S16
	zBT/tp1t6MSTecP2205VAfmiYiJPbc2LNxuRFxhG1XH1/0s+M0E1
X-Gm-Gg: ASbGncuA0+sWw3BrJmiWqV/a3mA2PCeaJtGJWtn0gG3wEziR8BtQAWONgd8B2GO92kC
	sqLgdKyBNYYW00iQRp379wpLoiElwxrbDrAx+xNG0a3It+TdNsAGk/+nl5FMn64aHDAWNoppTse
	zN03zo25nDvloP0dpKy8dOYGOj54Hpk7V1kHTe2EuKv9NCUII0vkABSJiEZ3jURzV1L4atyPZcP
	wNy7m8tmiS0HPRjjn7a9MRklM6rHx9EXKyAqTUeISgg7c3c8YUmDOAWbMcjM1mUpOWnQQ4wZXC0
	ZFGXqpz2oXkKfR+q31ZGJ5Czms5GZmoNSXz4yaSM3M0CEfLn/6P9J3YDmflaL5qmHOYclGV7DMs
	UDt2PgQva8ELOFuknhTRsnddCsiEfQQmRch4KdzbZhQMU9ZilrcRz7JZS2VbuzMyL
X-Google-Smtp-Source: AGHT+IGHbcWxN0uAcqteJVI3QWU4ZbW7i4s5XOj1gv1kyknpyeTsJYt+g9pZFfLlR+w6C7yUPfaZ5g==
X-Received: by 2002:a05:622a:64c:b0:476:83d6:75ed with SMTP id d75a77b69052e-47925a1bd80mr201882111cf.34.1744037554227;
        Mon, 07 Apr 2025 07:52:34 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:d8ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-479364eaa28sm33065601cf.28.2025.04.07.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:52:33 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into
 `Vec::{inc,dec}_len`
Date: Mon, 07 Apr 2025 10:52:30 -0400
Message-Id: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7m82cC/22Pyw7CIBBFf6VhLQaGPsCV/2FcVDq0JH0JlWia/
 ru0uqiJyzPJObkzE4/OoienZCYOg/V26COIQ0J0U/Y1UltFJsAgY4LnNKCmHifaYk+VumGudSp
 FkZJojA6NfW61yzVyY/00uNcWD3y9/u8EThnNmVGyBFmAMOe6K2171ENH1k6AvSt/XYguKFFlm
 ZFQcbl3l88oh/dH/Gz6LluWNz0mJFr3AAAA
X-Change-ID: 20250316-vec-set-len-99be6cc48374
To: Danilo Krummrich <dakr@kernel.org>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This series is the product of a discussion[0] on the safety requirements
of `set_len`.

Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/ [0]
Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance@gmail.com/ [1]
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v3:
- Fix compilation (s/ptr/tail/) in "refactor `Vec::truncate` using
  `dec_len`".
- Fix grammar and s/alloc/realloc/ in a safety comment touched by "rust:
  alloc: add Vec::len() <= Vec::capacity invariant".
- Use `if let`. (Alice Ryhl).
- Avoid mutable reference after `drop_in_place`. (Alice Ryhl).
- Rebase on rust/alloc-next.
- Remove dependency on the `Vec::truncate` series which has been merged.
- Link to v2: https://lore.kernel.org/r/20250318-vec-set-len-v2-0-293d55f82d18@gmail.com

Changes in v2:
- Avoid overflow in `set_len`. (Benno Lossin)
- Explained `CString::try_from_fmt` usage of `set_len`. (Benno Lossin,
  Miguel Ojeda, Alice Ryhl)
- Added missing SoB. (Alice Ryhl)
- Prepend a patch documenting `Vec::len() <= Vec::capacity()` invariant.
- Add a patch rewriting `Vec::truncate` in terms of `Vec::dec_len`.
- Link to v1: https://lore.kernel.org/r/20250316-vec-set-len-v1-0-60f98a28723f@gmail.com

---
Tamir Duberstein (4):
      rust: alloc: add Vec::len() <= Vec::capacity invariant
      rust: alloc: add `Vec::dec_len`
      rust: alloc: refactor `Vec::truncate` using `dec_len`
      rust: alloc: replace `Vec::set_len` with `inc_len`

 rust/kernel/alloc/kvec.rs | 85 +++++++++++++++++++++++++++--------------------
 rust/kernel/str.rs        |  2 +-
 rust/kernel/uaccess.rs    |  2 +-
 3 files changed, 51 insertions(+), 38 deletions(-)
---
base-commit: 1679b7159379d11100e4ab7d1de23c8cd7765aa1
change-id: 20250316-vec-set-len-99be6cc48374

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

