Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B228F51F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751519989; cv=none; b=cdZsim9Zg5ZwFgPxIXKkIm8ToSjg2nl6YxgUOyNNq5eF3AjKH72efw6UDHURmlCLG2lspq8F6edfDcbRc6exV95EokEQW5Iu3uUmi2LpSv833bU9kJ3Y3calZpMKwPQ4k6fK0lGjwhwo5+A7Cp1vI+8yIuJI5rOvClX4Cn8iFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751519989; c=relaxed/simple;
	bh=jRAgCvoY/ocIMHnMQwXWP/bfmaoygXRwuBgDy2q2doI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzt6CRoGBq+V49umkYl662w4DetpUng/OWirm+l2fmUJKb9C9IONqyV/ZWhzjJg0IOODK7eBrsJjhA3A0LJ2+BcE/2Yxn4pUlQkRe9SehYh9drGNGpUYd/GzWKXWGN7E98LBieJ6Bar03ASqKB41bz7Xb+gZcRithUXWmCuPt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6x3HSOw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6x3HSOw"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b350704f506so473779a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751519986; x=1752124786; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uTNZE7ZOTAyF8MCYIIhkbiCDNGq9g1xy3OOHBzUTllI=;
        b=E6x3HSOwGE6HMdUIJcS89bhbtn9tyuh0BO3NgonqIZ6rYV6aUtlnAl2Q7PvKxHRxWJ
         ADYXpUMB1PEJxrJjU+p+74JKmPjGhjQzQCa+p11VAVVzPgt/0txYv7rNSqGxyLz1mAxg
         9at7FSe0FCVU4m7/qBqvUsX9y388amRncHr0RlIvlXJAhSuwealkU/VZV3lrKsNfc454
         CgQW/wYN9ioRto7LJABCVWxKlm0z4ZCz8qlGnTLRUAOmjcIKrWteVHXwuEeIWd/alIFQ
         an2qdQ2hLuAr8y+mggJ71Uvx/5mVpYm5eAKhh4l5E4EQmwPNT5rP2+kIAZQjW0yuzggP
         QV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751519986; x=1752124786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTNZE7ZOTAyF8MCYIIhkbiCDNGq9g1xy3OOHBzUTllI=;
        b=kOpciPxML2L4CYwGv2JUz8aQ+5lqo5NcXY5pRtL7YOMX6iXhdhTU7lnwrAzS/VdcDL
         0Kchy6SGp9BeMQe74D4eTCx7I+s7k/TH86a91ZZlrqM72QMlS6E+Gn1LMS8G6q4UPwbY
         nIaP+z8PZvGq1j+lY3fB9KgTSthLTzeT6LD0CxxqtuGpKt7T5OWpf4JWfE+39ErLfh35
         QpC0JBhNu/K85ifdjsgrQze6hYdOpdTS5P7R/6tU9OXGfcczDenTOl9Lw2KpIXSE6KTR
         NojxqXtBQlh82+goJ0fNpRyZLOqJBedq9tqRZszGhXeri2Q0J29o1PjUBp0EBmppZSoT
         PsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQmppWCvI3CdN4r9YCBjZnOQPbBS5uDL8oyIc+T7C3PhHf5+1PRtkhZeGz+Jp98O/Ex4GbbFdkd53u6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmAVN2AEoePFghkNm65SQjGfeoOZA9TcIK2x+/mVehutVf+k/C
	W+HfekECKYQsduo9yvf6Z2BJzigKRdSUxvhslue/roek2xxPSfNAJhV3RvtLnUXJcahU5+9yneY
	hC4LCD51pXn7EjoaN6KPrbrKTJk6IE0Jm3J1cHtQ=
X-Gm-Gg: ASbGncsf/pWkVboif0F9Ddltn0MpADpxMJgJ+8Q3FCRwFcrJJWLR+1m96BcCcGT90UW
	toYajGJ6uAiJ3DlpI50tGtkjp7MJ9BGGw4GkayVqhg9nl0r4fVFa4odZGJeqLgVNH4QLEtzyeTL
	WJt77Dr1v63auszUnB8xuIoNR5A+6T8XfZ7y9tsc2GFSytsPSq89nGPg==
X-Google-Smtp-Source: AGHT+IGgdXq3dC7nvHfpeeyjETEksLiNdeVE+3KovLApGAJDmKuuYvYO9wE2H4ql7W1/liJS4uslOTBEJsnSlLcA8MU=
X-Received: by 2002:a17:90b:5544:b0:313:d361:73d7 with SMTP id
 98e67ed59e1d1-31a9f8127b7mr1120325a91.13.1751519985793; Wed, 02 Jul 2025
 22:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702082749.141616-1-aha310510@gmail.com> <zvczeiqk535pvryfae4lta5ezvqks6knhugnzgyq6gu634gn4c@av5hhiabqmzf>
In-Reply-To: <zvczeiqk535pvryfae4lta5ezvqks6knhugnzgyq6gu634gn4c@av5hhiabqmzf>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 3 Jul 2025 14:19:34 +0900
X-Gm-Features: Ac12FXwXCy772mUmdzXg1-YI6W9xVBQJrqHiDhqhYUpNPGpGqu4oM7JO2tLJ3SA
Message-ID: <CAO9qdTG0uDcG5ydXbj5XZdsdH=pD2yHaq9dR=N=Nq5QvUMvuBA@mail.gmail.com>
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, akpm@linux-foundation.org, 
	vbabka@suse.cz, rientjes@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Shakeel Butt <shakeel.butt@linux.dev> wrote:
>
> On Wed, Jul 02, 2025 at 05:27:49PM +0900, Jeongjun Park wrote:
> > Read/Write to pcpu_nr_populated should be performed while protected
> > by pcpu_lock. However, pcpu_nr_pages() reads pcpu_nr_populated without any
> > protection, which causes a data race between read/write.
> >
> > Therefore, when reading pcpu_nr_populated in pcpu_nr_pages(), it should be
> > modified to be protected by pcpu_lock.
> >
> > Reported-by: syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
> > Fixes: 7e8a6304d541 ("/proc/meminfo: add percpu populated pages count")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> >  mm/percpu.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index b35494c8ede2..0f98b857fb36 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
> >   */
> >  unsigned long pcpu_nr_pages(void)
> >  {
> > -     return pcpu_nr_populated * pcpu_nr_units;
>
> No need for the lock as I think race is fine here. Use something like
> the following and add a comment.
>
>         data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
>

This race itself is not a critical security vuln, but it is a read/write
race that actually occurs. Writing to pcpu_nr_populated is already
systematically protected through pcpu_lock, so why do you think you can
ignore the data race only when reading?

--
Regards,

Jeongjun Park
