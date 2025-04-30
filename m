Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D925A630
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009246; cv=none; b=a/AeQQXi6iRi+LV40fpL2yZH2LPE5D0McomQkm2X6Uq2kk0/ORQT0fJ4fqoqgaByuEFMaedMemkt+09kaAd4FaY1exagb1S1OtFcEOtUPY1R/rmqsdm8flFVKIrXknrwPDG4eiNyErmKTOXz2/a4EXCr8/N7bTBL/vWDhcrtmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009246; c=relaxed/simple;
	bh=96xHK1lB1dChcI9TeyNFQlAJMnDbVLO0QDLJmP8BJHw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PJrBnjC7QfoR4guEwHiovOc//DmITY4qsvrhyAb/ZKQyd5SY8tcKvs4+bD4vQCoNut/hvjqeBSfx8hyjlpqm50CfQhwLQPCfLYR2wD26i3v798QHCuNxAJbqmaR3ic7rKsxsnUPJAM2ixPVkuPFtaiXvEsG9eYyu+WIpakSL5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b5878a66cso1369240839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009242; x=1746614042;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ8b6IcJuMgkLdXNibvnbIuDsQ9uQln1PxrLnIuTT60=;
        b=OSzRFRMd5i9s8AfRTETHraGmis3ScTLsI6AcfKOzysqNXbfUtes+1r8DVftEB1vxX0
         9AjqQcY3TYss+xYhCcudmZoX6Go/aqNxvD+beGDd5QGcXnqZOnEw8Pyyx3VawO6Lpv21
         OsnA4vVCteoKdNDYwHRt3F6yvzqLdZlylshewL1Fb1mELMvsPZy5uAOy+Tr8kIHmeWYs
         FV7CnPT6/yFHSW9GY7i57KAhhYUWlPyyNr4CPM/gGWIN6XQoGzJFhzd7FddpahU7WVBQ
         chNk6dOQK3r42Q6U6tMMdQQBXGDYFYK3jtWm0QX2/d7xLI0Zwh7z2yM+8ZMtJzq62ZtK
         SAJw==
X-Forwarded-Encrypted: i=1; AJvYcCV7iBvRdl4XWiqStSHX0Ji9wOLxTHTQXlJdbGu+ZF6WQrF57VJUpmF49b2rO4qpUzgbCO4F1kcxKufnByU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/wFyuxQ9DXuigK7gfQk5S7fmQNLxUl5cH5KKdTjBsQEhWsq7
	Cm7SpiK48ZR8qshzghrgpdIJcXTnFsDJXmzwr9A9DDR9U/5eGPtOWh7aH65Wm/EgiDU1plp/CgM
	/SRYAcq0Vp4o23c48uQv0inf2wtOCYg917UkZ0DiZw2uvLfRtxNJiyiU=
X-Google-Smtp-Source: AGHT+IHektp9LVe0gaG7boGVI+8pdYsnoFoI0LpIIo/0FQzq5g7EJnveWMuOLJkLr1oIyqSd46usYbNpa4a+k3vv9lw6YDYPpbzH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4a0d:b0:85c:c7f9:9a1c with SMTP id
 ca18e2360f4ac-86495f17c23mr302208239f.13.1746009242418; Wed, 30 Apr 2025
 03:34:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 03:34:02 -0700
In-Reply-To: <tencent_001BC04BE01B3C2563BAA0BB1633DF9E7908@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811fc9a.050a0220.39e3a1.0d0f.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Tested-by: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com

Tested on:

commit:         b6ea1680 Merge tag 'v6.15-p6' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ba68d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714654674710be70
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126a68d4580000

Note: testing is done by a robot and is best-effort only.
