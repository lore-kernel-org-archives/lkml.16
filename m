Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7507264A94
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424008; cv=none; b=diREgfWpfb5gXMtdraSELsTLJCTqOdcvT7Hu0YdxWrSDLf16JSCbmmBsEwIYqgm4AgScecKEdv8auVtkXXPa2Kr5SiCtXB4CqsQADqkqix9GX3UTSNsQPVJQWRqj43cdTEKNHSpS/C5qLktve3XOFBeiq6F3TuffAaWTS/wbuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424008; c=relaxed/simple;
	bh=0IWJnGmpzbckaKLA2HytnuoNm19OMG9K8/2+dtygUME=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=heIH9aKhPoVGzMwwtUTQR69Ni9DC46XbhLt7VgSFfN0yYGjyx0Lldc1NlPdmNAHNGxY0M/qajvy1XhXoaG0WajmoFp9DP1Dlw8PSo4fmwcPtJWxxZlOTnrs9wHRvlDSQeIZVP37P7dmX3hinBuYrkmuK0mPNGMhl8qWi3uuQAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so634085ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424005; x=1746028805;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0sI1i2xGzchs+owj15okiTG1poFW4rKmuKlTCett0Y=;
        b=ZihJAZP87x7A/OukFpSDvEAPfTChHFyFrNr9QlV3y3Ayv2AxVCebo9/lbXLx0MuP99
         IlR74b3hkmYCZmoRAMKsMQEpi/VFkf/tgbDr50a7FQQWyXOiM2nkLc/c2bOH84UvzQ6p
         CRPWfkaa5PW5U+6IcpNNajfxgUNWRs12V4SEBwYM5zHqT5p5ik4EvsF7V3713+K92+ju
         Nn3Y8bg+BuZDUdB7cnJ5iar4S/2AtpRdbIhWdBi0HR4Tf9dVs96JnwR0JcR1h73aHUFs
         aLzWYc0JvitYciRq2sd/LN7Y9m5y2dd6tylPdGaqaCJGzC6c61YYQVUxnAvXaud5sGxB
         wBMA==
X-Gm-Message-State: AOJu0Yzff/wiGq6sHcl6j6sp38/VbiMkAiS8gnSZ1FxMnj1cgUHyIaYA
	bh0vO7hSHtBXXGVbjB1IIxsQ+qenhEEqha+0cbStXOU0+ZkK2RImPHfZ0Fv7VL/1lqGDWwhrHLQ
	S9Vbss/nXQ/cyse6VJW87GATvaeBYWylAKlSn0xrSVWG2nxktNrTfPz0=
X-Google-Smtp-Source: AGHT+IEECtdrQldB0l0XZb7Ok0LYH0rKiEhJQ4tNIfnh+k5yHWtMlKGrnvTJR4/8t+BpzYAHaCGX018/dSaIylvhdNGnFDFsdZFe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2683:b0:3d8:1ea5:26d1 with SMTP id
 e9e14a558f8ab-3d89417e663mr228745545ab.18.1745424004965; Wed, 23 Apr 2025
 09:00:04 -0700 (PDT)
Date: Wed, 23 Apr 2025 09:00:04 -0700
In-Reply-To: <20250423153243.187481-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68090e84.050a0220.53a34.000b.GAE@google.com>
Subject: Re: [syzbot] [btrfs] KMSAN: uninit-value in __crc32c_le_base (4)
From: syzbot <syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com
Tested-by: syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com

Tested on:

commit:         614da38e Merge tag 'hid-for-linus-2024051401' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10be763f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=49342144b6a907af
dashboard link: https://syzkaller.appspot.com/bug?extid=549710bad9c798e25b15
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b99a6f980000

Note: testing is done by a robot and is best-effort only.
