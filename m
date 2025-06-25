Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E872D878A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874783; cv=none; b=IymcIf+kN2kD+4aLnr23Rt8whw3RgoNdnQ+WDPlg2x+uoHjyTweTdaLGW/unzyt827xKbiFjr22GKd/4bt3emw+qwSTvALZGBVJ7edTztx+8sZwFBaCdllzmjKbxT+RbkYkBW3uqJRKsbMFXI3j2p+YNsdvDK+vpT8y6cv9T4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874783; c=relaxed/simple;
	bh=LfO/WxqGhtgXAUrRxKDl23w6PUKiNJbkQGbfw22jWG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBSMTNOPAtj1YWyzPDVt54ieffZz00zKs3WougVlYirVOrw9iT488CK4k8BRy5TRoxLDLOQ3BK/oYcMPcyJpnlH6ez7fohWtfkM1c45AuoWrkwnaE7/tNRMVY1/bcRhLGvGIoArkTdilXaW+0LUDPD/kFR3lD8RndhZFHAxeiiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mQ240GIC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mQ240GIC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-237f18108d2so21965ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750874781; x=1751479581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3PNbssUoBeGFUceKDOa/ZUhofUS/o4RLNNr8Hnz3Kc=;
        b=mQ240GICraOZrg5Fbs9p+m9Ku/Mz4wuxGcQs7YT8mUwPhx1/pwgiXAb4eQDEEUTmdV
         M/qUieF4YKWv707ZORFsxPUt/RdV2gKqGrqobBjEIg7p752pOZnvlxIDR1gc52qxh+Iw
         eSFihU2LChBnQclRaCC3mVLxzUtFW/Cu3OxboQoboLffjWq/IE+cEDVWIGPfVgtq4ei6
         8Vnz2MMIZDbeg4aeGo8MoZcX9sCDVQAhOm7kh25ZvwpkotSlTb3ad8VQdMs3ZR0vwrcC
         H3IIg6ljL9Vwp54vLmz1I8AC6EprAbXni3RRqbN7+ar64PJ3xJdcaXgNVBIRQjxflHgY
         /34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750874781; x=1751479581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3PNbssUoBeGFUceKDOa/ZUhofUS/o4RLNNr8Hnz3Kc=;
        b=Ct0JzfGuwVIlLpxWf/yNwbPs6Hk7tFEgsTpRlRsWftNzSlrwH7ZJMbYanHuOoFdNkh
         OCb4J60/gi/6X0Fs0pjegF2/cV5HdrUgN2hmGAHGrY1R9POun5Jd/ITBKEAilMKprIs7
         9jGTgjeqk9TFZmOknGw2YziK79z6g0Six6bd2EsS5pvjin/Op1HZnH8Rsu8PNa8L07ol
         gNvBTICTsCDXaH73W1I+YMs3CrZ6QLrZBHTqtXjHJBR/YhKwsXDvBg89XSWdDKCLOFni
         E5sLVxIS3XuB5ntuEo3UTyEpI6fT6DEO0B8v5OensD31kJREhHahD9OS/7YZ8HzIABAu
         6R9A==
X-Forwarded-Encrypted: i=1; AJvYcCXucj9f4Yvs5plafdcYhQ64aw/GzD2wc4awdLguE3KuLsujQNA6Wv1kgePxdlBNszjwyWdxYeqQQnIxiI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xFZo1WeCf/gG1/gEpnfe5+caSaIHfBL5BDQ83dA0Tc4d99Ts
	na4CDgdb1hS+RQtAHOQmBdApYA9dsHFXCxhx4rnYVMS0f8eX9u3vDQZQPAObdi6XBOCSekwA/+Z
	nSZXzSdzDL45/f6pOc0xUi8Um6dK/W/P5cazK1wzcQE1nOQcy+SL5W0h2iUc=
X-Gm-Gg: ASbGncu87Biw2pWLZYbR9S84yRcVpt47RX7w4IBFJkA9oCl8x5dI7etuQBfgXT89lQn
	cfgtQAd6E9YQ32vte0OmSamXGIg7H9NDaKfoXFX048MD03GDxgfjGpFQ1RWqBc0x52ekdKnnWVR
	oztT1dcFQC52o8KwFDPx5r4k/lndXojvSq7gw7WUaCLI1ggNQIA6Llso5LWur0rm3LonUfDm1c
