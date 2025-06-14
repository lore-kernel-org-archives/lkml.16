Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415C5383
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749902724; cv=none; b=qVeylfIOIUfTV/0IGrbYfs69IEuT1YDbmj1a8A2+o0g3A7DRzQI2PXNa4MPmSHETAlU8fH0yU7QcG8y240zk80Ngwok/4Hsqw8hNPOTjExopUjJUBBfXZ3lGtAI6qhhdgMr3LNAq6SVaD6bMsv6hqlYDHzjZRYCKVOQWTOFbOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749902724; c=relaxed/simple;
	bh=YqOoniabNqcyQGbQ+aioryj1nRZYbeZSWfkOS2zGQ84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7LPJdqeaZvBitplMXbdGfZ8FG84tDGlTvc4p1TC/Pjq1bZ4M7wd9B/bN9MtHCkbrjyt1mjMvzxDeb4Oa5vVflJ52mwTznmnS1Z1VhOmVHZSGoc7Fft7FyD/qjPaT7Br7O+BAxUUerj58WlPUdno56PpgqLE0tmL4EEY3BSVWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFhKsDix; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFhKsDix"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so4718126a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749902721; x=1750507521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8jCAI016si+sNLunRw7yczi7UUKiPBKVVV4cCEp0Qk=;
        b=gFhKsDix7+P9750hUmaTCO2qbB1y0uaOgUsY2didkjiwAlrqCvM5/3MIkY3EhBM+jr
         H2A7Ch43YYAY3rZoNM5spnXtEc3T+BKhl0MmLcSY6mvT5Uf5imh0gCoF4qD0IsszQiWw
         d5wafjt3AG4pqk1YEeWbC/XX3ZkzZgFUegzrQQGPoJ5N6N0x4U/plzKRNyu3ehPZchIe
         X6loShJHHDuKwPM6BMIzcjfjisMvV7alZ81Mw5GOZAkAwilgPExgUDxLJQKyxIY4yMdg
         tMhmKpDFnFSKl+3QQcx2xNsuTSEBDateKvHhHq01jMczOojvtQJhQ86HFsfqtLlE4tfn
         supg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749902721; x=1750507521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8jCAI016si+sNLunRw7yczi7UUKiPBKVVV4cCEp0Qk=;
        b=etwDjuTn5zPizVwk8phdddICBaHk9OCr8LE5mA1sVPLPNdcFpfwByQBR1Fx4gy389l
         gmtqBoOM35YoUfLjHXmcgcD8YeWcI1Ib14861IZuYPElrnKqTzyNGuvg7v7zgq8GOsC6
         t8NYhBNwqu2y4xUht/oDVKlnik2DhsswSDVISGWfGhIV2NmV6W4Yw/CG28GVhLWwYo/c
         ttfqDGpI9BsRGvZ/hShg8kBWyddlqlQFQ3yx7jm+cunMxbbKi2WPAA/1mCZbxctSjSsM
         a4iuMfGeNHGTAjXpOZf2iCrLz/VymuBouIXnrLSmuIK3PKNZ9k/zVP5yDRM5O6wMeHls
         jkvw==
X-Gm-Message-State: AOJu0Yz1kF8tOncaGw4lE6sed2Un6ZaK401oRi63vr8QiP2lGh+X75+n
	GtGJVR/qzTtpRaGwCxJvRsUv6PyQogDdMsEZtPw5xH6zc0grxLTdy/bN
X-Gm-Gg: ASbGncs9akBv05ac+svO8+88zSUbBBpmbwCHyrGg/fj70RUmPkAimPdMcZkCCZI5FFX
	+wn4aEs6kWhJavKxviH7uewR7cJUGvdO3IHDMHIiMsIaE3cBwga9tugF2zg/JItGzZk17BHhK/d
	G0FCUamG0IdpltnofnPuzbALc5JSLLjUJL6iv5zuwvPrBjVnuHx6dk9PM5zkKvSVSfwq5jH1pNC
	CoGSNUpjYNSz9UVAnXzNeEnx60QkieTncoSLsylfe0SMep0cShsj+KPqMwP19qZXo8nJzStRvmf
	FB36Vk4P7W+npWrPZSoiJK/0D4rWKQUZIF8413MFsy35EomE1CtymtLoHRnK1DYCcL8n0asFZ0r
	e5g==
X-Google-Smtp-Source: AGHT+IEuqnkrHQxgsj4VJPFtn78InDUjAN6lGK/HtRTpYEO3Gg9J9WgutotECSobmR75VhLk9JEPlA==
X-Received: by 2002:a17:907:6eac:b0:ad2:4785:c4ac with SMTP id a640c23a62f3a-adfad44a0a6mr229175566b.40.1749902721257;
        Sat, 14 Jun 2025 05:05:21 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf60967c9csm184899866b.33.2025.06.14.05.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 05:05:21 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] include/linux: Fix outdated comment on entry-common.h
Date: Sat, 14 Jun 2025 12:04:21 +0000
Message-ID: <20250614120439.3336-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87frg2q1w7.ffs@tglx>
References: <87frg2q1w7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> That's redundant as syscall_enter_audit() checks for a valid audit
> context already. Both are valid indicators and go in lockstep. So it
> might be arguable that evaluating the work bit is cheaper than the
> context check, but I doubt it's measurable.

This will also increase readability and make things more consistent. So i think 
we should use  SYSCALL_WORK_SYSCALL_AUDIT bit to check if we need to do auditing,
instead of checking audit context, on both entry and exit.

So should i do with another patch, what i am verifying is if we really agree with one point.

Thanks
Khalid Ali
