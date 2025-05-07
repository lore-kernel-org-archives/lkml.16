Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EF322E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660989; cv=none; b=YnC8EWf6pN8X20kx2Zfj2ItWmjjdD4oEqw6lUSwjgOnoN/hF4tSKpd23t/IixR/wIjtezj7e1M9AeHl/DB0XrTsLhajFXxhcTTnYEBqXOCJDeV0um4bic91kWC8BjtMaes7pTjKqcs79P70X6MrtyTWHUZRhmrww1PRPj3zGedo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660989; c=relaxed/simple;
	bh=5yguCcL7feeRIXzsYP0Ra5eufv4vgZdE59Be7G/bShc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwjGhGtRUYEehRiPUNZkC7vJ3APXFWRGGLYCJurLJY2MzMLTfeqv/DWNg4n+C03nzIXoUO/hMpdnVBgLtLAA6jObuQHYyhkSmCr0B68i7UupHbWQpXMeT1Kmmkxw+XiecuX19tGTB61RR+m9heqn4/ROPJ17ILxCVSjaz2B/I68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lAnlmNYp; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lAnlmNYp"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4774611d40bso122441cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746660986; x=1747265786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aldovWRH+puMg8AxO3x9rqrDR7t6OJycgaSzdWffNg=;
        b=lAnlmNYpocs1TTAnVARpC6b/5YJiGGzekKrkD8y4Ginm7vIuN3MW7uY+kBtDbxSrmA
         OfyM4UenwXqxVyhursVP9MjybbnR95wfTdJSFBqjlQm0O3lS3iGb/dMNT17pIExz/P3U
         HJfWgeccTYgvEXfgENMX5EPf2G5IZUqQ/QRT22QdD/CzTF+xk2BX/1MZqzTd8GNqtUkX
         Kjjl5wtwOEN3TCyg3Qsmo2kyH0O8MOb9KhiijBCRRAQMOVUTTrURL/6wgxKmiw1mAAYN
         +MtInkNUELAgrq8ba+jHxaudHuChhSTs3oZzHugLUlxak/i/QU7MDmRM2sGpTqEVM2pV
         imRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746660986; x=1747265786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aldovWRH+puMg8AxO3x9rqrDR7t6OJycgaSzdWffNg=;
        b=KG2dfe8of8wUxK4MDabpXCVTG9trbX/02nAhOov5LpOLhWDwNsGIGLxRlJSqVdQqAn
         0JKlGn0aqePUHOn3DQ3s+N4uWPnRzT7570e3jKara3c2U6L8mMeM3t8m4rJzDpnXrcrw
         gwHsXcp3AHU4kWilhj4o7Yhv8HZjstrROHccQYi1I70RuLahMw/HQDd+5rCT3096Xqg+
         OIgmLrHumkzQdf5kRW9/n15u2DZmwivycGCzlXOC8IVIS0OOE/SaUsguT5oEHna8Uhgs
         LFFpfQZd4k2aPSSS/vYkGecPSYotKTDrUFptcMyCa/crLWSxpjrc52xFvcWW1JMy9FuT
         t5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVroXiq/v5lW/E0cFDQggrl0q3RmAJjC0TRY5nV3mpcNsKYCWxINrvJomBpIWny2X2RQRKQ0g5l40Mjnok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zaELATDte1gjnxzj4WzdFDVXgSmmYHsc+g6QAz9um1U4Frif
	XRrh4HOyAw1aS/zNJc4i2gYc+bVBbOkeGaUIyN57wY1OT9lkmUjv43JOO2btyN2TkpYBOoWWcyA
	goAk/RnPdmNWHW37MGpTIZBnhfv5QcQcy8yxA
X-Gm-Gg: ASbGncsSC7tHOTe2sZOVCgGQ6oAdeaT8RVbi1c5JsowNOi0zxbIJhJGquEIwIiDvq0t
	nuyY9aNN99aUlvo8CDEjhcFcS0rtFfUF9wz8erq+hNYHPmcrtQ0rBAzqlUpnubj5gnpzcwssaqx
	4OyXKSmEC8ZoFIyAv9AI1J4i72zxeg4w1n/5Zboomp0hMkWC9nnw==
