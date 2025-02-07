Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DB2561D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911750; cv=none; b=vAX27yh/cUvE6lbTVYcrkScC4gENKF5DyXGBX1DgslsYHK7SVSYSmlKxMxXWlL++whrJLQM8e8aqpUdGw8JFr4EbUHtosxlUkS5PnJl3RqDgujLW2z+kwKbtL9j50La45IoZbG2ijmFnq6wd3OCUd42LnkluSfpQ+fu8HCMfOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911750; c=relaxed/simple;
	bh=xa6C+7+fGXlpaDa6LNiJm/Q/tS+wrjx57xOcK4XOUvA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B0BWefZjD6d6yaz26c3nAbYH443S8sYAwBFkb/n0/5GX7SMum2MBqBoZn6vlKtpcwuZhDJg+i4S6oEh9fkfk3nrmBRjXZHOINpDRkgCe+caxDg6C37m5t73C9l/viss+jyDMy7Ib120LVDt9kjuFTKcwKORMgfkOMUfB3sMoRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d00fe9f7b3so28749795ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738911747; x=1739516547;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJCdu0gwM1TgOYD6qOEcrhLPyy5hqVssMkSUcbkhW48=;
        b=t86X+n7oskoFACRWD8q+t9KWwTOqSHSYOKK615p/TxsF+lFGq0DHh8Sgtmlc3oY8VH
         BKkaXDfUj/G3+thvshjvWlyNugWbxyT+z5tAyLZOpeGc5KSng4/QaM0u14XVNhRt9+e1
         XAc1LxE9PLXKyhKIAA17UcbKo7A54eXPhpEqfvoYcFUaA0jnuM2de9Xhi8OBOvLssjmv
         5VOBnI0lrzpZFogRUC5WKFHT/fzOFe0bIJj5UrE8tL/ZH9lwOKNFdhv6rkMcarJMM0Te
         iS461IyAVxxzrKG1W0iGYGL/5jET4oq8GCPNeOQjoC5nHK4r3tQy9WwIk36XbB+/kois
         cjoQ==
X-Gm-Message-State: AOJu0Yz80nJaOTnITXal7U8YAn272q7GFqCA2WaEdfHlw4Bk6HXoe/sC
	ZNfqFpFY+TLzKNyPeuhb1hvqAJRDLyxCJsrMaENhkynrtC42GzOdKvfaNDb5jEKbAc7Tyl/jrby
	qZh7aQKZoMt1gtKoEG0o4gGn4TFnqM8eug8ilTehQvoR1fTpdykONvKs=
X-Google-Smtp-Source: AGHT+IHmEEmZw0nT8U/F6roL0azgWbLPZY/RabX0oXlZfT99m9/f4RC82Q84fF2Ie20nvkIAcRJH8GHzXiv/9v4JpKINXnps7jq8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd8c:0:b0:3d0:1ba7:853 with SMTP id
 e9e14a558f8ab-3d13dd29e8emr17804975ab.8.1738911747687; Thu, 06 Feb 2025
 23:02:27 -0800 (PST)
Date: Thu, 06 Feb 2025 23:02:27 -0800
In-Reply-To: <67a4b9e8.050a0220.d6d27.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5b003.050a0220.2b1e6.0015.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [overlayfs?] general protection fault in clone_private_mount
From: syzbot <syzbot+62dfea789a2cedac1298@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [overlayfs?] general protection fault in clone_private_mount
Author: lizhi.xu@windriver.com

#syz test

diff --git a/fs/namespace.c b/fs/namespace.c
index 1314f11ed961..8e2ff3dbab58 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2421,6 +2421,9 @@ struct vfsmount *clone_private_mount(const struct path *path)
 		if (!check_mnt(old_mnt))
 			return ERR_PTR(-EINVAL);
 	} else {
+		if (!is_mounted(&old_mnt->mnt))
+			return ERR_PTR(-EINVAL);
+
 		/* Make sure this isn't something purely kernel internal. */
 		if (!is_anon_ns(old_mnt->mnt_ns))
 			return ERR_PTR(-EINVAL);
