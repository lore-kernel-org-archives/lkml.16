Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238762BF002
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095869; cv=none; b=fvU1MwbualGntdtgj2o3+wLuFH+DTfSA8NULxadIvPtH3p7/AhtZzxDkt4ubeUDp70qgN4v64N0wqIkUiZKRPuhymeiLI37evWs07ynRWDWpgu15LSbGj++lPskui1+ElOrzGgYxadHtZMdrXwo8O0fZFk7G4MLTgExKw8r1MRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095869; c=relaxed/simple;
	bh=vxpaOH/Gox36dSnCROY4WD3ZR+EVmjITyBrlZ7VmBTA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fR5AFD2PaImXxpRmjhMC8xg36g4BPZtnucs0EITEj1CTei4PJP2pvU663wKAco3CPNJwbzxn3MuQEw/ijMsSbq3am5D44d53NcmBV9ChXE0aWRknlAsShs0Bth8J7OJP/li7H2fls0NPszTZOib6HipXK9XI+i9C/uYJJO1sFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddbec809acso56925895ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095867; x=1750700667;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxpaOH/Gox36dSnCROY4WD3ZR+EVmjITyBrlZ7VmBTA=;
        b=AHdo4iRBZBVPUWNm1A7tu44jUVlSerPOpwFinAWh4OjLDuZzrLX5vKruo8/W4iSEam
         /xRUxKUshIlxd4/hhQrrke+2Q0MESoeQdLCmStO4JndBN9Jho3hrGXHJCRuv4P9xnLYB
         BAwWew5gCS5UiQtq5bsy9t4yJL2pQQtgWTYlfsbXwdrsSBAGhyYApik9afDN/QXhZtiL
         PuxU6DFAvzyjV6XxVCiBO1hV+Ah+O2UQO9pvdmUSSXhlRy1tgXveL6PxBBgXt8Rz0yWr
         j30Z0Zy5OYL27k5QWKNV1haf6Fc4qDFjoMprpcUcxb1EXjE0SeWGoomSG85f98cRxsSR
         Td+A==
X-Gm-Message-State: AOJu0Ywoo431qXDikO+uEum7jGfusbN8VoOuFlIrQ7uOc3deN5plRewa
	sJiQEZ9sQPPHYqhZNU7FOpBBzql9jJD8/pXXBl5012yTd7+p4GNV0GkaixriMlfV8Fus5pu6IY/
	H5TYmDMhr0UAdESlZMWm/YqicENvxPQQuGg+r0iK2A0FTMWlFBD2rJnGRREs=
X-Google-Smtp-Source: AGHT+IG8CovACyJuqYQTCqH70vb1GSeDK7Jxn9oqmg4dGFIjq8wQDRGz1A2Mi8E8qyMqGTajATu7JIfUII8TKmNHjivtMv5mYE6t
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a06:b0:3dd:d98c:cca9 with SMTP id
 e9e14a558f8ab-3de07c4c2d9mr128438095ab.3.1750095867296; Mon, 16 Jun 2025
 10:44:27 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:44:27 -0700
In-Reply-To: <684392eb.a00a0220.29ac89.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685057fb.050a0220.2608ac.0006.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
