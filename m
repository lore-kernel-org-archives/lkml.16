Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C67FC0E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466304; cv=none; b=AIOAd8rIho2e3bJNAXi5NH7Ja6t5JhuuJdGXlyLLSEb/Mzxa1X0F5Qdmdxz1Ca9RbWZhtBy47VdCRJpXGvwro/SYc1pXepiPPqWASwGCuvGCUBqi7fowzMcE9qA3vzERw5p8IttwTkMkj9dtWWe/9FP7YS4T8oq+8kJltjbLrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466304; c=relaxed/simple;
	bh=Mbs35j2wkdblQpHANEHKSKsEMT3xeg85n+mm5BLVLXI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LpJQLPUcGZpdV1B+P+7yRMhThnNeZ4D5VcUxpF0/2fYUXyTUGXjqIffHoBYE4smlOE/PNTdVq1KM2VS2mlILmNFdRVvBslKEV9vIvTRgloW7+MiMvsFGcPDXnUhE3VpaC0Fe/YTp7lx3nM194dB9lZFmAJd+HUp94+jNTcS+cus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso15222939f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466302; x=1749071102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsR72okedlv1KsTI5o9c5MS50ma9jyC6SXH+k2hyRAU=;
        b=ophmo4gT2qJ7mXqPFvjE1GBhoEwv1jsFAI8wVUC4+P/c/ROGgnWsNnym0y5DW0HoDM
         5f+z+uzJ/jtK1QS/UqBma+r6tYMOT2+mXkGlJj0t952PzvmVI0mmZmfsEIFuUgNL3kfk
         aw3Gv7XOAlE5zwU6e70YenMz60bOqfLsfn8VWCFYjTkOzBBYiSnx2mAcZDuPZBuaZKbT
         QZJBO72PXzcaW2zs33vIiDSdUiOJMCMT6aG92auyrHDck6s5nQ4cXLfGicmdlctNvA05
         L2k22Gpyf6JWYPWiP8dUU4LuwctIJAqVidnnv+35B+Z6woBioSSr9UXnXeIaEq1MXax3
         ZtHQ==
X-Gm-Message-State: AOJu0YzPZ47GzkQYlwmtVpdLnhzY3gYKBz78rZhz6cIbPcGObfxHY0nH
	rBFSfwYj4L+54NdT+A9OPm6Knal8VNP4h3NGDicj39SO/7b8qZT6+tUeWKNaQeEiS6C8P27/PRv
	bi0MnNAMP7VAhI5NcsKgYQ0i+6+SgGgILFAQ8krI3UeJo6DqJq+wYByYLO0Q=
X-Google-Smtp-Source: AGHT+IH0ywLK4b1AiXXxva86p7i9xZwji+sRv2v3XlF35yO0BoxgcR+0M8Vhb6ZgBiJ4jdaafTQpS19e6IMvgqRyRE88c719VN0+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:3dc:7a9a:4529 with SMTP id
 e9e14a558f8ab-3dc9b75b4b0mr166711605ab.16.1748466302566; Wed, 28 May 2025
 14:05:02 -0700 (PDT)
Date: Wed, 28 May 2025 14:05:02 -0700
In-Reply-To: <CABBYNZJn9-u_w5OWKL0+F6zFTs8JQJLuC8f-FTRQiBgY2w6EBw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68377a7e.a70a0220.1765ec.017c.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in mgmt_pending_remove
From: syzbot <syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com
Tested-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com

Tested on:

commit:         57a92d14 net: phy: mscc: Stop clearing the the UDPv4 c..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10ba83f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff3e28823376fa59
dashboard link: https://syzkaller.appspot.com/bug?extid=cc0cc52e7f43dc9e6df1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=163cc482580000

Note: testing is done by a robot and is best-effort only.
