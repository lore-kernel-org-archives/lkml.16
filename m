Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006011386B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743742745; cv=none; b=mZm7bELWd3TgvpQ9T5TVRti8hB1OI1hWAyOwzJVm11/FicCCTwUOhdPTDIzve2NwZE5MFsunqUhSl1DiG1EgNo53waRnhtr2u5U+ly3fRHclHdDDfhO+Tami8pqMFdbkfAgoAOvxn7oCDE5UW1aSTfRtdbsS2A18VEbBrIpzJaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743742745; c=relaxed/simple;
	bh=wFLPmx0Fwbmd/I78yKqedPCDa3YVrPzE4DZoTzzBYbg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PtsaMVy1Qe4HgjdRlQTgQPuVzIVw0NROPtHnniE9GKiRIFAHkELbAhEEGnU/fXtExA4kXuCpZgk5dnk2TOuzoKnLAHJq1keTbJLPd0mOV0Q3+FtvUNkCOCmmWdVig6uVYh3yAuZbv62rZjxZsjnrgLG71PafE9tc7KcnDDjpldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so349986339f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 21:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743742743; x=1744347543;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veSiNRiQYQ4ynN8I5E3nEA6jQwT6rqRu0bXRMuIj9hQ=;
        b=waD4vy19/H3oKYwTbk0rlnijaXfcUBjY0QMOFsydCTAXtuLRw5qSv8SM27FZ7QlS8w
         d9OMU/MIPSoGaGBfFyiZx29lA2hHW1j3l60/lSudo+nImtesANOA0FYmNHWZuo2vcwLH
         cvtxnSFx2s1VrNwKa0kv6h1sikVlq3n44fzRYDlAxXYj2O9l0fw7AJ/IF2R8fVih5DMs
         1ZEzzbYtrIjivSt6adnZyBSeKuTR8XJA4hz/YM0zkqcXaPrTc3c7ybyOPk0MOCzp/L/+
         F+Ro7x2ENzo298O14Dnw7pbBjZ/g+71gmxCMJtMYMCRldWzspGHrr6yZ1kR69VhpMlih
         Vy7g==
X-Forwarded-Encrypted: i=1; AJvYcCUIRr+EA4C7eETmNcSEDky14aF53DozXbxSUG/djJyMe7+tjgiZFgM21MkJwihmyXW+/0/OevOoNfFfBmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP93XfovM/x+qWYYRcUdKBweeYDSBJhIkaGtt4CoCpLX7EPvVg
	iQP1GAffdADkRb1FDquAAPmj6YWFloKsZXwLLsxm9udLZDhm5PoVJ+oeCMeVi63hKg+0wkiT+Pe
	ECV1842SAm1cpGcVuVyzSdApuip7AK8KwXS2BDkWrigUcxH+iB2rVC7I=
X-Google-Smtp-Source: AGHT+IEfzW2UhovFNpHtnZ6+XnVHMCXzqHaXL0dQJ9zNwC+OQPLBYM5Vkt6QH2EqPBTD5D8l59Lb0XYDaqzSEeEvHN2sOg+8h67U
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c243:0:b0:3d3:e3fc:d5e1 with SMTP id
 e9e14a558f8ab-3d6e3ee1673mr24694795ab.1.1743742743080; Thu, 03 Apr 2025
 21:59:03 -0700 (PDT)
Date: Thu, 03 Apr 2025 21:59:03 -0700
In-Reply-To: <20250404040706.3772-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef6717.050a0220.9040b.031f.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in
 load_firmware_cb (2)
From: syzbot <syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Tested-by: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com

Tested on:

commit:         d6b13dbd Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11692a74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7139a37e0ece1f
dashboard link: https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=125de178580000

Note: testing is done by a robot and is best-effort only.
