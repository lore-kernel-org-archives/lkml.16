Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3F270554
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406648; cv=none; b=cgp77/bw07lqhOSez0g6CYXaYpnb0eJ5Om4ZZcyK7zi3gdmLmA2AWDXhGgco1FAUjByffMnPlWA+ZglMQQzwvruAbETsYf9caZBo6vdcZGfNu33icycFtttzUVWdHlodcplNVud9LqG5p9uJiRutA52XJKsfAu8HHOadxG9hPxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406648; c=relaxed/simple;
	bh=u0f2l6Sgc6ajr8A522K1IeJj184b1wFLWBt52U7tYs8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TqEbp5dl+OGFZFKZYI4Ph0wUvNy+Jk4gp1qNvBF+uzEwfnJIKy8HoWuuzOhEazr5I7fpSBk2K0wtHPRWKMXu4hsG+JBcWRH2rIIOxyMG8PFLEWNAE69TsoQiRcpwHFlLLaXsq8ImGZaseqpFx36Bmgg+N/BWUePBpdHX5ih/4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3MUXyly; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3MUXyly"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so35181895e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406645; x=1746011445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCme20QBKZuSQy8pgc1gzzDJPWd9mPYUrzaCqfMmcr0=;
        b=Q3MUXylyzvepPv8zTV7+MiD7AeaL/eOa8vLKZnOOQnA3pgMQ4dGi8Zd+9ElA9xn1bS
         ehuYeN+02aQvAait5rM4GDdFYaRX2Ke80yHjx4dREMqrM2yG8BmIa+Z+tb4wiYhJewRy
         fTSwJxkH9iSdNVKq2t8CUK6HhxmP+hu95KEQQ9wSKvc973SO3fV99WwSiEf6d3lTzOXB
         5rsByDtPywZTyzQulflfrov8ApuGp42YIAusdi/vcyPPDOtX/w6m8mFWUl/ean1jEoim
         c/yMsHmLIyIMP4g6KzycbtWb4GxwkKbjSy8TI1N23gBEqwq2OK5J2NSnq7Wy49/vzCFf
         oqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406645; x=1746011445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCme20QBKZuSQy8pgc1gzzDJPWd9mPYUrzaCqfMmcr0=;
        b=UPjqHKntiUX/lf8un01qs6EQbJ6gIfX+qevd92tm/O1n084QbMeAUwY4imwtmjNf+6
         LrV/uf9oiQFBcsu6afaml/W89tJuEledtdtukQGpWcgNF0sc1ywiW7OfsbmBwWcwxllC
         pnN2f8/Y2YAbtBz/RhaChHtq06LeOmvZ8wgJ8NJGYIpQoj9lrXUpYbRg2qjeGSPfYlgJ
         NixESWfJ77sNxJ6VJ1+BL10Q8bDlimROSEjMT9A6PIlvGsb+e90V2yPC1iRrGiEVqpkS
         Q03ikESUhT8Znq74ivxGq4LPl03yK1YyJVo7heTM7HFvbeCddES5uQfdBoG35yz7liPn
         Ahrw==
X-Gm-Message-State: AOJu0YyVJ7flYEzlHVEnocVZSBtgrJGQZDajuE29bm+iyyJJn2kLUWVv
	p1iOzjrNky2KaWruatYRm2UFzP6ClfwC14sIo9tex73PY4Ot1jl7D+cdyhhCqOF+86DCxaz8sof
	Zb4TA2hsVprcrvN+hpxuaIjWGKaELXUMhvwybGwjJ6WNegNZ6e9LN2sbci5rJxzai+wixqykZsg
	j5C08Wn3y2960cWDk10FplcWif9z7Srw==
X-Google-Smtp-Source: AGHT+IHcQY60Zeww9QiepiBanJhLNQ5YUihXLEvz3bqieg4UPklywAa1Mu+h99IYAsADseRnSIVHVtAh
X-Received: from wmhu7.prod.google.com ([2002:a05:600c:a367:b0:440:5e10:a596])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c2a:b0:43c:fb36:d296
 with SMTP id 5b1f17b1804b1-4406ac0a9c8mr152311415e9.25.1745406645254; Wed, 23
 Apr 2025 04:10:45 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:54 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=ardb@kernel.org;
 h=from:subject; bh=gr1xEJNEV0/G705MfiH6XFvAxAGrVlSXWj5oMivvbko=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1MSYzaq8bAvjXRmYvxjVT/56yl2u9Jbwh5sbjtelH
 M5ZmGbRUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYit4SR4eOBbQznXtnqriye
 sCdmakdI+3OF8H1Zd3JOPtv/+vxLZieG/wn6OxJbCuUOKBgGpHuzWTd6NjRJWC7aIdqRwv/oSGM WAwA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-18-ardb+git@google.com>
Subject: [RFC PATCH PoC 05/11] HACK: provide __pti_set_user_pgtbl() to startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The SME startup code may call out to pti_set_user_pgtbl(), which is not
part of the code corpus that is explicitly built to tolerate execution
from the 1:1 mapping of memory.

Hack around this for now by providing an alternative that just returns
the pgd.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/sme.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index 5738b31c8e60..d55b24cd4d08 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -564,3 +564,8 @@ void __head sme_enable(struct boot_params *bp)
 	cc_vendor	= CC_VENDOR_AMD;
 	cc_set_mask(me_mask);
 }
+
+pgd_t __pti_set_user_pgtbl(pgd_t *pgdp, pgd_t pgd)
+{
+	return pgd;
+}
-- 
2.49.0.805.g082f7c87e0-goog

