Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122B46447
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743869644; cv=none; b=c735R36vPnsYZQvf6sTC7IcGYkDQ+HRQk+c1bn1CsOduGDPn2sc3LoRNJ2kUGk5vXBPx38fEHGuwuyoeOmg0pREfHFRzUfSDoSEw/HYb1b9HDUZo7V1e9UEKbkvPO/1SvPqcSHaSKjYJdO/VIgIwyxGx7Yn08WTDvxQpJYbvK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743869644; c=relaxed/simple;
	bh=Tpkj0RGAL9iSmeNAbvzJiJ2xkQp5uaOhCpkhtlpXqJU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QPeOdWU8/1qbdRdYPntYICmHnH/lERSIU67IuMR7a5GkD1IyKbqGkoeocKJgUCuG3FcCfDhb3Ioi3aH5IPIIyEiUFUA7Ib66Sy2r6qYMIQqpO+sGS3b1HYDBwVufO7G/4YgsBMluYccWhK1yNP2gBjPL/Q3qntUNQeHzEvuuR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85be9e7bf32so676431439f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743869642; x=1744474442;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t24w7rzlh81BpA0JHiadH15WzwRGTgt03/zsrff6zEU=;
        b=jEiZQOIjJQ++Bmsyc4cd4Hn0f8qAMZjqmox+TXExmSaZCFVRu89lhLMpE+sboRgQni
         43u1V7wHeSmJhR4vxVfkrQJxVuD24VnpBVFvSZPC8v9U4XrbRj3Hkcha1liK2oI2sJOk
         A0p2ZhBxU6btQc50WphIY3HdR7r2x/DlQayzsg4ldvkMvGDkg0d9Y4fljAchuHPdSAve
         kqVVT8uVDLpP/xJMb60mFqRw9+Hm6JZ+yntJ7FFugdG02/OqGUZ+q7/iT/CwBPTF3tjg
         TRiMp1Mm92/RWW1Ubk/Jp689CXb02799cuZ9rLzaz+Rcnk6XBt/C87y/UHneK8tkuSdm
         SaIQ==
X-Gm-Message-State: AOJu0Yz8r3Bg7vYVXUuox4JeykbfWx8DuV5zs0lZJ2q4CNs28r9PQr8r
	Y+3i+9Miu0GWidehK1opAxFJYN7hMhtTpGwWyzAkJnKyaADn2sKKVb1j+FlEGfNEURNyr3hXBKw
	3zAbk2AXMZxuwq2wsyn7ZOkKpZMBZH/YkWLFutc2Er7BZ6FcAkyrkJhQ=
X-Google-Smtp-Source: AGHT+IF/k8ROTAcalVLpqWibZko8GmEKah6XSD0lrKHB/lEISNuHeYW0z5VeDQtb9KBfjmHzP+xShOr+u9ECtUEIVhEQYvtYQTNg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:3d4:3556:741 with SMTP id
 e9e14a558f8ab-3d6e3f6558cmr78556065ab.17.1743869642200; Sat, 05 Apr 2025
 09:14:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 09:14:02 -0700
In-Reply-To: <67823638.050a0220.d0267.0040.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f156ca.050a0220.0a13.023f.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bcachefs?] kernel BUG in
 bch2_journal_replay (2)
From: syzbot <syzbot+a3885f6d294f83923567@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_journal_replay (2)
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ad26fc09dabf

diff --git a/fs/bcachefs/recovery.c b/fs/bcachefs/recovery.c
index 71c786cdb192..e4a538de0943 100644
--- a/fs/bcachefs/recovery.c
+++ b/fs/bcachefs/recovery.c
@@ -183,6 +183,7 @@ static void zero_out_btree_mem_ptr(struct journal_keys *keys)
 
 static void replay_now_at(struct journal *j, u64 seq)
 {
+	pr_err("seq = %llu, replay_journal_seq = %llu\n", seq, j->replay_journal_seq);
 	BUG_ON(seq < j->replay_journal_seq);
 
 	seq = min(seq, j->replay_journal_seq_end);


