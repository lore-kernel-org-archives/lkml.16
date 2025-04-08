Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E5224F6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110630; cv=none; b=I3UuVvDIXB9e7gzTBkErQlx2Rz1psxkVI0cOfJ73hlwV4cLpvgJC/lY+PSuzuWaPflwxWa5IvOkqBJMn+jV9qkjxm/BucLKMcvEv6DdQISdtcPVGqyJZyr/8AqqT5zi/xFGcBukBfbO6rNYVWtl/mVMu4y+wAHjYGxy0KMIoSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110630; c=relaxed/simple;
	bh=haphWEsmnkdF3FBOASjlJmCfB4RAski/jB1dEvi50Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOShWnH05fPGnTZWMNgqlJ8pGRi8rC+aFGFSODVDYxxyp6tjyRaKpPXY01MCZ3ljq5DSWiAxKmksXC31/Mpzy0O/iXHr4M57bF4wZQpeclnzdFruN+QAUZzmeOAH+2ziSRO4qN/XcD8WNSBxICJQZuZfW1+aVvhvKdzdmjoeByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjABPPri; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjABPPri"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b10594812so6027128e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744110626; x=1744715426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nERDCIPN7R83/iIgoOEl82LvymnihMYbvb0Pud6bn9A=;
        b=TjABPPriQfq3Ujh1cLTi1U2w74WKQNwmAQ1jFPxMM+eeY4SaaOZUWG/xHFW07Bq7OK
         yHjYOtqJ7qAkazYLTvqAYx/R2SM02IAbZGKN+FH/us4y1MZzEiDF//uj1ruq3ST5qsGC
         9kiSmcbCQCC+WRJZQ8sWgn8rmDvVcZUZ8CGJ/OywDB/Q3+pPUyf21cvHQEzyj61+fLan
         6w6DQDe0KLHkzwxxhWBZkNJKKebwQV39n7tDzweVfbXDn8fQl/9yufbF6tVPiqwvbKM/
         cCX/NbU9l/BYI/0cOKZlnMphDf2pCY0Og8mzax3NLvYQaIhRV8mkuK/ZHpnLTHrsejFh
         knzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110626; x=1744715426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nERDCIPN7R83/iIgoOEl82LvymnihMYbvb0Pud6bn9A=;
        b=FcNat4FkzzF+P7ZLMI6SyRSY+9rDu1LIOuK60vRz4x/1COeVg9fdzUs6pvpkIOrf1H
         ImvMalASRJeMKQQhEewdIwbC2FeZAZGoL0lb8cwk2VweqQNWdEh5WH5GngH8ztuvENPV
         1BrsY68M0MuFj3tIbRZNe8t+/MvjFzFFdpdu3gUhAAVtfpd8j+R5w3p06xLH/oDNvsmo
         X6+mKt6Z+IrUWuxnmsECZqod/kbrZm4kZoMxagjZAY08qE0zryOAkrwBI3pF5mDoxBbE
         8TDz2lpFUn7ZQM0ozRLgjxdfUdTY4JbynctYv0C8IPkvjTiQVs440vDBucargJh1M2My
         7sfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4JhDU7fRsRCf6Fz6Uo0ElpS/qKEKfDTAtUPVwa/+2PIRTuObvoVuoAQhTmE+0MUz9HuXspX3Zv9wiTG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8C8RCLE21e/rPHZvStE05e0nLDXyxJvMZN0EvYV9JktmJoc8
	nYy4Pc+r6J/e7YMSL5mmStIV3vS4vKU2NXTCuLvWU6rsUIL10PaWFPwAJ7bBfC6P66JH39G/xtC
	obt9uYldGq/WHNiHJ21/VgflkV580duDf5BQ=
X-Gm-Gg: ASbGncsTD06DbB0juqy5tnXDg7kSvrXXz9UNaNugEQ2WwKHf4SXt7iMryP8LywQvsP+
	CEmnEBF3vB6wWL3unZi+EcofNxFrsNvrwU8jb9ygFVtXlLLi8Q3aGkhkweLcEUgKYU+tEUxjMCL
	SH5YolNRdwbTZQB2joi/KY/vRZSlmj1iUGlm+0
