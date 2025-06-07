Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4C1FCF41
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749292223; cv=none; b=U/3xRRhucSLvUEpbVuJNY1eybniCibBB3/0rdHufZDowVvqjEA0gi1m7mFsRINM0hpmXpl7LyQidOyhlHpQ+5LbdiSvau5ScwX7TldfrZuUrHuTD69hzOQtESCNMXycR0dnjAG3Owi8j2HHA07rCZootZfKeo4b6UxfmFRnUrWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749292223; c=relaxed/simple;
	bh=G1+BNuLhcw1t1MyHcjWB9Vz3MPiKC7HoYO80D7cnruY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0AIG+Gog44YyVfWV36YuCFe0b0CSGX8AsS99/9SvGdnVfyfx/RD47gH5U5twHGsPMRee9wwI7yAKStEF1/SFsikX4B/IrZ7KGJ1JUV588gP4fXz9PMYpbaO5jh46k0v7m16GMhZwgbfHgI5oSSNvyB9Wr8E1nOgcrAcWGdHluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2ZryTDw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2ZryTDw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2359191b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749292221; x=1749897021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE7X6x8OHAkTg697FSnh0gpU0EcjCgRFSk8bs9ZLu1g=;
        b=M2ZryTDwd6zNyt96vTd3lJRZOpOfQNTWt2CjuUILJE4jb7G1UVAiUFV8K/lMQRZIrG
         wQjeyFD1fKlyBX+A4yGc67yyFjoC2e8TAlCQhw/GQGeyAUPIiYzSp1gxCdbuP0p5bQdZ
         tBdfPa79/lzWZFIeXzs3EsgRcuA9+YDkc+Dic7nC6C6uFJIrFviqNkWymKdc4KP7APUR
         k/jUMqjAeFeN0fHFhDhVlv1bgF5dUxLstfXtUkWf1qDFDK/dqxkBZOWG+UBLWzDu5XSe
         mWFPj7RhTrA5aDCa4LisAtyM/xlIjimJZD4K4r7GIaWGcJiAf//gaFlfFwtK0Ur8rCj7
         AdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749292221; x=1749897021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE7X6x8OHAkTg697FSnh0gpU0EcjCgRFSk8bs9ZLu1g=;
        b=BBIl6iXJkILt8tN2EjGoILhBWZ4zBWOLyy/IEnq9SqxmbZnyjRntdf14asMCqMi27g
         6BaDGgZ5b8yWW/1KZtrD2tKV/YP5hQkouIu4WoxLLJRoIHpmCWvx2UUo3et4Nk3k4sa5
         PtsuQp6+7LjADbXCPNexMv+q52s5/9OkG4KbvrBJ3sfyWLohdzNnZ/IHK9SoeA1Yngky
         sjacXfMS0KEmctnfid8RTyuh2xYoOa54JcJTBl4M3QnNsxUKp1LCN3KVTgPj/SxRFatF
         RiHxIvz3FFwZlVjtmr4OhZo9uiiYNPdW2nc2xSyUvjBboqJZMyKThTFJtXojB+gFhnFF
         S8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMCzc3J5UICsbsHJMGma1KYsQ3v5LMz5Ci24qZeFcKasN67y1YKF9VGHi8o91dphUBGKm87DoKCfS/F6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9AHSuwvAel2Bv/Vss6/BqH68KIN85Ny9NXuTzzbrQN53ZDuvT
	e6uCZcG5ifTgkiUETypRl+AUI1frz5jmT8jQDuKQqql71WQytJqpEl4YDSYBpQ==
X-Gm-Gg: ASbGncvfvaxZXbCoaxUgAp2EU4SC2QXMFE1UG52HlrtLp0E//Uw8hGqsV963qvYu2a4
	5e9EPBbpvC5dU8fVhLbVne/B9zFpEuIulpFJ/UTX4FOdchdfb8z/jaRXrHTQXJYv/9Eb4BnvLJ6
	gbQ2bKYcH4kyDtnVG7OwxhCWZktADdEhSvet6cq7stHupXJ4Bp2CibuSRlA4njVUSe1WMLjgF27
	k811c8sZqUELGyGuGV0pfdBL9xACGZBpl6Nn5rKHWtft1jC3cVtnRJZWY9JNY2ibMcmOA0PXUbL
	l4P0rySxl7ZlU/wFuxaJjZuf/MXYcON1zPjvK3193KyjCs9KS/FG/poo96S4xcp7fLel
X-Google-Smtp-Source: AGHT+IHS4E582z/SnH7fI8JfMS6qlHo/a7BVD3y+bqEg+XzD7UN+PrUslIyVIHHn5dbKrBsLZbhzVw==
X-Received: by 2002:a05:6a00:9a4:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-74827e7ea01mr8869585b3a.6.1749292221553;
        Sat, 07 Jun 2025 03:30:21 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0836bdsm2598807b3a.93.2025.06.07.03.30.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Jun 2025 03:30:21 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lorenzo.stoakes@oracle.com
Cc: 21cnbao@gmail.com,
	Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	jannh@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lokeshgidra@google.com,
	surenb@google.com,
	v-songbaohua@oppo.com,
	vbabka@suse.cz,
	zhengqi.arch@bytedance.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Date: Sat,  7 Jun 2025 22:30:12 +1200
Message-Id: <20250607103012.25332-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <5fc1de4d-7c2d-4f5f-9fb2-65bef5b6931b@lucifer.local>
References: <5fc1de4d-7c2d-4f5f-9fb2-65bef5b6931b@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Sort of a nice-to-have/thought but:
>
> Actually, when I proposed the refactor I wondered whether we'd use more state in
> madv_behaviour here but turns out we don't so we may as well just switch back to
> using int behavior here?
>
> If we do that then we can adjust process_madvise_remote_valid() with:
>
>  static bool process_madvise_remote_valid(int behavior)
>  {
> +       /* Due to lack of address untag atomicity, we need mmap lock. */
> +       VM_WARN_ON_ONCE(madvise_lock(behavior) != MADVISE_VMA_READ_LOCK);


process_madvise_remote_valid() is called before vector_madvise(), so I'm not
sure what this code is supposed to do. Are you trying to do something like:

VM_WARN_ON_ONCE(get_lock_mode(behavior) == MADVISE_VMA_READ_LOCK);

If so, that seems problematic — the same madvise operation might be allowed
to use the per-VMA lock for local processes, but disallowed for remote ones.

I suppose this will only start to make sense after we support per-VMA locking
for remote madvise operations such as "case MADV_XXX":

diff --git a/mm/madvise.c b/mm/madvise.c
index 8382614b71d1..9815445284d5 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1641,7 +1641,8 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
  * take mmap_lock for writing. Others, which simply traverse vmas, need
  * to only take it for reading.
  */
-static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
+static enum madvise_lock_mode get_lock_mode(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
 {
 	int behavior = madv_behavior->behavior;
 
@@ -1659,6 +1660,9 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 	case MADV_COLLAPSE:
 	case MADV_GUARD_INSTALL:
 	case MADV_GUARD_REMOVE:
		...
+ 	case MADV_XXX:
+		return current->mm == mm ? MADVISE_VMA_READ_LOCK :
+				MADVISE_MMAP_READ_LOCK;
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:

Thanks
Barry
