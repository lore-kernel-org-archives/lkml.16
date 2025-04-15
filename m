Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C92DFA34
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700411; cv=none; b=jbcqQhx8NhoGflFLsJWovl6ZO7n5ytrrMzRKizJ3iMPNQT8m8RcN7OtKRChnxZ2533jJBysviuQsm892/wwQKymZB6ypiNKXmEl8IWZ/Ov6DsCwmBhQAxGzCryVGIfccEHTUu31UzXp8gUN1qxhyX8n4lJxaDklG1XQfBVsjo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700411; c=relaxed/simple;
	bh=gq+phSkihUwXvObYCdgmWbj7fw9c2Fm+kZJFOElZVy8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nRubzMOmPlRAYitmLw05O6Wu/2UCkTTdY30wF/MFp/PNQQJ3Sw7yacNXxpUJ8gEy6q+5t32sjtiXdUJomqzSkhIf8GtV8Y8zY66anjHj2o0VaYktDC9UdeG5xTbUcEXDyoSGdlLS1trvIlM46aE6zl3OLhCRtA0FSqMZ9oYh0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so50577115ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700402; x=1745305202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z49npPDVJcoYR8QVvdvdqVpd4WlK4Gx1afo3n21Bw8k=;
        b=CkVul4uHumzjTs2aYikwq/dFV/QwhwCunAzkthDsYZxB2HKsj955WuvHBJ8uLw9wz4
         JNBKjuLD2qMm5Z4jKNaDoztIcfaeHSQcnBKn9Vy3dcBqPQKfmrwgMAjfUynbW4euryaw
         1mo3AxqtdE6mAWzZIKoHdDMgyO/0Ftf2phz+cNaXjLGgXFAZ0nFgHDcqMA8UaX4uUEg2
         hCGcFC0tPc7vA6BZbulBzr5W+Tw6YbroSDTbpbHWm8Itl5tUOjTkygkJXgeeJLj/9/JV
         TqRTyygxE5NnEdRZW3ckFO39HklbxmY8CR//4qIHbu64mhm/1yx5vIZ4NgTfIf28m5vc
         KnMw==
X-Gm-Message-State: AOJu0YymnQQpd/yf3OUa6ucu1nucuFeUVGYFzlLj8o0x51LrXYT83OJb
	Ido6obzvEwXRmij2Tsn9R7TuOsjBxCkkQmtSqtQA67dRrY5nOcPnuGz97hDrlLaDVT2zROiY7Qx
	ZXin8RIllkTQCoRROMnehr94vsK8oQ2LR2WsXz36iLm9o4oG0N/1zn4Y=
X-Google-Smtp-Source: AGHT+IEGshKwwwOsZNljXOkQecSSf1AbtGyIQlrMSUXKG1XKUbJyYXhCVtKeFFa6N8F8sUlFCWKRL7Hp87zBogUSgWF+MG3+tG4u
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f05:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3d7ec27ceebmr150520165ab.19.1744700402270; Tue, 15 Apr 2025
 00:00:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 00:00:02 -0700
In-Reply-To: <da6db2de-0f48-490b-8f91-a94e80d0567f@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe03f2.050a0220.3483fc.0048.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Tested-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com

Tested on:

commit:         01c6df60 Add linux-next specific files for 20250411
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=166f7c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10d6c470580000

Note: testing is done by a robot and is best-effort only.
