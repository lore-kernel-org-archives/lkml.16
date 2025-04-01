Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824417C211
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480562; cv=none; b=dNWfALf5+7En2A5ItSFV92OzF/wTBOJxDwwbwygfLg/llEVYybXxmBaTExTXxj84Fgbn7GljKviZ6zth7Wb5A/uiY0NjQIb6tG5wS2UrJYW8DyhJuNnKK01pf4wWBhw3tOPUV3TtoDTeo/5+bL/SnYR4yI98Vu4fApWL0gyWnzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480562; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z9tQ65gBbu4SvH5wd5dIt/XTiw2ufv6i9ntP56JMUeyEUS27zC3UehqCk1x8pxIDGilYB7otGZa36vCIXmvsQmP88rUKcNmU9MP/hpoUlgEJhKYdPlNh6T2Og+ZBpRO6Qakxt+zIyP8hjLRpSRkbT9GUmHFlOGlmqByN93PaLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43621bb7eso53877005ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480559; x=1744085359;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=eXXw4J/yRzvR2PhQQPWYCjk/nC6ULIOJj6ChbwjXzVhKrScHwvNKq6zMO8EDotLdIi
         53Jg4OILmMuKycaOHdzIh959qOu7BxW+/XPf5pPotsk7B2gMJTvbW0z/V2x0TaZDznWL
         LoQuxwWZxZtBd7nTXzpNU/fS91E0BcvEfI1BsvIsJJotj+nJewM5YRB+GSzVFqOCceoq
         iYHHkZYqGYcegYYuxxhfT1rlqzWebw4fP88FbiUIb11KYA83vWmrr6gVlVhPLEoZZaht
         ZTI5kVA00FKZw1NtAee8YRFuynvzjih3/Er/mKLbN9hH7eU+qOK1XKa1cFcCHE7Y46jh
         YU+g==
X-Gm-Message-State: AOJu0YzEbQDiC4JpEplVSmUsO9ytmt44s7RsaCnRdnT8nwr6EiUBRkqd
	XA2LFP/hvLuEOMDgckIQ9wbG13nCsnHf4jHXwNMMbYmMfLVHJT0fziKzDK3mn1qTo9VdeLwPJmU
	mV3BLm+/ILcIRAL7JhZmmjy4ZcsEzrXOqO6niiZ7KtR3s4JfdQnJM594=
X-Google-Smtp-Source: AGHT+IG+yDlWnLpciqMyz2CcVchhKYqXK0W/c1FIjWlCMVPXvXyzm3khfZ63ACcO9CRTGBbXq39znecNUBgUAdXEtzSWQ/A636Z/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1988:b0:3d2:ed3c:67a8 with SMTP id
 e9e14a558f8ab-3d5d6c8346amr134970395ab.4.1743480559095; Mon, 31 Mar 2025
 21:09:19 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:09:19 -0700
In-Reply-To: <6740d108.050a0220.3c9d61.0197.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb66ef.050a0220.297a31.0005.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+ed52fb987e4b52cbfad9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
