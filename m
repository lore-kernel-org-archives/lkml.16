Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D21392
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483805; cv=none; b=MDZmBTtHLa/hvbsR980WNWvxMi4Y1GNB+UfzTyzEUYWAI/xcuX8tESsQ5QHvoEAugBep/NWSJi8IGYCY1YW6aDHWBDW4FBWv7yFfuC4IVyzUNnxEx4HBc0BTvzBmTGLbOng6K6BR8W0a3ge/E00PNtlWFnyA+jRjeLNpTj5GGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483805; c=relaxed/simple;
	bh=nhafsCYMLV/1L5uDLM7a0dpPB51CKZggrbh++DTqtmw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q24t5ZXoez7IChqgyxeXCnqeDj7hmI8eLwTtZ4tHBX65ZqSmlPlLKPgxTZkJGGc8CDzBxrO/VQcoD2K6yJv5p0ffTAW5D9CTgcVNzauwkn9LobYyNSuBcFQah8jYMKZd2M3e06oSRco6dEk/DQrVoQ11OA6o6SfrCk3V4sxOjKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so24137685ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744483803; x=1745088603;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7VjZvJbW2uAftgn5cbXxBtcR3vdwZk8hVAwdnASbOI=;
        b=u5XA+cR5Xq8F+M1+omb1Kek1ptD583ZDEObTF5DeEqGzUS8efzveIbMgQ8YIYZAaTY
         s8dW20WpIpjNexr4jHV9YUNf56Oby59QKFM+HnmFdu19VSBJJpdhELL0xZh+bFELD1ca
         GH5JGemvEDZM4TqhVLMPjJm4JbwOPYuqVPwpHTNHL7GpeUJ7v+cbxt+oiQPSoRiMao29
         4bDvOxOIrN/d+fCpB2QK/8CPs7Llvr9YLvtuy7xk8rAO2BS9Mqy725/fVI06wpKVRoyf
         i1zsHJVqIKKtEdot0HwSDH9cSv5wvD0KayMxXE1NPbWSePBXi6k/mpTxl+du3OdOWTFp
         NCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1y/vYP+WDOoXQXab2Y28pTE63nadljJM3qTKlLzHOY0CpckF2NhR0v/68lHnZ+fDDY654oooBShp2/Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGxE2yHRCND2b5vbHZ+jcqV+XKpSCbYi9/45C1RQAEtMDMJ06
	XX1JFELEpbkzBkC6LoZFEtZaJzYr3f3/sK/IhGaSsmRwNlEkZ+0QCV4KPCKQVdNKM8SGulwWYQR
	eHk0YtyA3iYAmvnsZhDZAiUBrgqKKajXMwIgawAdZzNYzXY60ZWrA0mM=
X-Google-Smtp-Source: AGHT+IHrjKuFivMeX27xQMCIkAmOxVp9quQsUMQ6AVml7KFrAtT60UhEUyEVbHBisBJnZ5bL3nE9sW0P0iKRLhKrZNbJOPQAWJYD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe5:b0:3d5:deaf:b443 with SMTP id
 e9e14a558f8ab-3d7ec1cb3fcmr75275005ab.3.1744483803376; Sat, 12 Apr 2025
 11:50:03 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:50:03 -0700
In-Reply-To: <20250412181140.245367-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fab5db.050a0220.379d84.0015.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] WARNING in bch2_dev_free
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/bcachefs/super.c
Hunk #1 FAILED at 1757.
1 out of 1 hunk FAILED



Tested on:

commit:         5fc31936 Merge tag 'net-6.14-rc8' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=bae073f4634b7fd
dashboard link: https://syzkaller.appspot.com/bug?extid=aec9606169fbc3a12ca6
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12f21f4c580000

