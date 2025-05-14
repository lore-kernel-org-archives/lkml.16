Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08F26FDBD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252145; cv=none; b=TjK0Ky0D/2Zc3QDq3i2z1u8gXCE0viTz2nUkj+f+YXKZQI1jLZ2y0/LsApdH7TYUjuo5/kt6R0EU1AiMnr4nsQW9PzwGUYcFLj8NVqfHoWYsCSPMxEd1WSaDvahBttTxE0uer58fUO+ZNdSvzWZxX/W7G5p3JsW2arORMw+ZocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252145; c=relaxed/simple;
	bh=oIrs49oF22LdOayzkJxHulEMqFcJxB98u0gpNzS1tJw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T0Zj2cVzUByfluFe9AP0Ku5fODMUkL+LiKOS3cJPdXqEDrIPFN+qZGyIhreEb2otjxSoB3VId7FQ0zaOt4fYvcSdTzkcEuGKGgg27aL899OILmgfw7YBn+2e3qhkemARFVsyWMRJPvUoWJuvvN7lU/hTq90ODE5NAsfbMtXVBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85c552b10b9so24376739f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252142; x=1747856942;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im8wekS7D0YSdnMIfDocgAHGRdGBxTKIXIfbrUkKCCY=;
        b=bIqP05DG583E4k9Sf7LvkICZBTYjZL2RGl8x7SBjACVydMHwssQ4F9x1DnqT5olqm6
         9i+f8g+P4aGuYpXh+2IB4OzpTKmruNn1x+I76KHjgc9tEGGYhlMsl8GE9AuI2TAg1Gpv
         hYNUTAV+sThgGx95lbjzbRL7M3msHarPhs4X9htXld9TS6AhX7Zm41hytWh72kCIQk1O
         LQgxL2bONF+eViIMxFkcKWCo9iAGGFXCbl1ThruDI+iQM4+PI7vUi4mN+u0T7qoo5bRy
         UDhuydoJcpT7lMXf9MqQn5W/0ArbrUYCW9iUUInrm83cLuteeJ54g4ar0loCYFSeWi3A
         JTwg==
X-Forwarded-Encrypted: i=1; AJvYcCXTEDg0c+UvYzE2pcHo2m/eiH2c4XBBARmEOeoj2LpXfpLMSOimT4iH2UthKSnIkrjET9EVEUf5+wZ1HrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvYztGiI/6TpBn43LrUbRXkA2GuRTGX/gYO7/Xr0LlM7ZFY1c
	/AylxdKDKsltb78z1Xsm+baRWhfuwoeNph2VW3kU2Xx587weP+G8glepCI28bR/H8xMsJhDlYyl
	JO+ajCABMbVjb0ObCI7sMlT6g9GEW69Z2T6nwLlAAF7dMZDC07f7aIOA=
X-Google-Smtp-Source: AGHT+IHi1nA9q05RgsrvMcaw4+vkrl4VzwVZ7QmhuqaphmWHt3YXymWvrvMvRn2WUOpe2Ha7COf3DHODkvj9pxX72z9wyoUxAbTe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:368e:b0:85b:4afc:11d1 with SMTP id
 ca18e2360f4ac-86a08dccf99mr546554139f.5.1747252142169; Wed, 14 May 2025
 12:49:02 -0700 (PDT)
Date: Wed, 14 May 2025 12:49:02 -0700
In-Reply-To: <20250514184652.GP2023217@ZenIV>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824f3ae.a70a0220.3e9d8.001b.GAE@google.com>
Subject: Re: [syzbot] [xfs?] general protection fault in do_move_mount (3)
From: syzbot <syzbot+799d4cf78a7476483ba2@syzkaller.appspotmail.com>
To: brauner@kernel.org, cem@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+799d4cf78a7476483ba2@syzkaller.appspotmail.com
Tested-by: syzbot+799d4cf78a7476483ba2@syzkaller.appspotmail.com

Tested on:

commit:         cfaefc95 fix a braino in "do_move_mount(): don't leak ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11865cd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9683d529ec1b880
dashboard link: https://syzkaller.appspot.com/bug?extid=799d4cf78a7476483ba2
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
