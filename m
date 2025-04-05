Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA35140E30
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743880324; cv=none; b=RHkRR0E+39jpWazbvJ307slKdYV+08P+L9HgwqwjsLYdvrrIALDl/Jn+plB9v16SmUTg/91lquQH0rMm4yfGMKho5dpR5ZVFQjTRCNFKI0JV5FBBSX/KdYXZ9wNv71eyrwVcBckDieeuhZ4YHsfYyFzipqq2bao8J3bMYcSiK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743880324; c=relaxed/simple;
	bh=xmIicbNlPLuWI3TV1FkKv59gUwXqz0Q2csDzatNcnng=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rumlOoUthJTjd9n7pF44V5tehGTEZsCz/reT/DKrDEtl5pdCN3kzpprgQwGe/1ZBEgLdMRmhoKC/VvdCfMRnE9mky6//qZOo6YgIjR5iUhx1iLvV52XGIM8VGFhamxhauVZZ8ay+vOoAbHHyTd+LjF5GMRk+zRywIA1lJUyDkNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85e7e0413c2so299538439f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 12:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743880322; x=1744485122;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeDX7B2Vp7KEiddHCuJLEas57zvKxlOxK04Xcaq7N8Q=;
        b=wjQNeDuF7iwuysEJsFQlnIlVbTJ5PJf3IYwPur54wPXBSZejmMyVio4p2bzV9H3I0Q
         FzUh1cW8ZXs+TWaLD4xvBCGYWNYfUZXIHKomwSCARWG5eIFpEkZu5ONBKpzf4iaQNTft
         cOwE+gAKhM53IMZyG4uZz/ybloGKHELDuWCfRueQEDQfgtEHOo9oueXVMObuvA4pwZAZ
         A8j2joINuknaHThAyHLvPYBhq2pit8vuxDvjw4dypix9VcNrvOuAOkWixz7mjKa+QQ5O
         lHR4VOD5yNuMR2ouzYxgmeR/KT2ur9LR+/L4xK03ZQLsP7yybQC6mDPMS6AuZT89aSIC
         6MXA==
X-Forwarded-Encrypted: i=1; AJvYcCV5mcJiNBDpe19yq8mfWbjlVzzKTiLa+1ehU9Xvu7K0pFSVfVEnWrroTfY/cwbpAwpBGloUycDq2GCI1Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qIhqtREixi5gXHTj1jp7uHTPkgaiirndLkMJwtXcvHKwEQWx
	FUVjCRh+9ko7iypt/QJITbJ1sb1F3q9aqGb+88hheEEfySYgZuhs8Dc7LHY1ClfQFTQcuS5QU1k
	k7j1keFojzGy73eljpY9kkg5meNrK/iiocZqKrANgAAU3J4Rv5xnwbZU=
X-Google-Smtp-Source: AGHT+IFx71HeBbjUM48kC5aK964SkqKRjITO4L+2jfQVMfU9KhWE1/9PZLYw7uK8XmJEqN1u+Xy5c8HW187xn2nCtvgbQKh8xGZk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3081:b0:3d3:cdb0:a227 with SMTP id
 e9e14a558f8ab-3d6e5324ab2mr67339875ab.9.1743880321770; Sat, 05 Apr 2025
 12:12:01 -0700 (PDT)
Date: Sat, 05 Apr 2025 12:12:01 -0700
In-Reply-To: <CAKUZ0zKBp3iZkykFjVhxo0by38T138+JQ_cRY0C_20cPVF9PJw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f18081.050a0220.0a13.0244.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in __free_event
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file kernel/events/core.c
patch: **** unexpected end of file in patch



Tested on:

commit:         c9661394 selftests/bpf: Convert comma to semicolon
git tree:       bpf-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=6631c78ce6cb228d
dashboard link: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=144b2b4c580000

