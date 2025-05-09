Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F527586B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780233; cv=none; b=tM9tg4RKH78RSgHIhXt1y1MKdE2Dgko9JIqTeIoob5NRp6FUTozNQZhnCD9VBGjKAR2ykw+gmjGKixhUdJ7NhoLn+rU/TlWfFlNfej6WYJuScM9PAuMVYCyieE/k3f73xiOoSA9PrZkJw8AR5YNvmaAumJsHZVMGf5smMqsHHMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780233; c=relaxed/simple;
	bh=8CZVkRUpvkNhungcxcGBPJKU6Dk+3SpYIt4i+kCurjc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N61IgybtgLoTVi0gvcojLkcnsomlgUp5Yv9HcfTwlu54ifcDIdbKAlG0WC891lcNe+AOvO+Jij3q0W2yYzMWlZ5vxxV0NcxoRcUBNCNeJpuyiamq4mOVkXCnTa4yj2P2aVRnyf7LZNVMx6un6FQ87yLUuwyUOX0+GXxHx3nsHSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxXUtcj3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxXUtcj3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1914325b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746780231; x=1747385031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HL2CxNcs42dGwKsxps16DDxBI36JeRVwWDJNnlQeSLA=;
        b=fxXUtcj3eVXmgYqT8gTrdUshUlcD8t/x9MGbsTcS/A5SDvVqgSqLKYStq8Sr5G8b4h
         PrpUTOwK9neyNIgFPwtA45M3ILVZevuRLKuuqMziDT/1K3o5vipbN8JWq3kpZbGA1xMj
         QNSVoNZKEm5xAoXonVzDCYvzciOPu/xLLbFBEJyu+Kd44P6+a5iIBXWwRX6Vad9awUe3
         4zM9j4DyrLvPSZhL8wSikTYXmIb9B2Ykd2NSv2ZoKBDnznDmcypRg0BF+aRO8CmCvl22
         mCjgWeZZRTzfpNQynm5DqoELZPaQ+Zd2Vg2njoJ45SqgDozYeBLsKnHJWUHV/1E8k+Ak
         PBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780231; x=1747385031;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HL2CxNcs42dGwKsxps16DDxBI36JeRVwWDJNnlQeSLA=;
        b=D01FQfs4kgcWsF7ub+uqOEKOhBddi3nIO/RPIk/ohtU5gdUdohG9cW/C9GpHyyia+g
         tcCZzyIrDKMme+OH6M/yIANkXVHASybeYQRNWxqhibJRW5ni2LvitSaBMo8zJQcvrxKB
         yRh/oay0wbZAWD+JmlulfWn4DayvZYCMsmsdemcVmnSQa7xCjX2OXICGidlivPzUlls6
         TvPLTb0D6JYB6ptO5jhgRJBPnuC5le3omJH3BwRbAr70X1UwnritqXytDotwJTsuXpdV
         nxX+5GXVqzPKMtsjlH9CJkJvYaZ1Zu5sfnIuDQSJWewRUT3cHnZ0HNhyPKhxVr0YVnFj
         IZrA==
X-Gm-Message-State: AOJu0YyjJ+hQ5hHIPkEk8Q7o7+xIMjZN849X7yO41wujjvpeSMen9LVk
	ucHlA6tsEt65jxBYn8zEM8sRSsVGBmB0TEy0/24PVrlu9p4wvqqGKR6m4xCdfH/adH56U5RdXrF
	yZJclid1ZOs4uPgqqcm9M2tBbiN8=
X-Gm-Gg: ASbGncs9eTITMyOT9fBOjWSOYiQfffDZzjjL74cAPiAWx0wZHdjepYjbxXEiUdaf5gU
	Y+y1j0dBKwIp5+h3W4fuH0Mv68MoXKZZmo0MHMTmpVIAaQKjfCYol5AxUN9zGJ6kimGKBv+QfDD
	swGzVmHF/v9eG8tYapezTT6w==
X-Google-Smtp-Source: AGHT+IFsI2H3Lq9ryumhGQfyiV/GryvZK6O/vJiOAoGFdRjNu89ZmK8QBYwwlxs9cFcxKugiLhWVYTSsj1xsKih6VAQ=
X-Received: by 2002:a17:903:166b:b0:224:c47:b6c3 with SMTP id
 d9443c01a7336-22fc8b0fa27mr32187475ad.6.1746780231178; Fri, 09 May 2025
 01:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Fri, 9 May 2025 03:43:15 -0500
X-Gm-Features: ATxdqUF6xZFY2N3jFR7N47kBU_EZ815g2_M08tMq1z-RMhoHyapPRpRBLj0Flps
Message-ID: <CALaQ_hqA_m8OQvygQ33qe18c7RHYVfzg12vxpnBS521282154A@mail.gmail.com>
Subject: "scripts/config" - 'This file must be called with ". " or "source ",
 and not run directly.'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

First, as an aside, when I ran: `scripts/get_maintainer.pl -f
scripts/config`, I got:
```
Bad divisor in main::vcs_assign: 0
linux-kernel@vger.kernel.org (open list)
```
I reported that prior to this report, so I didn't know who else I
should have addressed this too, and picked what seemed right from
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/config?h=v6.15-rc5.
Perhaps it's related to the git dir/worktree being in separate paths,
or the clone having been shallow?

Now, slightly related to https://lkml.org/lkml/2025/4/8/967, I believe
the issue stems from `bash` being used for the script, and not in
POSIX mode.

The output of `scripts/config` is:
```
This file must be called with ". " or "source ", and not run
directly.Manipulate options in a .config file from the command line.
Usage:
<...>
```

I originally had been setting the `POSIXLY_CORRECT` environment
variable, but would have to unset it during a kernel build due to the
`bc` issue linked above.
But in my script testing, I encountered an issue and had to break out
of my script before re-setting the variable.
When the "scripts/config" part of my script came up without the
variable set, I was seeing that "error"(? not really since it still
runs I guess).

I don't know if there's a reason for forcing `bash` to be used instead
of any `sh`, but I guess bash insists it be sourced or run as POSIX.

If you create a test script:
```
#! /bin/bash
# some comment that will be seen in the "sourcing" "error"
echo test
```
You'll see `This file must be called with ". " or "source ", and not
run directly.test`. Note how "test" was echoed.

If you use `#! /bin/sh` instead, it'll make use of whatever shell that
is (eg. symbolic link), and the shell that is called will ideally run
in POSIX mode because of it.
bash.1:
```
       If bash is invoked with the name sh, it tries to mimic the
startup behavior of historical versions of sh  as
       closely  as  possible, while conforming to the POSIX standard as well.
```
