Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC6241122;
	Mon, 23 Jun 2025 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671379; cv=none; b=P5XYvIN5FtoLVOlQaZdYOMpc60AgiX9Prhs6cZN9CpAu3d4BB+cOe8E/KtBmXAWFw1zdRneAFATWsp53yGmeCDKMKbq9B+4SLRAcqATohsnLHHwj2CYbuBcjECLwvCdQijqHyM/US3AbAxuaHF8BsJYKftHvQAWs6UB/NNAj2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671379; c=relaxed/simple;
	bh=XY7HqLsJJXFsX1Gp8sB4yUNvrl6iqaqmtL6uxO2bzRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWHIJLS44tzQGapz+dtgQSmeCmzKEcTh8EQJTpNETLIpEu7Pqb7bi3ol218eMlB4EWdu68+uq5wshFE2ohthhJ/LQd9eouZhwufkGnImsoL4gU6AlQ325pGHzGMSHekVuVdCd3D1VBx/YtVT1QIuZ6JaVvH/Be8rHbQWjXXsnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeeFx1jE; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeeFx1jE"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e40e3f316so30135867b3.0;
        Mon, 23 Jun 2025 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750671376; x=1751276176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4Za1BNV8XX88H1slqrdAbMavvWiucCm8pD1Upe5ORM=;
        b=VeeFx1jEzJftPFVIgXKNyBljYiBdwIaQZkLoODRxjPya9lpTgibvzHHc7cslUD3nz6
         HXtFRYid7Sr682NdUi20TXOrCM9rB2uQ5OD15HvRtDvNIbZ34vm5Qg4dVmQxxmjK6j1h
         x7QxqCBHKzYuxGsJSjHGJKz63QQFVGYneNDAlAHl4pYoGCcJ95m23MZL3TV1RUfmGeMr
         A8qvBV0I+8/ADdusSom7I/0l7eIz3P0vLxEu3iFacC+HOtzhs3gMwR4JDO+9TdLsot8r
         XzXyzGuJ/kfbYmU67/stL8+zc/t/L8QyufFiJ8VUB1OFxbdqFGeOJzryugcgdtzztrJL
         KdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671376; x=1751276176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4Za1BNV8XX88H1slqrdAbMavvWiucCm8pD1Upe5ORM=;
        b=kxZ6SjhhGD7KfN60IR1y1/HeQpj1oyhXT1iKYLQbg2hV1oP09HybxZJ6xR8eSUR5zk
         8+z/NKyxoOwmO2tLwDyABhyYHN0Sbkmull51jkqZ1pW+qVXjghHqrO97WTE3nqxFVYsf
         SkuSPSjxOvYQEyn6HXQOCSKN0Qx6R4lL0tsrYsyEtoQhK6q2tO2m7jGd0ADDo3ldUn2A
         7fDpJFeWbgxIVpv3k10KAxcw0JeBH1EzJ0v/nOzMJ+Hr9q58mvF3Sl8EOksgvztyLlPb
         1N1vkv5Pm29rhPpTyc2iLDUVWZRtrQTYcnhwyVkJr/d6xx4OaYbJoRRGf6nuw/sxgXHm
         Mmyw==
X-Forwarded-Encrypted: i=1; AJvYcCWh+fX2cZwWoMar4fM2jz2JRmBpbewBa07421DYn8a26J27DwJvJy4Sc1lzgqR42uw+2xO+0BS2lNIB+SGq@vger.kernel.org, AJvYcCXak9/1fyXTXmY1ouhBgGRvhQEm2VUxcpzkWC3w0Jj/Q9Ca/JIpjab+/SXXlFq+xBvIQPYLA3VpwTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUf/7agrhTnoC4Xd1PZt3UmuR0j9ELJBq+rGdgNknyS1r/6Iv
	NUb4cGm3RBJG+PRhgLrxKinhIgm7p0auCEzO4PIR1OYCv+DaujJ7ufY//Ecv5WFj0j3gPkzEpAd
	lcnTqnu87VWdT9yQ030oMRXR4otUYGSQ=
