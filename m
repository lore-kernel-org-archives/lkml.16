Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC2226D0E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748889917; cv=none; b=isZns04ICLHAC8RMz/oy/1UrLccOj+g6TTthgDoMJW4w0J/NZqc6T5REROoqWfPY35gNXOOCnRKkV+HU+VBalLplI3UtxPII7z3XBMFvuGtkF/EnRbh3vlbiLAGcoFWSx3ELQgtufYxYbhEs3TNSRyZ2gC8otLOVKKh74DYmbGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748889917; c=relaxed/simple;
	bh=nCMsFN8oTx80uExI2Hj+P94osR9oKDrBZu3hkWWuIB0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ptRhE8gAjWaUTggdXkiThvnO8G82WP6e3ImJEZioJVS6tdPU1DYaG/OSIJfPu8RmCCT9PWlzjoKEjn80E/0l4awbdaZ4lyVlHPrCavH0AxDaYK3oUvnUmZan12ouy3H4xwATc73/scRfYYT8Sl0vCD7PRX0FJyiNfMl9oCMvlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-60ed4f6a523so1648728eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748889914; x=1749494714;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUEmtxYV1w54nNVGfGVE4jJmPzNAYr0Q5jVsL47OXN4=;
        b=X/LCjBo5qv8ESOu4s1PTqFzR3nS/JOfvNnD2fACFT4L0PVmgg9eyTy2fx39jesrfmO
         t2XyD+YD/UywQcVlrkVc3lBfeIrcJJOTaSjgXMwvQqd/5NW+6idrsEVPsrJJKFTvj8oc
         1Q66YFCELhqcof0t47aheaQBkaAHKh5U50RqvCc0/3B4iybguwKtfs2NoWDShXSnvFg6
         YZ5tn3wDacoRHjqXSH7bOh1M3KeYFFgzz+Dn3LkjX3ZY7wBSXjYQfjY7qcAnQLlVDPa/
         +5Et1geJboLYFYroBZ6HraRl+hqJwNODgt5xUl2eZJlLg+fd1WAzQ6dyL6pcUqqSFm83
         dZoA==
X-Gm-Message-State: AOJu0YxodrGdYG4Btydv694OM0d1uyiozA6RAgd7iSq27KSdMvRR4Tbs
	7LKaN9YolxWP6Vt308kJPF3mjg/bNXaYSH+Sgtbag3IHx6Uze5yHTSw0jD6R71WR4Oy7lke4vqI
	AIyGdrR9g2wa+ZTimlC8UNaqzc2mM8uIExVUl32jGCk8eCO/4I+0fCqWEDK8=
X-Google-Smtp-Source: AGHT+IF59xx/MQm8sra/dokQqvMIfISszKLW33sBgm1uIK835IQG+0BGE64NYLuPnRy90qoQzKDYF+1MyPKbDBcLYtycrnhEgty4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1516:b0:864:a228:92b4 with SMTP id
 ca18e2360f4ac-86d051b08dcmr1488629639f.7.1748889903576; Mon, 02 Jun 2025
 11:45:03 -0700 (PDT)
Date: Mon, 02 Jun 2025 11:45:03 -0700
In-Reply-To: <CABBYNZLxjLiJSDOQfMqGDz5X48KSb4MuJQRKh9+F2u3PxLdvtg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683df12f.a00a0220.d8eae.0058.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=136aac82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=0a7039d5d9986ff4ecec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1442ac82580000

Note: testing is done by a robot and is best-effort only.
