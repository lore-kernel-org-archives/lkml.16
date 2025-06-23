Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AE70838
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718319; cv=none; b=Ul1vH4eOIY8cO2YaNK7ZCuyB/69aJR8U6sH54i+ramDtt89fZlzT1IZWY8W2FEXmOSi3o+lP2ugnU6CG2rAsNdsJirabC5H+IeM5HD8evYVOhFlxZhWa6IW33BQA++Ea55QZHcQbMqq11ZBZRaYhh9j0PBmHm2yP8UDUdrmU/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718319; c=relaxed/simple;
	bh=Vot46m2llwc5AKzlikU4JpxLwQ2E8dsYRwz55AMwOSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3anOzVSAo4Qr0TsoZZuJdJn6kr3tKlKGXse2paPMG6nVkjsYe2R3enEEFJEFgz8tNdk63p6A2LlGMg85CJ7E1Hp4vmL6fQsw9su53hiX8V+SSDHBup7L3tnZY8QsIPjfEtSP/FoXs78pHX9V7wo8JJ1aWd6TJwWas73UIEAUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/xWGwAJ; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/xWGwAJ"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-531a1fad7faso1515330e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750718314; x=1751323114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmFnzXDP7js2cQnz6D7zC1wOg+JQ8RtXl7WzvdrZQY=;
        b=X/xWGwAJeujFuI5CQyDdRa9dHWoDTHxAKj6rejR4T6pShohKj8+G/e4M9w162Kn7ZO
         Cm9Lr5VxyVU+WrwGqV6Js5YElcaOCc8LqfWcbyD4nvLearpP8duWIagt4As0AGs0YofC
         q4ni+blQUWs3blRxxXN0b5ZRk+uApBF8bv0s9gjHuFxqkBKGKKWzISBCr2NoWsU/USO0
         85d47zhWwKT/S0iJcp52QFQz3L1PlR7YRk6O48MXxcq/XHPvd2VHGH7qeWr2XJ0fJaoq
         2Eth++OfT0empmK7baUONC1/s8cSwKMiW03w7kpvawc3anLyJtYJ6RkF+eJfmqiEXXzJ
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718314; x=1751323114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUmFnzXDP7js2cQnz6D7zC1wOg+JQ8RtXl7WzvdrZQY=;
        b=fEZZxCQhcFvM1Tj82l76L0x3zESYh4fb0I+W0EiUk6WFFNufoCylrrojwtvC/UHiAh
         QIdmiRcFWDRkIRcqBm3w1UKhEuKWZzzpvZDZuCpWLvW4RO0/RYBVVbrzwQONPRG8+6sn
         Rw4vmec+BwAeUyUOSL9KM/quKm0ltfsfx32CrfG4YFYOy6BS1D2gSgelDO6qN7pYZSEd
         SZO8pI9yyEgfcr5rQFHdI96f39cuyeiu2tMn+MrRBC+Fum6m5nXrONCROsaCaBuN8k/j
         Mwh1PcH2vqxJrMeYmR994mpVXUf1J589nUOw8PEFCy7oW28qnJpXD4AhfZJl4ICv17C8
         oRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwXtW/dpXLFKXXB79OIJkFDuPXc0HBQSsU7jmCIyZlO36M7NazszFHg/Ak0wfNBfG/gYw7R9tWEoE3krc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0opofFa/FGo6SMUJnLNHMrZbMMpI6P0YCK1w5+UtRPjVmYd7
	DzYFiNOzVJ+yf8An5UA1a1roACWrIQB5qcQ+hdh0B6x3OChjW1yDnzHyUYtE4MTCG1hJI8GMPz1
	s3DgtIpB9sDfXfQSt8jOUeDV6ZJGj51s=
X-Gm-Gg: ASbGncs8C3N4hThD6kNzdSyLBH8kgNpdI6Um8gFnRKUBcOsLO5DKftldZu3rIss46yX
	y9SHararN60kO7h311o+TWyEhTBnNX7546fH2VCbubde8SsymsKOiyrNmblwBtmvCgMTuZVUp9A
	fJ/ZpVDKCQqUhkM+5sUb5IagYp3JNE8higxT5jt5V8qATyA/6CLj9uWQ==
X-Google-Smtp-Source: AGHT+IHvPO2odYXDcbGrmRrQwsjTPNW6KL0+Qay7/c/xzd5IHUaT+vnq0rnt8TtuEhBzEVEr6U166TfzKZkREWU0h6k=
X-Received: by 2002:a05:6122:45a6:b0:531:394a:23f3 with SMTP id
 71dfb90a1353d-531ad66f620mr7672624e0c.10.1750718313979; Mon, 23 Jun 2025
 15:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com> <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 24 Jun 2025 10:38:22 +1200
X-Gm-Features: Ac12FXzdIftskFtIPtygI2TAglAR91VaK4vKBaOEPPzQ58F9Qihrk9zEDPb5w_g
Message-ID: <CAGsJ_4z6d3nxnHfiCjK-sVL=DMgW_CceeFKxvMpzwJ+rHPR=0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>, 
	SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 3:33=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Now we have the madvise_behavior helper struct we no longer need to mess
> around with void* pointers in order to propagate anon_vma_name, and this
> means we can get rid of the confusing and inconsistent visitor pattern
> implementation in madvise_vma_anon_name().
>
> This means we now have a single state object that threads through most of
> madvise()'s logic and a single code path which executes the majority of
> madvise() behaviour (we maintain separate logic for failure injection and
> memory population for the time being).
>
> We are able to remove the visitor pattern by handling the anon_vma_name
> setting logic via an internal madvise flag - __MADV_SET_ANON_VMA_NAME. Th=
is
> uses a negative value so it isn't reasonable that we will ever add this a=
s
> a UAPI flag.
>
> Additionally, the madvise_behavior_valid() check ensures that
> user-specified behaviours are strictly only those we permit which, of
> course, this flag will be excluded from.
>
> We are able to propagate the anon_vma_name object through use of the
> madvise_behavior helper struct.
>
> Doing this results in a can_modify_vma_madv() check for anonymous VMA nam=
e
> changes, however this will cause no issues as this operation is not
> prohibited.
>
> We can also then reuse more code and drop the redundant
> madvise_vma_anon_name() function altogether.
>
> Additionally separate out behaviours that update VMAs from those that do
> not.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

LGTM,
Reviewed-by: Barry Song <baohua@kernel.org>

>
>         /* We cannot provide prev in this lock mode. */
> -       VM_WARN_ON_ONCE(arg->lock_mode =3D=3D MADVISE_VMA_READ_LOCK);
> -       anon_name =3D anon_vma_name(vma);
> -       anon_vma_name_get(anon_name);
> +       VM_WARN_ON_ONCE(madv_behavior->lock_mode =3D=3D MADVISE_MMAP_WRIT=
E_LOCK);
> +
> +       /*

I=E2=80=99m wondering whether it would be more accurate to:

VM_WARN_ON_ONCE(madv_behavior->lock_mode !=3D MADVISE_WRITE_LOCK);

Thanks
Barry
