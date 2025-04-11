Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA202253EA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391126; cv=none; b=UKlnIbLui9cfA/wjqCE1V6DnwpP+uSkK4ORDQnY/phtFjaUUH3xvwkUrP6LXdvLTel5ltA+h5I0cCWueuZgHlLUdrjWH2vbrlZl/gfLV++aDWXoYgdNIPJl4cXi9l+6DDh5RVRRxiLI5unPwQKKEfmrzmNmczzysPM0BpvnUykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391126; c=relaxed/simple;
	bh=Q7nX6M6eNslpOwakPZTqmgHlETfOtFKkHPbAbGcM5ZA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m874h9hRnlxMY9DEWPf/Vd2WRfO8Bws7+iZMT5cO/TN48UPJVtrN5RjV4y5CMqrAP0cTUDxJcaPtyudpL3ghvivfNtis00ExgzT/ER+0dbI+EZc9oTkDLRD4Rz4BbWXKYsuE0WF6MgzreJ/E8bwmaHFZbgxeCmm/AF5Kq5ry260=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so4325745ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391124; x=1744995924;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe9Tx7leG+dcnGFNOaqX5bc/oITZz0EijtVRnEXj/Fk=;
        b=iPj3WBEjCM6Aqfb/eBVcYLDqIXwwYqwsjITX7rQLlogU5XeP2puinc6WiF6ypv6NgP
         DV7qHbUmPCcgOlnDzrCHyhZLZWTbt/vslRGaxtbmv2DY1X3jFfYxENRH91+/HV9JpP1B
         QAA70r6XNqNa2nZOuIKGsdH1Y84n/FsgnPVAB9dTqmoBjU87rGJrSdnRhhLRaIjuF4XV
         YM+z3QlAaZ2r15WU6S7Ylov+YxbJWyE4o40vQUIQv1Kqz0kdTlsTVkqW/Dfq0rbJcKgD
         a9Glm7yghFWWDfrxcqi52/EXFnNaclR8A4UnXTi9uujuclJvnQ9ZjpbgffTC19zQel0c
         r4KQ==
X-Gm-Message-State: AOJu0YxaUgwbGyidXS/1aOdhtdkQQOejlRaVFdArFgDZsonc4gcyNZl2
	dv4FDzdftM519+GOc9xkxdJ4kkTYlksHp1Iw9la22cyG0lnhW0/uADNlf6cKPDEFuPiZJ6hlBZi
	cOQpfgdKErqxnuKy/9B6mGjanCqNVByRI/WH3Rt+0MClxOIx5jY/say4=
X-Google-Smtp-Source: AGHT+IE7YShYOepmIxuLq21efy6APotluleYNJS3OWBWeIavsUTqSeK/41y/rl6BjHP9JO4dXE8uwAadL1nQy+i56hxadK9yXJG7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378f:b0:3cf:c9ad:46a1 with SMTP id
 e9e14a558f8ab-3d7ec21c324mr34765125ab.13.1744391123907; Fri, 11 Apr 2025
 10:05:23 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:05:23 -0700
In-Reply-To: <0000000000004aa700061379547e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f94bd3.050a0220.378c5e.0000.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH bpf v1] bpf: Convert ringbuf.c to rqspinlock
From: syzbot <syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH bpf v1] bpf: Convert ringbuf.c to rqspinlock
Author: memxor@gmail.com

On Fri, 11 Apr 2025 at 12:18, Kumar Kartikeya Dwivedi <memxor@gmail.com> wr=
ote:
>
> Convert the raw spinlock used by BPF ringbuf to rqspinlock. Currently,
> we have an open syzbot report of a potential deadlock. In addition, the
> ringbuf can fail to reserve spuriously under contention from NMI
> context.
>
> It is potentially attractive to enable unconstrained usage (incl. NMIs)
> while ensuring no deadlocks manifest at runtime, perform the conversion
> to rqspinlock to achieve this.
>
> This change was benchmarked for BPF ringbuf's multi-producer contention
> case on an Intel Sapphire Rapids server, with hyperthreading disabled
> and performance governor turned on. 5 warm up runs were done for each
> case before obtaining the results.
>
> Before (raw_spinlock_t):
>
> Ringbuf, multi-producer contention
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> rb-libbpf nr_prod 1  11.440 =C2=B1 0.019M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 2  2.706 =C2=B1 0.010M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 3  3.130 =C2=B1 0.004M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 4  2.472 =C2=B1 0.003M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 8  2.352 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 12 2.813 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 16 1.988 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 20 2.245 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 24 2.148 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 28 2.190 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 32 2.490 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 36 2.180 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 40 2.201 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 44 2.226 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 48 2.164 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
> rb-libbpf nr_prod 52 1.874 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>
> After (rqspinlock_t):
>
> Ringbuf, multi-producer contention
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> rb-libbpf nr_prod 1  11.078 =C2=B1 0.019M/s (drops 0.000 =C2=B1 0.000M/s)=
 (-3.16%)
> rb-libbpf nr_prod 2  2.801 =C2=B1 0.014M/s (drops 0.000 =C2=B1 0.000M/s) =
(3.51%)
> rb-libbpf nr_prod 3  3.454 =C2=B1 0.005M/s (drops 0.000 =C2=B1 0.000M/s) =
(10.35%)
> rb-libbpf nr_prod 4  2.567 =C2=B1 0.002M/s (drops 0.000 =C2=B1 0.000M/s) =
(3.84%)
> rb-libbpf nr_prod 8  2.468 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(4.93%)
> rb-libbpf nr_prod 12 2.510 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(-10.77%)
> rb-libbpf nr_prod 16 2.075 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(4.38%)
> rb-libbpf nr_prod 20 2.640 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(17.59%)
> rb-libbpf nr_prod 24 2.092 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(-2.61%)
> rb-libbpf nr_prod 28 2.426 =C2=B1 0.005M/s (drops 0.000 =C2=B1 0.000M/s) =
(10.78%)
> rb-libbpf nr_prod 32 2.331 =C2=B1 0.004M/s (drops 0.000 =C2=B1 0.000M/s) =
(-6.39%)
> rb-libbpf nr_prod 36 2.306 =C2=B1 0.003M/s (drops 0.000 =C2=B1 0.000M/s) =
(5.78%)
> rb-libbpf nr_prod 40 2.178 =C2=B1 0.002M/s (drops 0.000 =C2=B1 0.000M/s) =
(-1.04%)
> rb-libbpf nr_prod 44 2.293 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(3.01%)
> rb-libbpf nr_prod 48 2.022 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(-6.56%)
> rb-libbpf nr_prod 52 1.809 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s) =
(-3.47%)
>
> There's a fair amount of noise in the benchmark, with numbers on reruns
> going up and down by 10%, so all changes are in the range of this
> disturbance, and we see no major regressions.
>
> Reported-by: syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/0000000000004aa700061379547e@google.c=
om
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---

#syz test
