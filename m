Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48267188006
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335052; cv=none; b=dSDq4PdKcK1h4M70rmKGfAsDo4dDj8zeq9A7w7rSLILfEkaNB76SiJk/Bb3/KxMPkVDfnwkJ3AhI1XUXe9fe336j3PcI5V/xZfNGMoSIJTaFPiaAVk1YhctpmPmociCYcR4y5TuFVcoJ1czAWEKRmNGpqzdtv9hNT2/CZhMOrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335052; c=relaxed/simple;
	bh=ram9moRRwUzMJ0SM4AzxNo3JFJgNSzxqrUbfk018MjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UuRWOEmAZBlP9VfDShp3USQvNSPJmRWJSdTvifhLplfC5H6cgusDGbXPsPhCjtOiavsDy7bj0mwETY8TE2TZ0WFaLS/WdcbijvEjpoRFMt6+A4w7y8S2tNyAlkr0kQujnOnk0nlQ9dDt713z9zag8O/bXlqhhP+HBhFt9czzkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlgJ5OUy; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlgJ5OUy"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b074d908e56so1545099a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748335050; x=1748939850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG068GBhBEM6vEx1ff4IYRmbQ2abHAH9u0tmgVxbbpY=;
        b=JlgJ5OUy7B96lZROMNvdaY9Qv4BdaVkZwo++yXMWXSh6ev4j4jkjUjFAej0OK0lW+q
         2ZqjkHHV9mLb503gB7YZg8eMz1Oli+zh5FPf+YGwGZheBD1hvcPrfc6VHiPbNEQdpgHK
         EjNNwQsPFTi9Zygf7Ksv66JyqSQHscY4pGzO0DRXCkcsVIwRlD4YQV8H42UlZvCuSUEK
         uH5yufJh/mKspabupTrZRuDzg+3yEIvVLxOXwTWlt3Jt/jNJ7kRRG6rE3GBkUHO0qFnG
         +N7fLiP12v3zWcS6WJOhzWsxzMf9l6kgIZP1G/kcbgUSxWdDRowJ7tCbQko3lP2zHBdR
         qzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335050; x=1748939850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG068GBhBEM6vEx1ff4IYRmbQ2abHAH9u0tmgVxbbpY=;
        b=Z+rWN5dhPQMXOPwEOZrzGqZ/aPFT3Ib7cpHg1Fzqg8e6ZKgz/aQjBROTJi+Rfpezo7
         k8EKSdOh8PwijHyhuJ2xFOltKUNyqX4Z/54RsMI9fPSj5wucNadQ5Z0eOHzHO+KGMbAC
         cgH0EQmIlNUucZz+0bCJeLeA9fRvLafa7VCSGQQuZHOIRAra5wa4g/C4ZvWVVpaS2brU
         FBOwFB+lSPIQgNq758t29kxkGsTUYs6oma6+RT6VKA5WU+MPU6nr5QdmcEOueJN+kYvB
         XSLZE+IkMvln9Vz51cBA49LAlhd+mZnDg8yLQCbRRw6y/Xo0MRDeX6lJoGQaqrBRSnK5
         ZfbA==
X-Forwarded-Encrypted: i=1; AJvYcCUS1MJQyxIN0vIHQCpMa5dn2KxssAldEooLM9uduCi2S7wIaxYqCkyTpGHfH8IL/2xoy/EfXTE/9DH3nLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6gC73x+xpxKBCKz93VmjP9ZT+ueM5vDzAwNmZl6gJVwjxckN
	XddZRa/x42DTaT73v4MVaHbSV4+nh9Q6J3Xg+oJyNe6rl/2v2a94aTXTK50f/Q==
X-Gm-Gg: ASbGnct54ixNd0pJqH6HJk/bCVOWt0PKCV7EdrmuLXybwj2EGpv7Ye/GQXCEliug79v
	7Ikq5lPb3bFjF+7SAEbKeEgwgEEhmjCupRfeVeU0bnhXBTET2V2aPEnqyq6cmJuLAPN6ag2PRrO
	hyq/NHjpi2txVx6Hrxv03jmcDGmPJHH956cz+Tkc277xYs0ChsM64yYN4iJ125jIA8gjYjGoIZj
	ya7ck9KUVxKJGDkFtXDbYtkxiWjWikX/EPryDWHmOJ/DrLowzdSf72vYStWEb17Ze43Xvr02c8l
	d/SdKp7uhnGexLbrnXxViwcrOachDnRMNWPp4WQBK2742tfiy/mwVzY2FkLQnK0sVUUi
