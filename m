Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB801275119
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640452; cv=none; b=pYixGOulHm5MOVixze7ma1LFxALeINzwx5xhMi1jD0XuyrRZj8lTVvpV1GoygWw62a81em0/BysA6W8/I3ggndcC4r7K4eIMMsL7IdgSzrKdEa1Eko1RigFRuVLF8xG6W+Ps1hI49KHL+jTt3yeiXYzTdfCXhrhaWzGrtRu/oGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640452; c=relaxed/simple;
	bh=EEGVsBfUn0xsS5SDIeba3XJYpL8ZCBD4V3ag90CjTVI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EIxhAA/x77eo1EE2vCqfl6slY2j6lhIrGaqj7Is8Df0c1gEIpueVDLo7YWWSwgeh03WM7TW8hB03CT920R/lWUBijqraNr6OF+HKvty8iUR8rJ4myxNUU6qP4w//HeFhvAjbKapB14yhEpQqlWWjTvBhz6lbNexvPLeWzJoDyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so44086585ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640450; x=1745245250;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0T46Z7iuY/ghk+1dkrOrbmAqJOJ246JkC7aa6qF/KMQ=;
        b=h4lwaEXvg9MSJozv01a8ViMBl+yKoXxAdKGdd8IfbIeB4SmAsk8/26UO6oMvjYbANp
         Zod/Fp4fb7kA/XaNXnzX54ViC2s+ZTlATK8h+Sfd95opnL5Zez5ef6W8ttCDXqA4Dchn
         9tZfgTsKlDU3bGk8IX1UXDWtICuz68XIqlkyzxb3V3sg1o8O9zB8ZPlor/KFyR9oPBmf
         nntjxf8WRqBAM9BIJeEL01r6CK71wEQq2KaNskgiTGxrQH12y7dfC3CwIecSqX87eiAL
         yPynkVJFjWVZIuVVs9s5t3Lkv3OUBLOUfSkdBQATPVSIwc66A6o2Me8egUC6DVnpevN6
         M3hg==
X-Gm-Message-State: AOJu0YzA5pfl5ahV7dGX0R9VLN8A9G3jRQH/Nqc1OrA+5PSRi48jbCdj
	63Oad84SyAa/Lc7iimRYfDYlPPHOIailZELnE5AnpdBAY9/aUZpqeqE2Pr0OFXgJ3bLnZ8885rh
	LHvSZyt67SsUAWOvHyXSOpjilyum7ZwrS8QVU4AlELb4Tjtbv4c/8G6c=
X-Google-Smtp-Source: AGHT+IHMCBoW8AWMeHgwkyxK5Nwo7Gk5o6FI59TDU9SZdLj19nsVJezHYmrKKS5Ir67bnmJbA26ms7l/J8UcNahUfK6fJ4W1aU5B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:b0:3d6:cbed:32fa with SMTP id
 e9e14a558f8ab-3d7ec1dc6b3mr102801015ab.5.1744640449934; Mon, 14 Apr 2025
 07:20:49 -0700 (PDT)
Date: Mon, 14 Apr 2025 07:20:49 -0700
In-Reply-To: <67f9f9fc.050a0220.379d84.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fd19c1.050a0220.3483fc.0029.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] WARNING in bio_alloc_bioset
From: syzbot <syzbot+a7d6ceaba099cc21dee4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] WARNING in bio_alloc_bioset
Author: axboe@kernel.dk

#syz set subsystems: bcachefs

-- 
Jens Axboe

