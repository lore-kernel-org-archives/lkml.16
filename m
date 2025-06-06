Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D161534EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749232800; cv=none; b=nUB+lUXNzapLxpCU4Yh39NEMkRqXmrpf1EpNrKOEpizZ6CTd5FqYaAQL/sY3L54NTzzAeRe7gLGKX/zMLtEMJCfp7zFaX7EODp+YIPiRfyRZQI6fuOi2M3xVZHvuk7smAcj7fvg/Bf62aFNCOe1L9eunkNrKAvFaJXjU/LxBwP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749232800; c=relaxed/simple;
	bh=PjsLhVF1NGe8KiUZphLqGCt4qiGPh4k3b4SoMWdG6hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAVnJR9y+5kK03uv5TTilAw+lMcSeNtLazUCdFotbuZDf87KR4mgvr9Pm+YJiVFId0arkSEIeLkIFm2Mai08IeqaZGAWpxYvuNaz2JvyC1ORGMlYE9kJ/6yPVRB8X9EK8FnPIEMibaa+/KX8gLOUhenbDfBFO20+Y3oTWRNJT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZKf2O/AF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZKf2O/AF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad883afdf0cso449330366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749232796; x=1749837596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+v1YS9YeUfW2XDDNQKHeXCKxgjakHapNGSD0kALzzQ=;
        b=ZKf2O/AFvwLl9MOVKXZf4eR3FjTyvJd5QaReNt7Osb/PJEYyo1l26qTY3JZP61/pbv
         7R1A3eaPzRje25M9U4WuJqNPPgwneFCORzFyQv59lJVhOa3/JJLNpOYs1qP5DZwlV3v/
         m2BTXHqUwakzhcoRejLdcI2cvCPABmhhCaLrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749232796; x=1749837596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+v1YS9YeUfW2XDDNQKHeXCKxgjakHapNGSD0kALzzQ=;
        b=wy+z17GbkBQVVlR1r8U5+cNjDvXsrr1EY2QnPiLp+EDvOeTSio8usVTPvRYSkyvakt
         VCE0+GLf3ejnuzeO05wuHd3cIu1YeWE7is93hKgYg6unhcY8jHl2xCEat/mX+wRpljg8
         FDHgLAkDgIp8N92F1X6C89eNKH4Yo6iwusUkcStlqm/GbOdTeclF97BZ8pB8AW9zwaid
         7514/S3XH23U+1ve2L5DR26UhNBuo5m+qMgnDl7zCf8RrakaxKnkvu37/AilTexh4ukA
         6sBoDlxjm9EvFdGOWU4jyuWiYRQFZJtze/VoSJ5+7NVEo4W8KXBlyVhEUfYLPsD8KbK3
         E7uw==
X-Forwarded-Encrypted: i=1; AJvYcCUV5vMwUhSIb/1Q+0ujdvRFnT3BVbFqF/1GYNZaM6fIDfXYqGnvnAv3S1VbRKff57+lZkl/cmfHy3Tc0uU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yV8UTPWuxBab1GWj7mZ2KoTq2qdmvW17QPwcqHBsejuHpScm
	QQrwzUC+imPzgxAd+BArlUdQAYkVOn/p28QRpY9DGiW2/kUbIQHYlv/xUoFGtMLUBwBp7LwUlgp
	ySUZsusM=
X-Gm-Gg: ASbGncteThxkEqK0KY6aYvxZUAzT8ABpjfVGecMSFaUBz/md3h1/5h0H+HsbVMc6D9x
	gUmMm8Qase/xPaRshpAghJGNPai4UWNTxz4fgazv9V5vaMfcsTVf5VNy1fXC9fIBYBa7yZYvmTm
	mrXD5r+HeYV/6QUtxJ14IlpWwnZD6FOeq+5ZBZg9k94WKDGnTSyN8iL6qENP/Hv0HLYINkzHTpH
	ZMDFWFdapUbMer9nL3Fa1H8WZcsIYLSDRn8D93xCsYhRKDakvqmQkf8xRgH2+pGctQLA8b5EPuE
	jyDg2SnWjggwR27rPOUe5W+sywpj/LzyeWXg/V73HZbvBJIrtrbFa6XOMU9eU9kj1w5jQRzxE0w
	/u25V/+Oxucisn4oZPsurm3Mhx5k5RloSORsa
X-Google-Smtp-Source: AGHT+IFkt+91SCPdN1Ney3u47AxuSKUBpxRW/CpV+iC86n0bU8jiENVv2pDcRmHWa2SCD7kSVzongg==
X-Received: by 2002:a17:906:c0b:b0:ade:3bec:ea29 with SMTP id a640c23a62f3a-ade3becf28amr19746566b.25.1749232796346;
        Fri, 06 Jun 2025 10:59:56 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c732sm151587566b.96.2025.06.06.10.59.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 10:59:55 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so4664967a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNecGFaLS6Fd37KCImHxCWoWgajSR3l5KKtvdErMOvrXnc1wttGikzNB1kLBG2siiARl4jhhlt3z9/JV4=@vger.kernel.org
X-Received: by 2002:a05:6402:5256:b0:606:ebd9:c58b with SMTP id
 4fb4d7f45d1cf-607734170dfmr3312072a12.1.1749232794688; Fri, 06 Jun 2025
 10:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAGudoHF1yh2CoO-jzt=M7z_114g_Zw3-gy1yBW56tAsjb0k_wA@mail.gmail.com>
In-Reply-To: <CAGudoHF1yh2CoO-jzt=M7z_114g_Zw3-gy1yBW56tAsjb0k_wA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Jun 2025 10:59:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=whtSN8VRY145wGZ=Vs9syBnG5fn148_Hcw29Pxxq3gtkQ@mail.gmail.com>
X-Gm-Features: AX0GCFs1YP5372RLadpMfeEFuF-F-SuuBquXOBmt6lb8sHElAxNZZsbwtyBvwYM
Message-ID: <CAHk-=whtSN8VRY145wGZ=Vs9syBnG5fn148_Hcw29Pxxq3gtkQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org, ubizjak@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 08:36, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> So if any patches would have to be written, how about fix up gcc to
> emit better inline asm for these to begin with. ;)

I really want to re-iterate that these kinds of "I want specific
behavior" things can be done with custom spec-files.

And I wouldn't object very much to having some kernel build support
for people doing custom spec-files themselves.

Because I suspect we could do some of our gcc-specific flags by using
spec files explicitly in the kernel, instead of the tens of flags we
add by hand to the command line.

Now, maybe things have changed - it's been years (decades?) since I
actually played with gcc spec files to do things - but it used to be a
convenient, if rather obscure, way to have site-specific gcc behavior.

I do remember that it was a pain to just add some incremental spec
file, and I think you practically speaking have to do things like "use
'gcc --dumpspec' to dump system specs, modify them, and then use 'gcc
-specs modified.specs' to use them".

Maybe that has been made simpler over the years.

            Linus
