Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E419B3EC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959179; cv=none; b=tYJY6wCUGDP6dxsbMzlZarh2V9NQ2dShrHYUHMx5Qv13kOQpwtK9pEyFpJZ7q9wSwRYtzSSfvgmKT8avsR6Meba/3SMpQNOeHils6qc046DLokAMEDioU+7Gq8gDhsSJfrZYKj3Yv3JZPMlyQ15ynRdSfAEQYYn5fa4uE0Vvf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959179; c=relaxed/simple;
	bh=1J7sGIDeRRuq08yov7Aec49VvjrOnRiL9NKJmEA7bys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtAHBLXhH7aWDwi07qO0EIZx90voEqsRCkK7p1MWO07gpUZAgudhtuQzhlcxrw59QhZw3iCraN+sCvKDOn3bjjWbqBNbk5eEmTLROIfnFiS5gjHRWX3yTbzbS+Acf35vQwsQSzSadpd7xiikXeC0qVgeBiuhCcCu1wlrr9kND00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zw4uJnFO; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zw4uJnFO"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a7f5abac0aso27551cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959177; x=1751563977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZh1dmf/mcdWd+gaxLlwslIiT72mzKcB2kWBA/Uelgs=;
        b=zw4uJnFO5mgu4KvC+wJusuEmw4DuHPLMMrDXZG0mHPYzyKFuRSCGQNEkG9JmWO1D30
         fEPoIWctVgmSOR5KS6T+crAZGX01XY8rP0pAKPDHIBUtbmNGMK8UT7xi91eLR+8TTQRW
         gjleEpKmwvKp6Ro8cSQk/AjciCzdtj+tLhqnLkbToohb9pIlrx7WfwAflXwy9Dm6d11j
         ZXwjUdLoNXSZT5JY2mkFzwwhs5bJYo1zz4QpgvxrTjJKcaesuZrAFQEGM8Ao9lawr/WB
         NF1YkgVDfIgPsmeY9o3KYGh0SHI9f/1+0QFlQNZSh1GUIdQ1FAFQMFn8JvxvtvCst2gU
         smMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959177; x=1751563977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZh1dmf/mcdWd+gaxLlwslIiT72mzKcB2kWBA/Uelgs=;
        b=VRBo350hM2TwqD0arl419iXo7pbM2UjMtJDbzPbagHBeXZmfx4kak08rf6jQlrtGGY
         uN+nfzjhsS6St73AwtT6NZWRdamh12mq/rJBvWoergi/y+SrwtMXZR0gjnOI77cMIBGw
         IB8sJ2VonvUNs3H8ozeTIPHv6FxpeK+MAFlwsQlLMsSiBmOkwQFmnUY32DlxotChGGsi
         jkAgRQtjEMvsGwqSHqBSnUTwXGoLck7vNOvR+yeQGPesJBr6dcTjZs34LdTn3pYpYhY+
         WKZK1e3B0b38MVAX7g+OoEFFdgrYAptrXXB35UKTbt2HXHf2Nu/bhEyJBSqZplMidyTH
         twWQ==
X-Gm-Message-State: AOJu0YzSZ+foQ6nle49/DN6byYK16etM959zHt/m2ZDHTzra1ez1gi1Y
	Vs52r4gX2s4+cl7/xdZzLpamsy4VA1tKeZVMgxx5YS+NT0A4gcxRh5BW2rSsLAYT30M5bFNuHcT
	ubvdtAoGB7TUFy4OKDrZCA2eV24IP4eJdWiDa9CRY
X-Gm-Gg: ASbGncusaJTEiMN9o8E5yOabWq9G0cO8aRzBiUOLus4DSBuGeyNit8WzDu4HN9NtsUQ
	cvxVIsx5gBcEpZ53Q5+9E+L5nDZh9VJSRGELIX8oJ6zNSHwUuAEnFfj6NZ2UUd1/0GA8L5zOdSb
	zVQ/iA4voQEQAkwCaeJwP6ghG2E3WfqxBo+BGSlmgqTUlFlkctNy6PCUlVK9f2fTsg20iu
