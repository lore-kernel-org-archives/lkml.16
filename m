Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560373D76
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186665; cv=none; b=tfqy2zlngwQQ+qXxjA5FcqAZnP/sxl+9SRZq3geRYJrG8jEpWRc+Fv78C7wp3c0fcAEORhk61TVj+Hpzl9asycdSNYnvROn1mfNi2FJQzbpAOKjaa5MXz5lqu8GP8bZNEXEIGAC/SjKd6tv+sGb106hHiUJDIt4rUBXhFJSDzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186665; c=relaxed/simple;
	bh=lxZ8rOkDSCsFVW2WQ32zs3zoTVWUyymf0py48Q98j4E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ohOabw1uTh7DmfPMXtWpDGKOdPxwhcZXZ9Vp66Lsv5huOpvpckyGjeazi0vXVhWE4Cv/SIrYTCbtxAjwLeY+g7kpXKReP7BEsIvuz1q85UdbxudgIbBIUcDiaoBfcrFdhmJXf1Y3SHISmLElbLdx0h1/fwQHH/O5lVHV0q7BDNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so366825139f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186662; x=1746791462;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GzGElVwrpn7WgINKNMDTHEhcwHxNIwhUYezPmIaX74=;
        b=Oron1ZvQiQMGAmxWFyVRMFm0u1wSFiM0i/M9xYmX5FVWeYCGa50X4MfZ+3NlyRrjG/
         YdZak60LlHSY0WqxUBQ+qnKKb0SB6Z0OCy6ttF+1IVJGBs9IRlDo4p4broDEcrWwVUpm
         8HjrbBNE5Cxcsu5c1o8H87LwNRtwY8ldZjkgfkbx+MMGdIXZ41GdqiDJ2m0P5RA0OCFH
         +Jv3QCpcYGEB5fm5wSaQAVOqrVLDQJKxQh3FhbXMF8dMpHreOZmGZsNLSKq6UcX2FGNu
         LK9m5ruudW4HuCD5n3DhrqQKf6MK4ti1MrK8neb0WDFbwVzehGWl1nRAB4M2rZ4T7iBF
         NoBA==
X-Forwarded-Encrypted: i=1; AJvYcCVhFwnBYXcZcmTXFci6thDMDnkC+EfvNkxMC+8xQwpm48E+zLdgi/cxqvb/eKLG5++jmbdpxU3cNxCTdpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFnLsJBfB+wxRobb8jW2dwJfBtxXNVNX0KCsgIMYI1s6I6mli
	jcmMX3xm53O2ZpcUVhRldsEIeS83DuFOlEj8B9a7FXEy6//ql3eYxhtPXeVyu2Do+cAYW2WwP2s
	hLMN+azvx8gxIIlWqgBSa13M9WeY4gec3o3Oby5ENVT/zTmQSsfUmujs=
X-Google-Smtp-Source: AGHT+IHT9JnGD6WZpxKelt2uNR6CpHn9e5gtYlpxij1xhxDfwiXUAGH0J9rZZR1TszCZi4HVFfYfbExKCA7vaSyyEDPyBvQLsgxq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:388b:b0:861:c758:ec35 with SMTP id
 ca18e2360f4ac-866b424e36emr311382439f.11.1746186662541; Fri, 02 May 2025
 04:51:02 -0700 (PDT)
Date: Fri, 02 May 2025 04:51:02 -0700
In-Reply-To: <6741e9d0.050a0220.1cc393.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6814b1a6.050a0220.33cf57.0000.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in loop_set_status
From: syzbot <syzbot+9b145229d11aa73e4571@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hdanton@sina.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com, thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has bisected this issue to:

commit ffa1e7ada456087c2402b37cd6b2863ced29aff0
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 18 09:55:48 2025 +0000

    block: Make request_queue lockdep splats show up earlier

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1411b7745800=
00
start commit:   f1a3944c860b Merge tag 'bpf-fixes' of git://git.kernel.org.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1611b7745800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1211b774580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D90837c100b88a63=
6
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9b145229d11aa73e4=
571
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D163650d458000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D11652270580000

Reported-by: syzbot+9b145229d11aa73e4571@syzkaller.appspotmail.com
Fixes: ffa1e7ada456 ("block: Make request_queue lockdep splats show up earl=
ier")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
