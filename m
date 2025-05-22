Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701F2AEF5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935186; cv=none; b=rFRcpxYZmtvfAAoTzNbltAOBClleCjoSXesurYUb7I5fUYIxhTnBbWQd5R9BxSIG3VVHXjmneepMosB2cQkcf1woIrXsqKZER8Y6iZcvs26FdtFaF240TJaH6m8IraVcGm0jGnuZrVhOM8c/vewcgffbuv9YqdT3CYCBSZu91oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935186; c=relaxed/simple;
	bh=dGpNaj8hwy0/NMG0idwqxKH7gUBxK+G1cg/8IQISKkQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MK7BJXhxwRgv3EJHwFMRu7bcyYFV/w7wPTp6JHw2s0qyZm1PhjXRPx1P5U0bGpsZgqTps7MIHDmt1/ks4O1ZykVMOwhaSzFzuc42WFElzIrXg79JYAfTlxkyB10qC0S0Dvoyr6W4USDWTLV8FqoC/Cb7D3mjzjLDbu8wK/JCg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so133867185ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935184; x=1748539984;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAk/QYKWBx99SDBTY90zonmrthkpdmRygRXm9b7P0GQ=;
        b=l2wB/QE36ihlP/fqhgyCJH/mFgiifsZl26AZ4exnI0wD8Px09zVAw5cbGwgGKctSbh
         ldInBJf2BbCk8vGZwToNSc+FjC/fO/ya20tT0EMbFJr4/Lm7aLV3KC5xjuDHMd1AaEuq
         fE690wbjFEtcFRhDdZkuQUr4Kz3NneYyae+1iNDS6iS2QPmun4k27jtGBj4sKIunX5/O
         KOevKVPk+RIIN90WgIGn+H+SyyB+E0Ilro7L/i6c6qLCwT3ajUQduLYJA4LdSP1ayTOl
         rqYeNALHf3Pt1lV6N0fQiHEijEP5HNNYYcD4P3BUc69DLMx90L1fSvcORXTGgD4vBmfK
         fh3w==
X-Forwarded-Encrypted: i=1; AJvYcCUEGV3RshaG4OU5FIvfbKVLZoX3MsAx/xXL1fxC9ZM12kL9wro/jL47T8p0u4wvUZG1vMsFQL2GHxS/VR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4MYpTQDS/KiAHLlkiu7OuMA9UIIdhXmwJxWxf9J99C9UOlYw
	Bv+vH9OeXvdtDxGxYZNADLdtGMJvtWZlHVSMSAntGBo1//P4c5wMcvfo5zhL05diUD4pTzkdrzV
	ZMoxHOt2qD8SuyhoBvyRzWupiScBcERv0kfkfT6KUyFEM88TywqW4i8SkxRc=
X-Google-Smtp-Source: AGHT+IHNr/vQxMe1R/3c0TtgXRN2m7uYhaNn0Gz2PWcJIwR9XF9OCt+ZrMCk/Wk/yl6dJ+CkPL3CIu+mgWC+yP+x1QD8ZQxJbxEz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1745:b0:3db:6c09:a60d with SMTP id
 e9e14a558f8ab-3db84334772mr286015945ab.19.1747935184063; Thu, 22 May 2025
 10:33:04 -0700 (PDT)
Date: Thu, 22 May 2025 10:33:04 -0700
In-Reply-To: <08232d4a-0dbc-4a99-a148-175b29b3b6b7@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f5fd0.a70a0220.253bc2.005c.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-out-of-bounds Read in hci_cmd_sync_alloc
From: syzbot <syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git on commit 9f0899d66840ce6492ad40a0c571644cb669bf34: =
failed to run ["git" "fetch" "--force" "--tags" "4d52a57a3858a6eee0d0b25cc3=
a0c9533f747d8f" "9f0899d66840ce6492ad40a0c571644cb669bf34"]: exit status 12=
8
fatal: remote error: upload-pack: not our ref 9f0899d66840ce6492ad40a0c5716=
44cb669bf34



Tested on:

commit:         [unknown=20
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git 9f0899d66840ce6492ad40a0c571644cb669bf34
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D541aa584278da96=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D5fe2d5bfbfbec0b67=
5a0
compiler:      =20
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1758f0e85800=
00

