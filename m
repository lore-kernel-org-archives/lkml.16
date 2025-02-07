Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC851E261F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933206; cv=none; b=hQt1/p/Hxqwp0EBovMAcwye1ICiHQRzyM9pZcmifBo4hKaV37c3eVGlBDkcB3cBmKyDqBLk8r5unbNNlklIEG0yF+XZDPbjEXwNbl1o3XUKajrXg2DKb/E6X14EZsthSJGF0YfjFNYILKkPa0aaA63TacZHuffG7qYYLvrbGKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933206; c=relaxed/simple;
	bh=SyQQAJTUFy4leBdQ4t01g2LRZfdnpy2UO2td1UJ6ZH4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QLE8McSq+Sg9/vwi3uQ/FZWABwtL1tn7IUTxvCICctFBLEzXqpuwmJpsA+R2+n/7MIHww+93d6N1NdJdTt9Ce9ZF1ItlJBa6O8iIKhlVUiuCNS3s1zTsphe0td0Zf86AXDU6q/yf+NiTp8HdsKuZY9qassHEVNzkva7qh3piVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce81a40f5cso32346725ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933203; x=1739538003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkaJEa0TUKx7j+Qzg/Pj77okuDTlfjSAB2YMcmAh+40=;
        b=KF7qjEuefaIG4k/5KGwwjRChIMHmVnlQMRtcGv+Dp/kukM8EdYeiFWv9AmMsaZLXVZ
         JO0tV23Jkwqk7CVZ6FOjbE3tVlIhWchh4KQU5QEmtK9NeBekwdMBHm4VCjK7jZrAIahy
         qSZRMv7DHjYWwsRyGVJrBebND+6lLX/MX/ryH3bgbkURLEWirIjrx+T258PQY1xc5RdN
         iJzkoGw1XRWpaP3u6GxQPkjiGRWV6wAByeGZFJrXEr7KeM+m+wQj7EzoI0wkNHjauVIP
         Dk7BNAcTNKM6ZycX1oKiwI9sIH1bndngyD1FqVx/svXFSDbM+GRn1c3dUpyModHj0Tzm
         8Nuw==
X-Gm-Message-State: AOJu0YzhhLR5Ez+TB1OhMsF2x1JsZmrRjVuWCoapHTdRXnnzAokrG0KO
	8mwcNAC12g2qhLfIYkD1ebuWa3UiokrYByKOFW/O4ADJrsxv+x4FJDMc+baEgh3ud0vq2Htor+M
	+4U6A4num/YMJv1eL5YCwMu3XCotWp/224+fG+6qbk1CI96ru9mGusos=
X-Google-Smtp-Source: AGHT+IHo6iptwjLHoC008fHeJacExFtQ/yt4FPE1JbrxuJqLWT87wWnkGmISoMyjSe2C5AN0OuiPUpU7sVlah+CBRFAEPkA9cbfA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a07:b0:3d0:164e:958 with SMTP id
 e9e14a558f8ab-3d13df21e54mr21741905ab.17.1738933203284; Fri, 07 Feb 2025
 05:00:03 -0800 (PST)
Date: Fri, 07 Feb 2025 05:00:03 -0800
In-Reply-To: <20250207122525.2703519-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a603d3.050a0220.2b1e6.0022.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Tested-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com

Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=133af3df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12bd21b0580000

Note: testing is done by a robot and is best-effort only.
