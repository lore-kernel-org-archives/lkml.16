Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F929136A
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747554486; cv=none; b=VZI38LKux8peBbPD1/CcQeWGV3rgrX5rly2CZ/LAihiS+Th/gKkp+6Z9btJvDsUbVQzqY8jFd82x1DXuhogvi67WFlY1SepPpQTnGMvx/JQdD7Fe90xsFCDKm+7znCLSoXHgNcup1ZbXMnv83D3o0uebqyczFfNTEpyCH+PLRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747554486; c=relaxed/simple;
	bh=vdjS0HvUeLc1zGI75P3YJrF1t9vSdVZxVQ48f1HnVow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WtKsLgqLuDKK+Pypqd97Vh7cIvfx1xA30eGLWFVOYAyMiV9T+5KFJFjEmb0pG9MzD6W4SKHfw1NIAzR6lZKWTSPdbrvV5oIzOZ59nHJiqKDDHToxTMO/amQm/3Umft4KSVaCadoDKVxsWUNJSPdEFojc+zFaESsg2LVYicdVewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86184fa3d00so270318339f.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747554483; x=1748159283;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1U+RlsGzSlXYEgqezDytwYQ+oE2HCiq7pByYjbBZcM=;
        b=ZUcfrngxkZsJQPgiNy2+NzW9qRE10Fj42tWwDLd26qz4XG5Wd7pMM+WSluEcZ9Pxpe
         riXpvxl3NMbeumPLLPhXl+az0MrMG941CbTdfbzLGLYcNGg/6xw/xn5XZKyiHJzNfbxa
         GqVbTzeNjsGA8KYzixpG/xLg6DDmTWSwUu/MQI/MYeAGa5K1luRIYqiebbBY5kWwwk22
         oqQPl18vYviIFQz7naGWxMAYDsUSAJUy2Yr4or+Ge7s8mBQ9BDmpPlDEQI8yAuAuHGFy
         aG6A2Ragr61feGdcZLaddUQe8FIpnYabEe0xpF+N3R1ph5nfdlgspJZz50v1idtyewWC
         jBBA==
X-Forwarded-Encrypted: i=1; AJvYcCV9qGuGExybC5g2NHMktgrnyx8CqSFq/sAQG35HpgMts83dr9+s+RX9ot4y0deCfEocJE9ApX2lA7eHjqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MzfuuDEsJBYUCZfDYMdr3j1WprJnn5BRjQNrLzRqpP3XXKvP
	FS51Jimb1PVUghgDcPOtytp6RzXh9LBCxlP+z5kStd8z0vgvdMVhMEfnSfk3ZjVrBzUIjnieAFR
	7JLmdEFfapPiO3qEZTLPBORxBkUBQqytSpAAPVChGJwEbXPS4+ctX85UZDNg=
X-Google-Smtp-Source: AGHT+IExlLFjsG/HirgIOlutAcB5rCByQv+D90Y4SpBQQVuN1R5n+2DDHDlkkMz3hpukYyJHEdJc/2g97hQ65Iyoe94ULTFiWm7m
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:368b:b0:85b:619e:4083 with SMTP id
 ca18e2360f4ac-86a23227323mr1062351539f.10.1747554483706; Sun, 18 May 2025
 00:48:03 -0700 (PDT)
Date: Sun, 18 May 2025 00:48:03 -0700
In-Reply-To: <20250518072632.2179-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682990b3.a00a0220.398d88.02fa.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com

Tested on:

commit:         5723cc34 Merge tag 'dmaengine-fix-6.15' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1437ee70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102a5f68580000

Note: testing is done by a robot and is best-effort only.
