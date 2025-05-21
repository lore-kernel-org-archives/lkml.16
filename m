Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADA2641E2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829978; cv=none; b=n933pHDjab71rhw5HAwF4D7R5ZZkt/XVLkZ4VObe7FJ27aZB8dEylszBopILD4Oku9SzWEAJj1Y+aq3h6h+HSIogCpgq0nVY1ag500qOX2zt7qPqKY+5l1VrOATXX5+Ingj6N6M51bky9FdlUxZV8QZ4MWPIAx5noiSnlAXCqr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829978; c=relaxed/simple;
	bh=PqsRjncWRwWFNw1qUcaaiax4mt8Eic1WURWwhwRZF7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmAAvaJZI5ScQCajKBcODmFdfHEB4jZnZz5U0jysg9geZzvIE3ScenESCHKVaHTvJRlB0fLHkOYO7YzTioIwrbn4Y9Q0eg0xGZ/XxhybDDRw2fsYVbp3agCFjELM8xOg1fdru/WV4kVhqQ9OZAMN6uRzSSf7FtN64d4gzIM3pgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sw9Xpeu7; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sw9Xpeu7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f8c2e87757so58585296d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747829976; x=1748434776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqsRjncWRwWFNw1qUcaaiax4mt8Eic1WURWwhwRZF7M=;
        b=sw9Xpeu7SlczVhYISAbOQMddcVQcET6Aa1Ur/wMcWde/iTaUqv1WB6+Zy0wk0inhZr
         sXxZA4c18B0owzzoUdE/yMX609Lx0aaqKP/HoPMxjsF1xu4XDpXkWvdfszBiBz/ToYg6
         nSF4tx8WbXyqzIrySvRFbiWUum2dtb+c5Hb/wMHCDjg9tEkpgT+YDE3emBXev57kjwF1
         IW5h3HR+gtLP6CsI9kMWWcOSLKlkEJqupVddSVRVeyH4E7YJbK4ygErL55PTqt2+Imxx
         BJfeA1u9glBsC4jPs8u23frh9zA/4qPtd2aKDCU5YaqUPmVOnZkewA6BxSTNkZNGJJLZ
         92Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829976; x=1748434776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqsRjncWRwWFNw1qUcaaiax4mt8Eic1WURWwhwRZF7M=;
        b=sPFCsRsAcphPlH1jCFcFAew2LTCwzpmazc3kMiVc0sdQbmyLtEf0tCwcRvrER0neEN
         BO84BbK+llecfbBjYgbMNyjy+iyHSjiYZ51yk/5+pqvDjeAid+BlLKy7BH/PvduX1tgD
         itADZ+jHQUGlqeUp1FS9O1vgzYIjJQ8ruaVaOpHuY4jthwWCYacnofkAtATHrcj6WJ7N
         4HKEtSRRp6yg7LQsPBppw+BAsYg1kVV87mTyMeviAKkf5LlKgEYX9CSiqj5NscSqI2qb
         V4PP/MVZ6Il9ItIoGQntZLp0AC1sjjYskS9Kk/6Whr/5TcTzcJLtXpwFkPmQy0tXcYKi
         T9qw==
X-Forwarded-Encrypted: i=1; AJvYcCX7f1hGsnUFyptP2wQNyaYuTLT1tmwYChR9j+CWdfOs1lS+B3dkxxVywNxA7v72sQ40CMI51/7w3jkFZAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMahR+0IImArRHbOgRHo6AJptZnEYyYHA9AZoDZTjTH1bddIF
	RYFAficrIZVSnRNe2HL89F0NaQqlm6ZRl5ox+QH79dXn2eoUYUlWJx/ADf3mVEKYa3XSx57/4ZW
	LsBpLVpGeprpwF862ztRlyD44VMf5ZFxz0ElLXi3w
X-Gm-Gg: ASbGncvhQwUuQxiulp5ioEh2NIWZfl0ZYnGGs4i2MjTk+AY6o8UYKNZjiPq9m94pZi4
	R5l80alO79m6J28Jk9nSFkFBK+xwm3XuPXM9d9WmrHunxyhnZ8CwDMT/P4A5zn6Tjw2Ej7SfNPj
	rJe3xEBZnUdd6uu2HfgGJRMGK/99Qt00yqGHfWyfaes9sXh+hUt4tS0tA1yHDjkJCWqFLZrUNIx
	XFDxQ/zSHA=
X-Google-Smtp-Source: AGHT+IEh94sqRoFtPW34UEiJHtefX2bwYg/7uGcG7u4K2QMbHAGYTVDgHfSbx4vQ7WjqHCTDocNSIhdWSx/lFzAVnHw=
X-Received: by 2002:a05:6214:1302:b0:6f8:ac7b:c1ab with SMTP id
 6a1803df08f44-6f8b08bfa84mr332272086d6.34.1747829971584; Wed, 21 May 2025
 05:19:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYSPR06MB715891CFDFE828006F96F88FF69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
In-Reply-To: <TYSPR06MB715891CFDFE828006F96F88FF69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 14:18:54 +0200
X-Gm-Features: AX0GCFsgqonrX_K883qGzYffll4eUVtcw3k87KlWMAkMHF8NKRY9n2umr8_bx9U
Message-ID: <CAG_fn=UdHtmz+7LAWD59=Y+PavQDc=S7rGfpgjTR75rsjFLPAw@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in dbAllocBits
To: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
Cc: Dave Kleikamp <shaggy@kernel.org>, Jiaji Qin <jjtan24@m.fudan.edu.cn>, 
	Shuoran Bai <baishuoran@hrbeu.edu.cn>, syzkaller <syzkaller@googlegroups.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:19=E2=80=AFPM 'huk23@m.fudan.edu.cn' via syzkalle=
r
<syzkaller@googlegroups.com> wrote:
>
> Dear Maintainers,
>
>
>
> When using our customized Syzkaller to fuzz the latest Linux kernel, the =
following crash (102th)was triggered.
>
>
> HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
> git tree: upstream
> Output:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6=
/102_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102report.txt
> Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc=
6/config.txt
> C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6=
/102_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102repro.c
> Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/102_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102repro=
_bug_title.txt
>
>
>
> The issue with this bug could be that the JFS file system fails to correc=
tly synchronize or update its internal block allocation metadata (bmap stru=
cture) when underlying loop device backend storage is dynamically changed b=
y LOOP_SET_FD. This leads to the dbAllocBits function using outdated or cor=
rupted bmap information, specifically the db_l2size field, when trying to a=
llocate a block, resulting in a wrong, oversized agno value being calculate=
d, which eventually causes an out-of-bounds read when accessingmp->db_agfre=
e[agno].
> We have reproduced this issue several times on 6.15-rc6 again.
>
>
> This is the URL of the 2024 syzbot report of this bug:https://groups.goog=
le.com/g/syzkaller-lts-bugs/c/CVD1uqZnFPA/m/P4-Bi8BmAwAJ

That's a different one ("use-after-free Write in diWrite"), but syzbot
indeed knows this bug already:
https://syzkaller.appspot.com/bug?extid=3D0be47376a6acbcba7f0d
