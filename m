Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7D5A79B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745638871; cv=none; b=HovoxKDhFDEIIClaGOd2SmxPVFWoUhN3kDMOoniASZYWSLeLVpszYpVC+ZeE4ZaXtJW7bCFJqnzXfbEFOQioOXndUXq6QFwTQ8/Z8oes4hzLDgv7wkMHA0q9/1coB3g+imtjPBOHbQiDy49YK9ECbKUMcOhbtmb2U+UN5KB3fS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745638871; c=relaxed/simple;
	bh=0eHXO77AAyGUMGMq7VTE6t2K6BioW4E11zC+/xXCKsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5STYPlKwriQbJEgiRBWp5r0zxdTaEhqK/NjJc/gqlVTgghbb5cm+TU5E9fMM1Hm8YHft9Kwo3htZ/61VbHIMmyLwoQUKqnRRPqTW8BQujh2wZ53d6lTJt2vKJYA+RN4M2i2OwKotskC2nms/x4yijdXGkybNWyEvkOrclZHeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UTiPNFfx; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UTiPNFfx"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac339f53df9so555343266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745638866; x=1746243666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jnw7cB8PnBwNO4vq3emLlRW++0sbsZCdtmwKmtUbY6A=;
        b=UTiPNFfxSceVJD8M1up63SzdIgXxJjkc9VCFcjxV2aDPkh/is4PTlXAmJY52xeOJhL
         vylFPxx8lHmfRSITw0NGEX3UN5Q1iMdlxIs23sioNl9Nf5UkDD2fq0cD6/TRNf0e/b1B
         sAC5B+5g8BxAmqKAUCSiYfc1jgfPAWV8U7qcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745638866; x=1746243666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnw7cB8PnBwNO4vq3emLlRW++0sbsZCdtmwKmtUbY6A=;
        b=dkbkj2ZPDGORKvZNB/c+PBh1DDYIxTZ/0cwhQzQJSn8xvfLmeb2O2CeV2Qkitmrm/b
         jXcGrZgXfrpabTqMJt6eN1uGJRIx+tu8oEGz50bJ50s6/f/YnMW5pHQKYrq++AN81Ave
         +n7i0993qQtW7ZWaG/lIt95XxvjauNX+dOW9KCBB8tvqxVK8kkxncz3xMEfcsbKBMFS6
         eYySyefEz9nyPnLZgDr5JDZJ3JvkXct8we1hnwcaIfyCmzhvSftbRZneIRkRZujvFl0D
         g3eFFvVMM+aPbWiOIorHSh4yJmQ2ScprSQLiHFBQKXsPZtLRsYlA92pbtAYsINXJWS6W
         MZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHEgc3yKgwy83tcA7EMP8MZdk1hVZKjYaoS/vefl05iZdb3cPPwexsL3Sfm4woxHj/MlkmRCKPOQ6H+Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FnEN8SXUB/qxMOw6n/kFYLdQSdEOZ5m/5mowZShXc0x9WXgM
	Ft8kwRRgh+ovNnrmi1mdmUwab36Ix+G4eycQv3PjuHbPRzmZDxgXGu+4hkCDljWdOqaTZaq6mtI
	hfgo=
X-Gm-Gg: ASbGncvIiyufPuMzs+p2O9InFrbv31igQqM/OryERudNMjpzRbW9VXFfcdG0D5al2oG
	2lxJDcmKaoW3L5booJFyw2l1P1HVCQoxsxBygImC1WKqQ9coiRKUwLNsA5UpVosxVt0ARbBKG3Q
	DizUXO6qD/hb/eG82NEXTMCQI+j0tOrOzdsJuxGHUG37RSWXNbYpy8VpYZGKn7XgKfM+zCT4IYq
	mF2crh5p0R5jtclz8IWP9pETxMV0/u5Lxu7KRD1GTMW4cWK0TOXPjtt9D2M9t9yH0U+ZxQk4eiX
	wWFS/ryZy64N+pzULhMg3z/0zteafX5sXX6t67Ql1giv5SkvwC+YrydbRNJyOJc1PqvuGdFmFaW
	V0iVnuUhFmcrQzYo=
X-Google-Smtp-Source: AGHT+IHTLW7e5pgXbFK9qNTzUaWD35Zj+bGpJy5Uluh0HcBSdLaYroGMb5Z+s2jYhMtephS6jKlh/g==
X-Received: by 2002:a17:907:1c0e:b0:acb:8aa6:5455 with SMTP id a640c23a62f3a-ace848f79bamr126743266b.19.1745638866057;
        Fri, 25 Apr 2025 20:41:06 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7d93sm232908266b.51.2025.04.25.20.41.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 20:41:05 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac339f53df9so555341366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:41:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+8sd8o0Urhq4vv05tYI3ZCzpBpbLU0+rIp9r+ouaSl05E33IV+Js2gvCSfuPdpr2R3XYPGvNlGNGjyQA=@vger.kernel.org
X-Received: by 2002:a17:907:3dac:b0:ac7:391b:e68a with SMTP id
 a640c23a62f3a-ace84be069bmr123676766b.60.1745638864888; Fri, 25 Apr 2025
 20:41:04 -0700 (PDT)
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
 <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
 <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com>
 <mlsjl7qigswkjvvqg2bheyagebpm2eo66nyysztnrbpjau2czt@pdxzjedm5nqw>
 <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com> <lmp73ynmvpl55lnfym3ry76ftegc6bu35akltfdwtwtjyyy46z@d3oygrswoiki>
In-Reply-To: <lmp73ynmvpl55lnfym3ry76ftegc6bu35akltfdwtwtjyyy46z@d3oygrswoiki>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 20:40:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZ=ZBZyKfg-pyA3wmEq+RkscKB1s68c7k=3GaT48e9Jg@mail.gmail.com>
X-Gm-Features: ATxdqUGH7mQMKhNc_ZyOpUoBrH1zpBO2k8Qe7v9LI4_RH5cpFyznGVafbugfOHw
Message-ID: <CAHk-=wiZ=ZBZyKfg-pyA3wmEq+RkscKB1s68c7k=3GaT48e9Jg@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 20:09, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> The subject is CI lookups, and I'll eat my shoe if you wrote that.

Start chomping. That nasty code with d_compare and d_hash goes way back.

From a quick look, it's from '97, and got merged in in 2.1.50. It was
added (obviously) for FAT. Back then, that was the only case that
wanted it.

I don't have any archives from that time, and I'm sure others were
involved, but that whole init_name_hash / partial_name_hash /
end_name_hash pattern in 2.1.50 looks like code I remember. So I was
at least part of it.

The design, if you haven't figured it out yet, is that filesystems
that have case-independent name comparisons can do their own hash
functions and their own name comparison functions, exactly so that one
dentry can match multiple different strings (and different strings can
hash to the same bucket).

If you get dentry aliases, you may be doing something wrong.

Also, originally this was all in the same core dcache lookup path. So
the whole "we have to check if the filesystem has its own hash
function" ended up slowing down the normal case. It's obviously been
massively modified since 1997 ("No, really?"), and now the code is
very much set up so that the straight-line normal case is all the
non-CI cases, and then case idnependence ends up out-of-line with its
own dcache hash lookup loops so that it doesn't affect the normal good
case.

            Linus
