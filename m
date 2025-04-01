Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974AA192B90
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480409; cv=none; b=bljdkrQ5JWhaq2U9tMMHVRCOB42q/0Fm0Ira9TsR/WPBb0bqblz5OcHARjy7rMMJydmoCu7kht3vnJY2qIDr+Bhq02zQ0GdazCUMBDOGomxX9/iPZlTIpr+RTfv9I5dZOZUAQ0DcwRSLaIimoDtIStwciIwHiksaKXiqpbWSbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480409; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EUogkbV855+C/dAId/f3Qhgp0pP+J5lssYOSjcgTP8jJZuOFsgdxHcVoIcXOM4Ruw+4FLZInJJwLS3vM/iu/XDSllJmWbnBSzbUDfQxV4nTMi40Zw6wb5pY5M/wx9mmSEVbVnQWCrzGf0nk0VTThJiFYDqNOIZCDqJMS82BZ2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b3f480d86so435354239f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480405; x=1744085205;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=rXM87UU1XgSA/yGbdN/cMWX4s5ixDoP7jvYqFcmNyBoKubN1fi6V51JbsOqRryEfEV
         B56ssebWxLhy1uzcNu88pH1e//DI1C+WCLWJ7kXuS1uYoevLi32uPnC1KaG7lqB/jNWp
         QTRvufSnUwUnsEqEi+z/+64zF4pS35tEpQxbhKvoaDmZnmX31tEzpoGTekrEH/6brzU8
         xOPs7/ZEyU8Ba+vfkHbN1/BjnyRzegs43CCJOJxm3Gx9ZZ2r78Fj53QBeSIZE9yAo8Dc
         rrA4Qq3BkpS7+/hQeHXD3V/HcE/9pzwYHGbEjbzBpi0pHODvkXgscHQczagKiW9HKXpE
         oYgQ==
X-Gm-Message-State: AOJu0YzAsKnZN4zDowIUSSIFCX9CHD4v3b+ccOLOrfj9twucnqqSyQGp
	q8lTC+NY5ShNmY23iBsDPfs37rcDGzJcbECl0S2wMGAG5RmavKzrmjerhP0Kha7wDLJw+26bpKC
	ld/qpQ2vS2OhB/O0AEAToR1mP2RDUZ+xXhjsn42kPrFcohgxD87IIMJA=
X-Google-Smtp-Source: AGHT+IFV62RIWCsQijWiD3ed73JCngf6S1UKIyfPd7AH93vkl5cbZthCPS2jytlRzm04rrE6gdpuDfnzHAoXvOGCIIevvk7N825r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152e:b0:3d2:6768:c4fa with SMTP id
 e9e14a558f8ab-3d5e09fdbf6mr113002615ab.21.1743480405734; Mon, 31 Mar 2025
 21:06:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:06:45 -0700
In-Reply-To: <675e8eec.050a0220.37aaf.00f4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6655.050a0220.297a31.0004.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+60ea31958b52b09e04af@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
