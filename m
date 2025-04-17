Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DBDA920
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744862636; cv=none; b=Kl+PQfjZYwi1LcctYjEzLLW8ICn6hJ8xX6hEW3fyKMkoHoBVenYRZb4nsOpaXMwHSV9h5VetJLDEv+Zp3lsuaVIRmDoGZKmpWHMgF7iuZAE183LIAguw4fq4elfUDRubiXJZwTT7a5GxYMQn4jvlnttfEAx1eWynnOcXEHcSD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744862636; c=relaxed/simple;
	bh=1bFR0C3jNLA9tSkGV71HxjxgDBotPlSsrG0KeonFzTo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UOIrMYiYNFCD22dxImB+8B1Jo/VuRTs4yQQ3MVAQ7qUSj0jWUL+UO8OhdXdR7BtDZyH0vD5r060pFqWICTYmTnqWvANpXYvqQW1I/Hj89/zMOC2tYBBPpJYIjsGucs7d3v9Y5ryG1N4GPlfWMEfidFXsbno24DCaboONEzuIN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so3827465ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744862634; x=1745467434;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRWmYyNjOgoVTWwvG5rZdm5gRwNqTNVjxqguvMWZWfI=;
        b=FftBU+/FHJV9qbWknPmpWBVMlxWAG3q919q1TEuGn8pU0FM7wYYwALq4XHJ1b12G/w
         LewZjxlLW7Mtv6qIt5zcH9Yew752Eeqqi9EpjfddZgHT1K0bBIT8HxsHaVLit0LEAWkp
         Cg98OxDIP55JxVX6dVlfWcLWWdaz0m8NEUBKtEkS1lwgcdTyPfbqB98liAkheb6QoGtN
         jIkoNvHYhTr/fq4SsDHReBaLl26KdQDT+bRf3b2worp1FPyPdvTvoHedbpQeyLkYsg3+
         yeJ28wOFb65BOD9vNyfXG1yCeNLdRNo5ys2ko99migWudp9/fj/QgLHSBZ0xAEkXrPsi
         +xgw==
X-Gm-Message-State: AOJu0YxtKlXReXFTjWuZff+KF+1KPdOjb7RB3ZVzvuc+Acpb9nZz3aJH
	vovdWPR7PavDHx+9DRaBVuZkIxLTsaigo4Hm3EuBAPaanY1K2wBI19qdcEHOSqbVr6vxXoDHsi9
	1qGH5lOyzS+zuqTh1V955qoFMFWcGRIAzMaxYWVm4medkQFRpiHUyJQU=
X-Google-Smtp-Source: AGHT+IHqWdj3+hYoDE/0JWo7IwGGpVaEuA9ei61adPfIEmcKy7STpkRAIWCDCw0GH411SykitvKSkzkjRJIIhaHpKcyyPuxtLklZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:471c:b0:3d8:1d0e:5308 with SMTP id
 e9e14a558f8ab-3d81d0e57bbmr3480915ab.6.1744862633903; Wed, 16 Apr 2025
 21:03:53 -0700 (PDT)
Date: Wed, 16 Apr 2025 21:03:53 -0700
In-Reply-To: <679f3464.050a0220.d7c5a.006d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68007da9.050a0220.5cdb3.000b.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH 0/3] ocfs2: Fix deadlocks in quota recovery
From: syzbot <syzbot+f59a1ae7b7227c859b8f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH 0/3] ocfs2: Fix deadlocks in quota recovery
Author: heming.zhao@suse.com

I created a branch for these 3 patch files. Let's ask syzbot to test them.

syzbot page: https://syzkaller.appspot.com/bug?extid=f59a1ae7b7227c859b8f

#syz test: https://github.com/zhaohem/linux jans_ocfs2

On 4/3/25 19:32, Jan Kara wrote:
> Hello,
> 
> this implements another approach to fixing quota recovery deadlocks. We avoid
> grabbing sb->s_umount semaphore from ocfs2_finish_quota_recovery() and instead
> stop quota recovery early in ocfs2_dismount_volume(). Please review and test,
> the series has been only lightly tested in local mode as I don't have
> proper OCFS2 test setup.
> 
> 								Honza
> 

