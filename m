Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA71F540C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781210; cv=none; b=G6flbVG4yzeIbY6hM+3wpb+bQOCSQP9aOm0qbnLmDkgo9Z/2kirbDXcQQp2j67NShnQ7kEdtu0RJ3MDK/HPlACLPV122hCWPouGUQOUfb1dNMkPHlC+5d7i18k2YjMXb804mXKN+tUUdyjBlT1SskC48Q2Iq5YNHvdQiRvuWvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781210; c=relaxed/simple;
	bh=3xvLTkD3hm7Mes8rmrh96QPUOI2AKFnbOp9Cb5w4J28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpWN8Paqm8PmoJ1bZVJ6ETngezbMwtTqxxKE671+hky+FlVy/llJWRfPHql9MkF9JwkLCCbQzE4NpTyoP/88YOR1RDRXx5ZEe4ezJYdbyFMHM7jXsXWjDFcFhETfAirCyOVn1kwG/7hMkXlbZYcT/LR32mv9E2+SNy3kKURowhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofyxz18E; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofyxz18E"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6df83fd01cbso12914416d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743781208; x=1744386008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prSOzXEBgQyZuAaooh+ak3Qps7M4suPmZuJKuUU05D0=;
        b=Ofyxz18EmV24UhmT7Vw7D1BY4KvtaZL/N2irYFNfbqi8vF+6Ym7dzrfg+i5MLdFSfv
         F55JP0EwKM8dqhgZ2ekwnEw/DthG5aAvPeAOl8FFxi6S/esD0hduBVXOkqMZuq+sOtSI
         LpwQ2HZsyKq5Sbfk7TAFLhok3XAL+Dg0VAJ/ygMlriUpOQhxdK/VexsNRGWiKSVq3tYz
         GjNWOhbUXs576FzQ/IgNt6WPuqzwc5b4O67FNtHKEnvsbNFVKu/alq0HNtO6RfXSe7KN
         /0mAOiSCyj8KSQDO2UE2yv7E4iB2gOVNXlYYRwv6y3vvXueBwQAR3OVXQv0LeNoH+lzw
         VklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743781208; x=1744386008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prSOzXEBgQyZuAaooh+ak3Qps7M4suPmZuJKuUU05D0=;
        b=wqC51neNRL3xiKjeJet7GIZur/OIvcmW6GNWW13JEnHn8tg66nU4D3qezXh1TLB96L
         JzFH4Cwza3wuckHBc9HzZsVrM4E2VkviV0w+kaQICUtxTu3xXBJnqSPBsckHOI6hH1H0
         Vqkr2GKJrOHftQ8Wx9a5EpTlqZnRoiet6iLHYkZhFALje1llorPqcp3kBv8vRXlLzrYC
         Pr90ckGaXndHeXaZSy3JFCwqBSHJt7y+/OYASsOxGMOX/GPiTe3xCU6CeXdg8zvqxeIR
         AqZqS7TbeKkUD5DGHt2cNJCyicKXh39+4iTEOkg9opW1nx1dy3AX5CDHRY+r3WORo6TY
         +0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVsvuPJZVLVBuCk1bx8i4scmIIT1ueBT+ErthA1Fr2bU69fVrxj7M9sy7+z8jeTX9y1jNE41ZI9zKX8AHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5CbluS1Rv4Yb6v/2f7tvMCpGZN4cuvYYzfcRXL3L6q53vCDjJ
	ryuyEi+LpuilvcVXgFYSn6ZIYt8DmirjQZevaeA6tvLy5zkGCx93YN93N7s3rAbtIAPibtE1na9
	xOEJu3JvJCyuI4ilNFHvPOn5om9I=
