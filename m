Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB912820A0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328143; cv=none; b=obSBOP1PQjM44qJMv4k5mWzmR5tahua30WaFMBjHJj4qY0GBdofAmzlR5ZTTbs2h4jMxZDjChtHPaPvmjXu8Jcm4RMrTw52LvJ4kNV8rvPtXZcTosKp1jW96k592kBmoGbVpDZOiUzq8THjfi1cqjxy2DFPTRku70zsfEfX4UbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328143; c=relaxed/simple;
	bh=GBJgXX66C8Wm8UKIRUzLQQOQBvi9O1/+0IHFieTDEW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKwB7NHy2sWcpVyW2rhLOoEtmTPyz2TVPGXfQmbA1bzmPbicURTSOtgntoc0sG6tI/nFM3HyHSUc7GaeoNhDVPBpHYJA3ldAsShKQaubgwg/MsD8aItkctItMw8bNzaHN7Zt7Dnmp6vnJIMognhqZLxpG6W3IMRKbovZ7jAxg5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQOzQ0Yz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQOzQ0Yz"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3105ef2a070so51227381fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745328138; x=1745932938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzVT4QVx0nOWd7S9jzUwJoZ+yI7SrEO8DW+8biG/0Hs=;
        b=aQOzQ0Yzt310X+ujWvRla5/mLOR7oqRupClovRcyYMw19kEWGhmt4MOTzv98MLh6xO
         FEpdUZWjFBtM3z+xWitdpk3xL3+Xh4vtox9PM4OKKe1J1nhVLxOXGOFNzCSXj4dTDuKu
         hu5joNKcVM+5ddimZaidqwFJsPtr0nCNGX/QZwGITyw0b21e4cQIFv+t24izPsx543X/
         Ua1W+OPl24QTQFOAvBtP4tewbi3JnWjTTAU4CPQai7DNuY0eMnLAYa/mBQYK2bXvtt2i
         3n919u1YtvD1HLdMfQ+AAXhmvku9of9zJ/kJL6gkBNkgoYR4zpgYgyC0wupnU1IIpsEe
         Calg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328138; x=1745932938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzVT4QVx0nOWd7S9jzUwJoZ+yI7SrEO8DW+8biG/0Hs=;
        b=wAWj1A1dleMM782CybJU+XVyzXqXFWzaxlPnZ8wXc5B9v36hEEIPBMAh2hqWV+9P+7
         HM1xmSK769YDCA2VAyBJcgDpIOLjl71PxN8jS+1G9zeME7cOCNwhRl+3YGk81sYwXit3
         oyrXonhen5PyiWYNEpUBxQQbMSHNgCyVs3mYMBbVsL95rt9gPX1e1kVLKLhpKRX6hHD5
         4tT2f06XnM0kubmiStG479TcMUIehr8zVSo2Rq3TEn5Afw4IJOx13jgk+Xe2X+KLSN3P
         iaVIdH4RvHPxoWBY+qSeFkgD1CXBSNXwFTd+PfyiYXwRuGkO0FHVorDzZFv7ANznd/VD
         qgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW44S6Mp3CHZYaLw75VF7WOUQ3zEsxmMi892f2pHLI3xlXqMh6I9pZjoj/JxQCV2iL+BwkeQqKaL/rg2Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNXpGX+Ozx6h7KrDFoZXppvkmF/XfEvRqj/tSbc/hK7fE+eKf
	HT+eMNLTVw4A8IskbGysWmiy9xD2apmwmx+VChsdhUuZQcvuP8ID4/2i+zxcmXyiJv8boJFj0Vh
	0x7Jk9xhjVFrV6SeDWBZ7AOk3FoIIZ6Ow
X-Gm-Gg: ASbGncvhkq5FnzuEMDoXnRqENw3OyHuspRSsEKeGD40O1FNXNtMN+1rSmAhq158zrfz
	Tnbpy7xQ8tIgh8X74bMjBx7oN0cX9l15bNvkUEfgsHHj0FUnjx6bYyu8gJAk+tsaelOX0XlZ+rI
	vk8snrqosBZlV3uWGh7zhNEg==
X-Google-Smtp-Source: AGHT+IEiYApBDZ8ldM5IyRg/YBPrdzMJuB1TZR22DJF2bP3Pf4LTjWT9Jsci9nfttqP92e1Kc6tagDG8P8noTT+rbNg=
X-Received: by 2002:a2e:bc12:0:b0:310:8258:c09f with SMTP id
 38308e7fff4ca-3109054e92bmr42175781fa.26.1745328138153; Tue, 22 Apr 2025
 06:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
 <aAeFYB7E2QiRNeoM@gmail.com>
