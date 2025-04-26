Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84318C01D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 04:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745640700; cv=none; b=HMHUDFVasPxuq83XF3iCklbwNX6ErbdY+aQD8ewHFUWOLQ1p+4XfEwFlP+nhldgqMeI6rsU4xP8jTh87cgmmayd1AV3guG/yf8zR5sLR+4hbjbyIKczxGBxp1Xs8qTsb4PJkt/g29XmYvSXAU0Ll0MM2pENQtf6gyOUBEq2QX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745640700; c=relaxed/simple;
	bh=LZaA39QZ/1ssboLrqcr0tnGr9TONpBKqHUvnz68tQ8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXIntzM/ZH3qST6M47osfX4FRZ+rcuAQTh1JegW6czLeTQOzpq9vg2G4je3irycioONykyCCiKugSC4NNU+RXoJee6KKpvKWVanFZmlq2riGysg8caWLCSZby7wMXqEjteCXr/tYWpwtJczWFMb0WC+rpgCm1OL2p/3I9Zo3tAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bmcq/u1R; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bmcq/u1R"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso367016766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745640696; x=1746245496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eyFr35xmw7E/ixwUNF7HuIhiUoN7WKp+7IA8FTndH+M=;
        b=Bmcq/u1RB1lM5/VGjc8i38+Dx04UFrmd7ooQOIRdasLO83MLOVWYrL1PMb4yxWidDV
         8LOH0iQgGVQw1ALUHnPUjdJ2Zzz/GHmbSD7FHnKYjRdmoLAX5eMBTwdmDxg/TKEWPBSX
         H33boTApfw6+ZLt9zoPv+SXZxOCddHgcnNp9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745640696; x=1746245496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyFr35xmw7E/ixwUNF7HuIhiUoN7WKp+7IA8FTndH+M=;
        b=IC1dSvYDHrTe99y555cFe8Es3fv9M+Ffp7AfRQywAinNaCdARHEKwi00rG/UNGTeBc
         P2QgVcHBAVpeQM4v515lk4+I8mL8jxC1Lmv8wXxrnBXAGwxxdWn1bAZncvG+PRuzw5MC
         nXRm70vkHWEMYZp/p8eUfjUa/U7w2kVPZvR93YYLeyKw3VmHfAWbQmo9fG5TXbGcWh9A
         LHUx2IOTlvZfjUtWu50+3W+lV+Q1Yn7FWVCNI5LuQ/bruxBYKAo7WVuhM5G6j/bMVByF
         Td50cUKw4aO/cCDUf40QRhaGvnEsITNj8ZhOu11VY6KMNu7vt9dP4uOot4y3tovlBf5d
         ak8g==
X-Forwarded-Encrypted: i=1; AJvYcCWFH1OIwGrEYgnI3y9QMNMmkkB/4vWZo9jghSuQMvTS22lQsLhViO13yd3I4LfBbkPPVGVd7Whvua9VxHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLvycK+7FhEz6HY38/yPwJUD6YkRBN4tk6nb9qbelKJCBA2l0
	h4mMkus0cJo0dqJVrVteEvrAs5Z8TrQR0NA+/KmeALIPLoEvKZ4BOd65DTjZNJDtQA9sKs2umLd
	4owg=
X-Gm-Gg: ASbGncvi2KVlsFOg2p0sMvBzvm2gbv0f07R0t1OpDpwKZHqTh8G02HFglpcskJonvgn
	bj7WdU1Anhbi3PrkDD46GEEpQ3TFBFNmbG+enTtcrer+VhYLMXx/UKjcW1VpYgyrAGgVonaNP3Y
	qiMjFm22JE26g3cFPQYVTAT+i6nu+cwZOBXpAwTvGOrkDwE70slFHWT+ZHoeL2zkl27u/gQrbfa
	Ttw6AdTjd2pAW+rI4IIXc03Nwl7koXw1TxaoQJ5ztrJ/OD4GTEheq8mxhtm56+Q2k7z5h8Sx7cS
	LyTWddWy73MKRT6rrhEIG4ZlueLUGmP5I0dN5uqLqDyaGzH2U6Pqpcp+D8cy2eZApH6d08h1oDW
	0ysg6Z/8cPVIjsQE=
