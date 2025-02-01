Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085FAD2C
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738378086; cv=none; b=f99chuykCqKp9DyRUxEoPaHGQpI4KozWvQ+j2xwvlSAfpGEHi6JmmmA3QOmYMq/c5finjBVYWeyzoPX31Y986AykVUZYjDOtOw9tyq6I8AU2wWGZt6FdfKl77QX9cnKuJBWG/qCVxEqXilMAnk5TaEminfVPHjNCfHkwWRQiZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738378086; c=relaxed/simple;
	bh=RnpiyWOXN5wWv1l0EnAlBZxIDdgU2mOg8xTAGsZelCs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WxxOp6N20LV8nFoPSidY+xFW5eLWX2pECptaByqewC+CYb2itl4U/s4xz9DYTEyUHS7iVmbxzs9iNdzGmiTf2PfPHV18/IHyd9YHdHRkMoDoBe3Dbbr7o/Uz2YJS8lcuZClnLY9fnSybCCqDNfNmCocX+vShZJBWZrgK0W5126o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3cfc08132adso37961645ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738378084; x=1738982884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxuUE0T58b6YpVbsSM0dHdoaMpqgLm/gI4zijFogwUI=;
        b=V6Den9b87uL1pvx9EndjJ6z8JNaTxOoSn2sLfeQUqzehiS0QFEEqzV02IqS3o8CXJN
         5FpyLB9mbEwnh3Ov2SN0mbsTx2w3v11x0gTc/JtoB1wPTOIY4o1FuGwG/R8ZRhMSdv9m
         iydEDypeo8oWcrxueHpFcRUlDE034ZJuUMXB/09vN6d0jABxBy3JJr4Peu/ibESXw1s4
         xGB+bw51l08EPWDGUjTSTSDrLFIy4VrQx8ViuCMACnKr7o+ytfjnGBkeXR/ULOfVWj12
         qcKix07/f1/dh2qQml9XUeGxfMftkr9y1jeDUKMuhSiVC4bkt4fU7WfEjQH5zaurOajY
         LUGg==
X-Forwarded-Encrypted: i=1; AJvYcCXvqGypQ/OA0j3c+u9x5pM9GOlMswa+10kCdIZGuHgocFt0uKFyAM//0YclL+ddBhwsnq1pst7grh53uFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCon6xgULWZJjtxH9W4AoqksUBZO2lw570eKh1cnkNr9mMR3V1
	V9ZXdGz1oYa4WTyXR/vMOirdnPmgSAMezZpK98b2QbEQ3kJ44xua9jv2tnxjAaHdaSs6cFzDcDW
	uIVbBxdCt/sT46jYzXTGLdMN79N7cuT6L48MwziUVmokcwTqlIcyiqy8=
X-Google-Smtp-Source: AGHT+IFK/n1PaMAty3kDWfuhSdFVHM9cmjMskpq81cvD8n9tMvNa1pCYgGPMNkE0gqF7LRdIUAoXYjfrZ6vro84MyNak95sex2dt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:3cf:cb93:de02 with SMTP id
 e9e14a558f8ab-3cffe3d1ab1mr99938165ab.3.1738378084551; Fri, 31 Jan 2025
 18:48:04 -0800 (PST)
Date: Fri, 31 Jan 2025 18:48:04 -0800
In-Reply-To: <tencent_8284967C36CA4BBA7491771966AC3D993609@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679d8b64.050a0220.d7c5a.0059.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
From: syzbot <syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com

Tested on:

commit:         768b1f5e tracing: dbg seq stop
git tree:       https://github.com/ea1davis/linux ftr/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=13549bf0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7acebde734703260
dashboard link: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
