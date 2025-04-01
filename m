Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304FD86349
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479946; cv=none; b=eZ5hPXX18AlG2xOH/nGtUOiTTdFspdybXVmqflwp+Udt1j4M6fItgJrhYicBxmIayglTseFqqvjQpaP+rI0hZnux01cy3lIkZD/bkxVG2cR0PhAZkYkrm/vbbCG7a7v/YJwksEDAOZzNrqHmXjx8KGLymP1tVvNWZQk1LgDoaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479946; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X7D6ua6wJAhU+zSc6miSigdr1OY4uzzrdY8pHBKRMujlf+Tm/OTaW6YeoMxUu8HdM5IfGDHBRHboCMunkxoEiMQKgF2dAVTMtVmJUeLuHcAfLWCmIGMGJ27MxK4QPkZuUOWEwd9Qlda+VfqfCF3uW7UoJFMys1KZiFII+lnc1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so37881165ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479944; x=1744084744;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=KPnxJ0kRewiNNJF0w8h1KJR0Hj804p4FcsN6a7st8jf99bFUTFoS1NxDJi2EPIll8S
         eXYE3d0qzu1MvW0bHTcmG5pR6FO5aPu9XJcuiBRiPzM/1EOAExV7et22kjpDW2sTCHpJ
         +zylXxkPQWee8BwNz1DYJ+Zz92E4OraowLX0ENiuIgFNdYxfUs3QV8d6VYph+2/+VmbV
         lMX1JrnywB/JLeb+K3Jq1eeAsBra49gZ6zqBV32vWByihbOpWqPMxpt0Ix5iYw6FINDN
         fQCDWQSLnU2BqsBP+rlTnLS79feWc6M+4yWx0ORf5GasPDqvq64e+WcSCN/Iijqm73OG
         saJA==
X-Gm-Message-State: AOJu0YzsG6LnLRb7uGRqX4ksN89T6qckVnSOURxyKnGo10YGw4h958/V
	idysK0AQPyVP/2U5CqofShs2XzOoG5qa1B9brAUFPq3wXxi2p/KFHzw+JIpKq75Lg90N+YCSkRr
	3N+Fdc7zcPBIso3cY04OOwcGRnPItsHtrdicGWtDZUOXQNoDg4+NDvH0=
X-Google-Smtp-Source: AGHT+IEy/birN/jFfiERhAsNrG2qRliMZnFzrkfiKzQ28bhlClUFbX1DmxxKEX3yH+rcQZ2jMDU9qvqBf/YkeT3p/XltZQG/usXf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2612:b0:3d4:3d63:e070 with SMTP id
 e9e14a558f8ab-3d5e09d9fb0mr101782905ab.16.1743479944403; Mon, 31 Mar 2025
 20:59:04 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:59:04 -0700
In-Reply-To: <67827416.050a0220.216c54.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6488.050a0220.14623d.0004.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+a7b475122da841580575@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
