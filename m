Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F72286420
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675907; cv=none; b=H0TeAIXVPGVo3BA4tEQzVrOBFGJR4MLL870LdKvCVBn2+tCzwQsxvJPYOGM2qux6Jz3KcO8TgrQ4l86S0B+EzAbVp5nM2Cze3dUWIisdIJ+7MXEZ46M5zisvB+5bEUebCFP+EyEIhwQPI4fKATwPxvGv7mOcXiZtVH8Wbm00UXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675907; c=relaxed/simple;
	bh=jLy2szwDWHqqJviMtbGQnTN3ULw2S8OhfWEULUU5naU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz4x4Zlz/vZkmUl1wyAEz7pK9qQtPTrhZonzD4zyy0ulkNBeU7U0fL318CFBdoG2N/+tnsICpJoiKjeFT5KICjdjY18UtnoQyXX+23jUF2YYUEz91/K2+OplSQHnnQekvPxS2JurBE9fFfr+Fhxmiyx3zxg5lMhv9xpkPbWrdZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=arcfNm9d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="arcfNm9d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231f6c0b692so394255ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747675904; x=1748280704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmvWuYAzDFR95No8NLEp3J02kOMT0LgXSZkJsXShgyI=;
        b=arcfNm9dzdfLscpmlpVDEvs2TKM5Mi2Z0WnjOxp7rGYONICbU89yYSsQmFGLqcVAII
         Nxg6tY2KSq/Q9ktudvd4ARVthPepxN31bytwyFggTJqYRomqziiueimd+urSo0E+7yod
         4ugEKIMR+E5zSuniz//0HzZoBkiValRZwD7JgDOh5lwmx/ihw3uBG85IV6NyeD7yhdSw
         CYnWmYU6niokcl0IWDXz6/mrL/0avUIhemJ2eo4M3FvCuDS+ru/sfGI0b2N3wlhgUo7y
         7wiqts48lRx44UlZfrYuq0cPl9WN2vdQ3GPT7B7oRq4o1SNEGb0dQmw4BOK4VjzWwAyB
         154A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675904; x=1748280704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmvWuYAzDFR95No8NLEp3J02kOMT0LgXSZkJsXShgyI=;
        b=RZnM8x9tuiw9SwxpMqWBOkoBirNS2KSDZ88mjGodiRh6dB50izt181bBSmHKWnPd85
         IY31ZKV4iwyuyGY7a+xUin6jwCmuzo848p3IBY7tdVTRsY+Uebn6g7U7tQV0vZeU/5jm
         Do9nKlipKFQdR5iTr4eqlyODVqvTNR9so64QvOD7ZpwPGJ1GYMd8vYrgWUGjtBKE8xnB
         kmFQkj8yHEvNJestHM8RpkLoKzkviRNj4H2bUoegnDIyCV6va46tn1Jge5acxPyNS1kS
         5k5WHz4Tp5RlPkgbVLRbUZtrvH4CozOl96n/6Y6v98KeqxMWgUx2VBxkvdCnod8oY37A
         Y7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6kvotx1mx4HSVv3F3PizNI3dNOzt77KeFcpXnuS9NCX7kjAxeSUe9cowiHxGAq7+pvO94yLU3H6djHak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1kA8b3zm5jM5KodeDcaXyciU22yfHBPjup9c/MdFLgcfdYJ86
	F6CNRhQiKnUACMWeEpx5MMBY+156PwJW0Km96Q/s0gH+7Bm4JaRJ0ePk0N+rv8jC2RPDM/y7kjF
	5It6dtxQKvWAq24A26OgRng89GXXWl1pdYXhCssAN
X-Gm-Gg: ASbGncteRSEMe1CSi6Z6JnU2QupxOsvGKtx1KDninuqwycb+9NQpyg0LmVVT8jR2NTF
	fAQOejz+9v/JqIhd3Hby4qU9h/DF/80YbCgUgM/Mmi2LnKIH4OYZHwUmI2AnT2jC5z3QEcTCytg
	AFCH+cOYWyAzE667zehdW+o3qcmYR84OLij44Jp76BKI3G
X-Google-Smtp-Source: AGHT+IG+ExyKgE3ruV/gl5M9ZTWtLqmpbXPFt1mRf9GKepoZU4AoYFfOGioK8r7ghizA4noQkXhiVCYtew70Mv8tqF8=
X-Received: by 2002:a17:903:290:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-231ffd3192fmr4993165ad.14.1747675903859; Mon, 19 May 2025
 10:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
 <20250519023517.4062941-6-almasrymina@google.com> <aCtPEBmBFvM-bA_i@mini-arch>
