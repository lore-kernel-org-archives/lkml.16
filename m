Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96601263F32
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829133; cv=none; b=jssM8YEFHqRLpOcTkaKsg3oxLiw4bwesU8Wpvcb57Kwm1Jln7SwIq240fC5T8ElfCgALq2RRyOzopDiFi6l74Io9VwejF6fEN9AhnMz9op8Z7+n9R1s8PFhYpVOp+rrHDMiRSl89/fLB+OYMTJUMi3GZTv1DudlM1KhAwpgOPY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829133; c=relaxed/simple;
	bh=Mr1sElushm3LzulXYHUlu4dq/CgSYePb5BfotpIBtYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOwsTZa1DptXnEiu9ETxla6pNVHEg9h2bZqn2p0GE98SoGVJn3wHdwQhEmdnPh+Lwj6OVCUC47OteT5y2Jy/sVmiTKiiCL9et0ub0MVsVrhjh+TlT+sPH0RgyU5mGV4djSawd005Z88EoCdgpCavWwb5GbkQGg+Llpyu0LA3lhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1qqyZgig; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1qqyZgig"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso70600946d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747829130; x=1748433930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJsWt1mNEkJ6TND356xWL6pseJCFCGdbtjXqwHFRmtk=;
        b=1qqyZgig8NTCb5ut2k9G6LCu9Gq+M3b0+P5QVNXCIQj7ZG51omvjTzygZBD/zlVmMX
         W1ftWtesd6DBHz5n68XiV18raRAwD/SjO2SFhrAt75+vFOgcczwF7gYi17Cfigk3WChZ
         TavOM78/RwSN9kPiEgTOLMh6Z/EppQAgwYQLvot+c/Yl9n3INEUN/Csrf+62Gv26b08P
         /5vzlejiXiCAzzW8DZcOe24cOkLZDH/NCaCL27muFAC2+qR+lFkfVGaaCAwH4vFBsngM
         PvGB/EAV7WBRP4oJsBlu3FIGG0HHYFMEkqtk1f28LGTsQGaH1sONW8U4F3hPpUYPsNmW
         wH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829130; x=1748433930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJsWt1mNEkJ6TND356xWL6pseJCFCGdbtjXqwHFRmtk=;
        b=YhXgoot6kFcplSZGJQ7u0D3Bs0ucD1T90MmWcAUqHdQUPR6Fqn7S1MJkcrQe7LXCss
         hAGxYBekrfRIIRfD4FV+vbsqriA6j5rvfYp8R+tPXjO8E+4mwK+rOUf6vtsYMFSLW0mP
         HOXSlnd7woaSsi+SCXEBCYNgPFGYZwh+PRJLIDK7l1LvorGy2i2mRum6m5lwhDHsfJUT
         BqhIENl712qAexrfLx2jwhJ4/QFY+0EbrisysDKA8TNqPNdSBQx5pN56PNc0pPDOxw18
         v8CAwB7tzgwbI6cOMPXjAOr2pMa9zjPKWGhQpJtBrkCqpU4MIElOmth6XhzHk7M7/TA4
         /njQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDv6tb84vliDw6DCROkxO6RV5g2Bl4YdEHaz2Id4CVQknotlHOu7utrnHkEe66BAPIE4J2td+R2VmUNE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhuV4k+0V4/RZo7rGI5OF/SM780VHe8toMg3S+D0Ug1Fdw7aH
	+CMQk//oJFPlJWTf55eF9CpihORGDf34YnzpP1FdLDBdMw5da5VnWaAnbiaT3sJ0P/dK2gCfdgw
	m29Ay0T0a9Z4b0rFkxfi2+NhJ4QFK2lYKwopKivAG
X-Gm-Gg: ASbGncuaOz1fJO3I+vPhtHWKtwv14EPqkcZPftI+nDYo2odOwIQpGhmfhZhCpwhLPlM
	iH9HXfkDzhjWVZ/N10zktOt34N7cWDAnF5JwIiRTDHsSj/la8ow6Bq4qzscmn5oOkbhV9TXPGgA
	xbpS5WkwAT+ApkQkAsIYBqbYY9Z+zJ6fXKENGdFa5Gjfmgd9pTgB9/8AmFswp8a5BzSMWP9ZLo
