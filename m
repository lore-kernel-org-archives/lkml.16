Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE3720C472;
	Wed, 30 Apr 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002201; cv=none; b=GIC+cOe0whtpL3Zrw3523Oq2J6Ezv4G43jewcMuCzIpf4YeLGuS67ruS4z8dxubUzVs9PX3MEmdqszaSEhg1FWnU/ytL/svUY3DoDgKZe99k30tWqIdRDGbg/3W5v/XSQpqhkq13vwCQH41aIm1nkPp/sEoARqPOTvZ2bz7TvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002201; c=relaxed/simple;
	bh=i+Kiznrh6FXSRA+XH9X5FiOI1KLvjekzNu5hPyjY3e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h8GNgPXN1xclSih364NAv1L+NaSRQPhdHVbeqLyC0Zmiz7y+7i/8DBO60N2y1V2SiXquUidOpTCoVrzfgbVaPJSZTq5OKP/qIsGUy/fpuCgxNW6XeuGwMrjE3XbVRQ43ncLj0ZAkv//nvRenHX58u4CglOrSjqcVzgBmL8umQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR3uJAQT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR3uJAQT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4174432a12.0;
        Wed, 30 Apr 2025 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746002197; x=1746606997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sg+v+v0AuQceew4To5uBGVeKqW6+mL43pKo0+YFP+Js=;
        b=RR3uJAQTpj54VlJUTKtt0cCNc88FDoeaE4VkHgtC5FYtChVRDiTPPEOUmPu6icKvxU
         pvPdgacAoVRUG78iG68O/BKbO0c6pht0s1p9ykl1xt2Upb5aj9RB/IJz9LtySxN5tFwY
         uRVlJii73aJps/GeGJL7g7qwFa/sPUF3KXJqAd9syHsTkMC/+E6cUOypOrlVdrc/EWn2
         5H/KHLV9UgsqfA4eGtcbJiF3y3N/1J+B/M/ZfPUpUIDYVidfcqx1Lu9UyIJi+2a1xpt1
         V1KT9aKYvzShKjVMjRIMZAP1Pp+N8s1/9KeJ41xVrrOQhmndUuBfjt16+aVrPfiP87CD
         nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002197; x=1746606997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sg+v+v0AuQceew4To5uBGVeKqW6+mL43pKo0+YFP+Js=;
        b=ozsAGit3FWE8tLtt12Nou4ob10t57Q4a5AIGhL9pG9dvfWKoHZ2RKwIiH7Fc02sYwE
         bM9QKwW4fXW0FVRl7lcVuQfA/SEhu1ib1T1B7qx1qpUHy8zd7WmdjwhUZnS2YVDSeyg4
         QqzfGsEcgKK1Wj4Nu/SfV2NvHgBCkEs2aR3XW+kKo36Zpg4AktwPFgludUFgvhyU6MrX
         Ur4IWF/hCnekl9gsC6D3yanm2s1fy24lq9C2LHYKDUSkS2YG4UiVmWl9GKI5FiKq9YKM
         d1hLSKzWRH48SegUVEd+llm1MfYbbDIPUjJWBves0Yi8DUZ2wMC0azqaSG124/DinDNj
         2bbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh/axslT3EcSbfNdkFDTIvJZTR5qQsQoR7BWWgK0K83XCYU3i7PC4Y0cZ/1mKw7uLG1/sJykEuGZ1ANodNOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWyB+YttnQG52dRj5mC15AkSkPB6hICAHhqkFOai5LiZ62F/K
	nY12sIlFBRnQU+Yq3hzH3/0IuZ4zSxxgXBlfkVjfE25Ag7mG1tfAQMWOEGJtJaw=
X-Gm-Gg: ASbGncsaYnUpC719bW+awZX9iYyNrz2qtLFPTeWAy1C7TuMesKCE/ocGpbFizE1KIoJ
	I1ZlS3Rc2+rtuYDL+pw+Lyyq50JY3xouGmN0DrfCkR4/vBjDKzEdXF3fPNMf0rdzuQPpPQbnDnE
	+fJ3WewD1ALP2qOasDeEI3H01/jtNFmjjRa5e1w6N8mP5o/uPZwPnxxh48cKl8sqM95DeYv66UE
	7AWzu05CBucLkxvcy9SkoNXOidXblWQtgP1Y0zQpuuh//RRQzFpa19/27SV0zRN/N5v0l1C44iI
	pqggztoFcH6UtXnqvzsCQIFSj+o3S+6CFRSiZunA9L0DnWNyiIXV
