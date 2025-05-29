Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C513A3F7
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748519285; cv=none; b=irFPZmmledVayAJuyOWxas0673NEN3tu7+rlK9v/UsjBBcw/KamsZF1LLdu9nXt43xi8YCHmLK7HcYeGFp25cwFZyqv7qyLjnP1Yml/4JSPRStLMJBn9Kn/gDXVbSMe7Q34+oYx4Ij1QMwt5Ha4RnVR1SmiQisRypAlHAKOCIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748519285; c=relaxed/simple;
	bh=QQFnAYl2rFbhSZqujWfIHoWDg5HbfftyyXJExKBk4/E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LZ+yoArkvDqxGQECO2Z/6N3hODHSLa3dHcY6Oyp63RGH15cTOM1naTLdAO8S+FxDGJ/x44/r7J0qd48ySekORude/jECu8B7Tfw4MqQliZOQL6SxTZowfOYDzhuvqI0E93gZgvyBXwVmanTeI/4jtWgFqVGkH14uyy/IzVqLnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc9d335fffso15793205ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748519282; x=1749124082;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql16J6aj6hokHrJ5bV+dg0/DwTT7OO+dWoAaE/YQ+zM=;
        b=HNyOrdJR8/+uLR9BKeNGHP3GLnIAfTiDyASWRKt/r4fd8SBJZZV103wsJ2jPLb59x5
         sSwrF0furS/5gh/DjH7WIY10/bl+5BVHUX28Nv3ziKkEv6OeR58czB1rcj+z/C2lzek9
         K9ZWi2REEBxBPConvkz3WB+G8U3kqK+/6Z6gYfEc7MQwnbFpnBJSYFyEyieb8DkyuADr
         /FfnbHTnraNnl7G22Wx1X8JrvYbjzptqNVRVHxCiAAcliwuuN642f2JjXB9d0FZEXLey
         +saydnFDTUtXSRXgZmVsZOhwXjk5k+GI9KAblHxOQO7msPmftSy9Bf+V0Y7NxjaWit89
         5zZw==
X-Forwarded-Encrypted: i=1; AJvYcCU1pr4DP6X72BcNJqfFmK8gs3LfvdxUhdbofjX/d82eYocmtTAAjCzApv82wHaqFkBqXHp2IRkXUdb7oI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HnN81zY06TN5K+ZaDq88xD2LtNYm11kcbjQfEEHnEYa1FoWg
	0gi7e/8gbvXTIoP7BC8K60CZ0HqT4/Ydyecbtpr4c9viHw7sck1lxfzcrzSMAbpfx9puPahfQKZ
	wPoL/qPSHz0wgwfa0u/K+anKbnHvk2A9uFYK1UJbi+Ev+St3bfnrZAiDS9PQ=
X-Google-Smtp-Source: AGHT+IFREv4+GloQRCuf+3dE97Q5DJwXHZk0WJHlgTeCZ//dy0d4CmPqdhEhtTTq2DBDoH/mAq5eZVGk1utUFP7+qwTaDrODzTnm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1686:b0:3dc:8b57:b759 with SMTP id
 e9e14a558f8ab-3dd944eacb3mr21603175ab.21.1748519282732; Thu, 29 May 2025
 04:48:02 -0700 (PDT)
Date: Thu, 29 May 2025 04:48:02 -0700
In-Reply-To: <CAGR7w80dQ5hTj8ye0DLi7SwT9v53S+anDDpGjQw5suwEdGXVHw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68384972.a70a0220.1765ec.0187.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com
Tested-by: syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com

Tested on:

commit:         90b83efa Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178d2482580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1da44e3e5e6013db
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10c8ced4580000

Note: testing is done by a robot and is best-effort only.
