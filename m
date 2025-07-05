Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B523AD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704687; cv=none; b=tRj26aPdg09IAvFKYlCJGk/5UDEgrBllxVeazHS6TkCaB3lX63Kc1/JDcGXHjpnQ5WpCYX/O4Mt72Q7CAQcfMWEgkZvAjaxl0AC/AlQeNZmMHJ07m/iHrSWglOiZXUEUVx61A4Ep8TDYw8d8XvklT/lolJiMtQDFRvmFiQ2fOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704687; c=relaxed/simple;
	bh=pd3/bWeNDRMiUMWZrI3C8QH/tnQr1oE7j7E3nU936Ew=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=booHVXQWFqW8Z/fm8jr4ns8F2XiTf8rQGms10+34Gc1j1Lki75VffHx98szpVLOV/FO/gstFUT7FuZUhogj9KZgkoDVmbQD0cU6on0lUv+rb2bUyrejQ3RVYJLHz9Act3EFH/Il1OBM8tFlU6QpkvxZDG3yRyS/En4HS0gTHUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso40046345ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 01:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751704685; x=1752309485;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh4EdRrW8LNJZpi+F7BKE+mN/n8SDxBPLoMoVetyNa4=;
        b=tnPEFPl1OThem1sOpiSBpkL7HpmkXGS1HhB57YKksE4rp+j3T1F3jrYD64K7Zdo1pt
         WnjmPSFMQOtJAqp/+s+WfXlQNrmWNyFwv1nn03eXd28xWK0QFV90Py9nWG6fPXJuac+9
         pFE/B/n/gx+lrmGR7F5y0C5mB5LD50NY/HfDwEp1QtZDQ/k3StM65iF9SuVkkd9Qre8/
         1AUEZJ5w8YvN4oNpBmGaCmhfDfb7e+gfNXqVFR2t/xw/+1mxXHyE5nw6WGEjvuNM2a7S
         H3kGmzil6UVnxNSPsNabs8cHxVhu+bVigV3ijZlnE5slljxyiMl96+xHfT3s9Iyqnp8I
         dxUg==
X-Forwarded-Encrypted: i=1; AJvYcCXb0zeZU2wg9AbPQK9IevsPzyiSR/1Q/m95hdXqPJQfoIvIDmHsD6whtRe8LsxWNQNoMEzSZ0eVHxr8Z2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2tOwAG3Jtjx6FmPTzJ1KfV5Don55ED1Ywx6NLNnxs/2Td9en
	X/Uy1sSS9eJPjeZ9iZT5NKYrgaViV80hICk9yoo2JJMS2ZPBtdGUQc53Ys+c2PF+EzxT9e+DP6Z
	Mv+wxY7DVz+1iYpKopkNzmqxyIxbN5WH9RH4SHedxDKvFRrwIIM0timUvPkM=
X-Google-Smtp-Source: AGHT+IFhVV1SaHk58QLG0Xx5l8BncslKZ0nyOqVLOcBqkalo5W21QCSHC6gouZROc0OVfDNnQhu9m3VW3FkFXZuCEAwN8hBCTlTm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:11:b0:3df:4cf8:dd50 with SMTP id
 e9e14a558f8ab-3e1355c3aafmr57112365ab.19.1751704685268; Sat, 05 Jul 2025
 01:38:05 -0700 (PDT)
Date: Sat, 05 Jul 2025 01:38:05 -0700
In-Reply-To: <20250705081850.2552-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6868e46d.a00a0220.c7b3.0030.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in driver_unregister (2)
From: syzbot <syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com
Tested-by: syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com

Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102bc582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=6616bba359cec7a1def1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16a6f3d4580000

Note: testing is done by a robot and is best-effort only.