X-Google-Smtp-Source: AGHT+IGmqJYRWpHfBs4knSYJUFVbh1DAaRw+ESFOCzSooRHccflCMCRz1LdjC7qSsxMz153KQSQCp/XS2qj8YR06dWE=
X-Received: by 2002:a05:622a:8350:b0:471:f34d:1d83 with SMTP id
 d75a77b69052e-4a7fc92afa7mr486231cf.7.1750959176797; Thu, 26 Jun 2025
 10:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620150058.1729489-1-peterx@redhat.com>
In-Reply-To: <20250620150058.1729489-1-peterx@redhat.com>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 26 Jun 2025 10:32:20 -0700
X-Gm-Features: Ac12FXx7563rh1P_h_xeJbXZuYH1OOwammAUarvbQ_QgtPaZvjNtcCFVbDfAWaU
Message-ID: <CAJHvVchZHQCQnO48Q3OhTPYncZdXSoBc1CK-CHz_XAOO+CL9gA@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: Reduce uffd-unit-test poison test to minimum
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ujwal Kundur <ujwal.kundur@gmail.com>, 
	David Hildenbrand <david@redhat.com>, shuah@kernel.org, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 8:01=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> The test will still generate quite some unwanted MCE error messages to
> syslog.  There was old proposal ratelimiting the MCE messages from kernel=
,
> but that has risk of hiding real useful information on production systems=
.
>
> We can at least reduce the test to minimum to not over-pollute dmesg,
> however trying to not lose its coverage too much.
>
> Cc: Axel Rasmussen <axelrasmussen@google.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Besides a small nitpick you can take:

Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>

Making the functional tests small makes sense to me, especially for
poisoning. Only reason to use a huge number of pages is if we're
trying to stress racy bugs or so, but really for that you'd want even
more pages / more threads / run for a longer time. It makes sense to
separate that use case out / maybe not run it by default, and leave
the functional tests small + fast.

> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing=
/selftests/mm/uffd-unit-tests.c
> index c73fd5d455c8..39b3fd1b7bf2 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -1027,6 +1027,9 @@ static void uffd_poison_handle_fault(
>                 do_uffdio_poison(uffd, offset);
>  }
>
> +/* Make sure to cover odd/even, and minimum duplications */
> +#define  UFFD_POISON_TEST_NPAGES  4
> +
>  static void uffd_poison_test(uffd_test_args_t *targs)
>  {
>         pthread_t uffd_mon;
> @@ -1034,12 +1037,17 @@ static void uffd_poison_test(uffd_test_args_t *ta=
rgs)
>         struct uffd_args args =3D { 0 };
>         struct sigaction act =3D { 0 };
>         unsigned long nr_sigbus =3D 0;
> -       unsigned long nr;
> +       unsigned long nr, poison_pages =3D UFFD_POISON_TEST_NPAGES;
> +
> +       if (nr_pages < poison_pages) {
> +               uffd_test_skip("Too less pages for POISON test");

I think "Too few pages for POISON test" is more grammatically correct.

> +               return;
> +       }
>
>         fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
>
> -       uffd_register_poison(uffd, area_dst, nr_pages * page_size);
> -       memset(area_src, 0, nr_pages * page_size);
> +       uffd_register_poison(uffd, area_dst, poison_pages * page_size);
> +       memset(area_src, 0, poison_pages * page_size);
>
>         args.handle_fault =3D uffd_poison_handle_fault;
>         if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
> @@ -1051,7 +1059,7 @@ static void uffd_poison_test(uffd_test_args_t *targ=
s)
>         if (sigaction(SIGBUS, &act, 0))
>                 err("sigaction");
>
> -       for (nr =3D 0; nr < nr_pages; ++nr) {
> +       for (nr =3D 0; nr < poison_pages; ++nr) {
>                 unsigned long offset =3D nr * page_size;
>                 const char *bytes =3D (const char *) area_dst + offset;
>                 const char *i;
> @@ -1078,9 +1086,9 @@ static void uffd_poison_test(uffd_test_args_t *targ=
s)
>         if (pthread_join(uffd_mon, NULL))
>                 err("pthread_join()");
>
> -       if (nr_sigbus !=3D nr_pages / 2)
> +       if (nr_sigbus !=3D poison_pages / 2)
>                 err("expected to receive %lu SIGBUS, actually received %l=
u",
> -                   nr_pages / 2, nr_sigbus);
> +                   poison_pages / 2, nr_sigbus);
>
>         uffd_test_pass();
>  }
> --
> 2.49.0
>
