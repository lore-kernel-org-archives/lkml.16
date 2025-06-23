Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E6238C09
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672435; cv=none; b=bgTB2g8bei/TICH1SquDjye1YvKjALqEmJi/3th+192lTWahWaoIk0aTouA+XxCh+GH4o0IlTfwcGrIjbwzW/KBAT2LQqeRj+TKPEBY9UG9k0jE+VBgGD4PUhxeIwIBUQyIixY+ZR3CZzitFYs+zoTgwERVl3sUuS41lkD4EdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672435; c=relaxed/simple;
	bh=+3Xt4gdTar0oSX0HOeT4fP5HuEh6/LoT4fkjSYEtw2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWbS2TN8gfybf0fi72jH8oE3CqZlxIiqyPdB+/u2nJVxqo3R+AZ/b1OMfK7FYmeyjfPnHyiMCkSHtwVE9v/eYeiTp1peLcKDeftxNRSPvW0AiiPATpuIMjtcjVCnwO6UcKbRWarMM6sf1y3wUNNRbvdcQ3jPIlqBfpSCfHk+/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sjYopv02; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sjYopv02"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecf99dd567so50449966d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750672433; x=1751277233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MYJ8Ld2YhT5jQm/lDg/PdDLP/gpdIe8KlR+jR1iis0=;
        b=sjYopv02Y/fCkzW9ERbrkyyvWhpPeADeipZvu2VrJu/OXYhXBETr2NGZZNKv2WoKZ9
         sjciC1MzCYAdc+iJDrzmfO1W3Am2Xqq3kC7usMGZc7+37BLBt+eK394s6kufFbQsSlSg
         6rfB0Ni0MFcshOgRXLlCQPGLuGw9c/VHcLTt8DiAZLtyObS7R/biAu3UGdxFqPWk3uVt
         7NljOQnRJtBuU0uSJKM7lowoC3Nnz2PK620chwHJqQsPDvpOXZh+NDQA7Qi1tMoCFmst
         D01Dgc/QFL6eDIB/OeSa9zIz9Kn7lAZ+6PGFofToYRDP5FREYssyLzAP+XhJLzqJc3At
         /nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672433; x=1751277233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MYJ8Ld2YhT5jQm/lDg/PdDLP/gpdIe8KlR+jR1iis0=;
        b=KJII+2KMjsA5o2mQuOmaizbbhsXAVGSQCIczSFcvIKduFpvrx8ch4MFyZv8g+UcRZX
         NOemQnCwQcdmrzIZlg6Dp+nniRBCfHGPYz5tWcQBbIU8j48q9Os7jBb8yqRU+kMbB4zs
         WiW2cry4z6MZC4RoYMYZQm8MxvVO2E4qB+j9b5MZ3NpJ+A5x6aYRjmCuoT7gQIs/l3sM
         ybbaRQZs31z4Mm2H/DdzzIidsQ6sEutzHU0NaM+FkrGUgQx/egczlsJJjTKRGJO12vfs
         WKYuq/xCxmiUwYSn3TUtGKezq7RZHXpDeQyslU87siCXWqM40g3FDKa64GECfFEIvQgU
         SipQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOJeI0UBGic4xI9juyHvjuwiXGL8ZW60g89L1Pm/MxwLqnG1/x0cHHBsixm+JgPSmgmHzKbj8IbXX64AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpw3fnbzcY6Koy8oqWxPcsnkp4aAwIO7GLr2IyD50oPAEVfD2t
	HibLdJ+ni89Mp77eIILBSAmNyFhmN2LbhCfV7Ms3fTfrswMEmQV1FFdJViWIKDSWbqgx2oTbuLl
	7kYeNfIrNW0Og5Xd13gy925EdZYSWoD60gjo9P1Qm
X-Gm-Gg: ASbGncvHsPUEyx0sK/Z421rGPUMMmQr9g91rKt8p/ZkgFVFSq/1wQYcGeonCICy+oxT
	hEiPWmJR+U80Gv8V6SFAslJUZE6y/sg7CWoj84LBzQf32N5nOLso3G3LceqOhhD0V3SY0W2rH8K
	qNJHr/4T0ykTa0f9+MZ2yR3mXAsVO2Z0HW0uAq5SoUg5+H0NYPPyr2zMT1sjQ2G+iYdz77LJ1PG
	w==
X-Google-Smtp-Source: AGHT+IFX9sZftARuyi6eb1zYlu+z3jKlXm0//IyHkmZSu26oOjY7sADAH2akKqUEU7tpILlMO2Jt+xA49eKcdlEKeEY=
X-Received: by 2002:a05:6214:2427:b0:6fb:43d:65b7 with SMTP id
 6a1803df08f44-6fd0a5c1776mr217459176d6.36.1750672432489; Mon, 23 Jun 2025
 02:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6857299a.a00a0220.137b3.0085.GAE@google.com> <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
In-Reply-To: <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 23 Jun 2025 11:53:15 +0200
X-Gm-Features: Ac12FXz_zfg3yBJguqG7j_axVUPXtzC7srPFRYhdD65HCgVqc8QCRPDRe21ZCKI
Message-ID: <CAG_fn=WBBwkZZZzBMp0SO3=POgKzNaJGkU_YJKcAKRVQdEYPqw@mail.gmail.com>
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: David Hildenbrand <david@redhat.com>
Cc: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, axboe@kernel.dk, catalin.marinas@arm.com, 
	jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, peterx@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:29=E2=80=AFAM 'David Hildenbrand' via
syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>
> On 21.06.25 23:52, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    9aa9b43d689e Merge branch 'for-next/core' into for-kern=
elci
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/lin=
ux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1525330c580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D27f179c74d5=
c35cd
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D1d33589377246=
7199ab6
> > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07=
757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > userspace arch: arm64
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D16d733705=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D160ef30c580=
000
>
> There is not that much magic in there, I'm afraid.
>
> fork() is only used to spin up guests, but before the memory region of
> interest is actually allocated, IIUC. No threading code that races.
>
> IIUC, it triggers fairly fast on aarch64. I've left it running for a
> while on x86_64 without any luck.
>
> So maybe this is really some aarch64-special stuff (pointer tagging?).
>
> In particular, there is something very weird in the reproducer:
>
>    syscall(__NR_madvise, /*addr=3D*/0x20a93000ul, /*len=3D*/0x4000ul,
>            /*advice=3DMADV_HUGEPAGE|0x800000000*/ 0x80000000eul);
>
> advise is supposed to be a 32bit int. What does the magical
> "0x800000000" do?

I am pretty sure this is a red herring.
Syzkaller sometimes mutates integer flags, even if the result makes no
sense - because sometimes it can trigger interesting bugs.
This `advice` argument will be discarded by is_valid_madvise(),
resulting in -EINVAL.
