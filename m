Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7748D155316
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748104247; cv=none; b=hLIpZ2+cGvdooAJyL94kwoJb/cZuo6xlA+VVc2zFQFgCC9SPGRoAvNIKU29FhSj9ZBVZ4BB8SvZxm0lity5C4SamHByErx6x4CdKOZSKhbevnSDm4tl920KrjZ1VouuTLOKcH+6HXWoGsaRBC8l94vf6TPR8gHViNQMH2C6Katk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748104247; c=relaxed/simple;
	bh=VlIuOj3yqA6xT9W8AMioaysDDLFidXIppXejjBGKu8I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X8ZBrkPGAt9MyQlDG8hI2Hh5E3l6QSNihJmu7hHRfBgAgSayu83QLuCkxaiZVl/ZyO1vBdjdyQ0B4aEEhOfscPe8gOm4drF7/EBS4qDDcbVThk9yHk5bCc9sx+1d2Lyw+FN92bCtTD7wEiQOwAeihUihQemF0pLiaczOAzzCF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86a3d964d9fso167517939f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 09:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748104244; x=1748709044;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EQMi9jbbkjjEIguqGROeTphB9f6GW9pujjtd3WC5z0=;
        b=XPUzkToxk477tY2E8gHYQ3dGl9Zb716HH4IisyBY4vYSJkKMLfAaCxhj4iG4nmbanx
         XPh8nRPehLwI0oI1qf2R57zf9565/c3v1aB45Z9vxxo3Ke7fvMd7ZI8MmwRqOtdlwR2f
         IU7WvEpttMJygV+t1Cl5DJIuSVxbKdrL/KvqRC3pzIr4PjrrGjq/eacfXCYGdVGFjyDJ
         4b7OuVPipQv/jfnLBOdwgAv36gNXe3HbeEGpDVHVIRnc8TR6wnthRnJR38SkjJ1fNn2x
         vT0kb7wbHVJxr5Qrq8ugrJq05ZIV3AAWqzK6C9rm3OFoYMwRLUOHT/zFbQJu04XSLOw3
         JcbQ==
X-Gm-Message-State: AOJu0Yx8Als8G2zPXtEf7n/mB4gnlMEUhBDXN6L65LbVWHbsElvtOCPf
	/P3G/Elb4ZKI7l56n4Cp+ypWYd+5UZvB4Gbx4xUFXHZnCnaANiq1iP9dWQ2ltSUcEEvc9KJ394k
	nI67GFCU8LLP7tBk7xk1UQ/7xRiqQhIvcZUUPHtp5lvCA7vBTezT5pRheaVY=
X-Google-Smtp-Source: AGHT+IFtkOFDKM5WKHeA/SIEbVazVKlekmO1CJpEoOvZ8hokZEpdWqz6Y5IzbWi/Irqx066MisqXdQS1hTd/AZWM1Vy7GVqi2PBC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7518:b0:867:16f4:5254 with SMTP id
 ca18e2360f4ac-86cbb6c2317mr420317039f.6.1748104244554; Sat, 24 May 2025
 09:30:44 -0700 (PDT)
Date: Sat, 24 May 2025 09:30:44 -0700
In-Reply-To: <6831265e.a70a0220.29d4a0.07f0.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6831f434.a70a0220.253bc2.0074.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] [bcachefs?] kernel BUG in blk_mq_end_request
From: syzbot <syzbot+a8f903ba15921696861d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] [bcachefs?] kernel BUG in blk_mq_end_request
Author: axboe@kernel.dk

#syz set subsystems: bcachefs

-- 
Jens Axboe
