Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA47199E89;
	Fri,  4 Jul 2025 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658632; cv=none; b=rLaQ4dPMXNtLOW8rRbTJGHi2VzTc30ir1yREi16NkfRErpt02UjBvGtaI++sbNLwfW3sSl6MUxYBTtRxCs5hOyAhvQA26ArPbs+E596yzzsivrzRWi2bXdyJWgR3xGvoMdoxzkKJbXE4zQy+gptSm8/uSI2XuYPhssF1fwIZ5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658632; c=relaxed/simple;
	bh=4dz5j6fQY62BWNK3xoT3qWhcHo62AErxDVsL3v8iN1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I0olEHNG/B9z+HzSqwDKZd5b1WblzeIjOK6H5eDmpPpxXJfupqPnaHYa4EONuHIvA//a5C4mnkupkS5v05OJlNr/GstkuavvC+qDVcWG6t6c/DHVL7aFT03x3O4noreCIXwZcnC8D+281IHSR4TO65izM40BAIy5L0x+6URjnwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkSLa2UE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkSLa2UE"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d219896edeso150865585a.1;
        Fri, 04 Jul 2025 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751658630; x=1752263430; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNhvIHtOBpbCJYqem6GBWVYViowpWEgdYxq8EYZIWqA=;
        b=jkSLa2UESlNFbnLn5hs+CAcyW2b9Dpk5FSKnwmMgrDmpwf3kMZmBXY5HhOo81cfhdV
         NXoq1KeKlNTrbqVIKibvb0n2+j0maFLpB/AaEVzRz6S+kuIcjIn04WnpuNG4J3RQl+ip
         OCZ6vLk89shr2O4LXqGLSJpLxVtdipKH2dw+LrDKUYRKtrX4vKbaS6+F2/TAFOgEYt0x
         uJ2etEwBaBbz9nozM/Eih8CPzRsArYzoMEgUO2784nU+WmKc25GJKBrBHy36ggw9RY5j
         a0nfHFBsNF6KkbmEIM0Eq92cJynfpHKPajonIm4QiMPDVbhUAaYw4YmY9/iMyTDuCUXI
         hScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658630; x=1752263430;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNhvIHtOBpbCJYqem6GBWVYViowpWEgdYxq8EYZIWqA=;
        b=B2kQbzjFmLwrWq401uusJQuxrmdvuprv5x4qODuoDI6Hpaf2GzP76cGHmyvMhzoTCZ
         HWdMj0Qks3/4le+p0Sn913W/2efJfoBxnuPcs05lb8vqGRxVsjIUK5mwunc2VsZYus5I
         ekX2Me4I4whK76zL7KPbRMp78NYZ2Vi5Su1y7beIZBJelAS51edn3hM31wKfkbIdBS6Y
         zvt2I6w1MRjX4+8HGJ/MtzzPuIDBKixbP+zSkU5G4hnuFZWMEuCD0qvOq77t7YzILtNh
         q8o+KsGLTPsNk6mS52QSHXSBcEUA0mk6mMDcPs2T9+5rxair6Nm8nLaUG5xLmTWfaBlj
         9o9A==
X-Forwarded-Encrypted: i=1; AJvYcCUTidgewyT0ZFVjGFmJ2COtZa1JgznLkyzUJWksWM+ke9HYMEndsp+6E2b375h0mqQ5VRisA2hqFGCV1Y0=@vger.kernel.org, AJvYcCVbmK1YmcyedPS03+21gLV7zNn2rqosJjcUrosatfwoNA24BOBo0xPhO75+esPwO35EIiy5Wyc6MSRewL6T6fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+m2Jnh487chH7D5053ak1QCNegJjoJPBOkb7vvVNg3Vsdli6
	/6wV+8ug1pBo75tINsGuk0n+o4IB/pDZqf5h0vPRYGm1K/RTn9cOyeio
X-Gm-Gg: ASbGncvM3nujKBSBSJBhp3FCY3w8Cgk6bKfl0s980L882u/CNoaGH1QmgoD/AsYKW3x
	QznTqxAf5IaGSowMR4TpOYxb2KSfeNYIV43Rw44/15D4lQh42W+1F9IzMQpHsnHlG6hWIy2XHd9
	BFP9bzeg3JAUQf57Gv4dTofmiij3cYT7eH0pgYcSvM2YWHyaD3ndu+9Y+pPM+cc9LQ/Lt7R6O7X
	FK5huXJknnF6zxnTadJXjIDZLAbVzEonw1cc/EjmkS2vJflXUg2i1oMSawj58c+Ur39Jq+sq6YA
	q2Lapfi90P6AQlrl7/T3UONJQFMXn2A4PBK28RrzfEGCw92B1mK2/bB23e1V8ZJejUDKum3/k/k
	A9BCXxPo=
X-Google-Smtp-Source: AGHT+IHlyLvirHQtwBxA+WyaV38kKYeynPoQmfgRGD62rrS/fv9at4t+fZpzQSSH8LM7H/HmJvxgqw==
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5f20b7efamr10937985a.53.1751658629611;
        Fri, 04 Jul 2025 12:50:29 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe91380sm194263085a.95.2025.07.04.12.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:50:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 15:50:27 -0400
Subject: [PATCH] rust: drm: remove unnecessary imports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIIwaGgC/x3MQQ5AMBBA0avIrE1SVCquIhbaDiahZIpIxN01l
 m/x/wORhClCmz0gdHHkLSQUeQZuHsJEyD4ZSlXWyiiNLh6CHNxyekIvK3o9DloZW5FtIGW70Mj
 3v+z69/0AwILqnWIAAAA=
X-Change-ID: 20250704-cstr-include-drm-d4fa407b3eb8
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751658628; l=1203;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=4dz5j6fQY62BWNK3xoT3qWhcHo62AErxDVsL3v8iN1M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA6HMXb6AcvScyaroNxvf09kaezolSYac8eDhIuiN5trPkSYzfw3XEI0evq+r2Qo8EazRmo9Nxx
 L3cKAxGjjRAc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

`kernel::str::CStr` is included in the prelude.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/kernel/drm/driver.rs       | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6b59d19ab631..09a9b452e8b7 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,7 +27,7 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use kernel::{prelude::*, str::CStr};
+use kernel::prelude::*;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index acb638086131..af93d46d03d3 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -10,7 +10,6 @@
     drm,
     error::{to_result, Result},
     prelude::*,
-    str::CStr,
     types::ARef,
 };
 use macros::vtable;

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-drm-d4fa407b3eb8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