X-Gm-Gg: ASbGncsFm21eBHwX8kyNuV7T6ja8Ri4deV8l85iLELAiIoA4bA6W9xqsBfGQ6GOzSa5
	h3/I/K1scd0JB/xPDxsMu3NJhPAgU+Ya+wXHdxCHOeV9oHfekaUhCIVh7Y9CBKZmPyWPGL+G0sl
	7D24nBcYMgK0lV+PRWOEmOiL1PPysFvfZkTPR1iRBSfKzJ8Q==
X-Google-Smtp-Source: AGHT+IEvVMm48GYLrqkAtPw36yMgBzNA/Wq9BF9LgxpO431BIfJpnOAH0eRxD/1ClnEuiMM0+l9ZX9EEY9TD5aH4jwQ=
X-Received: by 2002:a05:690c:82:b0:70f:83ef:de07 with SMTP id
 00721157ae682-712c676eaf4mr172673617b3.33.1750671376384; Mon, 23 Jun 2025
 02:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622004249.9083-1-sef1548@gmail.com> <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
 <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
 <CAD-N9QV5r4YyO6qbL477x0sJar2=WTdHH=x58P9Qatff_HC3Nw@mail.gmail.com> <3c5f4ecf-d71e-4e61-a3d2-b7cdb3043efe@redhat.com>
In-Reply-To: <3c5f4ecf-d71e-4e61-a3d2-b7cdb3043efe@redhat.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 23 Jun 2025 17:35:50 +0800
X-Gm-Features: AX0GCFuSxWK_1g_GzSOPBKbDi4_dJxhznzgu_H4kzY4vzrDzTODhYMQmOCC_z5E
Message-ID: <CAD-N9QVTWRotabnVi9O4GViEGCU+MPE8VRw1ccGiEQRgh7mpQQ@mail.gmail.com>
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for movable_ops
To: David Hildenbrand <david@redhat.com>
Cc: Nick Huang <sef1548@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, corbet@lwn.net, akpm@linux-foundation.org, 
	wangkefeng.wang@huawei.com, vishal.moola@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 5:23=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 23.06.25 11:12, Dongliang Mu wrote:
> > On Mon, Jun 23, 2025 at 4:51=E2=80=AFPM Nick Huang <sef1548@gmail.com> =
wrote:
> >>
> >> David Hildenbrand <david@redhat.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=88=
23=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >>>
> >>> On 22.06.25 02:42, Nick Huang wrote:
> >>>> Remove Non-LRU Page Migration and Add Movable_ops Page Migration
> >>>>
> >>>
> >>> I'm afraid most people you CC on Chinese doc updates will not be able=
 to
> >>> help in any reasonable way.
> >>>
> >>> --
> >>> Cheers,
> >>>
> >>> David / dhildenb
> >>
> >> How can I fix these things?
> >
> >  From my understanding, you can follow this how-to.rst[1] and submit
> > your patches.
>
> Great, a how-to.rst in a language I don't know. So I assume you meant
> "one can follow", not me in particular. Because I can only parse some
> git commands etc in there that are in English.

Yes, this is only for Nick.

I should mention the name before the massage. Please ignore it.

>
> Which bring us back to the problem: if you CC me (and many others) on
> something that is Chinese, I will not be able to contribute anything of
> value.

Yes. Nick should not cc you in this thread since this is only about
the Chinese content update in my mind.

>
> Quite the opposite, I will ramble about how non-sensical these in-tree
> translations are.
>
> So likely, when you perform a Chinese doc update you want to only CC
> Chinese doc maintainers. Because they can actually provide review I hope.
>
> Maybe that should be clarified in the how-to.rst[1] that I'm afraid I
> cannot read.

This document is listed in the translations/zh_CN/ folder. No one
except the Chinese translators needs to read it.

>
> --
> Cheers,
>
> David / dhildenb
>
