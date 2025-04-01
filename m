Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF5C7080D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480046; cv=none; b=O2vhVHmQJXVK1jlRXPxrV3qCjVBzcKiV/c7zg6xXlKEwFIsk5YrkQ+AePbBi7N6ZKXC3vECnXD+xBpuylPbeRR3z9RifX7HCwEoixkDSX9Gk+4UhLi/fjH698QsDLxzgShIxW5OU6e/rWacX6ibYpHtp7khHWgbzhwcmjL/Fvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480046; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=laf4f/AS9lq3aDx9+k27RBQJ22jFrJpJXBWUU2uznNrR5oGdNwGTXz4Axh+QaWiiwyoPqJE9OpJSFrZ9hvocnPWBKuTk8zaivcVv4kdNXAz9aqLnf1GPL9Dp9ZNS9HBtesu69aLz4MGzOMgWIShZr1J9sx3oK0eLej8+pJX66zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b41b906b3so548419339f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480044; x=1744084844;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=HSJb/rfCES+qmfDDXz3PHto24Nb5XVHWm0cXD9jLd922cJwXLo6Oh9oxEERBkLUBAa
         n2TkdbusGh/N2T8B8yVZqtgcNuaW/U972mBC9JPxtviQlZiemnOEeQTsr/takZfi2EAa
         SHc/SaGzCw4Ul5hKgJqsR1MEZLjm8pmlTLSDo7+PDYORZ/VqThhL/Q4edfn2UT9+4VnB
         KAF2m/ZRCc8E5Tg9ltPsBgheuixsKHU3c+XRWeXFluT2kyAI6awZmOCDX/vNy2KxQBXk
         QLlZm8MV7QDYXtDmwHvzDOKEMp6Nftd91u/ZLowZcXCm3n5Sot7vlTeSKW6+RMVT+YJ6
         SAqw==
X-Gm-Message-State: AOJu0YzGp0HR6eKcoogSkvDNUfZkYDSN/3B9bwBhb3wxbn28rQ2Qk4TM
	BySXQ/t938GQE6ToZ2gO3FYGUzcIp+9MUoky0AuucTk9KWpn2DLyq0Msprodmowq7JH2gy2S+K5
	IGqs23wP3R/yoe9NX0zhmqmT7Bzru44uSYcA06ZVLKgKdROu9+br5Ntg=
X-Google-Smtp-Source: AGHT+IFZwpHAm7pdKXbsf4EV5LyzkY+phYu5hjU42aBDEc2Y+zxxF2Vu+Jtej11JhjUnZWN+O1vTUXpxvAcvmkXjxCawT0M9jCcu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ce:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3d5e0a093b2mr124052205ab.19.1743480043771; Mon, 31 Mar 2025
 21:00:43 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:00:43 -0700
In-Reply-To: <6739af3b.050a0220.87769.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb64eb.050a0220.14623d.0006.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+8dd95f470e7cd0ff4b66@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