X-Google-Smtp-Source: AGHT+IGgUOniQeowny4ikpFfBKzAvvOgmt8e+sabsiZxvOnXLLrj+o/hCy59jr5nmXu1emXHWTzEGQ==
X-Received: by 2002:a17:90b:35cc:b0:306:b6f7:58ba with SMTP id 98e67ed59e1d1-3110f31c313mr16749250a91.6.1748335050418;
        Tue, 27 May 2025 01:37:30 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d0d44sm13680014a91.21.2025.05.27.01.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 May 2025 01:37:29 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lokeshgidra@google.com,
	peterx@redhat.com,
	ryncsn@gmail.com,
	surenb@google.com
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs concurrently with swap-out
Date: Tue, 27 May 2025 20:37:22 +1200
Message-Id: <20250527083722.27309-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
References: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, May 27, 2025 at 4:17 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, May 27, 2025 at 12:39 AM David Hildenbrand <david@redhat.com> wrote:
> >
> > On 23.05.25 01:23, Barry Song wrote:
> > > Hi All,
> >
> > Hi!
> >
> > >
> > > I'm encountering another bug that can be easily reproduced using the small
> > > program below[1], which performs swap-out and swap-in in parallel.
> > >
> > > The issue occurs when a folio is being swapped out while it is accessed
> > > concurrently. In this case, do_swap_page() handles the access. However,
> > > because the folio is under writeback, do_swap_page() completely removes
> > > its exclusive attribute.
> > >
> > > do_swap_page:
> > >                 } else if (exclusive && folio_test_writeback(folio) &&
> > >                            data_race(si->flags & SWP_STABLE_WRITES)) {
> > >                          ...
> > >                          exclusive = false;
> > >
> > > As a result, userfaultfd_move() will return -EBUSY, even though the
> > > folio is not shared and is in fact exclusively owned.
> > >
> > >                          folio = vm_normal_folio(src_vma, src_addr,
> > > orig_src_pte);
> > >                          if (!folio || !PageAnonExclusive(&folio->page)) {
> > >                                  spin_unlock(src_ptl);
> > > +                               pr_err("%s %d folio:%lx exclusive:%d
> > > swapcache:%d\n",
> > > +                                       __func__, __LINE__, folio,
> > > PageAnonExclusive(&folio->page),
> > > +                                       folio_test_swapcache(folio));
> > >                                  err = -EBUSY;
> > >                                  goto out;
> > >                          }
> > >
> > > I understand that shared folios should not be moved. However, in this
> > > case, the folio is not shared, yet its exclusive flag is not set.
> > >
> > > Therefore, I believe PageAnonExclusive is not a reliable indicator of
> > > whether a folio is truly exclusive to a process.
> >
> > It is. The flag *not* being set is not a reliable indicator whether it
> > is really shared. ;)
> >
> > The reason why we have this PAE workaround (dropping the flag) in place
> > is because the page must not be written to (SWP_STABLE_WRITES). CoW
> > reuse is not possible.
> >
> > uffd moving that page -- and in that same process setting it writable,
> > see move_present_pte()->pte_mkwrite() -- would be very bad.
>
> An alternative approach is to make the folio writable only when we are
> reasonably certain it is exclusive; otherwise, it remains read-only. If the
> destination is later written to and the folio has become exclusive, it can
> be reused directly. If not, a copy-on-write will occur on the destination
> address, transparently to userspace. This avoids Lokesh’s userspace-based
> strategy, which requires forcing a write to the source address.

Conceptually, I mean something like this:

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..70eaabf4f1a3 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1047,7 +1047,8 @@ static int move_present_pte(struct mm_struct *mm,
 	}
 	if (folio_test_large(src_folio) ||
 	    folio_maybe_dma_pinned(src_folio) ||
-	    !PageAnonExclusive(&src_folio->page)) {
+	    (!PageAnonExclusive(&src_folio->page) &&
+	    folio_mapcount(src_folio) != 1)) {
 		err = -EBUSY;
 		goto out;
 	}
@@ -1070,7 +1071,8 @@ static int move_present_pte(struct mm_struct *mm,
 #endif
 	if (pte_dirty(orig_src_pte))
 		orig_dst_pte = pte_mkdirty(orig_dst_pte);
-	orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
+	if (PageAnonExclusive(&src_folio->page))
+		orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
 
 	set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
 out:
@@ -1268,7 +1270,8 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 			}
 
 			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
-			if (!folio || !PageAnonExclusive(&folio->page)) {
+			if (!folio || (!PageAnonExclusive(&folio->page) &&
+					folio_mapcount(folio) != 1)) {
 				spin_unlock(src_ptl);
 				err = -EBUSY;
 				goto out;

I'm not trying to push this approach—unless Lokesh clearly sees that it  
could reduce userspace noise. I'm mainly just curious how we might make  
the fixup transparent to userspace. :-)


>
> >
> > >
> > > The kernel log output is shown below:
> > > [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> > > swapcache:1
> > >
> > > I'm still struggling to find a real fix; it seems quite challenging.
> >
> > PAE tells you that you can immediately write to that page without going
> > through CoW. However, here, CoW is required.
> >
> > > Please let me know if you have any ideas. In any case It seems
> > > userspace should fall back to userfaultfd_copy.
> >
> > We could try detecting whether the page is now exclusive, to reset PAE.
> > That will only be possible after writeback completed, so it adds
> > complexity without being able to move the page in all cases (during
> > writeback).
> >
> > Letting userspace deal with that in these rate scenarios is
> > significantly easier.
>
> Right, this appears to introduce the least change—essentially none—to the
> kernel, while shifting more noise to userspace :-)
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>

Thanks
Barry
