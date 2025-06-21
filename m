Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB991A2632
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499485; cv=none; b=KVX2nLsoVsNdMH3NRMazFQjKWZ+rv596oJ9m6MHvr714jAA88UsQT2XacpmYb3btZxyC7l2F3J5ccrPNLJkUDTKu1Tgwx/U2Xa6au7O3rOs3AmvEnj4kuvOjQTOk9eD78fadKMR9owcT/MIYmt5MnZPyJ/Ut84Cw8WmqHlTVXrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499485; c=relaxed/simple;
	bh=3ULX4pNN1yhGvSmInOOQo2ojV0oALaYBxzGB5RB/3pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCBW/NONsWQKAFdE8mej5t4amhSkpdhAydr898YTW3Bom7fDQKkjNqPL2bXzgy4KWtj/d5qSJ3bSbtMuMdVhV96wQ+1PJNoDRURLHb/lshLvz1+mKaFPhz5Y8+mnidIgZvWuMci1EOPCw1s7t7Kz0g3tQgJUWMFaMJrfIcHMneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xdpbyMSs; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xdpbyMSs"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4525a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750499482; x=1751104282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXiTK9ai0RMYw2I7MTiCd/MyYR0qzc/Wl4Xxa7/KqEI=;
        b=xdpbyMSsLicNk/eGoapOXUF/e3hn56wpZBDFCpcHHzEM0UeTLKVoeqRiQpLa3r2E4G
         8oSun1XGF5WmmmKe7zrqHzmGmfXODQT8175EEkAd8QMqZiwFOo/tMS7oDsF0Sq/7F960
         LHdyBijK1B7orRZIFAkeiJpn2KWXvaiG1B3vi4UusBzBM3zmMjwrrsl23lNCtkytf7jp
         hvtd7/zV0AXF8Wc1Px7NoXtWHm4UEsgWyXHxUpOwa2Z1bg1iY3JJHb+cxgFvErG+mPXI
         L5lzOiIw9vIEFOWv8WQ0MGGfiDCM7NP7JVujeLJz08gHR6WzQM6sCrPjn2U3bkUAVdFB
         aazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499482; x=1751104282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXiTK9ai0RMYw2I7MTiCd/MyYR0qzc/Wl4Xxa7/KqEI=;
        b=DTj7/bK3PCeX2RxIIQ8estY9sD5a9KwEIcv06h4QL1EIQxTtQp+XcxgflblG5aNOlw
         br78QkFSpl8BDq+jqM6rgomw9c65aWe8gJgtcg/AoHkT4DA9OljHmLEKtZ7gv4GvTMYb
         G3kxFHdnOCpqsmio75zNBSGWq3sSHwpwWX25MaDFoejwJ1JScae2jWOixqZegyNH0QTz
         6e6+BIulHLyIX2sGZssdbRqtHFK79+cjBngB99I+yRYEaY6NR3tickXzssX5m86mWtFi
         14otlLfaVjd0rxi8oUw6nqCHTxS6q17csG06QY0FAoaM3JPPUxzfwc16acYwwOARBXu5
         uQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXX0gFLdToodISjfXb0yc6TnTDVH/YEPggcVcP9HT3z4+cuHtmLZVa82pIFALWGipd+n2EoKbgp8FIJw3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvUf+st2M2RvIUxOnF891BORYQTo/B0fFvDF9p/pgjlBVoBnT
	nyI1abV8o3aQAiqXkEfqP9SQEOCnB5bhf8Y7tbVWi/NNWeY9tDNmnhGSVWm0wxvBTl2lGLMlgZW
	slxrgQ4XS4EadZ77ERu7xFXZ7RR25mymYrwV1NLsE
X-Gm-Gg: ASbGnctuHf+qfQHoHGcC2cpwNkv8IFT+21e4TUe8WOdWQU/TdnEzi+zZjbjeujYgili
	K3ovqyWaaKCgixb3ZwcDXrXm3F7agBjKp7M/xcRZHkxBWDQwEhx9uogrEoiTfsa9Q1iz6mwEgo7
	5SqCH9UH8nPNvuFv8KUu5packm11xIhx28klfkaXzKiQ==
