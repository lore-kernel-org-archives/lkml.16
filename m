Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD038282EE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283401; cv=none; b=gM7oqzOoIKeoZQkxLQCeAcCLfa7E/Dwl5oDQtM41EkV9heUQYF2DB25lO7g9f2FkCWCfLNMAC1+Ho/rX46xACI9i8QfDJvrkNW5hehjunnQl++zbLkoFPK6Uop6syB0BzGiYPK5vZwMxs/PNjKeppRRjaytWsM2BD57RPVZSeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283401; c=relaxed/simple;
	bh=Yti0dMuXOfMz+GOUAGdIPgikMBNHti/eNkrv7dgoCjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnJFKC6QKOFPxzwGFkiwUvqfwM4icjA+omDoCQdgJTs9tgVlOVgtKlh5UFUh2RvBnJIZwW4MHv9NIEZb9VZSGhU7t1Vifn6eiATPu4Wc7VOYkvrOfFC5UcDsA5YfqbOP/NQ1iXS/jXmKk1uPLUQe7q9Tp5CJ0I2Ge8pkx0XSHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jj84ZILo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jj84ZILo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad883afdf0cso115002666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748283397; x=1748888197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5uFF/BVTIbwC7dCbZZat5iUD7SfmLBEKXrmOAY5Bp4=;
        b=Jj84ZILotSVE4LxnrdvVE/YgukBv7kQpXMSsG0nHM+Ddw1Th5tiD/0rgk97C3z/IGA
         zyDRyLFLLRciW9yQA0XyaWlMxvzPCK0zCmiUO2YSoGV49zWk1cC9jJNb8j6pBDwxJgcm
         s25fJuHLUNYyvB3FSnWG0+U0jmmBZWNi0SSEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283397; x=1748888197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5uFF/BVTIbwC7dCbZZat5iUD7SfmLBEKXrmOAY5Bp4=;
        b=gmW6kLKAJmGSemGzQCTORsHCcwRde5E+zpp2ga+xvz1X8s5gOT/Gn6+K81YhQdyqxd
         L3UBWudlRlesnNuTseLzVCs71ZJNek2vtou1/+5W6uNA0GPcp7Y37Vb4n8jXRVPTF/WM
         GDlOCGaMElXZcXjaLJNKEI7SuJXWM4pV1wrL3pDyUmabWqxxH0DnnOiKDePDXyQezyMQ
         CLYuzKIext4QgerXGXZfgMzgn04tFcDshg4ATsPkViC627ZFnSR4QL+KzJgPZivXjHSw
         H1apc8ZWmNVusXxtW6jqSUrCLgk1091WIq1ljJSpS4h6Q/3gVkhTN+ejfWhl5gKtjgD3
         QGCA==
X-Gm-Message-State: AOJu0YwPuRMm344EolYT0ar67YfNxVVccqqwuLnNih/VI57iwK+AzKNB
	kxGjpakH+DJ6gfG5dzJmfQhl7mD+JqMQuDYaaS78KrBHdHAYDiXAN65tZQ1g1sSYw6JYHE5Hcgs
	Ve0xL2aE=
X-Gm-Gg: ASbGncv4n+H7iQhF3Veh/zkr1oPNWilMY1RuqeEi8OopSnFeduMZ+pKIiBrZOY4U1PF
	vBwQ7+N98DiUUiuErNuBTGMV3PTIBDSQnJQmUg/jsYq4BihjQy0s4J+ryOg/e/YNO70lnngKpmZ
	9KRBd/jrIyH1kyWHr/Avz8Wv50yhw7ox5NmrxmLnOKPfkPS+VFHrtCiE8BRL/ZdFi7ghCl9rdyq
	VaXqJ9AXfRTw1l8PGVvxnB+1o0QZcnVDe8d6W2/56No5+idAz+HpDIjubrAtQAqUGnZSuIqNY9Q
	bNC2LV+beAr08Do5VTmss7fdXARXmTwcQdO3gkUsYtSBv+xwMqYEYrlu/mI0L48mVvz9/F8EUgh
	IPlXAEA4tiWemI4R0fy635iN7UsFigLGEWIrt
X-Google-Smtp-Source: AGHT+IEXR2R7PLDK9D5q8G7Zt2DEM8698CdM/xtbmziLyw/59gxkYRH4BxrB20ef6GArQqJCLyBjqg==
X-Received: by 2002:a17:907:c26:b0:ad5:a29c:fda1 with SMTP id a640c23a62f3a-ad85b207af6mr1038597066b.46.1748283396767;
        Mon, 26 May 2025 11:16:36 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e821sm1733031766b.17.2025.05.26.11.16.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 11:16:36 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad883afdf0cso114999266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:16:36 -0700 (PDT)
X-Received: by 2002:a17:906:7088:b0:ad8:726c:218e with SMTP id
 a640c23a62f3a-ad8726c238cmr338824466b.61.1748283395799; Mon, 26 May 2025
 11:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
In-Reply-To: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 May 2025 11:16:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
X-Gm-Features: AX0GCFuUFCqeQI3Ua9ZEp7_M0Q2Mk-B9yPPbicMi8VVDJWEZ-6ivICVdlD-5joU
Message-ID: <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Masahiro,

On Wed, 14 May 2025 at 22:15, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Please pull some Kbuild fixes.

So this isn't actually about your latest kbuild fixes, but more a
generic kbuild thing now that the merge window has opened..

My build times have gone up by a *lot* lately (and by "lately" I don't
mean very recently, but in the last month or so), to the point that
I'm now finding it to be a real annoyance due to it slowing down the
merge window for me.

I did a profile on the load just to check, and it's all just gcc
(well, cc1 mainly), so it's not that something else like ccache got
enabled.

(Things like ccache can speed up builds in other scenarios, but I've
also seen it slow things down a lot for the worst-case sitation when
header files change, so I wanted to verify that it's not just that)

So it's just that we're spending a lot more time in the compiler.

I haven't tried to bisect it, and now I'm too busy to, but the two
main suspects are either that KASAN is now enabled and that just makes
the builds a lot slower (if so, it's my own fault - introduced by me
in commit 6f110a5e4f99 "Disable SLUB_TINY for build testing").

Or it's just that I upgraded to F42 and gcc-15 itself is perhaps just
that much slower.

Anyway, I'm emailing you exactly because I'm busy with the merge
window and this is causing issues for me but I don't have time to
figure it out - and so I'm going "maybe Masahiro is aware of this
already"

I also did notice while timing things that the final module link time
seems to have limited threading

For the rest of the build, I have load averages in the 100+ range
(because I build with "-j128"), but then the last few minutes it
starts dropping a lot when it's in the

  CC [M] ...

stage, and when it hits that Makefile.modfinal stage and we get

  LD [M] ...

stage it seems to have serialized completely and just spends 100% of
time in one single 'make' instance.

But that may be an effect of the link being so fast that 'ps' and
'top' just don't tend to pick them out at all, of course. But I do
note that the LD [M] phase seems to be entirely serialized with the
'CC [M]' phase. Does it really have to be?

               Linus
