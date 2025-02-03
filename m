Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D9F20AF9D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592970; cv=none; b=Lm+LmEhwouYW77iJieoW/zoO5SQbZE6l8Q1EwfPgsB2JGY4Pvo/F/dkoXuf+DDHoH838/+ziQccPiEJpfKV1LYUmvaoavusm1deLnD4gA7GyYeGCD3nD1aPjCXj5fZgOHQGqkh0spOcu2rPY9czdihyj5XSgK3aqc0ErpDEmRNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592970; c=relaxed/simple;
	bh=9m8yHZ/xq5yo0/XbH7/aqq4u9pNGQdOz65IFgXD4ngc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWS8flCFJ3qpFc0j/cXBJTs3behTy/xXIBNKQqYxPv5RaMN51yXRaeup9tuBfqrF2rGkHetpre09k3TfFTtsIe8xMPRCaohu9mNJ78+Y3msv8Khhya/sDspl4TGXcalx/+DaXosrY+UUThSTsbGhYaPScfqmAzjQu9SBqUzeREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hujdu8R1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hujdu8R1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so6556521a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738592967; x=1739197767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TXQsubBdw/wAjD+eExfN+6DFOSabStRe5P1g6XNmoc=;
        b=hujdu8R1O9qNpsdzrOwHRxOLXPMH8DJ2d56btPrYgLT4SXT9tq0Hxh+lusm+N3tj+f
         Wk0xieV8S0ZMAVNfq7gBnIP3NiOmJBLPhA8WGS5CG0geKQbgXDqaF/ajB2gqK5Mb6pOp
         +dD9edusYeci/0WMQcGINbocDf+Vih26X/wCS44BVJTGTHR59QxBIWrWmaGEbCSWqZ+1
         TAU80zW/o7Ro9ELvVNKTk1Ft0rfRfi24AA1RFhbYLF9rIEMLo0Q01RLt1djmBgFktunz
         WeChDkNI8pdKNVxUwvojnAPnrzx2wzPOeXE0DeLMUrq1909YDBvvE4DwaRYBk4Bq9nnC
         uhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592967; x=1739197767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TXQsubBdw/wAjD+eExfN+6DFOSabStRe5P1g6XNmoc=;
        b=lZA/hBW3TQ2RPUK+YerETs3KzK7vdi/HZt64+aim6Ol7u2nhxjiaf5C9gDr/uzhXRt
         I+zBggB5q8nzSXSUmBT+wpBjD+F2DoaVCX58kdFzf25cCsPxJ51mSVNwM0DXNvXadNqo
         5YlXJCjSfzrGH8BDbT3k6Ej70hTrwl4Tl5L84C+hYzVAL8bwcW+BUbBOi9ct8IyEpQdh
         a7wvOIAWJkwlHqv/eZkenfSWvvnl2s4DeGZk/pLGKGijahOcRyloApt8Iy+H6pgHTnWC
         PnMrDBNMR3KVCFvN7fejjE8MkSdnnv1LgqFolNhq3Bhts3t59qAPcdUszXXIViQ4rcec
         nMIA==
X-Forwarded-Encrypted: i=1; AJvYcCW4S/7IZubluPduZljl6kE4DOmqzDxsOowhOCFDJJW4NnAd6LSE2sBeRoLD+UoYmcG9z/hu9e7TUocmlDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxysKwsAPzqUI46RU8786FZ9xvDrAE80wytq2p/zloGb6SZR9Hn
	Zcm4LrlcVq6qnw/JGYModT3Hdi4hHr3dFs2YmrfsWURfGdb4tmYgLgD6qZ1HD0SFjTgHu9I/wNF
	XzPZr0MHzk3ZQY13ZgSIXO57nTBYtWjHcku7n
X-Gm-Gg: ASbGncvUTijxDAaylBrmAkhl3LpV4Rb1op9lxJ6xRm1a86Ubiz3z6k2g7+pizTkt+tr
	clof1gFisJ2Grai1g1TJyCJIc48Uq8HVjxvyOjX9QXUSKhGMGmtnTjewco+ofZVg57rC8OmwfsS
	WNMclEs2Bw0tMUvyYJsl8KOGLQaFw=
X-Google-Smtp-Source: AGHT+IHTruQTFbormYFeQIcy728mYS1bfRzzv7IZB7Q85ek/7/F4gYieXONEtPMPRoQtGfxVcz+ogIq1MUlcUYn+3Jo=
X-Received: by 2002:a17:90b:2dc9:b0:2ef:2980:4411 with SMTP id
 98e67ed59e1d1-2f994e6d108mr20498323a91.9.1738592967383; Mon, 03 Feb 2025
 06:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <679b7c95.050a0220.d7c5a.0014.GAE@google.com> <CABCJKufpND1qvBhUMwpJ4OE7Umo9EuaNTLOi-GmAXFdXRqhoFQ@mail.gmail.com>
In-Reply-To: <CABCJKufpND1qvBhUMwpJ4OE7Umo9EuaNTLOi-GmAXFdXRqhoFQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 3 Feb 2025 15:29:15 +0100
X-Gm-Features: AWEUYZkbZyGsg2KJCSYTFl4vhroH4GwPRZp3afld8aOLFnVjuqncctYVhB0Hf8s
Message-ID: <CANp29Y4OWo1ebuP=1B6O_Qhhg+YprW899s4PpEs4HVpvKs4+jg@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (19)
To: Sami Tolvanen <samitolvanen@google.com>
Cc: syzbot <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 5:28=E2=80=AFPM 'Sami Tolvanen' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Thu, Jan 30, 2025 at 5:20=E2=80=AFAM syzbot
> <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a13f6e0f405e Add linux-next specific files for 20250130
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D10221ddf980=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3445081dab6=
3716c
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D62ba359e1dfec=
1473c57
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for D=
ebian) 2.40
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com
> >
> > scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No su=
ch file or directory
>
> gendwarfksyms depends on libdw, so on a Debian system, I assume
> libdw-dev would be required to build with CONFIG_GENDWARFKSYMS.

Thanks!
Adding libdw-dev has indeed fixed the build error.

#syz invalid

>
> Sami
>
