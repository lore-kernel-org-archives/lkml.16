Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC41A28D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738373047; cv=none; b=uGyN5WTH9ESKZUzl1oUOQC9TKFPi/r2FT4DGrLP2kfPktipNpSzyhkmDHdMT88ZQhASSG+GOkGIiJfGSkRFeoGYQ/sDdTc/lrw6ANV7T7euPKgK3PGdZYb8nUvdBqAPqnOcuwYA9BrN4LxqZtq9szESueHqpOEKnoHd9+EPDwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738373047; c=relaxed/simple;
	bh=CT30G+O4eA+qlgCNpnr4W8iGIpXRTTtMg5RV7NMz5Vg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ab+aLXISngv+HNwT+FmREO04YTipFzFUICVUJWvIwT/zdUhZzptSCq263RSFrKFSK/kO+KwuReMfKohP3hH+B/UTSr2rmuvPP6CJ1Pa28nJHpjpp62oiG1v4vicotaMwbiG+uxFVsW2AJTIlgzscS13iV8hJ7aS9NvLNH9N0XBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cfe0ce0dbbso35564235ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738373045; x=1738977845;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sq8XyyHjnLwlh8OGZnDrNml2p73WXh5KSNlPig4woHI=;
        b=WrxDUlfKv9f98LitiQcwI3Ska2/G/ewjYkKNiUH8PArMbjx7gbUPrTZEA0nqaWpQ1I
         OGNO/HQUscrTq29jxDB2XwZMS3zjStFz/8iwASn/+KACs3gRjltK0juhVbaJmK1r2Pgf
         gQD43S4M+tJQEatT/KRxcKpx65dKzWc9H+JuwWtflywfJyd9nOQnUeYNrGOuO4rYb5j7
         DYRKpNMDbAr3nWBZYILUW0lS1KBBCeUObdsgwco5ZgWw8PO+bgXinYkzrQJgf9ZDPqOX
         kaJpvsanKJM2b8WkkSQd/DZnQx8mPjWFlUDtjfcFbEZ+YR3J+AJEK9lv+K/hxK/mWyW+
         rEGg==
X-Forwarded-Encrypted: i=1; AJvYcCUBMaAprPVXikj2O+83vUSoed5O40VAy9HOVpsz3fcwiFIs3oiFSoevT49CopWE5nfaIpYq0TShUBZyCwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jCHl8veyy55IYidgfyu9huazjppARUQppnIgcR+ykeWGW5Mt
	r05ohOPYI7KQQ/MIzbm7PGV/dfdzJD6ALjcfsByxC3crsGMtsCdGnSntEAJ/KUsJz3159f3BQpG
	6NUK1pOScNaNFMIxs4Q5snPLKRBslXQWOAEdPEm3zhXgt5eoMZtIOFuM=
X-Google-Smtp-Source: AGHT+IGLYDfwN50N9CTaO9eqWLSpCTQdbdIKyR+6hSuG0Xnm9MId7G0jSjP45/8jL/DKOSUiQQAmbC8lIh+ski7x/jY5SCLeQUFN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca8:b0:3d0:21aa:a756 with SMTP id
 e9e14a558f8ab-3d021aaa830mr5996745ab.5.1738373044930; Fri, 31 Jan 2025
 17:24:04 -0800 (PST)
Date: Fri, 31 Jan 2025 17:24:04 -0800
In-Reply-To: <tencent_BAF76E66D5136BE36D896D43A7C44D576005@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679d77b4.050a0220.163cdc.0013.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
From: syzbot <syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com

Tested on:

commit:         1f356885 tracing: dbg seq stop
git tree:       https://github.com/ea1davis/linux ftr/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=151ddddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7acebde734703260
dashboard link: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