X-Gm-Gg: ASbGncudcNsETzmsWFExrx6kobI2vpDWxPPYSgawWXNaeY2GsGemfOSubAkSYKlIYM+
	FYrMtps3nZLPF5NhTufhjLQaO2TKqd/M0OZtzNqVZ4z1pkwuNYPA7d0XChNXw3dYBi3wBQ5W5Db
	iERJ9MOKUKoZnIMqNRT/y4JL1BAATsCIiB8xdXICYT2S0LCXnmtm2w/HwxZQ==
X-Google-Smtp-Source: AGHT+IGphN4CEA4eEoFwh71aXAYCnqU9mdhQWmkjAzeXN+3WP11z05/y/aYKGJ83KGCJ/crfOLXPPFiGH9PDq9UUkHg=
X-Received: by 2002:a05:6214:2266:b0:6e6:6c7f:111a with SMTP id
 6a1803df08f44-6f064b5396bmr42543716d6.40.1743781207637; Fri, 04 Apr 2025
 08:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJD7tka6XRyzYndRNEFZmi0Zj4DD2KnVzt=vMGhfF4iN2B4VKw@mail.gmail.com>
 <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 4 Apr 2025 08:39:56 -0700
X-Gm-Features: ATxdqUGBOhkzKPkEXEn1pt-WAA6a1ele1vAnQhsbPBx1oaH3xhTk3P8grNzaNWk
Message-ID: <CAKEwX=N25ooy3YX6ZbFcCszWBAcPmXf0zc99LTGrv8WnrxV3hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wed, Apr 2, 2025 at 1:06=E2=80=AFPM Joshua Hahn <joshua.hahnjy@gmail.com> w=
rote:
>
> On Mon, 16 Oct 2023 17:57:31 -0700 Yosry Ahmed <yosryahmed@google.com> wr=
ote:
>
> > On Mon, Oct 16, 2023 at 5:35=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
>
> > I thought before about having a special list_head that allows us to
> > use the lower bits of the pointers as markers, similar to the xarray.
> > The markers can be used to place different objects on the same list.
> > We can have a list that is a mixture of struct page and struct
> > zswap_entry. I never pursued this idea, and I am sure someone will
> > scream at me for suggesting it. Maybe there is a less convoluted way
> > to keep the LRU ordering intact without allocating memory on the
> > reclaim path.
>
> Hi Yosry,
>
> Apologies for reviving an old thread, but I wasn't sure whether opening a=
n
> entirely new thread was a better choice : -)
>
> So I've implemented your idea, using the lower 2 bits of the list_head's =
prev
> pointer (last bit indicates whether the list_head belongs to a page or a
> zswap_entry, and the second to last bit was repurposed for the second cha=
nce
> algorithm).
>
> For a very high level overview what I did in the patch:
> - When a page fails to compress, I remove the page mapping and tag both t=
he
>   xarray entry (tag =3D=3D set lowest bit to 1) and the page's list_head =
prev ptr,
>   then store the page directly into the zswap LRU.
> - In zswap_load, we take the entry out of the xarray and check if it's ta=
gged.
>   - If it is tagged, then instead of decompressing, we just copy the page=
's
>     contents to the newly allocated page.
> - (More details about how to teach vmscan / page_io / list iterators how =
to
>   handle this, but we can gloss over those details for now)
>
> I have a working version, but have been holding off because I have only b=
een
> seeing regressions. I wasn't really sure where they were coming from, but
> after going through some perf traces with Nhat, found out that the regres=
sions
> come from the associated page faults that come from initially unmapping t=
he
> page, and then re-allocating it for every load. This causes (1) more memc=
g
> flushing, and (2) extra allocations =3D=3D> more pressure =3D=3D> more re=
claim, even
> though we only temporarily keep the extra page.

Also, double check your benchmark :) If you only cycle through the
pages only in the LRU, or if you will need the pages soon, by
definition you cannot do better than the status quo.

The gains will only materialize when you have longer workload, which
can (and often will) cycle the incompressible pages through the LRU
multiple times, recompressing (and failing) them multiple times with
zswap, etc.
