Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428A1D47AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747419846; cv=none; b=Ax6FLyG8ojWgZkqia88yAfS4EjQjxiJXUTOxjUu33tvUrIEyM7GBNTAGpHpnlpiMkPj5R7vWzZYWPHJZF1QQl3KhUQcdvko7sVLUpel+zbDncgeeHmOaQOF/r3wcTI7jhox8fyCBGhMFtvVBUjZoaRD8EVczTwKcfuqXV2w9PN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747419846; c=relaxed/simple;
	bh=TCtSOJP9Onst/rlWrTLLiFI1ydiTFe4dnD9Bhsi3VYk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aLDmKRzzENlMgUuQxJ+08Vu5qdLCWkJt0LGLtEG53eGBGZ698CAYmaun9Pa1B2g7AlQQeAMTXvTfZMIeOH0i5OC3N8x6ZuJHCx8O4s413cIBRVSxZpCQKIX/p9Gopjk8xtCdsEGDo1l5jC7M3LOTQDrcZLels2XzfCXliX75Ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3db8522a300so20042095ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747419844; x=1748024644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LKu6pgQxY1brmse3Vd/NFTK/uYSaAW7c3E5D/rznrJc=;
        b=gXY04nfVWngxnb8jvdkhdhpRIVCCPBoYvPxnob1mYHL1+94whpUP5t1MimQrPctk7T
         ZVwbxZr9fRZQWGvrSrMVEaw30f+VYYAlh99jHTRur6VZK306cV6hF2238hiwyd5mpXCE
         UxSaryyfJkSZUbG6rm2APYKziZDIrWers5wu8v1UrMYxSv2zvK+GmOAlya2PJH6zyvdl
         Q6KV3mDtduCN1rTFK8/syb075oH1KULsuE9Htg14OSCocicMVbjko4Kb5GFO3489c/dv
         ObXASsqslpvZ88ABXpx/H+zPcpEZZOoP65vav2xNNuj1aU1k33SbBEnFYnkZ5b+9fqQ+
         fUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVM/yc2S4eCN7sh/hg7z9ET9E7t9/t1M3HTrinb2IsKk832aPcwU8Y5qFCLNC3c7HXafHlRipwrNbMyD+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxThQTnwWrmEp4DUr1d4sJVSO0oGyfJ1aC8UU0HpwXKbIIw5aP9
	suppSc3T9242V9VEXB11tjvn5uuP30ARg49/TIo0RHz+MR/Gbz22cUvfWTDbz9I/Q7kzNcZ/jdE
	doxo2fYyIauma3pYaKh7NC48uw6IIzz6NWCsagHorsmO2NAS9ugtb1mvAed0=
X-Google-Smtp-Source: AGHT+IHuKv4mVAdiYVr4YiEYI/le9HUzjdP54iS6zdGgbA4vE1+AVpXR6V83/QAuZAhlqP+f1gSRCo0cMZUhWZq1Yv3qybRygU4H
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f87:b0:3d1:a75e:65f6 with SMTP id
 e9e14a558f8ab-3db84324635mr71651295ab.18.1747419844104; Fri, 16 May 2025
 11:24:04 -0700 (PDT)
Date: Fri, 16 May 2025 11:24:04 -0700
In-Reply-To: <20250512141322.15270-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682782c4.a70a0220.38f255.0004.GAE@google.com>
Subject: Re: [syzbot] [ext4?] general protection fault in jbd2_journal_dirty_metadata
From: syzbot <syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com
Tested-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com

Tested on:

commit:         3c21441e Merge tag 'acpi-6.15-rc7' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12080ef4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97ce7f89bb9ce135
dashboard link: https://syzkaller.appspot.com/bug?extid=de24c3fe3c4091051710
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
