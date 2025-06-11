Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD49219A8D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682806; cv=none; b=ITo6uH6eiK1CpI94H0r5ygNNUcpqKT8chFmq10Ji4+fgiHm4vHyvIGPUG9fgLhH0dBDblPIxX9myh703alo+8wWxeDKJS9btYVVXDza6c3YM1xjqLg60C4eU4uUZltm31JsX4ZJdh4tFAE5CXIPrhDQ4iDSnZPBJu/DyXWuRxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682806; c=relaxed/simple;
	bh=Vf49EGmfjQiqZUocvGp+B+CNd2yii4KZkNjbexAHLYM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ArAyaHviWz3CDCg5ZP3h8huNBFDJqRaWMdXs1/3r1Sos94k6QkzML72KNFdW7ZSRYLggE24emyKrdDpaBYtGJg8qSRQNeOsQaNENMAgxbQjNjp7JrmAAJwpe9kc2BvxigffRIbEJtontZAf7jDHtjMKEAc5J8xKCEGrpcYGkH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso4421145ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682804; x=1750287604;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vj0wabI4VIuyOapUUNmfqjGwRxtS9HaDBmLvM1X5Hc=;
        b=RSyn/srGCCbhRHFQSsCfAZgF4BLOz0mE972CacWUM17M+POC123WnbFYlcbs7proRg
         QBFX2Df7h+4X8h/2d2uEibbJ5grMkabavfuqG3MA7xbJ6eQxaUB8+6U1kXL9Vvy37f9m
         Kg89Mc4nCMMGZj9Qn7sfVclK1Ydvdveavuxv1e4akJJgve5kyKa5fWyEjxxEC2qW7VS4
         7+UaMJHxN5QEj3DB5Rx3g7E26Wf6MkLQK2J/XR1aa/wR8CbYF6Hs6N9NCnyXiKhfE801
         lAUkEtcvCfs2Z7MMxFH1hQq8jcAGewF32GQ7eiQeuhkH8nFvUozu4JLAXDUe6kQUl8QL
         b7pw==
X-Forwarded-Encrypted: i=1; AJvYcCVwIR86/bHwhd/I5JCNmnyNpHM8bQj5GdESPa7HhgWgUQc05GtIsdxWt3fduA8/iA3HhOiqrHTrzJiEOBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpQEqbn3Lk+R+Vmkc/9EOoXQz+SUIt4uaRHxQWD1rZ6A4B/0j
	kesGG6b9g7qZJxyz52zVaiFyYcsSMjXwRsFs4r3oDX5oSn3gHkhAfhtRmFS3MgYA9tizauv9QbU
	hQU0E8f71PIHftSCNHaXm0oc39G0EXuJmuaGdQCPXMCzWRZ4Kxis9tOqSqxc=
X-Google-Smtp-Source: AGHT+IHkU4buI3Au8WqU3EjLzuGOxFPtCqXnyADQDPoQih7sVqZJr+jEKYoGzubR+RLMPJCe8HWHbkqI4LrjGNgCKnUGOnLrpgHN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1788:b0:3dd:d194:f72d with SMTP id
 e9e14a558f8ab-3ddf423f4bemr56878825ab.8.1749682803758; Wed, 11 Jun 2025
 16:00:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:00:03 -0700
In-Reply-To: <26122837c64946d89cb5d0a3a568bdc2b4854ba6.camel@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684a0a73.050a0220.be214.0285.GAE@google.com>
Subject: Re: [syzbot] [bpf?] KASAN: slab-use-after-free Read in do_check
From: syzbot <syzbot+b5eb72a560b8149a1885@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, sdf@fomichev.me, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git@github.com:kernel-patches/bpf.git on com=
mit 974c296e39c3b2462bbf1f926d5a5db64399359f: failed to run ["git" "fetch" =
"--force" "--tags" "73aba3dff4d9ee1b85deaa6efdc44b9d57c62235" "974c296e39c3=
b2462bbf1f926d5a5db64399359f"]: exit status 128
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.



Tested on:

commit:         [unknown=20
git tree:       git@github.com:kernel-patches/bpf.git 974c296e39c3b2462bbf1=
f926d5a5db64399359f
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D76ed3656d7159e2=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3Db5eb72a560b8149a1=
885
compiler:      =20

Note: no patches were applied.
