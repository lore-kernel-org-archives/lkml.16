Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60C1E5B60
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686786; cv=none; b=nt1o7nb1wh1xCQblAIYf/ahsDjAPGBY5MYPZnY6rr4kWfsA61GfsPI489a9NYJ7AzU7Yazd2a7YlPHElMZsmn80uAg+aA648UfINWsA2PzA4Aiy4wUStq0xptR4B3acFpd5vChwOZDKzqAokI0ENo0nf7g1dtxBnsWOFT23iwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686786; c=relaxed/simple;
	bh=e1hfva+cetv23bGTTqWa3K/1jQyxFs2xFn/QL0L2K9E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JfhvycVCfNCR7c7HfVC0Gh/GGOYCGzHsfaD+upU+RkVycV3E8nrtxFYN3s9ZGZRffQ3m8qtp9RzFYH6AgSvzLD9vLyVTtAwFu1WZr24ziEb8aTKtW1JfbWaJZMOIwb0Gu9THG8qBtMU6h7JX2N5Xj8jQYIunqC7n/Sq2KsGRL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b418faf73so857186339f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747686783; x=1748291583;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+MRoqLeXUF0/EaBe4FpNgtC2KPyZbvlsKObRfqCd5E=;
        b=wA81MMhNPDL+liFaYsFbSAZ6WZPJ5eoNOrxEmfcQp1oC2ijL+nJ1oRPZVp0eQLBwxn
         6PFYuksEe93vV0cNoPO44vmNT0VcOdIaP8hlFkGQ8ajctAoGBD34RXEToTgOwQZhpUOl
         7goCNLl5g9NwuV1UXWdZeRAlt2efuGgWo7blRUeRu7e/LrbOlaJbcZFldZrfpiBm1WRQ
         hX20TWAwCMjju00XGbC4ewZePFK7JDWlyIhulfTwu3rNZj9+5MGmN/kLemXrahVKaqj6
         B5OY4w2FZoe4rjzq5Ytc7TDQOuX8/9cxjTU0gzKUgMuz7xQkFGT0cDfCm5A2FC6QsHq7
         W87g==
X-Gm-Message-State: AOJu0YzSQesKwfx6IzhYyIV0yG0uarz/faGyczLBMfY00vfS//nILPeh
	Ya4S0iS3dw/tnExZ3VkOxFTNwz18SM6/vh1lbEq6JX98D7l4LwOKMoj+6O0Lb7odKqcu3DYSayD
	vAnDyF8VtH86n0DcxRg23B+/e0GrkQGb7t5l0DCY/cz2MOhlWX6hgEL15TRc=
X-Google-Smtp-Source: AGHT+IHupsqRmekEkzZmlMA8WVt11I9nj99RWwh36kCBLmf+TCMNmJ4dWGu5HeCMBRwgDF92+/UR+aWahnyTwywkpua7u16D6AHa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4186:b0:861:722e:2cbc with SMTP id
 ca18e2360f4ac-86a2327c37bmr1836835339f.12.1747686783712; Mon, 19 May 2025
 13:33:03 -0700 (PDT)
Date: Mon, 19 May 2025 13:33:03 -0700
In-Reply-To: <20250519114357.2290474-1-n.zhandarovich@fintech.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b957f.a00a0220.7a43a.007d.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: uninit-value in usbnet_probe (3)
From: syzbot <syzbot+3b6b9ff7b80430020c7b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, n.zhandarovich@fintech.ru, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3b6b9ff7b80430020c7b@syzkaller.appspotmail.com
Tested-by: syzbot+3b6b9ff7b80430020c7b@syzkaller.appspotmail.com

Tested on:

commit:         a5806cd5 Linux 6.15-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15815e70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8610b3b94c7a5632
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6b9ff7b80430020c7b
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10b331f4580000

Note: testing is done by a robot and is best-effort only.
