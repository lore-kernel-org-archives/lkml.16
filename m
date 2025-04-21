Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12091A317E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247487; cv=none; b=ZgRiBdoHxNAc0+YRpDJf2EHdRf8w8/KOhISBY8h3UZUPc3BElwWNV6HPg8NK36fs1XCKWzLqH1ZDfJwYujQVR/o5JbQ1pYh9ka6x8QUDBzlc3Z2SGll0Z/ggLviwwoWyTUmBXfZjxwhTC1DrP8Pdkp+ABoCVUedTkD/Vs9zkd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247487; c=relaxed/simple;
	bh=yvdRVg0VMkd6hsMgN4ufqxlYTQYNsLNumxhd9kBzoQc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=coQBEKJQ+CWd3ms8kkI0W0H8v9hcv+Nb7ITM94LYsEluAGdjgFAUSZEw068EmHGjja4tcRj1iCTC0bin5DcNM+VOCoNFNxu0IDH/GF186CMXQHhnwCKWqJNthQSZS2CHitpQZqzjLLdQ90g2AfJGdMEO7HvuzqMbzcvjsVqTNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d8513c80a4so29682385ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247485; x=1745852285;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7C4lzjnrE7X3QpBOgkxFUpFE1wGJeXBaq1KeJ0KUqY=;
        b=SCxkg32IHf5NBYjl9J2dS4VmVZrIoZuoqIeVgMAVhhHeZzLpJd1ZoLo2LOg11lP2Xq
         t5YaLpiXHV/eVYwIKok3Ig+YtCwfpb34GxDVN0Z9pBc0pQHoUdUvBpvaAGq2MWJKtW8J
         ke2tj9s997z3wh5SVfA/gvO+QwmRQn/Xkckgh26cnjTU+SPK4kTHObMy09+Av8RgbzMd
         pSonVYSYP2g8TMz4hZEAsqMTkqiNc+zC+jK8ghFckrELrhylM5mqfkmccJjauhPHYC/I
         tKXQ4fkc66xuNb8U42T4+1BqH/c1ezKDrX0OAKHdzXWa2Su8/cFsdaNYEkUh2ELvivzb
         CxRA==
X-Forwarded-Encrypted: i=1; AJvYcCVAGdmcO5M5nF/JU5G5u4IIdPghiWw8w7R53CrDgahSTvCc1d0rb0E0Qj9wEXbpq/XcIySbk6FmfE5lmXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymC9WwQ5FlrxzNFNGhTTuaoxYI+wYjCmkR0HM8+twctrCc6nCj
	k9QhCj3gO/7XFqECPsLemhRwQVozrP95n6y2iDbFcyniUzGrMVBebuhcdEcWlgWwbo7qR8nK9Tg
	HZA6aCRz67PLIKckHpoRDfQmbUBudYKhCn9YkcWpwhMliHHEQTSPKT3k=
X-Google-Smtp-Source: AGHT+IHTZjZUrThe+WUKQfapvHK9hPeNGgNe+9DUCPt5h4IkwmwLZfZW8OIZLvebkVFNW27onCe5q65cTsstXgujJV0pAJT67ICe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ce:b0:3d3:d1a8:8e82 with SMTP id
 e9e14a558f8ab-3d8bf2aac57mr91761155ab.9.1745247484980; Mon, 21 Apr 2025
 07:58:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 07:58:04 -0700
In-Reply-To: <20250421134602.155962-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68065cfc.050a0220.4e547.0010.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/media/usb/dvb-usb-v2/az6007.c
patch: **** unexpected end of file in patch



Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124fcc70580000

