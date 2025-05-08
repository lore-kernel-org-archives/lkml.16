Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB1275857
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718076; cv=none; b=IqEu30AVS2fJBX1uxgUMUNdoR8fy5jLbt8gYaGMgQSItZql9mHc5nvsGiUNZcz5iOMIFwe9pRNMFVjf8GxFS6o3dfXeKuNvYbpcPWr9n3tzXc8YNABIcmhVxMJsQIDDrjACP4TRRgg68BEV4v0H+HY2ysUB/EDeQiD5U3WShaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718076; c=relaxed/simple;
	bh=TQjkuNhTyaPrRM7L+GvGKFtE32eh9+Qb4zmufN94tno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMIHTHlL3oSbaW1WSYkS742XEBZ0Lz9Iyn0ZM/eCzGH5Ah6fVPMfaCV9UkON6rast8Q5bLjTt1+1zsh0n7dm5uVzjE+kC7LEA6e8Sgi5mwTuaBO8S3aYtSEFvfeuw0P6arUyNc9mZ4MxgARvniTjeOQO8kiLTH4DHRZWWVhmhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N6YQsPrV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N6YQsPrV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso12563a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746718073; x=1747322873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQjkuNhTyaPrRM7L+GvGKFtE32eh9+Qb4zmufN94tno=;
        b=N6YQsPrVEnx0QsaNr0dKY7fRYWCJ8vGPUHpXWU1Wbg1MObi8HOBFZ5W7At6GY3BRr0
         Ma9DsTuOzZSBPLwzTWoHlC3s5o30Ish3jPoeoMrk9olXGIkONmYclFFAkddG8YQP+fdI
         /ULpZ0mDR3oGBbC21hp7LeqgrBJzOW2URFxSd0Z00kHiQ2z8cQ0iMzxJJ4gd8VhD8cnM
         hcERMb++TxvTjsGWvLuu1FJcUtiDV6/Cplso+C8cWszDGrcoDZPgWcmBMiZNhzuAgVCI
         kxOF6BEOG8ciMbl3j5MAl35X5EszyNLkw7L0LIxZwFhdjCn3Zipis883cM3kNVPtfX6W
         JhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718073; x=1747322873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQjkuNhTyaPrRM7L+GvGKFtE32eh9+Qb4zmufN94tno=;
        b=hoflv1oyxMwT7NKXUmaBRxfRIy83kI2iGTS8F8HHVDxuh1w+o+b9wvNIPWvUsZuirc
         tJB66SyyEqosQYVeFo3oDwITjfwmDjMX1MXZnu6ch80dTncTAVzg6MfWc1IMvaYdAt11
         QnYZqaVPCCcB0+BUaTudi3cvbO72BfnH/yiHCeJ5B29FZJQ+NhpePIR5l2w+ctZxZdd4
         19mF9GGvnex4YwFLlsMNtb6Zj+xuV4d4jLll7BJ20ioCRQbuggQaAnMEEmMT28X9fJaV
         WqC6QaUcXzR/MpYgqoKJhpje4wZDtZKyxDhHI3l7mqdIv/gLWE96kWjxKrcGJ+SrQLLq
         VrMg==
X-Forwarded-Encrypted: i=1; AJvYcCWayxwEbDZLixQe/kkiZUBZiZ1ZGetthouYMLSV0TLvXbzvHEbVgiKudeKp+scUQKoxSiAgWq6tfY/I4xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV8fiavuKsK4m830uIwb603eKsPkgqGAxdWFrCv0EEseFaowG6
	Tg+wualcqyp6uUHwBCwnAj3QnofE3y3PSLawKym52iy+zwgqaOjUQnI0L/JJ6IJICWBGkwwpx2X
	nebKx9mhuxoQx9CN+GDvItwQlIeKt4W2fYycZ
X-Gm-Gg: ASbGncuRV9yJuQdB+l1lgjbqD4Jd0Rm7xEWUzC7bscGrYJbm+lKxiC9ry3A3Wh6f/Wb
	iC0nwAaT+gMbPOzLjEnGm/1aCm1H4HCjnGO4QXoqZRBR9fh1wpy7jVqT9z7jqOztt/frxCk6Xgk
	KTAZn8vRadPi3jH1MNLXVWTg==
X-Google-Smtp-Source: AGHT+IE5n+RYFL33clCtYhMDflCfi8b/wULONOuhv9hsef7TFhR/zEdhdJST2xupcNv0DfmIPfytbRz9d2S6+NTJu+U=
X-Received: by 2002:a05:6402:340e:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5fc6db9ae62mr87747a12.5.1746718072728; Thu, 08 May 2025
 08:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508090735.39756-1-21cnbao@gmail.com> <aBzMf6H9Lad6CaFQ@x1.local>
In-Reply-To: <aBzMf6H9Lad6CaFQ@x1.local>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Thu, 8 May 2025 08:27:39 -0700
X-Gm-Features: ATxdqUEEUE1zAqS3YeD7cRcnIVxj-q-7a3F2R2n84xjSXGLUSt2BDd1V-vHoAIk
Message-ID: <CA+EESO7J189B=rrM93NLo_22XirEkp16ttd+Ys2ShqNxKvZcbA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
To: Peter Xu <peterx@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Suren Baghdasaryan <surenb@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Barry for fixing this.

On Thu, May 8, 2025 at 8:24=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, May 08, 2025 at 09:07:35PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > As David pointed out, what truly matters for mremap and userfaultfd
> > move operations is the soft dirty bit. The current comment and
> > implementation=E2=80=94which always sets the dirty bit for present PTEs
> > and fails to set the soft dirty bit for swap PTEs=E2=80=94are incorrect=
.

Can you please briefly describe the consequences of not setting the
soft-dirty bit? I'm wondering if it needs to be backported as a fix?

> > This patch updates the behavior to correctly set the soft dirty bit
> > for both present and swap PTEs in accordance with mremap.
> >
> > Reported-by: David Hildenbrand <david@redhat.com>
> > Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950af=
b9afcc@redhat.com/
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>
