Received: from mail-oi1-f228.google.com (mail-oi1-f228.google.com [209.85.167.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528926B2D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654596; cv=none; b=E/PamuUayQMZ3n9KJAhoKEyt+C/ITir579/5qFDgIqzQdfzEbGpVkONa6Wo4ozY7EZN95Zay6ep37Day1r0icZNBuBYYi6JNFWbTNvJNpiPhz0sgyHmJgzDGBp/RbkkxYurT3BY5yJuGo1F2sNLnD6Z88+UGcQDtx6e+7OmAQgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654596; c=relaxed/simple;
	bh=f/xTZ8BJxeNBMZ86V1uElFpd5cDr7++FrMMuSPkUyhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5+THED0aQgbT5oTSDmnAHJoTxNhLueZwoIAPClqqreBRl2VUi5uoVyr8G8GUR6QP419ncFwYJJQTnCtuv5pNYAntTS1it6DudjGZJmOFzqAJEUsvD/hxPiBKqID+xiF/+U2mvlh1B6rq8v/yxNLIPCPp+XyB5daFQriZMlW0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WYILmm/u; arc=none smtp.client-ip=209.85.167.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WYILmm/u"
Received: by mail-oi1-f228.google.com with SMTP id 5614622812f47-3f94b7bd964so352356b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746654590; x=1747259390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtOqL5v5hGaLj2nSYEbTs7MVaDma8jT2Iux9zNB98wA=;
        b=WYILmm/ulrWDuvRg7mGH0sDMJTqwudXYEx7iA38slj1nHr3LROdGYf9Cu7pXyuD2HH
         KRTx65WwbA0ExJBK+ADGs50so2g0A37+cLpB0kC09+3CC9MymgwmaWP7OO0IKmL4f0sT
         X9pn33qGlpaFIeIab8tSeUfEmYgCc1ahsqCT9RprPqhJQKprOsleCDS6Hm8aBMQ1QwhI
         FGXlKlKxPdLQ06Aun+fkUAzKCOFwaOkD/qTHz1Y5EVojVa0pkd710gGebYLxU+aTxb0r
         eiwQb6yeHrytusErUsXoRKs5iS4rx2zVsmWTsjMpsNzJI/awq/GByTekAYUiByGhbf3L
         EnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746654590; x=1747259390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtOqL5v5hGaLj2nSYEbTs7MVaDma8jT2Iux9zNB98wA=;
        b=Ng2EqNPzzDqAlasQ7jHtxb/dx+m1eA4MrqIwwwEfJdJy3txlkeMhBBcUYFAF0g+the
         2iqoMsWQ/ylSSUDkBgxYJgma5i3m87Z8XJNkHzQAvyW9Coe8vSK/FNL+G+LK/4zro36r
         5+bNlP+pnPOGwbLy2j1EdFg+Ujr5XA5N0/hfGMK5VB3Bu9EacGYkQS7ZcdwH7dxenXXd
         XkKM1X0eKME1TON0Yqhb2V8g+Yz1Bg8IIvmP5VMFalxUI9vor8BRSTjhOehm2/EWjuyv
         Jl7p+JMeTOtSMPEEMaOjkaSofP4eyvYl/ztEoTp5cCS144/xHFwwsz5p8DguxwJJyptY
         gvkg==
X-Forwarded-Encrypted: i=1; AJvYcCUlADCxgvGxGsiaDhC08FdL3ZeqFlmQYYwm40kMsN1x4p+OYn91ZSDX3roS5Z+zUk4VckotZE6difg5yf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkplqef5FVfZvnWoFtsjxg66KMUZc3xgr57P5sqc/ox2SxhV5
	4e/AuefSAtVHjRhF1XX+6JpYQFIHPaB4szmNYkG3T2DmqgcZUx9s0/bE7InKu2JU/fxHGd62e2d
	ioPvk1ecr4nrfvEmxYOqtOWGhhJfrC7qOPZZp6qgnV49ST335
X-Gm-Gg: ASbGnct9tzcVvx8HDKwXXg8YQwtR+HYeo4EW9N6fXtu2LyqBgHHq5oqyxW07KdUGrGU
	oMMJUCNMoR1IVQ/KMhwU2G8EjnELAKr9rRTP8xfu7Lq70TaMSY2UIMjVtEyonikPZDHQ+UKp1uN
	tQ2z7CEP2vPPO683vPp7nq8y/pVOwzHXWC7n1NOK5yun802uDB4xHD52DDB8ibKlCSpYbq9wgNa
	x+qxCcnLpjviYeTq14Tm65OeM4oVVd2u2g5nRZFldtRbSwLT/LCSA6Y+dLjh0sgVVKEzZoTAinn
	q17ipHq3FHSAf8j6P08YyK5uWU+aV0E=
X-Google-Smtp-Source: AGHT+IGMnFiY0xyQc6c4BYgqiuOS8Lq+bjP0JIRCUEyTMPXHCZjKDaIlzWCuY20vgwE60gGjQrKqLLEmav5O
X-Received: by 2002:a05:6870:8901:b0:2c2:561c:47e3 with SMTP id 586e51a60fabf-2db814c514cmr694916fac.21.1746654589745;
        Wed, 07 May 2025 14:49:49 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2db5cd9e153sm144323fac.23.2025.05.07.14.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:49:49 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 444503406B0;
	Wed,  7 May 2025 15:49:49 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 38F63E413C6; Wed,  7 May 2025 15:49:49 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 07 May 2025 15:49:36 -0600
Subject: [PATCH v6 2/8] sbitmap: fix off-by-one when wrapping hint
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
References: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
In-Reply-To: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

In update_alloc_hint_after_get, we wrap the new hint back to 0 one bit
too early. This breaks round robin tag allocation (BLK_MQ_F_TAG_RR) -
some tags get skipped, so we don't get round robin tags even in the
simple case of single-threaded load on a single hctx. Fix the off-by-one
in the wrapping condition so that round robin tag allocation works
properly.

The same pattern occurs in __sbitmap_get_word, so fix it there too.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 lib/sbitmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbitmap.c b/lib/sbitmap.c
index d3412984170c03dc6600bbe53f130404b765ac5a..aa1cec78b9649f1f3e8ef2d617dd7ee724391a8c 100644
--- a/lib/sbitmap.c
+++ b/lib/sbitmap.c
@@ -51,7 +51,7 @@ static inline void update_alloc_hint_after_get(struct sbitmap *sb,
 	} else if (nr == hint || unlikely(sb->round_robin)) {
 		/* Only update the hint if we used it. */
 		hint = nr + 1;
-		if (hint >= depth - 1)
+		if (hint >= depth)
 			hint = 0;
 		this_cpu_write(*sb->alloc_hint, hint);
 	}
@@ -182,7 +182,7 @@ static int __sbitmap_get_word(unsigned long *word, unsigned long depth,
 			break;
 
 		hint = nr + 1;
-		if (hint >= depth - 1)
+		if (hint >= depth)
 			hint = 0;
 	}
 

-- 
2.34.1

