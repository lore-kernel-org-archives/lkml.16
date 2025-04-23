Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36528A1F9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422372; cv=none; b=XGmxdKG/TNnFeXPBIOeSucnIke1gzrxRJJhkEW1b0GwliduLTS5C9xAbw20KesINfNrzDuE3/hMurXGZGOGPtNKVA0eR5I82LT1oVU6FXoX/lya+4dm84mZP2MchbkQorbGtB3a8s6iaj9u5iCnLxXWNGWCf3UWSjhnB0DR4zZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422372; c=relaxed/simple;
	bh=b9MCldmDA/h5FP9ANGVDKiW5DFZ9EgTsuv73U19O+pc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lDwtSVlQL39oSWJsid7KkCwHro28yqU6gF9sqKOBOgAdPxH7BpkFwpKizN190GGDtWaKdAhcbtgJ1T9nAcGtH3lEtd03mzrgRPJRizg5jeaqYupit8TDGBTJqY57qI/dM1b+1DmiQatVmsQwZdNEbBQajdGG9Gb3mQS4MnLLUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d817b17661so308805ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422370; x=1746027170;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkd362/q2z1UAxcAa/GgKrwz2Xzk1H/o+cvqHhRxKG0=;
        b=LzgR/lM9xi5FmG82x1Yc66EbFVvyAAfoN1GXYaoHcyX9y9ggh5lRpNPebrL7HwszDx
         PZHCJs69Np8aco6SH56cNNOvkMwjmPuNEKf08eGKlgiwBTV0a8SqNr0zf+xSSOc8ThAZ
         9OWyaE/0dNVeutob0G/FXiJSA4LjdJ92vHu0zo6/st+kXSXAsD0KGSRDJGZ9+N9WjLlD
         5xhQGk3vY5cPA3r+OUTLQPdab3osw+Od9GEsmc776MH6DBsgyV3MrW4UmTRJTJOBgXQn
         dW9R4H+DQFDfo0Wt+/oWBKbSii5lUGCzYjtyFvKXaibCdJKAj6BuXeL6Q7Hhx3wthAnt
         94KA==
X-Gm-Message-State: AOJu0YzRprqlChAe3I5iJg+pHQk2aY/1xF5YirDWpiwzlNMVGESabXFs
	OmFa8PoGDUaHxtQM2niuJ8yX1QTS0oQXFLf27QHOMmxmfXiF81pZ86ShWFZ5EPevZmiCLIKfTc2
	Xgx9zMqkJOBpyzsyAbn0mVSr3K02Ynb+liKg95wSiY8mjUA/6QYBMaPo=
X-Google-Smtp-Source: AGHT+IEpuxwqtncIh+k1KwUA43O8xx/1auyWPrMQ3YgA9ywlHrLlTXY2jvxl68wp81V0uMEC/a7c8FYpEc4NyWE3oSlEyDJG6TWH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:250f:b0:3d6:cbed:3305 with SMTP id
 e9e14a558f8ab-3d88ed7c41dmr173161065ab.10.1745422370199; Wed, 23 Apr 2025
 08:32:50 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:32:50 -0700
In-Reply-To: <000000000000736bd406151001d7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68090822.050a0220.dd94f.01f1.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [crypto?] KMSAN: uninit-value in
 __crc32c_le_base (4)
From: syzbot <syzbot+549710bad9c798e25b15@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [crypto?] KMSAN: uninit-value in __crc32c_le_base (4)
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 614da38e2f7a

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/bcachefs/btree_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_io.c b/fs/bcachefs/btree_io.c
index debb0edc3455..dc00c5273ffe 100644
--- a/fs/bcachefs/btree_io.c
+++ b/fs/bcachefs/btree_io.c
@@ -115,7 +115,7 @@ static void *btree_bounce_alloc(struct bch_fs *c, size_t size,
 	BUG_ON(size > c->opts.btree_node_size);
 
 	*used_mempool = false;
-	p = kvmalloc(size, __GFP_NOWARN|GFP_NOWAIT);
+	p = kvzalloc(size, __GFP_NOWARN|GFP_NOWAIT);
 	if (!p) {
 		*used_mempool = true;
 		p = mempool_alloc(&c->btree_bounce_pool, GFP_NOFS);
-- 
2.43.0

