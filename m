Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C5239085
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282465; cv=none; b=DsCPw3+PO6N9hwvX8FS73MRg7ixLAxd61pMG7cdmYwZhrlyAyR27CVQpt6fKAU0iOncpWDTJfBniE/8Pqoi55+io11vzboE7p/GQ1w2GA4ORZyFBx+XC23IKJsItlAMQSUxQJAU/VieEdyKcdPPPGW10HWr60RJBqYnZ5wsiWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282465; c=relaxed/simple;
	bh=+aphM6TJQ7iJ2TJZpMW11fb+R+9crTfLJhUedDM7mag=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t8MBh3bPlaK7k5xt3uy675zb7Yw/0NrRSYxp65vBZRxYyCPfc1OhiAQBpytO2LWzkZBTcEnXI9Wt7VCvfmCQ7yXEkg6dJ9FWPIZdniBR4UOyhv7A8U2yUGR5u3WVtH5l6IVYpAxebF00AXYg3BOmG4ZYyb3y1M58bZSx6SuboQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso106417275ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282463; x=1751887263;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Urt1qcGeF+OsaysPJf+JjXcDqkwzAs+PQYC4oWvv1/Y=;
        b=JRJXVohagsh3eM8GS6PoaXJVHMJyHfQKN/pkDhdjaMw1aD9VMAl8niNQvnjS/NIWAX
         hcbG5nb0UwvFWhtCwPu+EY8KVvuK73OeHQfhjc0InuHzwyV3YKCmstQ8Azhr0irCwNxv
         SbHTnBgvEuYGSJvDamBHi3D9jfwQZZkIBAIQwxQIKNNbCubnMQ5fKw79lZXcplbMZJzk
         U9gL4kVYFxK3KmB97osPYJRFhU0msUnGik9qEd68RevJWHNoaG64lbvaq6Or+NcCZhNR
         JlKG0lKPGD2V/EI8AuMvE7MfOKo8VuIu3OIlO0KhFj4cElksyM8gjgTZy6gGw8YjVJx3
         kjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6waDAw28cExBd1y4wLs/RGy4pyWSMX8CKUBiLYBHR+dc+wpyf+6fYjJlg7m0mR4+KG3nmE7A+T2C57AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIC0cRVrerP9v9mDqBxJRM4afVnQVm55O4jlJU2Lmjqjll4vmb
	xd+TTOU8QEsOFq+PDYvx4239yYHGZ5DQhM90XNfSer/3e7vHfoRsHretdEnlYY1fyI+KuH7uS1a
	rZUb8A0RHda+2+wPCbXCfmLBkimhIHXsPYd/ewQz+svcR5fq18q8FqJ0T8AM=
X-Google-Smtp-Source: AGHT+IE9HPMx0ykR3AVayvI2tdTEcRU6v0jBBX7QQSnH4uEWaQ9zGHNuNy1V78dpTUKrB02Cc80VVg2nJzBmgSurAKxkAmrSZV/F
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a41:b0:3df:4811:ea2a with SMTP id
 e9e14a558f8ab-3df4acc3068mr128274075ab.22.1751282463505; Mon, 30 Jun 2025
 04:21:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 04:21:03 -0700
In-Reply-To: <e13eff57-579f-4eca-9bc3-9f6ec2d5f42fn@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6862731f.a70a0220.3b7e22.0db3.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ntfs3/frecord.c
Hunk #1 FAILED at 3027.
1 out of 1 hunk FAILED



Tested on:

commit:         1343433e Add linux-next specific files for 20250630
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115cb88c580000

