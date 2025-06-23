Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EF13FD86;
	Mon, 23 Jun 2025 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670122; cv=none; b=VWFLGmAsqXyBGzsn6YS7X6i3JbHogRvilwUZ9B0rP4iUDnpX6WQf2YgVsrFYB/EhwIPALxq7BXg6pz7Ynthxcu4LFikkz7027OHaxzaWnqvjc4R77KCCQ5Te9HKNLZJYrWJKJxolBhB0KhCoCNxtLSR4ETF5SX7ciVZdDM9p9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670122; c=relaxed/simple;
	bh=jNDEYhgs0WeeerzsC5cGyqKVeft93lG2zOQrvoD3xWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VU/ZorBrwVOE4EDf1ZFPHRlcKfSWJhXTpVwW+pz4Oze4hfxykqp1e/n820v0rrbZzSn4+tWdHYCJzf7dnWiOi96Ndx69QdyDXKDRNQWJpOG7KJQF/kCqhwh1R4J9bZj5wH43S6lSWRU3ItA9K79gBBGZ/1NtGzjYxLcdJESrvjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXhYpgja; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXhYpgja"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e78e04e48so29635747b3.1;
        Mon, 23 Jun 2025 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750670120; x=1751274920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNDEYhgs0WeeerzsC5cGyqKVeft93lG2zOQrvoD3xWE=;
        b=NXhYpgjaj+zH48M5PfPxIjLYGRKjD28bM7pk3gdy/JKqZLcM30YOp0z1EgT2Gc5rnv
         BRS+T6ORJyTcHHGtMDS968iAW1VGtghappVMNuIVr2atxg3COfpj3VNT8ldHVKM+7TLh
         BaNmUeo6Dpvs034WM86lQDmJA0zOpjb8Ga4XbV5wsKTkzjefQjdA/rf/1EI3phTq1sjJ
         CHwFRkzS/xJ6N3JxN/693nOGJwyEVXGWj+QPNYNDkFiJd9LpzO3WblGUHu9GG+yEVcVd
         nuGB9f1cvWChJ7CS6MwUjiowxr6qeW5ujY6vcN/Ba495T7NDi7OMWpMSfhg5XyaPr0Cv
         Qy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670120; x=1751274920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNDEYhgs0WeeerzsC5cGyqKVeft93lG2zOQrvoD3xWE=;
        b=sBxlizotRr7jUR2h2zydLCcjqw7E008poLWTVUCeweCgrRxVvszfS/kP7ArZK4GszP
         gjKxSWGymXTZo0lxN/xbAnkptlSPqp5YqETiURO7p6vfDOOywATyend6nLYFkzLZ454z
         +9bzv+sFJkehjRgvjtBfVDpgpwxTDFuVYkpFgtpqArAJoOtNyvFDlU2lD1ULt/mtYb8z
         Iv8SBvVy9kYslt+i9ZiLbrG/lCvta5g4hrsorFi9+up1bkTm/qUNEL+DGC4zIKK2ruQ0
         mgcshaNMzGyFMVy5Xp8qANuZvsKlzBjMu608oP0zh2ZoZaajKPFhw1lceY0qZl7HASeq
         /qgA==
X-Forwarded-Encrypted: i=1; AJvYcCWYHnifVjW7cvQhKGp2oy3SR1bGry4blVrEJ8wl3o79TCPNVGfLAIvdVzZ3ZAJjFNL/1p6pug4O3EM=@vger.kernel.org, AJvYcCXuSXsGoOldgUJzU5sCE6cs5C7JsX2AWLWin46U1nyxP9tw0qxVn/AP1Cv7y9jNn40rtz9wjWeXaAm7I3mg@vger.kernel.org
X-Gm-Message-State: AOJu0YygOny++1szenAzKz1/5Jw4lkWUGBy4w0GxeVQ6jnweTBFovqWg
	TPQ+vTroIoJsP/5zZWCz781hMakPjbBy53iVeiEQne/HsVAJc1g6ABL0MHXKS1zR1Vgc8R6nXg9
	qSKAelwyIrBU0f3o/G5EJnVqgdlTf244=
X-Gm-Gg: ASbGnctSFj7QDafbL6mI0LJyAasjG2Dpm0C8KzAl2Oh3PVthORgTMegXlYQKVqWmCUa
	Fcc8ObHCHtm0B+EMPMSWAsHPq0jiQnGk6hxWG5oyrxN3fER2VkTS408GE9C7kW+7cpV18F0GgZv
	wyS3S9/Av4GiUCJitmgSxRQQFN9GgZvJw5qwLLQWFD9WfIRg==
X-Google-Smtp-Source: AGHT+IEZLyUUWnZDTj7iTiBv8uoCRzl4PUP0b6Qc/tp1spVVP9/zWpKwxPNKT06cTWXp5SGx9Z4m5FzzoXONgZ0ps8Y=
X-Received: by 2002:a05:690c:6c12:b0:70e:404:85e5 with SMTP id
 00721157ae682-712c63beecbmr191813187b3.11.1750670119656; Mon, 23 Jun 2025
 02:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622004249.9083-1-sef1548@gmail.com> <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
 <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
In-Reply-To: <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 23 Jun 2025 17:14:53 +0800
X-Gm-Features: AX0GCFuw-hQrlfhDhcuQC2wbNyBMQcxEi3JlCxtOn5Hrlf86LENxXTG6lu4NdNo
Message-ID: <CAD-N9QVPekRZ2r_4TOvtfJouMVsOyTfHaU7yd-gDV3=mJYx-Rw@mail.gmail.com>
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for movable_ops
To: Nick Huang <sef1548@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, corbet@lwn.net, akpm@linux-foundation.org, 
	wangkefeng.wang@huawei.com, vishal.moola@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 4:51=E2=80=AFPM Nick Huang <sef1548@gmail.com> wrot=
e:
>
> David Hildenbrand <david@redhat.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On 22.06.25 02:42, Nick Huang wrote:
> > > Remove Non-LRU Page Migration and Add Movable_ops Page Migration
> > >
> >
> > I'm afraid most people you CC on Chinese doc updates will not be able t=
o
> > help in any reasonable way.
> >
> > --
> > Cheers,
> >
> > David / dhildenb
>
> How can I fix these things?

BTW, you can refer to my patches[1] for Chinese translation updates.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/=
?qt=3Dauthor&q=3DDongliang+Mu

>
>
> --
> Regards,
> Nick Huang
>