X-Google-Smtp-Source: AGHT+IE4nszdPTaTsYD6/dTLWLjkxjSClcCI0A/hi4NPRWTvJbUndv7yziChK8tmm5OCQWlNJGUZsqRQQ6EoFTGQgdc=
X-Received: by 2002:a05:6214:212b:b0:6f5:40d5:e51 with SMTP id
 6a1803df08f44-6f8b0840becmr300821196d6.11.1747829129698; Wed, 21 May 2025
 05:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYSPR06MB7158089CBC192CADDD09D323F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
In-Reply-To: <TYSPR06MB7158089CBC192CADDD09D323F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 14:04:52 +0200
X-Gm-Features: AX0GCFvlgsZwvghn10Te2aPRZdI8QOOEV6kZi2Kt2UzFa_kjOLR_Ay3oJFzwLBQ
Message-ID: <CAG_fn=VuMZQH1yFxFZ=n1+3d-ndywMPYwzd139k4hWevVkaB_Q@mail.gmail.com>
Subject: Re: KASAN: slab-use-after-free Write in diWrite
To: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
Cc: Dave Kleikamp <shaggy@kernel.org>, syzkaller <syzkaller@googlegroups.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Jiaji Qin <jjtan24@m.fudan.edu.cn>, 
	Shuoran Bai <baishuoran@hrbeu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 12:24=E2=80=AFPM 'huk23@m.fudan.edu.cn' via syzkall=
er
<syzkaller@googlegroups.com> wrote:
>
> Dear Maintainers,
>
>
>
> When using our customized Syzkaller to fuzz the latest Linux kernel, the =
following crash (101th)was triggered.
Have you tried to look up this report in the LKML archive or in
https://groups.google.com/g/syzkaller-bugs, where all
syzkaller-reported bugs are sent?
https://groups.google.com/g/syzkaller-bugs/c/kPwF_ow20LQ/m/pN-_ZqVDDAAJ
is clearly the same bug.
According to the dashboard link
(https://syzkaller.appspot.com/bug?extid=3Daa6df9d3b383bf5f047f), it is
still occurring, why report it again?

>
> HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
> git tree: upstream
> Output:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6=
/101_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101report.txt
> Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc=
6/config.txt
> C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6=
/101_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101repro.c
> Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/101_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101repro.t=
xt
>
>
>
> This is a slab-use-after-free bug in the JFS filesystem driver, inside th=
e diWrite function. When JFS is mounted over loop device and the backend st=
orage of that loop device is changed via the LOOP_SET_FD ioctl, JFS may not=
 correctly invalidate its internal cache.
> triggering procedure: JFS filesystem is mounted over a loop device. The b=
ackend file of that loop device is changed and operations (such as jfs_read=
dir triggered by the getents64 system call here, which further calls txComm=
it and diWrite) on the JFS filesystem try to write back inode data. The diW=
rite function tries to write a memory address that it thinks is still valid=
, but that address belongs to a slab object that has been freed (by some ex=
t4 related operations) and possibly reallocated.

Is this text LLM-generated?

>
> We have reproduced this issue several times on 6.15-rc6 again.
>
>
> This is the URL of the 2024 syzbot report of this bug:https://groups.goog=
le.com/g/syzkaller-lts-bugs/c/CVD1uqZnFPA/m/P4-Bi8BmAwAJ
>
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.ed=
u.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>
>
>
> loop4: detected capacity change from 0 to 32768
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in diWrite+0xeb0/0x1930
> Write of size 32 at addr ffff888052f700c0 by task syz.4.12/14401
>
> CPU: 2 UID: 0 PID: 14401 Comm: syz.4.12 Not tainted 6.15.0-rc6 #1 PREEMPT=
(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubunt=
u1.1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x116/0x1b0

When reporting kernel bugs, please always include file:line
information so that the maintainers do not have to look it up.
(See https://github.com/google/syzkaller/blob/master/docs/linux/reporting_k=
ernel_bugs.md
for more hints).
