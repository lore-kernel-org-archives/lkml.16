Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F791FE47D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597809; cv=none; b=EiOknvxKmGe0Oi2cALBM+Uud7rqDPTXA2TVvx4dcJ4ffabR2JIa8FemaBB7t1OQfGyTfMSCNBnB4h/9lk+JdkKnej7PsJtnEOh2RcAUd+eDuozyj+/5WDPaGy2vTFrYtgfRpIcGc3Ck+LDdskDVw2b1wtZd1CIoQR2s8x113gng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597809; c=relaxed/simple;
	bh=OSvCPQUA/n3VEDwNBMvCGbsPCdrkhEv83kJ4kQDEFRQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tuMA6PjUimpNmRgQDnT+rI53pHEWKsB2mt4+/5cLLef7HpkNcn2esvSGwyoxg1djOD6+tCddvTIg8CNo5GgI0UodstpqzClOgSCIBUamao3E9yWtDtxQRsWGt+0tzvUrBuMHSLIJA2oXFPToLPKJAB0nbuTZs+RW8QAlxmBqXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da76423b9cso851945ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597806; x=1747202606;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSvCPQUA/n3VEDwNBMvCGbsPCdrkhEv83kJ4kQDEFRQ=;
        b=QA/1GBBdx/QeHI3Bw16A7zxySFdmxHtH4RAqqkjYCjj0Xua8d9faDgUMPagR19P2MJ
         cnFnN4QGQnx03PACoC77fN6XiVSRcD74yM1ei+0uktE1OPvjRRaIx3fwYyIldF9RxApk
         XktwMhvknfgUW6gEIk8r6ywjA+WodoOFwfLsfSPeLUtS+NMJYWwXtmHMH+Ou6lvoxfI5
         HlQwKAat7ziU2xz8EycaHumtb9jH8TfEpjXiJs4VUaqi7gp1UJD0VDSUFqYuKTRF+lh2
         jML9aJYb8vblXhNHvtL/P+UqYMTIAPwLcmkGphLPhIqqZ9FlFF+Cb8VRxPDrCkEcMiq2
         Kp9w==
X-Gm-Message-State: AOJu0Yy4p+FBoH5pJXCB92Uzhms+bSTr+UkV61Rg8p5b2n+Dcm7fUXf0
	uBvpgXxIfw0i26wCAbwHcjbRmZSBx3Dyxwz+S6i6iCKELGLi2TommcYg2deFYBIXccZ7D0U1n5y
	lqiD6UpGXsywr+gOrO/QhE+g6TUKDX2wDUsCdmQPaD9eyrbrjJrkZPQA=
X-Google-Smtp-Source: AGHT+IHkoK1v9UPscg/8YEZ5HQuS5ImnWNM6zK6MkoKd82ohPxxamu1wknhGSQPvOO/7uFsJYGJbhR0TiHjo6b03NZcz8id2qdTx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:220b:b0:3d0:2fcb:e7f with SMTP id
 e9e14a558f8ab-3da7386d8f5mr20040995ab.0.1746597806695; Tue, 06 May 2025
 23:03:26 -0700 (PDT)
Date: Tue, 06 May 2025 23:03:26 -0700
In-Reply-To: <68186340.a70a0220.254cdc.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681af7ae.050a0220.a19a9.001a.GAE@google.com>
Subject: Re: [syzbot] #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
From: syzbot <syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
Author: dmantipov@yandex.ru

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
