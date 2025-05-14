Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241D1EFFBE
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253783; cv=none; b=DeSDuf2+TVBIwMKR+udcqYCAcRKiVE/xnoHmKnfmJot9N9GWFKy+2ynOff3b8Ap+0MCdu7jJ+uuzJBvG44Lt1wJsZb8TTlk57ZVa55p6ESdijKfRSCC6pVSEsZeTP+rfPlPug6e1VpEpg+G2ixml5zwFfKs8KgsufuHJsxBcLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253783; c=relaxed/simple;
	bh=AhBAx7c2m49y1zTwaQRVPCyuRw5KmE/JQ7qMn+LGWxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjVp9/26bcC1oSzHuBip89qpjIG2j898SzFROiKmT8MrLvQjWPzG2aGWsATPyKIq1rmlAqb4AKnGxctwWIi0oqjeMIayILEzvZ6UhLD8c4d14RQoMIK388vKwTgawGfggrYlQJ2uGzCr1m2OJA0Hm+ejw3xE2spC5OiDscrItZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=itC714sr; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="itC714sr"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e78e38934baso244510276.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747253781; x=1747858581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqwHn7EjMetcDb+eDU0oZyemP6qxYll864oUPk/SvLI=;
        b=itC714sr2I15byEHzLIkaLHZ6TLZDlQZdiZpYH7B7wQmnTz9egl4yLxtRW0x/K9sJK
         bc9pTRNaohPDMJ5ahG5cJ2aCKPfQ8mGjO5vyWgAuavKTD4C/f5rREHeZZsNLjljyPzvZ
         UgjmlMG9fo3TNg85Fms4dYDgW029ukEIfwFyAJZLxlE/v4234Dq5kqzzzYeuEGvjUT9I
         NbUc8WQBmj3m6acPE225vor7XQvPIQlkP74tau4dvbja5SFZ30zSNSLNXCP7p2JqZ6bc
         LsD8FPOPRFsYATNxvmz1psZyja9AHiBXpVX6g8p7NSy3hmHClqN3gJQhscXee8tJRBfI
         puTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253781; x=1747858581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqwHn7EjMetcDb+eDU0oZyemP6qxYll864oUPk/SvLI=;
        b=G3tc4EHY5JFuxHgzzu/GV2qGR1cfKVTJZKn5T9daUJxFIcYsezYg+c8UkPZTcL6iba
         ITsfZtbdXD05g16tztnvjMYG4J1ssodLHDrxu+ffgIkAV5ZULP0ki7SXvdu/mKg4/Clf
         NsWE0kJ11fU/Vdh2Y1T2fr1V45KEUxkt9grPUM/3j2Lq7iSn4AAazKPqC3befEyazzD7
         JunMgzlgaDqj25laBLDEixxc1akFMxJGVmjSiZFZhMitYk/+D4tTvBaqAHxPoT2BMGfw
         Bnn1lAD3MesZi+TN9P+os/8udLeGNSTuRGlsB//0IxJxZUVVqncslN8qjWWXzjbO+JU1
         BZLg==
X-Forwarded-Encrypted: i=1; AJvYcCVvWwZE3ojDDVx8yPux7+xx4QR4MxkyCiQjLKUZ8CzOfrighuqixKUZUE90PYjCjPBKYGNSeTOC64akN14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx411oj+aaKU2GVmL6vlZ7v/y7QT+8SQyOjVG/mTncT7zq7vtzn
	YuWXOHpILeIxB40wkCYVVXtpWLXXJU0dFiwUg4IEBtapZb2TEDumfn6HVcK6mkxQYXYFDDX0jAa
	8kcVRoWXt3B1CdigXaLh/8cylxK0i+tutTCuJ
X-Gm-Gg: ASbGncuqK0zgnpbPPYJ4AYmSk1cZ8TNYYKNXJrq7Mc7jcZUMI8dopmaltYbesR2q8xp
	mSrGrn3K410sTsQiPFJiJhsasWfNM4O42/mRtZl9Mj0ZxcYvI48T44cLJEWSYzEBmzp0wMy7Si8
	JJLs6cRc0aprxUTsKCJdXVrV05I5Tin7XScs3JTzxg8wktL7uG8X5ebgMkK5/lU3M=
X-Google-Smtp-Source: AGHT+IG7DIaVxTG36PqlyFQAkgROVY+bfnpeJee9rmBxD4tE9All83rWtotcjOA5Gwcec/nLx7JQQmQEmb0FPuz2plk=
X-Received: by 2002:a05:690c:7085:b0:707:cdd2:542f with SMTP id
 00721157ae682-70c7f17c20fmr64537787b3.21.1747253780516; Wed, 14 May 2025
 13:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 14 May 2025 13:15:44 -0700
X-Gm-Features: AX0GCFstKD4fwXtprpdHm-GCBvx9tSGFrIpb9YkzFyHV3btP9kt-l8lvwGGYI2w
Message-ID: <CADrL8HVja-8J1vcW0RLbsJVaLQENwo_LJ2mTj10uHeV06STxMQ@mail.gmail.com>
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com, willy@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:20=E2=80=AFAM Ignacio Moreno Gonzalez via B4 Relay
<devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> wrote:
>
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-=
only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
>
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.
> ---
>  include/linux/huge_mm.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b=
07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma=
, unsigned long addr,
>
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>
> +#include <uapi/asm/mman.h>
> +
>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>  {
>         return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_ar=
ea_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>                                    unsigned long *vm_flags, int advice)
>  {
> +       /* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEP=
AGE is not supported */

Do you mean "but MADV_HUGEPAGE is not supported"? Just want to make
sure; it seems like no one else has asked about this yet.

> +       if (advice =3D=3D MADV_NOHUGEPAGE)
> +               return 0;
>         return -EINVAL;
>  }
