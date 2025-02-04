Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D458D8632C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647305; cv=none; b=s1On7YZIrGO7JUnZ3u4Oz3X5wLwHdjAQxeQL1jcIhmghnhe6usxwn0dAUx/VgCCDczT2DgdUfuIcqlunhG1UF2FloHaWI5IUgyw1lJUI+EwjkG/8SlcythQ1B4vl7kTiWvNkoKjtW8Jh/cTfrLAMknqk9+JeA0YeRKDLLtcDNdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647305; c=relaxed/simple;
	bh=SdBgo+jx18v3hbYD/0/9THCABXjEpWFwgaIW/Ci32Wk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kmWrbWkza3SVnaAOYimpwJ1zuJp+uSJk2sjQDWgXSBD5+zWyMim0M37TeMF+MYob8Xmfi4BFxg5YltNmvm5ND56P7VUyc9GQBZUUt4qauhKnKUVkWFwb6Ej+9T2v8eg7vkZ9CtgENsKH/HBeyO/J1Sr45ATZkEwvF03ZKaqhSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d00eac3de2so31299355ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 21:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738647303; x=1739252103;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPr/sereKab1dBN4oQE4AkUFG5DOro0yG48RmemKvhg=;
        b=FqdgLW2I+jpj9DJWPdETVmkfDVsWkuV2xBSFheNYsvK+ZUvFTQ7nJLafjePQnmmeFo
         K8JMaUK8FzXQgryHGzcaW+Lwkwr+EJoVD6IEhZ5tVw77oSfenAPNszYS8G5lsk8sbf+5
         h1K9dGieF/2/9H0Ssav/+UZejgxOu4dra5C7X2HXa1Z9xaoYceDYxQOSSG/pVgZDxu/L
         BO1amEyiFn51IWvGX+WZtAGl27bs4JYOhrZoBY0GvHuvrlb5RfNT4nZmfPw8tHtvt1wU
         v8e8xz+SyjKKECDyqBryrdFwrByUzmVhemvkKzMuCkC7Taff1zF+n2dntJHPe9Y8ym/H
         DEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQn3I2ygCoKZXTuIILf0XIzkCEDKup2yT4cvAko6i+lWv9ZShfITAgdlYuKyJi1XiNcQ6BQJryBHPRiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAluLLVl4EbJHB6d85yoLjahmGX35CiLeXkEJzxNgDANU72cS
	/O2GM7jvY+8D6XfTuSLowoJ+MV0an5Wac9mS93/pKe+ng2Q7KFipTh0hahF/fN9q7pCSSetH5E+
	oWlz2/1lT+TdLTYViGTmbUuV4KTN/82XoMjGdKrM0eQPV00pES8QLQNs=
X-Google-Smtp-Source: AGHT+IG6RXLXxU2HXRo3+h86xU1jL8XLYbNJboCrRPSf1Vw6d7zkVUPZeOOQg60YZBy7LgW+923qgs9Sy+AmNLf+pg0rOqoSt5OV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a29:b0:3d0:258e:4841 with SMTP id
 e9e14a558f8ab-3d0258e49f8mr109960805ab.21.1738647303003; Mon, 03 Feb 2025
 21:35:03 -0800 (PST)
Date: Mon, 03 Feb 2025 21:35:02 -0800
In-Reply-To: <tencent_5BA7330C9E8B1B5B4B051B792515BADEBB08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a1a706.050a0220.d7c5a.00af.GAE@google.com>
Subject: Re: [syzbot] [udf?] general protection fault in d_splice_alias
From: syzbot <syzbot+a9c0867e4d1dd0c7ab19@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

patch is already applied


Tested on:

commit:         0de63bb7 Merge tag 'pull-fix' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1a6d4df5fcc342f
dashboard link: https://syzkaller.appspot.com/bug?extid=a9c0867e4d1dd0c7ab19
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122bc3df980000

