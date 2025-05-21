Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CEA199E94
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836616; cv=none; b=qFQQNgJ/snhT+NG/rf1SwynhDcjnml73SZhlcg4Cb63EZ0fUB2x516hnicggaWgKopKxHou7Xq0vL07y6fZbbopTNuYw+8H3MIw0Xh1/e66nCWdpW32qUSPaf1fV2Lru2bjDmB2qJ3K535nyIAtDDL69Wjo3291t3GgK9XT2vMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836616; c=relaxed/simple;
	bh=Mk/oWkXoQ4gpoz8i7H9u1HQ+cEtSGg8rLupR5Z+d0Ec=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aKeWN2tti05GJSq2j5Mm7tN1w9oo+x+DsiCuHVg7TUQa5VqAHLMGNYNVnniEYamplU+6WIp8wldjj3+CfQIAORSvA2WBFYzPivxF1Uo8ier1Lo18c3eH2YU8gMVnmmmnalai0k7aTCkMCyYKI0gn6jT23byp7NmZ9zI22pEd5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6049e1c6629so6270585eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836614; x=1748441414;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNTcSc3/ESLmDtghSx/A40u0Mkk8+k9LA53ImyKlq3o=;
        b=LyMr0G28T8ZdbsrfyV7hhtJqz1n3UZmMakNOeAoqnPIKNHN3Wmue9+ZHHidpsFaD/z
         k1H2+2ZqjtQ7PU6JRt+Y4FSHO8OURlMy6vzBhMztIKn54v3RKeam82MSNOras/tv70yh
         /8BsnSscON0olnzVcN5k/QZ20xoypciZ4mwupx1cNip8g6mIjnRbe1bwpY9zTJ309x6V
         tFtsibcmoMy6HeiKNDOoIKBmq521P0/lXLso669eqgwjhfOpSxQCyTKZCiOSHv26cvSi
         dTo+lLZorN0hVY6Uon8k1+26kwBH9M0MX0dSbQfW0m0QwKJvw3RZr2SwkksLN98YZkl8
         qHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOufRgKa7wbPf74cL5ya3XyEAhWimqOFHS2dq8shVqa/Kwa7UlLjDUcPIzNNwF5hjhgMD/EO6enDwDnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtEzPHILOkCVxFEru7q48jglLNPb7TuRkqEqVB5RIxO4bSlJm
	qMcpvPU+SlTGwMwBoP615yViynFp4XbqGM47TyFAfe4R3oDq6cRjjusUhtXJnRq8pj8D/vwvI+s
	HV6mvcYouJWG4voKibQuIeNhuSE1fLJNZKyAaQksxNV/tZI/OrYGIG0llIP8=
X-Google-Smtp-Source: AGHT+IHRbAgB9dkBjeyutv7YiqRsp9/3LHctBOQVq/LaDiPqrqUyOfexNHXKHeWSn7X7pfdHCH+WMoy8O3PpCO+WUEErfdD5p9xa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4815:b0:864:ab75:758 with SMTP id
 ca18e2360f4ac-86a231974f4mr2974915539f.4.1747836603345; Wed, 21 May 2025
 07:10:03 -0700 (PDT)
Date: Wed, 21 May 2025 07:10:03 -0700
In-Reply-To: <71446a9d-fd2f-4a74-8486-775c56fe782b@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682ddebb.a00a0220.29bc26.028f.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] INFO: task hung in freeze_super (6)
From: syzbot <syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com>
To: bp@alien8.de, chao@kernel.org, dave.hansen@linux.intel.com, hanqi@vivo.com, 
	hpa@zytor.com, jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a8454e3b f2fs: fix to skip f2fs_balance_fs() if checkp..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=140260e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40634659c9fbec3
dashboard link: https://syzkaller.appspot.com/bug?extid=aa5bb5f6860e08a60450
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
