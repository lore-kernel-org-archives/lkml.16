Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98278204598
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288837; cv=none; b=l9R+ralFHgLwNoomQ/L4D3GXF5f+Ym6hsmBIJc58XDmASJKWvD8OlV2s2KE4Gbr5WVjOdqaWQFVD1uXYYTuyMtIvMPzbE3atPAkKetO8GHL9InRzreA3W/1TFTk687VsPF9o9duYaNcY7PWNz/hGoyWVZEIy+RaAoX5sJK0sSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288837; c=relaxed/simple;
	bh=Lz0eLCiYZnrrXd5YWphnkBc3OjusMpbgwmHPH62sSWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fxJRURBZBgJlAQnCa+dTgQNQwtkh8BlbnW7vOdl2Nq0jWZOGaxzC3zzXk/s020lcN31XGb0vHd+zHv+A+ecGmtFKWAjru8ZnQmweWJT6MLu7bW6BkBy1c26nrn/Jj8bPet71hOmvC8gLRT8wrQkdZd06+OF9/X4pHmeRkHfaDQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfD/TNNJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfD/TNNJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2474237b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749288834; x=1749893634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgdEJ/cU6wnqCBIWwveSAYSn7+5OkM6oE2wu1ZdN47M=;
        b=gfD/TNNJzSW4zxSqlWTa0/WTZqQIv6x81a7uCE8pCV5nWDNW577MwbKfj02Tm0ymjn
         XEd71zW6PWD5ASg5TrVNbfmo7bNQuAzWVxTJwdBYiuWltXpXZkcszNqa6TkPI5Ylk+GI
         9BnuFYH2uZV/d3xD+7J01QeivPYOjc8dclbp3Zee10GnY9DTFnxSgHGH5sGAvqw6VLFT
         5zlaU7BlIrrNKTjuUdwFyghdYEQmufhWZ5KxdwnNZcBIGRZpCIse15epjmhV5WrWHPov
         ioOHzUYejDLM9N2SL3eWPacsGk/HhLAwqws+wNCzR9cBIvi0eOCyN0R49RRWottrPIsG
         Nafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288834; x=1749893634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgdEJ/cU6wnqCBIWwveSAYSn7+5OkM6oE2wu1ZdN47M=;
        b=S/S4VXQN+Z/HD+PAA1xZb5WXSOZeQJ08bLg46khVbiAz4vZ9CT5wnxk/KH3lKi5zIg
         LSvrRTUjDpZkLBd/D23e4wXEzxwG3zWPi+JCiGHV2b4mPBJP6zkohCxu+FT4Z4U7Splb
         NX2jmBNfEyW/0D/fDvf58V5ge9+cWpuT8xP9Cy3nUDJv+RArj94q7rXkn5N2f06qfilK
         YQjgrEoyTSCV26j75Fcn6GodPpmMg/CUXgSvgy9gEUvI/7ooM5JJhbkylBP8v1sVsWCE
         GBoU3UG95g1GA2dj1kLjzUOVm+GO5Cm9k5QBCiqI25hFBG5bypgeXKGnS1+D/GmyBWRh
         ZCDA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ehRqIvcixKbdQbpQPO0O7DMK+z0hDZjtmpvIxaZbWytx8L9SQewuZKYFebtaYdiKx72R2vpY1ZdfpEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9RPJeCmhIvBJItyKlnx1mzOkPPDl8thX8S7El886MEayhykkm
	WNCZVEnwdKmBe0z5xDoknjdHr72IpDQeDAj1E5YAefd2X396vDYtF1Qs
X-Gm-Gg: ASbGncutUBG/9W26zP+iWlLpwbEStuhZ8La/guN36mEiRhn1ZeSfHE3i7S/eVww9lMF
	SSe8fscF7MH1MtVtQ89zNDKCHazRtZGvOLsg2dw+ENQxlwJurN3OjuSqD9qMVGWb7WpCPIRhpYN
	3SqDofYfZ+NgFPg5ecMUzbr9dTdIEXAk+VhF7eLi/hhNGCyAdJBBM32Lwyv9jOfS1xpSKxJXl3L
	R3rBgOZkKAi6y3HO0/TKL8Qxyd5TwIqFf+eiGHb//cAJrykPSwLg0G74AiZRnZyqnFfaYwNhHIf
	B25oW/an8YFJg68cWU0mppO8vM8a03eNJRl+fWLAw476BPL8rj5Unsf5yMPBjOKoCMS+
X-Google-Smtp-Source: AGHT+IGUIlX0BLBrtpZ0sdzWykKmUsclqHT4YHF/03/LX41TjmfuFUCagyty3GHMnITyJWpy288DzA==
X-Received: by 2002:a05:6a00:9145:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-748323fbb7bmr4918326b3a.1.1749288833628;
        Sat, 07 Jun 2025 02:33:53 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b09dsm2427850b3a.43.2025.06.07.02.33.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Jun 2025 02:33:53 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org
Cc: 21cnbao@gmail.com,
	Liam.Howlett@oracle.com,
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
Date: Sat,  7 Jun 2025 21:33:44 +1200
Message-Id: <20250607093344.15699-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <69846ab3-de03-48bc-acd7-60e8a458c263@lucifer.local>
References: <69846ab3-de03-48bc-acd7-60e8a458c263@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>
> Whoops, I should add R-b only applies with the fix-patch proposed in [0].
>
> [0]: https://lore.kernel.org/all/CAGsJ_4x1RbQ+GKKc1rrTaNA8Xd+W8K-Zu6-kwVYNKzB0OWiowQ@mail.gmail.com/
>
> Barry - Probably worth respinning a v4 to pick that up to make things
> clear, you can propagate my tag with that.

Sure. It's a small, non-functional change:

diff --git a/mm/madvise.c b/mm/madvise.c
index a94e6a7ee387..8382614b71d1 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1534,8 +1534,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
 		if (vma) {
-			error = madvise_vma_behavior(vma, &prev, start, end,
-				madv_behavior);
+			error = visit(vma, &prev, start, end, arg);
 			vma_end_read(vma);
 			return error;
 		}

>
> Cheers, Lorenzo

Thanks
Barry
