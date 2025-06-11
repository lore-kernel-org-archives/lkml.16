Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E923AB94;
	Wed, 11 Jun 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677837; cv=none; b=laz9ZwkSOwVsK0yHZJjsniZtwIDrhiEdTVPh/ZvizSRvJ5R/0WXgP30PcyzbbLjgfVOGZs93qQnHK2T43Jx11yCpVukdDhco1uq1uCB69f2wmejzC73LRGBgZ4noiZc0sDQ+2BIzhsA0nm2+0H7BS3vmVr8yEs3haYOwiM8JgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677837; c=relaxed/simple;
	bh=wZi/d2yVDTCIEgAGY6nDiS7L0Kio+LCTdXEd7e2/GJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epSaHGvSrwld11Tu3vWCMxl4DtSAeKqksA2BHdEpkpbAxa9RT0A/e0yEgOarZNSRwIqpvf9ahkY3MOauZLBWxYiZbO2TNWEh4+o0UYsV9sqA3xAAQSgrg1oWwpxb9XUDbJnO8bblveQhxc+8EPpuejMJ3TS9NoQRLCkEnsxURPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6JShxX/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6JShxX/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb79177so1270165e9.0;
        Wed, 11 Jun 2025 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749677834; x=1750282634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GadKINRywzBXrfqPVJAYfbBeC3UCh33khZeoLkWRJYU=;
        b=m6JShxX/KV0o+Zv1DFRxTYmU+qTLiYI2ngWlFVOxQjmmIOIc/mYqLiD4tVBK5/A2QW
         Hf+XUSQCwnpec/rumQDPt68jpOLIVrov2pmYZviVrbCprMCjPpfZ8HqcQsxu0KX/O9b4
         SglwLvd2Q/0ysegBY6PP9YFbTNs94fxsNolqma7mOCKDoaZJPYnZwOYDYiBeB65rx7Gz
         wqLIopnp6MqD+f1uEXwaEaAp3VS0kTtRO2f1SQbPp5azwxeCD/t3+yMSowrE0yMHGC4O
         IgIVYFzWAa/JDTQ22MIdevsrHOxNLM9a/MnwkpaBdrlDOKKfVo5Qdfs4mqPShV2oK8Nv
         7dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677834; x=1750282634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GadKINRywzBXrfqPVJAYfbBeC3UCh33khZeoLkWRJYU=;
        b=RakOOD3iuMcsfgk6hCjwBWh2TdaGQuebtWC0O6CfyvbQkJWPtLDLhX0uJcvweCMUoh
         WxHDS2/iKCtwB1ZYfvs8fg++RrxER8mbCitLs+iaVjPY+S5ngRAC/DgKTEXLlCCaIZk3
         /Kf8eDrK0E3/W96lNWzzsiQHdfhcVpaj3ZSEqojxemuaH5mXXM52jPm6MsJWcgrqoNMW
         4h2IcBDj7BHk+VgtERH5OkyxPHFbIbPlh551zZZUqDK0K25kUtqaahV/ZKaAUqlH0vAE
         itTtbaVV0k04KBXXQN+3x7wp/5djzzmnIVoc+UjnaNVXE2ans1l5BfTYtZ4KvsnUfS64
         Nhhw==
X-Forwarded-Encrypted: i=1; AJvYcCXHckQQ9gtopMSBVOWdvoFwtd58IUfFGGdRHf3VGLPPzJ3tPDkDNQbtPhvtrPZBa9CYljjQPamISoj3qsY=@vger.kernel.org, AJvYcCXqdKNGHVA1eNLjfr1OIdX4Qezk+Jj7OuTnlL+PfJ9Yhh6rsWwZmhWrgUDeT8HtjqbqDEU8z7uIPOmiILs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyovJDzHfetiF1owJPeaXr5hDtmUy3qnPlpgOpJ936WRzYAQM1n
	r7wPMvy7jNyLCb/H2DLdMHQqIIIfRcekoHCt4KCTZPJvIzdUB2+aE/VXxw/Ltg==
