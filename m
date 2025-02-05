Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FDC15199F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754044; cv=none; b=D4hgupzO6PsiiZ+Y0RBA1nTnx2wDGuub5iHkAcKTYzKhq0tpuqWw2WnkTU//CYYO/PbPN75t+Rb15asKvkymzMUI/PW/WbRn3YtpYoG6K5wWt4Pdl0oUikvaYFDL5OgAwGHvhOhOdlUhaHUyBBd3wpmunmWSKQoCKLUgWMWjth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754044; c=relaxed/simple;
	bh=U9xlQvs3vZ43LUb7pLzFdwV+nff+x9IIGFoNfId8SD8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ES5l2RX6f+hGL4aXtILl+W3fid+2hc7K+Tx9Z3GK52qGVkrcjfmzZMO5MCtZSG3sk6dM9O/BAo8vstBP+F8gKHfScSEN3StM47Jerhk3MigHIjoRIbXpuNCvdpQ3f60NpIYJYYLkrqK3hzKS0BPzbo+G7ntMJL7ERbx37lifv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8cdf1898so47770485ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754042; x=1739358842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOlX4063uisEpRfX+ZxMDDdt91cgBr6GLeCMQzem1Ew=;
        b=CJrrVD/msUiqvPUjc0sVA9IXNSzcSXwmnbqbiSybuTBTkPdWGoNUGo59AXALo4kkT7
         U9hcNLdyhuZd3q3KyfMOt+rFr1CDeonCkvfOvw1eKN+UpKR4NouH+RWgEwZAhY2m5twc
         LFboWkiGh2HKiAlDcqr3DQtyU5c5+t7tgB8LXqKpd6nk+oj7WUtdNlbIPKuZdmK+8pZo
         XGmQtiZ1J1hLF4WUHcuIWuenhsuBISXND8FbWSXz6IAjjubfCT3msjxqIPDIV68wqWg/
         p23k66hDxJhS9SV6D2wX3R99KewSuiOy35h6o/SFrPrflGuILeidTJGoOqS4D6HRMQuf
         +RWA==
X-Forwarded-Encrypted: i=1; AJvYcCVL8Hyv82QaMMtKoIwTGc6bO4CTRcSM6NUxmtH3RexhsLDSAl/KSIJ96RdQR98avkoZdaFXs315TOEvsq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMEd4sP/XZH9YDoOAxamgb9uCfgqDxGGY+U7Vh/l/0+9nCGgt1
	FariEsvWvsMyndKqB/C74vrD2GGeJh2ZHMDamipSP3WovyiFNHT+nmt/B1yWgEgHnLEZloGBql/
	t9WuqTllFnE+/00EFm3kRM856zQH2lp92TtakwRL+QL/qknLBOcQSVp8=
X-Google-Smtp-Source: AGHT+IFcs+YUoFg4j/Bk5utC/gQsxKvf8BokhbxqhX34F6aK7iN5F46L3clRMl6BJjtLcCvy3g8dGplq3NRiP2ZafWuKyqWMaWSu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e8:b0:3d0:255e:fdc with SMTP id
 e9e14a558f8ab-3d04f917a09mr18235785ab.15.1738754042626; Wed, 05 Feb 2025
 03:14:02 -0800 (PST)
Date: Wed, 05 Feb 2025 03:14:02 -0800
In-Reply-To: <20250205105414.1916-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a347fa.050a0220.50516.0032.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in generic_hwtstamp_ioctl_lower
 (2)
From: syzbot <syzbot+86a8ab09a0f655f1ff19@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+86a8ab09a0f655f1ff19@syzkaller.appspotmail.com
Tested-by: syzbot+86a8ab09a0f655f1ff19@syzkaller.appspotmail.com

Tested on:

commit:         5c8c2292 Merge tag 'kthreads-fixes-2025-02-04' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12923eb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9bf890dfaf85e1d7
dashboard link: https://syzkaller.appspot.com/bug?extid=86a8ab09a0f655f1ff19
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=133f6318580000

Note: testing is done by a robot and is best-effort only.
