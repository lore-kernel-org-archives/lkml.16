Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAB1AF0D6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169745; cv=none; b=ckuV8AumDxl/9JPhorHQ4ZmpF1B0eYhYXVk4y59pop1r4mT5nIkEUUBAW7IYJdAoe5Bkff3vdihwDxVV14qIsEJ3G5BAvNpdR6fwTHRblVuYvtzesDZUHm8P92VoRU9rwwGbwXqPdpIz/H7HvJ3YQABzvh8S8YJ3ZDcZG/oyc5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169745; c=relaxed/simple;
	bh=ksFQUOP3EzZfL9D4/0O2XSC5+UR6AEx8dV1lPhH8BeA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jDJj0jzXEHX5fzZggtDWnMbLdi5gnzcQhxSwZNuis+1a+03t7MpOdDeUlGtMG+uQM+dA2CAGXvSGn0RkFP129lXlSoR9UaFE9tpC9G5TowzgITrcJcgnYPHbBDC4YI6In/9yjn42YcwX5LkgDKwEmQgdzlfyTHvZfeRtkqsmpj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d585d76b79so18987775ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169742; x=1743774542;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZccP94vSlfyk6BXUvEnclbkKMxBWU/FoFWjWqAr+xSc=;
        b=Z5GUtchbLGh7+benCtqzfmBvVWrND3sYLKZwe2jQQ3OvJIzMI90dpgp/uEBRC5JGOH
         6NgyK4/DRZoh3ghth3rTSTlJmuzPnL9f4byLvbCqSrSxpQdj9s2uPbxWqfPZXHuJ3SOI
         PZLRXln4J1f4hwKPyvwgaSF5nCKwBl0/OSkErbjTs5L5QqWBNpu6J0sTxgP0/an67h14
         FK37TrYIbK7+clHUFhXh7ztpFzxaCw98vOC4oCEYvzzb1ke/Hj17rzOcrDlqrm2Fxx0I
         W/wpVvX0W+VaTn4Or1+OTsx6ShVblvTbmWGfwB3yGXRy37A5rjylXehx64itQKo/Q20H
         OiYg==
X-Forwarded-Encrypted: i=1; AJvYcCVxdrQrXGB9Yun8S23CQZUSOJDzIfXp6Ih+xGnNt2QAmXxIesdeSgW507Axi4R1FZvJ1I9NrxTbXmKxvgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKx2/6H0sccEMtAviupbHaG7K9BmbAOJyiNoWBYCFaHqqdn9vy
	RQq761934hEYyO2KRknGsYKEv50ipX0pxwnTWVDZ7+KBaI1kGRO8xfgijNz6P+kFEOmyrpXb/5/
	hmk7toj4Cg5yGD09+xnAh1/ow+KaTSZX23ACll8RwTlZIU052w5WCEi8=
X-Google-Smtp-Source: AGHT+IGwRYua1iETzdd0MEmIL3HDNfodpZ6kzAALmumare+moQZbATVg3Tb/phYquDGYuvTGiVbb0t0/KM3tnAOm1426Ww8zs2hT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1689:b0:3d4:28c0:1692 with SMTP id
 e9e14a558f8ab-3d5ccdc1e0bmr85604945ab.5.1743169742505; Fri, 28 Mar 2025
 06:49:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 06:49:02 -0700
In-Reply-To: <20250328132557.GB29527@redhat.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e6a8ce.050a0220.2f068f.0077.GAE@google.com>
Subject: Re: [syzbot] [netfs?] INFO: task hung in netfs_unbuffered_write_iter
From: syzbot <syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, brauner@kernel.org, dhowells@redhat.com, 
	ericvh@kernel.org, jack@suse.cz, jlayton@kernel.org, kprateek.nayak@amd.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux_oss@crudebyte.com, lucho@ionkov.net, mjguzik@gmail.com, 
	netfs@lists.linux.dev, oleg@redhat.com, swapnil.sapkal@amd.com, 
	syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         acb4f337 Merge tag 'm68knommu-for-v6.15' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bab804580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95c3bbe7ce8436a7
dashboard link: https://syzkaller.appspot.com/bug?extid=62262fdc0e01d99573fc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=146b9bb0580000