X-Google-Smtp-Source: AGHT+IGEvlecbLtLTscbIJuGzlOCyJiK7FNmnuS04g7qHDu/nziZBOOtUjo2BjT+55k4Ivxq5g5hPQ==
X-Received: by 2002:a05:6402:3590:b0:5e5:debf:3f09 with SMTP id 4fb4d7f45d1cf-5f8af0b6d39mr1505728a12.27.1746002197236;
        Wed, 30 Apr 2025 01:36:37 -0700 (PDT)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6424sm8653721a12.42.2025.04.30.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:36:36 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v2 0/3] rust: add `UnsafePinned` type
Date: Wed, 30 Apr 2025 10:36:10 +0200
Message-Id: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvgEWgC/32O0W6DMAxFfwXleUFJgJGgaep/TFWVBNNGahIWA
 9pU9d/nwvvefG353PNgCCUAsqF6sAJbwJATBfVWMX+z6Qo8jJSZEqoTrdS8rLhc1oR2gsscUoK
 RayNHD6qn88jocS4whZ8d+nWmfAu45PK7d2zytf0Xt0kuuW9933W6MWbSp2u04V77HNn5efALf
 K/kuhwlLAKi3V2H6uNgK6mU7JWuO6WFNoR0kFKu7xkxpNNc8pJTHeHzZewsAid+DMtQNUZ00o5
 O9KJtlFO6gXcvpaOxNQ0hpTOT6SeSef4B8njnBUABAAA=
X-Change-ID: 20250418-rust_unsafe_pinned-891dce27418d
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746002196; l=2520;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=i+Kiznrh6FXSRA+XH9X5FiOI1KLvjekzNu5hPyjY3e0=;
 b=cK/PrMAfxkfLBtniNJLQa7AZB8Xsfb2Q3AgwdjoRTaiYPjseg+YtlNk2YZe6aaH8Hrw6e60ge
 jEhHbC5+VniBqVgd4Cl9IEvJAD/PIMBLlyLIGTzEVXXWlzv2Cd9PnIc
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This version now only has the kernel implementation without the
config flag for using the upstream version. Additionally now
commits for using `UnsafePinned` in `Opaque` were added.

Checkpatch warns about `rust/kernel/types/unsafe_pinned.rs`
missing a MAINTAINERS entry, I don't think that is necessary since it
will be part of the `RUST` entry anyways (from what I understand).

Once this has had some time to review I'll rebase my `miscdevice`
patches [0] on top of this.

This patchset depends on the `pin-init` sync for v6.16 [1].

Link: https://lore.kernel.org/rust-for-linux/20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com/ [0]
Link: https://lore.kernel.org/rust-for-linux/20250421221728.528089-1-benno.lossin@proton.me [1]

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v2:
- Expanded `UnsafePinned` documentation to describe differences
    with upstream rust implementation.
- Removed config flag for using upstream `UnsafePinned` type.
- Add patch implementing `Wrapper` for `Opaque`
- Add patch for using `UnsafePinned` internally in `Opaque`
- Link to v1: https://lore.kernel.org/r/20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com

---
Christian Schrefl (3):
      rust: add UnsafePinned type
      rust: implement `Wrapper<T>` for `Opaque<T>`
      rust: use `UnsafePinned` in the implementation of `Opaque`

 init/Kconfig                       |   3 +
 rust/kernel/lib.rs                 |   1 +
 rust/kernel/revocable.rs           |   2 +
 rust/kernel/types.rs               |  42 +++++++-------
 rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+), 20 deletions(-)
---
base-commit: 39051adb070432b283e6c11b2b24937281b9f97f
change-id: 20250418-rust_unsafe_pinned-891dce27418d
prerequisite-message-id: <20250421221728.528089-1-benno.lossin@proton.me>
prerequisite-patch-id: dcf79c049766e66eda0377b225bb441edefcdfe4
prerequisite-patch-id: 0a078ba4989327e90317f882fa42a387bb7594a0
prerequisite-patch-id: d5182c6fc3e3b2f255001334b5da9d5c5b7b29ed
prerequisite-patch-id: 016806607094f0f403000ec455db9ea79e538bf6
prerequisite-patch-id: 368bea523f3b3e14f1dd599343475e0b166fad37
prerequisite-patch-id: 526054a8a8871d1dd5f376b7ab6aa5542b481b70
prerequisite-patch-id: a691b331bc3200287413e6423b8cc3e9cbb177e0
prerequisite-patch-id: 5afb38f41b18408fef4d3abc5750c09a67b2d34e

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

