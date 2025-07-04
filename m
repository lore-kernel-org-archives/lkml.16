Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404A49659
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751593809; cv=none; b=WfHKrrXwlg6n10MlidAxP6Cn+sZKAqmA+d6NK64fGHTXBVkHE7hRpxQidZ6hEkQOeB6PhnfhQ0L8mFZ2qiFB6A70mXvmuWcGBE76dR1RbkXcS+j/Ek36KV6w5miZ+7ALNg5NYciccNna2UncNKi6UXImnoRn3fToC+5+givk/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751593809; c=relaxed/simple;
	bh=Kl+6AgmBJWR2EQX6CWtGUTF/3ygHrLq+FO7irzi6MK8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jMShWOynWPrR6pos0JMUSqMenOM7akuyLaoQ+w3ifGFCykwJgDbswjVoG+Xybg07T7dx3tANcMxx+kYIwcxpAkIgqViK9onzWpbQb29rLqlIWqlljW2qQ8FXYxd7xdMya5HBtyNpaxrOKfG14tFJkFlqw3rLJjA0g8LAiUXXqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8730ca8143eso138973139f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751593807; x=1752198607;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Cf1tTY9xmTPLbBJVuKKG+7W2h9yTt4FP3zxuuj6B0Y=;
        b=Q/HyJ7MGIrS7Fs9fnNEo/zN58Bq8eCSbDv0c0Uki8s/ByiMxWnSdNCkDmj42gAYHib
         rnk6UE/8wbaVoX+ZN24cr3vlKu0QNUtReKdSQZEdiV7ct9jDdqok7cO6nlJXw1dYPTn+
         IQbxIPIwU1A5QZZheDSJjWY1w1F4C3YG5AVkilqbWfqRolcFlCHZ2hfdfHFjImuF2wW4
         Oq0LpqcDV0PpU0AX+SEIhoDEtIrZ6ZXbUF0TJSVzNL3PeZMANRDVg29WxZE7FkSF7w5z
         mcqAlJJlvE+QiOWxom+rxu473RnwvS0cbxL7MdSQl9AZo9QSEEoeqfcrRoZ4ttKhKsEM
         Pw1w==
X-Forwarded-Encrypted: i=1; AJvYcCXqcrfLhXVt0pyQoLNYYIiC963Od2GxBEefxU3UO8X22E/rZPtRWlmTYhpuHSdOB2io4RCkY8lOqdGm3kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hs0VW6ZnNs7o6quemlq6o0yI2vqbGdCPnCUIRBt/Xnzuf7Eb
	9JYageMlbdjQanBWrLYCARm37WAC3rIK1d5diRrbXjUo4aFUmAItBt3FPiZS1n09pmBoDW36jfK
	n5+5Z+plFFUaYOxhHkfY4YNkhUx3ROp66ByXKNam5ZG/6C5iFAjW0sVRTm4I=
X-Google-Smtp-Source: AGHT+IGFC6F315Oykl7IvHFiq8WTEc5EAwjIJIfNjvhdZYz7rNOrw9UoKsLu9K4TDahSes1P6kL/8pm/wLxn/GUQJrlG1xDg99tR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c52b:0:b0:3e1:3491:e873 with SMTP id
 e9e14a558f8ab-3e13491e9d2mr9061615ab.10.1751593805854; Thu, 03 Jul 2025
 18:50:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 18:50:05 -0700
In-Reply-To: <0f31cc8c-3fd9-44fa-9385-0f4bb7b890be@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867334d.a00a0220.c7b3.000f.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Read in __ext4_check_dir_entry
From: syzbot <syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com
Tested-by: syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com

Tested on:

commit:         b4911fb0 Merge tag 'mmc-v6.16-rc1' of git://git.kernel..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1695f770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6ddf055b5c86f8
dashboard link: https://syzkaller.appspot.com/bug?extid=5322c5c260eb44d209ed
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=160cf48c580000

Note: testing is done by a robot and is best-effort only.