X-Google-Smtp-Source: AGHT+IGldXRRyGclzWs2ch/3ldmLdzSY+pLtWdYwUnObWuiqLlq1UyJityOItEmN8ekOKN884+J4tIcOemMnNMFs7c0=
X-Received: by 2002:a05:6402:1514:b0:609:b4b1:514b with SMTP id
 4fb4d7f45d1cf-60b91dee24dmr36620a12.3.1750499481874; Sat, 21 Jun 2025
 02:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610214140.2775339-1-mclapinski@google.com> <CAMj1kXErKwmiM5AiGOCE5D39U+3o_MXz5vqJmE5pkjQV308d9w@mail.gmail.com>
In-Reply-To: <CAMj1kXErKwmiM5AiGOCE5D39U+3o_MXz5vqJmE5pkjQV308d9w@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Sat, 21 Jun 2025 11:51:10 +0200
X-Gm-Features: Ac12FXzFNlYK9kPHV2cPPfeGTHkBGZk61mIh-96UkeYfbMpEavNzS6zsw9pKyms
Message-ID: <CAAi7L5dmAYJoB0BfKvoT0iKOeWuc5hLqFPBPQr99TkdEB1dtHg@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/boot/compressed: Fix avoiding memmap in physical KASLR
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Sat, Jun 21, 2025 at 10:19=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> Hi Michal,
>
> On Tue, 10 Jun 2025 at 23:42, Michal Clapinski <mclapinski@google.com> wr=
ote:
> >
> > The intent of the code was to cancel KASLR if there are more than 4
> > memmap args. Unfortunately, it was only doing that if the memmap args
> > were comma delimited, not if they were entirely separate.
> > This change fixes it.
> >
> > Signed-off-by: Michal Clapinski <mclapinski@google.com>
> > ---
> > I would like KASLR to support more than 4 memmap args. Do you think
> > I can just increase the MAX_MEMMAP_REGIONS or should I implement
> > support for the general case?
> >
> >  arch/x86/boot/compressed/kaslr.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compresse=
d/kaslr.c
> > index f03d59ea6e40..4aa9c9781ca7 100644
> > --- a/arch/x86/boot/compressed/kaslr.c
> > +++ b/arch/x86/boot/compressed/kaslr.c
> > @@ -162,9 +162,6 @@ static void mem_avoid_memmap(char *str)
> >  {
> >         static int i;
> >
> > -       if (i >=3D MAX_MEMMAP_REGIONS)
> > -               return;
> > -
>
> It isn't obvious at all why simply dropping this condition is fine.
> Could you elaborate?

Of course. Let's look at the whole function without my change:

static void mem_avoid_memmap(char *str)
{
        static int i;

        if (i >=3D MAX_MEMMAP_REGIONS)
                return;

        while (str && (i < MAX_MEMMAP_REGIONS)) {
                int rc;
                u64 start, size;
                char *k =3D strchr(str, ',');

                if (k)
                        *k++ =3D 0;

                rc =3D parse_memmap(str, &start, &size);
                if (rc < 0)
                        break;
                str =3D k;

                if (start =3D=3D 0) {
                        /* Store the specified memory limit if size > 0 */
                        if (size > 0 && size < mem_limit)
                                mem_limit =3D size;

                        continue;
                }

                mem_avoid[MEM_AVOID_MEMMAP_BEGIN + i].start =3D start;
                mem_avoid[MEM_AVOID_MEMMAP_BEGIN + i].size =3D size;
                i++;
        }

        /* More than 4 memmaps, fail kaslr */
        if ((i >=3D MAX_MEMMAP_REGIONS) && str)
                memmap_too_large =3D true;
}

This function is called for every memmap=3D param. Let's say we supply
only separate memmap=3D params (instead of comma delimited). Then on the
4th param, `i` will be equal to MAX_MEMMAP_REGIONS but the last `if`
won't execute since `str` will be null. Then on the 5th param the
first `if` (the one I want to remove) will execute and
`memmap_too_large` will never be set.

With my change, while parsing the 5th param, the `while` loop will be
skipped since `i` is not smaller than MAX_MEMMAP_REGIONS and the last
`if` will execute setting `memmap_too_large`. Basically, my change is
safe because the `if` I want to remove is already baked into the
`while` loop condition.


>
> >         while (str && (i < MAX_MEMMAP_REGIONS)) {
> >                 int rc;
> >                 u64 start, size;
> > --
> > 2.50.0.rc0.642.g800a2b2222-goog
> >
