Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D11AAC4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547247; cv=none; b=MdkeKyutDi69I2cTmeafGr8p9jDQxhGDTaFp9Wruwd+sdf0XqF4wonKAjgjVwBgYNYg4pNVeNmQsDVqJ7GH4GjzEM7ProI7EeJbzfieddQVD1B3fgJqQ75OwXh8mZ0UHqGiT1mxl5jlJCNfP3Xyf46/84HC1c8G3pkDxel7Jl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547247; c=relaxed/simple;
	bh=Kfj/IATnigPUDzQe8qyZ3NgHecnIHr+1rgqqS9M05Fg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oAN6yzNug31M0b8bq2h0a8qaMgRpkNUEMtOeybvcBc1JJgPQK9e6/Qvm3PR10IwNoIp67uXyrTq4atN1Xx74G+ow2wTYkZbDCLl54r6gYnPuWUCSKR9Qv3xYdj5BQoYZ6wk4pbRNPmSmDDlAxDPJH10GrmxLxrnXXaC/DNCxjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-849d26dd331so273880639f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745547245; x=1746152045;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q/FlSEF9dt3S8wRHaWFQ+yckrEClKN2p4vzS4rb9nE=;
        b=A4NA+0aQT28yt0m82ZoMm8/6wmYuRdu1JY6+mwoB11a8KZYoRmmAc7yIA556GNeMRr
         IK9AVUeAEKP7cjuZUo736qabNKl5aM9kZ1628lgLowdzRQ8xlvC7m7Lt8W8otQPnb/Q5
         6Xe+EkDttY0X/8RaWLyU4SB0/jnH7cdJzyGbtzgV/MJB+6DGB1FhAeOoonv4Sk5J9JbA
         MtXvsp17porvtAIFpLok8q4Dm/1zVXspeECJ0xgrZSBhOUQdNNmoG2gUXWRlyGrMs9wb
         9gMUSzsMZm8VZPxAGj6LhymFN7yV5uuAbAFeHV4GYuh0FbfPMZk5iUfmgOqW97LhEseQ
         IwVg==
X-Gm-Message-State: AOJu0YwYaBtlxpzJ+JQnXo8CZIH8hfI2TIYu9m4FdGlwdOBKyyh5K3Ig
	xQzv1jogICaLIjM05mO5iCNdcRqOKPGlXiOIe10u17+EMjMECiw4Qouty09sIdLRfS6C/dgiJzN
	/M7YktQC275noGzwfpRa2O3h7P1nH8p9xj1B6MxNuTWFPYb1ipVTDNqA=
X-Google-Smtp-Source: AGHT+IFvHuLogqptYZkvpUQ2L9YGIMSPoTcydy/Dzssdq6qFvImRBds7sN8+T8eozYtaYuCFOheO5SRdRl/yjBgm5fD44hc6eaEf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3d4:b0:85b:3874:6044 with SMTP id
 ca18e2360f4ac-8645dbcde70mr38164739f.7.1745547245214; Thu, 24 Apr 2025
 19:14:05 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:14:05 -0700
In-Reply-To: <20250425015516.3126195-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680aefed.050a0220.10d98e.000e.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer
 dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com
Tested-by: syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com

Tested on:

commit:         02ddfb98 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a92574580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=6af973a3b8dfd2faefdc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1411a1b3980000

Note: testing is done by a robot and is best-effort only.
