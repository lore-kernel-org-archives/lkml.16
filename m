Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6327510E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684636; cv=none; b=Xldq+wwcZdG0UvvS7bUxbU+Orus5ZJp6dskLwGR9XbjhvkMAeh8I8+gEX2Cjmi2kTLKh/aBELVmSuvAM2z8ik19svc0ChZTCbg/biALFE9yIUH9gWuR26cPf8dZXNWaftJFkH5V6kwnj5jbDc+1lGqJseD3RJczWkHR1l6u3MgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684636; c=relaxed/simple;
	bh=1Z36gPhcHiUKZr0aWUP3R5ZQhicwtFJbH1yrNqAwb7o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U3wMI8qr6iCTEfUe9eCeeeCSsKkVKMnBwIK0mOa/XSmdBAPB6VypD/WrdKC34ctT7E+gOdJ63998N8o4MWrajLs3DQstbVeXl34hHUJp6yXpWH1yWgJvYgH8wNmd26PLoOLlOJGAC1vpGx4TXa7X8CWx5IvUtC+TVEdkWReY84g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df4d2a8b5eso14469815ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751684634; x=1752289434;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AizbY2jpwrR1fDC2uPxzJnY/PeVExfRtVkCsyTMymAw=;
        b=QStGsU8HIpjNT40S1JJmqpPxabqN4T+gZE8kno95byVhlCg7bpPtIKtRijMNOHjpJC
         IgsHi9YNETLc5Tz5HQiMJLr8PIUv3cUZwMvLl7Ui1fFUcOteXN/lJW5Z4PnhsbefRcVQ
         wK5MgpF6HxJ58g+UjyszMvFBR5RYli9GMHU5nonh+rOvTNrkK/937WPsROlECQJqljNe
         0T0uoqqHl4wbaP+AyY3VMjkmfF93GuTSTgIDJn1uvkxB4Wc9/tec8pk0nrRFhLnsw+Ob
         k71Au7hEJiJmYQr6DbEmICtuW8p1JeFhMFoakBK9A7UBfWkC1LW5JK2cq/TDj9ql/yLZ
         wXrA==
X-Gm-Message-State: AOJu0YxL0iAK0ldNoFg2UlyjXPIN+fpFbPhJ9k30KTwA/58tEL9SjayS
	nW/eVPOz8vbROpGp59rb1UxyOFhJnofHBmAta4u98Gnrr4z/U2nrQ48VmGhv2TnelaG73TyoUeJ
	XXMalm9IXwZ/t2IdyYTlKXrWNsziL05tMHHfM2aiNZkqhKcXi0GtZhkppStU=
X-Google-Smtp-Source: AGHT+IF2BdfUCSep8UsqYg2TffqVwJqUHyN2ML+D3Vlsh3MRRXGyTt9ZoQKRrrpAjkxtF9NVSem24os4JzWnX0W3pV+UBo5JuZKL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180f:b0:3de:287b:c445 with SMTP id
 e9e14a558f8ab-3e136d0da18mr33950215ab.0.1751684633873; Fri, 04 Jul 2025
 20:03:53 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:03:53 -0700
In-Reply-To: <67d5645c.050a0220.1dc86f.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689619.a00a0220.c7b3.002b.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
From: syzbot <syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
Author: ipravdin.official@gmail.com

#syz test

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index 369c7d27befd..ab460cb2c9c8 100644
--- a/fs/ocfs2/move_extents.c
+++ b/fs/ocfs2/move_extents.c
@@ -617,6 +617,8 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
         */
        credits += OCFS2_INODE_UPDATE_CREDITS + 1;

+       inode_lock(tl_inode);
+
        /*
         * ocfs2_move_extent() didn't reserve any clusters in lock_allocators()
         * logic, while we still need to lock the global_bitmap.
@@ -637,8 +639,6 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
                goto out_unlock_gb_mutex;
        }

-       inode_lock(tl_inode);
-
        handle = ocfs2_start_trans(osb, credits);
        if (IS_ERR(handle)) {
                ret = PTR_ERR(handle);

	Ivan Pravdin
