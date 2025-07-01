Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B835201004
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365145; cv=none; b=pFh4QnL2xNofSiBP8xqFEkfJ1TuEHKFqDSZsPfRKlUqHyi4itWmEWvgZShZggDDvsvyqM7rluo/LgiA4fmvOVHqxNfWvNjvqa2n/ldfafVSCyh2UIGa/+m7zQpl5KYIkKAxl1GaLOp3H13eivgQStAKGpHsFhFXt00pBfxB1Ipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365145; c=relaxed/simple;
	bh=+tc413pWG4zccgyt/pWIypdP+pHDD1DD5A+0A/K6d1Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IG6OQyTeo/5HcvBG/jcJ8BGIu0XHq5pLJ9Sl5ekQZ0dZoZwO8l+9mDT3vAqwRb9PXoKcqE3b4cjMaDaSczlsMYILZbz93sYmExbnrTyRJCYZY/8i++iD+LaumY9jKd9QfydOVYq1FCJg7dcAjtGLldsMXnX4jpPf5FUCHO2I9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8760733a107so523937539f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365143; x=1751969943;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tc413pWG4zccgyt/pWIypdP+pHDD1DD5A+0A/K6d1Y=;
        b=nyao5oa3afF0TJFKxGQB7QwgP+d4jfu05QPM66C5q3fJYggmqEvm5jgOwdcuKZeviy
         fLMgOf0m9cCvEyUs6+NmiNG8G1WEWDqB3RrccvMGODqJq0+Ete2egFGwADu3NSgnYbfz
         FpjbZhekpveO7v4IfHVnulsGop5LAXfzTMWwWpFURJHjaNxt/LMg62z9TI6zujGI9AUN
         Kh9wMLa4X0k5pMoy7bddzMKFhgtqkHmQMz8ex6J2WfUhurk6r3nGfC3+/W5M9hBZ9VIo
         wq9d4EZCmGU0vhePHxEPao0ZPeqZ/UaTIU/9uR8g/FTXzEUZ1GRCWyjnjIiXWFe/uwET
         6KsQ==
X-Gm-Message-State: AOJu0YxqAjqNJSmxvxGWn9U7ORFCcgCHmynLJHoqQ+3AURX300bqOeQK
	egomSuKbDejwSWRqb1neFHIxAvlEubitTxfowbeNrUUwcMJQ5v38OJeFVq0sVb2NJM7l/zutLT4
	jfUQGwJ1ip9UJpan4Bs8Y8jRLSaRHt7NEhvqGwzZv1bvo8AaIKbGo5qi8Cfg=
X-Google-Smtp-Source: AGHT+IE9knGQ+CQQP4mvycdEBq4BUs5hKF/7bRL0JwR7+tKHRW25/npt0iPCmeQ1+00ISy+2EtJ8q4R+Yb5FVz1J0fddK4inu4CD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:f411:0:b0:86c:f2ea:d8d3 with SMTP id
 ca18e2360f4ac-87688349035mr1297837239f.10.1751365143319; Tue, 01 Jul 2025
 03:19:03 -0700 (PDT)
Date: Tue, 01 Jul 2025 03:19:03 -0700
In-Reply-To: <6862c942.a70a0220.2f4de1.002c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6863b617.a70a0220.3b7e22.193a.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 66701750d5565c574af42bef0b789ce0203e3071
From: syzbot <syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 66701750d5565c574af42bef0b789ce0203e3071
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 66701750d5565c574af42bef0b789ce0203e3071
