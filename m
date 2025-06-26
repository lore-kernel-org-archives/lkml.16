Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F2237717
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921437; cv=none; b=tm0CSO6HhfaIZj4GVLjS1x8KslaNGkcmIyOTI+2VGpIjRd36I4tbvbTD6moTaljeFcaiwxsmZ0J4rJxVgcoqSh29w9cUCBXvxzg6b+xFXfdIFhjUCodFT4np9lmWuBX7iUIDrAa7mZAM9VDTrgqyvwMnpm5zucaOopJ9AjxaRgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921437; c=relaxed/simple;
	bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AKeGI3i3MiC3KPy0CjH1a5AHYcYZA2WgzM0m4+iN4YQdYfL10HLwomTksUjoXJz5DAFhUMm0sLmSXqFnBKMcwDhTW5JdRPxK8/wOdLKJYb3SUUsX6eZDeJwh3WadiHHPjIsRVZbIlUQMSHKjjb9qqra1V82J2E0O5/loInxnQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UO2yXuDg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UO2yXuDg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3137c20213cso736319a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750921435; x=1751526235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
        b=UO2yXuDgntwHQ6MR8cvQeo7Q9IirTmfpF4LlGbTd9hES9M+eDcsJ7d0WzpG5bAFYkR
         c/7gVPNjpgZfWvXbUkiprXq5V+JUcPLbX7jde260tH2YizxHrd0iTNUiqSZALXk4E+Pd
         F2fIRvrGM56c9U6H+Dycyt8YoTk/o5hFvAurBZ0vz7xZGSFCH+SbJf5bd8DHZFPxahtQ
         uqw+PCoTjHvMAGTdJD/T5/GECwChBPNjJZCk60zK2Z/tLLJjsb1D/rUdclEmq8LeG2Ih
         7okva+6XM2mKiKKU6JQi4Llg+KB95AlRwXL0+Z/0vqLLkX3zb3T/fqjXGNPUyBnUBvP6
         5D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750921435; x=1751526235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
        b=B+rFm2TWGfQSxzntmfcVzcgN8FpEg4Qx/iEX2N9M17TQccOWCKqme5e70radhphjXb
         nVy/SBB4zboSSEIAr+NiKz+Yh0RnZ/V8TvSe7XexMLpFWW3K8W9scq4BOkXxrTy1ee0j
         kLOpp4wLQxookNMN9bv79VmOuYas7Azz14dEnSyEtrJHsxcBZmnF8dgcg5c+MBlxO6lG
         q0Jcv26fjSMCU9L07DitYUWhBtrSOLSHJxxcJg0PRxtoiViR6fFPdkKtb5wIhD8iYI14
         qblq3VFIJQNGnugf6oABae10FH8ixW3rJcfvfRQ7LV1w1bZ+nbIOuGP9o5YtpLMTNuQ8
         0lYw==
X-Forwarded-Encrypted: i=1; AJvYcCU0byN7OksEFt51FVQqS6D6+mDpv0X6MvC8/dSm/bdVuUKL+EXVggB47TkMMrFLGjC4yl6/Pz6Azpngh5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mT4Iy/3l3hPBa5Gbc6wO6VABPnOZK15lHP91KxJZnHBX1OsA
	Z2PIJf+vrr+RlEx9rPWrCT7AeYat/mTxN8AlMufl3crkI0qhNhIm0j2QK1FkFf0P1wuj0JAbTz5
	OvJANt1jooSRdJLJPeyLP1SFRVOH+X7RBDKrRn4AFLQ==
X-Gm-Gg: ASbGncu678J5VYTaeVecJIv+8pGNLEO4r7yRbONFjuoOcf+8UlSgQILK2mYbWjZhbx+
	F5oph5yreZd/kSr3jtfb5gHm0kPIHWyEKfrplNn2j7oHDTpcqH1Uqelw6mkflGnlvR+3zpLAHgJ
	y//eQdP2HvrwmNCrL5W/mGcCndMDZQ3d8ivtOVgvhd6KKFtzwkHtoQu35UkTrWF095wP4FxpeLc
	SeX
X-Google-Smtp-Source: AGHT+IGB3/XrVvwCiSKGcdM/uKLZZR2BBjt/EJ8TFkLwSBLUw9n1kq4/A/cuTaHIdw+LRFJ+QBCRjPhK4cZiYm51gdc=
X-Received: by 2002:a17:90b:53c5:b0:312:1508:fb4e with SMTP id
 98e67ed59e1d1-315f2675bbbmr9154353a91.17.1750921435517; Thu, 26 Jun 2025
 00:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 26 Jun 2025 12:33:43 +0530
X-Gm-Features: Ac12FXzrp0QOBUWJ7tIxkv-cgchxT19rQvDD483_utcFbw2DHpKfR-GbfFmMvSU
Message-ID: <CA+G9fYtJO4DbiabJwpSamTPHjPzyrD3O6ZCwm2+CDEUA7f+ZYw@mail.gmail.com>
Subject: stable-rc: 5.4 and 5.10: fanotify01.c:339: TFAIL: fanotify_mark(fd_notify,
 0x00000001, 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Amir Goldstein <amir73il@gmail.com>, chrubis <chrubis@suse.cz>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Petr Vorel <pvorel@suse.cz>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regression in the LTP syscalls/fanotify01 test on the Linux stable-rc 5.4
and 5.10 kernel after upgrading to LTP version 20250530.

 - The test passed with LTP version 20250130
 - The test fails with LTP version 20250530

Regressions found on stable-rc 5.4 and 5.10 LTP syscalls fanotify01.c
fanotify_mark expected EXDEV: ENODEV (19)

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Test regression: stable-rc 5.4 and 5.10

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)

The test expected fanotify_mark() to fail with EXDEV, but received
ENODEV instead. This indicates a potential mismatch between updated
LTP test expectations and the behavior of the 5.4 kernel=E2=80=99s fanotify
implementation.

Test log,
--

fanotify01.c:94: TINFO: Test #3: inode mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)
fanotify01.c:94: TINFO: Test #4: mount mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)
fanotify01.c:94: TINFO: Test #5: filesystem mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)


## Test logs
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.294-22=
3-g7ff2d32362e4/ltp-syscalls/fanotify01/
* Build detail 2:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.10.y/v5.10.238-=
353-g9dc843c66f6f/ltp-syscalls/fanotify01/
* Test log: https://qa-reports.linaro.org/api/testruns/28859312/log_file/
* Issue: https://regressions.linaro.org/-/known-issues/6609/
* Test LAVA job 1:
https://lkft.validation.linaro.org/scheduler/job/8329278#L28572
* Test LAVA job 2:
https://lkft.validation.linaro.org/scheduler/job/8326518#L28491
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxHGv=
VkVpcbKqPahSKRnlITnVS/
* Build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxHGvVkVpcbKqPahSKR=
nlITnVS/bzImage


--
Linaro LKFT
https://lkft.linaro.org
