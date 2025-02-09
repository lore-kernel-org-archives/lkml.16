Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422B1F95E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739123241; cv=none; b=K5PP6rlRC7G1KDMeH6BVCmzoQLYUcVp7MA6NOnthc8HgdX2XtXPJRIX+yf7u7lJRAHyKYxbScKcftjJnQ2yS8D23yO9o1xcS0tIfw4jL8LgeAOS5/fMBDpH3wODLEud8/cZgzhnZ0OHYKvSxz6JhuQmR+E8IemN3euH3I28XZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739123241; c=relaxed/simple;
	bh=dYJfMJUhomziUknI7Jl1/Y82RwuNylLa0U5z6lah1qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZIZq+YHq4Vu0aeqiVawaSGktnceHPQWG9uggDd2pHBsdEF5Er3+vHjSRZY5ewEaLIDqyYA1v7BtjSwI4aCqNR2auQA7+WWE0jXwyD5JS8Sf0c7JEng/CNDBUaAyw7+n1/GavyUUBKsznfn3puOwfUYcoB52CMlF/Gsi6jEIOVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRKAzeHI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRKAzeHI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43622267b2eso36664225e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 09:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739123238; x=1739728038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=635XUpQWwMBC20im34ayRqdTDYXD0oCaCf2wtTpcf80=;
        b=XRKAzeHI1i47TjRICWo/fFeu+ONKQL6rxHyPpZql8TBATR1/R0N8k74J2syTqyy2EK
         BkjAMOe0Zl1MGyxSS8iDyR/x9zSc0dEswTC1qFLd8ZXUSZDejgvi02Dc/skhdGCGa5b2
         aBMfbtcK294rPQ056fUCmtvrmfRx3tNIYQJl1thr4jjpKgPcQg01sWMMoZdfAYaX9MQp
         dtNHyVFVQhJUpCEtWcnNasz3jq7U7oXTvrhV/8lQ07YjZpwS4w8Z1/kvUS70W24sv9kV
         kdSGjL8z50XFZh6f3jAk4CkGVkuL8lGt6duJnVlLUOCMecnP+DQrbO+MAWA6VIS4cUQP
         5tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739123238; x=1739728038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=635XUpQWwMBC20im34ayRqdTDYXD0oCaCf2wtTpcf80=;
        b=M2Rzi5nTzSrj3FA5DDQUWb49OSKTgWkLEgHkZNt4m4WwwWmI0Ac/m28fc8AbOjJKd6
         2MCFzm7nG8e9D/unUj1sxRC4PvrbeklKk+xvBsZlnm+OyoT8VsfJRb8DmxlhGXTRb4SO
         Xy85JMe48hKPnwtRdlJ1Q/0U3Z00J2W1Ob2QvHEBFOnCVKEb+07MzCbTg+t3TJ2Mfopw
         oJxqsvKqjuByu+3uVU3Md5Atk6TgucnvIBwOwQXse4e8vVXBGQwqtDGbDdMZwPLgaw+p
         NQTmNOXepDFfApJpdnIkOFo5JMra1Hfa7F5YP5hDqO0H+tyur4OyMvRWkJ26OluBIAu0
         9DcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfRH49HpXDjqZJ/6CCFmxrSjracU16nDFPBftRLLM2OxCSKtW2bJuUZFqvH9KDvncJGezmzKOWhgqgQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFRi6RtVzpCQJpCVIm26eMu83Kn56Ch8UhGQt7/amcKrGxUnT
	bXgubdUikDLfeSoWFKrAm3p69GcJXcoZH+ooj17cEAtR0QmllQifJTbwvQ==
X-Gm-Gg: ASbGncs2vWIFyEcFEcprqYQ0wMVqwSj1g2IhleBQE9XTgaZyrHzJ3DK/YKrKkA1ftSs
	cmi3T15JwAvaTUaiN9v0A5wiCHjXoyde4AMsZdMzZkzXCgE2WDprGxUYm/de8DLICNoWUVIaNln
	nVRqlhTqsnf1CdjJa0dlf8sgr/QMgW8J2Ulm0VVMecVwYUauNsft21ylPf5Wdha/yoWhLpjLiGk
	Ejuhqug00i0QWVPYKrB+zm2jMaMZY/WFMnAuFX48I6IylXzz7e3DW5zxOo665j24pT4XD6RGvKA
	YMAQqt6lf3pEDkZORJIjo5jaVKbDiJsLva80kgDrN7pOMHs86WObe+7DqL6emX35Rxhtjvc4
X-Google-Smtp-Source: AGHT+IHd6jyAT0N+xUPxKXqCz5caIm7IcctiIoA6zP+xhMqvsp7Axyioz+nIgSfEUq+zbPIJs2TQYg==
X-Received: by 2002:a05:600c:1f85:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4392499962dmr93492725e9.18.1739123237542;
        Sun, 09 Feb 2025 09:47:17 -0800 (PST)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393b66f3e3sm33686985e9.19.2025.02.09.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 09:47:17 -0800 (PST)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jan Kara <jack@suse.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH 1/1] mm: Remove the access_ok() call from gup_fast_fallback().
Date: Sun,  9 Feb 2025 17:47:11 +0000
Message-Id: <20250209174711.60889-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Historiaclly the code relied on access_ok() to validate the address range.
Commit 26f4c328079d7 added an explicit wrap check before access_ok().
Commit c28b1fc70390d then changed the wrap test to use check_add_overflow().
Commit 6014bc27561f2 relaxed the checks in x86-64's access_ok() and added
  an explicit check for TASK_SIZE here to make up for it.
That left a pointless access_ok() call with its associated 'lfence' that
  can never actually fail.
So just delete the test.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 mm/gup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780e..79a3d2228bf9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2757,7 +2757,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  *
  *  *) ptes can be read atomically by the architecture.
  *
- *  *) access_ok is sufficient to validate userspace address ranges.
+ *  *) valid user addesses are below TASK_MAX_SIZE
  *
  * The last two assumptions can be relaxed by the addition of helper functions.
  *
@@ -3411,8 +3411,6 @@ static int gup_fast_fallback(unsigned long start, unsigned long nr_pages,
 		return -EOVERFLOW;
 	if (end > TASK_SIZE_MAX)
 		return -EFAULT;
-	if (unlikely(!access_ok((void __user *)start, len)))
-		return -EFAULT;
 
 	nr_pinned = gup_fast(start, end, gup_flags, pages);
 	if (nr_pinned == nr_pages || gup_flags & FOLL_FAST_ONLY)
-- 
2.39.5

