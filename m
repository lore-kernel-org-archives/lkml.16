Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB321FF35
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748982600; cv=none; b=ld3ZlaXrpLMApuFxLA+Fpt1BcJZIvyoXLM+oYUQwVzHUGXj75cQEbteoSE4/Xg9iR2hmSxAa7w6awms29cYHB4J0bB2HvHMXhgqBr6MsV34yb+vdgUTZ7AqrEM96nsljJqiafcJ9O44oEfeLQj92XF3p8U1ozKVlzFG8lmQ0q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748982600; c=relaxed/simple;
	bh=lJN6dFnPwvAsCXqs/DwxHn6cDCR/mYF4CQsaCmHofWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HA72DC0vSsNC4LTIA6ta0oq+l9N20y+yoItCR5kyCLiHw1wTQ+r7CBJj+aK6CmXGLwrWPeWeEvv9qQYjcujL9jFzoU1TTdsOI93baeoXjkdU/8I9gDNRN1o4cYd9ZNtgL8E8bPd/Pa2sIzgsh/jgnMzW7Ig/dDKHOfQgYMNj17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlDbGiWh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlDbGiWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E90C4AF0B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748982600;
	bh=lJN6dFnPwvAsCXqs/DwxHn6cDCR/mYF4CQsaCmHofWU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZlDbGiWhqqz0eNnJLFfxZIvSfzksg0EsaeboJ48QfPXT3SB7Hk3g/Th1Y7+XZaPEO
	 ielIxG9Xs5mrNMqDBhuJysd/DvHUeCG3OjPUqHZ2XunizW3pJvdhNlEe6erZDF3aBv
	 7Cm+vA7RK4Zc5M+fgHCF/Cs/Pe+lOPTTjkx/BGqi/6CupnaxoSvJjfrQL5yF4oIaEj
	 HOV6ttmiB+X9InLZ3Af4RNbfSdJSuiYxOmBDGZ8XvG9WehUFPO74J00BFshxnM3hkW
	 HrS7pE2uKd0ZP9I1bxYXErsrjmf9atvhlWaGATFLXj+Pf1x0qXWb+NqTwHiH9gyG5u
	 ZL9PA8h5jVSbA==
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso18415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTmlyYuBL9VzX2r9JwPxuGs8GQD+ek7kVOcE9lmFbhnA8Qu+Y26zxfx1TWLH0LH2AT2fpVd6F7fQ6q4i4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3YEdZ9c6jcYy3R7W64cZCC6S492iGXcgTbhbYTRiJjVNuIUZd
	Lktllh8VBcUaad+/FLVylIGl8KrKL8e1wPh3ITcTiVQB7zOMir3+3WPhkbUmzLUJQ6eTWoRaDwx
	SBGCKVURkY2zFycOckIO3BfSpRwBAoJZZRzYDKbbx
X-Google-Smtp-Source: AGHT+IFR3sZXOsxNNR56UzDSGTdJlQJ6ostpE0abErgDV8yPFvzKeriHvW7gefSn7TxOQfvsoYtQ8szwEvk8dWai7Bo=
X-Received: by 2002:a05:600c:8116:b0:43b:b106:bb1c with SMTP id
 5b1f17b1804b1-451f099beb9mr72845e9.0.1748982598780; Tue, 03 Jun 2025 13:29:58
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 3 Jun 2025 13:29:47 -0700
X-Gmail-Original-Message-ID: <CAF8kJuOsUZDNmcNKYLNyCtLMrG-aWCHwkMPpZy=S3XSqKqy2ow@mail.gmail.com>
X-Gm-Features: AX0GCFvb3op8UZ16tmGgtrxQpF4qOvJwVrmxWdPyLMvSGGIvL1zGqrr6WCaTGrk
Message-ID: <CAF8kJuOsUZDNmcNKYLNyCtLMrG-aWCHwkMPpZy=S3XSqKqy2ow@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kairui Song <kasong@tencent.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:20=E2=80=AFAM Lorenzo Stoakes
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
> +R:     Chris Li <chrisl@kernel.org>

Thanks for adding me. I am happy to review the swap related code.

Acked-by: Chris Li <chrisl@kernel.org>

Chris


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
