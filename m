Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F921F098C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204415; cv=none; b=HSWeMM4NlWVTJDjaaGD92yRZaMNHu0dT8vKuUfkEuNbtBCTdpWZmgaBm8LGK6CIIJNzeUZBYAd8V3a7Z/y+XFi9M1AOumXRgWQdaCbQ8IEmrfcJCCbQkKnlwmnePXEizpX2Zuu44O52frJnNSwIFHJPQL0sHfiotCnkxIJTA0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204415; c=relaxed/simple;
	bh=WSyKVT+LLfi3XjuyztQbmXWWPjKYwlhkJaZVZreKxQg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=MtACeiyVdlZJUATKg1C3s62U1+uDm/6ZwOicd7wjar+NNqo13J15RrvDSFXp2OWVGW/QXqYOL6aYF5KKTwf0o4Pg0gOvmBEXa8nIXfRGFscyc4MlEcj5XySP4u7QBCCxy+2QvWm0FoibNmzhhi1viiFl2DeMswsCIKKXAORLu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so52781265ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743204413; x=1743809213;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vq9BN13Z7QMePfoIMCa/4EWlsqA5TKcwQV+02LV1Sdg=;
        b=Ed+P6REejFvAfxd2cJSYFuL1Bztq/vuiH/u5khk7oCls2gTLDmOShmUM0yGl8wcVQA
         W8qjm3EfZwnQDKyKGtPrFv1QGk1RNFALcdabXNJ0GQUkglFbo0kFBaVVkMdfSKSa3S74
         9XVLhWTDyMMbrDmChP0jwqqrFOcSoEmfa0sQaZNdMWgcQWdNEh1alg3Ms7hILmyIsUxm
         KVd48tLYuk31msQ3V7dmrcaDDLXyxqEPQr7zI9nCV0zX045Vcqlz1Q7fgdX/0Vb6/GbD
         0IJ2MdRB2ojtjdJTAqfvL2wAnZE9YXIOfESRP7MJjOtqE4d+vlPmVCSmrKXpo8fPRcgr
         HERg==
X-Forwarded-Encrypted: i=1; AJvYcCUN55FCMraRXQOOzEfKDnuZPmlygFTsFbO/y+FvX+Yco8yojoGZScyfbDTrLj7djWtYymwj2At3MhW5tgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwm0y7QuXjofqKCFWQJ6HBfPKHMgf50QrK9mIT4gqsalsMNXxV
	oR1BD4NZKxbJZqGZPJCN0nsTFrYN17uAn5OfMqDdeQ8YYaoN2qNM6kvH8vMetAcYauz5O/XIs7k
	eKE/nKftTaE+aaKUTlqkILbAQxojb9TIkglmvUPEKa3ivIyDhuwXcEmk=
X-Google-Smtp-Source: AGHT+IHbyZ+oBRgu5yixQoUhQdGIOqQasOZARqwrJiv+F68orCwj6RVd8suaPk9QZi41ifHPb7hRsHyVLzyFC9TM+qqcHTolD85v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214b:b0:3d3:d067:73f8 with SMTP id
 e9e14a558f8ab-3d5e092a397mr11477505ab.11.1743204413236; Fri, 28 Mar 2025
 16:26:53 -0700 (PDT)
Date: Fri, 28 Mar 2025 16:26:53 -0700
In-Reply-To: <Z-cwOkotpxeSxirT@mini-arch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e7303d.050a0220.1547ec.0001.GAE@google.com>
Subject: Re: [syzbot] [bpf?] WARNING in dev_xdp_install
From: syzbot <syzbot+08936936fe8132f91f1a@syzkaller.appspotmail.com>
To: stfomichev@gmail.com
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, martin.lau@linux.dev, 
	netdev@vger.kernel.org, sdf@fomichev.me, song@kernel.org, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

> On 03/28, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    1a9239bb4253 Merge tag 'net-next-6.15' of git://git.kernel..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=17989bb0580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=d48017cf0c2458bf
>> dashboard link: https://syzkaller.appspot.com/bug?extid=08936936fe8132f91f1a
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> 
>> Unfortunately, I don't have any reproducer for this issue yet.
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/0795c9a2c8ce/disk-1a9239bb.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/dfe4e652ed32/vmlinux-1a9239bb.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/34deb7756b26/bzImage-1a9239bb.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+08936936fe8132f91f1a@syzkaller.appspotmail.com
>> 
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 8456 at ./include/net/netdev_lock.h:54 netdev_ops_assert_locked include/net/netdev_lock.h:54 [inline]
>> WARNING: CPU: 1 PID: 8456 at ./include/net/netdev_lock.h:54 dev_xdp_install+0x610/0x9b0 net/core/dev.c:9911
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 8456 Comm: syz.5.847 Not tainted 6.14.0-syzkaller-05877-g1a9239bb4253 #0 PREEMPT(full) 
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> RIP: 0010:netdev_ops_assert_locked include/net/netdev_lock.h:54 [inline]
>> RIP: 0010:dev_xdp_install+0x610/0x9b0 net/core/dev.c:9911
>> Code: 8d bc 24 28 0d 00 00 be ff ff ff ff e8 69 c5 26 02 31 ff 89 c5 89 c6 e8 0e af 81 f8 85 ed 0f 85 59 fb ff ff e8 d1 b3 81 f8 90 <0f> 0b 90 e9 4b fb ff ff e8 c3 b3 81 f8 49 8d bc 24 28 0d 00 00 be
>> RSP: 0018:ffffc9001f13f950 EFLAGS: 00010287
>> RAX: 000000000000023c RBX: ffff888059e8ccbd RCX: ffffc9000da1b000
>> RDX: 0000000000080000 RSI: ffffffff89395ebf RDI: 0000000000000005
>> RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: ffff888059e8c000
>> R13: ffffffff870484d0 R14: ffffc9000ec3f000 R15: 0000000000000001
>> FS:  00007f6e99bf66c0(0000) GS:ffff888124b41000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 000000110c2f3eb0 CR3: 000000007f4ec000 CR4: 0000000000350ef0
>> Call Trace:
>>  <TASK>
>>  dev_xdp_attach+0x6d1/0x16a0 net/core/dev.c:10094
>>  dev_xdp_attach_link net/core/dev.c:10113 [inline]
>>  bpf_xdp_link_attach+0x2c5/0x680 net/core/dev.c:10287
>>  link_create kernel/bpf/syscall.c:5379 [inline]
>>  __sys_bpf+0x1bc7/0x4c80 kernel/bpf/syscall.c:5865
>>  __do_sys_bpf kernel/bpf/syscall.c:5902 [inline]
>>  __se_sys_bpf kernel/bpf/syscall.c:5900 [inline]
>>  __x64_sys_bpf+0x78/0xc0 kernel/bpf/syscall.c:5900
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f6e9bd8d169
>
> #syz test

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 87cba93fa59f..534eda336f8d 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -10336,7 +10336,9 @@ int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
>  		goto unlock;
>  	}
>  
> +	netdev_lock_ops(dev);
>  	err = dev_xdp_attach_link(dev, &extack, link);
> +	netdev_unlock_ops(dev);
>  	rtnl_unlock();
>  
>  	if (err) {
