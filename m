Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDE1E3762
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249417; cv=none; b=snAe1GY6mQedm67oOmzaeq0aYBgNoL0+ZM4CpxZaOXNZv0GcOmwXXunz3OwwDb9nt6VCNjjmqNnnFTO8rtH7vswaE6STlmNsmsxmzH1neANbm2ppSBx0iu61/YUADe6qvVo+vctxPlBjJx3Ffe7yzOZ0X5Gy+hp4x3K7O/cOByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249417; c=relaxed/simple;
	bh=7r8aRdMgPggrmvpJvLCdX0/pBmsKKNimBRQjqP19w0Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SSTrdx6yvuUohrpZsImMvSp/RKLmuua6HGhWLKuPQVwGy9/bVVKIzF1jAj5x8Rz9ZbjetBxmoEc3lIDKOVVpn7GR0BRX5NlcVj/OFrPYCZmCQfFZcSwWFjPN3TfbWwCAMpBCXCm+CE0jOWwAXc0bIEKzJL+CdxWMvz03JlxeACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5875e250so169097239f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249415; x=1748854215;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7r8aRdMgPggrmvpJvLCdX0/pBmsKKNimBRQjqP19w0Y=;
        b=bzUmn+0jTcUBxTpNoPLoWYTWRfNxXKJe6XWm1AeJdl0MsZhrbHl9LbJAHweKo5ht+Q
         Dz2ElQeHueQ8gV5Ifwg3sS6nkCT0JbjBx1V3NBUqON+ecdMJ6jWjBjk0/oow92IiAHST
         cUUU6kCYcTZm0vEkZ8+lU/dlqe80+2muUWGACS4lSTUY/tplq/1D/cTToiFXPlbSH/6+
         7AhMCvz88/8w+6o2kdC0Y7uO3AL8luNtak/XoTmiriId5ON8tDW1+91aXVsL7J0EE0dn
         0Rd0trg70akGVyu0+OJCbqXaz0kc0XqqpIJHvYdR2KGSzBQRg8hHac/nFXD6LrIuff24
         TgqA==
X-Forwarded-Encrypted: i=1; AJvYcCXVluhHrssGSfwak0sf0xTP48WpeD/SgF56l9ii5IFmC+/53F1W5wJB6BQlSnqFO/I/d3m4BkVej5r1PVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BKevha7g3TMHCcfdROMuEJqJ3M4dV+1dptkR30C6gmDm6o8p
	rJmmhGdaWRw4iRLB2G0Knu3HOLX2czf0xJBQbrKiz7RMu4bV7Um0Xtyo4wDdWPqh20T9BoZiJTM
	6yZf2wvCqQEotNzBB8Lu0Mdn1XTwIQi09fTisQuEA5T6sgxtZkPMkJb37jUc=
X-Google-Smtp-Source: AGHT+IGOo2lmULrjR/iwGplRL30bkcEhPuZyxc72lp41LzzTtXiefpjNjJTk+foGvQNbtScr17PtZxNvTpCgIG9KaABh//fr/chr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e98:b0:86a:24a7:cecb with SMTP id
 ca18e2360f4ac-86cbb7da7c2mr1179440439f.4.1748249415172; Mon, 26 May 2025
 01:50:15 -0700 (PDT)
Date: Mon, 26 May 2025 01:50:15 -0700
In-Reply-To: <67bd7af0.050a0220.bbfd1.009e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68342b47.a70a0220.253bc2.0090.GAE@google.com>
Subject: Re: [syzbot] general protection fault in lock_vma_under_rcu
From: syzbot <syzbot+556fda2d78f9b0daa141@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, asml.silence@gmail.com, axboe@kernel.dk, 
	eadavis@qq.com, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, shivankg@amd.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
mm: fix a crash due to vma_end_read() that should have been removed

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=556fda2d78f9b0daa141

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos
