Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971441C63
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749398482; cv=none; b=Ym8v74g42V6GPCoHEsWjSwJCs0Wl4Nk5Qh3j5CjwyjkJvMzklNabw7aHcDmp3S3V9pDMlD9Q9xmboLU2bsYFoKzKy/IUHC045/nWKUuZIZ0+dSRHvfw6WGtLBtqCDiR35w4ac3GuLo/dHi6XUpJMtV6lenDS46Qj7db2TEvtuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749398482; c=relaxed/simple;
	bh=1c/8Z3S9HFLo/NGiVffQ8UVpkJS0/j+t6Lhx9xTf3d4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eXmRyeYWqj3eMgVhs+ExT2fjZzbyfYba5YJlDsprTwlgL21jDm0jg4KU+Vfh3q8cFabENVsDa9FwAzzF+lIszvMkXXtu4T+W+BM3YLQTRT/NiUxe9o3/4lIg6EVBXMWYp9/qY7Za8Ua32xaXJUmZFNdu8SNHG/bbJb3zvPNm++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8730ca8143eso422924039f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749398478; x=1750003278;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBT5dGqMXxuczKSv0ZV4uIRoP5Rf7EsKTIaka/1977k=;
        b=hOSzQkOTMxeX8MxSdxwFat2WrSHDpwHbN5GpfocMyJbJxuSx1F6qakCbuO+mM0/Fqm
         IiCqSez1zcniSDz1nz5PYQTHheKTv31u4LRCXq9HsI8FVXlGLw6iDqT+Mg+y3/jt6DPY
         FM2HOz0Bb1PFNH/fEwqE72COKSQqrRDxyBWw5bDgFQewTVjllR8lpzRPBokjt0TrhfLI
         sunmZr8Xs6+ikNxmZTLseCQvgSc5Tx/UsXLWCFl2c4L3rSJ+3Q0rybYJfxXbA9XYoFx9
         +Jd/Yo/5q5Z/YS6ZDozH95D52Slru/3kHoiOTdLtehkASIInZLZWjmNR7w9f4HydfRk0
         zYhA==
X-Gm-Message-State: AOJu0YyLRoNmo644KS3z4AF97oW4KkwG0cGlooBgG48xO2cyX+MF/z9m
	PlnJtjUHAoT7SPMH7REshzw5n8/tDu4GnOi4/v7FQlvjz7s4TcfBF9kofFZee/oCbuJMGl2yNeh
	yH/h7PwzfddIpbjGCOTSEJJ/Qf6tyr9Kvio0nuOgR1R7iQZ7Y1BayXdo8fMM=
X-Google-Smtp-Source: AGHT+IG/J3gj1VbizZEK0DaGq9fQ9gVSUf4iWylqk/wGb9ZYTBBlpHbU7oX/05n4zfyKS9SwPAfsJlv0oBmG+rbFsO97JO662pcI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1787:b0:3dc:79e5:ea30 with SMTP id
 e9e14a558f8ab-3ddd7eefa5emr45503025ab.9.1749398478401; Sun, 08 Jun 2025
 09:01:18 -0700 (PDT)
Date: Sun, 08 Jun 2025 09:01:18 -0700
In-Reply-To: <680fb51a.a70a0220.23e4d2.0033.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845b3ce.050a0220.d8705.000e.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+14c52d86ddbd89bea13e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Fix downgrade_table_extra()
