Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A76A50
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936314; cv=none; b=Q6KM4B3fqG49WhN8wmAi4GC7wL698zLPIGTyGNsvtGCrM7pzAn1h7vxvyLxAQOvg4aJIYBj2MfEIwx1GyDMcMC8jurNQEw9X3tmNhurco8X0XOUTNvkeeROqxOlDAKMexAx7rCKQuzLbN7TFRQNYrHDgmTi7XTUBV7OOhFOULno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936314; c=relaxed/simple;
	bh=etm4+vXCaehAxzn6p/ONmqWDfguVOqUpLxGNnVN9yr0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SPB//VGgB3rhdLTPchkZvT7TD8oOt9v3HacfCaOxkDn7IyvkjVIUj3Y7B8rwgWUTBjNlHo5E1lUidnZspi8aA0YGg72F+PdzcZ3YNPvrGhbQsA8T7pdY3qniqMwJTQGGnuSOu/tCx23XqFCGVRIcW+jo1aABXjrkqCgnUTb1C34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b402f69d4so868977139f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936312; x=1748541112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etm4+vXCaehAxzn6p/ONmqWDfguVOqUpLxGNnVN9yr0=;
        b=UD4+9vEorSKPdojCdlQFJ0N1JxSeZ7KH3ZaasgGgciv6011YC2w9JcfZ+aNyeqBlPr
         QRWElyzGM3Sc1zvowG+JYp3vM4ItJNMeKs4TnvV9qlOMBjzICiIxhSfsnbRsLl61reXT
         DBFVLRLUENNBNDvyMJsica8FLQsty63kLjvf8DyQ10J6+EsPrdWzgktM7fbO/J3qx6Ks
         7adenQJTQ/z8Roa3gFbrVVnAEzyqCnEvw4jO44+a7bgDmfgKCHsm74Z5HpVA5PzuZdwj
         gpPluK0Fz2DF/IcBYeKY33CiHDogaD4d4n2g06RAZXvnf3iYPEwaP/BCsxv6WL9P3Pdx
         6RGQ==
X-Gm-Message-State: AOJu0YyjyXgZ3hIpn88+mY5l6DT0xuNVRsJBOsuY9IHgjT5RpWY8ZAmn
	cjVbFYlppoX35ps4+EkgWHMBIxBpaVSydZwjLxmyLtzwe/klrjmR5YyR1EMxyjrQAjIz5Pe7RSz
	erWFdADSO75a+Qa/NTPi29alHUUVvh5d4+7zExdsFehnCdvLzZcxIRaGChDA=
X-Google-Smtp-Source: AGHT+IGiA8/79PsdYCfmMzFtXp6CuNFFmImlN7ic7HETpSxdA6osY2b8XDg3xXpnZ9DWJIRw94+thaJa0q2+Wh/5f5wWrk6iUkEw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:380e:b0:861:6f49:626 with SMTP id
 ca18e2360f4ac-86a24be805amr3775456539f.6.1747936311952; Thu, 22 May 2025
 10:51:51 -0700 (PDT)
Date: Thu, 22 May 2025 10:51:51 -0700
In-Reply-To: <68170205.050a0220.11da1b.0028.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f6437.a70a0220.253bc2.005d.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 5cdb2c77c4c3d36bdee83d9231649941157f8204
From: syzbot <syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5cdb2c77c4c3d36bdee83d9231649941157f8204
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5cdb2c77c4c3d36bdee83d9231649941157f8204
