Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31262E3398
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479808; cv=none; b=u1Y/4mI85ACZr4o0Cy2naC+St9bHBDd+V3MtuV8HL35rjyDasPM97KAvu3U3zYg9gphlSnRBijHT5aGSV1XrZDKOYYUzgk6wEw4l92bi+b9lPWZ/ayo4Oa7yQOKJy259WI0GXWDzmgTlsPiQzZYFIeISh5EqPVdg5JKJYC/u/OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479808; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=awuJO0Ymx6khHDgXGf905yDWzhYoi1JfvWAQQJvbwSHxMv8ET84iTEBkYlf/fC433lywjUUkAMlMVAg2YxpioX9ovruwAJoa7AYlv4OpWOEAZ07D68XeF/rc0lUGdNAEKz0hxFDeZQDspH5PoX9P75Hq2kXlijmMfZDEhk+Zsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85c552b10b9so507891639f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479806; x=1744084606;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=fcZmJnjFeoTYU7nmWz8X3CT0Ka1orZpL3KRBnQaAiy5srIUYPht1FQivHYrFv5miYJ
         XKv7VB4xfSz1jinsy+PfT3dRG20WFqHw2Bssy87t7g+FxBo2jwYHP0HOS4mLhOvwfEoA
         9kxkoE2Qptp84Yv054/tpM2SigWBIGFWuo8VuDYnx7Cl8Lm/MpLwIhPSWupJZ1j9NlRv
         ADq/zYsMsu2BmhcZKic9C5ZVKjHf9gxBVYuq4CXkpd9NQLPHaBdfnq4oKoxXnh6rW2IY
         0mUQ/F2Md2M+48MthRD3a7YbCgWEER53pkPY4tWYkfcCBdyZB3iUUluOHP+IRgZnv0NI
         2lyQ==
X-Gm-Message-State: AOJu0YxCc+ZYgO3fBrmDEER8AiXmWVRRD6VM509ZQXPGQVwjzx/2FSfc
	z1cG7N1jmKNk4D4vf04ljVpLEY7gyOskeBdr+j50ziqBgbtOTnvF0XvJWlq+rjpcQzHMuoGfZEB
	vB91IgbGmFJDrhP/GJRpuEBBeCceyA+mJB+Jjgt1zjHnetUy+JgO8hLU=
X-Google-Smtp-Source: AGHT+IHthGUrtgwdYKGMHZDay7G4NvjayX4A874QfGJh+cIjE3pXk1zsSvBAT/OnOX3jC4D5BiXn4zdQyvxwHzeicr6rGFMAYfuy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3bc7:b0:3d3:fa64:c6ed with SMTP id
 e9e14a558f8ab-3d5e0911f6fmr115671625ab.7.1743479805786; Mon, 31 Mar 2025
 20:56:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:56:45 -0700
In-Reply-To: <67a23342.050a0220.163cdc.006b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb63fd.050a0220.3a8a08.0002.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+655143dc5f99972b52e6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
