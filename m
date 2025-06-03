Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACC254918
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984826; cv=none; b=aqJ23cPniDQGT8MWAbq3/yCYBq+ZbJAS7btRFJ7x0gcsaZPhZ58J+Flh6dco4KsT+ljMC9JFxweYafRxxbyRz3CnQyOmSXDDsvz7H9Zcq65W4Tc9TK3zaF8XbtgpD4k/stq0ggsOL9bdGEqGzfMdIz7rKoWlAdNLGrh+Ic1t9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984826; c=relaxed/simple;
	bh=SaJt33kKi0R5vHyTaTk8B29AFcdRtbtszhJBCrYSDXI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U4kTgwtRPaHSNhvHxk/yoTYkm/X605joiHhDUCA8ehAnmlkBPXBpfjhMpLFLVdsO8l1AjZOcmDydORhxPdsELugECZ+bVSruO03OjcouadQr0tUlcYZKv1XP6njNXa7uLAZwTQNONaV6UMDoBMrU9D9i5vtMt2yMxxgyQ94Wqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8730f2293fcso108284739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748984824; x=1749589624;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy+AgMgO2SM3W8IkNv/X0PcAifWAjHoREpccpSb4nq0=;
        b=SppAAr+RtwidnWo4Rar4cuIOTMBIXmhLXHmRQZYEcCjToGP6vioePh5p1tHoJWAkZy
         n6MKeJcusfs801yfdoYdzzksld3H7cCYYX4lFqZPxkcXD6sComXLo6ktQq+iM6IzOjxe
         SYcc0B4Ema2npQMFFGLgSORIMQ71/m6OI9r4HI74KGMc3GF5tbOmfz7DaavGkhHP8LOD
         0KIooeFH8A4Y5QyzP6jrm/pvseTzjogTb83SBkHVdtoPpSdevrdenl45KflwhyiC27kg
         lb3zByk0/veq1AhKFP2IQ4irAiO9xND+uwobTU2x72/Zv6V22OFWXINl89cfrOIbTTzD
         fa3g==
X-Gm-Message-State: AOJu0Yz+/ZXFfte8RAv4gTtVnln6YERRKdu/92UwA25TNqBbac+TYRxy
	9KR5X8aPJoiIKC6lOw2mHrACxlBgXWbnZ7x1BaRLaPTc7b9ZvTba8eaA7NtnwIThO7vYWTPJMS5
	/FO0s6qYtmFysIg2WSWtHUTGGYySJ2h4pequ5Yh13l/lYvVmSc2A9mN9Cyuo=
X-Google-Smtp-Source: AGHT+IHmvbj8sHT8vjHLEe2C49pJk4bgQwUNPIL1k8INk6EBPcZeDIaHFfIHNFT5xN3H9Joo85o7LNWylCoK/L3dOw0gI68Xyvhd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:371b:b0:86c:f2c1:70d1 with SMTP id
 ca18e2360f4ac-8731c562cc3mr73334739f.1.1748984823773; Tue, 03 Jun 2025
 14:07:03 -0700 (PDT)
Date: Tue, 03 Jun 2025 14:07:03 -0700
In-Reply-To: <CABBYNZJrbAP-__TML0sYqn1-2GDF0DEN+M_U0jDetCydTGWJ5w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f63f7.a00a0220.d4325.0002.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_sock_get_channel
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com

Tested on:

commit:         d7fa1af5 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=109b3c82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=0a7039d5d9986ff4ecec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14844570580000

Note: testing is done by a robot and is best-effort only.
