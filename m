Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB171A23B1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481506; cv=none; b=QLN7nbF2/6Nr+aGqzqjaNOSQwaICy8bIsjquZbeM5MrH6Ol7gcFJzOrcXxOENYK/He5MLsUpd/STiAIJSkNU6Z/nGVj/ihR4vkqYJB25lyAhNCBC4yT5MXXd7u/JgqGXZx0E11uHcYTuXRLyv5EsKWB8eYx2HhF5UIZ5K6dKWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481506; c=relaxed/simple;
	bh=81euFWHoAh7qxAJHs1GiaGfaGV5oOo+tWrXLZyBpJss=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DBtL+aiajpGvqFS//yUwiz+MAEdUdYLBr7KtvqREkc4j2G0Yu77tqb77Ayq5AzFZHlS2NiR5yPxSfXFWUPotxbOF7dj5bu9NvncFN0PGydSWjWcE23K7wbM7uBFhhjP17uD9oBYsbQ0ScdI2IHyAMK5bvfgh6IteCbeg4IcwfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so35196865ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744481503; x=1745086303;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5ozW3j2JqPUNfDIuswZq0nn0PKMl778YmPYo9x7Ik0=;
        b=Io2DDcxPq8JkVCTegFAoDu/rV16xuVxMqpHE/LZbAbd2RQsWpLHprvb6NcLqp/Ogei
         lz2avfbCR/38+zCZhdJAAfqf4nc0Iw8iP0vRBjHVOJnL1FUkjGWuxQOKh9d4jU/K3Sdl
         K54pT6nXJlhqrGjq6wIbfP8IQN9dwJUnkozW/ibZQbaqmPVJCHTEklkq4mfe42Irosw4
         9mAdsQeJ0ltU+Ee6q3RdcR4lnwn7a8KXnxZnP6fKKHigoCI549dGPV0wIGOgR9nJ9/sG
         U1hKGaqI4FMu6llDYoRVFZ5MZfzsbmkalhIw0AMod4whgI6U2bzItGdFarsgMohssVy+
         VmRA==
X-Gm-Message-State: AOJu0YwcBh/87VLAJjeLwZ5m3Cb2BD+Z/9KtqX2IHtvzXlg1uuJCoB2v
	nthql70GvuSaOVkNCztt1oC1x4+hmKSNUfUoMtP72mDM8Bl7YG651GP5L3NRV0aoXv1NWORMlku
	uz9brCZWicWpK+fRiEDHxPGQNbdyzBUkgZ7TXtaJOxListlLauxGp19E=
X-Google-Smtp-Source: AGHT+IEfTz0lElvM1yXtz8EFQeUWU5wbtZ+IXCawgkk8CPUnfMjQxfQDYzoapIlEsPhHPAK7BmDtx9Y+/srs6k9To1rkZTB9/zF7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2f:b0:3d4:6ec8:c63c with SMTP id
 e9e14a558f8ab-3d7ec267738mr69975845ab.17.1744481503526; Sat, 12 Apr 2025
 11:11:43 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:11:43 -0700
In-Reply-To: <67f50e3e.050a0220.396535.0560.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67faacdf.050a0220.379d84.0013.GAE@google.com>
Subject: Re: [syzbot] #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 5fc31936081919a8572a3d644f3fbb258038f337
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5fc31936081919a8572a3d644f3fbb258038f337
Author: gshahrouzi@gmail.com

Another test with earlier branch because of unassociated error popping up:
unregister_netdevice: waiting for batadv0 to become free. Usage count = 3.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 fs/bcachefs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
index b79e80a435e09..788e870bfef6a 100644
--- a/fs/bcachefs/super.c
+++ b/fs/bcachefs/super.c
@@ -1757,7 +1757,8 @@ int bch2_dev_remove(struct bch_fs *c, struct bch_dev *ca, int flags)
 	up_write(&c->state_lock);
 	return 0;
 err:
-	if (ca->mi.state == BCH_MEMBER_STATE_rw &&
+	if (test_bit(BCH_FS_rw, &c->flags) &&
+	    ca->mi.state == BCH_MEMBER_STATE_rw &&
 	    !percpu_ref_is_zero(&ca->io_ref[READ]))
 		__bch2_dev_read_write(c, ca);
 	up_write(&c->state_lock);
-- 
2.43.0

