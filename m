Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0E25486B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906345; cv=none; b=k34VuRUZ/1AD1a/I+qnMvD63I9vIaqSIzwXyXIut5xCwTeu0Lk6cPGtvpQM5aphGOEIE5KI0bwZ8ez0BOoJKMgcvFND/zrrrwdybJBSWjERJyqLbJRLb94UgKd3Z2UlYYULTdMkCV5OAuW6oMotkrb85ymSNfRfa8CP2UtXdahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906345; c=relaxed/simple;
	bh=HHChYfKbM+SU9AXTrRbUPGZWH+5EKrgHjJrOlOxv6og=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jjeSV8ulAiY7sTYshsYwZhfWmJmYOBm60OttezFm7KMajrH5irtQ3D1cMNyEl73OezuIyQYM8cB++OxRv9c2upeXG+/bSWhXkM6klYbdC+ibX5UMUd3EnEAT1iXE3Hx8wWvxI4djc/IGHaySQEIvlsv62/wL8hyqoVrgWbn6bfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh1wPAd7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh1wPAd7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1319830e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906342; x=1745511142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiIA8fIy8YmbCJnZvN/tju1TgqCKi7yKEus7AdngHaA=;
        b=Vh1wPAd736inirq24jtgAnIzwoFgeRekSWnKvUF7dj2OGoguJ9y8iwVRIFkOziZRep
         f3niLLew2UjWcnnGVH2iN3UmuA0Rm6g4pHjnLr0fIvuiWaTyJQkZ/Vzwe/nYE6k0JJQC
         VKthn1R0v7DE/XE1PB4T1MVCcIYwL2u960FCdJz3kcSvPIu/+m9gMhopj9vHvF5/A4S5
         3ea1nK6kgNbr3W7hEGZRZ8NRbsTiBZSU/yysQgExa5xglU1G2VQEKmM4k80Fq2dmNHNM
         fEXmFWoNUqx2g6SoqCb9NSMH5G+PhAAR0GhhBNVC2scAMky0AzYj7n5Vfa4l8i2lTdj/
         e2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906342; x=1745511142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiIA8fIy8YmbCJnZvN/tju1TgqCKi7yKEus7AdngHaA=;
        b=MmNr6N+LR77sWwyEN0THmy0kyrZUt5dD0qMnxcfDlcxNUvas8TT+NPSeKg3WdFKSpu
         IzyLskRGQQ1MVOGbGD1bEWTcFcmB4T+4fNVkUkk0TGTQyEn1SxF4DqscgUBagIDlH8If
         n9xTrvHidiCNDWO+14aJGm3jCvipCP9VUumr3R3PUKz4Vm8/tvsmVo+LP1+qI7UUAQ7H
         GpqROv78rcEvfHOO8qmCdkKxlaabVLEm9EoKel8M/FbK9ZfBXhGCdtwA+OIn/8hhNHMz
         uOZG3Vny3fDujdTjJE2btHzWcxgQbtCkfkGxbJDJmvGzofat9whSFn7dX5Dx71KIUO0R
         oV/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNXwbOkwSqjSZoBMW76+eedUKCHP2YVfOaYgf+aeBJocqNNB+ASI0/NFAW6upvw9edU+zyD5l0EJLD/kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zAy7oCY89bmsZr9xXvfBZyIh1IDyaqTiTF7h2+jDYBEY6TJc
	2LVfT6rSWikhgfSA6BgQVH3yjjDT588s4D3JqGvQ8ZnrI/MXQkPk
X-Gm-Gg: ASbGncsXeL6e0Utxy+1XobFK6JuL9dbNL283hlYpfHSqWGShJgFeogyRdP0KTVcLLyj
	3cCHOGV1vZ2pvWwxSOqa8ml7xvRfwJghJlRQGBvXOgj/z+7SMcTjhINsPTfZD37k0ljg9VUyrFE
	FSCW+gHw9yAbxtruL3aJytD2dbjupy3j24yE7NjDGpyGGJ6QrdLNsaq4puTM4WifayMvNM02/CL
	bI5TZ2NMDGPVIy2UTebUfU5PYs82OIkl4BNnsF2dFwUiRxiaR7O7Y8jqzNg/xTKFJrbCL/RfcgA
	/iMMQcJUsRUgcTVeQtxYdCM6SAEilN6gKyks
X-Google-Smtp-Source: AGHT+IHEqcCUYv49u9TJin5pQQY9jjmHnrt6QzVErhvQ26P4aN8IZwhobOglByroR8+wQnj41vZmsQ==
X-Received: by 2002:a05:6512:a87:b0:545:ee3:f3be with SMTP id 2adb3069b0e04-54d64a7b390mr2599564e87.10.1744906341619;
        Thu, 17 Apr 2025 09:12:21 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6df60cf6sm2882e87.66.2025.04.17.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:12:21 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 4/4] vmalloc: Align nr_vmalloc_pages and vmap_lazy_nr
Date: Thu, 17 Apr 2025 18:12:16 +0200
Message-Id: <20250417161216.88318-4-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417161216.88318-1-urezki@gmail.com>
References: <20250417161216.88318-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently both atomics share one cache-line:

<snip>
...
ffffffff83eab400 b vmap_lazy_nr
ffffffff83eab408 b nr_vmalloc_pages
...
<snip>

those are global variables and they are only 8 bytes apart.
Since they are modified by different threads this causes a
false sharing. This can lead to a performance drop due to
unnecessary cache invalidations.

After this patch it is aligned to a cache line boundary:

<snip>
...
ffffffff8260a600 d vmap_lazy_nr
ffffffff8260a640 d nr_vmalloc_pages
...
<snip>

Cc: Mateusz Guzik <mjguzik@gmail.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 77da4613f07ff..54f60d62051da 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1008,7 +1008,8 @@ static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
 static void drain_vmap_area_work(struct work_struct *work);
 static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
 
-static atomic_long_t nr_vmalloc_pages;
+static __cacheline_aligned_in_smp atomic_long_t nr_vmalloc_pages;
+static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
 
 unsigned long vmalloc_nr_pages(void)
 {
@@ -2117,8 +2118,6 @@ static unsigned long lazy_max_pages(void)
 	return log * (32UL * 1024 * 1024 / PAGE_SIZE);
 }
 
-static atomic_long_t vmap_lazy_nr = ATOMIC_LONG_INIT(0);
-
 /*
  * Serialize vmap purging.  There is no actual critical section protected
  * by this lock, but we want to avoid concurrent calls for performance
-- 
2.39.5

