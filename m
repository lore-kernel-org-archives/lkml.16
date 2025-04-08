Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF92144A1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138630; cv=none; b=C0aHQ9tkrJZFg4U5ip/+FCyWzbqqXKwpCuWb55hRoj4GFCwNvECZu4PHkoMsESoi3B/7YkbTdz6xnWOZYgo1SqJHbNZCGvcrKNvG4EquDOmgs2usMpAQCjQ+QI+9FN7elXhg+F8NTH66q94kF3z+JODlxfKKriNhahDqcFxs0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138630; c=relaxed/simple;
	bh=rp5jD3q4rZS88djkYYbb2ghBEA29BZ0hsjO5d9CKDP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR3hD3sUvwxL5/h2Qtt9G+d3P0ypHwLB2in+pgHZCAF3dtY1rAYO5DV5aOo1yrMWOb0xNgb/0gkjnkjbK6JnCCg2jPmMDT4yVLzQDjv5+g1twEq+3WifXDbS70UCTOOu8pBtT7p0vFo8AIrS5e1BNvFLqkS06arD8VcftmTTGP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TqRnYFmN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TqRnYFmN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so1907a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744138627; x=1744743427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLaa90yrDkV7xLZUq6EjUv8t9y2xEvLaT+8lwKmnm74=;
        b=TqRnYFmNuOkGLfFjZxBTijIfh7SSYj3EqZDgiTVKvMf1L+mIM+kUVcstBXSO1OKB9U
         FlevHq+vqmpifQWiLWERCW7SW5mza89QiTsCKt9jhT96MtCfP+OCO/KDz+KeALRwxbpa
         ep65Y2tlPUSdhRbKNZX2t8OHLk7EzIeNC+oK1Yw12sRF6guM9yNVPGXZFTrEY+52nlGI
         02OH1/70YWcTHNZp85RqoPttgcK29WZ5DxD7ItiMEHTYwqktADKgWEtzpM6RgnLaLdb2
         X73mRPkQlzIRzWKK0HQR/+hB0Dt1kNg8KL9j31QEUxS0UdoEs1NNNmykEWEhIKM97Fqs
         YqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744138627; x=1744743427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLaa90yrDkV7xLZUq6EjUv8t9y2xEvLaT+8lwKmnm74=;
        b=k2WuEbgUi7NAKotUvv9Zv2b8bCf148L++7fGrk9MoDt2HkaFH70UeMjmDcb7uKyD2k
         UZ4luzX7zYqk25IVzK1lGCUDiGGkrgtdDEX/z+7RQXQY2l9TRxDxUtHQBm85IMhlENU4
         UuN4vBV1iJrZeP3P/3EZmIKJLA5Ha4qNNQ/nCwGWjqOddkfXKCOVCUEnHAktYqGcgu/w
         iRZpSwNWJT6AV0SxVOTEBROIZgEsqLKppGt0PMLglyJIDma3NX9bWwn/ddlGpWlaoT6R
         HxRWOmVenQx4RDb2hEAXIQ5LxIaxDJe+DZG9g4E5SvqNRzBMZt/KlQ4ohZLJXOS2A2Xx
         gq/w==
X-Forwarded-Encrypted: i=1; AJvYcCUZjVem9S21HpMRye0E4rGVG58+eS+fQOhW0MxkYOiDJd83QxRDer+J/oQ+lo8KxdXKLHe+AsLttbC94RI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtgsCMo/fVU8sPxPv0Nm+RnbGW8kQw3TmfMQd9PhozAdmqJ9q
	CP+yAkLi37gdEnYU0WziSzQp8NuK+aUeObF3p31FSOncWASmuAaaz4RFIJ1Ak48T/IhKrnx6TZx
	aNaZXcTG02/P69ZUSiR2iWZ9sE3R+VztAQHif
X-Gm-Gg: ASbGnctgJ9vzBHpXY4wMM/J8KIbVlxUnNEsqnAvg3zSZVmRUvLS4LxMVO4DK9On3epC
	ylMv9401cbSI3raNMiRRnS3F09ciTJkQrNWYwEOFeiKQwb5MtP0CpEIpscn4VpG3AkBqUlEhshe
	E+lZIgx3w7JAVGVQOiZO2avMez+3MVFmbk7+nQ0TQL3xaM65LwA7DUkQ==
X-Google-Smtp-Source: AGHT+IEOlDsX1GvkTmv+JmJ+VukreGJ4mzzIFroSnTi3rMy8aVua/8Ad4KVTlE9kwrlHhDBQot3C+gh85aDyqrz3QsY=
X-Received: by 2002:a05:6402:8c7:b0:5e5:c024:ec29 with SMTP id
 4fb4d7f45d1cf-5f2f6a70ac0mr13436a12.0.1744138626965; Tue, 08 Apr 2025
 11:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 8 Apr 2025 20:56:30 +0200
X-Gm-Features: ATxdqUG1UlcQA8CvGJ5GyCLj68MpkAd6R61gKJpccLq0l6x-kBU4x-vlbk2uE2A
Message-ID: <CAG48ez1duuiePx2pFnTuQK8WEEdKGM4AYCYjDb0XLpJBzNT1=A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:11=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> The madvise code straddles both VMA and page table manipulation. As a
> result, separate it out into its own section and add maintainers/reviewer=
s
> as appropriate.
>
> We additionally include the mman-common.h file as this contains the share=
d
> madvise flags and it is important we maintain this alongside madvise.c.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Jann Horn <jannh@google.com>

> +MEMORY MAPPING - MEMORY ADVICE
> +M:     Andrew Morton <akpm@linux-foundation.org>
> +M:     Liam R. Howlett <Liam.Howlett@oracle.com>
> +M:     Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +M:     David Hildenbrand <david@redhat.com>
> +R:     Vlastimil Babka <vbabka@suse.cz>
> +R:     Jann Horn <jannh@google.com>
> +S:     Maintained
> +W:     http://www.linux-mm.org
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:     include/uapi/asm-generic/mman-common.h
> +F:     mm/madvise.c

Is it intentional that this one, unlike "MEMORY MAPPING", has no
explicit "L: linux-mm@kvack.org" and relies on the inheritance from
the overall "MEMORY MANAGEMENT" entry for that?
