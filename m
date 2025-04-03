Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD32063F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713976; cv=none; b=YAE20Y4x3k5XsB/Mrtr1v/3GYtbsRsW14YgGEAUGYHaUGNerARyUmyemxMSRUghxZ1tNceeuI8KFF/mYkxe/3wFFMVAVb9d6hP5lS1XnhvN/KbKX1+mz8g1GzpMmaKnOLBapU+q4vrEMMPSZExUODPAK6nEH7iFI9hfxFqSdlkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713976; c=relaxed/simple;
	bh=XZSVHUm5soGM5AHXJaODF6n3fbloNApqNsoEQaLwhsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxrtSMiXff3kmWE3W4ZvR/L0nbCk7Rog5BASm7YIGTP2ePo+GoTx4Lj9fXHvtIpjKfPVIX47W/blWKRrEKvjMwATTvSyo1KVPDCJ9ipTWHdM2LYD1ct8WD+f1pgtGHCStZGZ0oNIcQcIH5gVeUfzVif2YsuDiNSGdvYlxBkvqBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PleDky5j; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PleDky5j"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3061513d353so14492161fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743713972; x=1744318772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntmUxPu/EufjR/lqgI+frWP/rYsW6pLhQzc2gns3ozs=;
        b=PleDky5j4Pe6gPnkDOpsCXzQqjMAdaXggN1+Hro4w9+uDHwC1FE9jpk/9B7T2gqzNR
         /h4o1Nd9kdTmXBIN0OQr+Ne0XA4YvwKJtcGO/V277MNAXm1VpQ8GUxyUqgsLFa3RXvgL
         G7vqW2FM9CLJt+KiZOR0Fvo9ipmhgsGvPH7D1gNfJWWLvznveIpqvwC3nFFlpRWb7ghw
         qyNgcCZo3APRV+M0voAWB0cgfR/uM1fjOBopfrQFGnbmM6aTf+BGmkZizqsJ27nQP27e
         2/Ibt4i9Ml/GdkQlUuHfscjjoiFl3c839lfzMxbuXmH3XfvGISAC6alo2uZ/Ri/Rh8iD
         BLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713972; x=1744318772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntmUxPu/EufjR/lqgI+frWP/rYsW6pLhQzc2gns3ozs=;
        b=Q4RVpmrI4XQc6wT0GjoqrL21Kfkp/88UYnNCzZor7TZ7VHNie3opZoAM0e22Kc1MaF
         pNeajOCk2oWpOvqU2czHPmawPHNb4yIH5AdtlgtUFcnJbWCA8k+wnjfRBIb1t+R4e0Tl
         r6tixS6uvndgLhAbH5s8iVhPF3qiRNgXY+axjrK/vZ8rNtpnQrvvxY0+cNohjDR0Ih+i
         AqVo1H5oxBi40dDitfS9nNWsc0z4t4rGIjgXYHLy71CWm/8c8bTuL6kd6quLtigGYLPg
         OqWn6BnAZGfSVGXoMEKd7weu38hjbFHZ2sXjGjPn/wkJb9XzTecckCLfwtDOMx8pCJp2
         /5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1jwmxJWvMr9DYolCzi0/KWsNubWdeRZEgpsUw+GgsB9Oxw+DdFvY+tIpsiENl8EIgo2KSI+tvu5raHwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFih7SqskZuUFtFkyX0pG9Nu2n04fVzImcMB7BlGH83tNunnG5
	5wOSAKhoKzuxd85opSfkV6/8exIvxBjmwAau+nF0wPX0k8clWwOQWonPeJ6DVi3o173IK6JvKJ7
	nzMy7BE7VgVHbpRNYpc2y/gNxco4=
X-Gm-Gg: ASbGncv71v73nnMwvOJu09YnYZsJ1qqM5Yw74yQT1r9bVYSkKsVrGxotiVnUCZeRKpz
	C2ef8AJe9oalKC29FXpJD8v+YkT5jrQZszv59wDhrr1LjdwSTH0ua/YZ6+RHx+THxEatE/GlzZ1
	0Osw915MI8WcOEvLqWYQ0OHDnsKnEDvXwX3j27
X-Google-Smtp-Source: AGHT+IEMBg0c83tQuu7FZEYPk7IXf94CVSaS6Wyj6Wg5HQet4eNrT/p7/2KgnMQzQMVmz48AqDF7AggFY7b5XH/3JRA=
X-Received: by 2002:a05:651c:1449:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30f0a17fab1mr3568061fa.25.1743713971958; Thu, 03 Apr 2025
 13:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de>
 <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de> <CAFULd4Z48Vh_UW6+Q-BJ3c42eo7QaKhAbhZRX+Eegx0Te4+z6g@mail.gmail.com>
 <dfb96de9-b28a-4eac-ac73-88bfb9c44245@molgen.mpg.de> <CAFULd4ZGWFN00AVQ3Y3yg4HJgdbb5o_hxERnskggFtxfCUBieA@mail.gmail.com>
