Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B251D95A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480223; cv=none; b=CLCFNIBi6PrLt+2w+J4kDrc3empfJDvRh6Wird78gU+Ow+hmbe7Id4SKzp3yE1/fWM5k8Sh4NElmrIJsg3NDmbdaviI1peF17xKWAvuZrHRUJ1lhsD+4mSss8Y6pIfSfSgQeGD0AENePwr+7qBXMqSMYBi/90AMC9ryTTywyC80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480223; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a9UQLf7v4ZB8znCTa93X8F9PUk/Z1+loa5YpiY3rloO+GezBy722lJD8gb0x8qD35gdeQjiFKCW460Dra8wl4zWSIJQhkyBb7OkidhC6iRSf8+By+dL9y/ARNro8RWMG3Ud8XH1oJEkje33PU+OeqPFt7zDmijdX4m8WxSDBssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5da4fd944so63952145ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480221; x=1744085021;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=BwFxr39gZZIpONwjc9Qa0K3A/L4LYDhBzVSJxVwm4JSzQvWv//x35+Ts9m4MzoL9L5
         n9BPLO6tLfj7sA3POBR8nzMkD7f74owlysK4pWCULVVn38c4kVCD+eYIRISz1WIctcfb
         B9p2hoAt3yIw6H87I+Fmpnn635ScrUNxGLHtjWOCwr/Vi1VTGXNP0gbuAq4VWzoqWuOU
         FCB1v1S3F7fe2v3ziHCh0S+IwNYYLTjVXarFDcyKGZTT8Jhmphkjhi9LIHnOiuU2Wrjp
         D0QqPN1JF2m9Q4wQugWg5dd0P2sKFHRTJmY2AyMs9r9qpURmnMPIxaUcDNbTxZRiXfSQ
         IPHg==
X-Gm-Message-State: AOJu0YyFKAPD47eD7102WftaxYJCvupYoX7guIimgUqOdE5i8n9Z9FV9
	s8l649kfgFuusnEEHe62fF5dvPIX0QF7hvvSfv4OebnyUMzApDeW6lAgXnGcGqcJJwNS9ETmKGB
	0ER4fDYg1NJwrxEchg8I8Qxoejj3tLSM4wJZRz4i/rjfPQZPnyFHNvt0=
X-Google-Smtp-Source: AGHT+IFerBlL+zM4s0svh2HOSM4xZMGb0pOqYfJ7W3+LrtxojJoeG8LoO7jOn9fec35uoi9+P4BrufSt/eFcdZsvb7mEP2lT7IxW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3386:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5e0a045cemr137156955ab.22.1743480221649; Mon, 31 Mar 2025
 21:03:41 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:03:41 -0700
In-Reply-To: <6750931a.050a0220.17bd51.0071.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb659d.050a0220.297a31.0002.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+aa2232cb0e5de0c0b56f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