X-Google-Smtp-Source: AGHT+IH1Ngx8wDeOGVvEgoMUu51fzYihKd1CCRhMartqMsq7kTgAtW11Z5lNBO8KM5CnzuHyKJEohzpHQmHRHxoX0xc=
X-Received: by 2002:a05:651c:1141:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-30f0bf539d3mr46846731fa.21.1744110625959; Tue, 08 Apr 2025
 04:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744098446.git.jpoimboe@kernel.org> <7cb41fe7e87a003fc925164d5cc18efd8e95fcc0.1744098446.git.jpoimboe@kernel.org>
 <Z_TeoLQfZA858jk-@gmail.com>
In-Reply-To: <Z_TeoLQfZA858jk-@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 8 Apr 2025 13:10:14 +0200
X-Gm-Features: ATxdqUFbhIEzfUjRv6pv_G3jLvUcil8Bv5j_BGJ7d6Q0iHLex7jbfVMkkht2Ztk
Message-ID: <CAFULd4ao0jmxR7fzbpFsb43E+qAeGSqoWGeV47i7gKMV8chOGg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] noinstr: Use asm_inline() in instrumentation_{begin,end}()
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:30=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> > Use asm_inline() to prevent the compiler from making poor inlining
> > decisions based on the length of the objtool annotations.
> >
> > For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> > 0.18% text size increase:
> >
> >   add/remove: 88/433 grow/shrink: 967/487 up/down: 87579/-52630 (34949)
> >   Total: Before=3D19448407, After=3D19483356, chg +0.18%
> >
> > Presumably the text growth is due to increased inlining.  A net total o=
f
> > 345 functions were removed.
>
> Since +0.18% puts this into the 'significant' category of .text size
> increases, it would be nice to see a bit more details about the nature
> of these function calls removed: were they really explicit calls to
> __instrumentation_begin()/end(), or somehow tail-call optimized out, or
> something else?

This increase is mainly due to different inlining decisions.

> Also, I'm wondering where the 34,949 bytes bloat comes from: with 345
> functions removed that's 100 bytes per function? Doesn't sound right.

Please note that removed functions can be inlined at several places. E.g.:

$ grep "<encode_string>"  objdump.old

00000000004506e0 <encode_string>:
 45113c:       e8 9f f5 ff ff          call   4506e0 <encode_string>
 452bcb:       e9 10 db ff ff          jmp    4506e0 <encode_string>
 453d33:       e8 a8 c9 ff ff          call   4506e0 <encode_string>
 453ef7:       e8 e4 c7 ff ff          call   4506e0 <encode_string>
 45549f:       e8 3c b2 ff ff          call   4506e0 <encode_string>
 455843:       e8 98 ae ff ff          call   4506e0 <encode_string>
 455b37:       e8 a4 ab ff ff          call   4506e0 <encode_string>
 455b47:       e8 94 ab ff ff          call   4506e0 <encode_string>
 4564fa:       e8 e1 a1 ff ff          call   4506e0 <encode_string>
 456669:       e8 72 a0 ff ff          call   4506e0 <encode_string>
 456691:       e8 4a a0 ff ff          call   4506e0 <encode_string>
 4566a0:       e8 3b a0 ff ff          call   4506e0 <encode_string>
 4569aa:       e8 31 9d ff ff          call   4506e0 <encode_string>
 456e79:       e9 62 98 ff ff          jmp    4506e0 <encode_string>
 456efe:       e9 dd 97 ff ff          jmp    4506e0 <encode_string>

all these calls now inline:

encode_string                                 58       -     -58

where for example encode_putfh() grows by:

encode_putfh                                  70     118     +48

> Also, is the bloat-o-meter output limited to the .text section, or does
> it include growth in out-of-line sections too?

bloat-o-meter by default looks at all sybol types ("tTdDbBrRvVwW" as
returned by nm). Adding "-c" option will categorize the output by
symbol type (this is x86_64 defconfig change with gcc-4.2.1):

add/remove: 72/350 grow/shrink: 918/348 up/down: 80532/-46857 (33675)
Function                                     old     new   delta
...
Total: Before=3D16685068, After=3D16718743, chg +0.20%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Data                                         old     new   delta
Total: Before=3D4471889, After=3D4471889, chg +0.00%
add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-12 (-12)
RO Data                                      old     new   delta
icl_voltage_level_max_cdclk                   12       -     -12
Total: Before=3D1783310, After=3D1783298, chg -0.00%

Uros.
