Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72286349
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480317; cv=none; b=W9ScIPrPoYxZu+7BYpG13HyOq1P2tGM7507N7DRneO+SOEvFO48xh1eyBA87pG935A2aGgkK+JOYiOOts0yuIq7sw6bdp9ybaKLHJl5iw0Bd7049o+c4L08CJ6asBLr41jd4Xsy2YkGWiFimWWcraOuHH99zoqHG2cE2Us9ueTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480317; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mTbPukLljFfzMsCxzAD86CB9D32ImX2XV98AMglJjuL9oKfokXbDuRTkigrFel8e0QDB8roju22YvtGqVRgr9yiCOrvtHgnaZh4calBdZ3fLZvmQT8qI1AXv3FwCoeXcwT0ahPWy4CQn/Uyg0EGVypwj3JcoII6gkn8HUCwhcjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d585d76b79so45093755ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480314; x=1744085114;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=Xo1Lm0pxsMDdLwF3KqLrjYscYmxLM5d5Z0ER8bSRc8UCsHUN9/zmNInMGn9HewQy2D
         cslE758d3bdtPn96ks4OWMiJGGHwmcu8yngrax3W3L9wDjGeoH/3Cd0BiBY0zW8hHbQl
         yBcpSlmxP5yw3S4UzwrL1nej5hSzuxiyzAYjn60yWJVDsUZNQkXtqbgsJxLDl7NiO49J
         zOyuZbp4yg2Gm3M+Qbp6fpCttykVp2bnODvA+9h9RH5RoEFQ/w9vPW9mMDfBDFWENNE3
         x0Dy2XoiLglhoN1Mkv7owFWQQtbiOid/KAleNAFqU/iJUTyLjB52tEt/0NvgGC/cw90Q
         5tQw==
X-Gm-Message-State: AOJu0YwSiwwvdyn2QI5YoH5AuG9vTaiHqP4o4QyOXAFK8+ghGF74YAK3
	npNRucc4saFgZT2h2eQQaFiRR0lsobkEcPMbzBiXe3JhvXMvr67IWrK91AvvDldGXWUdYeu/tYU
	xsijZ7YEcuYIfNfb8hhNdftkFJADW4uzhbXXx4Prp4wU/8ZZ11yTxxtk=
X-Google-Smtp-Source: AGHT+IHB55wmYPhAmRULNj0M+pZH68jfR7n/drAb5Ly8bCecyqY0aoioEqql0dKo9vyWqm8EIcMSFZzy4Ts7VXwzsBjF3DpXOvHf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:260a:b0:3d5:d743:8089 with SMTP id
 e9e14a558f8ab-3d5e091344amr117665055ab.7.1743480314095; Mon, 31 Mar 2025
 21:05:14 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:05:14 -0700
In-Reply-To: <672b7604.050a0220.350062.0255.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb65fa.050a0220.3a8a08.0008.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+07d7911319bd613ba885@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
