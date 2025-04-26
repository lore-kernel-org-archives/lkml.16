Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7828373
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672808; cv=none; b=C37GypoJvUi7YIkuJfmecIlxDuUeNw5EN8ZDPcPAqkz0yKslE9Q6qPuR2ZoxKTa3RRUu/m1GTsFVWw6WrE3ujMeFGosLsbwNTAU1zPGDf2klCzzJL2o1w9a8/6JqGq/8ti3x1uO7VplT6ik6MYFkS1z7qblBwhZVlZndfzXSAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672808; c=relaxed/simple;
	bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/y7ZXCSix7OoVf/LdsG5D/mFqx1rC7xECPQ10p5c+97HiRRz8oiI8SfLz/2x35wZ3q4CeqjjOVc/Rnrf5R5jbzr2AIq4eacc0dhqT7I6pxPMlXWP/Us1FQIdWlOWX9863PI0GlnSYzJWFLjiX5ayUbveo5gZgh1ylyvVGfPL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=TYprgeyH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="TYprgeyH"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30332dfc820so3890523a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745672805; x=1746277605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
        b=TYprgeyH3paEbw6qhzg8c0Jzboi4BawbumudxfjxwlLEDL2EOdxRa/Seh0exY1zZc6
         MkTDw5IYq2C8I8+u61Hbs/2EvcNtV/QDzhGEP0fYNUXU4u3itr/W2mPUxHtwYLAttqlC
         i8rM3i/Q2ujIo/GTRx36or2tv17NXyLKqgojY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672805; x=1746277605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
        b=gcZGFdbsr42knAyD/II1yw27S6tCNepI2wPEmVEIv4vbsFpuS+h7/8dlQOGn9C4arR
         nkOvPWwHU1sKCYsEih7AvZiV7ea3OjeER3LFMLVS7j+xONfKVxVyoDWn7dILxKTzmXol
         GDm12va/rCS8y49wpnGirk98Lh3oYFBT45hrqx4TX0dEKS09jH6a+NieNxIoffQxqXP3
         eeJEuYGqCaA8G1h5LCnkwj3Afc2b1dH4YZ77vU4Xui+328TLehowjrM/Oq7A+C3oKXsw
         sWipuv0oF4lNHYUMrhCrxWbya8rE5GulJ1J2GDkduu/qmhsf7k7amRHtTRWm9M1hVP7u
         KoBw==
X-Forwarded-Encrypted: i=1; AJvYcCWN4KEx6Latwz12abIjxh+j/IPSz8s8YNpetYrPHqy25vs3lccvBRayuEodu8r3iWGNuThhrrwswDvt/LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycEW6UcV0fS/cFe38DATeAftgFqtwAdCGqs9sLhQvqps/jq5nc
	eIsBSKXYQIAZCXbJHFp0U1mPIOCPdI/YFHM28EA/lCkYYOitcmuYWa+yRdgJ2kQvs9ov1s8txas
	Var+P5/OrEELdsBIOfnHp8yI16HiGNMII9IkqjA==
X-Gm-Gg: ASbGncvD5NJylYKWRiBbr5/engHU38ZVzRR3j0MESy5uurM01ceBD4hDLlTCBpoNgy1
	zs/3qOfz+bm41+/7dorzIErDpsnL/HBg15HiMykrnEJTyZkb1EI6zJ5TeZMByxfxkX/ZVtW8srM
	lS6m+vRau1GHmxMqJwlcdWmjYcMkMTJZGJ3Sbu3U0ULBJZTH1ehGiT9Or2
X-Google-Smtp-Source: AGHT+IGEnPlNRu9+3F9xFzOQGqys7rsSoXQK/5LuIDKUDuUshdzQ/sBW67JMAT5qemipeJFWaK/XnOBrmNWIm8Ruqgg=
X-Received: by 2002:a17:90b:2245:b0:2fa:17dd:6afa with SMTP id
 98e67ed59e1d1-309f7e00979mr9790877a91.17.1745672805377; Sat, 26 Apr 2025
 06:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426041212.4141152-1-daniel@0x0f.com> <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com> <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
In-Reply-To: <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 26 Apr 2025 22:06:34 +0900
X-Gm-Features: ATxdqUGsmFXy4Vf-bYG9vLpgPLSGMqnnCiDCkFUKc0t8rFEC8v7yMRUEnllwNtk
Message-ID: <CAFr9PXk5ycoZYce1eBOUBvnP_m7swPLT-giHDQSXaa4ywe7mZg@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Greg Ungerer <gerg@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, linux@weissschuh.net, linux-m68k@vger.kernel.org, 
	geert@linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sat, 26 Apr 2025 at 21:38, Greg Ungerer <gerg@kernel.org> wrote:
> > I need to test actually building and running something for nommu but I
> > will do that later today.
> > Making nommu test automatically might be a bit difficult though as I
> > think it only really works with some changes I have to linux and QEMU.
>
> It works out-of-the-box for m68k qemu and a mainline kernel configured
> for m5208evb_defconfig - when using the qemu "mcf5208evb" machine.
> That is a nommu m68k/coldfire variant.

Ok, I didn't realise there was any working nommu machine in mainline QEMU.
Does direct kernel booting with a ramdisk work there? The tests for
nolibc require that.
Either way, I'll it out tomorrow.

Thanks,

Daniel
