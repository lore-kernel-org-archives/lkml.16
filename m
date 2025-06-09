Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD3253F1E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466526; cv=none; b=iZ5fYOVQNLQXbqylBdmn2Uuw6PE4r7tHdEANAovle6tcSb6T6YE50F29juF4LjCgP7ISlq/kQh59S6owAMDk6JKpsQ9ehAZlESxNsu0UB2sZLLoPrxg7cm9dtCcljxELrYVJWcXcpD34CimCkhxmLbR8+Ep1E+1kR81nyMMdGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466526; c=relaxed/simple;
	bh=dlE6XysNUMe9+4S4Zsd9/c2vWujiNEHwn1ieYVgiRDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCsM0hlXEcTEgIvxggA2ikAnUiw5zkMySS62ZGd4B82NgARpi3m6gYbDMMaXP9wOOEa8YC8SoFmNblfnMRDyR1r8Nda5TzNGT8ieSqmAK62OSSY/Oo8DRxBYdR2H8Gt+SOJ28Fe/8Ay3bSzXcGb0xeQzXWlQyi+OWW1xuuuG6NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4RUZIx0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4RUZIx0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3497019b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749466524; x=1750071324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSuwxTMiqoGY5WRirh9YqRM6jJaaP8lp+kq+VG0f4Z4=;
        b=C4RUZIx0j88R2/HpV1NO6Ln3EZJVRpbUbEmHgQyGIejKs9J4IJDN2QZr7U5rkxmCTK
         RyanQ0WSJFm+IXzTUSfbE53Nk3vhwjAdwVJ1tcA0OLryuer9RidXLbRfRjMwkYyYb/F6
         4F6yErXCIPrDgCAHeDlLQ+pRry/attDJM4CUg1OUuyWUCqokkL3OcLxy6FYLXGPolQxT
         7uqvXiJB7kSyNLBfcL4NpbdHR5YBE/fxeGli11+2yfHWo9LMblC5RCRC7oesTIaQ9Juu
         GBc889XbRasDYpcUKiN7QxKx9XGah2WvSuVatJQUeny+d6zBcwRnE4d+14xit498XmOH
         0iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466524; x=1750071324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSuwxTMiqoGY5WRirh9YqRM6jJaaP8lp+kq+VG0f4Z4=;
        b=JczYR8SKQWnLsVD2SGhKIF8GIyqJy/vb5KPNGHGv39JjbBhI33syCFbTesTpMIcQ5f
         BAdYiJrBfTb+NUl0R4XRQBTQKbHdhc8qaWwRHh8M7FgTranEu+ixyIX+dcqtfRM1k59h
         M+UyABTEKa8Mwv1JMGmIoB11/UlVyOgCW8DPneZTQnQLrMAcvR9T3wrhCHUgGK8fB/5F
         5FUQ/YSAmj3iT0R3uisjbmf/zghgfRVeBcra/yyIJ0KsV5MMQzrquT1wu9tPHxEltH51
         SnQKVGThy88jrJzcmlBS7q7S2gp6+Y0Oag3rtIYSnoOkyWe3Lf0xKTXPS+t5gaJ/V2WZ
         juFw==
X-Forwarded-Encrypted: i=1; AJvYcCW3zfxX+oS8Nhwrd8wJCkvJHK9rnlouPsRU62cYRP9PF0Ska7msohaJVhQTj3T92PcPGb7hRqf5nC3QSJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7p7VyULyyLupx7QU9cwgRHc9WbCjDHoGt4GY0cg2zxHLYLaX
	QCKWfsEQ13CO219sCOQ/Qp91zVX98fe27GqRvRT4JOBEmnAn5Q8/YAE3
X-Gm-Gg: ASbGncs1q97Yv4eT3avg813Z6C9W75ZhlGNoRdPJ7MkvrEt4pZ0mBdiG7BB9oYKuAmd
	QvN2P3teY4Fld8ekt9RM9/iCdbzmyMCTv7HbceHulclANOMoq68WLo0M2LyzPH8D20Y7hFWjidk
	1I5JyMKAdTJ5/wKmnfmkVk2ZmoLGnyO3AczeJMfyeXdSS3sW1rIPijoZdJdeCA3gLS+URbRpp1b
	htiVxdByaPiuSwqPsQTmjvI31nkyN6PdOXMGyC72vTxZqXseVoqKI6ZvooTymAyphkiSRqfDqR8
	Bna82jb6Kr0Z9NgsrDojNzzdX4uC6XieV61EzKqiJ7gXVC3KMRXt2zRpShJfqGTmDinLkGVjmBA
	n5w703qLa
X-Google-Smtp-Source: AGHT+IE3/b0kxC3ol+meK8Ae5m7aPYsZcL+giGsuo+6NptvitOm2cWGvDKXxU3iwx1jrjcTh9jBprg==
X-Received: by 2002:a05:6a21:2d8f:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-21ee25554a1mr19642640637.18.1749466524305;
        Mon, 09 Jun 2025 03:55:24 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7483318cc55sm4605114b3a.88.2025.06.09.03.55.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 03:55:23 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org
Cc: 21cnbao@gmail.com,
	Liam.Howlett@oracle.com,
	anshuman.khandual@arm.com,
	david@redhat.com,
	dev.jain@arm.com,
	jannh@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lokeshgidra@google.com,
	osalvador@suse.de,
	ryan.roberts@arm.com,
	surenb@google.com,
	v-songbaohua@oppo.com,
	vbabka@suse.cz,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of walk_page_range()
Date: Mon,  9 Jun 2025 22:55:13 +1200
Message-Id: <20250609105513.10901-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <e61b8931-521f-44b4-a78d-4988ad7c70b5@lucifer.local>
References: <e61b8931-521f-44b4-a78d-4988ad7c70b5@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Yeah dear god I missed this oops!
>
> Yeah Barry - could you revert this change for the guard region bits please? So
> this is intentional as we do not want anything non-mm to have access to
> install_pte.

All my fault! I wrote a multi-process/thread test to issue lots of madvise  
calls, but it looks like I missed INSTALL_GUARD.

Thanks, Ryan & Lorenzo! Does Andrew prefer to pick up the fix below, or  
would it be better to send a new version? He’s handled fixes like this in  
the past—happy to resend if needed.

From: Barry Song <v-songbaohua@oppo.com>
Date: Mon, 9 Jun 2025 22:42:13 +1200
Subject: [PATCH] mm: madvise: revert the walk_page_range_vma change for
 MADV_GUARD_INSTALL

Fix the broken MADV_GUARD_INSTALL reported by Ryan.
 # guard-regions.c:719:split_merge:Expected madvise(ptr, 10 * page_size,
 MADV_GUARD_INSTALL) (-1) == 0 (0)

Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/linux-mm/671f8164-a90b-48d7-9446-359eb9493500@arm.com/
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 8382614b71d1..381eedde8f6d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1141,7 +1141,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		unsigned long nr_pages = 0;
 
 		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
-		err = walk_page_range_vma(vma, start, end,
+		err = walk_page_range_mm(vma->vm_mm, start, end,
 					 &guard_install_walk_ops, &nr_pages);
 		if (err < 0)
 			return err;
-- 
2.39.3 (Apple Git-146)

