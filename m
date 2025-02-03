Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C6204C09
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587359; cv=none; b=Q+vyxvWUVQ+lVPmCQde+i7hXipxFr6rpZyggF2MWKDjerk4mCRmFBYnN4wPtM/jv+BkDznFd2tncncihtJbhu8Qd5096uVhSUIVcR2lO01HMd9xCnk515aEKg5eSIzKQ3zOPn4x4RGyU+YCevYT/wMAT2MKrwM1hzutednx8kPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587359; c=relaxed/simple;
	bh=wrbq8tRO8Ujz6xT5hZ0MGloUXwhcGWfQfnXpMOU5h1g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jaGBNd8LR9PLpHf7yhCkry67vdxVtQ40CRu7D34LzGOApv6JM6F3GibmdBOAaMa6KjJuPGB/IrbFjtqLkw0AgrjbwRPeM4Io8X6hUz6qfWxS+deWPw1V5WlWPMjjnOMRFR5efsuzCx8KEth0X2BYz2TJr2Ht90ta5WfQJBrXR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a9d4ea9e0cso34248375ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587357; x=1739192157;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9toBHG9PvozWLZta78s+4dP4DXPIlTzDMqALgolO384=;
        b=hwXQAwmw9C9HLb5NP5GmIUt6+D2lRwHOVQzrHjO51pcKgXTIWnQFIWPDBlSnEUZATO
         8GsgTJGPWs5ZaoRiQioJvEi4N0L4qDF8CuaiBwoInGLkT0gMGX0v3EVhF91kux3+XTVA
         NvE2dNi0Da9TtKdkoy7cxkx8b/UF50Tf5w2Svq7Z6XpjOAxQSu6RnjynRu3zixsqC23J
         /gjQrrs4UwsSaJ1GrglJ3U8c/NbLuhk6pO7jVs+qbAWFhKeiDq/XsvnY+uq93MWO4EGM
         rnDorRB0RpfVpvOEtM68X8TDf63CFjSCjPu6/Qg2gZviWr6kkaCiReaEXITy9hOJ8kEH
         /7tA==
X-Gm-Message-State: AOJu0Yzf6lKi0FNfQkDioBPNewNYe0nYzX6lq3mniFNvdyS56WQ0eKfU
	mhybxfMpE1brjrLnQDADy1TR8MCHQF749P0nBy911/T0RVpw8EIY741fvKJQ2J4DDrhTzq9SlFU
	mqAUcYioFzsfAqekyTfo5x2Stiy7FH4i2GsX/S7ogKSd+E5RKsrxPiEI=
X-Google-Smtp-Source: AGHT+IH6r3L5bpjRs66Tq5gaxj7XDarPnlp1XHhWzjNFOOUyEfMIuGvVJ8SOaq3+Q/VtutPM60mGWYhpsi6IULnuseCLoKVFjWau
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c547:0:b0:3a7:87f2:b010 with SMTP id
 e9e14a558f8ab-3cffe3d1bd8mr172188205ab.5.1738587356949; Mon, 03 Feb 2025
 04:55:56 -0800 (PST)
Date: Mon, 03 Feb 2025 04:55:56 -0800
In-Reply-To: <6746611e.050a0220.1286eb.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a0bcdc.050a0220.d7c5a.0091.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+f6c113186405efe2140e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: nogikh@google.com

All the previous reasons for build breakages are no longer relevant.

#syz invalid
