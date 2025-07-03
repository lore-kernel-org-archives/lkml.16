Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A4A2EF9DB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558690; cv=none; b=LUmDo3RFgLWDuK78rMlAYW7/JyFK6lXe3n+9StrkRler49Rolm9+wgZT/nL4QbF5hjwd6giMgK3cGmGdtq5A8l5GerCxIMtuV1WFaW339UOgNsrCKCFDJPLwZ4ABTwttNi2EhF3xseqGswZf7mBLDh2gDGfE5gs7gfx5iw9uqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558690; c=relaxed/simple;
	bh=2ZNpXpjmbapVB3/yiaGZZ8q5PA+OVEKQHwLIswPdyRw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=crm/7LuzPAwW1QNKTICHsi57zzFTITUz8lGVcWs5aGlFRTXuQNW6yKhy7A5vYFsjqHyudp4PBjY1bejGjOeLARwwrsVuiU4R5Jus1x8MBBPJfBf5dk00xnZNS5KnLKTxLYU701/lEynLfN0xGSnSJ8lR5vXPL8ioLQ0mhM776Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-869e9667f58so1269122339f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558687; x=1752163487;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZNpXpjmbapVB3/yiaGZZ8q5PA+OVEKQHwLIswPdyRw=;
        b=P53UA1xWBpgvzB+4nWu9xmHK9HAvq5Cmbr+mXavswvGPKEl17Vr5OSVOu4LqL5Ssm8
         MbFBAgHlCDXsaofnsM/7Y4XOCOBldB42rIHKkLrLXnpHl60oKOX/fy79kI0s9LTNOs2g
         GyCAD59mG+sadw6lMNfN5FOkeIEqO/dKtJbhxd9LbVsKUtDVtlR0IJgSFpHOoezueBN7
         6xGPoQ4yhh6AobiZuhdmkxBPCJOpXqXaH7QuaGLyZJF7wZKwdO0lO1uEeBXV1WqpZGtG
         pobK+PG6GBgp9VzTwz5bVU8zkREAVdY5bJeMD0u2SggDbUe0ffqOELrrEvzCG2NcVKgB
         Ahhg==
X-Gm-Message-State: AOJu0YxpChbdA7VJHhDUvuzhhowjgrdeQ3CGmv/3pLslZBmsXqIHjd+f
	T/6wVntPnchLGIpGOOc3+mE6dVGYP4c3FzYpsPAycp5YWw+l5nhX42PAAR2eErKldIBcAm+c8nI
	VAeW8HgoBGJwgQETfwz3tqjJfVoEYP7jnSgjyivGn3zWCHcRudPdU6oueuW4=
X-Google-Smtp-Source: AGHT+IF4opcerBuuzTKPNj/Coc8KIotmmtdFqXZC1X9PuemQtbQYELgJQ9DStE3x0OBI94PqCl79l3IW+pNAt0EVOQ3T6CZSYZB+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:fc03:0:b0:876:b8a0:6a16 with SMTP id
 ca18e2360f4ac-876c6a8a90cmr823778839f.13.1751558678437; Thu, 03 Jul 2025
 09:04:38 -0700 (PDT)
Date: Thu, 03 Jul 2025 09:04:38 -0700
In-Reply-To: <6862c942.a70a0220.2f4de1.002c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6866aa16.a00a0220.c7b3.0004.GAE@google.com>
Subject: Re: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 b4911fb0b060899e4eebca0151eb56deb86921ec
From: syzbot <syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b4911fb0b060899e4eebca0151eb56deb86921ec
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b4911fb0b060899e4eebca0151eb56deb86921ec
