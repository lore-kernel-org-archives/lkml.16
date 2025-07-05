Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0118C31
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684764; cv=none; b=WluOiYsijsdc+ktXzU2vhzZ5IL2KRqAM+jBMy3uhL+6tfuov7f1zvOLgOtmsrcAuPTbNGGaror3eQU5faRs3e+9RhkMZw+AV1HNyqsfEYrMxjj2HmlJaVPCpGWDhdjYvVztM1bKugN3le6GeJaTk3t4unDQJySvibHj07wJ20fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684764; c=relaxed/simple;
	bh=MnhKa4k0/CcQg5nk17F9gHv6DtI5zwy3vpLR/50PV5o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BUhwko3E1iI1HPgntOsn8stKpSgAWQjvV5vzzyrPI/Umy/zfs8l1r0aF65XCFq/Gbmcbk3l+VRmIdSYaBZRZvwNnQfjyYp2M7SzuUys7Zf+w4om+lSzM6V+q7VQJMiCSyf/azZCjQMyS+MYmb1ORPMv6tv6UqNU4YPDThldc9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-875b6256041so127263139f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751684762; x=1752289562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0M7eAxQWQMFn6kKg8bv6Zf4RsGe5B9nQ0q4iqJyMcc=;
        b=dOqBdZzcpSS5nNFrIn8l+a92hQQulnEr6gaR0IgxPBQwFjyUwXnBuerbO9bZ38bAp+
         9o/zRxyHV7azXWqN3IvyYaaU5mqVjibl5tA99Yeswjf5PMLd8svQJHbef02KhESCLuHM
         jxf26ZU75LDWv2vnOUGpjbj4gSPsyH0x1BaTFLX+2JiC0Hc1gtHQXhl7HPTMB2cj+AgQ
         5FTyXYcEpSajWDh843UVIF2667O2z/qB4xBOB22Mr5gF6XRWykiM1f+e8048J/urLLdr
         7arcGBVg8Vu+oDxi+X8Wq7zmit957xW5zzNrZktZQwfFIxjHnu5TnGzqlBfcwzGDvnNj
         WAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz/YFGpbU6WnS5TqrjZu38WRu9iUPSHH0FsYlwuzAJ2Mf2x9oC9Ts58FBCxk/2x9ttc4NsKdDPpaIjtuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEEgPBzQjz+udtJ9jmySdf/zfpttBYnQXGv6U9VEV/XclgY7g
	UC4fGFesT3xjck+ze7T/qTu683AtX4W001XmBRXjTqMlb+mmNrLvBL87d2tCzhW+WGu/gMcyATg
	HzKU+WTzdDgUbjkuis2vkuMAN+xLG5vOTVVwWsgK3U5UGrXjjNcBOK0k4HK0=
X-Google-Smtp-Source: AGHT+IGdQ4uSwLjgxk3LbTRakfTl3iVIxArs8rto6VwvTLDLTM1p2Hs5fS5Dr5oJgYWoTz2k7uPEVweoGeRlme+xp8nbpYo5NQuo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2513:b0:3dd:f338:6361 with SMTP id
 e9e14a558f8ab-3e13ee967fbmr7690545ab.6.1751684762621; Fri, 04 Jul 2025
 20:06:02 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:06:02 -0700
In-Reply-To: <kl7jac3bqyd3dz4uj5rp3dwam6rdbegvf5qahgn7njdaeodndj@aq7yil27yawv>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6868969a.a70a0220.29cf51.002d.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
From: syzbot <syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ocfs2/move_extents.c
patch: **** unexpected end of file in patch



Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd0cea6d0f67318f
dashboard link: https://syzkaller.appspot.com/bug?extid=6bf948e47f9bac7aacfa
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f8d48c580000

