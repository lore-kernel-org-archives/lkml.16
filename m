Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F51BD9C5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743847688; cv=none; b=HxqCZ2izFl0ywqj7P332eF8AoiOn7q2fCREsz0lCoD4WyhCsGs6NHIw/IfW+qlyOzGbCLiyrSxhB4B2VLR7NOSCwxzLss/sswVgbpwHsavcxDKXaoYphzas0Zfg+M0iqN5/LRbl5qbmivR1pUcLqiGiDLIOBW4eZkg98jPoTcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743847688; c=relaxed/simple;
	bh=LxtarRStgWclOBhSPEPXwPdH9Miqr7pr/bjtmZPApeU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=siSOFeXpFRk7XZ35ZpeygDlFCplzrCWPVCGiBnPsl7SCbwec8AxHF5lHG4WfdGBzOrLwfG4Rae3XQjDaOJXSwkeEFZWPEFZpgkhYqT+0mZMBtdtqVtwCdja2KtlzzK8LZyZPXMFAhiun7Y6l+MaA1A+TkB8Nr085gGUZl7oRLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso335903939f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 03:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743847686; x=1744452486;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s45ekNsiTONHV3mmKn2jyLI2V9a1SGYsEr4NByUQ0rk=;
        b=mqlM3ATADAc/yclJolGaHYUrIHS7uRQT23YyisFoDvtNkRIPmfpEhkWZCNfMXnGrEU
         f+xS6ACrXRSjh2XVfZQciIj7lu/THnfgCpWJ9baW9xFlUM6RYyny6HenE0a7Ij7BsbP2
         4yM4n+6ylQKFqNOli6fyddd5/hP2eRKgKlRQsY7ZPxtqqKgIeQ2ORvvkkdcJ8WEOdaIJ
         8F19goGYp8SRDYY+Mzodlb+t2Y++kFPnbBjGL3JjX4qUJy2bG3eUOjU2HxY6zSv/BhzR
         I9Ji614OoWKglZ1SWFsQWOXtiBLdavZXZDzYdob7Wsv0xeY9ND0LlWV8S1y80HP5SpBy
         iKEQ==
X-Gm-Message-State: AOJu0YxuQRqFiQcERhHAxVUIpzYfuZiCbCrcJAs8KqXroTrb5TqP97UP
	z9aaW7OswYzdStvkZksuGi9244Yv/ooRKDtWSKZrtZstCDRk+dUyAtxY9TKMkqPJXuUYS68luGz
	nHkK9PENpfl4dHkCffX8sBhfJrX+KMy8gsyQEfqRWOzjYFWjWaX4Bl0I=
X-Google-Smtp-Source: AGHT+IHYQhvs1lGjUgkwg/oaJl1Royj+ikU0sVw5d2aQicHaaqjft5T7gtR5B4H6l9CWLyGbtaEHiy9a7FYETtT4SWIqEb6VlJR0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe5:b0:3d4:36c3:7fe3 with SMTP id
 e9e14a558f8ab-3d6e3f0534amr54053275ab.9.1743847685317; Sat, 05 Apr 2025
 03:08:05 -0700 (PDT)
Date: Sat, 05 Apr 2025 03:08:05 -0700
In-Reply-To: <67eaf9b8.050a0220.3c3d88.004a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f10105.050a0220.0a13.0233.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [rdma?] [s390?] [net?] KASAN:
 null-ptr-deref Read in smc_tcp_syn_recv_sock
From: syzbot <syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [rdma?] [s390?] [net?] KASAN: null-ptr-deref Read in smc_tcp_syn_recv_sock
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 850925a8133c

diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index 3e6cb35baf25..41f8dcd734a6 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -127,6 +127,8 @@ static struct sock *smc_tcp_syn_recv_sock(const struct sock *sk,
 	struct sock *child;
 
 	smc = smc_clcsock_user_data(sk);
+	if (!smc)
+		goto drop;
 
 	if (READ_ONCE(sk->sk_ack_backlog) + atomic_read(&smc->queued_smc_hs) >
 				sk->sk_max_ack_backlog)

