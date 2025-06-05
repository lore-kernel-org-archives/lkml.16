Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F038FB9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129349; cv=none; b=PedVKoZQCdW4IMxwtmn/fEboD39ZprFlUzqgyTyE4uvJ1UoPvtXg31NgsOpyiHKY9cGNFaRBSkbjCGy770EG2e0b8/MfDWWVbK0Ab8/OezdQaplGC/gChfuZg4W9c3n+mG7u1uWyPtsxfZhMfrHjFk+97ohte/b3Z5ptT6z6Tg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129349; c=relaxed/simple;
	bh=6F4q5xmmE5BQVkd6RD+tYOcoViDlm8Q7EzNfL1Qdroc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hF8A5e3e38C70R6JsZtmmodXf3dVx8JQjLAIlVgbKtzwrKuQEql0I6/Bpi/rI2el3BJEwIwP1bpjRwI1dh/z/1bhCKLBc/1tt9M+Dxj1sBMg3K33UcOaR5aij4UwZqGqwG1axBlcEWF9m7fmsxYf/9kvHjoqAMx65HmQImd6J88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DzpQn7LK; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DzpQn7LK"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e0fee53eso659436a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749129347; x=1749734147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/+2Y/zIOL+LRaOKjuWDLx5oHEI75Blg1ekXEnDKeJQ=;
        b=DzpQn7LKnaQDTNeUkra1FysgjKR1iplO2Jk4duvjj/VsREK8MSaYft6n5l49sMEA5A
         cS67OLeX3G62bwCRKqPdyxSQYSisw9sTOlDCGio9qbMa6YYagdq27vQQ+DC+29CJlEwS
         WCoN73Xu/jFyczEEW9T6gQG0qVF49XRtNz47a2OY6dlneuHoo4oUhDt4hOcXVmoTp5Bg
         WmYVdwUQ1Y7LJ7LjBY1abAAMp8q0L6Q+hLVX5REcya/g/s7ixvAwJgPiRhQwceGWe59j
         Ams3kMkstMwM5+O1h9aJoZIzYxV6qJF1BSjIx0Obm20mS0ADU/JMEP00A0NEnl7+Q2T5
         qMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129347; x=1749734147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/+2Y/zIOL+LRaOKjuWDLx5oHEI75Blg1ekXEnDKeJQ=;
        b=eAubhNj7EYXhxdwAw6UIa2DD/EDlAZKRWWaKi1weAmUZhbaLGMbDauFTqo/w5ro4bN
         0F9GL3AVHJp/SSVAfGHZZMg0q839Y3PtTiR5U3nRSBqs8aY6H3AQKX/1itETo9TnDVSg
         3+Jn5jO4a+GUg8+QgC8dYNFaqx7Ti2a50gamrYOmhURVqTMy+Leo54YeqDpOoHQ+iHiN
         8+d1cl8/lNea/GnjA0OD9qTNP2K+4aVURHc+qY3eeV1s6b1s8Rg3AkO59P2IlDpwLy/U
         3Spq2eKsIF1mve9vp8WnqtB3409jdazfBi/9lWwmIXlLTRq4pfUl4kaOO5TelR2g1SRS
         6whw==
X-Forwarded-Encrypted: i=1; AJvYcCUVH1iqeJCIBEhWV6XR3U+iOOtkGIjJse4Eq5pQeGzXSsnNtQgKPC2duFNMYdjxmVclW3yhxB9SFN46sJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypwNamb/5v5FPMQJvEHMB/BppWGesMrU2XftI1mHqHi92tK8Y6
	nMxQfqP8xv3j1m2xk/mcQ3Ogj1ewAqXNm0hoeT02esxGlkgnxACM48tY5CmVk7reaMcmISExCpK
	HX5yujA==
X-Google-Smtp-Source: AGHT+IEZPNUxk+OKZ1dQ1Jj9IPJf63zrEzZezjPo30v5n4gJja21vzXgNIlYWy1Nh2/ea6zsjE1WMI99wmM=
X-Received: from pjbli9.prod.google.com ([2002:a17:90b:48c9:b0:309:f831:28e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d03:b0:312:ec:4128
 with SMTP id 98e67ed59e1d1-3130cd7bf73mr8709145a91.34.1749129346857; Thu, 05
 Jun 2025 06:15:46 -0700 (PDT)
Date: Thu, 5 Jun 2025 06:15:45 -0700
In-Reply-To: <684196cd.050a0220.2461cf.001e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <684196cd.050a0220.2461cf.001e.GAE@google.com>
Message-ID: <aEGYgQ0CyF8mxJtq@google.com>
Subject: Re: [syzbot] [kvm-x86?] WARNING in kvm_apic_accept_events
From: Sean Christopherson <seanjc@google.com>
To: syzbot <syzbot+b1784a9a955885da51cd@syzkaller.appspotmail.com>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	pbonzini@redhat.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 05, 2025, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    64980441d269 Merge tag 'bpf-fixes' of git://git.kernel.org..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=145b31d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=73696606574e3967
> dashboard link: https://syzkaller.appspot.com/bug?extid=b1784a9a955885da51cd
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110fcc0c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16340c0c580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b721c3fbaf59/disk-64980441.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b28b1e530885/vmlinux-64980441.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/5aee07cc8b41/bzImage-64980441.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b1784a9a955885da51cd@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5841 at arch/x86/kvm/lapic.c:3407 kvm_apic_accept_events+0x341/0x490 arch/x86/kvm/lapic.c:3407
> Modules linked in:
> CPU: 0 UID: 0 PID: 5841 Comm: syz-executor279 Not tainted 6.15.0-syzkaller-12058-g64980441d269 #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:kvm_apic_accept_events+0x341/0x490 arch/x86/kvm/lapic.c:3407

Pretty straightforward; syzkaller sets MP_STATE to INIT_RECEIVED, and then
stuffs vmxon.  KVM, courtesy of commit 28bf28887976 ("KVM: x86: fix user
triggerable warning in kvm_apic_accept_events()"), only guards against the
opposite ordering.

Rather than play a losing game of whack-a-mole with ioctl ordering (SVM's GIF=0
case is even harder to deal with), I'm going to modify KVM to wait until KVM_RUN
to enforce the check, similar to how KVM handles the scenario where emulation is
required (due to !URG) but KVM can't emulate.