X-Gm-Gg: ASbGnctC6hxrl4FjDFTRQ4/MV8TGnVB3pmjFW181C4UxwfloFzm6vwiG6joaOful2QG
	yQxez8INaONtLh/l+AUQ9AonmDaZ0eAp+Vujy/j9ByqxRB1w0/HMWRlohluAYxcFQwmy+k2JLGT
	pufjz6lICvOid7tgAbw2qRyA2vPXiwf5IRATr4QFphC5A1+5L1rZQBeIhJHwA92RNm2tM9YHuFi
	yt4mUj38QBmW/tBdlytsHdApZqus48fHcfjkPyiG0jxDW9IBZ5RYhaDcKgRhU7L2FZv8d42Q+xR
	QX3NEp7VOC3+VcbyhIhrz8Fz2mHSnvKhnXtyKbQFpB/1AOrGQgaOmN5zTVLGGGZfJN2aqmRB5OT
	wvEZwydn1XdYoLqy9bZeUJWNy
X-Google-Smtp-Source: AGHT+IENXAxOFUkn6ai3f7uiv1cxIoglRihLgcmGTCPE72Ecl4xW86WzHKRFfKByroxWekJSsl3FSA==
X-Received: by 2002:a05:600c:8b24:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-4532b89f9d3mr13570905e9.4.1749677833651;
        Wed, 11 Jun 2025 14:37:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm851985e9.34.2025.06.11.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:37:13 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:37:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
Message-ID: <20250611223710.254780d8@pumpkin>
In-Reply-To: <051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
	<20250610205358.07b1cc05@pumpkin>
	<051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Jun 2025 15:48:30 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 10/06/2025 =C3=A0 21:53, David Laight a =C3=A9crit=C2=A0:
> > On Sat,  7 Jun 2025 13:37:42 +0200
> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >  =20
> >> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> >> each and every call to get_user() or put_user() performs heavy
> >> operations to unlock and lock kernel access to userspace.
> >>
> >> To avoid that, perform user accesses by blocks using
> >> user_access_begin/user_access_end() and unsafe_get_user()/
> >> unsafe_put_user() and alike. =20
> >=20
> > Did you consider using masked_user_access_begin() ?
> > It removes a conditional branch and lfence as well. =20
>=20
> Thanks, was not aware of that new function, allthought I remember some=20
> discussion about masked user access.
>=20
> Looks like this is specific to x86 at the time being.

I think it is two architectures.
But mostly requires a guard page between user and kernel and 'cmov'
if you want to avoid speculation 'issues' (and 'round tuits').

> I would have=20
> expected that to be transparent to the consumer. Allthought looking at=20
> strncpy_from_user() I understand the benefit of keeping it separate.
>=20
> However is it worth the effort and the ugliness of having to do (copied=20
> from fs/select.c):
>=20
> 		if (can_do_masked_user_access())
> 			from =3D masked_user_access_begin(from);
> 		else if (!user_read_access_begin(from, sizeof(*from)))
> 			return -EFAULT;

I proposed (uaccess: Simplify code pattern for masked user copies):

+#ifdef masked_user_access_begin
+#define masked_user_read_access_begin(from, size) \
+       ((*(from) =3D masked_user_access_begin(*(from))), 1)
+#define masked_user_write_access_begin(from, size) \
+       ((*(from) =3D masked_user_access_begin(*(from))), 1)
+#else
+#define masked_user_read_access_begin(from, size) \
+       user_read_access_begin(*(from), size)
+#define masked_user_write_access_begin(from, size) \
+       user_write_access_begin(*(from), size)
+#endif

Which allows the simple change
-               if (!user_read_access_begin(from, sizeof(*from)))
+               if (!masked_user_read_access_begin(&from, sizeof(*from)))
                        return -EFAULT;
                unsafe_get_user(xxx, &from->xxx, Efault);

But Linus said:

> I really dislike the use of "pass pointer to simple variable you are
> going to change" interfaces which is why I didn't do it this way.

But, in this case, you absolutely need the 'user pointer' updated.
So need to make it hard to code otherwise.

Note that it is best if masked_user_access_begin() returns the base
address of the guard page for kernel addresses (which amd64 now does)
rather than ~0.
Otherwise it is pretty imperative that the first access be to offset 0.

	David

>=20
> In addition I would expect a masked_user_read_access_begin() and a=20
> masked_write_access_begin(). It looks odd (and would be wrong on=20
> powerpc) to not be able to differentiate between read and write in the=20
> begin yet using user_read_access_end() at the end, ref get_sigset_argpack=
()
>=20
> Christophe

