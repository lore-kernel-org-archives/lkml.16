Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6203FE4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 02:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748919033; cv=none; b=kI8Lmg1fxkM945RDpm2AVeH+eh3xeF8YM6pInwhSUwhUa0tE4WOjh69Q+w+QMwqJWGn6ZTc2E0cpXB4L+bRjpNLb5/y2I022nFKnhVHjliEJfZlDexROeyN1N7tb4PKnI21AismlSbTcavs2cIuNpDLhnb+aAaVDDipgL0dcnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748919033; c=relaxed/simple;
	bh=7gM3WsyQl3OXulJsCBVCmHL/Usyzz4BlHrBhYw77ZOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4SOWVe67B3SZyWN8Dl8LYsXTgHQP2MH1PmCSKNgMXgDCGaDfX2d8z5X3T6XtR2TNbddNZufm1LtARoBlYTze3Noxr/4vdHvVWpR1vGulZUkR3o1AOx9wOsi35QaJ7eoioHMl3k/d1eXIQxNGug8gFuCwHogHJ9Wh0gsaKYm7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAyZGgSt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAyZGgSt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-310447fe59aso51774481fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 19:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748919030; x=1749523830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQkEmhOVmgQNDc/WM9/lHKV6x/q3IXLWLf64AP17Ww=;
        b=PAyZGgStXZGBpMk47c5a9pvVCzIEHchZ6gXqsPLTxGA/CQOdPkOdsZB18htq7bhzKY
         61tyn9sOCsgQ0sHjUnKCt2E5hMTuOYCkI+j/bnAMvFkubc/2HBmlH1Xpa7le0BPvZc+5
         Vbza5W0iATIqCwCA/XkxzicfUwOYfwIPBrAZAPu9Zw7fnCYnMkE+JjWNtLbiLxYEocRK
         MNmAGMu8QVVq7PKI4jcjkkgj5i97UNTKpBhxHCWyVJ6HW1v5w0wi8MrVMay70NV8HJ9o
         azPNkO+r6Q6tbS7mvalc9kccy4x1DvaVATczsovTML/fEiCETryaJ+v2bxvfLIB2d1P3
         8pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748919030; x=1749523830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjQkEmhOVmgQNDc/WM9/lHKV6x/q3IXLWLf64AP17Ww=;
        b=UmOqEYFFiqXV8X5DwIGewBjLaOq8c+bjuD6+B9JliKiCywq36AWqfkF0AOaKgdiGdy
         yBoqv+VtKRlXqzLUTeJvCZsvlhxCtIKplURMoGsCi/qeUtvhtMMciMp6d3nA6a58OXua
         tbCPr7TtPXVl1koONfYgwwwTpQU4pw+tW89njL0yworsBrX+KgF9putoMWFFDnpvFet0
         EObh2sNBuSGQKGEB18w/Kx0ZBVPhhFJ2TiwlI0Tr/sv3l7ZCYCqHXJSR3iVHzDkApgEc
         fDWXmCLWBhmQJTtUjwnboc5/IQ+gtoSo6SFsoUB8RgqG8dFEZyIjN1GJONGNpF2AjFAX
         Xbzw==
X-Forwarded-Encrypted: i=1; AJvYcCUx8329icx4RwiwOGEpBW1Db9hpa2V64tKoTyEf2rWaidzhs2HgWUSEQMGx8dxrQrMnRSZ2o0iy7fhqJbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEN3O7mfSvvRf+jIe0E82Dx0FivZSYQtL4zk5SOln3izONeTEd
	2OlV4xIVRwhNel5VFedgkZHHW9bcZKZdoZmRmaOsotiXH25/atNO8a/uGH5+02boAajN0jJW+Ur
	VQPZb2UbVTtsXLaPucHoTqEEfTohIi1I=
X-Gm-Gg: ASbGnct1kzHi+ezz1+RDPZUfDH29gDv/25EtSQwPHr1W25b2cltR6FHTMg2pGxFtoKM
	qsgOQyPjMeYwqi2+PN8l/qLiYVDTm45oDTcG7m9Gy2X7TSY4GedvrT9OkOMh67V4WIbeUqkLhF6
	y82Pdu54cRCC/p/U1jlI4vYnhOfNIKosGrbfODV7guIA==
X-Google-Smtp-Source: AGHT+IEGxj9mYfTPGRIlqomwSuHiJWoaUmXfD+EWP2jSjdgLN6cVfQUMCpnlrvPQ5RKIXxZLvwwU01IxeCXF46TzViY=
X-Received: by 2002:a05:651c:556:b0:32a:8aac:e469 with SMTP id
 38308e7fff4ca-32a9ea7a588mr25230991fa.35.1748919029295; Mon, 02 Jun 2025
 19:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 3 Jun 2025 10:50:12 +0800
X-Gm-Features: AX0GCFtbaHjwfuzfx_KG05VMGlfne3pn_jA4ltfzh8puNL65xaGhevHPdcFGMLQ
Message-ID: <CAMgjq7AdJbeVTPfAY3P735hnNoNOLYLj431igMcOXh=0SKetKA@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:22=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well tryin=
g
> to avoid get_maintainers.pl listing only Andrew and the mailing list for
> mm files - establish a swap memory management section and add relevant
> maintainers/reviewers.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE:
>
> I have taken a look at recent work on the swap and chosen a list of peopl=
e
> who seem to be regular and recent contributors/reviewers.
>
> Please let me know if I missed anybody, or if anybody doesn't wish to be
> added here.
>
> I also realise we have a bunch of non-swap stuff living in some of these
> files - we will have to address this separately :)
>
> Thanks!
>
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e66460861bdf..3386272f6bf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15674,6 +15674,25 @@ S:     Maintained
>  F:     include/linux/secretmem.h
>  F:     mm/secretmem.c
>
> +MEMORY MANAGEMENT - SWAP
> +M:     Andrew Morton <akpm@linux-foundation.org>
> +R:     Yu Zhao <yuzhao@google.com>
> +R:     Kemeng Shi <shikemeng@huaweicloud.com>
> +R:     Kairui Song <kasong@tencent.com>

Glad to help review swap related codes, thanks!

Acked-by: Kairui Song <kasong@tencent.com>

> +R:     Nhat Pham <nphamcs@gmail.com>
> +R:     Baoquan He <bhe@redhat.com>
> +R:     Barry Song <baohua@kernel.org>
> +R:     Chris Li <chrisl@kernel.org>
> +L:     linux-mm@kvack.org
> +S:     Maintained
> +F:     include/linux/swap.h
> +F:     include/linux/swapfile.h
> +F:     include/linux/swapops.h
> +F:     mm/swap.c
> +F:     mm/swap.h
> +F:     mm/swap_state.c
> +F:     mm/swapfile.c
> +
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:     Andrew Morton <akpm@linux-foundation.org>
>  M:     David Hildenbrand <david@redhat.com>
> --
> 2.49.0
>
