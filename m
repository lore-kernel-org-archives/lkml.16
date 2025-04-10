Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDA283CAD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289585; cv=none; b=AoObaTsbEVFyzDh0k/w2sL9+9ZR98m8qevwbN2GxR+xp1yBxl298d0SqUlhXFEYOCoIyGrk015YK68nE2wW6fZfng+b8jqBMzW2JdrF7xzUUGwhjuew7PzKvQVqVfqDgzASD2dHLpyodxZonoBztAB46DlqrkT11SWuVzA/eci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289585; c=relaxed/simple;
	bh=vDEmMGrUTM8yYCrPqwhQCEL4t02ezZbeVW8VUbU3L6A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PSKanLkZM3KWUt5e8ifw6r4yyxsSdEaA4yuIalT9gVZCx14sWHVzLPBzLz/cR0ijmPyUrLeaM12QYATG/vHXx8MQTnysWnLkpX3FXylfmyNZ3LoMVPBkqkYpHhBHrYeM/flGin8aHTwvkg4jRsM4fPxDjXnPeYer/8WiUZ68SHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5da4fd944so16767455ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289583; x=1744894383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwjKGeyplOihDN5WsNx76P9DgKNh/A9aQGFHVxRsKGg=;
        b=c7oMSuOB49OoBdnf2IODaMyK96paM5nCh0ygA9fcmP2fRzua4Fp+ub+lCe6V0n50Z+
         V0HF1agUMqx4xm461LQ2h5RwoeqYKhPuIttfqRmPYN5EYQsVem5Q3KyWrXil99KIYWi0
         a4GgmcGyDWsJ3QgbR64OvWl/nSBQnL2rj5xu/9oU8efyVmf1wGJqdQABvtWrg/R8Puut
         9wu/d9mPjd+/NrvyK89HX+NHkWcX/0MoU1hRmVYsG6A2/N88DxxSYMC47n1lM5wgj10d
         nqbdlRLiulzuigRbxGLMTDZjJ6x2oaopQq5Wr27ifw//tqHtUoEwe4td8FDpBOEoj0bV
         L6IA==
X-Forwarded-Encrypted: i=1; AJvYcCW5slhMkFDD0/ls0sOcYDv31eplQfozU2SU9T8A+9fcR9jSqEkAXnyfj8R+9sXBOsUnE59UYNzgNgu2qI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynXFDLFhjk3ypew7mAfOOnCdp9Wdsas+Cqqi5vg9c+karY+kIV
	iXItdvNHycpJu76PWzLl/IZi0zYcBcl5A1Y7b36H5WDuGWdur4ICeift0wJq7xOI3ZinpJxWY8N
	ZH08myg1+hQpGf24VrxT9h6T0Uof2pPhbnUt3T+C3pmADa8lFSzVIsA0=
X-Google-Smtp-Source: AGHT+IGKKvMad2D5Pe7llo9yGvnZqkSWQ75yF6Q9NeHzwi5dN9/T+3XSEVg7DE3sdhjQgF2SnCDod5Ae6v+BONjR4ZkMlLmcJfpQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2588:b0:3d4:2306:a875 with SMTP id
 e9e14a558f8ab-3d7e46f8e1dmr32898695ab.8.1744289583571; Thu, 10 Apr 2025
 05:53:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 05:53:03 -0700
In-Reply-To: <20250410123831.1164580-1-memxor@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7bf2f.050a0220.355867.0001.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in __bpf_ringbuf_reserve
From: syzbot <syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, haoluo@google.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, linux-kernel@vger.kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, netdev@vger.kernel.org, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e403941b bpf: Convert ringbuf.c to rqspinlock
git tree:       https://github.com/kkdwivedi/linux.git res-lock-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13f46c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=850aaf14624dc0c6d366
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
