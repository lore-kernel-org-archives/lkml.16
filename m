Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0E23741
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749156547; cv=none; b=RKq4+nCCQEOSn7PsZGYyswbxUzatwBrWFy/U/HhCsRLeEKC3GE8fzfSehtIAxM+NEE91Ha3hiIMUOZCiQIXXBLeohjBNAno0KylyDKWGqxGgY+FUTqXI7N3Ge1ghJGn0vUtZ/54JpDu0MjIsem6e8RBtgMOBTAg6s6/IP0WsfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749156547; c=relaxed/simple;
	bh=pec3wJJB9QJ6ak6pZ8kaELWMgxhZj5PaIVOK9TzHf8s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=enGUjqL34om64/u+kCD9qAfyvq8alSTBfFnBXgknhh3+l1Pa5qN+vPIMVAkku+jL/xvNv+z2pzksLNV1yf/EPWOI62/0LX9Ve2InSU84rnPcU1HoDhQL/QJdV54+fyqN9XLPc1njo/DmTuTDUsTNtHnbl/J3R9etXr8aVfcq5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddb8522720so30010335ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 13:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749156544; x=1749761344;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XN19y13bb7hxfM/2cUTGeh7fBsSlHahJSwQ7YzC9hx0=;
        b=lMySBYO7HPAMa/Iz6VpaWqlFiCU4JXoDpobOyGeG//atSWkPIEgAjhNHz0P61bI7OZ
         8usELnl1ClRazqz11WLvQe2alMZhMeEdP+g766Ny30Kq2ALmPfUzv+mwFXY9tPhu6MDQ
         uSxX0f66HF4TCxd0AQBxkRjsqm4NU1dpYjWBwyT3w+1kduCGoaZjYAsDR0QLc/oXU9Hq
         4NFLVm2dGhE1aqQl0kGfBOPoueRTpWNC6hrsQhm5zFWlbMM8N30bu5Wk0p2URYq8ASE1
         sZVr8JrkYQMZlzBU3If4KFfNcdKGWaz8WzY+AfQE44lIGCrmycSg6Rg/w7RyMS96/Hy/
         53aw==
X-Forwarded-Encrypted: i=1; AJvYcCUzDQZdnc1cZk8y7XyQUJxNmGx2XoIY9lnIuSFvFFNW1ZyVt3fIdgrOyAlghtiGCldWbzp7xk48+pFBwpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+QDkUem52SycePG7TpuAy00anPITxsF6IkdSxuqM3+NefmJG
	oMZ/vnmddlcwOOBxxpvrx68J49bRopt6LApbVCxtiGyngR8872j7bJfHMGWOssGnnAJjyjo+Kk9
	KsQjVY03EBcz7DP529cODm8QmuxkOCbu6eZFgZtI3c722bK3zP4d0HYpww3E=
X-Google-Smtp-Source: AGHT+IFalEMcrcJTuIfJOmvDkAjEa16HI+GZhki+kVaJr9eOsRkRQOG95HkpL2MGDzDyPo5FTzAHpBx6mtG3GtfjW6IN1w3JvZQ+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c5:b0:3dd:cb92:f148 with SMTP id
 e9e14a558f8ab-3ddce435ca5mr12229235ab.12.1749156544130; Thu, 05 Jun 2025
 13:49:04 -0700 (PDT)
Date: Thu, 05 Jun 2025 13:49:04 -0700
In-Reply-To: <CAGR7w81B2saOi5NPpK4FKtwbq6c1nQL1JazQrcKBK7W4jJpD-w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684202c0.a70a0220.21738b.002a.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_sb_members_v2_to_text
From: syzbot <syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com
Tested-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com

Tested on:

commit:         4f27f06e Add linux-next specific files for 20250605
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17348c0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28859360c84ac63d
dashboard link: https://syzkaller.appspot.com/bug?extid=5138f00559ffb3cb3610
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17dd0c0c580000

Note: testing is done by a robot and is best-effort only.
