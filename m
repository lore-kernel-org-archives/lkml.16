Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1461F3BAA;
	Fri, 11 Apr 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381899; cv=none; b=Or2fSCXK9AgB/aJPbPUVT8pcqePCg91euMvtbXKblTE3a6CubLpCtSQmHeT0IwnRBgyFil69aGsyUxmIiHA1B1mzoBP1rI7Yuouni/GIJtosZqgA4qkBiJBpWkvmvyB9SvAKaFme7e7e9yWAjyFxhpa7etU+oLLDEmIEnidW76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381899; c=relaxed/simple;
	bh=IMWWQoV6XgsAIBjP+0e9XF5KfO27dqPvBibjMqOGD2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ozUgm9dUKweXXTjU8y/rqWAJMv1R2a71H5P4CnMUlJlQSX3ecNWrx7cm57IfOCN5umKKsWfGAo7g+DukpDVZcs/PNotQ9KCOcQs8C6JgpBYXsbmp51OfEgZEUs56I7Yto+JHl8wgEeg6bIjfwrwOQdRti9K9iWXpomnUWZ3DlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWURmFXb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWURmFXb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5568355ffso173982885a.0;
        Fri, 11 Apr 2025 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744381896; x=1744986696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=difcHV0OPhFj1AfUwlESUFw3g3cjarJaUpijEascCyg=;
        b=KWURmFXbNBNZMvSNOTBALvEMgRHOAcDUB6gr1ar11SYOp/N5lTX+rLw/DT+0vSj+ql
         gk4jT5xumUEIXUeTm5pZT3ovwzWYPJEtxwv5KhY6hn/b7wERHUSlcE6Cdv9OB41hq3/c
         yJlsgavDvqYDt8gDZ6KhlREJzjrvJAZSzsXmxEwUhjbbGK49zEuBge6dFmZBYXz+jZtp
         egCmBvY+1Ptw/xT/ZvcbHKUd3L6STjRO/7QfJUcmPTj7YwujGV1cz0LGbmjq2s6ebkVy
         JaeMgxeEceiWqfoD6EyL6WNMSLTTz+mQ+kkBVoc16F72R9HZ2WVXmR84kVfXMnK6oJto
         BAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381896; x=1744986696;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=difcHV0OPhFj1AfUwlESUFw3g3cjarJaUpijEascCyg=;
        b=D1+EEtyGI9Rg6UgALiyLNPWlhqkGAYv7YewPrara9aqpOG7cdFZjjdJIEjwR5J6OTM
         iviWbISFmFFkthUoS+aI+F0Pdm3g1RUW54WbhVSCdZouKzTlxTeTLjl0SYnD2F57pHy8
         WZZ7E6aQ5qmmToWFR3XrVx3RIQBeX5zFik8IWp1DcadFfpK9KbqTzEr11OiDiw+/b1Fp
         hulT0epXMvTbV0IzFLSKga7/SDcnQ5Jg0KgGhp+W10+uPuh/DVCdksHKNMo1wkCDTQU5
         MHLbNnk95xeCn2JaIkzR3qazQCwhDjm9RA/c95hOr2wZEpASsr5frMAXoosAmME0lY5J
         558w==
X-Forwarded-Encrypted: i=1; AJvYcCUGQKzawUKwGKD/W6qHa8dmmJai1j6CQr57KLH8k4NpY/H+cza3IRuI755LvC/kP0aLR6kZGyTCvezjxbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPukugEe0ZU0xprOnZLSgei+hkzN/GwAvA/2gGkmkfM1pudB1
	TBiF5dQ81qPuwGdlgBsxDiqcNn/T0Sex33wkNlP/pjnGDVTAT81RwnqOeTz5
X-Gm-Gg: ASbGncuKGdDRa/sJPsQvX8KICro98BOY9kcykrDgr5cr61UkWsoaOUMowSIIvY4KtcC
	EUpWdOCLgmsZLofsch2W9hCj3SWWpjVrO1YeuWK6K8My9DQJx8XGv2PeCmUUIJMwluIe2AJJwiN
	AggmACWICyLJNAN9QROAjvu2AFR+ZkKRDn3MLNzdtSeZMfZ58wJwOsRfZO219deH8E9Kr00t2Hh
	hHaq12CqTy+m2pyZwaLVR5/UpuCF0p9BefcOu7OEjEV0k5lIpQoKVEUy7fujERRNcOndgdIlx69
	Kcz9d73wim7H0CVDQhrMmKe5l0/xXEWplhia4ZpIy9ZnkRhlXlvcryOzfZj8vgT7JKAh
X-Google-Smtp-Source: AGHT+IGjjK6g3geem/Fdq4ott7uEPaYO25FdmFHFodlM5kmfBdoQkR5TAe+R2NinfXPgXY9EKvb41w==
X-Received: by 2002:a05:620a:8009:b0:7c5:3d85:728f with SMTP id af79cd13be357-7c7af0e2355mr567252285a.25.1744381895970;
        Fri, 11 Apr 2025 07:31:35 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:1d83:73da:5aa:7e95])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8969e5bsm267478485a.53.2025.04.11.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:31:35 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 11 Apr 2025 10:31:31 -0400
Subject: [PATCH] rust: check type of `$ptr` in `container_of!`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMIn+WcC/1WOyw7CIBREf6W5a0m4lBLaXzEueFwsMaUKaDSm/
 y6xG12eSWbmvKFQjlRg6t6Q6RFLXFMDPHTgZpPOxKJvDIKLgUtEZiVza6omJspsDay+rsTcTO7
 CuDIBneAyDCO0gWumEJ/f8eNp50y3e/uoewjWlFZelyXWqeMmiKAsoZVCY68Hq1A7q5Xxo1Tky
 XM9Gqfh123qdjM+/mst95qoFGZx6L2xstfaTw+E07Z9AHg/hT/0AAAA
X-Change-ID: 20250411-b4-container-of-type-check-06af1c204f59
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/lib.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1df11156302a..da9e36aa7967 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -200,7 +200,10 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 macro_rules! container_of {
     ($ptr:expr, $type:ty, $($f:tt)*) => {{
         let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        $ptr.byte_sub(offset).cast::<$type>()
+        let container = $ptr.byte_sub(offset).cast::<$type>();
+        fn assert_same_type<T>(_: T, _: T) {}
+        assert_same_type($ptr, ::core::mem::addr_of!((*container).$($f)*).cast_mut());
+        container
     }}
 }
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-b4-container-of-type-check-06af1c204f59
prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

