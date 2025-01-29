Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F521E2843
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186153; cv=none; b=CYLH9VYnyi38XXpAVy5CS3bkYQjNj8s8eMfND8k/y55fQM5NRtjUfCNWFiSobA8eMXfJ++/D8POM0g+xKpPJXPUfdsitMO710xEL8koF3afAA2n05atWOYfCOdZmGTbAdvxQVbCFAMA+73rwqDxW9YvYyUkzBMmyxChorFMwQpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186153; c=relaxed/simple;
	bh=c8nW3ZmYDs1X/So5oD/3bpCh5qukpkvLJpoz+Jwk82Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dQiNqyYbgMcoHy9ibaWbkH8iyS1SdfhPcbTrttnekgmQl2BVUIjJiZr54CXvjhW8FCs4JdPTCgI3MRlK2Q1bY4XcKirGIiGt0LEQ2msf3VoM/Ofbnq/xOrk7YJavfyNN0XLPvJ72RZM0C/fP0aK0B+06p5sepnnC+mwG6f1Go2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYto4+h3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYto4+h3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3061513d353so520261fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186149; x=1738790949; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=TYto4+h3X/k6G1222sGax8pH5w1E9hlja31DprNKvxd63rCrYwzyBr/lUHbJl7KpSh
         I1cVy3pviZCr4o5eoHuOTSdarOpsLI5sMWeLIzSJmi/ob7wL02fleyDiHA24n9E0I5Af
         KSUwUbimreXGgzBOw142ZuDl4OCQCt9NRnHTazLmkFYUyv8xfkTjjEv9NMc1ZqgIII5a
         y0QsMvNRpFp8KHi+iylbqk1mvkeK9g742FrSsQLl0V8quVWfp6rUzRxBAMw35NgijLGY
         to7n/Wb/jtWhPlAOcK0r0n3o/XwcS3zbR2vzAAXN24bAmWf41DZqkHn4csfghC+LAfIn
         fWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186149; x=1738790949;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=v2Ri5fJsOx0w7EG3pVx6o8If9rfDV3+LkwxV9YfDe+M2hT0VwmmbM0Zi9gIVwmIkK8
         o/zJXupGqJQ4uxvJ6B1FTToEeXravEyMIP7QSBZUE7Oe6MmYxXxdOnXtTClliwy+ywCV
         rr8BoAbBhFlYUMP0+QJXctSJbAqjZ+0BnsmRzmKworFo7RPaZ1G306cRJ2WrlhxId7VZ
         ZhuWRnzGFonO27hOngJAfyzP2eqGkrscblVQQWgMwKYeTZgwwOtdizjFD07Bi5bCu9Sa
         C57XhlcgTb/5xrhKJZSe+Mk/qs9MJece1kzTFpevcQIrQWtkt7WDqESAU/03lFp+yu+5
         GxXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEyz1VipjeYkAdqm/SonMsgSObQryYU+IyHr+N3iOToXeFLBpQVKivwN5jMvAjOLzKdZlZ1yfYKSrxCaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMA6TRQNlPX4s3U75xbBGSLdnV5RzuUK2SyfNARcZaK9qk09F
	J4U1SLh8IPfNZ5UEKb0r2tPt+Zv1cfOctr2RpwgMujYSS19tiQHjIxQhqOW3528HednYJNojCNS
	epmCGKuvaYWtkoGSZYwE0WszIgfA=
X-Gm-Gg: ASbGncu4yIA/etWfaD8Du+XW6Geo6dBfxGwwMbPNsEY+cT3eEfB2k9APHRuuVLTCdlB
	MElSRapXhys7J/gTwFr8OmKG1hllHLeYKa742D3HJecpjijmfpv2ct234RtU/qQt6biNpeyjAM9
	CDnJlzVAkT9ZaNatpfwJHR0oxCAL7jJg==
X-Google-Smtp-Source: AGHT+IEini7TIAvHWFfZWJAA/DIhlgY7ELxTDYTMmVhvFmOP3+WEeVrbZSpqp7JMDeFBEGMKPTMSdGVLiQ0G7+RO3zE=
X-Received: by 2002:a2e:bc26:0:b0:302:49ba:2550 with SMTP id
 38308e7fff4ca-307968572cemr17704121fa.21.1738186149080; Wed, 29 Jan 2025
 13:29:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
In-Reply-To: <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 16:28:32 -0500
X-Gm-Features: AWEUYZm30qzC7OYicUCyM7022EFlqK5dvrSLqA0Ri2_QEk_6Vs9gveN9uXDYy-8
Message-ID: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	tamird@gmail.com, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > + Liam, Matthew
>
> + linux-mm
>
> Thank you Sid.
>
> >
> > Hello,
> >
> > I believe this patch needs to be reverted for now as it breaks the
> > user-space build of /tools/testing/radix-tree with:
> >
> > In file included from xarray.c:11:
> > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such fil=
e
> > or directory
> >      9 | #include <kunit/test.h>
> >        |          ^~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [<builtin>: xarray.o] Error 1
> > make: *** Waiting for unfinished jobs....
> >
> > this then prevents the maple tree test suite from building.
>
> How are grammar corrections going to the right person (but not the
> mailing list) while an entire conversion to kunit is not [1]?

Very simple: the tests are not properly included in MAINTAINERS. I
sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e3=
1f30f47@gmail.com/
a few minutes ago for this reason.

> Does the patch really need to drop the module testing too?
>
> What exactly is the point of converting one testing system to another
> besides disruption of actual work?  Who asked for this?  What is the
> point?

All this is described in the commit message.

> Is anyone doing work on the xarray running the kunit tests?

I was doing work on xarray and I was running the kunit tests.

> This should be reverted as it should never have been merged.
>
> Regards,
> Liam
>
> [1]. https://lore.kernel.org/all/20241009193602.41797-2-tamird@gmail.com/
