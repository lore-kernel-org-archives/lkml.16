Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B93537E9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744523646; cv=none; b=CKi3cA8aAdO2EzarWaEm4GJ1qr1KKTQKBQxnCQwLX4PlMxn6MRDltub2ynWZgqMthIIJ8aM84wHjyY3NZzn8gIn/NLMM9Ru0AhxgJ2So5nVXDu8JVBLt7KrHhcpPlezPFwk3SvtoL0VLS7CsxWingQC97oABMOWCdVd1BAXnCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744523646; c=relaxed/simple;
	bh=Fs2v0bPPVoO64CH9hUvX8/nnTsemWrb+5K6WXdw0N6w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CVt2/Bzc/U0BbNyT0r/ARClQPF6p7pDBP4hK3KnuM6ilN4RYK1Nmgp1ndeFfdp8uoOw/8fx6Ql3gLxxSwiedYwdMF/kjonuon7o2RabppViSn6s+w/pu3YWezomtR3eJDPq2CpuVD3AuClvP4TPE4buCmPmBBGEc08zL02FbX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43c0dbe6aso65075885ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 22:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744523644; x=1745128444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTYAcllAejaW2w7q0lbWtTOt/qwZab5rMXPa8uy7hgc=;
        b=Ht8bBm+iKm0UqeNn9sVjKlN40wLT7mSV0l43T+2advT2wnRIp3nul6H+JE/FYLnsYv
         CseNJ/jePe6MvH9Zk8LHy9uGtPSCcmMzQwDRKi5jGnYClrGEdgBHkOLNWpiksU3Il/c5
         3VC1x33rjpm7WAm9TyrMkB3hBZPTPSZIZn6NEsmGJDfqF71OaUcS8Yg0tS9YrJRIoNuX
         LZxyTualL0Rf3WQE19HEGlFrtwFaSe2tq0rzHhs7pIFxBYdtqZhmoHSrPiWX5vAzt29M
         VstoIpzR3ULG5co8Xs6Rkp3xCEYvgcv0ze9pT7gG4lETbOxMTLBoxxn4/9chQZNpiB5B
         WubA==
X-Forwarded-Encrypted: i=1; AJvYcCVzDEFKiAkyufy9l5v2Vw3EtydhurykgFpusyS3m6H4/SsV7bKLYQYHhiUnkUKywE98s2Weu9LDU/AdK3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLwm8kjr0z3T42wopvxWDTdSVpOAxXxzObnF2yX7PKkWPbJnN
	pd6mcji/GWEeuR5be0HYQUkXasNte6bW5epZOGT5LKvnBYWStR+oqu7SOLY2w8YizmyaBwNLElT
	qG3m2dYFns6UyoRb2aTOQgW3DSpnw4hAsMvPz2gowze1VNgBozPp/+lo=
X-Google-Smtp-Source: AGHT+IEVh3heqF4tsZziqYAhLOwoqi10DU+m9TBkzy40VXstYGb2+JrgUrTZAxKy+DY5D6NuCCY4aRHkrR+85s/xxOKzoX6M4yqJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:741:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d7ec20458cmr87000015ab.10.1744523643763; Sat, 12 Apr 2025
 22:54:03 -0700 (PDT)
Date: Sat, 12 Apr 2025 22:54:03 -0700
In-Reply-To: <tencent_36256BBAA7BB3833A69E7E1B514B2B1BA308@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fb517b.050a0220.2c5fcf.001b.GAE@google.com>
Subject: Re: [syzbot] [wireless?] divide error in mac80211_hwsim_set_tsf
From: syzbot <syzbot+064815c6cd721082a52a@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         7cdabafc Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11f3d398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a4e108575159039
dashboard link: https://syzkaller.appspot.com/bug?extid=064815c6cd721082a52a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e49870580000

