Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834762741A1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650216; cv=none; b=Bwq0G1FQQiv6wkuRsRHkZvm5Q6+gyakae9LYCkRS7NL6ZIFNOSNZcvgSB4c82RP/ENMjd6P6CKd1WCNJKFYeZIqodsDQOA+HoVGYttd4hpcfTwfrF4AIKlfQPWSCluPtTXgZx2bthO4Ny6RdDBuzDzO3TuTnymzWyKS88gUpx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650216; c=relaxed/simple;
	bh=qVYT7soGacmdnnA6v9cyT/+kbXKli+6EeB29u7HK+pw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NNMsrt5hGwQncfidKCm2b41GhUdlmlSEJleeSl39lEUYJPPd91ZykX064TdiaFE4IQlU7WIAtTqmaM5KVlAcJpqgWC/55mQdkNCwe+KtGdzNGi2HM74+pijLqx6Q0hDUl44kmoGAp+PH29scRNkkHqQU+WRN+VY3d8JcmKAC7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5e46a526so397059039f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650213; x=1748255013;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jII1busYs4xnfa0qv3L8ZQ55pH0fVJVHYY14hn+MxwU=;
        b=uxMU1DXQaFL36ZdVIxuViMV/ARuL3RW7cTS8ujBreKLP/XJavxNT9DbAZE6LpdySKX
         ZGcOldlQe0aKeZz368Z9xWIuTA5Dywds205K1bKnG5+qWy/61rbs2VD7gdzUC+7U0wMP
         KQGv5FVZhhHsB3aYtJNyziQ3kmcxLsEYgnzkPZDLkJpD/9OQW4LF/Oj922eQdTCAe3wa
         Whn7V+tZDL9ku3j3SJIFXftRY9TPxhKCJR59NMC2uArWQImAn2sQqA1IDKAxv+E3h8Ih
         Ot/7UE15BPe1CdGslG3gVaSJUxP78mEN6N+I+yO/nV+sp0zm2GqHcW+kfoEGE2z0IUre
         Amcw==
X-Gm-Message-State: AOJu0YyxwDN2vsIz2RBOmTs0fW6mC5fLmXT53FIbIUjw6Co6ae7oYOJv
	OwkXql0sHlggActGDntYuNWVyVCM8twZHo+RTNFEBWiSYz+l47M7jJpwBImVHY4bontpi3QSN8d
	cTBnzwdSqtUp9iZKEuYZzjnZ3el10xtNHAi0NRa1zqlnrqtxZEi0GyvWExko=
X-Google-Smtp-Source: AGHT+IHqR4AfI5timqitN3mlFHSN2ov7sUk7uSod5GMRxFEvnH8gBcgVkwq2BchnttNMRH+s+/D3fsPZnbExr8zVWzyS9wk22y+v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:388b:b0:85b:b82f:965b with SMTP id
 ca18e2360f4ac-86a24cd615cmr1287509039f.12.1747650213625; Mon, 19 May 2025
 03:23:33 -0700 (PDT)
Date: Mon, 19 May 2025 03:23:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b06a5.a70a0220.3849cf.00b4.GAE@google.com>
Subject: [syzbot] Monthly trace report (May 2025)
From: syzbot <syzbot+list1df466906ec8f148731d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mhiramat@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello trace maintainers/developers,

This is a 31-day syzbot report for the trace subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/trace

During the period, 1 new issues were detected and 2 were fixed.
In total, 13 issues are still open and 45 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1768    Yes   WARNING in format_decode (3)
                  https://syzkaller.appspot.com/bug?extid=e2c932aec5c8a6e1d31c
<2> 179     Yes   WARNING in bpf_get_stack_raw_tp
                  https://syzkaller.appspot.com/bug?extid=ce35de20ed6652f60652
<3> 52      Yes   WARNING in blk_register_tracepoints
                  https://syzkaller.appspot.com/bug?extid=c54ded83396afee31eb1
<4> 42      Yes   INFO: task hung in blk_trace_ioctl (4)
                  https://syzkaller.appspot.com/bug?extid=ed812ed461471ab17a0c
<5> 27      Yes   WARNING in tracepoint_probe_unregister (3)
                  https://syzkaller.appspot.com/bug?extid=a1d25e53cd4a10f7f2d3
<6> 24      Yes   WARNING in tracing_buffers_mmap_close
                  https://syzkaller.appspot.com/bug?extid=ddc001b92c083dbf2b97
<7> 18      Yes   INFO: task hung in blk_trace_remove (2)
                  https://syzkaller.appspot.com/bug?extid=2373f6be3e6de4f92562

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
