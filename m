Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2E1547E9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828278; cv=none; b=EqFNCfMF1JrcKyXd9lB1qm+Rbm0XRIb0mQZMnmTRSy0nbKPUU9xoX5jSpKD1Fyw7FP9xUFe4fdcOHtY+gco3uIeuzrW78BDK4oDYItY0guW85N2S3Bdlfurgkb5sWUp1tnZmSmuxhBMC7Xscr+LtNInBpkzVQxrb7QpoKLM4NaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828278; c=relaxed/simple;
	bh=NuQsSqgTop5E8Gb2Y9gw0o6xz2v26XW/yXYN3p2zI0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hc+CtAZq19vV5bdw85QWvOXMQ31SEv/CJoWpw1cXi9HnJvORKTITuWqMoxSQ9UOk33lF5SUA0X+av+t1AVVeUvWBwJXatTsTYdVxlTF/kgApVJe9YBd2fnIrmypVzCm4XOYIdbKZVeKlPorgydnnM9ooE1c9euYSUZ+FIfHaHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNf0Oasw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNf0Oasw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so6003951fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738828264; x=1739433064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbmCZKRSiLI6l3P9JfBcjTwvUE/+hcNOQv63Wg9I3aI=;
        b=DNf0OaswhNWwhrABuzTL8RGZkNYZGSpn6KnsU1kBvWZlVP1CKAw17fqGcmlENczh0v
         FMFkl1voe+DTDanHR1lYfzd1N6locy85Pm/eycbNuVaQw7KeHxciA7Tp0FuzwW3QWvh5
         a1hz4MW9MKo+MK0c7upqxeDKXNp0w3UYPeuYp1WuelFdBrZ/XnIP2zqx8E1oVi6R24TI
         hiAfFIRLWB4NM5oZvZJamnFVGdZNcaOl2dQc4gyCXrjM+dSD8uOJNFBzoWBZYM8c8mO5
         fiYeIy3rUh6+Wn8dVclzWXhIhzCelWwt/G6QXdQZEesH6HzwV/7R1Je8P6WJpKEwxxiD
         FqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828264; x=1739433064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbmCZKRSiLI6l3P9JfBcjTwvUE/+hcNOQv63Wg9I3aI=;
        b=Symcnwly4Hdgq1GWQBAMFNPU67fK1rQCmdtIrnG84AYD9/oCibJjmqbgwcd2CRhCLP
         9MHplTmaQFHnAYkWMV1EOWFU/2GIvJYYk1SWtFJg9GR5nabizL+S2SX62+1MUF7pMdfQ
         R5ho0ZzRneBPAtYF9FXipnyXoV8RtmI/ZSirgMVpz1eR7GRc0Mm2/EE08tGJZZwl6d/y
         liHwjC9Th7NzBqQsunuZZRjl1tvD2JTVQhjR7n8++VkQvaurVIMGQuAwQSsUDF5PIVC7
         zifZqGY0zJmPEp53mCBUI7aJic8Z3KlJ9gBXSO8vXnLTyZegz/nUEk/QVR0vLRdOaPq4
         DvEQ==
X-Gm-Message-State: AOJu0Yw59oopjGbiyP+PdJdPFv1rMFIhpAOZcMQuO3UspQdSxYImm34a
	Y54y8GA9WYwbsP0gQdNS3UTwsCxazwLIGxtD/vhH12LfbiJWsqjQlEs+FN2xbe51yQ4/15mG1Yx
	lCCLl6rYO98mmVVoJdPEoxrlqejM=
X-Gm-Gg: ASbGncvkW1rxCkuBNYX6IwvkoAcTziNXQoUZsgE0Z3m723sSZu73fC38lXLIoXNQSxR
	J9XgOCNiG1Nznt8HhAbkiial9pOeey51EiYM3JtfT8IEFx60r4jFYI56JjZLnWMt/6/sCV0/7
X-Google-Smtp-Source: AGHT+IEpvYaRte2GJP3+ZanGdx5RE8IQ00usPn05fL5mq8ThV2pN+0Ia++3o5CLsNRsdFex3UY9rF+RMm5ny1I+nRo4=
X-Received: by 2002:a2e:be25:0:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-307cf2ec982mr19791091fa.2.1738828264169; Wed, 05 Feb 2025
 23:51:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205092721.9395-1-bhe@redhat.com> <20250205092721.9395-7-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-7-bhe@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 6 Feb 2025 15:50:47 +0800
X-Gm-Features: AWEUYZm9KbHQR4N8gOZV3zd4F_QyXlog4Jje4nmt8HJtC5d4hFTL0ROjsVAp7Rw
Message-ID: <CAMgjq7CHrN4cmS-JACUphQHKwv7gQdcCbzYRQ_H+ORBa4tJ7uQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] mm/swapfile.c: update the code comment above swap_count_continued()
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 5:28=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> Now, swap_count_continued() has two callers, __swap_duplicate() and
> __swap_entry_free_locked(), the relevant code comment is stale.
> Update it to reflect the current situation.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/swapfile.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index bf284ba16198..9ee2238042a5 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3789,8 +3789,8 @@ int add_swap_count_continuation(swp_entry_t entry, =
gfp_t gfp_mask)
>   * into, carry if so, or else fail until a new continuation page is allo=
cated;
>   * when the original swap_map count is decremented from 0 with continuat=
ion,
>   * borrow from the continuation and report whether it still holds more.
> - * Called while __swap_duplicate() or swap_entry_free() holds swap or cl=
uster
> - * lock.
> + * Called while __swap_duplicate() or caller of __swap_entry_free_locked=
()
> + * holds swap or cluster lock.

It should be only "cluster lock" not "swap or cluster lock" now?

>   */
>  static bool swap_count_continued(struct swap_info_struct *si,
>                                  pgoff_t offset, unsigned char count)
> --
> 2.41.0
>
