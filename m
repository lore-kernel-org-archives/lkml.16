Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BF2F3E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245084; cv=none; b=K6fnLnku22w/ZQJYvYkn9MbOXHNainEwznIIeOMfmzVSs+drTa6DD1n9D5W6rSiXUYgADaNVGJLwYgUW9zs/RbuFvWglvBqKomILxE/r/Sdyg9PXRqAM8SwjVYp7XVupbxeGvLpZJBPsa2y7Q0qIhbKOLNubCcLQEJ6kFg6vh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245084; c=relaxed/simple;
	bh=JbKnPNSpeB2oeFwxfFliUKPkAAFPMHl8syw2PGMtsQU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=himLSu1HS6Md7t4D9n95ylVbuyrBRlJghOcfsrq/UjX3CHA+oPaeAjB61sXGQ1uD3bWbnZJNA/vnr2pGnnx41gM4OVC8wwmAPxzhsW/E1SJvyOMB6OifTJCW5uzwZOUBbLlizOolbSbEpMt5URGV3pQ5ff5Sz3jZxe9CwcKS5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df309d9842so49828785ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751245082; x=1751849882;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56XNd+Ou2Us1vABRYUBcUtjEFc2zUC+FHVej5u5ivXk=;
        b=JmWnrMbqLn8o7AotHCBcMRUbcL1LhPWn3o0ZytkyLjUGWyhGv56GkpZNToZoMOTUCW
         KdYaUlVsc73plezhwXLrfsQfR1VHFUHMBZFzmF/e48mL5XOV2xWQS6Ai2CUz1yP53VP8
         2g5pAfooCibI+JrZISSW6JdkEE58vf2BYEoIqU0NKJ/OF1IsXxJUFwLBo8hOZ9mQhqMr
         Nc/oPfpVfHU5c1UL04Ub8389a36HGSHkNzyNGkXI3WXPox5+LrJhTxv8aExESsZvd1AX
         pFN9bC1yq1oXTOH3RGWv1w6tFPEbWE+wTDK1y+8Iikk457wrhaZfPWqoiv1CeBj/hEpO
         XXew==
X-Forwarded-Encrypted: i=1; AJvYcCWYUUC44KEoP/4l2lrP5aJzniSaX4DK1hMJyMhN57VOBWwqUW9DCQmJadNSWcg0Aw+9yxPLaU7R3Ocuwt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdotJPvHOozO0uKa+ZmGJJwZxssfDdpSjAnsw/RB3Gutw9RdK
	XqmCV/EHISx3GDQDzE/Meo/wz3LKWfu6JSlMAzQnOrY25b1P3yrUamZyweC4YY/5KShqL3xVNht
	Sk8nwXvZmSebLPR+kbmWOBKS5ER2zT59wrJmoS9qJxqstgaeHotGlDGyD9as=
X-Google-Smtp-Source: AGHT+IFrLNWH1Ugf12B9eiKogzKis15Moy+Ai73JDpaGszuQ52uZbpnmWbbnc7+cps7hk+PU0AXxrdm/vqBJZHCz/P0g7btZZnqm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e07:b0:3df:4cf8:dd50 with SMTP id
 e9e14a558f8ab-3df4cf8e050mr80079955ab.19.1751245082278; Sun, 29 Jun 2025
 17:58:02 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:58:02 -0700
In-Reply-To: <20250630002712.2109-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6861e11a.a70a0220.2f4de1.0024.GAE@google.com>
Subject: Re: [syzbot] [smc?] KASAN: null-ptr-deref Read in smc_tcp_syn_recv_sock
From: syzbot <syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com
Tested-by: syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com

Tested on:

commit:         d0b3b7b2 Linux 6.16-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11da6982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=31697df50f24445
dashboard link: https://syzkaller.appspot.com/bug?extid=827ae2bfb3a3529333e9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b963d4580000

Note: testing is done by a robot and is best-effort only.
