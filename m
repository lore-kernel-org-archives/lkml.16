Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E92DFA58
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642111; cv=none; b=ViKV9bcmXpMtWZ61bkTuaEvgrVP27Q32fpqiH0X7IehPPkupFxBnePdwHu2AHfaok010Ey/LZYaUiWtPzGZRsygCHoedH899Nhw5OCAIgnvgB9Ef76b0NH+tXMGBx94W9soSSFPI6wOhLLXW7eXy0zjCmVez5rJ54T+AOcXdsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642111; c=relaxed/simple;
	bh=iIrg+ip4B1yg6mIeKta47mgYMy8F2On4sWQMBQFzjE4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ddZbgrGmNvl4LrDkERgSQDPeg8hAoYRwh5aUVDAR6FEMutXnxZnATAU3FxGyyFZHATlXEuBCxXuGpl0rTLiGuyMOyhvd/AsIDDaRYls31VuRWmylaFjXywimTQhx5Umcxfq5XfG29bvlsQCpQ+uPx7noCxWJEGS63bBZCa0AXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5a9e7dd5aso43347345ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642109; x=1745246909;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2KWPdcz8vYsUxpKKGHrCAdNhDRHWrQ8Wa+dAJvC6+o=;
        b=c549pGmV62IMZNhVHMXZqiUOChivgcsHMWLW7vzH8+acJDAWwZCuJuchLFZLmxa4dd
         jDhgbVWoCv6UiyQ35xs7WSCIHQe7N6VCAVKTU0Z2zsjT9j7ktec8ZlENZutTqVjvGx2l
         5CT4H2+ipUbTgjR+KoblnyKV2A41Bv9jYGouNBH51iyl5pcTgQhUS/j9A+lRZkjcbODU
         ZE0fOk4K4z/tXQXpVkwYj/znkyslSepfNsOxL+DRz+6loQYxD7b32GvdIJlQfJLSPQVu
         BXuVBB4s0yr+P/zZ1tTzo1u+Q00bBeQb1detwZorN8X2cX5Ho3m0eE4RmucBXgesnZxY
         Iquw==
X-Gm-Message-State: AOJu0YyNoUhWJe9y2+hWK3oS8mDoWRBWGgeDQB85FWvmA/q1XKhMCt1w
	ymtZJypaHnwB6OQtqqiMoB76Fo+4wHxcmRmH+87U1iqtqbaz+Lde7Z893QrkgU8q0pF60v+WVgG
	MPtYkWaVjZRmZ7l+/UbnHDV6oqrhDMWL4tCAu1i6lfYNfyI33NurKBj8=
X-Google-Smtp-Source: AGHT+IHdO2PiQ33A/hUW2HuDm2mtxOVWfQSIukXye+2wb5mLYuwD8oqEHEtcn7mftmINndDyqQpE8gKoE4G6if3NPLNQElDnlzkI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1582:b0:3d3:fa0a:7242 with SMTP id
 e9e14a558f8ab-3d7ec202999mr120975455ab.9.1744642109078; Mon, 14 Apr 2025
 07:48:29 -0700 (PDT)
Date: Mon, 14 Apr 2025 07:48:29 -0700
In-Reply-To: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fd203d.050a0220.3483fc.002b.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: nogikh@google.com

The bug was fixed with a different commit than the recorded [PATCH] discussion.
Close it so that it may be reopened the next time we face a linux next
build problem.

#syz invalid
