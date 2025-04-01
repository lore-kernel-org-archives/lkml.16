Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FCC4AEE0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480254; cv=none; b=hIY8USjFeB61CkQGqPGrEuADZVK922xwxvdRS2UU4IMUAVQJ/ogK4n61YBGUJ+FVMiscmUPGVNGaz6Eoqd+WQHZE9CU9/1cm+JO3zS0yj6O8CPw5Nr1X/sRid6Kfffe/ihbEEz9zSJnqz1hAYoMo85kwloTqrYIRjOtupzIDASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480254; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RnlcV96R+kcZdwZo3XBf9hxKwF0l+LpbjR4TPO+eAE+6CFi3ufVirJrD6ZBdtcLjyMa2hpgQrOYbik19bdOkUAWUo1oV7p+MFxK1kvpJJY9bu4Jf6ShBVZ04W5hokWuBYgp9suq2wq1w7MdeHkRs2CuHbgxjznIO3xTeyXRJLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e310ba2f9so410807139f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480252; x=1744085052;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=JnSbzTwsBzRpkzaw0yTty3yw+cEcNV9IuDLrS9br7BBNsz7RYP6lsn9DvXz8nF09N0
         xJ+QqNO15dWwMl3TqElvpUJOSAm/Q8S1YX6IBtX6lBmT9Z3Wp/47UVzJivYnaILeB0qk
         /auL57KVG8/mRSD+BmoaCyevkgWyJ/OzEBYHKYG7aWex8i8x5ltm/e24iNqw65bs7fjx
         0vRimj74fzaMf18mxLni87A+gLPoRHsQ8o1bB1bz3o0GLLAopE7+TPX+59Qtu/oECV8H
         eZnFowZEg9zy81nCKMq9tt9mkstdM2sguQ24kf+5ZPVNe8J3M1t5VWSY56POgLFI/zzO
         774w==
X-Gm-Message-State: AOJu0YzBRu+2esB5uVItiAlCW9XvDEFMXJWea5MZMKu+b+c/XCQeG6d1
	DlY+z4jwL2KN/2x0sr+tVS9SdDgklm4GtUdy16vcSerSWej6ES92EKmiMRZ/uwnqWaUayi5RycO
	JE6vs5BO5RyY1RBIKFVdLs0Tfy9ejXpxhlR78xZAz0N5ICeTyuYhNw/E=
X-Google-Smtp-Source: AGHT+IFsUb+W4uaIbHyvsl74MR8u425h8z0QN2LtM/q+ZRCOSD+sNajpTuRHfN04CGktsZgQKbgIJHnZOEqQ5nZkAXOjZwKnaPnq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a05:b0:3d3:d965:62c4 with SMTP id
 e9e14a558f8ab-3d5e090e8b1mr109468255ab.10.1743480252380; Mon, 31 Mar 2025
 21:04:12 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:04:12 -0700
In-Reply-To: <6763f200.050a0220.15da49.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb65bc.050a0220.3a8a08.0006.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+af2db1cea2ed7231e15b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