In-Reply-To: <aCtPEBmBFvM-bA_i@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 May 2025 10:31:30 -0700
X-Gm-Features: AX0GCFs-Ut1FZDyYbbaHFHUXedO7i5T9SEf7r_1r-9FnEhuG-l96h6IGYWAaNwo
Message-ID: <CAHS8izMjCX=PkU0bE6s46uXxrnHjP71G6LN0v6oQumNa2Mouzg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 5/9] net: devmem: ksft: add ipv4 support
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:32=E2=80=AFAM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 05/19, Mina Almasry wrote:
> > ncdevmem supports both ipv4 and ipv6, but the ksft is currently
> > ipv6-only. Propagate the ipv4 support to the ksft, so that folks that
> > are limited to these networks can also test.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >  .../selftests/drivers/net/hw/devmem.py        | 33 ++++++++++++-------
> >  1 file changed, 22 insertions(+), 11 deletions(-)
> >
> > diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/t=
esting/selftests/drivers/net/hw/devmem.py
> > index f5d7809400ea..850381e14d9e 100755
> > --- a/tools/testing/selftests/drivers/net/hw/devmem.py
> > +++ b/tools/testing/selftests/drivers/net/hw/devmem.py
> > @@ -18,30 +18,36 @@ def require_devmem(cfg):
> >          raise KsftSkipEx("Test requires devmem support")
> >
> >
> > -def check_rx(cfg) -> None:
> > -    cfg.require_ipver("6")
> > +def check_rx(cfg, ipver) -> None:
> >      require_devmem(cfg)
> >
> > +    addr =3D cfg.addr_v[ipver]
> > +    if ipver =3D=3D "6":
> > +        addr =3D "[" + addr + "]"
>
> I think you can add [] unconditionally, no need to special case v6.
>

I'll double check, but IIRC the [] were v6-only.

> > +
> > +    socat =3D f"socat -u - TCP{ipver}:{addr}:{port}"
> > +
> >      port =3D rand_port()
> >      listen_cmd =3D f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.addr_v=
['6']} -p {port}"
> >
> > -    with bkg(listen_cmd) as socat:
> > +    with bkg(listen_cmd) as ncdevmem:
> >          wait_port_listen(port)
> > -        cmd(f"echo -e \"hello\\nworld\"| socat -u - TCP6:[{cfg.addr_v[=
'6']}]:{port}", host=3Dcfg.remote, shell=3DTrue)
> > +        cmd(f"echo -e \"hello\\nworld\"| {socat}", host=3Dcfg.remote, =
shell=3DTrue)
> >
> > -    ksft_eq(socat.stdout.strip(), "hello\nworld")
> > +    ksft_eq(ncdevmem.stdout.strip(), "hello\nworld")
> >
> >
> > -def check_tx(cfg) -> None:
> > -    cfg.require_ipver("6")
> > +def check_tx(cfg, ipver) -> None:
> >      require_devmem(cfg)
> >
> >      port =3D rand_port()
> > -    listen_cmd =3D f"socat -U - TCP6-LISTEN:{port}"
> > +    listen_cmd =3D f"socat -U - TCP{ipver}-LISTEN:{port}"
> >
> > -    with bkg(listen_cmd, exit_wait=3DTrue) as socat:
> > +    addr =3D cfg.addr_v[ipver]
> > +
> > +    with bkg(listen_cmd) as socat:
> >          wait_port_listen(port)
> > -        cmd(f"echo -e \"hello\\nworld\"| {cfg.bin_remote} -f {cfg.ifna=
me} -s {cfg.addr_v['6']} -p {port}", host=3Dcfg.remote, shell=3DTrue)
> > +        cmd(f"echo -e \"hello\\nworld\"| {cfg.bin_remote} -f {cfg.ifna=
me} -s {addr} -p {port}", host=3Dcfg.remote, shell=3DTrue)
> >
> >      ksft_eq(socat.stdout.strip(), "hello\nworld")
> >
> > @@ -51,8 +57,13 @@ def main() -> None:
> >          cfg.bin_local =3D path.abspath(path.dirname(__file__) + "/ncde=
vmem")
> >          cfg.bin_remote =3D cfg.remote.deploy(cfg.bin_local)
> >
> > +        if "4" in cfg.addr_v:
> > +            ipver =3D "4"
> > +        else:
> > +            ipver =3D "6"
>
> If we have both, we prefer v4, can we do the opposite?

Sure, but why? Just curious.

--=20
Thanks,
Mina
