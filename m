Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65561591E3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768806; cv=none; b=WDMZ8ebitrtgcYFa7shs0flXt0jBuumebta3ksKOBG5FOhci6bLrq6WUrDMj0Dy59xr+MPuLKi5TtFk1zTXDtliJ4Fq4ANyfeoiLjfZE9XXyFEVI89hjBHDWNcRo1bt9Dnx9TV3Jij7JS2aa7Wqgnnj5L6ep5fQ0+elBFBoXNxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768806; c=relaxed/simple;
	bh=hqgYXDY6TzZevCdFyLY7v/npBKaFrlvSormMKn5uUHE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JUT0kPCcMk3gdWlHErJkWGqLs3rn5vAjVxkGoZsr12HOq+jDhy7GfBaaczSYBQ2zuOCTN/ru8KouUlEbxf+yBo2QWyxdR7w5ytwKHJI62/UDedTXZr9UBuBp6pyYJuJyczDUhOlaiObA8Nfhe1e4FoZwYvF1+syO32WejWUJ/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d04b390e9cso10070465ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768804; x=1739373604;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwfpopQ/GSunx7RndpriOuph3YS++0aV3tSQqN0eZjQ=;
        b=tpHMilxOpsni20f8WlP5AjxRc4wFHhnyyZqeY/5Y/HCGOcyjpQI9fiqfF44AWVO/p9
         zu6/Soi2DYhlLa4Z+mQ0iSPWW2ZA8VcUg8msWeJcmxNaR2f3a2AOwanzep4h0CqoHczF
         xjg+4rdBZyUZWs4mZjlaOZSQ99wau2Ji/jVnBlYM1XH8Pon8BfzibX+SEuzo8DCN3B7x
         EYfnDlNC+F5PbjSQtD+H21jZTLRZrYZ1bjoXDA4VNnXgZetlo3U4jFe+ISeh+pNlJR1p
         xiVQ4iO1e1jV6ZdNLzpzp/UHNvd5k2+2FVZ9v8qgXxPl/ZCNy3n0Kw+/N2E2WWRUc0In
         PcHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+RSZl6d+glVtd5a722OpdmYt310PgsL/Wet+mrj2RGaIGTm+LU36GauTLdwHZemh752+jqng/12w7Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nA+ERqZJ3CswTxcETnmH62GOoig5Ex/BSBaZvmMzJ6fZsJNO
	xy7q27Vdy06V7S80dRaEUI8tshlzm9NFV5Dburq43rm2SYUgkv4RDA3gDDRBcbonC4NOd62iHFa
	2sDHrJTE2DKBdXb1FGbIERYjCaVQ9XJcKFfpgIMmR766y9bc80B4XFAg=
X-Google-Smtp-Source: AGHT+IEAtMyWhc5FjQBl7fNf+RG9+3+k4csokK468wy3XoMPJxa1oht+TadSAGEbUT8dZoFwHwRU34B/M1moUygTvog7kIyr6KzR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2188:b0:3cf:b87b:8fd4 with SMTP id
 e9e14a558f8ab-3d04f8f6fd6mr27900355ab.15.1738768803837; Wed, 05 Feb 2025
 07:20:03 -0800 (PST)
Date: Wed, 05 Feb 2025 07:20:03 -0800
In-Reply-To: <zv5u3q3m7t5yehblaqnrcz2k73yozpx7nn5mvbkedrzw2jaowf@soiirioxlfbz>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a381a3.050a0220.50516.0077.GAE@google.com>
Subject: Re: [syzbot] [hardening?] [mm?] BUG: bad usercopy in vfs_readlink
From: syzbot <syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, gustavoars@kernel.org, 
	kees@kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mjguzik@gmail.com, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com
Tested-by: syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com

Tested on:

commit:         5c8c2292 Merge tag 'kthreads-fixes-2025-02-04' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108993df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=207eb10d2de1b054
dashboard link: https://syzkaller.appspot.com/bug?extid=48a99e426f29859818c0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=112ecdf8580000

Note: testing is done by a robot and is best-effort only.
