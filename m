Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545071CAA92
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890011; cv=none; b=sNfVsKcn9fdGOGy8AZIbGS9DGyXoRpHugKYHUygXyNFI3D79rWUuQp0GgVeSKbgMs6UyblnQLOJbq222NyrUbqnzzxFQXXG7s9mZZnqaq0L1BDNyMcvrMbxpKAq7A4TouXPDbZmYQLyQ2B9luFk2RcQP9P0A68rR4A6PKaejE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890011; c=relaxed/simple;
	bh=eKAYRm7XDUS7swVxsc3G5jNDgKyVsWWLtn2Dg6uk5Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAIm6vtoDYYVbiieX77d76L6dBiy8/tx+q4OdxDVQP0vOOZ5J31YkkmxAQr3wKOgzX+TfcGYn6m1HIa8lFu1Gdq9s0zDu1365EdEnVmorbQIqfxbY1wMY9HUqYDx3Qsyzo6+If32LGlwpSSwmAyFb35dyDJ3ybJPoB9+Koqz+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=fUdEJyQH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="fUdEJyQH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237e6963f63so18543815ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751890009; x=1752494809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imZtK0OzZK3Zeo/cbbG1P89DaWLXAEp250XusfJrT9w=;
        b=fUdEJyQHAZ0tQlbOeQzWBHoOOkAXxvU4ANNa5e2N1Dp0hxGvo/5ld9EbU5tOesv3+D
         +kH+Jjkekh+/KHNI3qvGBClztZFXewjl1p5IxyCabOVOgKf1lIE0/+tlH7FOwNF6BuD2
         5vX+0SvkqbKLVTaUb2sv9fsqNOMhD6Z17+iq4UfZ0Krgt3JTs+b7mizDriu4EIIRRq/C
         6wki+OSE1opVFhSTUWw+Em1sfnKyhBSEz3X0q6UKuLQP5wsnBq4aC+RiC0cT/cDGfc4B
         37oV2zgYsbXpcz8qa1qo1b4/cbmi1YqhrM2ribk8CJFVAe0WBp5n2CRv1yssRxjLFOd/
         EOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890009; x=1752494809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imZtK0OzZK3Zeo/cbbG1P89DaWLXAEp250XusfJrT9w=;
        b=K5R0aOgM1OupODTcS5lfKqH5e7bVZsPI3QxKZdJ4VNI4/yPzPBiirhsqYWYSCEuEUO
         AL8mcNnWmk1eGGiExAKaNVGt4zwwgXl78e7m3T6kU97fC9wuAFGHbIuzMhkLmLDNj0Yk
         agZwjCB0RHzOifFsh5i8S8hUQ48vFxq/VcZ3xHTTgORQlz+5b3y/v77csc/LYtK8AHdi
         iaEUCZ2+J9Tb2DS32ZRY9RFmLd8WlK4qb8cWVUpHFdxjYfzDFxsxegyRNp/Ce5AEObXJ
         ozkcV9iCtDgVPYAT+5WVP7v08pQjtrRPQwrVYRTDUsGKqGmagqSAFMj6UiReakhrS6dr
         HwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfq75A54o1SWfSCbp0F6setQGs4lHl5URSHbBBQN9/192sW9ozhWcMYEjKgAdogpSNZ5tuXdxGwu9ja5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4bg0AR6WfwUWDYClcvwSlH32zbbrnD9Gmx5jFirQ2hNirmZ7
	GOa3lZmp/Kb/D/+KgLdubGBS3gZGRIXNrQKnzKHIdSSIFcYHtG5JeXfSR2BT8OTP3MpndOEHTBx
	QnO+Yq5ocu9olmIdmQJeOZI/7C3QUhIaPOIfGVOuqQA==
X-Gm-Gg: ASbGncsa+QuZL1VxBt7XW7X/mBX9JyYcy29aHCINxO33G09wc7ZpwRi1bhQOZ4EMWd4
	ZK5dmH5rgCjm+vXEuc8MLohf/iIN0Me0xybFdW/QI8SbxnHTq3t1vpJLsatA1+Vydnfyi+nOtfG
	24cFe9qS9P4PUDmXqSOt/LpDsuzCP8IShLdPh8PGQbEBJCUhCMx0Uvby38Qol+
X-Google-Smtp-Source: AGHT+IGAGettpr7Zh4YhMi+D/Gpz0CtokabwTHRPF6x8/iKUnGwh++BE0HFb8yTQmL4QipNHlMfVLFrBPbIAKmC4x7Y=
X-Received: by 2002:a17:902:e80f:b0:234:d431:ec6e with SMTP id
 d9443c01a7336-23c8746618bmr172592505ad.3.1751890009576; Mon, 07 Jul 2025
 05:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com>
 <20250704133500.c21fc228600f70c51a16e04c@linux-foundation.org> <CANpmjNP2QgEO0grKPVRcs19PkSiDT1=8MiuCS1uVGeZ6-ye8-Q@mail.gmail.com>
In-Reply-To: <CANpmjNP2QgEO0grKPVRcs19PkSiDT1=8MiuCS1uVGeZ6-ye8-Q@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Mon, 7 Jul 2025 13:06:38 +0100
X-Gm-Features: Ac12FXzlEJlgs-kMZajXectzER6Si1oPDQUuNJpmQtoiAUs3ofcQzHlqThSOR-c
Message-ID: <CAENh_SQEF=tv4JDuJf81v8oVPNXM6OHwE+U2BodNOopb9=SqNw@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 9:13=E2=80=AFAM Marco Elver <elver@google.com> wrote=
:
>
> We could allocate this in stack_depot_init().  I think it wasn't done
> so far as requiring a very large number of pools is typically
> indicative of stackdepot misuse.
>
> In any case, I agree it's better if this were configurable at boot
> time. However, need to be careful to sanitize user inputs (reject too
> small, reject too large).
>
> Matt, do you think this would work better for your usecase rather than
> rebuilding the kernel?

Yep, that's a better option. I'll send a new version.
