Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80232292B27
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880605; cv=none; b=rukspzrWEVIet2u5/+aqIX02rjHEPZCWhTEl3TS9+S7503KKRUxdjzB77QLc9I0ZG24qS9mezKDmwxyOPlWqoKWSoDz92Su/X3IOV/BdFTJ7aFP5nQk4k2ZEre8HFUjGRIYlPxuAYRkqbFCqnu+uPcb9wvdNxBCA6Elwc9zTOMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880605; c=relaxed/simple;
	bh=pMhlVEkUFYx16frqYD2ys/zp4Vacync+fTFQLO8Y7j8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=msfdcxmLNtcvn8WhllRCToQU/eQhYmV5HRNUG8og2cAKHkEuilPXxtDcVTB+lsjrl9wxFAGe8ZStCLKMbTQ3u+TxFGNc45ysOgHfgs6gU/RztHPgmK0ivP9Xq8y5i6/MPyFGKcNM0Kxl3v4cESFTVyzPmtnKWKZDDl0TxR1Wg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e05997f731so72292425ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880603; x=1752485403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3FrwSzkZRQpjEv5ax7x7GcgrRUZI1/BeJkblnIIDas=;
        b=Fx4JfQHjHptzTnInlIo5J+GFBtXbTG95H1ja3SS7xTYxpWS0hCMJJda9pvTu0l45SE
         VimOcXWJaXOzWc0pKNIII+249BvTJOHMPK0GwA6igAck3GSaIatFnZkGxiBUCfkhb0ON
         x0uKmW7k4UIkyMSEResz3BQjnA7FXBo7Hxz+D8DeZF41gYF5N3aVvfDG5sH+nOCpvRt7
         A1d8VsYoA28eAlzX5Wj2KlBXg/S+svpm3AA6U6egp9wTBZ+yKj/6uno8AbZCfrgBHanO
         cTcIXafKCiLeQCdCsrc2aY0R6jj8TlAm/RSphR4abTKhB6MfpzxQdFzTmqvZtgrNmIeJ
         zNBA==
X-Forwarded-Encrypted: i=1; AJvYcCV8XI4VDmZkij3DZeknejCD63evUf4S5TEk3OMJ6hz//jdN+Cft//4RRk0wbQKrmvRGRD1MvQLN62gJePI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/J0xzRnG5djrwoHsjGoPFlRvCzucns5iSI5/SPhVHeOrBbHxA
	s4+CySF8d1k5lN4z0TKJDHkaCKFmCd/oS+tV1GTC8IHbmeo+8a+IuGTyxVAlSWCmo+SFrqdPtEI
	4rKwuG13Fqb19CUaRgODqJpsGc+ONgZ+ZAFeZf34yATEH9nRSm9rhxbZXe+w=
X-Google-Smtp-Source: AGHT+IH5hJ99iBdAZ2eUEYhkALrqUM1smJuemUwvFzbEb4CHV+YszENd6TVowh9yRirN1q24ejmtOnIeaAYKcZbBaU/7HfoXhukt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216b:b0:3df:4738:977e with SMTP id
 e9e14a558f8ab-3e1371d527fmr93550285ab.10.1751880602735; Mon, 07 Jul 2025
 02:30:02 -0700 (PDT)
Date: Mon, 07 Jul 2025 02:30:02 -0700
In-Reply-To: <67917ed8.050a0220.15cac.02eb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686b939a.a00a0220.c7b3.007e.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: corrupted list in remove_wait_queue (2)
From: syzbot <syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com>
To: brauner@kernel.org, gregkh@linuxfoundation.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, lizhi.xu@windriver.com, mchehab@kernel.org, 
	standback@126.com, superman.xpt@gmail.com, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Wed Apr 14 08:58:10 2021 +0000

    staging: comedi: move out of staging directory

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13009f70580000
start commit:   05df91921da6 Merge tag 'v6.16-rc4-smb3-client-fixes' of gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10809f70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17009f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45bd916a213c79bb
dashboard link: https://syzkaller.appspot.com/bug?extid=4e21d5f67b886a692b55
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161cdc8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d1a582580000

Reported-by: syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com
Fixes: 8ffdff6a8cfb ("staging: comedi: move out of staging directory")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
