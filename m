Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC6620551C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483448; cv=none; b=puQd+LSvC5U7WtYzbOtwV8RWI97nsQJnLtgrcNhuyqU/beXmeYqYfpsvygWYgJcSBieixy68SM5v85aXrGdI0b/E/j/g69PFCYKh0xuGiAmbQf6VmY1tLW7c2ppw3AFoT74jWm0mKSXN7/WW4B0da6HFBAcBwVynXDZOu/OL390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483448; c=relaxed/simple;
	bh=M4TVG+cr7w6itbVX/VasFxw6mQz6iBCSPwN0WzDXX1c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KR/78P5zsc2xmHpAgFLDoiVOrZVcDLQiO7w/4S2LOMWZ70tsuANko+nCkjhBKjksAuW1MDZAtnJLNREi+3WlUA6+UjLN2RosY40Z46rh8awkd/ooI92Ki799+M5QVosSe2BwWQPDmFy5kVrMF1EnIFgilsLhngL506RqlzgfzWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d443811f04so29796735ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744483445; x=1745088245;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NG9peu6HwKo34I02zxIKwFOahGQ9v++pujGy3qN4qQo=;
        b=hR7VKfKelLoqgrj78Iq9c1PKUVvMAGjF75/0/VI/Z9MO69RDRLD6MyHiQi4ijxO0qC
         52JHhqXAUdNXh2A+IFdNdG398uJRSVSA09HSHLCzB09DprvbwLMDX8HQoIOZX6eRGp4Q
         qq2AeqspUl9/C8RJbKFECYnXgR+EDAFjT2umvx/SGSAIRdRFNHBI0nQF2qfgIjsyLOm/
         hAPmGkOrsOv9HdcFrA1fv666i+v/dlRtzqlY7VGhhUZi6KhGNTaPI1UFUauWjjRCdr35
         WNCNKjJqAaZW9KRzq4dsyZ8Hi5h3RZcvcnuNhpDAmQuj+nEp4Aody49k+a13ULfaMY/T
         z99w==
X-Forwarded-Encrypted: i=1; AJvYcCXDemyQFgaYAxYCxIzgqBE5heGcQ+vPGiVHklC3p+JThqi25TvzK8Eg1eZr4i0Cz4iuU9thktXVDal3/Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWvsZlZRVSs71NbS/w2RnlX5JYPV3DRtMEJsVQilR+OWY/uzHp
	mqKb+2/Z61nndCUqfflDKKx8K1OJUEXLHMgcUUV5oUykGrlIzXwUneRy/KkeVO65B2ICAXVdUhF
	sMfu0ToACVH9XbaY5S3xo3GcwWbseqYiSHWMJ0/DM38LIEovalLIAW6M=
X-Google-Smtp-Source: AGHT+IEBfMu7i1NkoGaxaswm0EfxG2jJyXEVf/9B7SskKgSRaHzga8YsAYffvVbqJU3HUa4u++I38JS/FEfhCcIrGH2KB9lwCdkv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198d:b0:3d2:bac3:b45f with SMTP id
 e9e14a558f8ab-3d7ec1dc7e0mr71422785ab.4.1744483444774; Sat, 12 Apr 2025
 11:44:04 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:44:04 -0700
In-Reply-To: <20250412180428.244928-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fab474.050a0220.379d84.0014.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] WARNING in bch2_dev_free
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         ecd5d67a Merge tag 'pwm/for-6.15-rc2-fixes' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e4ca3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=aec9606169fbc3a12ca6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11245c04580000

