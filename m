Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3D1E9B03
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746069163; cv=none; b=lBNj5UyrORrUYJiv9Q/2VahisYxOrZn7//+sHAG2KA4gC8DBpWGbac2bQjs8fpk074ysPNHu0T5mkqGcoJDAkBj456d1tM1WIUz0ttn/jXlI3YGfvtDKe2M/S92Ua/BRE+AFbJDEKdTld5xWKrKOl12rJaXJ3xmkgKSCqq+BdhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746069163; c=relaxed/simple;
	bh=3Qs+LMUQu4ZZ9m3bGStlH/F2gPjLzRKPh3ITFdqZ4EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqftmgZjF/gLP+Mf0XmijRwWw9B1ij1sFnIgy8TiQri8qzJms9nmaHd/lpCXbYmVAHiIVGjrVERnLsIF6WkIM/2RIZm9UGIqb9cj7mWWFmX/qt093hLWidFGPT5+CsxJF3nuOSOUeRiggVjxV9FWotcoC8j3x49XIRp7PGIAvAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JB+kOAwP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JB+kOAwP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so1167386a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746069159; x=1746673959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC1oQVKn70KzlSasLkTsE0MQR+OTmhnwfBz3Xe1R3C4=;
        b=JB+kOAwPDAKGzyPwVTQShbQfE8XqYM7PYy7O/m66J6KzjjK2/hXtupvmny5oyjqHHT
         uxm3vhmVpfZXZduvvAhOLv0FXEiIxNetwvRikaxB+lCHUTg5qWnX2BF6KuULw77567dP
         qGrlidxQRMo9PBy+fhljulSyqXlF1+2sdnKbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746069159; x=1746673959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC1oQVKn70KzlSasLkTsE0MQR+OTmhnwfBz3Xe1R3C4=;
        b=qiqbEAr6eMhPgZGRGc9lpB60qleCWhpIz+cErDH4+qC3Q3XhdCpswANvsijXw8IIPp
         UTzeKRexh5zjJRc4eJrD+J3HByaCbrhgOXNhfhQnuY+OACnEu5kFltADOvjZJnZKwPM8
         pVh21NxrOf8BjSOfpN0X0yCS/T4S2rEAqsgyEk8oFNNoR0Da291maxsfRi+CFp4rAZc5
         PzdSd3rXjHaetwKDw3znj4/RiImUxn/fOIzs5aR4QCzCMD9x97KWISXJJztiXWXGuk10
         wul7BGua9kDMy6PXiWHHDYn8Q2O3vrgL2X6FXjFeV4bsbbn3N93EdL+CubUsIBrWZMXq
         BiKw==
X-Forwarded-Encrypted: i=1; AJvYcCWXJdevfIR5h4AwVQoJFSQEkeJ3jE+N9LZfIJzYEEiIZa7iaZ3vxHDJpnby2i3If8qzWIgKuwLe2PNWvvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YweKE5OEAsaR1xLFUZO23eVP6I965m1gx5625pn334VT0WAo6q+
	EyFGS1Fb9R3731It6s2SCNgKiUIuIKoaxzfNmt9SmYgDe5tryb/iEZBXFkH0kf16PhBf4zyJRgc
	YHDQ=
X-Gm-Gg: ASbGnct7moeLk0+joYOZet3s9VJGI15SzmynL8UpcnoXTNzqqWv3T0nvHUUZkm9I7No
	PQRmUNriuS8HlQxePV7EmQD7/HOxAFxw8duf0y0SQcenqSS/24PyDWVH0p5bh3B1BV5VvwOLdQ+
	A0/5GalwqlWBNTMaAZjo1BOXzakLtNkmbk6bvZaGmCPdt0QMCuzGY2GT25pWiwPgD0tQMizZ/kM
	nCoevNVU78bFLrmJ6JzbmJr/D0eYD8eJ73E4rfZuRW7TUihao9JOTGgpVF5NP3ST5/AhwO/8eWb
	jvV7c+uAY+K1RrqMhmliezOdZunjRk0SN+5vxh/dAcjjQD5A639Qot9JiYK3BT+ctCJ4iSiqG0v
	tXV8L9pSzrWX1nL8=
X-Google-Smtp-Source: AGHT+IGv+08tPm0jVAj8Q0RS+TWOKdaNrBr5lmsrvQPzkV4e6u5gHVmFzk4hrPRxFYL0N0XIXziF5g==
X-Received: by 2002:a17:907:948e:b0:ace:d166:8fbd with SMTP id a640c23a62f3a-aceff566a9cmr67135966b.59.1746069158903;
        Wed, 30 Apr 2025 20:12:38 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59668fsm998881366b.83.2025.04.30.20.12.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:12:37 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso78179166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbm8XMi4vohuVu/ybQmZQvDLgBzdfffxBDMj2GHH34dmS54mimAt+fEtrUuMRcG4WCjWJds9EBIGiZLmU=@vger.kernel.org
X-Received: by 2002:a17:907:968a:b0:ace:d650:853e with SMTP id
 a640c23a62f3a-aceff41a4d7mr74472666b.15.1746069156852; Wed, 30 Apr 2025
 20:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
 <20250425195910.GA1018738@mit.edu> <d87f7b76-8a53-4023-81e2-5d257c90acc2@zytor.com>
In-Reply-To: <d87f7b76-8a53-4023-81e2-5d257c90acc2@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Apr 2025 20:12:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgwuu5Yp0Y-t_U6MoeKmDbJ-Y+0e+MoQi7pkGw2Eu9BzQ@mail.gmail.com>
X-Gm-Features: ATxdqUHanefpUI8GyxvaKB734S5zjy2OepCny55RpmWEo-qYF6q5WHIuuXBquxk
Message-ID: <CAHk-=wgwuu5Yp0Y-t_U6MoeKmDbJ-Y+0e+MoQi7pkGw2Eu9BzQ@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 19:48, H. Peter Anvin <hpa@zytor.com> wrote:
>
> It is worth noting that Microsoft has basically declared their
> "recommended" case folding (upcase) table to be permanently frozen (for
> new filesystem instances in the case where they use an on-disk
> translation table created at format time.)  As far as I know they have
> never supported anything other than 1:1 conversion of BMP code points,
> nor normalization.

So no crazy '=C3=9F' matches 'ss' kind of thing? (And yes, afaik that's
technically wrong even in German, but afaik at least sorts the same in
some locales).

Because yes, if MS basically does a 1:1 unicode translation with a
fixed table, that is not only "simpler", I think it's what we should
strive for.

Because I think the *only* valid reason for case insensitive
filesystems is "backwards compatibility", and given that, it's
_particularly_ stupid to then do anything more complicated and broken
than the thing you're trying to be compatible with.

I hope to everything holy that nobody ever wants to be compatible with
the absolute garbage that is the OSX HFS model.

Because the whole "let's actively corrupt names into something that is
almost, but not exactly, NFD" stuff is just some next-level evil
stuff.

            Linus
