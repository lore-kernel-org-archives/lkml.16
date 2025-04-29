Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C85218AC8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937880; cv=none; b=HORgCpoQQgyQC8c4Ak677RFfnnS8yhKNkiKMe3b9hkOyLRrZWkD7/5guzk3kCkGOXLw4geg+y7lWXJbx0WdEN1bmVI83iXlMVyCo56s8souwhvJOnTP56ej7Ib96T33nxPcKkDf21g6IeA8bZr+BCy0RrwYmnTEH5lsnoiNqu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937880; c=relaxed/simple;
	bh=BSx1hA9BCKf7vfVk9B/GGutgZvKoS5kqDfF56cj3Tmk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FZoevivsSpATePw6Cj8rBPQ1uF+aEHGTNDH+2g2QtKn3uCZq/4nC5hgJsHoYWrvqL2gbjyoQXhS4cTD9+E7UwVQdfli9nTMVe3hNsfXT/yuAA0xGou562CM+nllkBFyFCf2kVk2GujxVFxApSZvuREDegoEcQg7vPIEw/XF3ERw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WSo1oPwh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WSo1oPwh"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so28980545e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937877; x=1746542677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nSYMO1K17AprWEG8CRL1vYqzgtCWcYCl8QaC6FEscPg=;
        b=WSo1oPwh3pJZ077FEeQVi1bUPFs9uHrmqx/wotjOVw0jttmtFR62fReQDdRd9fuikZ
         9PJs0u7zzNPpjsHnBr7B5a7x4kF49rKc0Ik9xH3RKlkZyZjzJIxE1e7QDY3KYvxXTNpp
         F5UNW+zs1N8mmTH7VIvz7H9pef0Q28NSgrv3ccG3Ck3XtyYjUaQQBpqRge19G95RFG6P
         O/6cXjHW53WD6MfCCE38TVoN7bVMHVczsCNLkakAHHiuEPB9GRrbcegI9UT4HsPoaZ4f
         WDCOHmRYNiL8WGV2M6nCd+hw2ZiMQfxJdYfxaNUDLLcMYEzQupEXKh1qV65b+XEdOtVt
         HnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937877; x=1746542677;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSYMO1K17AprWEG8CRL1vYqzgtCWcYCl8QaC6FEscPg=;
        b=OLCaMgeCRdWgn+T9slCFcRjVk2BHCTHerwcjSWcZOrGRMbUg26FPrWj55gTuNN7CeL
         ItmuLj9pt7cQeHpDJfs+yl0p/MSAcNds3RdrJgg2g4Ykc+Pp+dkQc3oA7eTtH/ARAsq2
         eGXkE+4IfEqdtVBx1KbjwfhpLaKwYcLKRWDamB6zcP0mrZVeIPVAFoVsl+o20eYNIot4
         F61OYSGSiSvCbIA6PVE5DO8Vo7onEq+bLl7bkHezYbXYcHCyUpucDDJ7/VteQMWjzCEa
         pmlWJbv9INLmjHcxA/A/EIibxUBFA+r0JpK6Oxj+0en557bDaLM6SW/mH1tUbVNwy7D3
         KmLg==
X-Forwarded-Encrypted: i=1; AJvYcCU35p7z0GHufNJ/PHn1bqaiAZ93N4rwN0QCtQK0JnrUPhNvspcitXEWiZH+hFtzQjp5Rpty8/OHQ7sl4W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUdSJt1mH/3lhsjL0zg+4zaELAQtEcwAC9B575wPjJyDTX863
	/FVCrgGaCGxaoiDmPEXe7T34lxNKeaqqAFfylMmaEnhpYLCr5OGA7aeEV/PMq0QlQWhD7LGnhqP
	bEo2E8UWKaayzcg==
