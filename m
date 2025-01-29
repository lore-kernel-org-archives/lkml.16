Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFE18FDCE
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192142; cv=none; b=V/LNOF7piUblbFN/neTPLFmGbxRmykz0YP0jK8HxUYYH7s1ng9TToLKiHj75NnS5W88jF5QPkI6O24ZU1cRQKjNJAFf7K7rqV11cnP+4rgKaEk1uoNInkzSqJ6AuWhZ9fF5UiXFVpBDd5U4uF/0BkX4oKmTSQ6437xLG8FSdHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192142; c=relaxed/simple;
	bh=3aFeVwWbkAiwkd2VaAROVCziQzzUR7JbWU5jgWJLJ5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYA/YwORYrWeBu1V4icwT+/hYUvP9Mx5ujHCnd/XgLRLeCMtetRGBNaBlGzjTdahNy+Kmq5mtm35saIVIf0+OlEsAN0UvDh5ZFPOUBDljAIy92Ws6h4y7UI3WvwBLCCoI+Eydig6/tWDJrmtaBihtJmVWpfRQmExtvRyhp1ktXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN9fdDEQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN9fdDEQ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a59so1496551fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192139; x=1738796939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=NN9fdDEQnUJzh5C1zalI04tCboIE00ezPDc3Z7pwcZp62j8B0JcYJxdtAZGZKiKrsy
         rfd37PPQ9fcfq6KSokaqCrOCSTatRYRGrbst+kZMaZfBaB71lu8bKP1wByX6Fc/droI1
         LDMqiO7QPie+A8ZO/RE2bTz/wkZzeeEj5FOqvERYdcCF6ZWdgJ+ocytlMV9OUMY6/1Pz
         3r5mq72B2zbFwQGMrYbCg/idUSbt+M5ql7eg5kbHdoLsUpa3JnZ+D3la/51iVzf8O3F+
         Rk2EVwIo1o4HHfAfIM4NfcaAncOip5yt53pN/hqJLk+SzN3EvfGmnvZE0MhXrHKxCoIr
         3tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192139; x=1738796939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=P/vXFc2VQA65/IH/6WhcjzYPa/bXe3EGFqwJ2pe3Smc6mN0xlPpgRTSUNooF2d8lTj
         XAkD1cWBie3jeNUOzeR8dce5VqRuPGKv45EqhvDkxBOOhN30ywLUt8JMYGJn4oa8K7jJ
         p29+PSnycs3U07aLanjFeqWgq1r8jbW/Io4q6fUH1qITLn2AqPDxOVAf7p7A1VOWdzmk
         nu4mfLy2NBev7pHbLOlfGaORBaDxkETmwJugD5SvzQetZcqEgM8EZw9rkxf7u8ADNDBL
         G5eN7BH+Xnxv7yvakpxyjOkqm3gpY3SosVUobK5CzJqFlgKX/I6Oz7bCE/pZtWOCJ6o8
         hwdg==
X-Forwarded-Encrypted: i=1; AJvYcCUTan9ry2AaNhAbXYUak/n9x+AlpngdvcV+pe81HamO23+IQ0wPBpZF9AXSYl94vW3d5f1Krq3FfXFAlLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEEDBAAo5nX2ADsTr6EUqf1+zX72get6OooKa6zs1lTG5xZN5r
	0ynXo0L4XYK6gl2TDEKt/VwybhndJMykI+JApmzyfUlgPDeV3b3E3B/aRyfelr6vlsLjm4Ji/sr
	OCNMyZKgWq90FYubRJixIeHBXKHc=
X-Gm-Gg: ASbGnct4AHLgrS8v2L8zAiitnH/q5k9cuE9d7ESYsRBsfqgTiDRmTaWiRe7yk62GfVO
	2zp06HzpHysS6h/PUuWqWUe6Sh8UQDzn4Pl7GO1+hMOktWmp3/EGHP5G+TQcgvn+5BVEA3n1/bl
	Dug+nlfM3zn06t+yQZ/NBR/H0I0SuYRg==
X-Google-Smtp-Source: AGHT+IGw4hDomqOPsGmP6ryOmQMcXXWdZqLA8giCzG80P3G1E1mNKcM08esBXc35n67oCdPU79/hBsdXpNJs+7goWuY=
X-Received: by 2002:a05:651c:220e:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-3079680c757mr22614121fa.7.1738192138842; Wed, 29 Jan 2025
 15:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com> <Z5qzk_92KU0xoLcP@casper.infradead.org>
In-Reply-To: <Z5qzk_92KU0xoLcP@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:08:22 -0500
X-Gm-Features: AWEUYZnWxaXWv5__MIDVh4wuy5lxhHQnPr0jMuSdSi61tZVSWMfJQozfaebSPPI
Message-ID: <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:02=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 05:33:06PM -0500, Tamir Duberstein wrote:
> > >  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> > > Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:=
1/3=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D1=
7%)
> > > Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,com=
mit_signer:3/3=3D100%)
> >
> > I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
> > doesn't know that test_xarray.c and xarray.c have the same maintainer.
>
> You need to use your brain.  You can't just say "I used the tool".
> Tools are just tools.  Sometimes they're wrong.  My email address is
> listed as the Author: of test_xarray.c.  You should have noticed that.

The whole point of tools is to liberate stupid humans' brains like
mine from mundane tasks like working out who to email. The tool wasn't
wrong; it did exactly what you told it to do in your MAINTAINERS
entry.

> > For what it's worth the kunit invocation, while obscure, is
> > self-documenting. There's usage information that's reasonably
> > understandable embedded in the tool itself. I looked for the userspace
> > testing initially but failed to find
> > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > meant to compile this.
>
> kunit is useless.  The test_xarray.c module is useless.  If you break
> xarray, the kernel won't boot far enough to load any modules.  You
> haven't thought about this AT ALL.

I don't understand what you're saying here.

> cd tools/testing/radix-tree
> make
>
> Then you can run the tests, whichever ones make sense for you to run.

Thanks.
