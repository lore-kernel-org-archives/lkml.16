Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968D28C01A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633627; cv=none; b=RfoRebuQucdnUxoSLOJXYSnHmbYYK1QTwHul0lo4yBr0opX5kfIe6YkfnoaGXyUewbob93MQL+a73jVzhstGCPH44Bq49Dwpi6QdnTyRV18/WE9o+f3iMhBlbHIeqxKJEFHbCJ1SlMD9zQadqGCfVOsZTjdm3BlCN1Bo1/e4pzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633627; c=relaxed/simple;
	bh=ZirRFWqbfC7llLAh79dS/ySeAIeVdC2IlNT2+zUkFJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rMUIm/5tte9AAmNLXWhHFETkKq8ewHPEKlbb7lloAL1iky53504GG5hg1GBGJJFOmOLFXmKwUw3VP/llun7y2xEV6bUhb/pmbb9XjBNwSph5ezh5CTvSw0V3/Ea2tQdd2GY6Kn+JUEWJd1B/gSnZRcTYNPdVGbJ6JgRRzpMIk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5Jk1dMK; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5Jk1dMK"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5fbf91153c5so827343a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633624; x=1747238424; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HD+2FNI5wfvoRdutnU1OJmD0qGDP/bCL3lQrffpAd0=;
        b=P5Jk1dMKURh2EZ5RoDfpivJz0GQO1qn1yqpvpieKebNJ8/yOT1+g+NSHxpB8X83hBW
         Dph9fxWoPGahL9NdwhirOG0kU+DYJNAkJKZEB2HdBEBoEkEDv164zoo4qF+u072zK/FP
         BvaqPKN4n3wg+puL4YIEHlRz0UhsdscOvTiP6AP550Up5UBESahWbvQbMzaZEE+LA5Y5
         ZUxd0AdXPDdi/HKKvAMDBrT1S7r+LPRACrXHqFMsI8Qf5HeGlTPEBLyyC9ZDwT3ZKNtS
         XWistZVh6yiF5I8MejtMCDv65BzraCmF0ejve4t5i29l5Ml+HiG6DviacZRrLnSqwU1Y
         gEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633624; x=1747238424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HD+2FNI5wfvoRdutnU1OJmD0qGDP/bCL3lQrffpAd0=;
        b=UqWh2LrHNSmqCkOaMmg/Upe3NMNOgl/IJAAc6omyOP2DYc0ICI+5u4imOkBcHd2RmA
         aipKvKjZHIE3XaOP6iyFuOclCPZHavfjfxVq2MDoDqGqnQcjBRP9Tnx55U8AZUyNycyX
         t9yH2LomYn1KBREqgA8zAOi/eqekBlZDaYIB7B5Ed496u7hAr7fOJq8WxFFjAaAXKTxl
         AFbRT5DBkZSXTZ8jNmO1c9Vvm9cCxOiyuCmyCbXZifIW7CchpbL4ibbgVbbZ8ETT1eOe
         yCmtRjk6IcViK1+h1lmpHjO1e+VdfxwG2oK9KBmDd0uZuSI5i6emhONoSOqnflopnp0q
         K1JA==
X-Forwarded-Encrypted: i=1; AJvYcCUUCd4a/2+iY5c3Mhf/VImvNPjQoFkAx/AXx0OGwxlbvAnkicwwB9JNFZiOWbE6rNjQqwUK1BYPMnit/sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpbD5DFI5cmnDXiapAFBJ/5opVwzyfIz7r1Qj+rd+DNFnfLARV
	73ycVoqwNR7Lr8/zpzX0Dh/V+oM6W/xbCBbVDCv7RiiIHQoC9RF8jhB8e7apgCaHl6LIO++DA1v
	oEA==
X-Google-Smtp-Source: AGHT+IGi3302wjsXgRUTwe7QHWU0vidGzxHKIW7/ZCRHRJvwoV5ASRVkUgDbHdZXSQWb2ESuUs74/5eBRk4=
X-Received: from edbig14.prod.google.com ([2002:a05:6402:458e:b0:5fb:c088:893a])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:51cb:b0:5fb:a146:8600
 with SMTP id 4fb4d7f45d1cf-5fbe9f46c17mr3577975a12.25.1746633624482; Wed, 07
 May 2025 09:00:24 -0700 (PDT)
Date: Wed,  7 May 2025 18:00:11 +0200
In-Reply-To: <20250507160012.3311104-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507160012.3311104-4-glider@google.com>
Subject: [PATCH 4/5] kmsan: enter the runtime around kmsan_internal_memmove_metadata()
 call
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: elver@google.com, dvyukov@google.com, bvanassche@acm.org, 
	kent.overstreet@linux.dev, iii@linux.ibm.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

kmsan_internal_memmove_metadata() transitively calls stack_depot_save()
(via kmsan_internal_chain_origin() and kmsan_save_stack_with_flags()),
which may allocate memory. Guard it with kmsan_enter_runtime() and
kmsan_leave_runtime() to avoid recursion.

This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=y

Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 mm/kmsan/hooks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 05f2faa540545..97de3d6194f07 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -275,8 +275,10 @@ void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
 		 * Don't check anything, just copy the shadow of the copied
 		 * bytes.
 		 */
+		kmsan_enter_runtime();
 		kmsan_internal_memmove_metadata((void *)to, (void *)from,
 						to_copy - left);
+		kmsan_leave_runtime();
 	}
 	user_access_restore(ua_flags);
 }
-- 
2.49.0.967.g6a0df3ecc3-goog

