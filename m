Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73121D5B2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366657; cv=none; b=Fr7TKxRyEXpxPucRL150+wOMRxuhRG4RA7cZ2EVOPysm7my4KdfAELNKPmSGzzm7c4oGEt/dC0AA9qLZsiLs57AOvMB9Mbrux2JzSupomZBnm2TBA4uDuktC225U4cBTRU4RySatgxECTOx2J29r9/SIZFL+XeMBaH/c8fXy/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366657; c=relaxed/simple;
	bh=QIDGANjB4OiFC86uMFHleWaiTQhm+kKyWjGZBQToAF4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MJzxowpyQ4yoFWrtkwcoKjNNOCEtn34xa2mByWXTIfpFI8HAdgKUh48pqk7bo8JHzyrr6rMcst316Lzn5Z21sNWiHqq4j48mAWwbuSOO/qR6VKq9U9G/dwu+Q/q53UXRoSFd1Z1nymrUlC79pyCHtyguCWGZnR7//qVfWVWdaIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so11860455ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366655; x=1750971455;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXV2yKENjEJsjGFAOGgPzprSwaK+X4PyvYziDnrjL5E=;
        b=L2/QTVMEahTxalCfRVkLc3mkYE59XdFCgawkyfwH2php4fDndmi8syV8/C86NPCLrM
         4h3Zs/CdM+BbrPfkEQxVx+FeHG+r7GfFXBtZTG2nR9oD6vDFXkDchE5dSY6zhLGFaLjG
         3aDtnRZOCeLxBsfAXJNM82yuKHAb8ZRogJhFG83S4+K7B40EoWIkWS2dbpCD3zcVXkTD
         oOAM2iy3JJnbToAdaMt45t2Uit8u2/lLDlOTrfwvynv61uiySrgJGhOr9sRPGnYCSnec
         hpe5hpX2UNmhfdwYBtNFK7EyA53G4J7Z61FogKG1AxoBX7V1puhYx20a0TMd1exKyRNK
         Oprw==
X-Gm-Message-State: AOJu0YwiMr+nIHO2aa+0H/2R2J7ghaC6etfo4CHN0N9hX9V9MSGGaK2M
	0MOAhV+FZyKAmw25XV9M2SE+Qa8qoFaVG9qxkyakThKZFs0z4Eq3yhjCvSM/7VddykeNQIAiQqA
	3vz9f834I0+rYLhfSRIxueoEvu4Tvg7GIe+NXQ/1fIedxnoSjy1eh05YOAu4=
X-Google-Smtp-Source: AGHT+IHf+NYRTwuWi6Uv/JrcpoQgCzqUSkg8sjxrZKlSwiisyYvJnmOA9s8Y8Fv51uwSpHrH6DH6XVGxX8wvFqjuF/2RczLzQAQ7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c1:b0:3dc:8b29:30bc with SMTP id
 e9e14a558f8ab-3de38cc3076mr3273945ab.21.1750366655242; Thu, 19 Jun 2025
 13:57:35 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:57:35 -0700
In-Reply-To: <6845251b.050a0220.daf97.0aed.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685479bf.a00a0220.137b3.001b.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+10a214d962941493d1dd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Call bch2_fs_start before getting vfs superblock