In-Reply-To: <aAeFYB7E2QiRNeoM@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 22 Apr 2025 15:22:06 +0200
X-Gm-Features: ATxdqUEG1vTEwqlqfa028fwJlO7LtKC8IcDI5eOK8guFG_m53LTAtfbLkvZnkis
Message-ID: <CAFULd4bo0NGzZGLEs+pYoOJrDVLyKt2=Piug-LtU-WhFGwYTzQ@mail.gmail.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in instrumentation_{begin,end}()
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:02=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> > Use asm_inline() in the instrumentation begin/end macros to prevent the
> > compiler from making poor inlining decisions based on the length of the
> > objtool annotations.
> >
> > Without the objtool annotations, each macro resolves to a single NOP.
> > Using inline_asm() seems obviously correct here as it accurately
> > communicates the actual code size to the compiler.
>
> s/inline_asm
>  /asm_inline
>
> >
> > These macros are used by WARN() and lockdep, so this change can affect =
a
> > lot of functions.
> >
> > For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> > 0.17% increase in text size:
> >
> >   add/remove: 74/352 grow/shrink: 914/353 up/down: 80747/-47120 (33627)
> >   Total: Before=3D19460272, After=3D19493899, chg +0.17%
> >
> > The text growth is presumably due to increased inlining.  A net total o=
f
> > 278 functions were removed (+74 / -352).  Each of the removed functions
> > is likely inlined at multiple sites which explains the somewhat
> > significant code growth.
>
> So:
>
>  - 353 function shrunk by 47120 bytes, that's -133 bytes per function
>    affected.
>
>  - 914 functions grew by 80747 bytes, that's +88 bytes per function,
>    but there's 3x of them.
>
> That's a lot of net text growth, isn't it? It's certainly not just a
> single instruction or two per inlining, as asm_inline() would suggest.
>
> > One example from Uros:
> >
> >     $ grep "<encode_string>"  objdump.old
> >
> >     00000000004506e0 <encode_string>:
> >      45113c:       e8 9f f5 ff ff          call   4506e0 <encode_string=
>
> >      452bcb:       e9 10 db ff ff          jmp    4506e0 <encode_string=
>
> >      453d33:       e8 a8 c9 ff ff          call   4506e0 <encode_string=
>
> >      453ef7:       e8 e4 c7 ff ff          call   4506e0 <encode_string=
>
> >      45549f:       e8 3c b2 ff ff          call   4506e0 <encode_string=
>
> >      455843:       e8 98 ae ff ff          call   4506e0 <encode_string=
>
> >      455b37:       e8 a4 ab ff ff          call   4506e0 <encode_string=
>
> >      455b47:       e8 94 ab ff ff          call   4506e0 <encode_string=
>
> >      4564fa:       e8 e1 a1 ff ff          call   4506e0 <encode_string=
>
> >      456669:       e8 72 a0 ff ff          call   4506e0 <encode_string=
>
> >      456691:       e8 4a a0 ff ff          call   4506e0 <encode_string=
>
> >      4566a0:       e8 3b a0 ff ff          call   4506e0 <encode_string=
>
> >      4569aa:       e8 31 9d ff ff          call   4506e0 <encode_string=
>
> >      456e79:       e9 62 98 ff ff          jmp    4506e0 <encode_string=
>
> >      456efe:       e9 dd 97 ff ff          jmp    4506e0 <encode_string=
>
> >
> >     All these are calls now inline:
> >
> >     encode_string                                 58       -     -58
> >
> >     ... where for example encode_putfh() grows by:
> >
> >     encode_putfh                                  70     118     +48
>
> That still doesn't make it clear where the apparently ~10 instructions
> per inlining come from, right?

The growth is actually from different inlining decisions, that cover
not only inlining of small functions, but other code blocks (hot vs.
cold, tail duplication, etc) too. The compiler uses certain thresholds
to estimate inlining gain (thresholds are different for -Os and -O2).
Artificially bloated functions that don't use asm_inline() fall under
this threshold (IOW, the inlining would increase size too much), so
they are not inlined; code blocks that enclose unfixed asm clauses are
treated differently than when they use asm_inline() instead of asm().
When asm_inline() is introduced, the size of the function (and
consequently inlining gain) is estimated more accurately, the
estimated size is lower, so there is more inlining happening.

I'd again remark that the code size is not the right metric when
compiling with -O2.

Uros.
