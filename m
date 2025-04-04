Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E31E5B86
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779645; cv=none; b=hIYGWLhW7PpLy2uqBcFtAqGLjlvPumWSciXtdVQ3AL71pS9ju9HcPapUiZaUIQpE299dxq+13rd14ZvImAwp8hq0hW77P2LRRzS3SMRZHeVUyti9vglCwvgvrzAMAstCwsLnWk4eQugYDmSt87ZaZrCcXmd6ckPcCNDNiKE6Tfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779645; c=relaxed/simple;
	bh=l4yDt1yHx9j+mchDuvLTH3Q5HyepF7QOqWVWlSgKA/0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OmEOXLKCKuIdC9xrWHBlImDZPfw6bHg7Lf1I6aKz1ZsRsvsmScQBvGZjjBPW+E6r2pjkbiu4loYj/mDNYmgeKm5cA8V6utnFxCDGod3cuKTdHPtWFiZA+/eOKGT72RdbVcAfiE+Ssybd/k3QEr9vKAYgp+kVNipqpI/pz3iZD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so20546255ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779642; x=1744384442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iW+6vLxzZy4xI02zj7teqXkFbt/Cvq4mQ7bN9HZTK50=;
        b=MOqMmybrB9Nw9OTnbnGolNBuWzF3YaCdWzrpEiUP6i4onaMQTazay0slwVchhj7AgO
         hN2XFfgQnEi3xZlTCqX63Ch5sKWdFTHB1Xppia2AAGRlKMONd5UTGfYY623+eDkeTaWt
         uCVOXiEOzsmNIKs3aiVUu8yCRoabP6b4TJBo+2gqLecOdZwMW3Dpw4ktlz5LE/K9UBgL
         PI7JvO1ifXM5XFTO8F7scTsOI5FrMEbfKOCIKmkPQXKG1WBVHS5+erNCyJrFI5XYwe7N
         cHTUvMm0JsfuWgPhu0Wq/m6/vte/YgPJB9IIKSqhjqjXf7e1SdU/LS9sG/gc/l7YstwK
         Q7vg==
X-Forwarded-Encrypted: i=1; AJvYcCWL68PZQ2IoAHfXdeGbh3EqVryNI+PxVvYkibhFCHhHxG9T6TqUFimTId4jAZyqvV2iGTSneCV117+qtl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WvUDcpRnt/iTnlskx4D/3YbdPhMWMemXrn/ycwok31X/JcIW
	jHk0kIuEw1+bW3DDBF+BHnwJwt/EbSXfMca1rKtYTWIUWlTyEO4QwdXdabx8MLKnNEpSltj4nnj
	JuOPv5sughBpsDRXdr1R8nUzbtnL/Qt7Eye/uPV0GePWL4jspO7f+Rm4=
X-Google-Smtp-Source: AGHT+IHQHK+2oKSLox2L7WzUmG1X8IpHFrta9cnoDMSch8yzSSBgwQkNqZMKxPfwGLce53ZqGh9rVIY5mpVzRMSLplnPyG/OetJU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cf:b0:3d3:deee:de2f with SMTP id
 e9e14a558f8ab-3d6e3f01584mr44299585ab.7.1743779642707; Fri, 04 Apr 2025
 08:14:02 -0700 (PDT)
Date: Fri, 04 Apr 2025 08:14:02 -0700
In-Reply-To: <20250404100710.3803-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eff73a.050a0220.2dd465.0215.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in blk_mq_freeze_queue_nomemsave
From: syzbot <syzbot+9dd7dbb1a4b915dee638@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e48e99b6 Merge tag 'pull-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1564823f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c79406130aa88d22
dashboard link: https://syzkaller.appspot.com/bug?extid=9dd7dbb1a4b915dee638
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14783998580000

