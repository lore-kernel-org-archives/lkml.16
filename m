Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5515D1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 04:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749271996; cv=none; b=sw7wDohg/FgVx8BqX9bRCcpaTShs9vM03SSMCAmv71Og2RBg0cM2G1nNlU99a5HYvVrLQYlrATu1+1up8/tgMSYMvxEORT4tJIWh+mJG/j8i2C0h/5Vhl7H0fEoDErT2x5nS8sL/OZkfBAMdVS+5qruL84rcVfDhJdTStokq55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749271996; c=relaxed/simple;
	bh=ixXS0cDr0yH7e+RR5z3g86AXJJ6l/DAV6Z0FxjD6xmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUU8Q1YB/6mmM8wCrbysBZcl66YJU9AKZ75rVv2Avyd0+mK2SF9S4bqOq+70lYskzAucoEXTY1PFfaNg2a2UoXziX3wypeojw5OAlj7gTNUKn67xYmT5HkV2GAO1AP/WUVlKHSfIoYF0UY5EJY5phHoKvS7+QMkcyjjcsuKwBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgZuf4dv; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgZuf4dv"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e75abe99b7so822104137.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 21:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749271994; x=1749876794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIooNSg1UO6vKmEWpNnCRekkajqCQgFQZhhnW9YK6hk=;
        b=MgZuf4dvMKGriJDiOZupdhvIVfsYsAOf3/VbakkXQmSPObAnE0x2jbmXXooU/08ZYD
         dzCGpbQBLzAGVOtOW7xo1vZ4BS9yQSoLSxBDMsXH8xr9ESo/JSUXnCzA6i60NXzeYj8b
         xhZ2epYVSUMbylwxjklDNn5tlz097FN28vaEwiLg3lfVUojA4SmJZgyOu0CQgF5jZ+NY
         vFmmrYy3cKFXhoXQNRsLqYjCxvvySStmIqbOzqnCUrJdLxlhE6zecV6E4lFGm6pYDE/5
         5KI8OHY0wApnBHBk7zRm1rC11ieUci75S5rta7mra4Uj6oeqzaNlyZhL0nhttM/l3T9S
         dUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749271994; x=1749876794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIooNSg1UO6vKmEWpNnCRekkajqCQgFQZhhnW9YK6hk=;
        b=oI6fn+fldRBvD5Go0VwIEu8+24caUhsOzX9TxW89OEHfcAGo2h+uoZbS4CogrWohsF
         PyF8Cjv7OBxS6AKngF1vz4sjkzFZySF0pL2DqxaHSe5uPu5who+ifdqHCmBkkYfRt65R
         DYxYMkIJ3hzZrmmZVfRJHJ4l2ggfbj3HWDT/ELBvT8ngxFFoQfjS09HwHud7QIcGntBm
         iXnURvsyxyJC+0l7CjmnSkghIKOnQmHvVRF5D2f/Qyrdw5iXPjda480wvrrV3si25zEp
         rQUKvyQ2Z+ZdCEx0RuSfQv1i4Ql+F7qtIBB4zTHBGt6cIqhE6/pWjGyik5wL69BOTz0P
         ECew==
X-Forwarded-Encrypted: i=1; AJvYcCULWyhC9VM17UnTcBi/NbmgOB17T6Jz/wfggbULznPLEjKcloyO2T24OG6uBDzRqrrdWRZhj3x71nivM44=@vger.kernel.org
X-Gm-Message-State: AOJu0YykAh/VWzDHYQLHb4xynZL6mZDulJCNAmVpe+h0qmliBdig9h6d
	KEXH7ZZlqHxBh2oWclw31WqBCrF5hOcLayGCDQ5meTJo2e99bnU7iUiGtvHV03FyJMZkdfq+gbz
	7adLMe0VOvcCvP590azWnfmBrdta3nzs=
X-Gm-Gg: ASbGncvi/8Xqk6LoPqsaZZPcwq/lNh+BNcepxaeXYNjr0YyMs65gpRvnXtGoNdkv5/x
	x7UnORJg44IGLZnQ5cMR7xCGD5CyOc809jpy9s3HpTvFT+K34PifF+wJmOpn5QpAT6UwKVwjkoS
	SpsDe6kPCjy7yPypn9lhSyx79jPOTncV4t5Q==
X-Google-Smtp-Source: AGHT+IGDUf1jWjcaktsy61a18I3PkSz6S+VdyYHIHk8/YlRKQVO1BjIipCaUo/Eq6T+4tnSTeBOJvDsEfT1oFYy2cMc=
X-Received: by 2002:a05:6102:3fa9:b0:4de:c7fe:34b3 with SMTP id
 ada2fe7eead31-4e77264eb77mr6327504137.0.1749271993663; Fri, 06 Jun 2025
 21:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607004623.8896-1-21cnbao@gmail.com> <aEO6asiCu9oG1z8o@casper.infradead.org>
In-Reply-To: <aEO6asiCu9oG1z8o@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 7 Jun 2025 16:53:02 +1200
X-Gm-Features: AX0GCFs3CZonaFcFqVyazYoNoWE6X0NXyHkVo-n7Fw6MSugWNyJiwNgljphKH_A
Message-ID: <CAGsJ_4x1RbQ+GKKc1rrTaNA8Xd+W8K-Zu6-kwVYNKzB0OWiowQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 4:05=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity=
 of
> > userfaultfd_remove().
>
> This feels too complex to me.  Why do we defer grabbing the vma lock
> so late, instead of grabbing it at the start like the fault handler does?

Hi Matthew,

It looks like you missed the spot where your comment should have gone:
https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.lo=
cal/
So I believe Lorenzo is the best person to respond to your concern.

In both v1 and v2 [1][2], we did try to fall back as early as possible:

[1] https://lore.kernel.org/linux-mm/20250527044145.13153-1-21cnbao@gmail.c=
om/
[2] https://lore.kernel.org/all/20250530104439.64841-1-21cnbao@gmail.com/

But that approach had its own problems:
* It's not extensible to other madvise operations.
* It's not easy to adapt to vector_madvise.

I also initially found the new approach too complex and tried a few
alternatives, but each had its own problems. In the end, Lorenzo's
solution still seems to be the cleanest among them.

I even forgot to move the code below back to visit() from
madvise_vma_behavior(). I had changed it while exploring an
alternative and should have reverted it.

+       if (madv_behavior && madv_behavior->lock_mode =3D=3D
MADVISE_VMA_READ_LOCK) {
+               vma =3D try_vma_read_lock(mm, madv_behavior, start, end);
+               if (vma) {
+                       error =3D madvise_vma_behavior(vma, &prev, start, e=
nd,
+                               madv_behavior);  /* better to be visit() */
+                       vma_end_read(vma);
+                       return error;
+               }
+       }

Thanks
Barry
