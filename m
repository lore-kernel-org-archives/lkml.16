Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565C1A23A9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100573; cv=none; b=D5J0NKWDL4Mb5Mg4rSVxIDXFUII2mInPFzTPJyL9vRX8CFpERfE0a1zH/ymaBvDKZ9uJmPcLbsVKvpVV7IOAmxHNJlU5/gWKgtgDLManvQ3PByDDDma14YgRY3VekvIV5Ok+xd/Lw0NJZHy285D3vkECII32CiUZmDWzdxImasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100573; c=relaxed/simple;
	bh=6+hoqbF7qU3gB6hPBCrL3ucYUOOv3ajc9wz+ntu6F1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ybj6b+qPN9NYO2mvyOHj3WgnMGaE/zhDyVSZHeJwPkh1y1HWQxmRkwVX1LMaOTj0IXMnpxu6uGLXVtUqxLVqlAfd2eQHP/FDHQ4ssyYBbJhhFgcn+5KXDDlmMPRL/A1rA9OpRNmVF+0PFW0BPDnRSYMkyyHpCAErZns6zjYrSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H+JE2fC3; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H+JE2fC3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a440a72584so48118921cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750100569; x=1750705369; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI9wxfdohUcaRkceGSkpPvsSG7L6Cg48O4vTLDe4N7A=;
        b=H+JE2fC3AYonTkMe14kXBMIV7G6fdDiK7+w0gQPWIn9k5kcjbKjkGvowbc0DjRa3Ca
         ILPaF/qpD1ZEx9cy+TsfFDozx38QhhOmcTWz9K9QE1qPXJaKVDcNRrqRMfW3SdzdG/DV
         ndw6qSWEHPeAPrbex4aArBdvxiz7tWfdYbEGS6ENQxLDCI6lkJr8+aryzfo+Kdlhujlm
         br5WbsI0Ewl6CGBBacrvTKWqtbrXf68XbfHFyd404UNNt6ugRY7T++BRZrhZ1KAftTdw
         92eHcx5jrZJVxSG285wiSzG3STE9RHrSrADKsmGQh5drPG4rVls0gp6DdA8GcIqIN5Eo
         vrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750100569; x=1750705369;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI9wxfdohUcaRkceGSkpPvsSG7L6Cg48O4vTLDe4N7A=;
        b=xHvgtoSYh9JdWsaKgfRksHTlaxKcY/NVz79XS+DdCWj+tGaOfKq44KGHoU+SBhS5sK
         zrG5KnXIqA5nU55z5EoAeaMgzL1fawFqOuCUDw8BVhIQwGH+bLxvGlnonWGF2qjYlqFj
         2Y0monbJY+J9SQAvuXG8X7uv5K1IzR8wEX6mdJQI29njpaes1z018xmqNDp4/+OmT7OE
         dXAQ/W+zbtOn5yUQ0PFc0Z9RoJhrACi6v3b6r8MY2b8JP2o8UHwznLxDgbF8mB53eQJT
         RkrxcvcYi5Ins6aVzuHpwny+OiMDu+kBgzR++2wipoPe7XvQ4CCJDVZOp+MuJpE85W9m
         Ny1A==
X-Forwarded-Encrypted: i=1; AJvYcCVAh6SqCFESZp8G3Yq7n4Bt4ilA2gvnR3jMm7gemuilTu9SuatyQnYI7LNgMOnnHXhAANzCzlOC6B3Hgn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6CWb/1kDREgR7pY/eM1if7MOmgDPJRevbGBOu73ALUsMvQ4bJ
	kmKHpVQH6KHZA9Y0r+u1DlvRpMk7u7N9m23ck84sxdF1SjkQjSN//bi5XXAxMppgBlg=
X-Gm-Gg: ASbGncs5k1INuNWH/HqewcM/PyB7MugDvKOnRWklylzDzrAMH1hiGVz75Ic3+ynHe4G
	2wrXuF9Gkv0FfndHeEfEp7H05yDl9sWhgE605lUuMYVmgtHgVN12r0LNP/PPWUzVsLQn8EBWolC
	9KaaYtRqSKPMPoPs/yZps77wJkp+uR5rG8zWTFS+HFa2k30v19prowC1ygBxN7AjzJxFvNqLtAF
	MSyarxDbs2L2XVtSVYbIx7ATlBN9SRTfpdLZHMQig5JGpesPXi2vczjAenMIXqK0+Adn79nL0ug
	nAgYIYhr5pB90IAXVNxxtOuoeiCMKQTiklRLgRF3gZLoMyO+iXmbdVPuryQIjgkZM6vLBF2oFl4
	Wq6+JGc1K3AjRbYtpdMawuu6E6w==
X-Google-Smtp-Source: AGHT+IGH1k7/kfQPsaNlU5APqCbpKu79g9Wmdgx0D/D/dqeH2i3+cbiUArmrWmkRhN5wTAe0Ot8Vlg==
X-Received: by 2002:a05:622a:2d5:b0:4a2:719b:122e with SMTP id d75a77b69052e-4a73c53b18dmr167480441cf.18.1750100569165;
        Mon, 16 Jun 2025 12:02:49 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a31716bsm52491081cf.35.2025.06.16.12.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 12:02:48 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:02:47 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    David Laight <david.laight.linux@gmail.com>, 
    Oleg Nesterov <oleg@redhat.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mul_u64_u64_div_u64: fix the division-by-zero behavior
In-Reply-To: <f256c2d1-6f35-447d-9f21-30d0c4a2419a@t-8ch.de>
Message-ID: <8s7595q6-208q-r756-qsrs-4ononrp3n7o0@onlyvoer.pbz>
References: <q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz> <f256c2d1-6f35-447d-9f21-30d0c4a2419a@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463781375-202099526-1750100568=:1551"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-202099526-1750100568=:1551
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 16 Jun 2025, Thomas Weißschuh wrote:

> On 2025-06-16 14:48:44-0400, Nicolas Pitre wrote:
> > The current implementation forces a compile-time 1/0 division, which
> > generates an undefined instruction (ud2 on x86) rather than a proper 
> > runtime division-by-zero exception.
> > 
> > Change to trigger an actual div-by-0 exception at runtime, consistent
> > with other division operations. Use a non-1 dividend to prevent the
> > compiler from optimizing the division into a comparison.
> > 
> > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > 
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index 5faa29208bdb..eaa0c7e8b974 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -212,12 +212,13 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> >  
> >  #endif
> >  
> > -	/* make sure c is not zero, trigger exception otherwise */
> > -#pragma GCC diagnostic push
> > -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> > -	if (unlikely(c == 0))
> > -		return 1/0;
> > -#pragma GCC diagnostic pop
> > +	/* make sure c is not zero, trigger runtime exception otherwise */
> > +	if (unlikely(c == 0)) {
> > +		unsigned long zero = 0;
> > +
> > +		asm ("" : "+r" (zero)); /* hide actual value from the compiler */
> 
> This is OPTIMIZER_HIDE_VAR().

Excellent! I thought I'd seen that somewhere but couldn't remember it.


> 
> > +		return ~0UL/zero;
> > +	}
> >  
> >  	int shift = __builtin_ctzll(c);
> >  
> 
---1463781375-202099526-1750100568=:1551--
