Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D41210198;
	Thu, 26 Jun 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934743; cv=none; b=byNBNYhcpnAYnPt2aFR8Be49bLOwRIVJpAAdeCcNCIumrcI+mj1UyE5SB2WlP3hDaQ0xiPixhDipi05BlA9kPzPVNI13+xdKnAgFOIYBWn5UeA8O4mXy7k9fTe2LiZLLHXDagaDuv/HWURxezBzXi57C/+MWhoY20Sjn7xcHA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934743; c=relaxed/simple;
	bh=nOf8soMmRGmaMNZe0vd2LALZAHYkbrrvJnC7O2i9mbw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kuQlXNPC5A6uSxLLHMujg8WfcoQkLbA7yiz+cQ9W9D8wb6aQCbnRQmYkDsDkikqT0g0AYA50u11KQ/KDxw5LA9QAXp4Z22NRJr/V0cty2zVyQVMFRuo0mGV8gkruvvl9UZvym7vjmRvq22XnLFmfqV8xl9tmvXaIgs4G0sS5vGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNHSK15X; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNHSK15X"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso8666525ad.3;
        Thu, 26 Jun 2025 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750934741; x=1751539541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1t9GLFsVKIrtONSeSIsYsMMcNJWR+ObNECrjbsPTbc=;
        b=gNHSK15XWOMcbU0X2Hynfic+lyEabfR8chCSY6++f8OBh1/+cC0u/ZJYmwH9MAFPV0
         jV7078W8IFiyoPC3i1pO2CKuI+i6WpUnPubMiu/lDn8AlCEAXEKghujuD/8Q7pOTqhrJ
         KUSYBHCjI/v8LynicaqzXimv48DUJHLqc3fJ3rE82kj03p8PLZ7/E5usoRpEp29d02Im
         D2+D3k1wazZt7vAPliDVnH8zilApzwWFSRPo8hAd1hhlfFONpoPyXFTA1FXouXpmxD0w
         5gNXuMxBKmEL9Zg7/Ege40LIF+s0ZAk9+cHjCHPydXYb/PZY8SfheQMzaq/qhkSRkl+T
         JGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750934741; x=1751539541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1t9GLFsVKIrtONSeSIsYsMMcNJWR+ObNECrjbsPTbc=;
        b=iIewbcPdnXI/q0Lu0VZeVkEpukvg7DB7xLPOLyKNvnH8uxPa2MYBUbdDiDvZgjIWX2
         auWqrtu2//LsGRaYy2Nrwpp9Lc+KkeAHdKA8MhEpOqDWVV2Z7/0CBMkmRrN/MWBjG2MF
         Qk51b9ND1CPgEc9Y9YV+u553HUDqhmD0S/4QzcLE5LGwTJLmEgkh9OUg9Vy0OaF2cqbb
         0f9Th2bmaijIyNh3Mo1BBdR12arBpOtq2uxyTHesExwGmKF4z8Gxx6jrBNLQgB/y6THI
         EipJzxDUf5tqTzo6/Go0BsEFvION6u/0Q323bBOidTmLvyZFz7rP88/dSPxRrZFwZ1C2
         4n8A==
X-Forwarded-Encrypted: i=1; AJvYcCVjtlCEGP/GhBg4wnGaIToE1smOpZvpnr0K2C4wnavj6iOZBeUyA9fbCIVASo0Nd3mlTv8Z3i1vE9veFVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjf7cxiICQeeBEtjkAqetvRDaUE23CUEqlGt9xW2/H/MrkhHz
	jwQ8iTHZoPk0SygD7i8W2gCEIYBMlcX/UcnWo481gqqdYMcsedR8NZoXnC8/DnOn
X-Gm-Gg: ASbGncu3OcMuIg5+kWLinHy0qANUpQPZM5Gj3a99upzdk28fhbPQAzbaHd+cR1Ze32Z
	VIyCfJj9VvOxXOhtOPSPyrCVFyofXbIpYpWF+ZzoPMeE4iRpk+vLxJhD3Py90IoVUWItn/9AAtS
	zj2od8f/CEvXW1vcRcV/VWroEKlzZfbgcVTBpoAtIo4P5CvWLYDjfI2M9XwcuW5Pu43U662bvpd
	6J+C3l9dqqK/AhH2ovG2v1o5982rF3SDDXwMkG23k6kIzlfj2NaC5mi5vE+xzs8lgb3XiMDi7Kh
	RzJohaQ2AheprQYIBHNheZRW8JGpZ9b8XH0zNqO4hp2mHovJIbGIU5/ZT//mlB/gYvJkh52iX3Q
	5x9A=
X-Google-Smtp-Source: AGHT+IE0XuN41/0D9/Z/JjSpSQ3M7h6oJlOa7LHC9w7kONipaGHQbT5U68NF436XxElu5Jwkc2Xq0Q==
X-Received: by 2002:a17:902:f644:b0:234:b430:cea7 with SMTP id d9443c01a7336-23823fda0cbmr115943075ad.22.1750934740997;
        Thu, 26 Jun 2025 03:45:40 -0700 (PDT)
Received: from shankari-IdeaPad.. ([49.128.169.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a76esm154268995ad.107.2025.06.26.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:45:40 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2] rust: miscdevice: clarify invariant for `MiscDeviceRegistration`
Date: Thu, 26 Jun 2025 16:15:20 +0530
Message-Id: <20250626104520.563036-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword and expand the invariant documentation for `MiscDeviceRegistration`
to clarify what it means for the inner device to be "registered".
It expands to explain:
- `inner` points to a `miscdevice` registered via `misc_register`.
- This registration stays valid for the entire lifetime of the object.
- Deregistration is guaranteed on `Drop`, via `misc_deregister`.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1168
Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
v1 -> v2 : Added bullet points, changed the last point in the description and added intra-doc links.
---
 rust/kernel/miscdevice.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 288f40e79906..3fb118496958 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -45,7 +45,13 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 ///
 /// # Invariants
 ///
-/// `inner` is a registered misc device.
+/// - `inner` contains a `struct miscdevice` that is registered using
+///   `misc_register()`.
+/// - This registration remains valid for the entire lifetime of the
+///   [`MiscDeviceRegistration`] instance.
+/// - Deregistration occurs exactly once in [`Drop`] via `misc_deregister()`.
+/// - `inner` wraps a valid, pinned `miscdevice` created using
+///   [`MiscDeviceOptions::into_raw`].
 #[repr(transparent)]
 #[pin_data(PinnedDrop)]
 pub struct MiscDeviceRegistration<T> {
 
base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984
-- 
2.34.1

