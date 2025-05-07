Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9528C2B5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633625; cv=none; b=OyzTD6p4VDEIihQcCFIwsU2Pwi9FHSuSW6z+8+R/1RYJnMIi4yR8bFlHWB/HVe/jX/Gk1F5LRJ/ljWJbAWPjW6FTA9jo2dOXdxaGwYJhtUQFnQGhnfNTmdFiXpKVoUUpfUCev2zDU5uV9ktf/xc7kNMPVzhpL3Fm8KoJ0a9oBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633625; c=relaxed/simple;
	bh=Y/mhuvCecsqejneEVrknKH6BBV5XgR0N2ByP0o2/GPQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TpeB4qY4sntHdHNj5dCfeaSKYe11Z4tiF5rbA/ckR9GU7I2afzT7ZYtAKGHYq2vUS/56hBo9vlGzAEuFScDurZgoramSVHJ7eAtP+aKTNgnMahzhN9dysgehrL49c2TSzhdEbSCSUCjryn84fkSYh1YLEOsu9oyA9GOlOt/h8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O3sqzBOA; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O3sqzBOA"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5fc1796ff88so179846a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633622; x=1747238422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPR0SEzdksw+QARijEF+8H2O/syRn+ur/NtvRkf+UuQ=;
        b=O3sqzBOARPSIlKdDnD1yO1gTi1txMLW9rMSpyfV6cvTKNltbKzcke0KC5xx8Nbn9VI
         2m2glr01VM8oBQdjqm5ccZfjxKfHCuv+BIGRkYjfP1lCq8cJtdEpX9trnPMyCiKhJY8P
         1hzg7mJPN9sRO8+MdSjypy1M+YrJ8t0UxnWhvdCjTcbRrOG3INSIZUYt29YcrwyHDYy9
         n4wDxnFh24Eh9f6w+6wFcH1de2Nl+msZyhkO8nrVTvkclebfOwr/stDkQpL5TdfYCcqY
         LPFPPEoduk+CrR1iIrO22C5nwFjBzI/sDS3Nh14Yo0OoQ0pJjq+PsGuz5N+iUl6OmSRv
         90Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633622; x=1747238422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPR0SEzdksw+QARijEF+8H2O/syRn+ur/NtvRkf+UuQ=;
        b=nJdAuYBG1LRX2Ue0J7eVsZ0lSFTE4N8FJVh+2x2Lkg261zLRsR2HGBeNr1A8zSqQ+T
         S6odhss5Ttpw/h6LK0qCK7Ma6O0jv7DJW6RdY6bVjTtQYhE2dHZLNBuyRLxAxOhHHSSy
         NgMTQpgwetKoohy9xBwKM9ortfFvv7ydIV/7pKaGuM3kv4yFU55mwpA6oadyjNrieZ0N
         vmgNlvYVvULrWheOJW0ICcJPh1Zykt3VmwnJGXufo0itrfykTj3ELMDKi/1zYYEAvnEV
         F/hYA6KccUuVo8ZZ17UzPILscCD9czV03kHJx3XAelePUIr8i4ePo2Pn7emFuhxvT0JE
         y8eA==
X-Forwarded-Encrypted: i=1; AJvYcCXGeENlHcsowUIQMmhqx+uIJl1IAIto5a8fcU7lSyUjmHAkXsKOxi2DqalKuVEKWGXqKx7bjxDadUz9QuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8tPykzzSwz+17JE81u1sYIogzk3CHh3e+Qmi9lXKTkuhaX/J
	LZHEdXUfomMdt9G3+FjPq7nhD4MJVU0/4u++0jLOsrha0hID5aTTGaB6Idgqa6zuVJH0xw8X85l
	rLg==
X-Google-Smtp-Source: AGHT+IHQX+IUbHAPL3YWJZE1CLzx6Dp5YQzDNePen25Z4MCL94G3lLRUxhaPC0VmdhzxfcSUsNM6e/GkHJk=
X-Received: from ejda5.prod.google.com ([2002:a17:906:2745:b0:ad1:83e8:4210])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7fa8:b0:ad1:e587:9387
 with SMTP id a640c23a62f3a-ad1e8c50524mr400870066b.21.1746633621858; Wed, 07
 May 2025 09:00:21 -0700 (PDT)
Date: Wed,  7 May 2025 18:00:10 +0200
In-Reply-To: <20250507160012.3311104-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507160012.3311104-3-glider@google.com>
Subject: [PATCH 3/5] kmsan: drop the declaration of kmsan_save_stack()
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: elver@google.com, dvyukov@google.com, bvanassche@acm.org, 
	kent.overstreet@linux.dev, iii@linux.ibm.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

This function is not defined anywhere.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 mm/kmsan/kmsan.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/kmsan/kmsan.h b/mm/kmsan/kmsan.h
index 29555a8bc3153..bc3d1810f352c 100644
--- a/mm/kmsan/kmsan.h
+++ b/mm/kmsan/kmsan.h
@@ -121,7 +121,6 @@ static __always_inline void kmsan_leave_runtime(void)
 	KMSAN_WARN_ON(--ctx->kmsan_in_runtime);
 }
 
-depot_stack_handle_t kmsan_save_stack(void);
 depot_stack_handle_t kmsan_save_stack_with_flags(gfp_t flags,
 						 unsigned int extra_bits);
 
-- 
2.49.0.967.g6a0df3ecc3-goog

