Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A73202962;
	Sat,  5 Jul 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730362; cv=none; b=oylY0CgzaiR+6Zwo7Ull3EmLkIkQ6wrlsB+Uwbw4oBx3ZyaAyP3pYhPKQamiXkmzzTbUy5k0+bIF3oBlRnFU/OzBaBC3hLvkR55CqDc4iMMPC7aTAhY5RVl1Cugzdpf/M46Kv1vwR/vIXHJxQcyCOsJ6wVMvK8H7OXgJQLtvenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730362; c=relaxed/simple;
	bh=vTlSrziJ6PU/DaMy8ZDVTEf12omCrQI5d0adbgJTZDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IqGbwci8vBO0/8vjYN401uGTUq+rF6UV7UH2wbjcdDyLVDfN8sO+xjqurrKbXE5tygyk7biXmJIkHJm4+5S7wB8DWZYDt8HbGayxqXf83gizwWLk4UGs6jtB6TkcqBA7U1WGkdrGVyUWq3IGoa3pOzwE3bCMfazjvDqnQ2vbQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMk2o2An; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMk2o2An"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fae04a3795so22158026d6.3;
        Sat, 05 Jul 2025 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751730359; x=1752335159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFk6tKGCY6/1TvKl+9/bU1VolDJHDcPT6wSmNBNvTvk=;
        b=kMk2o2An+SOYNVIsXMTxzEm8wO1VDA3jFz6NveQL2KiXFFUqlKbChsiF1HNevlKH7Y
         9xnDr6n4dHuQzNAodEOT+Knl6MPvacEy6gaf5iNnT/CwX7LLIrNDOjLnKnQwTVtLGN0/
         JWiCHRQxtvQZMTmr9BaiL+klKviDF4X8B/opfIADas5kBHLioHFt3YPkPXTD4gBakzsp
         3cXHSzOmrSc7woNXUJ30TMXmABGJTtrUS4kRP7s7SDhe/75zvTcMJVLXKY6N6Std9Vyz
         hvbjnATWt1eo2sE3XP+G/b1AoqOSOsG55Ct/7EPQe2CbRb9O39gle0sMSvwPaWBtLiQH
         D1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730359; x=1752335159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFk6tKGCY6/1TvKl+9/bU1VolDJHDcPT6wSmNBNvTvk=;
        b=e1lCINfuQtFWO0/Zi+wGJS8wtlBshxmwrAtAW1bCtsklehyy5Fbw3PMw4NmnoDizAa
         sRH4wgafAI0AHJxrMOs4jTglsIzX8InxCzj6ettY48QjFKGvEb4MLRoKq1k0bk/mR5dN
         G+q+3eikrf4J/dTSt/SpleyOw9trYX/S1fkYmgnUMRZ5Urc4KQQmC0aO+q4tKWI9T+fH
         RkgZnzzI549K7HMk6nFLcDap5zkYhQMpFa5m8HTOOp5OW5DdQDzEsOi7rlpq9xDPdtgY
         rAQZg1Mr2UoK/5kxVEQ23Z9GQAC90wb6vUIFvuHL3zAkBhHwFutTI+HbRdqrTM16jNmJ
         j5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP9IUwV8p9McHHJH/2LncV2qF0S8xQ/HEGOJ9AXu+9wKRTjEceRs0laiP6PGqMAsXGI5sEINRgd79oVixYuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHJPGwB+tbvZihZoS+WMj3Ldv68Ppo2xDTwUnrXSreD2O9VEm
	vC2cc7U4UaqTfiN41BkbKZfAPbRe28DMVA/s2sQa1HGUrvDF6cDQYWHO
X-Gm-Gg: ASbGncvJGU71ODMRDktZDjYfzuC3dIsXP9utrDxrKX2Tpkyt9GsGoQHUcO84/CNlwtW
	of3NdraHv9qxbaJqWBITFf2zJmGPLVjIt/8giRjKbRAEIrlaEmfbM+dGmz9yHD30cZvcuExnkII
	9Tbwao9JcG9Ge6wCBZNLGxx5/DzTAgJ2yqVhXjt5Sjgo6x8JwB11it0ExqEKTtraY+/Nz2Pbmlm
	lEKtwKhsnDYYQ8zYy2Me5iFp7EKThAxdp9U+pdJ6tZZ3q0TFfgOOav84xGhMwXk6HYErVFdcFSJ
	tqypRuLFQ17LZxmGMAMD2APkf5ESgPFouMLR2hTRKi7Lzvr3U1mila7v3Fl8G0H0dFznmNYUfuR
	vkCtBX7jbCzMd3OYZaFCVQ4U=
X-Google-Smtp-Source: AGHT+IErgWab8gGAsFzC1pqF5vVxYNChvmn31db/X07vbhoAg6LoRJylQ+SmJ4srq2FQRu53LvZ2SQ==
X-Received: by 2002:a05:6214:cca:b0:6fa:d956:243b with SMTP id 6a1803df08f44-702d1a31956mr44040216d6.37.1751730359428;
        Sat, 05 Jul 2025 08:45:59 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:6980:d392:9861:a887])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4ccd333sm30466366d6.30.2025.07.05.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:45:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 05 Jul 2025 11:45:56 -0400
Subject: [PATCH] MAINTAINERS: add miscdevice Rust abstractions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
X-B4-Tracking: v=1; b=H4sIALNIaWgC/x2MQQqAMAwEvyI5W6gFFf2KeAhtqjm0SiMiSP9u8
 DCHgdl9QagwCczNC4VuFj6yStc24HfMGxkO6uCs6+1oe5NYfNDQk0nI+VKoiHHocYjdFNEi6Pg
 sFPn5j5e11g8wrZdsaAAAAA==
X-Change-ID: 20250705-miscdevice-maintainers-2aca6f19fa0a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751730358; l=756;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=vTlSrziJ6PU/DaMy8ZDVTEf12omCrQI5d0adbgJTZDA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDhWiG0O5vGLCf7Ml5uZ2Mo060D40EoOdcr0r4gjDe9MEBnULh4JQcVAf6lQc6eE5hU1yzozDDd
 cfNfnm3A/wQQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add rust abstractions to miscdevice MAINTAINERS entry.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67a..a9a094e2c914 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5568,6 +5568,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
 F:	drivers/char/
 F:	drivers/misc/
 F:	include/linux/miscdevice.h
+F:	rust/kernel/miscdevice.rs
 F:	samples/rust/rust_misc_device.rs
 X:	drivers/char/agp/
 X:	drivers/char/hw_random/

---
base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
change-id: 20250705-miscdevice-maintainers-2aca6f19fa0a

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