In-Reply-To: <CAFULd4ZGWFN00AVQ3Y3yg4HJgdbb5o_hxERnskggFtxfCUBieA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 22:59:19 +0200
X-Gm-Features: ATxdqUFYzfzvNB6r9fygZ2zlGhh3ge5bjtBNFw-zzUxJ7PGcnyrQDclDkMq8Tfs
Message-ID: <CAFULd4bCdtnsOwWWkKU4uQp00w10NkdGBXUx-3y9g8mkLCN_pQ@mail.gmail.com>
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="000000000000e390060631e60bed"

--000000000000e390060631e60bed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:42=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 3:20=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
> >
> > Dear Uros,
> >
> >
> > Am 03.04.25 um 15:14 schrieb Uros Bizjak:
> > > On Thu, Apr 3, 2025 at 2:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mp=
g.de> wrote:
> > >>
> > >> #regzbot ^introduced: 6a367577153a
> > >>
> > >> [To: +Uros, Cc: +Nadav, +Andrew]
> >
> > >> Am 03.04.25 um 09:35 schrieb Paul Menzel:
> > >>
> > >>> On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from
> > >>> 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux log=
s the
> > >>> new warning below:
> > >>>
> > >>>       cryptd: no symbol version for this_cpu_off
> > >>>
> > >>> I haven=E2=80=99t bisected it, but could it be commit 06aa03056f90 =
(x86/smp:
> > >>> Move this_cpu_off to percpu hot section). It says to have no functi=
onal
> > >>> change though.
> > >>
> > >> `git bisect` led to commit 6a367577153a (percpu/x86: enable strict
> > >> percpu checks via named AS qualifiers).
> > >>
> > >>       $ git bisect start
> > >>       $ git bisect good 08733088b566
> > >>       $ git bisect bad acc4d5ff0b61
> > >
> > > Can you please post your .config?
> >
> > Sorry, I didn=E2=80=99t attach it right away. It=E2=80=99s attached now=
.
>
> Huh, it looks that modpost chokes on __seg_gs prefixed symbols.

It is not modpost, but genksyms that doesn't know how to handle
__typeof_unqual__().

Can you please test the attached patch, it should fix the problem for you.

Thanks,
Uros.

--000000000000e390060631e60bed
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m91u6ool0>
X-Attachment-Id: f_m91u6ool0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaCBiL2luY2x1ZGUvbGludXgvY29t
cGlsZXIuaAppbmRleCAyNzcyNWYxYWI1YWIuLjk4MDU3ZjkzOTM4YyAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9jb21waWxlci5oCisrKyBiL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaApAQCAt
MjI5LDEwICsyMjksMTAgQEAgdm9pZCBmdHJhY2VfbGlrZWx5X3VwZGF0ZShzdHJ1Y3QgZnRyYWNl
X2xpa2VseV9kYXRhICpmLCBpbnQgdmFsLAogLyoKICAqIFVzZSBfX3R5cGVvZl91bnF1YWxfXygp
IHdoZW4gYXZhaWxhYmxlLgogICoKLSAqIFhYWDogUmVtb3ZlIHRlc3QgZm9yIF9fQ0hFQ0tFUl9f
IG9uY2UKLSAqIHNwYXJzZSBsZWFybnMgYWJvdXQgX190eXBlb2ZfdW5xdWFsX18oKS4KKyAqIFhY
WDogUmVtb3ZlIHRlc3QgZm9yIF9fR0VOS1NZTVNfXyBvbmNlICJnZW5rc3ltcyIgaGFuZGxlcwor
ICogX190eXBlb2ZfdW5xdWFsX18oKSwgYW5kIHRlc3QgZm9yIF9fQ0hFQ0tFUl9fIG9uY2UgInNw
YXJzZSIgaGFuZGxlcyBpdC4KICAqLwotI2lmIENDX0hBU19UWVBFT0ZfVU5RVUFMICYmICFkZWZp
bmVkKF9fQ0hFQ0tFUl9fKQorI2lmIENDX0hBU19UWVBFT0ZfVU5RVUFMICYmICFkZWZpbmVkKF9f
R0VOS1NZTVNfXykgJiYgIWRlZmluZWQoX19DSEVDS0VSX18pCiAjIGRlZmluZSBVU0VfVFlQRU9G
X1VOUVVBTCAxCiAjZW5kaWYKIAo=
--000000000000e390060631e60bed--
