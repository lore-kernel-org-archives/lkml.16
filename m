Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E21A5B94
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121892; cv=none; b=fTQsVyyayhfIsfHIcmo8oNPqlafMa5qoZCdgikSWygI7jcN3PTZYblkJ+avJkW7s93ow71TG9dPd4xMmlIXECD3tmF4oT9alGih5ILBWqUi9Ixsu3InC42Ajci8SszPp7MFyU+L8pQbXSMqrc8Sb54Z6q/QFecxzE/3yxvaGWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121892; c=relaxed/simple;
	bh=hFvm7LI6PbpFUkR/u0/iY3CWrgpQgOP9/VNv+k+uv0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Evmdc8fWnJl/WJISU4IkYvObiKWhGTqR0BC6siEQ9nL6eVZkKjsghreedA0ZOSm9Ny0BedkfFqbixXmTciFDzfw68sXzssszFThyqtxByHfLJAN8uyF8fYVNRiRLsa0U4NhggXH+hxbbhnKNGpbbYytjEcFZA8gx/LBkZoxL+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Og7cOdlB; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Og7cOdlB"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74890390d17so3095832b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750121890; x=1750726690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRrQH/oLhXhGguBdkv3bDQfEEQvWp/xbahMxIf7pRV4=;
        b=Og7cOdlBjPPf38nVgup4Q9uc65twa+f1OeLFsmOx1JALarCF5a2M4BN+CnJO+Wm89J
         tUYgw4zcl5HGMgZB3+zkicC0X45kT1HaV5SSidJ9veYLnV9mFEv9jwZIdeuEGyFzcJrr
         0qR2IN4sgL4y3jofu2Vheq+bKs5WxXguOWgy1kS0c5Ymgl8jwewqqYmLcN725VaWMRmF
         kFE8n0yFtWstmFXqd/sKHIgSrFVQMmPW/NVz7s0KPaswz1oqg/cJt1zrZ7zyCpwwQWm0
         btTYbIfTafnBQ9MbntrsiOIKI89mLYjMH3N8bW65KO++uPY4rjgkZYtsTnLwFdFpHRpW
         H4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750121890; x=1750726690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRrQH/oLhXhGguBdkv3bDQfEEQvWp/xbahMxIf7pRV4=;
        b=Kn29gCrFpX7Txpbn+LRDiYr8aykJfIYs5ybedL1gwKvtu5LO7AZwQ/82oUcMDaMqbS
         jE26XeH9+N/JSrEBYuTDd+w71/ZWaRONt2iaV9I5t1dZaPHZ26eO1vvp2iHgUQrKWfsl
         wWcZ998BNBjc8XP+W1onAAgt6P7V0lfK0KGno3kOfa1toQCyOQnZMtw+Nt3e0KZBc5nL
         zjwvGQsXt3ljxAeILQH2uMMxy1sbZ7C/U9xP7XVuOl9IriJvef2rY8zFDiYYIw36Rdj5
         ynh6/LOoccuhTOphI1P6XLnO31btsqzqgSc68ito8Jf4IExqJ6Vkv2+EAYqmqneJ28vC
         2qZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7bFYQ53kzBHBMVJ9PxMvzQLINqkzZjIQgIyKjPtd7K1VtqSVkTt2/mb1SXUW83d9QRYYZy9UEObSzGs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVo8wkvp6ydV6K8D5fkLWYfFi1PblyReqRkz/vhlRYS46LBBy
	Akvfo5qhdiFZXYOorX2TiuIkRNNc1p+iGAwQGFDsvOyFnMV6AtiySGoo++tPfClqk/Cqg2oXspy
	s6I/abEJsvw==
X-Google-Smtp-Source: AGHT+IETOmo4fVWB5m5SEWPzK5wxJhHC7NXMe/1m1ErpsLuKJkJ6bkL1VUGAVZErkvJZioRlnu5NOyLhYGD8
X-Received: from pfst42.prod.google.com ([2002:aa7:8faa:0:b0:746:1b3a:db4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b90:b0:740:6f86:a0e6
 with SMTP id d2e1a72fcca58-7489cf72902mr13982031b3a.6.1750121890031; Mon, 16
 Jun 2025 17:58:10 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:58:00 -0700
In-Reply-To: <20250617005800.1410112-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617005800.1410112-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250617005800.1410112-4-irogers@google.com>
Subject: [PATCH v1 3/3] tools headers: Remove unneeded ignoring of warnings in unaligned.h
From: Ian Rogers <irogers@google.com>
To: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Now the get/put unaligned use memcpy the -Wpacked and -Wattributes
warnings don't need disabling.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/unaligned.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/include/linux/unaligned.h b/tools/include/linux/unaligned.h
index 395a4464fe73..d51ddafed138 100644
--- a/tools/include/linux/unaligned.h
+++ b/tools/include/linux/unaligned.h
@@ -6,9 +6,6 @@
  * This is the most generic implementation of unaligned accesses
  * and should work almost anywhere.
  */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wpacked"
-#pragma GCC diagnostic ignored "-Wattributes"
 #include <vdso/unaligned.h>
 
 #define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
@@ -143,6 +140,5 @@ static inline u64 get_unaligned_be48(const void *p)
 {
 	return __get_unaligned_be48(p);
 }
-#pragma GCC diagnostic pop
 
 #endif /* __LINUX_UNALIGNED_H */
-- 
2.50.0.rc2.692.g299adb8693-goog

