Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769621A443
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366499; cv=none; b=D41MEmr5mLM52qWcxz2PwxGzOKeg3no4PcDHXouZGw31IkLS56ND8yRNAmpDsgUkmfxK0hycRgAFRUugMzTTI23OLVrRElRaKnTYWvgUs8avaHpn/D0ImcbPKNIZrhrGx81xQLjt+CDJnSH9wjpJbfq6+U0uWCkDn0zM2O9RROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366499; c=relaxed/simple;
	bh=w9Tn7yjzWR2uPqn10gqrrwL7BPOpISHaZKXF7dsIRac=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DDgrZUTFqlkhwkqHGR7uvtP36uwvUNbLeh9/YePzEvSVCMQ6lCYbnyKt4/ZR+5VUwPlKfguDznMwFstOjp4txOc9v9eHqGS6LwaZSc5FacBFvH0XBaZHTV7gGQWhjuec0sZzSwqNnb4ghkM86EGk/Sr+xERUf/MwA9KWBFNe8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-875bd5522e9so94557239f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366497; x=1750971297;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAE70NEi0T0FADs843dUAT/MnCqmvusO6x4sAWrq/mA=;
        b=gLLXPQuJBqZP4SyycVauHdCDdwokNrQayoEO9yCHo4aalKJZMlWBmJK9bj52Zx+VsP
         94pKeBImgtknXWe90VoaLLl/uMK0iOs1K6fwD4b+KRjik9UWCoQDm6C2VZNV5yxWCfM1
         Zwm2SlTWXef+LaUEv/Ce8QmAepESo1m083RUqaCE0IGI8aU3w75RG8t023XJK00pM4CH
         5GLzmi7mZP5OxwATxClSf9ng+4uvFHqT73OcKYgIemIunyHYUaUVzet8RD8T9fNd2uBA
         jj9RiDvDIpCnLPJIIczBt/jaSroLLscrC+bpuCo09Vtbc7KysaPb5qLzsJxu3vho5wio
         OIWg==
X-Gm-Message-State: AOJu0Ywt6Tszq/bUL2xeUtBuWSXqAb9fhhCigJTUUaSszH3CL9HARaUX
	8v1MhL7U7MaR99VMOelZtHTOAp7RXJqojHoXbfCWaru/We2tPKT+bDp9G5WG+fjtt0A4InHflsX
	uT6b7AHlKQE6uRR3ahDoBQV0YzN54jRD3/GAxZZGusuQ5KTyBNJ9HLv7Pg70=
X-Google-Smtp-Source: AGHT+IF+ag7CBhhdjCG6AXrdrU0ExNZtludyPw/mlQxzaf7HLcsFOlNJPIm8ffsNVmiU8cwmYzHGjQvZQ9W60I3A9C1yU5qtNGCm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fce:b0:3dc:76ad:7990 with SMTP id
 e9e14a558f8ab-3de38cb978bmr3374215ab.15.1750366497080; Thu, 19 Jun 2025
 13:54:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:54:57 -0700
In-Reply-To: <683b1ba9.a00a0220.d8eae.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68547921.a00a0220.137b3.001a.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+88e6a26b68fb670364e1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Don't put rhashtable on stack
