Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47983286407
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679079; cv=none; b=e4eO5m9bbA2fi67sLZkbEAIlZxsNgUoqcjrnZmU4IytXl6jTy4UWQUDjFJcUABMUf/EgP8VRD9TVrZpNzcSW/RGbAM3rjfCj4jXvIZQiy3BSrDt3Qt6z/nAZQ9yAkaRrKDDpT2EpvsR+PrlpLxZV80961hyut52OPD3gfqn/iRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679079; c=relaxed/simple;
	bh=VigR2wpgaP3l8ff6DnKaorsRakXL6+7JmOaN6ZJnt5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI+pEDNcmC8hiAOWjGm3avl/m3jakffp/NWW1/SulAPHT86lkJ/wp5jCW9a6OjtKYNOirwBM8F7qgqlQEr2+EAzeYg7IjR3/xK8Syicu7ecy+lYSladlWqqJvw0DA0HUMDjyzBApDON97CGXbzpWAhrf0ExCAzi2W++jJGo+WJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iei7bi3b; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iei7bi3b"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47666573242so747371cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747679076; x=1748283876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8N/ZmrCvQlGj78v+Bsz84+vDvR8DInGIW7D3aPOmK0=;
        b=Iei7bi3b8odHToY4z1P335dbPzl4Fiac9Ni3obRsuOKZu9E/fbUrWncpm5rnTsQhnb
         Z21bPSdOkcGlzmtXgvqllZcV865bOmJAy7PVOD37uCT7o8puoD6QSqMQ0N2g4w8JOa3e
         AxDvS8dvudV3iCaMZ3VSddgnB+XzmjGp7+oDzElcT1K4gDc6usjO46/+o++I9jNDeTYG
         9ahl0fPO0jolVbkhiDGE+R/RES+ktX//CapMOoZHYMamlfdR0hbQRSZtZIzC9A/VvW+r
         phsv6d0WOF+h/8YfJ5GTWhRYLGUyJvg0+Lq5+ylh9tvBcBXFn+JJkAV9SmmCiaKplPEb
         DDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679076; x=1748283876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8N/ZmrCvQlGj78v+Bsz84+vDvR8DInGIW7D3aPOmK0=;
        b=gVHkyqFgKYwzfzUyaBLyH9dZXZS40EkL+1uK7U5+G9NLDkSsU20z6lJMXLxViUI2ii
         ulqgMlDA3WhMISOn3YjfZX2lDcwfZwHhVFOBVqOJ9ejaCZnVjU1BtZyEoiAf23r6k107
         laQmGFaDldOJvxLEkXwFughyMejcoiEftMNyjrrn8FOwS7q6YVDTgdBmIvZQximrXVy+
         DvYN0IQgboEMYoHPgGPfOyGHUx5kJU/BwbvwHrmDsyN5CGWCAL4rnIY9LnimbMm0NUya
         EAvWN9eaWyufIO30D0+G+szSe3TYx2UZXAuRfJAQkeThUFG5vwvcHIyjSqYLsvYtTWtP
         7HgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDov97IVAGcQpFjtCvHCUKgkxSsqmDIPJkgkQgjPXlytjh6+SKgbenltnFvzfx4UlsZRI9vSq49YnCtg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8WUDuoH2EEt2p0KgOZ0eLfQxkYaIkPaCnzwmTNNwmdwpNkMJ
	JhhaKbUXdQmrYjfP0npMd/YY2PvH+Z9BDR0WLQcPrARO0h7zw/uVJ0ehT4Eia1s9jWvMSr92dVV
	dw6qu3v8bDmbujn7eVHMi/iYDGc3SYmZzUiGmBOH/
X-Gm-Gg: ASbGncvSsxPs1JglvOZCCY6f2oxOI3joiNdnT0aPY9Eu0HiKyRGRLvGb43R4wd4hgqj
	dhTNvydPAPnsYCbK8iuaFXZPye5DwkON0vo8v5nEscuPpzM9dyjnSWVX/0tAyLg7u2moEpe56iz
	UAt2C1VQWOgIMI+4L6BX50WfYKXeXFWX0=
