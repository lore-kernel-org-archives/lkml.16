Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4F7FBA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480518; cv=none; b=JNyUDm7DZRTmABXzlH1x+izQt397LfUiwgqKsMoW0gHndEpvAzUWnOfV+a/HSZi0c8Yp3CFlABIyG2tfpiQ8VRQOTGG4+ZS4RGl3krNbt46mVn85FbEcrF7GF4JvZdMiV6i1RW8HSVK9a2v2VP56RRYJeHUsdacqOFmvxvMZghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480518; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fxCTIAdhHQ35HgHMF9cMLKSNp3cqEUfSHatfCW+Hi9RPXh6h4QHE/deSXBGnw9PLhgfbLV6u+28ZQswxFBjXFO4A2HfrWgEHDYlZpa0KG6IkJn+oua0NZsJpdWn/2ma+QQ9DDIFPAb7hime5gT5B7f9SRv9NMtmd5lLvIgl7a1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b3827969dso485849839f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480516; x=1744085316;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=lgiYK2RpgGLvnzlFp9YeTDu6cdOfsgkxIaUDYS+atvCQPZfTvPOKu8v73ZICX1dweE
         MjF14xbCqM8wqiyd5iM8CpF6QKhDe+7ColKHdOp2JjdnoO0mPdFJ+mJkvldq8wMiv8hb
         eHJwIk+0iJ6yLNpnMQnd/r/ASRt+rx9hhwDIVdPzciLChDHThJ9/NOyC1mECh3246UOW
         Ojjj2rnXbYkFxTEailatH7AM6CsPpR77ZiOkrQllBBgmOAjI6PBoaJ/eeP4jTE3YciEh
         FvODUkL6NvLpRyy5Us+eHgUdf05QcY8/soUZ4JM9SPTby+Hr7MBsEoOVzF1/ciHtrqqW
         d14Q==
X-Gm-Message-State: AOJu0YwbmVQbfeHrIdtWu58SCfmwQYsF6th5oVYueeWm51xpALcaZGtd
	dlBuNX408mcOoAv14dH5c8BVFtCl5vRGI8MPi1M4vuZZ5FIfTeOyaWcwl/yONc9fX4iDDApYfbX
	IN7g4xnqYI7YMuDMX8KBhMl1/UatrA2p0FsPFN7Q03yizgwF/7WfRMsU=
X-Google-Smtp-Source: AGHT+IEa93rDCI/oeKcwH8+vPTjZbRMQqgIFzqvI2iFo22viPB5spCK0LYLSfi+LbXmcaaID+Oagn/MrqrmtNql8HpvPUXIWAJUR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c1:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d5e0a0f06cmr127329385ab.21.1743480516022; Mon, 31 Mar 2025
 21:08:36 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:08:36 -0700
In-Reply-To: <673c3f40.050a0220.87769.006a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb66c4.050a0220.3a8a08.000c.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+3cd97352d16f0e6066d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
