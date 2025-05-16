Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB71E4B2
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401126; cv=none; b=FDr7D9FVLGqsKmnujz2Udm65R17BxSduFx9e+5EpWqo03TcWbHEkxAYQWJztrsUHwTDfJR33eSrFfQcJ2Xos3ulNpIyPRPof9dqXtQffusLc2qZ1FGq5qWgTvBR9XQndxg382iBFxNqmxXM0+biP2OwXZHRqmKHlhsLJotyKeMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401126; c=relaxed/simple;
	bh=lBjUklRCVHSesGaOJQAl7/ZtDpqTcBIOqud9HnD490E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bLTO7swRvaPFUW/Aazmd3DWghyb8uc9Yx77eybP/E0EPaOBg5tVu9ixva06Gu2qm5OwgU1bGRvI3UTBJ0UMs+pdhB1ZDqY8J8PGxcfnHfTk74DmD7nHvs2DoL0saTJeO/IACuBEWwuVYiTsAJEbR2Ycyb2QMzF0UiM4Hz7Klq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b418faf73so357589539f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747401123; x=1748005923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiSUfcR8G2HSHfJonyUWLd25mR3jDZnIqw2qP2u5kZ8=;
        b=W0AfSKpqYmArtCpkjQEp1Frz5gCACBx4tmUmgDAobJ0vJDKhxrG/syNi5uAtKXAp6z
         w03fUdvFi2w//HwCDGXL7cecNzajokc1o8qi71kXW9YEG/d9mjREhKy5VAgu68DOYYEQ
         xrbVaLcD8YJE+n2QYbmX28TcWtq4+8CXcDZ0OEyQGEFfAvs4IWsuPKOzol4bPXRpkoSp
         McyLpMXAFPGq4arpV3DJmWS53cANAD8ASGQQidfOihMWeS0MAX3YCrMqr6ZnfyhkqJWQ
         Dy+6/agDZfB15Y3oXiRmI+x2qOF4FFUrqf76Q6RuqooVJ9owSWrFsil3OtyBPkctRxIS
         RmPA==
X-Forwarded-Encrypted: i=1; AJvYcCXGWZKN7pRVlWOoTN3geKLogcNjp+FfpNeBAE37ugERHdVEBct+BolPrwaVR3AY8JqGrOuXJ1BA1uAZz10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZWptvRe+RuG9owJnSQGtpdlTxl8qS99FWy45A4aqczuv/jss
	od5zEdqNR0KbiabjC7GhyGJn/u6GnuAKT+710ipq1J8EJBIm2s5GV4dFAKGrNS+jOsNCf6D+Nam
	7UlPPYSfnxfIyGfw0wnZmgtfUd7sReFloO/69Y8MKRl3t6WRP0B+jv+MZWNE=
X-Google-Smtp-Source: AGHT+IE8WC20GMk3Zs9rOQ2P30KuitIuETori3LDdwWsfz8tOIL22S1Y8T3/+P4YHTH5q49URWA37Cc3S3oDhZ/cr8O/7M8+L4f/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e94:b0:864:4a82:15ec with SMTP id
 ca18e2360f4ac-86a231b703amr567830239f.6.1747401123505; Fri, 16 May 2025
 06:12:03 -0700 (PDT)
Date: Fri, 16 May 2025 06:12:03 -0700
In-Reply-To: <66fa9da7.050a0220.6bad9.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682739a3.a00a0220.398d88.020b.GAE@google.com>
Subject: Re: [syzbot] [kernel?] INFO: task hung in worker_thread (5)
From: syzbot <syzbot+c27cd2da6c2dc003b4a1@syzkaller.appspotmail.com>
To: bigeasy@linutronix.de, bp@alien8.de, bsegall@google.com, 
	dave.hansen@linux.intel.com, dietmar.eggemann@arm.com, edumazet@google.com, 
	hpa@zytor.com, juri.lelli@redhat.com, kerneljasonxing@gmail.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, pabeni@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	vincent.guittot@linaro.org, vschneid@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 66951e4860d3c688bfa550ea4a19635b57e00eca
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Jan 13 12:50:11 2025 +0000

    sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=100696f4580000
start commit:   aa486552a110 Merge tag 'memblock-v6.12-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6c71bad3e6ab6955
dashboard link: https://syzkaller.appspot.com/bug?extid=c27cd2da6c2dc003b4a1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12afcaa9980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10edb627980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