X-Google-Smtp-Source: AGHT+IHIwW4S8N4Hs8JzNW1vp8ji+sWK/cBVeQ94L+HT63szZ3uJ0oXXxgD6Mk3jYUFyZaXB7R64mUK/kn1b/LPHaEI=
X-Received: by 2002:ac8:7f8c:0:b0:47d:9e7:91a4 with SMTP id
 d75a77b69052e-49601369e4emr6851921cf.27.1747679075710; Mon, 19 May 2025
 11:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
 <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x>
 <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com> <056afddf-a933-493f-96ce-d801c5348059@oppo.com>
In-Reply-To: <056afddf-a933-493f-96ce-d801c5348059@oppo.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 May 2025 11:24:24 -0700
X-Gm-Features: AX0GCFviS3tGpfcEAdt_B7aBQrXvQCNqbL3NH4Q9gjbMuDy0Td-otR2s4oPr5k0
Message-ID: <CAJuCfpG1eJrzi2h6pGORQ=HOVNuOFqaCjx4Tn4TK41a1or+_=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
To: Hailong Liu <hailong.liu@oppo.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 8:24=E2=80=AFPM Hailong Liu <hailong.liu@oppo.com> =
wrote:
>
>
>
> On 5/9/2025 11:27 PM, Suren Baghdasaryan wrote:
> > On Wed, May 7, 2025 at 8:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> >>
> >> * Liam R. Howlett <Liam.Howlett@oracle.com> [250428 21:48]:
> >>> Temporarily clear the preallocation flag when explicitly requesting
> >>> allocations.  Pre-existing allocations are already counted against th=
e
> >>> request through mas_node_count_gfp(), but the allocations will not
> >>> happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> >>> avoid re-allocating in bulk allocation mode, and to detect issues wit=
h
> >>> preallocation calculations.
> >>>
> >>> The MA_STATE_PREALLOC flag should also always be set on zero allocati=
ons
> >>> so that detection of underflow allocations will print a WARN_ON() dur=
ing
> >>> consumption.
> >>>
> >>> User visible effect of this flaw is a WARN_ON() followed by a null
> >>> pointer dereference when subsequent requests for larger number of nod=
es
> >>> is ignored, such as the vma merge retry in mmap_region() caused by
> >>> drivers altering the vma flags.
> >>>
> >>> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >>> Reported-by: Hailong Liu <hailong.liu@oppo.com>
> >>> Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> >>> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd=
1@oppo.com/
> >>> Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howle=
tt@oracle.com/
> >>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>> Cc: Suren Baghdasaryan <surenb@google.com>
> >>> Cc: Hailong Liu <hailong.liu@oppo.com>
> >>> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> >>> Cc: Steve Kang <Steve.Kang@unisoc.com>
> >>> Cc: Matthew Wilcox <willy@infradead.org>
> >>> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> >>> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> >>
> >> ...
> >>
> >> I have a version of this for mm-new and I'd like to send it out.  Once
> >> this is upstream, it will be backported to the stable kernels with
> >> something that looks a lot like what I sent out here.
> >>
> >> Did this fix the issue in the longer running tests?
> >
> > - everyone else
> >
> > Hi Liam,
> > I think the delay is due to the holidays in China. I requested an
> > update from the partners but they will probably provide it next week.
> Sorry for late reply. We applied this patch and verified it fix the issue=
.
>
> Feel free to add
>
> Tested-by: Hailong Liu <hailong.liu@oppo.com>

Thanks! Once Liam posts the official fix I'll apply it to the Android
6.6 branch.

>
> Thanks,
> Hailong.
>
> > Thanks,
> > Suren.
> >
> >>
> >> Thanks,
> >> Liam
>
