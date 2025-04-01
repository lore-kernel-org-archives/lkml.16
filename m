Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838697FBA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480647; cv=none; b=Nqa4xK4GAGfCEt5ThpMEZ2DBvYXpJehZz8k+wlbaUduXlNWTVPVQrzF2akQKyKTqqb36TXvqZlgtkFGNSIpVIWhZKWRqX8Yt869dm5JDYXj/WHnW8kVyrQQrL2eDmcWbQOX/BEwdeey/hd6gy1pTJ8PshayL6sRVG2/sGqDwB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480647; c=relaxed/simple;
	bh=SO3hCWG2oym2HwQ4uUlEyUAJ9bCi5GKIg4knTInEcqQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VK2J3IzbqX5TG5etipTm9zua/TQms1Fki5civNYbkgYSvM6OFP05a2h4vgszDyUlBYQTKlTy4zpn96UDPStlnQ8sJg6W4g+IspqVhzDC16iqKPepwYufPJ1dAYiyciBRFy5onM+Benn8eQPP0p1l0LS7ToziCow6pUL/0Nx5u7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d2b3a2f2d4so97937435ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480641; x=1744085441;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTg2Awk/3PXKxXZrA4GyyhvYfu8HXhKZmX8tWwbhhTo=;
        b=echkJVjzPubL/zb6lqNM01DnSfpFPyeVQ6ftx/N9ltJPZ6aRBrXg/vrtXAuIw0n1+J
         DwvkhC1W4xHUiCIlrdeajAhN7KrtM50bMAjbz8igy4jNhq0wPhJIiPxEbNGhZKGLDWCv
         1H9dn/qoemlUoKF0mPaW15OIszZj+nJxzK9O/Q6JehkA9mr4dedwS9QiNZBfdbXqz4lJ
         nZ6anSMvrVTRd2anUufLmzsA1cbdqK6G/845BZmypMIdn41e2bkBH1BT2KDDCOp0bQ5f
         OqILDHxXr3IV2WSd31PUgsNXEdgzKgqZjBcgxOPMYB4NLcFmxj08LmMwZdq1TwtCqoky
         iYCg==
X-Gm-Message-State: AOJu0Yzqyc17TzyfwkgbLPy5vzWq9OVxuEqwSQLrEjmGaTAA/fYWums5
	8OypJBFj+Q17ChZYa81m+Pn6H+gumy5vEssdp1o39uXcSRY5B1TL7cMaR3Gls6JxOO9Ki3pDUuJ
	/WnABsDL8kzaYH72v/WSX294Fg5K4hQmjVM6SPDzoK/tQtgM0KR6M3pk=
X-Google-Smtp-Source: AGHT+IGY/3/lCxepxkouxkOTsG2oGlaiiztQAJH7x32Yv5ytAqKDKSAlcwAxVORum1/qA57g5GksrsNoGM+hGVgBanVxl9xIioUx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248f:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3d6ca5d5dbcmr20965995ab.9.1743480641673; Mon, 31 Mar 2025
 21:10:41 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:10:41 -0700
In-Reply-To: <67eaa162.050a0220.3c3d88.0044.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6741.050a0220.297a31.0007.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+cebfe3f22eeaff4ddd7c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Eliminate padding in move_bucket_key
