Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD665339A8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415057; cv=none; b=FFkaxjRw3sA1zjtPVyvi6rL/4ojA3bCBSH3uPAYXmpDYm+1r/IOAaEiWOTOCgXP/fLlEo7QHAMLS3uNHPfaeiIkQ5TGK+2/SjCglW9LUeozu04Ec3xK0lEp5Lw4YOaW/zS8fUnNYyR//jOBXBvAP4FGOmnylUd2vtaegzMbMvf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415057; c=relaxed/simple;
	bh=+f6xtCOr3qPNZXzy5wQc2bN9/T4ZRVTQ6UKQvq1tPuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVTtwitBPeKT3nASYGweCYsz4IeJR3OcxsBN9sCOETBRB+VFHAkKit4JwxQg2k/xg5wQ6/0nhwBwXa1XPCldvbegvEoJyirrmsZb/2CKfT5M73agHtnMIomw6dBBIg/KHYoX5t6hdubdBHr++GKJ/O3hffQIqfeKX67hg7paGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uh0FXmMG; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uh0FXmMG"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-401e77e5443so204262b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415054; x=1746019854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4L5TNO4YtE2jxiFN/yCn5WrVeYAQNfukr6iFB6Lfgxc=;
        b=uh0FXmMGxomEzIxQfjQR29eGX2ln4zjh7Jl0MrwBHihx/9CLM5DdV0jHZdI7ULFzPY
         zr25DKoO3+r+nbQziWkZLrjf9l9Bp7NPc86+sR2W3+pFTqnoxrgToHXy1f3+QDqkuwMr
         Xb0cWwWBjr/hVEWXv6HNZ4RmZ/a+V6jAdEvsv7V9s7q0WlvhTvVjLlhs+oBnrBzRfKFt
         pZr68UrXFJbg4PI202lXDO04qXZBfXLLAXan66PvqD9oJlDzaIGh8aSPlYXPovRrrIFP
         ygT1LriZVD4CgQUy/3rmbQLMnK2QSItUFdz2MOWYy8mM5i6pNfxZYyLDr1/hG/E9zw6A
         hqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415054; x=1746019854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L5TNO4YtE2jxiFN/yCn5WrVeYAQNfukr6iFB6Lfgxc=;
        b=oCqbV8KbUeQ/2UINEK01QM9f7ULn/KNoZh3eqNXD9VbBnNQoj8iWJfyYrebNtrcy5J
         NXKftgXlektsdScq3/zCORTyrFizpAtResaSkrkdNp9CV0NqAKPkrDBo79GTH/lPbSS2
         MPIC2Iy7jECPG0rB22d65Y72aFieNVDKEMmTkASc5dlRb5qj0iXmAVIaUy0Erkt8AKoT
         vaSuetOmqtQJIA7z/b+RAd+AI/qR5qsUOfgFTNQ5sf/Auj4rS6oioLzu4H44gFP+3o6V
         hZXf+bMO0cUgNbbwQF+5fVxuuMzAP1pskbiOuG8rTb7XwH9NvQAQvRTwcRG7ukcZ1mfR
         uDaw==
X-Forwarded-Encrypted: i=1; AJvYcCVSfogLfcAIJophDbeqI4Poq7NIISt7Nvgc/BOZQrlDKSZaedaQpQZxP92HnlBhrhYAn44nH5gZZOEjIw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNRsVNoJtYdwQzk2Z7KxuG8dd/XdzCCJl7jzlEdy4dap5R4Fa
	YP+imaR2ZnNpdvYAhFiVvYAiQqtVATEIpvOvRHupcvOjt/bTccZXMlvjrQ4pjXzUX3rnv0+0Q0n
	24cRZvbj4qhrrVC9q/GuUVg/05YAH6k8ziN72
X-Gm-Gg: ASbGncuSZw8JPG2D90pn5X+zV86qL3xNiEekTFGyGf0SrBSzYWZCI4SYHfOD3+cyFiO
	r2JKpDagAij+1s+E+Dv2n4+V1IXf86gvj7Ofpio8AzD1/VUQfgImPV1mJzTWEQjukuir/V2DRZ5
	Vt3K5T8K245XXRhN1bxptJqxu9aNhAfRbu6tsT/QaozR4LH7Ozj+Y=
X-Google-Smtp-Source: AGHT+IFJ8QPjuWBxnpaVUx/3DhaUd/royzzBXai7qs+Wlr6MWAT8hRsDyWaIvUr5041uAWksA00B1VIsPM44idkA76k=
X-Received: by 2002:a05:6808:3389:b0:401:e949:6374 with SMTP id
 5614622812f47-401e94965eamr224040b6e.16.1745415054538; Wed, 23 Apr 2025
 06:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-6-glider@google.com>
In-Reply-To: <20250416085446.480069-6-glider@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 23 Apr 2025 15:30:18 +0200
X-Gm-Features: ATxdqUEd4B89CtgCh-IpkJ7kUq5K69XFf4rQc1EYsavp22XzPfItwK0vxopKh40
Message-ID: <CAG_fn=VfLhCNdU7Yu5D_nWuaxF7nU=YVirK2aTPM6h9o2wsy5A@mail.gmail.com>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

>  void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
>  {
> -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> -               return;
> +       u32 pc_index;
> +       enum kcov_mode mode = get_kcov_mode(current);
>
> -       sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> -                                      current->kcov_state.s.trace_size,
> -                                      canonicalize_ip(_RET_IP_));
> +       switch (mode) {
> +       case KCOV_MODE_TRACE_UNIQUE_PC:
> +               pc_index = READ_ONCE(*guard);
> +               if (unlikely(!pc_index))
> +                       pc_index = init_pc_guard(guard);
> +
> +               /*
> +                * Use the bitmap for coverage deduplication. We assume both
> +                * s.bitmap and s.trace are non-NULL.
> +                */
> +               if (likely(pc_index < current->kcov_state.s.bitmap_size))
> +                       if (test_and_set_bit(pc_index,

A promising improvement would be removing the LOCK prefix here by
changing test_and_set_bit() to __test_and_set_bit().

> +                                            current->kcov_state.s.bitmap))
> +                               return;
> +               /* If the PC is new, write it to the trace. */
> +               fallthrough;
> +       case KCOV_MODE_TRACE_PC:
> +               sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> +                                              current->kcov_state.s.trace_size,
> +                                              canonicalize_ip(_RET_IP_));
> +               break;
> +       default:
> +               return;
> +       }
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
