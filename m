Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF594400
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748900202; cv=none; b=Bia+5ItPz+91pum2Db2rnCDRiGDm5xaqh+uAtuDUssk96ji/YhcUiWbKDxz4VkFcCCZlAOfmdAu4Ba5qpTb0g0jBoQOzotK+A3q0X3ogFnqT94QzVk+rLvGNw04ZL4Hkl1g/d9LQBQeeq7bFErkEF8lkWLRy0v2QHRzivZ6AXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748900202; c=relaxed/simple;
	bh=qaObFCzEmkOopnvJyBsgsPOL9KZS3jOgNYZQL3ktBqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p47hKuGDD6LJY8etBnKO3DE+y1RmrgeCCIkhK3H/le+gyugWg12AD0mWFrXw57dkADM7zEnpA/GmdAwx9po7kFWiOASz8y6nVykVV+OhhHAUyjKhus1V3qqDJdPXfty9kjcpqWGu0Kl58IVMlV4bricD0wySMKi5TODQuqZjIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRbRcV1C; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRbRcV1C"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5307e208234so2659102e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748900199; x=1749504999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dr6dHBl/nlI98ji38RaPmAwZoqg5PWiKWngjRnF5kQ=;
        b=hRbRcV1CENzywxo4OVuj1+EKdiuFfE0F1g9O/qnUdaWIGYBDYx0/a3tSJKVyp2Q+jT
         M+yT1804Os8BkflhFiIULICMJAdVeXakd4aYssQoyu0VpWps0isAUlP/VFRaxMIKEug1
         rfBYt4eFRloBVW7otj2rPhEt0qx30bWZkn+rRo32pbUixMk9Tj81Q/v03lFT2kyJSDt1
         kKT8DaT4SE0vd+u+rNk00mNSyOdeYgJsBgK+kAlS0ObS09JZhMrn9cLMQ2ZCuy78WjWd
         WUe7IwFEYNhbLWuZTa4L2U8VtMOKK65UkAt6/tX5TuPClvqZjw4OEvRgvsvUjT3OXLZm
         0EJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900199; x=1749504999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dr6dHBl/nlI98ji38RaPmAwZoqg5PWiKWngjRnF5kQ=;
        b=wVYAFbjoudpuSvrw6nFwmr94PfpsXv+RUdXOZAiD4l7bxlG7KImO8XPPUotsjLA+LJ
         UeHI+xU4twmhYi93oFmtFSWvXAQN4jqUMaEu2+thqJR5T20GUuEBAXW8imbGAiD92ux/
         9WtiaBgbaX4d0zxUxfrKC1yxMtggHaQL0ONP9Hsz4wqFkgxZ4s/+9LexWIsWjcjQ4a5V
         HAnAhl3E5qi0oq8YT9gqYL6OtuSpM/BwRqNier4MES0r5xRFaTFUr1KpnFPRplgBUULi
         VPPGrxQ5wRjyUUfr/3t92adgEGTQzX8NegqNRiYZbiTh2U/aP2ko2zdQHh5Glj9R8pvV
         cQkA==
X-Forwarded-Encrypted: i=1; AJvYcCWM5qtNOXB3UwJKesCoSI4n2ff1s1LvWjpMq1hoRRTcf4MQ29bAiDOtoueQJBxRgG7wY/VEQ2p5PxzkQws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEBYHJ5xJz1MJDHW53RYrd2PXN55YkPP9igxCj2LXBiMjah8+
	vduR5/JvGg9cSwV4qjVavlolU27CA7jxQXK3hoZp+h8bvzmZGhNnUobvtH4c5fskwxD06EH3L87
	n6GB9bjLQ2v3c6zNg4PWysxLuNUdhVS4=
X-Gm-Gg: ASbGncvo4Wpr61fB3E6KiJi6u2+nz8eUW1C83TweDzQKGEJ1tEc3eza0G5NAvESkXYQ
	rJsqOTh/2b0D3x9BEmKXDSKeeTW6oL/jfypMlP1uozMLwxUX0vjbWHuwV56PKJfVYInBKZ9Comn
	TkMPhmYvWIs5SXLATHdoeAO8eaH/CSsDYPlw==
X-Google-Smtp-Source: AGHT+IEVyG+fjvwxDip9p7Gwq1JSG0Qc9lF5kRwYMp/RGG6rSCzG2xa3PtEy2BirOPXHhFN1hHzzPgv6Blxc3HWmm1Q=
X-Received: by 2002:a05:6122:8c0d:b0:530:71e7:37eb with SMTP id
 71dfb90a1353d-5308115f60bmr11496838e0c.10.1748900199097; Mon, 02 Jun 2025
 14:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 09:36:28 +1200
X-Gm-Features: AX0GCFuO-IpQNmms_HxWq9QdlH8yiR11c8aAXv_CoowwXpTAYGA7ik-ShXV1KNM
Message-ID: <CAGsJ_4w99uUf-MQ4oecbM2w8jwV4-3-WvjQrR1ojbL_wxvDLtw@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kairui Song <kasong@tencent.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Chris Li <chrisl@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:20=E2=80=AFAM Lorenzo Stoakes
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
> +R:     Nhat Pham <nphamcs@gmail.com>
> +R:     Baoquan He <bhe@redhat.com>
> +R:     Barry Song <baohua@kernel.org>

I'm happy to help review the swap code. Thanks!

Acked-by: Barry Song <baohua@kernel.org>

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

Thanks
Barry
