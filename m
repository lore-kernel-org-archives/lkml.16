Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D85280A33
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765086; cv=none; b=Lqj3EBGwJxUbcIdU6K6qAOdYUan2q5VjEoNARhevTf3U34pTcei60LNNWldkMrhHKPcJ0zgM++4uT5qchQ2yCxD24SipajrqprlvOJruW9FZhT4NNAr8+fZfkCVjM/ZhvVmqVmxqmHZzZkoUASINlcJbqNc58jTbDuVbL2BO7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765086; c=relaxed/simple;
	bh=VwZEuoMNwZrEk53NaHcuMXlypeiTHQxbfLfDbcCg2is=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QF+DXkHdXZFOVffDj7ZhOtuOhLitaNTCFdzNpW0TdudR5DJsRalRENSxq9KSkpNFC2CkvW5z+quW712ixHVeZDiO4SjCKjxb16ErwR5hX/NzSldsN3LO9pzGOG9qAG2kEQT5AwJT1Fj4j+ClImHwylX5hn0VnRM2+aDYaNkG88Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-861d6e340e2so514106239f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747765084; x=1748369884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kz3fMhLhUr4UywHSrROR0nSmPNcWcTC/GVXI5xlm1mk=;
        b=CwIktO+vKtg7ew4qBZGji09cbitiNfu1Ssk0qtlNEvwACaDKjVkZZoFslUNBxmMoPp
         ayD4H/StGXZksRzEy1g1CLJtxRLXwWmUe4IZWJHAJ1rIpuGFAM9TetRR1oR29wLxHuWS
         ldfeMWlVyBCnjuTLz9F/tJhvx+aNaSh7syG588HPQmDMlrzgb5iW4hrTcWtRprodrwqu
         8Lkwg6flOGTqDlkBw/oITPdVhc1nhRoVcjMlwF05hc7xB+nUoogLRKxpIykWKPnhkTvb
         zEFzIeEt2THW87lywNqCQ2pbQQas4H67I5oUhRs2O0fjA2a8HFEEryI76jBw0XbsaXJf
         0zpg==
X-Forwarded-Encrypted: i=1; AJvYcCW18OiZIBHc+xcKwoOMkRqdXG8QRMo6Z4gVR19CW8Pig4CxBb0PjZ4JqP1mwJ6yXlK9a6Ipoe4DOeSVcdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9tmtCSjEkoP7CWgwj1rP9UuiZNgkzkkSXOG82c0Qt6pIGMzq
	OrdmrgIzhPUXS6Pc73hKvrX7BirnfAvq+YPHCK8ahRhwyKY/sK5wCh3Y4HzwpFS9ymB0Ypk6y9A
	n4G14nrB1BsfflsOx+t8Whs8ok/3B866N15EPy3s/dTi7hOfKJukFvsrwiSA=
X-Google-Smtp-Source: AGHT+IGA43rDwi+YTetDFxJCxhATL/2pM2yY6PsaSQzQ1maeiT3JzsgHswocrz31lttVRNWZFnxo1qtnjpL7ZazuuEQ2a0EPHWLo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:da43:0:b0:86a:2523:a9fc with SMTP id
 ca18e2360f4ac-86a2523ab62mr1508655739f.0.1747765083742; Tue, 20 May 2025
 11:18:03 -0700 (PDT)
Date: Tue, 20 May 2025 11:18:03 -0700
In-Reply-To: <aCy60X1I2XaRyo18@mini-arch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682cc75b.050a0220.ade60.09c1.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: sleeping function called from invalid
 context in team_change_rx_flags
From: syzbot <syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jiri@resnulli.us, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com
Tested-by: syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com

Tested on:

commit:         9e89db3d Merge tag 'linux-can-fixes-for-6.15-20250520'..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=158f32d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=b191b5ccad8d7a986286
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=116b32d4580000

Note: testing is done by a robot and is best-effort only.