X-Google-Smtp-Source: AGHT+IFc5p4tyURvGYf7Zegh5YK9NXTOsP2zpIEiHMfqkBcyiF/FIpY8LYF1BgZCaYSFzCecyntzxQ==
X-Received: by 2002:a17:907:1b1f:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ace7136c44bmr406092266b.44.1745640695987;
        Fri, 25 Apr 2025 21:11:35 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf7397sm234705866b.92.2025.04.25.21.11.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 21:11:35 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so5066912a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVu1axZRJKornLEdf+FxHUe5w91DGu7z8PdqZz4Ys6PIffmiyszB/2AhEJhM6bzo0KrBbBhamz+R8u6b8Q=@vger.kernel.org
X-Received: by 2002:a17:907:7f8d:b0:ac2:912d:5a80 with SMTP id
 a640c23a62f3a-ace7103925bmr389163066b.5.1745640694818; Fri, 25 Apr 2025
 21:11:34 -0700 (PDT)
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
 <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com>
 <lmp73ynmvpl55lnfym3ry76ftegc6bu35akltfdwtwtjyyy46z@d3oygrswoiki>
 <CAHk-=wiZ=ZBZyKfg-pyA3wmEq+RkscKB1s68c7k=3GaT48e9Jg@mail.gmail.com> <opsx7zniuyrf5uef3x4vbmbusu34ymdt5myyq47ajiefigrg4n@ky74wpog4gr4>
In-Reply-To: <opsx7zniuyrf5uef3x4vbmbusu34ymdt5myyq47ajiefigrg4n@ky74wpog4gr4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 21:11:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGiu1BA_hOBYdaYWE0yMyJvMqw66_0wGe_M9FBznm9JQ@mail.gmail.com>
X-Gm-Features: ATxdqUEOndetjy9WXSDQF_xoaos9kB0PLMfvWcYcUeLMoKS_bINLgYq1z0VMTUs
Message-ID: <CAHk-=wjGiu1BA_hOBYdaYWE0yMyJvMqw66_0wGe_M9FBznm9JQ@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 20:59, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Yeah, Al just pointed me at generic_set_sb_d_ops().
>
> Which is a perverse way to hide an ops struct. Bloody hell...

Kent, it's that perverse thing EXACTLY FOR THE REASONS I TOLD YOU.

The common case will never even *look* at the dentry ops, because
that's way too damn expensive, and the common case wants nothing at
all to do with case insensitivity.

So guess why that odd specialized function exists?

Exactly because the dcache makes damn sure that the irrelevant CI case
is never in the hot path. So when you set those special dentry
operations to say that you want the CI slow-paths, the VFS layer then
sets magic bits in the dentry itself that makes it go to there.

That way the dentry code doesn't do the extra check for "do I have
special dentry operations for hashing on bad filesystems?" IOW, in
order to avoid two pointer dereferences, we set one bit in the dentry
flags instead, and now we have that information right there.

So yes, people who want to use case-insensitive lookups need to go to
some extra effort, exactly because we do NOT want that garbage to
affect the well-behaved paths.

And no, I'm not surprised that you didn't get it all right. The VFS
layer is complicated, and the dentry cache is some of the more complex
parts of it.

And a lot of that complexity comes from all the performance tuning -
and a small part of it has very much been about getting this CI crap
out of the way.

A much bigger part has admittedly been all the locking complexity, the
RCU lookup, and the whole extra 'struct path' layer that allows us to
share the same dentry across multiple mounts.

The credit for almost all of *that* complexity goes to Al. Because
some of that code scares even me, and I'm supposed to know that part
of the kernel better than most.

             Linus
