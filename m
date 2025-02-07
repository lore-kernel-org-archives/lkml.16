Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BA2E414
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892317; cv=none; b=izzRDjjtVt109PeFFBg5aE+anGE9SxgOqHIRJNfmQSSD6TIgfdb3++P55GmMpuMP2FqDCaAT1tUIQsbYUm0Y7CovUljhwZzy9rKL8KCLZWwgyPCg7kMZe50BD6movKufedYjkrJrQfmbYDKeSuIFHgHgAptZwX2pUzDqH2nn780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892317; c=relaxed/simple;
	bh=8QxwNQ5F3lUg16Ouo7FY/KDRymPfqKZizz8JYgXMkC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzEZLRdtuQZTGITuyI3MJOQWUDWhHW0y0e2U8JTmXJJCnMD3B9R3BEEwwPT1ZAYNYwxgrMJp75N05t5iKrfCU4C3JDWO/KXw+qsHKNsEoCe3ZN2431TCoku39eFDPQRCtC6dXi6jFrFWyzG+7kqWThYfUYckyNudVh9YeSS5/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rKWpDtsD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rKWpDtsD"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 33CC03F212
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892304;
	bh=8nlGza3bUYWolDa4VjQUob3ri6m4nok96qBzN8kMux8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rKWpDtsD3Hr581E4XMceDzEu6JqTGqlMYIHp/sQgUwOGomhrf0BxMlcAny3K3FY5v
	 +CLBsWHEEiFaXYdXClh4rhrhDSvc739iOhYur1nIlrxJ0uVXlWH64eeFPW+mM3sTsY
	 c8aTwxPLgNWv7Nse4NYzrplUNPDw57dvaAjbc9VRdSFwQyhBO1S3YQjHg7YSUX0r6I
	 ZzYrnNfafZxm0nKLYXqnB9kdKEv60mm0gt1DKNP7MsR0p2abIlNbhh0s1+LghKQaAt
	 YHEq6MlXPGRndzS+FWOjj7b63I4Y3J6XgB25W3K0SxAAg6GL5PQi6N0UxpOd0ZZWt0
	 7ncHzKyLVTKEg==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab6d45223a0so110594166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892303; x=1739497103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nlGza3bUYWolDa4VjQUob3ri6m4nok96qBzN8kMux8=;
        b=sPoM/omVC4FthDVTBlTOa6jEX4pQHbGu5Q+kbKUnH1ln4Vd1XKib2jEyDJO/Dd86Y+
         BJBPJy7xb8Yvh2V4RRTVoiZBab3UL6Oj5UAxgQ2zzd6GKRjjh+pLLHF5sSIgQ8niITCr
         8huwtsof8nNVj/Lisp99RcY8BG0o6gy+J7tZN+VhHyL+LjHgbcCyi0S+ukfBAm/mt4Pp
         S/WUzoyJ3EH6+P65Q8ATHcnu1YRvwyqj/dgfp0UUzm0MglhQjayi4STMEGkdAKormsYM
         kaxX08SCCnowIf9tQvD2hbmNo4jxHEkvuKojfEfdNse9bvZ6cT5dU7r1tKViQqLKTtQ0
         bPGw==
X-Forwarded-Encrypted: i=1; AJvYcCUHDe6OhLmMgFqdlLjDeHmS3ixuRdYAIdOKnyxD2LZ3jaG7hKAjg5A0Zs7F+t2uCJpCTHPOoL4HRx8/bVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaohJMsWYY3WVdOIqnqw2019TPMrO3+Q5cQoIKKGvVSOqp7nQm
	9wTaMUVIXOpUcsAImJiGm91IUkAa+qbKUGQGk1pXUNS78/HUskwu3pqjiff9HvFVMopoCtFNoa5
	bNlPZUNWryPtEz1WvECLtgOk2Bm7CaOW2Zg+V+lLoSzO5QqnWUDO4Pn/3ouwicoQ+qpDXEWH4UN
	NQfAomM6Srt/Xs6KYfl/l9hWqB4h7vJL3DoDwGa+NxC8wqCVziXt+j
X-Gm-Gg: ASbGncvoxe8Ai4TWaW6HjGbLRX4rQtAsn+r/xXKeoHKJ57+dV6hblIBHqMBjzYYss6w
	72CWmAMTQ+RWchZRnKgbB4JdWoorRvqe8dBk3UO/bhoKFOvpWrRIvs7gtnQ8f
X-Received: by 2002:a05:6402:3907:b0:5d0:d818:559d with SMTP id 4fb4d7f45d1cf-5de450026c2mr4564601a12.11.1738892303517;
        Thu, 06 Feb 2025 17:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOx1lEvrP1pDzXVIU2a3ICbv42xHzPCxIbHrelQHrmglKbu9LnpCmZmMYgVJ5/Xsp8QKtnYeoVXGszsUYrFIo=
X-Received: by 2002:a05:6402:3907:b0:5d0:d818:559d with SMTP id
 4fb4d7f45d1cf-5de450026c2mr4564572a12.11.1738892303237; Thu, 06 Feb 2025
 17:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205231728.2527186-1-alex.williamson@redhat.com> <20250205231728.2527186-2-alex.williamson@redhat.com>
In-Reply-To: <20250205231728.2527186-2-alex.williamson@redhat.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 6 Feb 2025 19:38:12 -0600
X-Gm-Features: AWEUYZmh01IaYWfQwXAr84y1vklWSet6KnJzeaENStmoiJRcweOokqw78vsFezE
Message-ID: <CAHTA-uZK_1A1tNa_GWzy010C32wN=6ePoAp0hGZ7FToRsyr4iA@mail.gmail.com>
Subject: Re: [PATCH 1/5] vfio/type1: Catch zero from pin_user_pages_remote()
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com, 
	clg@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Tested-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>



On Wed, Feb 5, 2025 at 5:18=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> pin_user_pages_remote() can currently return zero for invalid args
> or zero nr_pages, neither of which should ever happen.  However
> vaddr_get_pfns() indicates it should only ever return a positive
> value or -errno and there's a theoretical case where this can slip
> through and be unhandled by callers.  Therefore convert zero to
> -EFAULT.
>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_ty=
pe1.c
> index 50ebc9593c9d..119cf886d8c0 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -564,6 +564,8 @@ static int vaddr_get_pfns(struct mm_struct *mm, unsig=
ned long vaddr,
>         if (ret > 0) {
>                 *pfn =3D page_to_pfn(pages[0]);
>                 goto done;
> +       } else if (!ret) {
> +               ret =3D -EFAULT;
>         }
>
>         vaddr =3D untagged_addr_remote(mm, vaddr);
> --
> 2.47.1
>


--
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
