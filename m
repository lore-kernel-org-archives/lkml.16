Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B1274FC6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460724; cv=none; b=pDGYwFF4jlq0ljaE3ZI/ZBGdC8pwIiZcs87QW5QzoYDVbEcc87wPIZJVhEuoy/KaAjWGBUjvX8G845T5u/Ujt/yZqO+ZZyhmX701Kr2UmHsP69S7ZHFI/3Q3gIOkaBRiLZpivzCuJ2snet6XOzzZmFarP9DqpWOvK6s5eJe3vb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460724; c=relaxed/simple;
	bh=KFEGy2N6ZCFHBp85eDNCSMPizX2bVclf+AY83kP9GiM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Hh9QggQA2mfZXQ7ie/Zvkx4RoCZmIS9oDcGGTfb6ygOLvBJ0vJ9orNAo71WeZ5Q9cMXgOOuSrIDA7/+f+7tJSKIbIC9pzDtCualvLVJs1PFobsU5ossAzEfVO9qvR3rPQKqkhfJ4XA/laJojHD0E+ep/cApL+oqDx7QiD9P7o5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so44948015ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460722; x=1752065522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjN3jdcd5ng02tkbv3fgpZ+BbdXR1zwjGtQ5cXH2KhY=;
        b=UHlsST64rfp9/S9iaHjeQWafRwlyfi05TcN1QWk03L5jHhAux5F7EDManTVhBCJAO6
         VQWuo5tX9qu09g/yEo9VPMw+d01vk+0dd98gqqmPop9U0eM6tLYhelfn3CTKzYqEtc6l
         VbigDI8CyiQllVxT6RJmgkMaVoOYpnH/Nce60whKG5PuGYPzYHDit20MsO/rzGqQv1zI
         H+1zQFJx6ap/UXWTYf4jJmfzZAPQxCmWjUSJ97e8SSD7zBDEgFqgOGNI/RGIB0m7H4kP
         +TlokIDClUN+a7vWWGz38MvT+X9nOisQsxmwKYIxmUA2seY9ZDZWNOqXgjlaZwDXy7/x
         nQxA==
X-Forwarded-Encrypted: i=1; AJvYcCUcRJSrBQllyaGs4+bsvPxpAo0HcBCzGSZL7to6EvKvl9WAlZerNlnrAPBh1bnZt5hM1DYl1rBeeli2Hks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeM+9CGkMhfnYYqfSQX7MSMZ/zN7SWWrzwVUJhJSUrdH3Zcyoq
	G3Gmty6ElOqPOrEzV5XReLj/drBlg5ZwN7O68Pkjnv05ZCNGpruBSp8SrvFSSFBPFNciM3CGNRo
	X33p8cpxBc3dVPLQlqe/QCiYnKQKKz3kwlpv6bkRZsPQZO+p1PxTf+Us4P2s=
X-Google-Smtp-Source: AGHT+IEvaaplVXttLA4felV/2t40wsl32ZlJIZMdEDFIALDDW2cmu9yMbs0bvyhK7uCVkOMcGY1g8GrA6yGseZSz0AfW8JnXNcfV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e2:b0:3df:2a58:381a with SMTP id
 e9e14a558f8ab-3e0549351a4mr31382155ab.3.1751460722242; Wed, 02 Jul 2025
 05:52:02 -0700 (PDT)
Date: Wed, 02 Jul 2025 05:52:02 -0700
In-Reply-To: <20250702112427.169000-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68652b72.a70a0220.3b7e22.23ca.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: sleeping function called from invalid context
 in procfs_procmap_ioctl
From: syzbot <syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/proc/task_mmu.c:630:10: error: expected expression
fs/proc/task_mmu.c:635:3: error: use of undeclared identifier 'ret'


Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
dashboard link: https://syzkaller.appspot.com/bug?extid=6246a83e7bd9f8a3e239
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d6d770580000

