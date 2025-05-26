Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A71917F4
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259425; cv=none; b=oAKldhurAXvO6VaBghTdIZWixAY4fbFlb8SG6d11rhWUPT/HUq9GOy8QKHIMEGmSiTxviBd+UtZw2GheubT5kqneZiyEoXSkVhNQLpocLe5YTrGZs/j1/rLi8z2xNAys/9u0z91Kn2y+I/cVJ4W/1fOfsgQDzC8U+QYK2Knn9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259425; c=relaxed/simple;
	bh=PBP4BRHa3zQlpTVFq9T8QfgQEs8bqvS+dL8cF6PY40o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Xp8hgDTeyIMVIg+Hn6zZZkx4jqpnCVvkR08vpdqQTroEdzfOEDKSaPYMy/Xdei5v9uhknM9iq5cq1Juwvf7Ml8njPPSFKhWzWJbG8HX5nYSPjSrQK+rUWdkri/8ql+M0ngsexrL1FCGEIHBr+qv9iN3Lbi1Ei0GtZv+tcRjvqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b3a6c37e2so202125939f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259423; x=1748864223;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvECZZhMo/HKpBAjwfYomPTuSxbG9Ek5XgXDE+jfvn8=;
        b=mz37X3/7RH1NxNiMRrulvhoUmEJgrNeVlS8NYyBqygb/w6KFQlw9g1trBzqEflaQMz
         x7bXg/EmFYZJohkAHLG77nQSutIESzt2+D74JnASAL11FotmaNKPRIm06XEM9+w/ln+b
         +Wy8S3do6lkwdKvel+E8QchS4yrd+/IBzt1/MNhl8xgnmM/6/BuT8lHRsEbBzuaKttgb
         uczb/zIAKz1mwN+x264QhV8FasG5hLWBgCT53DpZt1B+Tla4i5b3Yovwifp/PtePI0xZ
         P5spxCo/wLpo1YOuJmbAvrXDZGIz4sOQTAU5dRtWtNHZhPQsEHLi8I/00f1jsVxtn5xN
         aqrg==
X-Forwarded-Encrypted: i=1; AJvYcCV2mihY/bupsIQCtj6NdSd1zGl6TpFUgXsoNdJpjPOXF5rqrwyrDKRn1AwR65ZI2T2C6Dl+ZTMmRo8r1us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28tc5jn48AmumRHCdYvcg2wB8FPKkrDWpLQtCUXa/dfLeABMV
	ZfeaifW+XdBe9pZAPSra47z47EI+e4mK+/Rm7ncPhLe+pvzEe2MStmaQ5ni8mjhI1Vkmv7DIPMI
	tcLz8oPjV9Y4X1sHYvDAz3Fa4qsdUcHCsH+uRwWhIYoPVEk1OZt3ABwymhSA=
X-Google-Smtp-Source: AGHT+IHcHmAxV2OXMcbS+/EJq5tl+Fy1ptes1d6BkrDL68ToRQ/TYAPnfT2LAtjnW/vGF2r33ryvgAxcmpAbTuffZtzd633s18AY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:379b:b0:85b:4ad1:70e with SMTP id
 ca18e2360f4ac-86cbb8706c1mr1064294339f.6.1748259422753; Mon, 26 May 2025
 04:37:02 -0700 (PDT)
Date: Mon, 26 May 2025 04:37:02 -0700
In-Reply-To: <20250526105115.2345-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6834525e.a70a0220.29d4a0.0804.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_sock_get_channel
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com

Tested on:

commit:         d7fa1af5 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16fbe8e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=0a7039d5d9986ff4ecec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=170e5170580000

Note: testing is done by a robot and is best-effort only.
