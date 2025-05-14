Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69A4C7C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206604; cv=none; b=lpgQGQnqqaYX6i5NYmEoEOBb2V7wi0HysmFVR7v1bu4p1wYVTN/dQZfYdtMaju7sfVLNkFtx8Rwdp1J+bADDspBGfPMR+Q0FTXps98IPkREiozuchpixlcTNEwHB9bO5oaBImRBVmLrjIpyi719o1MqKsdcPOQO5nnuaeF3d6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206604; c=relaxed/simple;
	bh=whbrueL2f+CVbs487z1KRBfvk2TS7NSfibrMlpkEvu8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jXlDpEm4Gk+0LlLG2ZRXgyRX8WrentvLC/UUFFQqtPwtshKUXNbax2q70a1DVigtzUd97ebsmCopQ3JBA8u3NtPi+VGrCXAV4Yb7V9lyrFyhIW+pau/Ej6cLvvNo2cTr7C9MeJpBm2LKwCCxiEg4wdBNtrPEXKXSU06mHGJ/imE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so81609655ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206601; x=1747811401;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whbrueL2f+CVbs487z1KRBfvk2TS7NSfibrMlpkEvu8=;
        b=Je0TJBAHamVFRBrszxmf1VJSgPEZvVEsZ9nCCiI8HowdStxFZ+pLsu+sBDM8SjF4Bb
         N9bEOjuB1hjJU5Epyw+JLkeqYiOPiu+sXSR230tw5P0I565uiVY3dv6OBriUBITkgwD0
         6rgjZ42PlEETbGJC/I4KHNpG9N0ZXEQ+Zq7YUDKCkNRAdXg94CoXQLPwPUMp7DaMFvHZ
         J+BduVYLF+Q1EnUPKhnkhxmCJpXgXaSwy5YiYLvNxzq9H9JmbqUwgWdpKYfzR6tPJRrd
         7bVPdwkhVaJ8KCyrGnHJxy9/07x9ayM3WMzBV2orxT4jGLB+ltQRAAxWqL5o19as9xfT
         +LSg==
X-Gm-Message-State: AOJu0Yz+MizXmyuxpSQFPc8n4Sr8dekW86rcVqALzpFVKcMhcHoNzhQX
	P9kQYYo2fwR+j8OtaK6t1uV391rDE7vk+EdMgGgmbpEl8BbVA7uksx7OJyK25MMGu3ATXJVIaia
	DDKPzFY8fCx08viz7gLroBFIh+fkqnngzBChmmm4TIxu1CWeh+A6dN88=
X-Google-Smtp-Source: AGHT+IF+BDhfhl0qJh++3ulcjrG2ZcgCy3ZC1DDZpFc+yesMYk/289msFyskt3cOpQF3uAK5nIJq6ENF47cZXLKV45JkzcToOmhF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6b:b0:3d8:1d2d:60b0 with SMTP id
 e9e14a558f8ab-3db6f79b896mr27961105ab.5.1747206601560; Wed, 14 May 2025
 00:10:01 -0700 (PDT)
Date: Wed, 14 May 2025 00:10:01 -0700
In-Reply-To: <68241bb2.a70a0220.3e9d8.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682441c9.a70a0220.3e9d8.0007.GAE@google.com>
Subject: Re: [syzbot] #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
Author: dmantipov@yandex.ru

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
