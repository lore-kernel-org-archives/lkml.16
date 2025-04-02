Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4519C54C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611238; cv=none; b=abgzDHQzZqeFRx2x6k2813ArYwXeL3e5/WjlcO4PXU9aSKMbnp2an5IxUtwpH9k8oOBNUJZ2jniB562NI4G1ssJWGHe+L5BhWrlCeg64+nHhN0zlo4i6QBs1HwBl1HUUxIev90Z0rwn7YhmVWmvrsYy+E68zTrl0v+HGzjqYdao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611238; c=relaxed/simple;
	bh=44k7kmF9Heh1axcX60vhvBSddhWWyYlpyTedqElkVy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYPOxCAh6okN+GE/iH9txBrn6za5GsdD2TXFmUcmAQt4ZebSmHqm6k4GMQNsG542b25SvADOPLtjsJqan3RMrS4diut0QUG/OUmZ+an3BBYjRxLUsi8BI1CxjQsSjsqROxqKuA5jgdYW9yoUjenOqvNa03TcArli4lNbrivVols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwmcdSes; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwmcdSes"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso33234a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743611234; x=1744216034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44k7kmF9Heh1axcX60vhvBSddhWWyYlpyTedqElkVy8=;
        b=OwmcdSesdWannAZEv6wpwSsXAebR76OvLFJUPjXdZFnbYFQi5L+IqwCoGr3JZJAnbp
         CsUQVol0IQPBDBE+WLoISMkRNiOlo1O3svLuo4TzmGSrGTi53cDMY0SDtj31b0Oy95eG
         HQiTAPreJkg5JUF4bHX8Jgv0te7AKhKsOiztnjPmsmYE6D93DfhOQJW2rzeyCW+spe/T
         msCW3lrDfLcmUFRdeoYc1BIJf62CiXJhjWgQQmrh/TsXKqyt2hoFLHMCklmhcqHAEjzh
         1c6cd6ZfZsXzyRqNg5L+f1OJnXQdhqTldjl9caTQTMnn7ptcqG58FObHo2Ff0o8+J88u
         7YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611234; x=1744216034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44k7kmF9Heh1axcX60vhvBSddhWWyYlpyTedqElkVy8=;
        b=D0bXKUolb0R6TsqvTZlofc7x1pHzg0HFcCKb3QUGOdFJ//cg08CSY95wZeySM5c5z8
         p3VBdw8BcDGB3v03Q25AHpnPi8K0LHK2k43w4Xlm1lO7RoVZeeSHfk0ISScYpItgizFM
         6VQaILurqll6retCLprpNGBG85HvLfxCn7nnczf8P7JgY8z25w1hqzSXKuiDaPukINp7
         o0XbTgyYsiesbOxzBRP9RwPOVOhao8c4TCx07cE9YSrs79kbQIk6gqe4ak93YmQ75z61
         U1iamXHY3q4qsdrAk27IZ5Pc/RAz3/NtxD7lxRk4ICdHKL/S+/7l4RRDFSFUPufnavAS
         WWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUbPN+OZ91zo6+jQJBTy06erBxhmhxoMrWRCdJzhSVVr/4Ezchg3hdwO6lyiRekQHFUfmibHonRfyY1UvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqrmLAodXPj4bFFMMLSG0i3zmxMQyo1DGVwPmPTWkgxd2lNdMS
	LR5AMWmBX4LkMu4wzi7lTeR8gCky7plwsvWLYxEtk+mEonBbmEYuktTkjU2Dma7mQ+RqQYmR2wE
	aZXB5GLqUs2IVDEDoc/EdkhpWSiI=
X-Gm-Gg: ASbGncvIhRcYEH5Guc/wgy0j9BKW4oqr165wFNHBfeQ5sSmhsYe+FtBP9c3L40H9zp3
	hvH9ZccaP36yRPCqTSL80eOGCUByuDX5ME3+gpFHm2yGaKfS2DfT+7PTvxM/AmjncXBOfdVxbcq
	Vc2lyzWnCYg7X4eLdr4HH7q50z3/iPcrs0wI4=
X-Google-Smtp-Source: AGHT+IEnOHT6hOVDHiNqwvM3gOQnQeSxW+1KveJ2xpZBmOQfzfFxPoaWlwyo7ThKDEbEHo5q7T2hTL1FbZ2eK4mhbTQ=
X-Received: by 2002:a05:6402:2706:b0:5e5:3610:8b7a with SMTP id
 4fb4d7f45d1cf-5edfcfe6179mr14596201a12.17.1743611234211; Wed, 02 Apr 2025
 09:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw> <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
In-Reply-To: <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 2 Apr 2025 18:27:02 +0200
X-Gm-Features: AQ5f1JoDofdtjUwMStWknBzTyrnCYW_pJ4WVgjQ6yTTt1NBqqY87USBqCHJng_M
Message-ID: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:22=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 2 Apr 2025 at 06:42, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> >
> > +ifdef CONFIG_CC_IS_GCC
> > +#
> > +# Inline memcpy and memset handling policy for gcc.
> > +#
> > +# For ops of sizes known at compilation time it quickly resorts to iss=
uing rep
> > +# movsq and stosq. On most uarchs rep-prefixed ops have a significant =
startup
> > +# latency and it is faster to issue regular stores (even if in loops) =
to handle
> > +# small buffers.
> > +#
> > +# This of course comes at an expense in terms of i-cache footprint. bl=
oat-o-meter
> > +# reported 0.23% increase for enabling these.
> > +#
> > +# We inline up to 256 bytes, which in the best case issues few movs, i=
n the
> > +# worst case creates a 4 * 8 store loop.
> > +#
> > +# The upper limit was chosen semi-arbitrarily -- uarchs wildly differ =
between a
> > +# threshold past which a rep-prefixed op becomes faster, 256 being the=
 lowest
> > +# common denominator. Someone(tm) should revisit this from time to tim=
e.
> > +#
> > +KBUILD_CFLAGS +=3D -mmemcpy-strategy=3Dunrolled_loop:256:noalign,libca=
ll:-1:noalign
> > +KBUILD_CFLAGS +=3D -mmemset-strategy=3Dunrolled_loop:256:noalign,libca=
ll:-1:noalign
> > +endif
>
> Please make this a gcc bug-report instead - I really don't want to
> have random compiler-specific tuning options in the kernel.
>
> Because that whole memcpy-strategy thing is something that gets tuned
> by a lot of other compiler options (ie -march and different versions).
>

Ok.
--=20
Mateusz Guzik <mjguzik gmail.com>
