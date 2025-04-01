Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010A7FBA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480479; cv=none; b=HGQSV1RxMTRnq19swZ17qEEjZmGdKNBPEC4NprJhl6wlmbh8TsF5q+WMziZzzeD2PV0bTtzZ1sNHmWWnjTTJncskljcGECBDoNl+NULrlAao99KxnvsyJZn1qJ2+bxMt7jRF5XIl9Mge6StoKwgx2iEWGHB2HINBkh4+N11neec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480479; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Cswpx3uSlEEjJ0ntzQm5P46B29K/gnsLafJpH4wz/t3iQUx1aunoYTG4yKF93aFe8ckDWxDEI/qA46UjfHNYBh5X2Iz/3R31dJfQ45QK+muJjap8FNId9w+F/q9Wlbl0QKLxu5A2670osTRYdMXbbRR1Oo5ZeqghqIMJfwGyRtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d2b3882febso41337025ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480477; x=1744085277;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=nApGVwmMN4YHazL6SUQLbgIESpAZo+yNOIuBOVprmt9y/0VeTHfRkPp3Aeb1Dr/XHv
         nddgFKbKYH6lgu/UtSvWgejVQywmy/lz1In96cY0sTVql5cEx+wlAtLjFwtxXMa1K5+Q
         GUw1+ArIRavcNaJdyqeDTiQik64tpFDGUINSLguY6dO+uzePNYShTtiSGx9SyaiN9sTG
         jXlSuLGHLkg/RPKz5uCpRK1lDlZ/iNqdFYHAGWMObTuY/HwJq+WOJ0nQQZyawiZnxRLk
         KNW5jiX0SRHHOEdNejnitojwhXSBX1Bt93/ArzZ3wycngfvxxe+gyZpTe5hgGLYbhqkM
         d7TA==
X-Gm-Message-State: AOJu0YwzhQ7eztPnbcunpQ3BpsIB+PDHdvsZlZ+L3MHMOgxdF6WvymF0
	E0eaxxa8IniW5d3cFXFD00iJFsmXgFtRwH3DYRD0af2ahVI6X2P7+75u0m4VjHi3MhTy/IXH8BH
	jsOeawhuO85P6plLmuyAmf/GyZmknv2Iq2xCG4RzCNLal4IwAUiAQpA8=
X-Google-Smtp-Source: AGHT+IHZShKHjhK4NDYEH+atiqzSmWbi0GQkywEfLGr+AGitxqXanWK1bU+19hc+UFrItO3SHcU8Gn+HCH3lQjkrXqLlm6WD0oW1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3713:b0:3d5:890b:d9df with SMTP id
 e9e14a558f8ab-3d5e09cd9a0mr107609665ab.15.1743480477389; Mon, 31 Mar 2025
 21:07:57 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:07:57 -0700
In-Reply-To: <675be8a8.050a0220.1a2d0d.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb669d.050a0220.3a8a08.000b.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+983249082bd062b1c4ef@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
