Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3CA204592
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514204; cv=none; b=U6pUkLN15br6e9k6/XJ2TokuhpdTT+lPHSsmqVyBHPqeoyq0QoVQkbRmLnA51sJXYW3vy4OT+g9jaSk5AdhpMosWgACk5RRQz2V/TNG1XqyCwKpWyfY/z9ZJW97PphngCwNov9823ti1j1/pCuZbXBtWsOJ19YgHJmR80KArnI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514204; c=relaxed/simple;
	bh=bByoucFVB2UdNo+kwtr6qaUds025o1QtnwjtqlZhir0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D92CcdhGod1bDx3oGmOesbDy4u3SLVcpYbdWnT+cQzNmfnxM+Hj9XIAu5RorI7hjUqk3hWL0pvJAikBX+YgoFRSGLUddC9w5HFpp2y7ys+v058bnLWOzV5jr5YB2CC2Lyg/rV0Ya7lETmlM05Mxej2KnDZMPT4N05WvkGGRiajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43621bb7eso57576205ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514202; x=1744119002;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KjPoAkVFViWhbQFJAekmXVI/D9FR8rd7QSTCHbMYtM=;
        b=ZpZvW6AfYg19oir+gnYM3Yu75ViHSwT8aSaiinJSZRgzS1t9n/HpcW7bFNUP/Ec14Q
         TZ52qMce5bDTH/yb5CzMItNboKqKjoNsO+tXjZ01dbHCXmdKonL0dUhJUWOXOlpFNn16
         zLkjglhOzmkpcrMasW/TWFifjYsv2Zn5PIwSd+WGq/N/NudLDCgPFCPq2WbcDYBNy34L
         f1XSRya3SJd8liCfb7Z1wB4L8B0B2o8GMp8yX49699ExndgyxI00yCIro51ieTcP6WcZ
         xZSm9PCy8O5HGyua17oloIfd60+d8lfFumUOpMCg8jC+DCT1llejQpo6CWgBowSbMrHp
         +F0w==
X-Forwarded-Encrypted: i=1; AJvYcCWxbhR+zD+NUUEII0WpKvJjUduPqfQJhErwOQ9RbRpBcxAribBR1mpYnIGjw+Qlp0TR+h9rfBtN6mt9/XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lzMqXiGeG4r3ZcqeaQVzA6/ElQkLVjaP3lNIcLpK4SYcxUhd
	5auSgJ6VUMcxC70ZD63Gv4sCSEjaeASAMnuoxn9D9/3vMLOOmpndaUuV9sbg311P3AlYYLNFl1V
	AxZrzF8Tl0U8V78ENlZRfZ1zi13WjPTvfmoE2EcJkWEXXVHELApvizlE=
X-Google-Smtp-Source: AGHT+IGd46zNjDOiUredidljoyGWWZkx/r5YM1sydx36CYya6gRoptz1l3qZgNvJCdDsIg2A9buKqaYK9wSyVcLuyTICZbNJGrq0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c264:0:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d5e09c1d37mr124928915ab.6.1743514202162; Tue, 01 Apr 2025
 06:30:02 -0700 (PDT)
Date: Tue, 01 Apr 2025 06:30:02 -0700
In-Reply-To: <tencent_0677C99FAED5EECC8C85E7D606C892F34606@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ebea5a.050a0220.297a31.0011.GAE@google.com>
Subject: Re: [syzbot] [isdn4linux?] [nilfs?] INFO: task hung in mISDN_ioctl
From: syzbot <syzbot+5d83cecd003a369a9965@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         08733088 Merge tag 'rust-fixes-6.15-merge' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12731998580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f34c65540af006
dashboard link: https://syzkaller.appspot.com/bug?extid=5d83cecd003a369a9965
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=160e1404580000