X-Google-Smtp-Source: AGHT+IEbPkoRLOga2k+Y5MgUZXqmjrfGhvlN0x2PIYFisMbyZ342+nyqgX211Wo2cYAaA8wqfeIUH1miXjcaaDYJooU=
X-Received: by 2002:a05:622a:a:b0:480:dde:aa4c with SMTP id
 d75a77b69052e-49449969697mr1805081cf.4.1746660985591; Wed, 07 May 2025
 16:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com>
In-Reply-To: <20250507175500.204569-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 7 May 2025 23:36:14 +0000
X-Gm-Features: ATxdqUF_nc9bmoFQkg3sF4E4VCOpZ0cWg53SUL7J04pEjkzSZ_zEjp-K5KsWGr8
Message-ID: <CAJuCfpGtdzL5myXCUopJrBogzPOWVGt9cBRAiJS5FVAxgp8zag@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading allocinfo
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:55=E2=80=AFPM David Wang <00107082@163.com> wrote:
>
> ---
> The patch is not complete, just want to get feedbacks whether this
> worth carrying on.

In such cases it's customary to mark the patch as RFC which saves you
time on explaining your motivation :)

> ---
> When reading /proc/allocinfo, for each read syscall, seq_file would
> invoke start/stop callbacks. In start callback, a memory is alloced
> to store iterator and the iterator would restart from beginning to
> walk to its previous position.
> Each seq_file read() takes at most 4096 bytes, even read with a larger
> user space buffer, meaning read out /proc/allocinfo, tens of read
> syscalls are needed. For example, a 306036 bytes allocinfo files need
> 76 reads:
>
> $ sudo cat /proc/allocinfo  | wc
>    3964   16678  306036
>
> For those n=3D3964 lines, each read takes about m=3D3964/76=3D52 lines,
> the iter would be rewinding:
>  m    steps on 1st read,
>  2*m  steps on 2nd read
>  3*m  steps on 3rd read
> ...
>  n  steps on the last read
> totally, the iterator would be iterated O(n*n/m) times.
> (Each read would take more time than previous one.)
>
> To use a private data alloced when /proc/allocinfo is opened,
> the n/m memory alloction could be avoid, and there is no need
> to restart the iterator from very beginning everytime.
> So only 1 memory allocation and n steps for iterating are needed.
> (Only when module changed, the iterator should be invalidated and
> restart.)

Yeah, your change makes sense and looks like a good optimization. From
a quick look at the code, codetag_next_ct() should handle the case
when a module gets removed from under us while we are not holding
cttype->mod_lock. I'll need to take another closer look at it once you
post an official patch.
Thanks!

