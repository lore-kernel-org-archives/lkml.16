Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AC52797B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718402; cv=none; b=YQzc4/B5Hc7nxDGTg8zEhkWVAQJNO9OVpVCun5TgLveQruc+9AxuLA6R5wFIpcZy5adFf2KKes6QoSKbF2Mgr0L1kexSqMdOHoPiOy6mONxaA5kIm5YrQDtghcSTp5NaYLI6p0/X/XmAP5Adc2pn6LWgBPIBDpFtDAhWibOAlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718402; c=relaxed/simple;
	bh=i7UrJwqHyN6nLieuB0CXSWSKswqxfYhUPDWRmN9QmMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE/QAUgSg8FSl5DgYOw/XO160Nh0j3BU6ync7Pw/bn5G+iEOvbd3PmUeY2pkqTOMKlW/mmCYx3siZe7ItuBTqtafk0wC1VFzkq9bklYcseQop3pRgi/Y+z7cgXu8UV6LwmVnGi/c9Uyqh1SiOPRSRxksZqfxoOEbvjsuZsbmWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X0jAqmOt; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X0jAqmOt"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47666573242so386131cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746718399; x=1747323199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7UrJwqHyN6nLieuB0CXSWSKswqxfYhUPDWRmN9QmMs=;
        b=X0jAqmOticvMuT29XZluqKgbFwlliPQgqny3Ho6GCdxE1ur7ygVV+EDYsHL50pEOrj
         JrtlzPV37KRrRaQgJ/Sel+CJrqbaGHGttslsxTA0qlDUYFapZff3yH+zXGceFnaQ3x25
         9VXN4qF6v7CVgThQ8O7Z8QA1a3uEOGQSq1/xenlD1dedlLwjlqwoYE6n2rlXKNyGwwZs
         rqxtyqQgK/pNfUcv8ahX2jnrvEdRdo/eYrP3wx8Bs8YJVSMHnj2PGeJlgPa/A/jdyQcq
         cIMAQNkALMOomODyBJ7DYCpDQZPtoTqT+S2yoFJvKDFZd+W0Yz3noyIsi5Pa73cBJOhM
         +G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718399; x=1747323199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7UrJwqHyN6nLieuB0CXSWSKswqxfYhUPDWRmN9QmMs=;
        b=aFTkULaMkpl7L0+mShIMPsyYIfozKyQDJn80o5YvjY9V0Z3TbPl8xoWQgP2g+hsgJ+
         bJxpTFUCKBUbvAdKvFIwPiO/3gPpO8Io+9BR+IFwTvl08oxeXevVBZRDGZnH7B7AbHGg
         qFtr9TaAGp/xVuHuIjoJsI7nKPZ3qLbC4ldfZ3/L1DRZo/qE4wBI8cYzRq7XOWIZapPw
         Uq4gPaI8yb++BQYKoWb39qEPxIGA2eaVZbY/mhF5jewxhz7C0wVWH+bgPIKj1J0Ec+Vn
         xpSuZOXdFSNo8uDyYv+0ob/qHVjz4Fl/Rlr3d8zg+sqQuXTEDf77MMoUeCXj867u9n2k
         80Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXY5Yq1wX/xeZHdiCbAwF8Ft8P1tUS7YPvvvnHmROH/glTiPH+eYU1Z9X3AIsmMgPX4SqgAFEw7tMM1QVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bfHlSsOJl8LkREbjv2m4wzGsRnEmAHk3XJvE7jSDbp7yulIN
	SWRtPuS/9kEeL8C6AuGQDXvEfncrYZto6GRhokSBM+TRocB3powHunPfYIsGD280owP6k92yqfD
	a7htQyJyULKGhaK68zUqAYEW3/zcBshcLHrtG
X-Gm-Gg: ASbGncvs3h4tZxtiGBKu2wp5Ban0cwkrq63ly2HG9DlFjFfh2BE4xKzsLXN8cYKJ2B+
	uaF8380HAR3tcisCAhkdW3sKEPTfkO9j/tAo72Y7f4UaF6EEeb7Cuw9sf0THi+ssyU7zcm1D7b3
	d1TpkFr9fYb2UEL4sPCPPt32sUGg0k2lW9Uaa0sd9QUnVm3wJ/ySc=
X-Google-Smtp-Source: AGHT+IE4OkzE3XHXp4+6aW8TNjQUp5iW7YxwFqtVgU8d1NQstvfcrpdZRx67gM/walW7wD4fOOwCumAvE0yErbBTLqI=
X-Received: by 2002:ac8:578a:0:b0:48a:7cd7:7e21 with SMTP id
 d75a77b69052e-494499ec7b9mr5044651cf.20.1746718399217; Thu, 08 May 2025
 08:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508090735.39756-1-21cnbao@gmail.com> <aBzMf6H9Lad6CaFQ@x1.local>
In-Reply-To: <aBzMf6H9Lad6CaFQ@x1.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 May 2025 08:33:08 -0700
X-Gm-Features: ATxdqUGxHcqt4ekvzUe2MnoOqj_5fDVgUtsq734BNASUrqc9o3A8YKRQls1Ed2w
Message-ID: <CAJuCfpF39YCc_aC1qnSHxmn8QwT+BB+OSHUJqGHn_ABoS9pBeg@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
To: Peter Xu <peterx@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Lokesh Gidra <lokeshgidra@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 8:23=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, May 08, 2025 at 09:07:35PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > As David pointed out, what truly matters for mremap and userfaultfd
> > move operations is the soft dirty bit. The current comment and
> > implementation=E2=80=94which always sets the dirty bit for present PTEs
> > and fails to set the soft dirty bit for swap PTEs=E2=80=94are incorrect=
.
> > This patch updates the behavior to correctly set the soft dirty bit
> > for both present and swap PTEs in accordance with mremap.
> >
> > Reported-by: David Hildenbrand <david@redhat.com>
> > Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950af=
b9afcc@redhat.com/
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

The function was introduced in 6.8. We should probably CC stable as well.

>
> --
> Peter Xu
>
