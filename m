Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E822CBEC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759406; cv=none; b=lDFHnWrAjtMglQApmTIV83IJsK7UudDliLae3UIXChgx7FN2c/qdiZ/5RjC89wxM8xc3JemlelMcvJ4a2RO3F3jLH+R/SxhY9MexRjOJeTE6SGE4LTrID4m6LCB+Nfc5FPPENIbRz04UQDjrKTyzy7nmE+Jz1inE4BDo1yLa3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759406; c=relaxed/simple;
	bh=vGT3MarK53rpokBLzn0JWi7vx6Ln+4fYxZVoSQ5FC0k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lyg277zhqkHIfUWwtHhGO9z59/9osH7JS7DxS81715cFL/7Fw8FAgV07ruMt7lgqPMe0Bi1b2SvXqp3/lvNSClzvABG0XjugimsuCcZ2FldBg+ZftUFxYQzHRD02JD5m77Hz69MSJFlzCHwD4AeCCYegs/o3izEKQ6DjHVwDido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d0508b8008so4422795ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759404; x=1739364204;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRUb7q116tHmFQj/0YgfKaFNswn5qaAAdppPk4BwGiM=;
        b=cFKWj2607RHyioAL2C2PoBZfrnq/WfzUXOlvFCdR2E5Bv55FoHD6BmaYzJH00cUoAQ
         GFtnZx3jnq49H4LZvw9vktoCL7aAdgyIGwJMOEyGOhb1DuJru7j8QBQ7y7lCqnKDTvB/
         cI5rLVr2YYRukAgkOva3jNI+Xvci9BP+QUBIlnNOROlePjTy/CHGgqhofmQMwe90ll5E
         KZZA/qtJAVEGq+Ix2ADvSFGsDysx1PQhKj99YI4RFKQ1glSDKNf5NLdGR5iEvtWrov9h
         9YKTNwlgquofYHs/C1jMJ4JHaRGADHBcvHPU/djbKt8WMZveTbWw95VqcbGYweugJOqs
         55pA==
X-Forwarded-Encrypted: i=1; AJvYcCXkaeIRyjXh49FuRe393JGUNtlu64npCwxVP82ubwBkq2GwjZTqJ59darsTY9LjWwxup4FZllqCSNX5B9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCU/YRuW+XzkzojPm3ZXDIft6qODeEqMxkg+RBQvUWPPEEd+qe
	l89cPxsSkbrTpG3wFDV96+9U29c7KbeDhUycQj7DvdFpx9fJGl9EVcBHtP91ItHrS8T2jAohDwX
	RE+uv0HAKEHPi+Tb58q9W/ksPYHLsJqwBNwFHjadXTEdT6Vumn+NuT+A=
X-Google-Smtp-Source: AGHT+IFRfoOpdJpQ5zDZvYupP045h9qwD/CWsaXNfysR10fstS1tt7UEC1NpTfIX1fs/h21jeL0zRvs6cm4iiRJjy7l9KSpN/35P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:3cf:cbac:3ba6 with SMTP id
 e9e14a558f8ab-3d04f41181fmr23312265ab.5.1738759404331; Wed, 05 Feb 2025
 04:43:24 -0800 (PST)
Date: Wed, 05 Feb 2025 04:43:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a35cec.050a0220.50516.0051.GAE@google.com>
Subject: [syzbot] Monthly input report (Feb 2025)
From: syzbot <syzbot+listf87ffb68925f9c296843@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 29 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1180    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  526     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<3>  408     Yes   INFO: task hung in uhid_char_release
                   https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<4>  371     Yes   WARNING: ODEBUG bug in release_nodes
                   https://syzkaller.appspot.com/bug?extid=624d9e79ec456915d85d
<5>  275     No    possible deadlock in __input_unregister_device
                   https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<6>  206     Yes   INFO: rcu detected stall in x64_sys_call
                   https://syzkaller.appspot.com/bug?extid=65203730e781d98f23a0
<7>  73      No    possible deadlock in hid_hw_open
                   https://syzkaller.appspot.com/bug?extid=2313ca2498b9554beeba
<8>  59      Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<9>  32      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<10> 11      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                   https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