>
> Timings before:
>         $ time cat /proc/allocinfo  > /dev/null
>
>         real    0m0.007s
>         user    0m0.000s
>         sys     0m0.007s
> read-syscalls get slower and slower:
>         read(3, "allocinfo - version: 1.0\n#     <"..., 131072) =3D 4085 =
<0.000062>
>         ...
>         read(3, "           0        0 drivers/gp"..., 131072) =3D 4046 <=
0.000135>
>         read(3, "           0        0 sound/core"..., 131072) =3D 4021 <=
0.000150>
>         ...
>
> and with the change:
>         $ time cat /proc/allocinfo  > /dev/null
>
>         real    0m0.004s
>         user    0m0.000s
>         sys     0m0.003s
> 7ms drop to 4ms, more friendly to monitoring tools.
>
> Detailed strace stats before the change:
>         $ sudo strace -T -e read cat /proc/allocinfo  > /dev/null
>         read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@>\2\0\0\0=
\0\0"..., 832) =3D 832 <0.000040>
>         read(3, "allocinfo - version: 1.0\n#     <"..., 131072) =3D 4085 =
<0.000062>
>         read(3, "        4096        1 arch/x86/k"..., 131072) =3D 4063 <=
0.000062>
>         read(3, "           0        0 arch/x86/k"..., 131072) =3D 4029 <=
0.000061>
>         read(3, "          64        1 kernel/wor"..., 131072) =3D 4064 <=
0.000061>
>         read(3, "           0        0 kernel/sch"..., 131072) =3D 4041 <=
0.000051>
>         read(3, "        4992       39 kernel/irq"..., 131072) =3D 4061 <=
0.000070>
>         read(3, "           0        0 kernel/fut"..., 131072) =3D 4060 <=
0.000071>
>         read(3, "           0        0 kernel/aud"..., 131072) =3D 4025 <=
0.000122>
>         read(3, "        1536        3 kernel/tra"..., 131072) =3D 4014 <=
0.000064>
>         read(3, "           0        0 kernel/tra"..., 131072) =3D 4079 <=
0.000067>
>         read(3, "           0        0 kernel/tra"..., 131072) =3D 4035 <=
0.000072>
>         read(3, "           0        0 kernel/bpf"..., 131072) =3D 4044 <=
0.000074>
>         read(3, "           0        0 kernel/bpf"..., 131072) =3D 4061 <=
0.000063>
>         read(3, "           0        0 ./include/"..., 131072) =3D 4084 <=
0.000063>
>         read(3, "           0        0 kernel/eve"..., 131072) =3D 4084 <=
0.000071>
>         read(3, "      278528       68 mm/memory."..., 131072) =3D 4068 <=
0.000070>
>         read(3, "           0        0 mm/zswap.c"..., 131072) =3D 4091 <=
0.000082>
>         read(3, "           0        0 mm/balloon"..., 131072) =3D 4039 <=
0.000083>
>         read(3, "           0        0 fs/splice."..., 131072) =3D 4095 <=
0.000083>
>         read(3, "           0        0 fs/binfmt_"..., 131072) =3D 4039 <=
0.000075>
>         read(3, "         192        3 fs/proc/kc"..., 131072) =3D 4088 <=
0.000076>
>         read(3, "           0        0 ipc/mqueue"..., 131072) =3D 4017 <=
0.000076>
>         read(3, "           0        0 security/s"..., 131072) =3D 4075 <=
0.000072>
>         read(3, "           0        0 security/s"..., 131072) =3D 4029 <=
0.000084>
>         read(3, "           0        0 security/t"..., 131072) =3D 4053 <=
0.000076>
>         read(3, "           0        0 security/a"..., 131072) =3D 4054 <=
0.000078>
>         read(3, "           0        0 crypto/rsa"..., 131072) =3D 4046 <=
0.000081>
>         read(3, "           0        0 crypto/asy"..., 131072) =3D 4079 <=
0.000081>
>         read(3, "        1728        9 block/blk-"..., 131072) =3D 4034 <=
0.000084>
>         read(3, "           0        0 io_uring/r"..., 131072) =3D 4044 <=
0.000085>
>         read(3, "           0        0 lib/crypto"..., 131072) =3D 4056 <=
0.000363>
>         read(3, "           0        0 lib/pldmfw"..., 131072) =3D 4079 <=
0.000091>
>         read(3, "         384        6 drivers/pc"..., 131072) =3D 4091 <=
0.000098>
>         read(3, "           0        0 drivers/vi"..., 131072) =3D 4068 <=
0.000093>
>         read(3, "        4096        1 drivers/ac"..., 131072) =3D 4086 <=
0.000089>
>         read(3, "       11040      230 drivers/ac"..., 131072) =3D 4001 <=
0.000090>
>         read(3, "           0        0 drivers/ac"..., 131072) =3D 4030 <=
0.000094>
>         read(3, "           0        0 drivers/dm"..., 131072) =3D 4031 <=
0.000094>
>         read(3, "           0        0 drivers/xe"..., 131072) =3D 4085 <=
0.000097>
>         read(3, "        4224       33 drivers/tt"..., 131072) =3D 4086 <=
0.000097>
>         read(3, "           0        0 drivers/io"..., 131072) =3D 4038 <=
0.000097>
>         read(3, "           0        0 drivers/io"..., 131072) =3D 4034 <=
0.000100>
>         read(3, "          64        2 drivers/ba"..., 131072) =3D 4094 <=
0.000110>
>         read(3, "           0        0 drivers/ba"..., 131072) =3D 4025 <=
0.000100>
>         read(3, "           0        0 drivers/dm"..., 131072) =3D 4077 <=
0.000106>
>         read(3, "           0        0 drivers/i2"..., 131072) =3D 4049 <=
0.000103>
>         read(3, "           0        0 drivers/ed"..., 131072) =3D 4035 <=
0.000108>
>         read(3, "           0        0 drivers/fi"..., 131072) =3D 4052 <=
0.000107>
>         read(3, "           0        0 net/core/s"..., 131072) =3D 4057 <=
0.000119>
>         read(3, "        5248       82 net/core/r"..., 131072) =3D 4050 <=
0.000110>
>         read(3, "           0        0 net/core/d"..., 131072) =3D 4047 <=
0.000111>
>         read(3, "           0        0 net/ethtoo"..., 131072) =3D 4059 <=
0.000112>
>         read(3, "          32        1 net/ipv4/r"..., 131072) =3D 4052 <=
0.000116>
>         read(3, "        1920       10 net/ipv4/i"..., 131072) =3D 4040 <=
0.000116>
>         read(3, "           0        0 net/xfrm/x"..., 131072) =3D 4071 <=
0.000118>
>         read(3, "           0        0 net/ipv6/i"..., 131072) =3D 4053 <=
0.000120>
>         read(3, "           0        0 net/devlin"..., 131072) =3D 4064 <=
0.000120>
>         read(3, "           0        0 lib/decomp"..., 131072) =3D 3996 <=
0.000123>
>         read(3, "           0        0 drivers/vi"..., 131072) =3D 4043 <=
0.000121>
>         read(3, "           0        0 drivers/us"..., 131072) =3D 4045 <=
0.000123>
>         read(3, "           0        0 drivers/us"..., 131072) =3D 4020 <=
0.000126>
>         read(3, "          64        1 drivers/sc"..., 131072) =3D 4043 <=
0.000128>
>         read(3, "           0        0 drivers/ne"..., 131072) =3D 4094 <=
0.000130>
>         read(3, "           0        0 drivers/hi"..., 131072) =3D 4025 <=
0.000132>
>         read(3, "         672        6 fs/ext4/mb"..., 131072) =3D 4071 <=
0.000132>
>         read(3, "           0        0 fs/autofs/"..., 131072) =3D 4038 <=
0.000134>
>         read(3, "           0        0 fs/fuse/fi"..., 131072) =3D 4093 <=
0.000134>
>         read(3, "           0        0 drivers/gp"..., 131072) =3D 4035 <=
0.000133>
>         read(3, "           0        0 drivers/gp"..., 131072) =3D 4046 <=
0.000135>
>         read(3, "           0        0 sound/core"..., 131072) =3D 4021 <=
0.000150>
>         read(3, "           0        0 sound/core"..., 131072) =3D 4000 <=
0.000134>
>         read(3, "        2048        1 drivers/vi"..., 131072) =3D 4078 <=
0.000138>
>         read(3, "        3328      104 drivers/gp"..., 131072) =3D 4040 <=
0.000143>
>         read(3, "           0        0 fs/overlay"..., 131072) =3D 4075 <=
0.000141>
>         read(3, "           0        0 net/netfil"..., 131072) =3D 4061 <=
0.000139>
>         read(3, "           0        0 net/xfrm/x"..., 131072) =3D 2022 <=
0.000129>
>         read(3, "", 131072)                     =3D 0 <0.000114>
>
> And with this change:
> $ sudo strace -T -e read cat /proc/allocinfo  > /dev/null
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@>\2\0\0\0\0\0"...=
, 832) =3D 832 <0.000018>
> read(3, "allocinfo - version: 1.0\n#     <"..., 131072) =3D 4085 <0.00006=
6>
> read(3, "        4096        1 arch/x86/k"..., 131072) =3D 4063 <0.000062=
>
> read(3, "           0        0 arch/x86/k"..., 131072) =3D 4029 <0.000062=
>
> read(3, "          64        1 kernel/wor"..., 131072) =3D 4064 <0.000064=
>
> read(3, "           0        0 kernel/sch"..., 131072) =3D 4041 <0.000046=
>
> read(3, "        4992       39 kernel/irq"..., 131072) =3D 4061 <0.000053=
>
> read(3, "           0        0 kernel/fut"..., 131072) =3D 4060 <0.000054=
>
> read(3, "           0        0 kernel/aud"..., 131072) =3D 4025 <0.000053=
>
> read(3, "        1536        3 kernel/tra"..., 131072) =3D 4014 <0.000051=
>
> read(3, "           0        0 kernel/tra"..., 131072) =3D 4079 <0.000050=
>
> read(3, "           0        0 kernel/tra"..., 131072) =3D 4035 <0.000051=
>
> read(3, "           0        0 kernel/bpf"..., 131072) =3D 4044 <0.000053=
>
> read(3, "           0        0 kernel/bpf"..., 131072) =3D 4061 <0.000053=
>
> read(3, "           0        0 ./include/"..., 131072) =3D 4084 <0.000052=
>
> read(3, "           0        0 kernel/eve"..., 131072) =3D 4084 <0.000072=
>
> read(3, "      286720       70 mm/memory."..., 131072) =3D 4068 <0.000071=
>
> read(3, "           0        0 mm/zswap.c"..., 131072) =3D 4091 <0.000056=
>
> read(3, "           0        0 mm/balloon"..., 131072) =3D 4039 <0.000056=
>
> read(3, "           0        0 fs/splice."..., 131072) =3D 4095 <0.000076=
>
> read(3, "           0        0 fs/binfmt_"..., 131072) =3D 4039 <0.000075=
>
> read(3, "         192        3 fs/proc/kc"..., 131072) =3D 4088 <0.000057=
>
> read(3, "           0        0 ipc/mqueue"..., 131072) =3D 4017 <0.000055=
>
> read(3, "           0        0 security/s"..., 131072) =3D 4075 <0.000046=
>
> read(3, "           0        0 security/s"..., 131072) =3D 4029 <0.000045=
>
> read(3, "           0        0 security/t"..., 131072) =3D 4053 <0.000050=
>
> read(3, "           0        0 security/a"..., 131072) =3D 4054 <0.000060=
>
> read(3, "           0        0 crypto/rsa"..., 131072) =3D 4046 <0.000181=
>
> read(3, "           0        0 crypto/asy"..., 131072) =3D 4079 <0.000051=
>
> read(3, "        1728        9 block/blk-"..., 131072) =3D 4034 <0.000070=
>
> read(3, "           0        0 io_uring/r"..., 131072) =3D 4044 <0.000078=
>
> read(3, "           0        0 lib/crypto"..., 131072) =3D 4066 <0.000067=
>
> read(3, "           0        0 arch/x86/l"..., 131072) =3D 4085 <0.000066=
>
> read(3, "        7168        7 drivers/pc"..., 131072) =3D 4090 <0.000066=
>
> read(3, "           0        0 drivers/vi"..., 131072) =3D 4063 <0.000065=
>
> read(3, "        1024        1 drivers/ac"..., 131072) =3D 4094 <0.000067=
>
> read(3, "           0        0 drivers/ac"..., 131072) =3D 4023 <0.000063=
>
> read(3, "        2048        2 drivers/ac"..., 131072) =3D 4020 <0.000066=
>
> read(3, "           0        0 drivers/dm"..., 131072) =3D 4094 <0.000067=
>
> read(3, "           0        0 drivers/xe"..., 131072) =3D 4087 <0.000068=
>
> read(3, "        1024        1 drivers/tt"..., 131072) =3D 4093 <0.000056=
>
> read(3, "           0        0 drivers/io"..., 131072) =3D 4037 <0.000044=
>
> read(3, "           0        0 drivers/io"..., 131072) =3D 4095 <0.000061=
>
> read(3, "           0        0 drivers/ba"..., 131072) =3D 4045 <0.000059=
>
> read(3, "           0        0 drivers/ba"..., 131072) =3D 4011 <0.000057=
>
> read(3, "           0        0 drivers/ma"..., 131072) =3D 4087 <0.000064=
>
> read(3, "           0        0 drivers/i2"..., 131072) =3D 4028 <0.000059=
>
> read(3, "           0        0 drivers/ed"..., 131072) =3D 4048 <0.000080=
>
> read(3, "           0        0 drivers/fi"..., 131072) =3D 4082 <0.000054=
>
> read(3, "           0        0 net/core/s"..., 131072) =3D 4091 <0.000068=
>
> read(3, "           0        0 net/core/f"..., 131072) =3D 4041 <0.000053=
>
> read(3, "          20        1 net/sched/"..., 131072) =3D 4054 <0.000051=
>
> read(3, "           0        0 net/ethtoo"..., 131072) =3D 4045 <0.000051=
>
> read(3, "           0        0 net/ipv4/r"..., 131072) =3D 4040 <0.000051=
>
> read(3, "        2048        1 net/ipv4/f"..., 131072) =3D 4056 <0.000050=
>
> read(3, "           0        0 net/xfrm/x"..., 131072) =3D 4053 <0.000056=
>
> read(3, "        3072        6 net/ipv6/i"..., 131072) =3D 4095 <0.000060=
>
> read(3, "           0        0 net/devlin"..., 131072) =3D 4094 <0.000064=
>
> read(3, "           0        0 lib/decomp"..., 131072) =3D 4023 <0.000063=
>
> read(3, "        2048        2 drivers/us"..., 131072) =3D 4053 <0.000062=
>
> read(3, "           0        0 drivers/us"..., 131072) =3D 4011 <0.000068=
>
> read(3, "           0        0 drivers/in"..., 131072) =3D 4092 <0.000059=
>
> read(3, "          64        1 drivers/sc"..., 131072) =3D 4067 <0.000064=
>
> read(3, "           0        0 drivers/ne"..., 131072) =3D 4059 <0.000067=
>
> read(3, "           8        1 drivers/hi"..., 131072) =3D 4050 <0.000052=
>
> read(3, "         256        1 fs/ext4/mb"..., 131072) =3D 4024 <0.000070=
>
> read(3, "           0        0 fs/autofs/"..., 131072) =3D 4082 <0.000070=
>
> read(3, "           0        0 fs/fuse/in"..., 131072) =3D 4074 <0.000054=
>
> read(3, "           0        0 drivers/gp"..., 131072) =3D 4066 <0.000063=
>
> read(3, "           0        0 drivers/gp"..., 131072) =3D 4091 <0.000052=
>
> read(3, "           0        0 drivers/gp"..., 131072) =3D 4029 <0.000064=
>
> read(3, "           0        0 drivers/gp"..., 131072) =3D 4094 <0.000062=
>
> read(3, "         128        2 sound/core"..., 131072) =3D 4069 <0.000068=
>
> read(3, "          64        1 sound/pci/"..., 131072) =3D 4074 <0.000069=
>
> read(3, "         384        4 net/bridge"..., 131072) =3D 4021 <0.000054=
>
> read(3, "           0        0 net/netfil"..., 131072) =3D 4084 <0.000050=
>
> read(3, "           0        0 net/xfrm/x"..., 131072) =3D 1513 <0.000047=
>
> read(3, "", 131072)                     =3D 0 <0.000030>
>
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  lib/alloc_tag.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 25ecc1334b67..ec83cf798209 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -45,21 +45,17 @@ struct allocinfo_private {
>  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
>  {
>         struct allocinfo_private *priv;
> -       struct codetag *ct;
>         loff_t node =3D *pos;
>
> -       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> -       m->private =3D priv;
> -       if (!priv)
> -               return NULL;
> -
> -       priv->print_header =3D (node =3D=3D 0);
> +       priv =3D (struct allocinfo_private *)m->private;
>         codetag_lock_module_list(alloc_tag_cttype, true);
> -       priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> -       while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL && node)
> -               node--;
> -
> -       return ct ? priv : NULL;
> +       if (node =3D=3D 0) {
> +               priv->print_header =3D true;
> +               priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> +               codetag_next_ct(&priv->iter);
> +       }
> +       // TODO: need to check iter is valid, or rewinding it.
> +       return priv->iter.ct ? priv : NULL;
>  }
>
>  static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
> @@ -76,12 +72,7 @@ static void *allocinfo_next(struct seq_file *m, void *=
arg, loff_t *pos)
>
>  static void allocinfo_stop(struct seq_file *m, void *arg)
>  {
> -       struct allocinfo_private *priv =3D (struct allocinfo_private *)m-=
>private;
> -
> -       if (priv) {
> -               codetag_lock_module_list(alloc_tag_cttype, false);
> -               kfree(priv);
> -       }
> +       codetag_lock_module_list(alloc_tag_cttype, false);
>  }
>
>  static void print_allocinfo_header(struct seq_buf *buf)
> @@ -249,7 +240,8 @@ static void __init procfs_init(void)
>         if (!mem_profiling_support)
>                 return;
>
> -       if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_=
seq_op)) {
> +       if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &al=
locinfo_seq_op,
> +                                    sizeof(struct allocinfo_private), NU=
LL)) {
>                 pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
>                 shutdown_mem_profiling(false);
>         }
> --
> 2.39.2
>
