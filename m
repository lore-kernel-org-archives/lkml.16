Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8452BF3FE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160765; cv=none; b=ZOjbmxPy2hTQOBc/hR3G48uB1yzwoJRNaxYXOPnTsEA/IXP4aZ0NG3UghuRuic6B0bIcsnslLZcNNtVKFR6T0oE1p7hnp4667m01qrTyV4OX29x7/4RGo89WbFFOWzEgvtIB68bt8bl40Vzl/u6VwpWslNmV8UOAR/LGcByzTs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160765; c=relaxed/simple;
	bh=G3XmRpcexceyNY+DymCAREhIn6zFT9ry5L0YaVdXdOM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R4anla08Wjy8SfzXvDUBmcldwEQE3lV3L/d+A0FexJ23yj4piSwRFPT/rPUcp+mab9JMlg3YquhBVy7YN7hVZN0KD5fgW0ZBeppMqc/80krVpRRqMNR91sy2bUgjP4n4RFEpSbIIlR98WUl2phVod9cUx7/chxAouSb2cu4c/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86195b64df7so986613239f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747160763; x=1747765563;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ujdqTWEe2C4ifUkiwL/0vGQr0j+TmhTE3XcJiOEWbA=;
        b=cVpDMxOtlE2OWc2UvaB1RbOaqiTH9bZ5tcmiWVMFrlTRWSsFa5XUyPWtinbVkQXx+E
         iLCU/M4cuPxcSje78KwbADwjhu85up83ZzfZ1LtoYnunQHbPR3UIh6XJutYdVu0oEl7I
         eHrWeE6rVN1eYz4obmQtzxkRuwblMix4BsvwJfpSJqIAZk3wQkj2XnkJmTEe5yjLgFuS
         4U0V9Ieo3BlzfFEkL0vwE0AE44SQdRBJV3nJlRSH1hNnLJ6u9BPUPCjC/8o2vLDsPA9Z
         AkfcNhc2YdBwmSfDTMiqN3WNH6gZ4wMimtOsGLuc2fgQbPHFPJlB66W1zRP5SWSXQUjh
         M4bA==
X-Forwarded-Encrypted: i=1; AJvYcCWaJyaJs7/F91AwWSOwuko/Py1xzcpu0LPaK7YkcEAECjybDMQJQwV1vjIXVs7DXz9F974j9vGqBkyy96o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKOK+4OTNLNhN/AK5wGcppEDy1Jb2rR4Ts1SJMQiHMc204m2s
	PUH9G0GTUZNmerAagGr8dGfzAsQjyoR6JknXT9hQ/tj2Vy4tTsdev9wInlrGQ20plO92nGF9/FQ
	pI53k/R5U9KxCSSEAkz/3zpzUXvQ1MC6kIMdyOkipcVD+SSv1XUKmxTo=
X-Google-Smtp-Source: AGHT+IF2bsw+2xb9T21yJmz57Gptiyq/hujGm8XmQu4mBlqPEU3tegTD+MHhQxDVtvebqmrq6XlSGdr/a6THe87bDurx5UH2eDy5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3890:b0:85b:5494:5519 with SMTP id
 ca18e2360f4ac-86a08ddb77cmr45522339f.5.1747160763351; Tue, 13 May 2025
 11:26:03 -0700 (PDT)
Date: Tue, 13 May 2025 11:26:03 -0700
In-Reply-To: <tencent_28E8E99AEDE2CD6079AA6C042DC96F34940A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68238ebb.050a0220.f2294.0a00.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
From: syzbot <syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Tested-by: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com

Tested on:

commit:         e9565e23 Merge tag 'sched_ext-for-6.15-rc6-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1153f670580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca187b35f3c61c60
dashboard link: https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=147facd4580000

Note: testing is done by a robot and is best-effort only.
