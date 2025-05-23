Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C101F9F7A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989665; cv=none; b=WwywtHasr6T8dWKevcKRJE5HcO0Kh4DV6GZFqWIuDnFsfC6J7ScD0m1fZcj8Oy6lHt4Jzo3EL3fORpPlJ+O3xi3avnEGeoZb+52IQyvAeOMqaErbchL3cYb/FgGITwMs1b5jKMDtIns2QoNZ2BZv8mzH2DYUVsBD8Wp2VkmfMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989665; c=relaxed/simple;
	bh=RwBFzvr5ClAWxcrvKPx1zlMdVci5wYm7JBC1VOzXyDQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y05EdnkIu/StUM/W2z14PAmyxyae+MZ+URADLS4Lkm8DmRMGh1I/QNKE/w5J083jvT1wh1DkYxncMP5VV8YiSEV4+J0iMlR+yUTJZRtrlrXQOyUSPhs6I2tHkNSkE9cuPZ8U5A9lZ3AyWgW1Wxo8pee5YUmIiqy9PjRuLCdBHv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b418faf73so1549799139f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989663; x=1748594463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdEatDoKMv0fGdIX22a+IXF9Rmt1AiH9dEsocdY2lCQ=;
        b=dhk+07xGrIBVS/vOli9/f8v4J+dloUlhQk/1OXmRSJPFZwLI9NAoJwtFy+uIDxGAwH
         pIvHaf+gVUP2+Pm9/ANywMH3goTLVcmeMSgvVq1K796H+IFNOYza8gP0DGpT+jXSluLM
         aG5nHwGUacCU/5DmR6CAvD5UdzabQdcE2mQECz0lyA3NOtriKYWf91S5n9A/C0rugO3f
         81TdIb0otf+HZDEbA6+SkcIu9/8cz4RB5VBJtppsQ73/6+6Yx9bZGDIKsSbrW9bdHCHi
         ivDk9qvhP2R62EG5+3BGcIJAnqizDADnUw3xBeKF1+E9H0PhEna2De+P7bArYPZOkJfF
         EjvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdjP9pD3vnB1/6Z9A2gCQvl36MPj72PFCHDMWNnVAfyLCn37qFnU5DQoIFI1FUJ/MKMSs9qZgWAGYL4Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyggZ8peYeEb8faAJcNHfshKsZufX469vH8zP1l2E2Uoocwflek
	laJoGCT3XPfUe/3OU7aerecS4o5w24i01O9BpvhiaSil3JHNa4jhdf856azUfV5b+UcKywW80Xy
	YkVOhq23zMz4WfHFj96h04gK0Pg4Dk8QjqnIZJaZvFeiv1g6451Y5wLroXs8=
X-Google-Smtp-Source: AGHT+IEM8LAu9qrpPxispG0F8JBTigMByYILxjmPOLv3uqsAuIzegP49x/yj1EZr7JWCmKdV/CcEId3EVUJKvy47FDmZFl5RLEQr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6a87:b0:86a:24fe:c51f with SMTP id
 ca18e2360f4ac-86caf092e03mr284858439f.7.1747989663361; Fri, 23 May 2025
 01:41:03 -0700 (PDT)
Date: Fri, 23 May 2025 01:41:03 -0700
In-Reply-To: <cfa0f817-4063-4119-a570-5cbf91315369@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6830349f.a70a0220.1765ec.014b.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com

Tested on:

commit:         94305e83 Merge tag 'pmdomain-v6.15-rc3' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1302c170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11bf25f4580000

Note: testing is done by a robot and is best-effort only.
