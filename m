Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402628D857
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056147; cv=none; b=tu5a8R5Z27xlcCkBEKSNlbjkK+KHUV2oUos7+YFuSDA6cLYvcb/RoO6/KCKz84IZJGiTaWahQX2w5baP6bcmhT28fL+h8gNHse6F3T02IZeDYdamATzknlFzKOM+zOxoNpEKP9Er4/RXiMFdKQTi/qac/bYTsa+X0PrDDI+C1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056147; c=relaxed/simple;
	bh=devXGGTl4DFBk0hfDQYT+VXZS73W2OS2D90j3Cs28xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvCOvpNMKjLQoEu2WmWh41nGMJnt67ej09DM8tEE4wdF+pIO3Nw4jmZq4Aw73N+gqMvxU0jv/5t4Hs9w1kqLLVAXQuvqklQnjzcmjbSnag9G/Fh6GBs8DI+j0IwusCe/Xbj6hUVJvbG0oR0mCVSjEh2Ip9kZLPOs7NZp5bNUz1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K09Bq98w; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K09Bq98w"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso43265961fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747056144; x=1747660944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxfQxcq5BBu2nIwTspctDTWvHfOZ5xVRTcaBJjw0co0=;
        b=K09Bq98w1EpFzFYcMrDpJMhtAbVkvZC4waLkje3yhkSzWqBf152/TBblOAy3HM+Tqp
         F0Mf4nXYSpCEFmly6h5khPzF95pP4fqeYN0x42OvEV0gRsvHzMM42Bc9RjD1AvSrdgTJ
         2t8E1PfJgkQfSwWBJDsluyYY6NwOxjOAMru/owWoTvY0GAHGr67Ym9zqzjM751L43CPa
         sJvL4blFiFQdaNkt8+6P2yGxpBes+fpMv0grAw0MlYZqOtt3mz9iC8mGDg2qxlaZb//n
         i5Ch/jUy60I9o9YdzGdKXR5gTRJNd5Z1b9K9nYDbvGwCadeSVuyx7GMLPRRx+N3/1e0M
         VM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056144; x=1747660944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxfQxcq5BBu2nIwTspctDTWvHfOZ5xVRTcaBJjw0co0=;
        b=Tt/OMJ3mbkdw3Nt/YQ8TGW1MsoY8sXudtQI5TpJ5MqCpbcKFSWVsXD4ZE3TzhvXbOQ
         RMNmRE72VP16w2biSPIOaNqFjuLZOhT81/bITbpENAv5y/oQdOVUxId/8N4TbK05GDjb
         +6hiBUJenwhhf+LC14kTWS8kwteu+kwiwxPpK3ftOLljmLisQwoxYCChJpjPBECZTSk1
         t1sFqeYTQZGy2NLq8Z/P9BMHsgnvtc/4HyDlcel/lCBrJxI9PoG6v3PzZjtqEDphn808
         Y2H3s5ZntZ55IiEY+ZaiZrIkr4aI68r6/Lvb6xt11IUFxD409N+CMb9IJ0wGwQckW+G/
         QjaA==
X-Forwarded-Encrypted: i=1; AJvYcCUo35zxnvnF9JZhXZGDNJ8j8tfeHPETRRRA0fF9Qmo5TabGjT4p33QMxcOefzWzIQTgHj27TZxmL702hq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6oSs7I2wVjJp2tECUdtVQfk8sgoAN+lLzkdYz/vmEGuMx/naU
	DCnMGbjdPQ6+/WbxOGm0jzurU5Ayk0FwVjJLUpEhf6AHkFcHh0jH/tYR4az9zW+RkZXXJZ6NUSN
	vmJIMEaKoIUqN94Hb4steyMibEeO7wSLPVZB6
X-Gm-Gg: ASbGncvTU0OsqaU7sZ5H87eQmvGVmUteCLaDDsTOEui7Kbfa2Wb0644DTgVAkwdXXsu
	Jrbu56hvmXdpl+8EY6kEul8GrluCl+mcEHeZVkbHlOU7aIDBjKfHgcTpaKRYUMmwjrUiuoXaNRw
	3qEQ24ftXugGt1KBWW87aFVovmy1W0gm8XROGhzMGjw7qAxVO9QR2Ym4+te/yhdoU=
X-Google-Smtp-Source: AGHT+IHJ0J3uWkk7U0OJTsKkGCVoc1wLn6lNVuY2eD8aI4/X4UvTUJC7R+SKP6Y7Pq0muiFKVQNrWuLAUMwE86JkihM=
X-Received: by 2002:a05:651c:a11:b0:30b:efa5:69c3 with SMTP id
 38308e7fff4ca-326c45f2969mr53857651fa.22.1747056143763; Mon, 12 May 2025
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh> <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
In-Reply-To: <20250509121036.GA92783@mit.edu>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 12 May 2025 15:22:12 +0200
X-Gm-Features: AX0GCFtzw9I9FmLNWVQ1hmmtOBCaQ8ajwJAZHoD_IV1RujUj26dE1DoyFijBsMM
Message-ID: <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org, 
	linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 14:10, Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Fri, May 09, 2025 at 10:03:13AM +0200, Dmitry Vyukov wrote:
> >
> > If we can't prove it does not have security impact in any context,
> > then the safe default would be to say it's unsafe.
>
> In that case *anything* could be unsafe.  You could have a context
> where (a) you aren't using secure boot, (b) /dev/mem is enabled, (c)
> /dev/mem is world writeable, etc.  In which case the mere existence of
> /bin/bash would be "unsafe".  Yes, this is uncreasonable and unsane.
> But that's because the "no security impact in any context" standard is
> insane.

The official documented behavior is not unsafe. If a user made
/dev/mem world-writable, then allowing any writes to it is not a bug
nor a security issue. Let's not mix working-as-intended with bugs.

> As far as many file system authors are concerned allowing automount by
> defaullt is insane, and is apparently the fault of some Red Hat
> product manager many years ago.

This is not even about auto-mount. Let's say I am mounting a flash
drive that you gave me, how do I ensure it's a safe image to mount?
Removable media, portable drives, and some use cases related to
mounting images stored in local files either deal with images with
unknown origin, or can't provide 100% guarantee that the image wasn't
tempered with.


> E2fsprogs and xfsprogs now ship with a udev rule which disables
> automount by default.  If applied, mounting a maliciously fuzzed file
> system requires root privileges.
>
> Of course, distributions are free to change the default, just as they
> are free to ship a system where root has a default password of
> "password" or /bin/bash is setuid root.  It would be insane, but
> product managers often do insane things in the name of user
> convenience.  In those cases, I would invite that security researchers
> file CVE's with the *product* as opposed to the upstream open source
> project.
>
> If companies want to assign me a chunk of headcount (say, 4 or 5 L4's
> and L5's for 3 years working on thing but ext4 hardening, plus a
> full-time L5 after that working exclusively to maintain the ext4
> hardening featuers and fix random syzbot complaints), I know what I
> could assign them to change the security assumptions that we have for
> ext4.  It might require a
> CONFIG_EXT4_SECURITY_IS_MORE_IMPORTANT_THAN_PERFORMANCE parameter to
> enable all of the hardening features, but it is doable.

Question of resources for fixing is orthogonal to classification of an
issue (if it's a bug or not, if it's a security issue or not).


> But they aren't, so I consider it to be *obivous* that the industry
> doesn't think is important --- just as Orange Book A1 certified OS's
> was a total, complete, and abject commercial failure.  And note, we
> don't assign CVE's based on the fact that se all OS's violate the
> security trust model of Orange Book's A1.  :-)
>
>                                                 - Ted
