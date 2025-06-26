Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D482264B7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750916919; cv=none; b=IbmsjHn2muDJveCoVIveZFppH1LVRvn4x1sKTOvkcoVPZ78t91Lv12erQqLdK21tXXuurKCBFMO6WFAKVsrRKBxKzYyrDkHHUrmJh8mQekwc+KiYMs+V/IcUpPyhZfxKLMesB846puaaxcFVwhiv8Mt6ddlW/neef5pY+1nhKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750916919; c=relaxed/simple;
	bh=Y9rAwk43R5Qu/XneIvtPPaxorqlg9IJwfPk0mko3rAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U9WD0uRdCpaoNiz36aUHSuMCb1h4AYU0GbpKAwOwnoFomcv4F/hP2HWoAY3kNHnFeVHlW9MEIaHtUj+WY+ww7AUac1JTE5fQQh5GdU9z6rfuzMdXgyKTg2QWfnAcCD2gW66T1gv0JdZueI+diJtm8QFqTJZUvvS/ZKm6beVDEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1TLyXauv; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1TLyXauv"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747cebffd4eso590922b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750916917; x=1751521717; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=06wlXYRsyscOOukfm0BoHmWOsjunsh8IZmbqRpcqtRo=;
        b=1TLyXauv0hSwcmp0Hyyig6+luqbkAyysSytClcC/r+u+yUjI/pJZfvyDxVbU1LaoMs
         7j+851Vb/z/Xw8//K31iveAZ6SqEXuoc6zu2pzLdjKwWicbSC5OwL9QvV3+JFgwf5nE0
         gXRgP5EY8A8g7Rp22kpVKIBfM56ndTirXLSbYQXhvLydG65PXRxf8W/TLiRMeI+nhaC9
         inZclZg8Kjo0ZwU0sJfWkRkWCkLIj4onIFaf28uaWD/XUTChrKIg3yh0haRijJ4CYZwl
         /iNrb+wr+VVLRN8pQeDA97ZxwIK/1Yc4279e2vmN4K5Z7kYot7WlPlCq2lm9oZ59Cxq6
         6Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916917; x=1751521717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06wlXYRsyscOOukfm0BoHmWOsjunsh8IZmbqRpcqtRo=;
        b=F7QYr5mlDHNbwqGTXQ/yfcAIC/j0aVQAyFksLj/U5MSsPU+qMbfwKlW4GFcNm9rRsu
         jWNa0nNDr7Ltgb60eWsS9xEYft+eE7sV7Jnt7E0okFV/7TnZHY8N8gdt7xyKGMVy6eU/
         6+32f0otMIQahuk1LJ+jWfjahYRG2PPjh4igjm3kR/YWQRsG0j7JXmsP3HWZA4u5eKnm
         jTGKaArvpuBstgFwwnjsc1JTlmmZS5Dq99q6IUwgrBzfPVwslSciEbNLB7ULmqCsqunR
         Ca91yWIkRzsSxwUrajtebYusEbkV2md9INymAVmmBkjZdjEL0VUSQlVO4PJKBHp98oU/
         uEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNi3a0o2vHm4dptnh09NmD/ijO/Q7rnqnyRn5xvgYFX24ObiaLSE08dSnj/YnioOFxhWN/Ssvdc3IZsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBP09FCTDCsanB8pp+UFeQlbkFXCgo8Ge7agWxn9qjZd7X7OL
	HBybgGqnicZoVKMp94KN61LJr3PQmBA6WPTli61wT2ys4wvfCKFpML1R1JtJjcDtVpEu4Pcgucz
	d6P/7WN9IuQ==
X-Google-Smtp-Source: AGHT+IH+oNNAMV2NVtWwXyNOB/xwSiYb7Vtrnxbr8iZKkclF7b16D26wDNw57BukJDxDJDBIx0CIDLYPgWdi
X-Received: from pfbde4.prod.google.com ([2002:a05:6a00:4684:b0:741:8e1a:2d09])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d85:b0:220:193b:913
 with SMTP id adf61e73a8af0-2207f33227bmr11024525637.34.1750916917233; Wed, 25
 Jun 2025 22:48:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:48:26 -0700
In-Reply-To: <20250626054826.433453-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626054826.433453-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626054826.433453-4-irogers@google.com>
Subject: [PATCH v3 3/3] tools headers: Remove unneeded ignoring of warnings in unaligned.h
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
2.50.0.727.gbf7dc18ff4-goog

