Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461A298CC0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531706; cv=none; b=s9L2fKiRQNw+cbWvULZC9ayrGEhyCKwf064g8t5BkCFImY2S5BnEl+CenDkU6nYHFW0x/VbiCZvuw37A994VSOdRmeDFka2I4adLq4zi89IQpHtVdXK24piwIuwMbpq+O7slNgaisfBV7BojEcCuo6J6ejTuJUYCU+MZ1TZfgdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531706; c=relaxed/simple;
	bh=OsCZUBi2e1IuGI+M2FHcrA6rQzNLhJ8gwS87st4jqP4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uQUMXrI/xQs+bbGBVtCafr0VqK89hVfOqoYjbfzR+QmaxaS4Xz2EcbBT2P1mKvKIz3YqEZ2dqQ6wOX3LPGZ+81EYmoSkznYzANTAeT3jr79X8awICm8R9ZwnGFV98qBwo8CGNlvRCoZiQDuE0CfaUjNXVy4z+0YDWQ/NfT9PYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-869e9667f58so1197813439f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531704; x=1752136504;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIJwyqQo9Miz3Q8j9Dn1oEkTQKwHxs714rzh5sH59PA=;
        b=sLRB5qrFolqjwd1G2xBJVxF9WPxNq4QtFwHc1AdfJhDM5Q63TfOCraWROUH6i5SZbg
         F6MBvxiKJsrehmevJni2cShggOVatcp5Kxew7F+jfynwDMX9x+T11nHnZSLmFgdJr/zV
         ufoqW0aHOBuc08btfeauMsgm1vbIMa7zQTMoWSvTrKvi6xdEOMMnZ/dxGZ2wH/SN1pQD
         ziP2SnsPTdJRMuZ94T3rE1HpAAGyU9h3641XhjuRLnJUbAnb1oZ0619aN5PX8K+s+cBH
         Z00ObhZtTtNHQgbxQMKvyfd/tfNUwd+/4dQr3ZGyA73lzfa49ZKEMyq9FeDM/1/u62Hv
         DKIw==
X-Gm-Message-State: AOJu0YxinngkSBQESB3QEzwRhomRR/rGe5r9ylFHdHJKhsajvXLanMtN
	o1VY5Mz0PlU+BiJ5+4jFdu5Cp6vTudV1tWzbLf80X+OxCmHK5bS60TAZFIj1D0rbz3q2kJ66tLV
	lOx8sH7w/qwuDJWoJl2vN6w+CVtB0jtI6qxgutY7cKY3IDzv4nKEimELcNfo=
X-Google-Smtp-Source: AGHT+IEmePEhBLZ76Xd8RgCpASnEakVw+aItDIx54DzD7UdA3HQGUAlcrYMFob/+uI+UlgG6yxMCeyStZFoJrCeQ/yAdoqxnaUfH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1655:b0:876:8bf2:e4d2 with SMTP id
 ca18e2360f4ac-876c69f23b2mr739182539f.2.1751531703790; Thu, 03 Jul 2025
 01:35:03 -0700 (PDT)
Date: Thu, 03 Jul 2025 01:35:03 -0700
In-Reply-To: <20250703011717.3952009-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686640b7.a70a0220.5d25f.085f.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com
Tested-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16ab0c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=105dd3d4580000

Note: testing is done by a robot and is best-effort only.
