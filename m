Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988B221280
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883304; cv=none; b=OCSD7gtxl6otyBYZQ6ZLi/WpdDm9YbIZmvif5cEL4OHqauAiAdpL6qnM5T5khEPhiNaoSRLt9VoXODxu2Fph7j2ZQOSYLyH4ECTrAXtZDQhG5LBPHAKvzR3KfYsFcPD0c4Bg3WD/c8k+MiGJvVdKj3eIrL7dqsbMOosF6W8XkKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883304; c=relaxed/simple;
	bh=L8D2TISkdqcKXRbROXiQJWEn+Joymd9/2XOaqiZJLps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaZfgH2VbbFgWLvQjEpDz748GNR2U3RhTpxo7TrzUh7myUcgxZo/JzgJmr0/pwIJL5BU427mZTsh5SZ7O3+PH+I2TyhHT0W6IXhIGmNKEsb6GywdKEa9d+BpCX3hLl0qa93lEVIMhUfl6VB87YwtzbJ1xytl4w5b9G7Dlp/BLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4VF4g87; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4VF4g87"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6face43dfbfso46666306d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748883301; x=1749488101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7f/tGFuAIfvqKQSs61ntIFOWD9N9ElqEYirEyfjVhM=;
        b=b4VF4g87RzCwJ7OctQyUSLdNM4INL6wIvGs3+s0VWyHC6DLJMCExMOyHAxiOr4bABd
         QesVpLvLbWGKUT4pXfHGYu1vEJ2DMnqx5xnbF5hWs+pu1iZJNqmKHvgn6RDugqnUfbgF
         tM4rzxwe2ZsiF5eCjKl/8uwF4c7dEaQoxs9Sm2MI6xR3Y7ngFGnrB6KX3bGBGLr0E1bE
         oK8qKtYQKWy7YIxyDvsEsqyjjZrcqPgsqYteZz9n2y95NgsGTInLWwQbt5PLtcAy1Eag
         TeZqZ1uxF8Mqx9p4by1yGQGDMl26wYKahQmIzuNC0hh2r6TDKX1LPWfiQepcC5m8rYvz
         TClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883301; x=1749488101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7f/tGFuAIfvqKQSs61ntIFOWD9N9ElqEYirEyfjVhM=;
        b=C1EovKhL0zxGpnvFhGTnaSHXwsqTZpyoLIfo8rgiVDHkjeGa73b20XneYLPrQXyk4p
         8voHkaLxOphNEAPvmRgc8boRq1kbm4Fl2i+d+y2/8J+NQQDZy8HDgYwMNW6ak3JV2oG6
         sjJP38JHX+IU5kvt0Gqri4681ZIhmu+l9m51+JHjQGpOZHSUn131FBZCOpVIgNd089FB
         m1gMtIKmPC7hdNmMfUGcNYG7AgZL543EgZDanL9JtuhuyKRhiHVf2qLkYrlcmmp0NzvL
         tPEChnF86FLSRdxNQ0xcdQ0zoqaGnlMasGzmx7zmKMVbARJBKVvVPFZyEt+A5bBmWRRO
         17DA==
X-Forwarded-Encrypted: i=1; AJvYcCWmUZJJKxHjWY0y/G/3dvYv/WikSnebydL/PPQwklxfSLkzYgAlHImBjbCK0sTXVXGEp3y8lTOCN8jff0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8DrtETtiM83RaCksglDs15+zvCLGHlWJwPP45V1H0gGTjpdf
	yjSilPYC4HDfNY/SqNfaajVT9SX7NtNHAoGnEXrwQmJp4LZ6dhYeE0jmTuAi2WtXh65/6KxQPW8
	TKblHKGsoClFwPODbUunU8oKKnD+4/2o=
X-Gm-Gg: ASbGncspJbEJotL5Tl+hqEz2dp7+B1ysTtWdZ2MeMiyVSjDXG0O8bR+/uy/LuqihWrI
	S5KnTfrmSCi/aIq3VoJEqs07Gr93epO4kyVwKvebCsgbeQGpjT/z+9Eb9gk4O6gcB/xR9OKcoH2
	VPzlSc415s89myKKQi4oqQeWGQ6m3hVvjeEw==
X-Google-Smtp-Source: AGHT+IFOkHfDqzmRg4X6dYVJdl4Sz0cSpjloeUb8egCiH/w1FcSptxJCeZN1pekfZxMoP7yq8gsSSOhx6+D5hBmVjq8=
X-Received: by 2002:a05:6214:212d:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6fad1a6d805mr208384296d6.45.1748883301155; Mon, 02 Jun 2025
 09:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 2 Jun 2025 09:54:49 -0700
X-Gm-Features: AX0GCFtgJKeb8FM0pnWnUHVNVe9faN7bE_IcfVSmBqArKHF5VZnsu8YOQLHbPk8
Message-ID: <CAKEwX=Pd7HO3UbwYNWEeVOpw_q75sO2-Xqvgm_zM31pD3AfmOg@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kairui Song <kasong@tencent.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
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

I'm honored, and would gladly help review swap patches :)

Acked-by: Nhat Pham <nphamcs@gmail.com>

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
