Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD9218AAA;
	Wed, 16 Apr 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823752; cv=none; b=c4pVsZIlTtL1Q4Tcyf5oMnkLRmGZgIz11iS90BOLWSFv67yTWMBpoYy15HL6ivccEzJIaBe9I2z8zrgZsauUB8xiBKooL27c4niO0ZOssorix3/0hzfEpUHySHfOG7aM/Arg+he6zBpIfMi9BZReWmdrsD72Qki94TYm5e8VJ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823752; c=relaxed/simple;
	bh=YjJiENjp87GpyyFgQcH94fNkbHiwsqCli301HCFBsNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FcaG5UsqJJXJD49sI/dxH/4gttfrMKR6vhhF1y9U5wov2o5nLMqz6ofN7WAqZeiu4SW7jK/vvknkbhrB4qvF/JilI0/+I39Uejo7CH5J2zxgTIg3ClENnhefJVXfUgeSrwz9RCzNBGNUtxtZ8RAFMz3dKcwl/Kn0tjhL1AT7yKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNJigXbc; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNJigXbc"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55500cf80so543478085a.1;
        Wed, 16 Apr 2025 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823750; x=1745428550; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HB8GiFbrv3NguREXaBa1qTQvDmWIZt5fr6O/ax2kKns=;
        b=nNJigXbceOelzoltdpGHBeKId4agZIWtPg+q6jnnNEZyzHgQqBCB24qFaJrCtqP7lU
         8x36G9Qjwu3FysQSju153tti8hNLK6EwijaL5pwYesKYf2ChVXoVsCIkK3B95U7Z7dkF
         GqYXeC3nHuc7PXnLIP4JbVrVViBhqtHU9ZBXfME0psJSNW9noKBTB8Wc6d1lneW9eXF+
         CABulwDOx4Bq0LmZmYlEwcAh2u9pdprWQYvOmxyu4bq2v9FJbAyirOrKy9+q4jCrn9UM
         CHDjwxovk3os4QwbngDIYI6AjzahMrcVkLeT/M8BujBUBRIbt+GT7Com2a7AR7ttOXaK
         dG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823750; x=1745428550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB8GiFbrv3NguREXaBa1qTQvDmWIZt5fr6O/ax2kKns=;
        b=BeLygBdHxjAIT2FjDQz3istKYeixP1f/on+q9gMr60H+/EEXRtCggP1EpsWjA2A9YZ
         UVOTLGZDZUNsGaEEaUyCwyboAgg5apVh7gf3uLIAdj8eUOA5P6Vw/5P5CG/mzBu/I1rD
         lW64jeO+iq3yA/tKJ3f577rg0hx2j91zp0vTgbR6vDcOZHf7WD67xHEZO5MZtlGnrMqY
         CitXOe0JNm5m4IfrVrOiiL/M36/60YzBHfRJwOa1W6+iVnqR3yD7FzbyZBi7K67TovZh
         ZmV6VtyR6xr664RG4Em6Fhy6m8WqBNWa1t25yCcY1SKec2oGiW8Y2f2pSkzZAMk5k8ug
         A0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUzQ/3B8wudw7bfl26evnMzCo+32lnzwjGj65JpcK50NL5XksCWw6MsY4nJ/YTBl8qqSNgy+ZWkq929MjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIv6nbmGZKUMwLHK7yUPV8qPBfZvNs5YeM4ALjVhCK+qjVDin5
	9MloqDbVupPE654sxQzkIIN7AjSwFErEgAXJHDX21rhMvvInW2f9
X-Gm-Gg: ASbGncsP7EEiSNLSDtvlalmpWiDvDV7TNvkHGKyu14BjLZEKVoMuhDbw9VnLIfmij7i
	EbwBrnriZ1tRku8R27+Pw57vvuWVI8WsjCVNM13nbwOOcem4fZ/kxh3EWzyiH3AJ3FU43wSE72u
	83mn/k3Xuklu5Ltj497dnOZxwQTPT9STlkI34c1w/CcENVN9F42n7c3EZaFduHpTwZiSFbif2UG
	tWkDIgNaf9pjGzRyJm71ll7AbjrmODegThxUloabySlZjNgYreDtOJUFxWLFj/53b2Q5CQ17nR9
	VkPua9XDIzMvmda8v6r81OI5kfX7e08+4dFuE6jncwzMLhyDJGj9Ivbypz8hJMTsLDoW6Pf8QRL
	bArF2f2WaCEREo6dtN5ElBAf8vt3b+myh0JYeuM8HpbC7
X-Google-Smtp-Source: AGHT+IH86dRF4w2VP/OXb5atdIhb07YFwsd8lNSHPoWOGIbhWe3tnCGCkL1hYTdJ8N9c13USyM6zLg==
X-Received: by 2002:a05:620a:24d5:b0:7c5:d7c4:6e0c with SMTP id af79cd13be357-7c919002ba0mr409516485a.27.1744823749897;
        Wed, 16 Apr 2025 10:15:49 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:a61d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm1084605185a.22.2025.04.16.10.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:15:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v4 0/4] rust: alloc: split `Vec::set_len` into
 `Vec::{inc,dec}_len`
Date: Wed, 16 Apr 2025 13:15:39 -0400
Message-Id: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzl/2cC/23QywrCMBAF0F8pWRtJJn2krvwPcVGTaRvoQ5Mal
 NJ/N62Crbi8A+fCnZE4tAYdOUQjseiNM30XQryLiKqLrkJqdMgEGCRM8JR6VNThQBvsaJ5fMFU
 qliKLSRBXi6V5LG2nc8i1cUNvn0u55/P1f4/nlNGUlbksQGYgymPVFqbZq74lc4+HtZVbC8FCL
 nSSlBI0l79WfG3Msq0VwapEF0wzATzFtZ3egyze7uErw2fVNL0AtatkATMBAAA=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v4:
- Rebase on rust/alloc-next to resolve conflict with "rust: alloc: use
  `spare_capacity_mut` to reduce unsafe".
- Link: https://lore.kernel.org/all/20250318-vec-push-use-spare-v3-1-68741671d1af@gmail.com/
- Link to v3: https://lore.kernel.org/r/20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com

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

 rust/kernel/alloc/kvec.rs | 81 +++++++++++++++++++++++++++--------------------
 rust/kernel/str.rs        |  2 +-
 rust/kernel/uaccess.rs    |  2 +-
 3 files changed, 49 insertions(+), 36 deletions(-)
---
base-commit: c3152988c047a7b6abb10d4dc5e24fafbabe8b7e
change-id: 20250316-vec-set-len-99be6cc48374

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