X-Google-Smtp-Source: AGHT+IGUXD8q4xktHbDiXYsgcqqkN2g/gcNCrPce1cVp7Q6SNy7YD/Odb79MRIkuNYorecnUkSE139kq34SH7+A=
X-Received: from wmbev18.prod.google.com ([2002:a05:600c:8012:b0:43c:f8ae:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-441ac8f6276mr34684325e9.16.1745937877255;
 Tue, 29 Apr 2025 07:44:37 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMTlEGgC/23NQQ7CIBCF4as0rMXAALW68h7GBcLQkthioCGap
 neXdqONLt8k3z8TSRg9JnKqJhIx++TDUIbcVcR0emiRels2AQaKCWA0o6E9jl2wiWrrtOSolOC
 cFPGI6PxzrV2uZXc+jSG+1njmy/V/J3PK6ME6p4wD5bA5tyG0d9yb0JMllOEb8y2Ggmt7NI2Wt ZDm9oPFB0uALRYFWyyfEbWqG73B8zy/AbKU6UchAQAA
X-Change-Id: 20250320-vec-methods-adfa41e55311
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BSx1hA9BCKf7vfVk9B/GGutgZvKoS5kqDfF56cj3Tmk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXNhKOeT0n3lFq9lcCLWwTL9pWkOr5C9d2nO
 6+qeVs5khCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDlzQAKCRAEWL7uWMY5
 RijGEACl5vwfekuS/4CiPcIR31y68TzH92n4aAiWYEO5Rd0fDIY+FPF6tsyCk+Cz5zfJbVpM13A
 /Ccgsqg991bR1vgUQtiwI52IVL7YbSXpMCtNZPV9OnC9oyRt5Dj00sy2pVO0q4tHioiohmoVZ1/
 trqzdooFOppepNCVBROTtB5icSh3cu+F1iryTUdd/1wUmBN5wwqbue94nXcpCMY5BfBPwjlI/bE
 O71IrbGnn68DRyUKPc+Dqba6Z5vdWkQSdq6MCzzjjhySfpqK3ysqH5Q7R/6Z4+YJLqzS1ymqZMk
 p9Fxx7H5rlHzk1y5NFIsdn5JIvvn97xUAY6Tc2y4wjLZmSESECwP4nxqMGE4jTc0+dxrZH2ZTRJ
 L9ShQGCGITTFRCS+kij3Q6QJaWxT6HyY3cYO2w05/a21m7+zg2XLvye3QB4r8HRikhgGNlSh7Ie
 TEH9LVvXa1KSQh9FHB/sTzeaMoqEE/Vian8IisClWWrzCZTcxQL0X4VmvdJvFFqzC6xYFrTc2ig
 ESnA+CGofu0l6wfM0yJuVumkgON6FD4kjfgKT3KmLHVhEjcGhqhwOOE5BWKUr+3KMmme5JArx6G
 TpMMaEWWMBi00xhjqmedfls2TIDFmbjcp8teKbcydg9JgaF2+TzOtgULU3K7fBcthIovvcXbH9q 5ltLjWAm4L4f1AQ==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Subject: [PATCH v4 0/7] Additional methods for Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"

This adds various Vec methods. Some of them are needed by Rust Binder,
and others are needed in other places. Each commit explains where it is
needed.

This series is based on top of alloc-next and rust: alloc: split
`Vec::set_len` into `Vec::{inc,dec}_len`
https://lore.kernel.org/rust-for-linux/20250416-vec-set-len-v4-0-112b222604cd@gmail.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Add missing ? in some doc tests.
- Fix safety comment in Vec::push_within_capacity.
- Add panics section to Vec::remove docs.
- Move self.dec_len(1) to end of Vec::remove.
- Add kunit test for Vec::retain.
- Link to v3: https://lore.kernel.org/r/20250422-vec-methods-v3-0-deff5eea568a@google.com

Changes in v3:
- Rebase on split `Vec::set_len` into `Vec::{inc,dec}_len`.
- Various modifications to work with inc/dec_len instead of set_len,
  with some Reviewed-by's dropped due to this.
- Move push_within_capacity impl into an unchecked variant.
- Link to v2: https://lore.kernel.org/r/20250321-vec-methods-v2-0-6d9c8a4634cb@google.com

Changes in v2:
- Add two more methods that I needed.
- Introduce some uses of set_len.
- Add example to retain.
- Simplify pop.
- Adjust 11 to 10 in push_within_capacity example.
- Link to v1: https://lore.kernel.org/r/20250320-vec-methods-v1-0-7dff5cf25fe8@google.com

---
Alice Ryhl (7):
      rust: alloc: add Vec::clear
      rust: alloc: add Vec::pop
      rust: alloc: add Vec::push_within_capacity
      rust: alloc: add Vec::drain_all
      rust: alloc: add Vec::retain
      rust: alloc: add Vec::remove
      rust: alloc: add Vec::insert_within_capacity

 rust/kernel/alloc/kvec.rs | 299 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 296 insertions(+), 3 deletions(-)
---
base-commit: 88d5d6a38d5161228fbfe017eb94d777d5e8a0e4
change-id: 20250320-vec-methods-adfa41e55311

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

