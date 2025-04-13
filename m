Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8D2AF0A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744524665; cv=none; b=LlIR9Ia0zlYqpcS8PdiPh9cfuLp/lQtxpGeW9ucijN/1DhuM6QD63aX/ecF1jAhObr5FO+mAF8d9dl4Qc3F1UD7p7cqQ91z+mHmSUyJ3tN0Dxakz/iLOhopLZL/TFcH1L4bMZIZ9hvg+RuFV1S0y+aFmtsfAqj+ZQiZqBM7jTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744524665; c=relaxed/simple;
	bh=3CW885UrRd49s3Mtq+okgODZNGiYOaSazUc1GCL3ieM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b+f+98HkntNR/62h6agy+ax4SZm2BfouUTITN7QhyYfrxSdqyBmbaITgKQqp+v2ipwF31haf0qRH0n9+hrOqyl/GXsD3QyzLSRrJ4gZSe8eoVoHGNI4VqBUf5uTUQ7Mqmxl2ra7NCq2ctsMndFz/Mj+r3t3PGGrb0BMuAuMAwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85db4460f5dso658605639f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744524663; x=1745129463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aVy2idkT0bZknLmtVdrbypfj+CYUjMRtrGeuucY6nE=;
        b=etcJNR5vjcjXAIVjLneIk2y7JX6FVsAI3cZgof/whHXeKcUil/DziMp1M0tdwEShpI
         AXSqNAyR5Se81gTSCD08wmwoHaxLobY5aLqxRM+bNl8K1ymlP2AU9vRYJz8YXYZE08Pa
         B1jFF8N/5lmi7xv4rdTFkg5pcom8qq/fY0h9TJxo929zJSANiHtygRBbZ9YNdwuzk2o2
         GovUhe6DOy5dKbPtrrSUSH72bJ9ybeYTP7IjNTCS+37Bm7ntjN03fcMXey+3AHabTH9Z
         PZivfIT1LGlVDPWrFeoaqkUaDxda+yBGLyJSU3gAiO4VQf5ZOA4Oiz2/2F8OSDocNx21
         0FPw==
X-Forwarded-Encrypted: i=1; AJvYcCXmKACZ7OPZG4oUmSUJHnxUrZYIArYdzOX7n5JOQBVuSrzYR/9KHAgoBTWb9Y2QsVrz+8T7Ftz/A3e2EFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KZ1W1XFuRmWIRMVXurN/ZLFe2/HCFrIoz92xbTKjZ6SX23Gw
	bpqp0rN11aiuEXKm/hAo0Q9yVSjEYZVIXcKsmViyxkrwH5+zPf9qzLxs51qzBzPBLjB7Fv9vyxm
	Uiu+JpW8RegrnrrAEFys1Nw2rWWpdZDowEPyOnbhuoct2KLdKVpBGJXM=
X-Google-Smtp-Source: AGHT+IG1o7HlFmWphpHCwr3oRFAl77MDJGYFVgaO3p8/7SzsKBM8sV0bNdSO9Yc1QR3mAYF6gO+y4g0MI+SbkW1GgFjAU9h3PPWY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:338f:b0:3d4:3fbf:966e with SMTP id
 e9e14a558f8ab-3d7ec265c39mr83529845ab.14.1744524662660; Sat, 12 Apr 2025
 23:11:02 -0700 (PDT)
Date: Sat, 12 Apr 2025 23:11:02 -0700
In-Reply-To: <tencent_A80EBA44BB6A33409E3D1B2E4B181B772508@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fb5576.050a0220.2c5fcf.001c.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: unable to handle kernel paging request in afs_put_vlserverlist
From: syzbot <syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=13009f4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a4e108575159039
dashboard link: https://syzkaller.appspot.com/bug?extid=5c042fbab0b292c98fc6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10549870580000

