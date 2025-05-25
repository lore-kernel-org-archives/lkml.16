Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF1A29
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748192731; cv=none; b=OcqqO0fYG67aWxFYeAyahfBAXGM8+rqr6YYkELGbVXVLCZx31vSdnsu9W3oCYqeuxivKa6M2uVTX4mjhSEbH9GDqVG217qGkx+GagxnRPsqmug4Y1e5wq3FWtNNaoqMAh7Sbcl03RoGlqM71GmgbY5Bmd9RjymA2f8G4XnqOwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748192731; c=relaxed/simple;
	bh=eb+nXstAdErMbNVg2RYJ9um1z2KftQc9yOrETFLQxSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T43L8GslxpkB6CurdCRUSW3VRVDM3YFZSViugr8K78WxJNZyZRZ3LD52c2cLJtUw9Nkw9S3f6elh5vProw9bUPSZPXOfC6iXJujzkmpedJymQqcBIeiAhY9jbkJUPZSvJ7XnZzqqDKlwwOlgGZZefdY7SAJA08KERf0WfeY/QrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgXBpD9O; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgXBpD9O"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-31062172698so14307641fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748192728; x=1748797528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+MfSMNrhNlLP1WSYirVqpAIv2MNb4VocAlZZ/In95A=;
        b=FgXBpD9OnCGbCRWqHQJ5k3f9HwxCrowkyVsxd//i5eaXl5yhJ/IrlAEO0cafdaOy94
         k7/Q+LTFygAlPkAWqPHAbSuBh7R5/TC0JlYA4HPxbZRQATVedsioiSjv+KP1f98gvhtt
         ub+4q9Brq7mPKB09k/Mxg8ivtxfUd2xWbRTCl3MifQodjSTOpNhhdFE9kEMQZFKItIRh
         5AiZgOxLSL81KLczBgPk1B9iqr/hreuNgwb+0iSIHYIpi5Xq+leVA/BA6MqEBAxJ55Yr
         aa82Vyp/nnRcwocXxoMCXwKDR0BERTsGte1QEsvQJsNtMMwL0bA5/wxqqwGYY6UkolFL
         fXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748192728; x=1748797528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+MfSMNrhNlLP1WSYirVqpAIv2MNb4VocAlZZ/In95A=;
        b=Tgs5QhxqWj4YO+4d8bFc4eLFaNLp/Wn6bbUM8HoB5YOqpb/UaErgVMC3CsdivX1kfp
         /Z7Dts60IDynRefPlJ9yftcQyXOInmKjR3UoV141G11Tr52aTg0781OPfQFIcTRbhfEh
         KoFeHiblMzAufiARy1YVGVG019dS9LMobiuOpxzNjUzFy22gG68DRQREjKcqCXndjYLa
         KPf6G4ygf7w/TtlfFCUmtA7aDAVrFfH/Dq3X7udepf9z/9vj/VGk/BiPwDA46cVUkYEm
         23IId8x08kEurmSVqtBPOevsMX6jTW9lFio56vGZm1ZRjrr6wRXDl0igLGpkMArITxFN
         xJyg==
X-Forwarded-Encrypted: i=1; AJvYcCWBgO9z7CKnVWMDuoHVAyElw2iR8QfcrSsp9VZLMNPj2TWJH98Us5cl7dAhaa8Vjx+4rW5YfcdPWf4M6h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/RVCCKJsdh+pmAu8+vhOrdavcMPQo3Hz7EkspRWrF/M+fTiv
	CXlyvd2pgErfW1Y3cTnPZuoGiqgyaPGt4Mdfe/ugOVJVyYBP2jtEalJTb0sIgWwUqOyAZs1+5Cw
	ZiPrv6b/yVoRcYX/7FOY82AN6Q9COO+k=
X-Gm-Gg: ASbGncvqum+dJl5JMqiwII2p8M1B3PrJyNcmxMdwMB67+mdmoPUSyDfj8aZZz0uacFu
	COYUq+bxB6BEZzQUMjeIeBhGKWbCJ1PHvYsZ9h1ob/ejnHwxYUuDAa1j1XstzOcqusHx0f32GAH
	VXMsVHE2hcvtu1fCqmCUsU/zfDEdehoLHQ
X-Google-Smtp-Source: AGHT+IH9QHwsiG/ZrFzq/XHsMtKha6acNdy3B0v+jXhvL1duuHwN6uPVX1AfjbhmBKx05HSISnLK/ASEylj8z5YHFe0=
X-Received: by 2002:a05:651c:198d:b0:329:17b0:f45c with SMTP id
 38308e7fff4ca-3295badab0cmr19062641fa.29.1748192727311; Sun, 25 May 2025
 10:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522122554.12209-1-shikemeng@huaweicloud.com> <20250522122554.12209-5-shikemeng@huaweicloud.com>
In-Reply-To: <20250522122554.12209-5-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 May 2025 01:05:07 +0800
X-Gm-Features: AX0GCFs-YwPHykSN0mFdg3ysDg1OoLUVF-2jMtGLhl8BnRxZ_1WtUCwIg3JU8b4
Message-ID: <CAMgjq7Ann=NwW7pQXgZtkjQT4Yujvcx0qS6ihH4T__QUUberww@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: swap: remove stale comment stale comment in cluster_alloc_swap_entry()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:32=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.=
com> wrote:
>
> As cluster_next_cpu was already dropped, the associated comment is stale
> now.
>
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 63ab9f14b2c6..8525515fb06c 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -956,9 +956,8 @@ static unsigned long cluster_alloc_swap_entry(struct =
swap_info_struct *si, int o
>         }
>
>         /*
> -        * We don't have free cluster but have some clusters in
> -        * discarding, do discard now and reclaim them, then
> -        * reread cluster_next_cpu since we dropped si->lock
> +        * We don't have free cluster but have some clusters in discardin=
g,
> +        * do discard now and reclaim them.
>          */
>         if ((si->flags & SWP_PAGE_DISCARD) && swap_do_scheduled_discard(s=
i))
>                 goto new_cluster;
> --
> 2.30.0
>

Nice.

Reviewed-by: Kairui Song <kasong@tencent.com>
