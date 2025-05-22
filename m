Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3B28C877
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925405; cv=none; b=bfz7wkJPa+hnmK1Hiogzc2luradFYDTtiz/4pWumbWXVJgfB93MEzCb+cYdbExtobhWS4gVv2rG8hfVH3533l6fZkRIOzZgE3wY1KrcJ79+cADLj8cQ1GgEBlDRVl9boWweeiWn2gsuAVLp5HXfBP8bLxKR5P8e1ofjmtkhXQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925405; c=relaxed/simple;
	bh=vFTPfpdHnk3QKU9YLPXt6wuFleG9fFe7xqpUBDcFWYI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oVdS01L7SfLddxm3IcP/LI7q6+JHjmLfIsfVtxEl9YF+SIe8a8m2D7dx6QhRiZB5ztJ2Lk1G+u+j9hexXpkjp4/5mR6D7CgyXg2IodeUmuHyO/pzYYMEzoJrcdJLkXZFH454vD0kM0GyVk13vj29HLrN3bRVD5l1Bsz+GM5IUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dc88ab5cd6so31370755ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925403; x=1748530203;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XKyhVdbSfq1GVQnRsMUSXccIj0eKoxymcjUTDDnExA=;
        b=U9cEx7tw02ES/08v2zp71K0iOEbULnHPziNOOpH62z6qGWtG1djn3uJ37SPK0GBJ3m
         aqoETfIBobBCOe8b4Vthsp5li0zYTmKQb3GIMgQc52oZtYs83/bUtaXsysz+CB2PHvaR
         HfrZu+4OYOAnYCDpGjQZw8JP7NB4W3wivgfJt525IFCLSshBdMkpHPiWxBxyfx1latQf
         S9xFgE/Q9kzasmqIPBmA9giryLbi6YbRQA4PYMOYtpdi3jrNLnbJgrGqIQYgeKsnpWYE
         fHU2+J/tka4WjuzSCdPPtYR/MRzNvB7WwYsxVEdk00AjdP/+TnjlC/5S7eL03UI/Saa2
         MDqw==
X-Forwarded-Encrypted: i=1; AJvYcCV39OwbaV7Dih62PK5MwP7RBGrzXoUs2lB0SOjL3FovDCzf5JsGtslcgD0XjaSjEQfDBLXLAE7vOG+8Ti4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV7trhD59HOV3Elz9tFFwiR+GyCGFypMeMD8FZg0P8Hz6DfWW1
	8TZ+x8fx8CDAjG4g1vswYe0OodA4M2px/ZzJbUYyX7Xk3Ee85Lw/msP5NVc/dVv4wVNq5K3CYUk
	Tls6gPo8HjESOYnCD5UuhzJsea3h689yGh8hO68PbZI2SbIZXBDBHurOu8X4=
X-Google-Smtp-Source: AGHT+IENNhb92IFd/L0jtflhq3EzLulYZl29FwGP0sf86rRTQCYYxHOozVvNa8GCpbewmeptdlrYXjnVOB6V95sZ+w71FiOQZmif
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9c:b0:3dc:80e6:381a with SMTP id
 e9e14a558f8ab-3dc80e6390fmr86411815ab.16.1747925402751; Thu, 22 May 2025
 07:50:02 -0700 (PDT)
Date: Thu, 22 May 2025 07:50:02 -0700
In-Reply-To: <CAMj1kXEn_fx6=X4ixhmWST1scUH4kY0SXBt1sXT=-5_ctcKGoA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f399a.a70a0220.253bc2.0058.GAE@google.com>
Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request
 in alloc_fs_context
From: syzbot <syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com>
To: ardb@kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3
unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         1afe9e7d f2fs: fix freezing filesystem during resize
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.16.super
console output: https://syzkaller.appspot.com/x/log.txt?x=102105f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bcb473848aa62842
dashboard link: https://syzkaller.appspot.com/bug?extid=52cd651546d11d2af06b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Note: no patches were applied.
