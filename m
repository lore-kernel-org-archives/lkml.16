Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80D537E5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633024; cv=none; b=FNAHC3uEMpsqeqNFwigIDOSHbIRMC78tQlTa0ZqRV0oRwpOYT2NX6q60OGKDXvHsoJxbkj7X7wF7aJSCHwdUZnHDw2nwkzRRittfj8+VlRa4RsNqRLzq5PHYt0wcVIpierAlNuqejnrWGS2krM+Ov2btBbrTi16TNJw3eBOegrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633024; c=relaxed/simple;
	bh=IhGxqZONKoKFeV8HRltf5K9dNfvC9ihGNQQ29H1FBI0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lCiV+QJfewy+WlAjYZE7wcHri0m3G3GGQYFf0Z2osGgKaAKBPOjGJrtsxMn2I0MWjLI8i+FzZkTTD2MPqmxPQX7Hep2cw8mZ51+2Cm9lYuWksBVTYyOLClYfqguK1Ruo6hIL6Db8yCbZxCKNytsbQBQOKhnjou3u2aUoL3nCfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3cfb2d37dbdso36001085ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 17:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738633021; x=1739237821;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ct9LFzZoWBCSTWklB5EsgWQ3PeezlKDIpCmyS3iVoWA=;
        b=nY9BU7Q9qnK43xb2Aqo1NfaPczLDwFTuRS0o1VsaCwZ+qG+QLKXTyB5/YeQCbsweAT
         w2aMcpiYW8EsFQlP76B33PguaDj4Td6XEsy66oIDaKKfcwfiYoQab6FJxZHb/gOQBHZG
         z9IR+F2X5Nu+dkPiGXnBJj1NSoasEiNCS8hBGjBuQH5LmdOvw7KrEGg4qP/BtGfBtFzj
         rdZhk8e2w5+Hf6KRZsKX/A1Iaqxk3xM5LWekm7y/CbfixRDdaFah2pUqwVD7fmGTdCLt
         79dp4Q+reZn1k07CfhA/1GmaXZMokqB262O8Rm0oZ0dOlvbEykcwX7RaMiPGlQTF7jYh
         yXZw==
X-Forwarded-Encrypted: i=1; AJvYcCXHaUxl29pIMKWaUvkdb8aImPmLH6bi4cZB/7ibm+PydlRVjFBDlJLciW2rqCO/oQ6rl+Ef2CDiMYwS8Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIYbs+AWr1B4u6KyNl+pFvcdh22JEKZcSa3JPIxICnhvdWMvHP
	C/ewcA07LJVlj3KKcS01ZXmZpG6ux9tn73gaaI9ixgfm+EGzZLdrCSqNE4/pQU+uV0qFFo7QGP9
	pxQtUlwDHOiWglG01QBetbm2j0BHpNe4G4gpc0t0rpTUHsvpPdIYOlUk=
X-Google-Smtp-Source: AGHT+IGTUOyszyZKb8JmDjNqnG+BCLsP5ITMYyPA5ATLhNsdrHR2fP7F07HVq2x9Te5iiFd3HvT24XA+gJLNbfzuxOn64p/LzRTk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2d:b0:3d0:2a04:1ce2 with SMTP id
 e9e14a558f8ab-3d02a041d7cmr69631675ab.16.1738633021443; Mon, 03 Feb 2025
 17:37:01 -0800 (PST)
Date: Mon, 03 Feb 2025 17:37:01 -0800
In-Reply-To: <20250204004435.2084-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a16f3d.050a0220.163cdc.005d.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in corsair_void_status_work_handler
From: syzbot <syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com
Tested-by: syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com

Tested on:

commit:         9682c35f usb: typec: thunderbolt: Remove IS_ERR check ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13ba9d18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed7570f7f6046a71
dashboard link: https://syzkaller.appspot.com/bug?extid=ac826dbeecf212c395a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ebb764580000

Note: testing is done by a robot and is best-effort only.
