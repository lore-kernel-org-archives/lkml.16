Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EE1A23AD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743854048; cv=none; b=N235GnuBWc9afGvDYKACv8el8BKufrx3roElvBMdhF/uOAcvogodgnN8zObPk7/sW2aT5xKKdeElKWJaivn+vWWRky5dREXsYTUBuKbter+PeG6LeM+NbN16fDdd2ck3MUud/lQpTeA50gM9xkInuIaMY0XoXn4JONcGMh4DY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743854048; c=relaxed/simple;
	bh=IeYlXCt5JMnOFxuixSugd4eqg36qYeJp2KDtTmOJ0U0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JD/BKLe80ZXo+YpCQMLbgDyVYtSmlmodYza3X5ukxJoQY1eetqejtk9IBHF20gjvW7NKpuxvW4rZvB8PnbGei7JZ0rTjCxyCY+hR1sDWJzWNFpplNVhmcPPnBuRayrHqkTY4z7U8nx548pYfDTer6DECCJoxh8P6iMsZln+w6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d451ad5b2dso41049685ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743854046; x=1744458846;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6QGw704mEv4OcXYynpX2W+5Bss0PvmKHeyj2BymGNI=;
        b=NJ+Hgrn8mOSd98B7+r/ig/RHyqCnX/OoquoPDjqs1jk1oe2bY4lShWu4lcAUiByk5m
         WxxvOwKeJxcQIEJnzDIZFBtoUAh8auJBM2RI1/BQmCEB8pWAW4SDkU9d0A3u7AfDwLrD
         RYrWEpqc3Cu7ZHpVJovp3lga1B3gwQLzWRz3GJTAhJ3BtNRmM9Ll9CAaqWBb8dmawISI
         GINVEN6qHO5SlJTRHZBUmG3j7cfe8hJYMOQRasTobH1ZPbfQdBhyojShjxgDBVBLQDBY
         KqbYb6nCsIf1CW9TSVmOCMVUuXnqpqTbwlk5FhlF5SWnGhtRznqCRmgShekVHEqXFyNM
         D7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWBC5Epx4XR8uLAChs5GtH3gJoAKp8dQ7uojoYnpwVxcktZ4NWndyX7kzhli6i5yQNXq3dAmz/taA4kA8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZwYv1yOKmIl2aNSEkvwWU6qPcpWPGPfN1E6HJEH5i3hRUcjC
	IALCYVX6D4AW9eafEEFFPNeEkvb1x9W60jAOVow1Fnlb4hVp0zJWj2mf2wXda4rmwn5NTtY0Z0t
	AursdKbLUOhwVJoZ8M3K1HwosujCVVuoBED9SQROnr9/RidWWK7+tudM=
X-Google-Smtp-Source: AGHT+IFDZXcKVSMVarO/YcvZCZ5KOi5HdhP7Ju6biaIHlIXItcRHqMVRuGXXvDlZGzIbXkwHmpgMncknKVnKcjpbnavmKmhFAOC7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1905:b0:3d3:d1a8:8e82 with SMTP id
 e9e14a558f8ab-3d6e3ff99a0mr61383505ab.9.1743854045919; Sat, 05 Apr 2025
 04:54:05 -0700 (PDT)
Date: Sat, 05 Apr 2025 04:54:05 -0700
In-Reply-To: <tencent_7B7B46D79363637D4967A3BDE448F772D705@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f119dd.050a0220.0a13.0236.GAE@google.com>
Subject: Re: [syzbot] [media?] KMSAN: uninit-value in cxusb_i2c_xfer
From: syzbot <syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Tested-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com

Tested on:

commit:         a8662bcd Merge tag 'v6.15-p3' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d64be4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=47d69504cb18f07a
dashboard link: https://syzkaller.appspot.com/bug?extid=526bd95c0ec629993bf3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1300efb0580000

Note: testing is done by a robot and is best-effort only.
