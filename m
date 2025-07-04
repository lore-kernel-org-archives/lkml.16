Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19822836B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614206; cv=none; b=KDH2Fqlum9+69uipl0EKkax48TeK/F2KskWs0KAKzhfk/zb2UWZCpwVMYSw6DfiZjola5CrWKxz9nbNyxkUB7oE9sHWJUofc/p2Ao76AJMexcIwi928GSPJfkBF2hEP70IiDKb1GgItAJBp99wTfEk8oYSIQ8K/1lZIRcip6CD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614206; c=relaxed/simple;
	bh=2xu+rR+t0HC/gk3zhkZXJejIT5iJ5KMBi2PAigq/pg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s2Jx1F0bMikRRxSWHcFZNSnjMyk79rig/0wZzpXHTRUMq1aPS10oCnlsPU+G2ZQmqeAgBXqWT69khbTIRn0MpbD0aJhIXxI3BkntlaaPpBiP+LsT3JgUp0W4bCLYSIhrg0GymBKwqyF4cLs8D7+gNd5Xr2lA0BLg5QZUQHU3Xj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86463467dddso62584139f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614204; x=1752219004;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK1xSCb2rHdtQR1a4eu+HPubir72PmMf8vYKhieMVN4=;
        b=PHTzMopsBsz2R7/nYG8ntAzmd1VSO7ydfMcmjK0gutXOYvYJOOgTM2kZRoM+0ZYt1+
         EfVTQbdi7+30krRvsjDwxobnB7AShH+6pHW5sVFCrBggHaQB87awtin8g2wbEerq+zls
         ZfkM8YXYblHABrk3HxX3VzgzVSQDD4OLbPW8VediqOqZTYzQOm5DAqdjYJxI7T+tpz3f
         TfUjCpB32ATaUPW/OaZaCNdsdSjSoa1CWMwpWo8BxAdaguX7S0/GQy4TguZm+gdpMGM3
         kA/wqtUZcjbv73M2tMnfePelBLaIhQbgXnhvGDBxucrZi3WYO8AmAL/JAe5H36YCltMJ
         JLNw==
X-Gm-Message-State: AOJu0YztE3n0faZkKamvgQsyszrR2H/zHPrQVvcmiACIBqypr80SUN0h
	LH+cB8O2NpGpFO5FY0HsrViJuH2gLhA5GZEEGx8bTHcGvY6deIRGJzlTDh90Ro2VMCjsjGmGSS/
	txfE0572POv+RvIEPgMm56DvMfgbWYyFCvawf8XL+6m3UHbyuDv4UqTkR4Wo=
X-Google-Smtp-Source: AGHT+IHPAHCOMgPCNsIFdNwBzRzWCu0VC/Zvo0Y4n9L54/x6QnFmD+6doMNvFXm3wtBI1PCdTYKlfULMaIK/djDsT0eFXif2bpAp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2591:b0:3df:3222:278e with SMTP id
 e9e14a558f8ab-3e136ea4bf6mr9433395ab.1.1751614204000; Fri, 04 Jul 2025
 00:30:04 -0700 (PDT)
Date: Fri, 04 Jul 2025 00:30:03 -0700
In-Reply-To: <20250704063547.3973319-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686782fb.a70a0220.29cf51.0011.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
From: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
Tested-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com

Tested on:

commit:         17bbde2e Merge tag 'net-6.16-rc5' of git://git.kernel...
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=17ea0f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6dba31fc9bb876c
dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1698548c580000

Note: testing is done by a robot and is best-effort only.
