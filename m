Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0025A629
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631646; cv=none; b=UMnWen9Zr6GfKIjA2jjsCREZXdzoJf2CbhN00k4ngJ7hiEza6Vg2bYDx085Q7LswD+SJRP91qnUllltD4wEu9ROTF2KDlogdjcLjd2QJ9DnqapPMfQci8qhRbLPNQMSpEcoiLeZdFLWn5DIRbfQ9otJ0xTaZ9bEVoWlY2A6QrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631646; c=relaxed/simple;
	bh=It+HF+Z07+bu6CfLi6kaVOqY0reSK+nMzk+40i+BRuE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gzBN8Qk6JSliwgcQosGQAk7OgFagWysoOOigAoG0GCKPpqtfMY8dcrobHdgxfKAfytpLcrCl15kF2E8mr9LHlrORcr+u/CrN60+CdeW7aMgHeLeW1h38NiiwCm0vLqUKR6m51z7d/VmGh1I1qAWZ5CM8SSy1X6bIdm6K1I8lWgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3cfba354f79so112772055ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 17:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738631644; x=1739236444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcRqjoY6ciWOalSHnDrdtIEOy4Di3ArQFcclJnvggVY=;
        b=euVMEWnTz+01eSlAHaCX50gdfLUzAGUKWxi7IXEhH5Fv5g+pRM8RfX5EcLpZHlkUvX
         7xxzKPz9HmJmmXpO86q5kAUiXSUeCqCSKeioyDGiXsSOPTHjbXxlSZaghCUKKG53HG/F
         lVFR022fAeny0h2LU+1bxXfqgGIMf89G4x7TFcESzihYl2XR/XMoOIyOWu4TrXxUKIiX
         ADcvRlFKblns+d14UCNth89xYufiBJOXBc9JPpVcT0TOrzibbI4ky3l+ShBxQKfk1GNe
         nP98dVSMpCeUAD/K8ckqjlZt3wANoQ8h+qewUygjjLjvjcJklig1FzSwH6TVhrBf1/nd
         6++g==
X-Forwarded-Encrypted: i=1; AJvYcCWcq1QeJjbwyybrZk9ib94Wl1YE06PYBUKXuYSeUq2/Cc1DyclMaFCeOKrvNNRD7+iYk29piFBaaRnA3rY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxld47d/mfsusxko5WMGuxXLR4W4Af6hiO7JstHE1R7wd1YXj0h
	FjBtmt2w7AhXpAmGfW+rNABrAO/OFiC4btz9Iy6uc2SAv+0m5AYrVBTZxoJhmbLoYL/EQYrb0o/
	yM38nlgodQaKTErS2yXunIOfc1p5zC64F+kTxXqFd3U6BC04VyGKbBnE=
X-Google-Smtp-Source: AGHT+IEzrl8N8MxWRyq6bFRd3V2wNMACjf4evxFkBVIZL1RwNDFyMd93pUOwCTh7NpkwSWmUsk5IYfhShHQjpeyN4TPSHr2XNK6h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc3:b0:3cf:bb7d:ac13 with SMTP id
 e9e14a558f8ab-3cffe3a6eb6mr216089255ab.1.1738631644233; Mon, 03 Feb 2025
 17:14:04 -0800 (PST)
Date: Mon, 03 Feb 2025 17:14:04 -0800
In-Reply-To: <tencent_38DDE8DD931974CFDA0DABA5B08DF9927907@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a169dc.050a0220.163cdc.005c.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] general protection fault in __d_unalias
From: syzbot <syzbot+ab57f676a518849a8d57@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

patch is already applied


Tested on:

commit:         0de63bb7 Merge tag 'pull-fix' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=57ab43c279fa614d
dashboard link: https://syzkaller.appspot.com/bug?extid=ab57f676a518849a8d57
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=108cf5f8580000

