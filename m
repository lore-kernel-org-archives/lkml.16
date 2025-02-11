Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073225E470
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292576; cv=none; b=RgZP8Po/FM8wOYwbnoIE1vPoU9M5K4r2n8m/1Dql08Tc5D/KPc3dvbXpDbhDsg7fHRd0n8ZAua9OKpymhgUhuVHFjTjIjUqs+nlTGogzMGANt21wbzZSwVaqE7oET/+iJgvAB5KErc2dKH+bHT4kh5hAzU5EtgVbRXrgYw793yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292576; c=relaxed/simple;
	bh=CLjpPm37LO5bkedoxCrQgVXmKovIHNtBCi7dFe6YIk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQNBpUWHfpuNkvKsCmR3ADYN/MuLH0G5+H22E2M1+rtiZKQLESGs3VQDcwQL08uKfYRDoRBqSUT2lrMObqP0DxiQY+qPmLbgPMWCqGiQ3bUvHKcUG3pZwRVBcMBpgeQa2cQPiQVdD7ac0wiO3HxhwH0U9z5fnH/L/AE0+65/VzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P6Dc9jFe; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P6Dc9jFe"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4718aea0718so404001cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739292573; x=1739897373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1nIuSZ6KxwFnGB20Da8+JNpyVOtQk4sXCRgyB042lw=;
        b=P6Dc9jFeqQpXwsWussdv625RQl6iIUXF1kBCAE6Cx4vGllJbRd8gZ/ZCBkBSB2V6Um
         2Sb9yQM7dJZsWpT2uzRLKIzl2gGn7E1zUH86JEM4FOZqlSJXk4+ko6ScMY0YKBM8b+nh
         LzlHQt6YG4pej18npBLp3zVEqvOLMKBFhFijKzcQia0IU+OnTvkNe6CVPSH5iLvcblKd
         7rShG5Vy3EjHI1qCfUmfbGakmitRQMMu3jr+7aIqpFFjw1BCe9JikioG2Y8qO7vNiyKV
         Yc1P48J6XFPhT+GhLm77ch5QxKNqcb6DjLZ/T9pIF85IE6s36bo0CzOFpE/sEzkj08lR
         kwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739292573; x=1739897373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1nIuSZ6KxwFnGB20Da8+JNpyVOtQk4sXCRgyB042lw=;
        b=Ws6aQfhhDGXxzqnXikTRuFrPKFoGM/8ZH17N31w+CsPChjiPp6yLILyUAAw3JsRL+4
         dppKmBWWfwSQcK+uPZuho6RCW5SeLtCu8j9t+TWR6f8gfdWLd0xWU1Ka2/FWcFytfAns
         2dekWI1luj8vqq28YwidHOxtcI+OvmajvgJv5580YAjhcdhwNZdHWi+v1zkMSO4o4OIH
         RTIEPjBk05M0gNfhXi2eIC9VPpVLdgWf6zDsY+146Ry1GtarDOzoJ3k9Q8hv/VB3Iy2z
         O6czAyQp+pxhHSVJk2vVnrpeOBHwIJ/5gYGXihtDSR/mQxPO5am3wfoqTrTp8+4rWAQP
         sp8g==
X-Forwarded-Encrypted: i=1; AJvYcCV+5fkfJDjWlrNbcoIYFOe84CZSPrD2fsQqvUHroEo90y0xV560jIfWFyw3uuQbYPBNwtsfL0l8gxMQfRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWujy2IZhVHGIECi6zIfa6Y78Gf16frlvU8LX73hSQN2plgvG
	BC7YrwT0McPbtzpTvHB706QrpQ8RVg0pto5yy3BrjxSxkZDGSNNWlS271cY7vskT4pwlOIEK+N7
	sGil9xOBadpPTF7woUpoHCP+XUnFi6sGHF2Lp
X-Gm-Gg: ASbGncsTmniuB34HjlJ+WDuBBRiH5hLej8Wx6Mlot+dLaIKnCFGZHkvzcc46YS7pNgy
	xGRddfSVHlMWecQFqPDrVC70Y5jxflk6XH/Hpmc+PAhnwsHDRWriHyGDB2pHRs6biMw8XhA==
X-Google-Smtp-Source: AGHT+IH8gUG52NWRYpj36k6MCwda2guvEljw3Ky/hTqjGuftzb+0ECL3vc6zmSWo/Thb2/ncHMTAPy56FIwoZlZHe6g=
X-Received: by 2002:ac8:5dcb:0:b0:471:a0ae:7e3d with SMTP id
 d75a77b69052e-471a2611629mr3713081cf.20.1739292573306; Tue, 11 Feb 2025
 08:49:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211034856.629371-1-luizcap@redhat.com> <Z6sTLjKlX39s0Mo_@localhost.localdomain>
 <146d87a2-ad3b-4070-862f-c92c91df27b2@redhat.com>
In-Reply-To: <146d87a2-ad3b-4070-862f-c92c91df27b2@redhat.com>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 11 Feb 2025 08:49:21 -0800
X-Gm-Features: AWEUYZnqU281kPkCnUAwwbqyE9s1EUDqnjjPuaysAudIXiBNzTskWoeir07plGo
Message-ID: <CAPTztWZvg0ZUES0DpXj2JXndvfuZXzSXbDmJ3e+80hjvywFWzg@mail.gmail.com>
Subject: Re: [PATCH] mm: hugetlb: avoid fallback for specific node allocation
 of 1G pages
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org, yaozhenguo1@gmail.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, akpm@linux-foundation.org, 
	david@redhat.com, rppt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 6:51=E2=80=AFAM Luiz Capitulino <luizcap@redhat.com=
> wrote:
>
> On 2025-02-11 04:06, Oscar Salvador wrote:
> > On Mon, Feb 10, 2025 at 10:48:56PM -0500, Luiz Capitulino wrote:
> >> When using the HugeTLB kernel command-line to allocate 1G pages from
> >> a specific node, such as:
> >>
> >>     default_hugepagesz=3D1G hugepages=3D1:1
> >>
> >> If node 1 happens to not have enough memory for the requested number o=
f
> >> 1G pages, the allocation falls back to other nodes. A quick way to
> >> reproduce this is by creating a KVM guest with a memory-less node and
> >> trying to allocate 1 1G page from it. Instead of failing, the allocati=
on
> >> will fallback to other nodes.
> >>
> >> This defeats the purpose of node specific allocation. Also, specific
> >> node allocation for 2M pages don't have this behavior: the allocation
> >> will just fail for the pages it can't satisfy.
> >>
> >> This issue happens because HugeTLB calls memblock_alloc_try_nid_raw()
> >> for 1G boot-time allocation as this function falls back to other nodes
> >> if the allocation can't be satisfied. Use memblock_alloc_exact_nid_raw=
()
> >> instead, which ensures that the allocation will only be satisfied from
> >> the specified node.
> >>
> >> Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages pa=
rameter to support node allocation")
> >>
> >> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> >
> > Acked-by: Oscar Salvador <osalvador@suse.de>
> >
> > This was discussed yesterday in [1], ccing Frank for awareness.
> >
> > [1] https://patchwork.kernel.org/project/linux-mm/patch/20250206185109.=
1210657-6-fvdl@google.com/
>
> Interesting, thanks for the reference.
>
> I stumbled over this issue back in December when debugging a HugeTLB issu=
e
> at Red Hat (David knows it ;) ) and had this patch pending for more than =
a
> week now...
>

Looks good, I'll drop the same change from my upcoming v4 series. This
will create a contextual dependency, but that's ok, this one will go
in first in any case.

Reviewed-by: Frank van der Linden <fvdl@google.com>