X-Google-Smtp-Source: AGHT+IFghrvzPMv3+aYTxv0CDdYnxurWCNcPQl387UmznY2FxsIw81sFkdZ7P7wIweE0lrrI5CO0jXvBW9JyAAZz2ac=
X-Received: by 2002:a17:903:1b2d:b0:22c:3cda:df11 with SMTP id
 d9443c01a7336-239785df083mr95235ad.10.1750874780917; Wed, 25 Jun 2025
 11:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617205320.1580946-1-irogers@google.com> <51bc73ca-3b1f-4f1a-b75b-7bdeffd7a395@csgroup.eu>
In-Reply-To: <51bc73ca-3b1f-4f1a-b75b-7bdeffd7a395@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Jun 2025 11:06:08 -0700
X-Gm-Features: AX0GCFu_4XjLCmXZDZRYMELR9OF9JFxkDcRYkMG9bF6Q2IsJKq4g0MuxY0MjGKg
Message-ID: <CAP-5=fVoOJsk2DzG8zHLg_QxQnxsXNJ2c21T-JYOQeH5GoTMhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Switch get/put unaligned to use memcpy
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:42=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/06/2025 =C3=A0 22:53, Ian Rogers a =C3=A9crit :
> > The existing type punning approach with packed structs requires
> >   -fno-strict-aliasing to be passed to the compiler for
> > correctness. This is true in the kernel tree but not in the tools
> > directory resulting in this suggested patch from Eric Biggers
> >   <ebiggers@google.com>:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kernel.org%2Flkml%2F20250614044133.660848-2-ebiggers%40kernel.org%2F&data=
=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf05413010ecc40ad1bdf08ddade131=
6a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638857904894967529%7CUnknow=
n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D29QUBLnUowncZiTH4z74=
Ec1olUlX0OTYnUNGDvWxX1o%3D&reserved=3D0
> >
> > Requiring -fno-strict-aliasing seems unfortunate and so this patch
> > makes the unaligned code work via memcpy for type punning rather than
> > the packed attribute.
> >
> > v2: switch memcpy to __builtin_memcpy to avoid potential/disallowed
> >      memcpy calls in vdso caused by -fno-builtin. Reported by
> >      Christophe Leroy <christophe.leroy@csgroup.eu>:
> >      https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Flkml%2Fc57de5bf-d55c-48c5-9dfa-e2fb844dafe9%40csgroup.e=
u%2F&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf05413010ecc40ad1bdf0=
8ddade1316a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638857904894985987=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dl1LJP3XPKVu=
hDpiHxxkfWBiNPMYaBT9YXGBFzs6wLpY%3D&reserved=3D0
> >

So I think I can remove the _Generic block in unaligned.h by depending
on the equivalent __unqual_scalar_typeof from
include/linux/compiler_types.h. I think this is preferable and so I'll
post a v3.

> Does this new version also fixes the failures reported by the robots:
> - arm64-randconfig with clang 21

The issue here was:

  llvm-readelf: warning: 'arch/arm64/kernel/vdso/vdso.so.dbg': invalid
PT_DYNAMIC size (0x118)
  llvm-readelf: warning: 'arch/arm64/kernel/vdso/vdso.so.dbg':
PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used

which the switch to __builtin_memcpy should have resolved.

> - i386-randconfig with gcc 12

The reported error is in the unaligned code from sparse:

   drivers/scsi/megaraid/megaraid_sas_base.c:8438:32: sparse: sparse:
Using plain integer as NULL pointer

I believe this is because of the _Generic block with a pointer type,
and so the use of __unqual_scalar_typeof in the next/v3 patch set
should hopefully resolve it - or else we'll need to special case
pointer types to assign NULL rather than 0, but I'd prefer not to
special case every potential pointer type.

Thanks,
Ian

> Christophe
>
> > Ian Rogers (3):
> >    vdso: Switch get/put unaligned from packed struct to memcpy
> >    tools headers: Update the linux/unaligned.h copy with the kernel
> >      sources
> >    tools headers: Remove unneeded ignoring of warnings in unaligned.h
> >
> >   include/vdso/unaligned.h        | 48 ++++++++++++++++++++++++++++----=
-
> >   tools/include/linux/unaligned.h |  4 ---
> >   tools/include/vdso/unaligned.h  | 48 ++++++++++++++++++++++++++++----=
-
> >   3 files changed, 84 insertions(+), 16 deletions(-)
> >
>
