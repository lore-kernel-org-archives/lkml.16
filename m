Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564686334
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745556866; cv=none; b=ofEmZ7u12kTqACGlb2Z9AD32ddvr4CJX4Y9Z2c3zfUBAroryM6WjPM3DHVm7ynCnDRXGqLyAkGgjHbvbHpL8MndrO9f3oBpJRtgkZeLyr1T+oXjde9SGC4app1tJFWS9/QALhUQvaP9DDkkv6e+gkRouYMdWdDOExbD/jQnDPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745556866; c=relaxed/simple;
	bh=FXOXzT4qZhFzYZwTqlusME8d6s2prRPkxrCbQKlt1qQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iKKZA6BuoqQw4BCQyfnJKkK/ioYZpxljyUtr//9IqMyfVsg9xQM4BS0pspkBiKbIhSjKeDpUoFCLwOTCL7KYgb5ucsIwh0ZeB4dBa0FlLdyAOtItBO1vMMsycKuEGmpPpSbVr63eOdu+nawYgXZg59WJlpku6VqyYCDw9jDx85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so20322065ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745556864; x=1746161664;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DS3nbEou4P2iGpRExoVX6nUcTVBdkwNtenUz4/IXWQU=;
        b=Ui+UowUcX28lYA78yHx0br79olxxIJUaIwECt3cFD/9wP1tRhS4671Sx5Bhc5Scq9v
         KgiCMUtix3rtpFnkgXUjSSIQNbtFbrhN0L/qp4UFLnwZ3TEgjbKbKcbPx+grnOOXzcFg
         /T497GjjAyI6ffTXJ/E17dZWEcVH+gwomaNMVuZHvpGFXyNkhGB7L1zFdT9nAqFqcOhQ
         yEar8u7tWMSIxmei/UH9nx7vBXKaHwvmodALAWMzbU7sBrfphtUqyq/mC9SimIlbF0p4
         wBbkz0zOiBHaLg9BzZnMxQJEizrEgZG8Mw11s9y+D5EQ4xkIpMXuu0KuG2/2CbBZZGME
         gKuA==
X-Gm-Message-State: AOJu0YyIqH+r22fRmfx/62ZTmVtt3qN/WhastGFaqxnmJ99qTdRD03Pi
	fDuSdMm/LcciII+DkiSMeRD5hoYROQfoD7h+ftCbtdp22QLPzLoeWG4656CrkDTnYGNGPSZFQvw
	2nTQxAr8K8use0XN6Tw6Eh2p572yfvYe31ukNGfhV48yypHfq43bbbWQ=
X-Google-Smtp-Source: AGHT+IGN6CJZXhbEB9UpDoq+URaZ5XPGtJ364x3Y+Ubyh0XN8Fwr0eRMrDJAZzKNULNFMKA8r0txcQKHqNO+R8UuZx/JNcinXQzQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e8e:b0:3d6:d162:be02 with SMTP id
 e9e14a558f8ab-3d93b5eee0fmr9204115ab.21.1745556864024; Thu, 24 Apr 2025
 21:54:24 -0700 (PDT)
Date: Thu, 24 Apr 2025 21:54:24 -0700
In-Reply-To: <680a45db.050a0220.10d98e.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680b1580.050a0220.2c0118.0c73.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] BUG: unable to handle kernel NULL
 pointer dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer dereference in lo_rw_aio
Author: lizhi.xu@windriver.com

selinux policy not support read_iter

#syz test

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 4f968e3071ed..3572b50dbf0a 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1044,6 +1044,10 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 
 	if (!file)
 		return -EBADF;
+
+	if (unlikely(!file->f_op->read_iter))
+		return -EINVAL;
+
 	is_loop = is_loop_device(file);
 
 	/* This is safe, since we have a reference from open(). */
