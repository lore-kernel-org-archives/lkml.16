Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619382620FC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920607; cv=none; b=mrIIN8orfHROTjGnlsPXp74J8l2z10p5ZNQWyZqzzfen1F1Rj8aTH43n5NAMPId1x5Qdngi6VQYrLXVymkgUiXoCZ4+SiIKFbem7DrHC8XLrNBnx5q+gPyD2s0Hada128430zQE5yRazIbAKxPvdvSmO5BtR0+cFqYCCNuzpVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920607; c=relaxed/simple;
	bh=NHyEFssMjma0bg2s2drOqDgNRfGG15lqfqeZ7WbrMPo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WSx0Bur8FBbipaZ8Ag1OefXQoBrajrvd2q9rPanEIUMZ8dQSrAxiMqV5+oWqkNGcmFJ+SktsmYa8eAxj1c8QFOoeNZtC9Jml8V2MtffWHBpXmDBqR7tafwwmEwynl+mCuyOyOelbg1SB0SD4PvbSCiDXamw7v0OOylGLjhAuc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EaKwX2/I; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EaKwX2/I"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e2534c08a5so2114969137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747920604; x=1748525404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tx8vZFDZpMbO+Kg6fLcfBD8qiDuWKhB/aBNAjV7446I=;
        b=EaKwX2/IRpfkrQbTFAjDRxBJ7OQS0h4443A7c7TDZtCp5KEtCoLMDF2VL4pBqlKL9D
         tGy2wqY0bMEwsteK6PPwQDpux4qeeGkVA1M3/GC0Z1yiwisxqtcvGhKNl56fDiRaklXJ
         Qj1IAcmtolJsMM/q6Wb4XxBA+zJGjYzi5EeCneLBeqgsYwiTlFFTmRbDKlg6jY+DPKRB
         p2BuiGRs5rq96K3SH8Aorr22HY1xB7LLN26xqZh+5XNPkCaw1hILN9ZdkTZZZvvQ0t74
         QxVwE+/1ogTDWxsWdANY/YYvwzIC6O+ZQkAy1IHshTrevC3cQ+OgZkwKTP5FhW3ZeVyG
         PxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920604; x=1748525404;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tx8vZFDZpMbO+Kg6fLcfBD8qiDuWKhB/aBNAjV7446I=;
        b=Lb/zcv55fYFDZxulXoV1Ptm5yjCLK5BQU5Ec53VWO7zhP4OjJpfafg6Ph/rHofAmt4
         ELxLCxfcQgg6sRTJNcYEauzQ2spnIOx5hDz+otqsNAx4K851Ld3l2Ix9tjFAF8pSYU7w
         QnAOpleMjthuiTNvNZ9yn85/pBmnYRKyo/W35SlPVzb7Nu42WTCYWOLE0+u1CbGjrOaI
         LN0vboxzVifOSvNSVv29rKgbOZrgQmHREFP9fwxdDro8sCPXtBYf+XU0NBXL0IhY1dWC
         I3kgl3z5ju+IBxmSYUQmPW/2dMTVxvxWHbX6YPbc4p4DP60KVIEUwPSn9M8uR7/stwPz
         pssg==
X-Forwarded-Encrypted: i=1; AJvYcCWGYxnxeLpK8bPprq0pBHNzIsk6NvLosGAat0S24R6hgdFB8wtA8nAoCeU4wQeQiq7+XXuA0tF9/ekSbzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUtE1l8miQeTCdB4Mvw2193wJE+y9R/vjC4NVXjOgRjYUxe8PR
	BsJbN72JOEww9A0TPRsmWYvZiQM0VyxYIyw/k0cRQXN5q6zB6dDov7PfmU/EJCdtTYjginMEyGd
	Vyrlr9Pk9wNFlL0UOiTBmuOtjm9UAXug/AzmoRFVRvg==
X-Gm-Gg: ASbGnctZ9Hc02l5jwZ2s87bQk7SfQx+kd9LxGL4+y2nx06oNDHtonS9Lc/ld0yQyF7s
	D0S7Nb7ff4wk7se6+P2lhjQdeFB0xb5rU3R002zc2Oi9F8KMGNlolBZVHxNMT8rhhklsfN7HBIw
	NP1IzJKaElCJGdtYoXOJaIZCzySzgpcXrbyYZa4hNC8snFcsn6+NcVBcDnhnXHH4hmmg==
X-Google-Smtp-Source: AGHT+IGrsi4YeCwF+gsQk3AjFpqFQrgmg+CFW2hddWEvAMNinJZ1EJNY3oA1upi+6Yf3kxEJfATUWZY7yhYbYr2g7fA=
X-Received: by 2002:a67:e701:0:b0:4da:de8d:9e34 with SMTP id
 ada2fe7eead31-4dfa6bfc5b9mr25918306137.19.1747920604094; Thu, 22 May 2025
 06:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:59:53 +0530
X-Gm-Features: AX0GCFvDM2W9SugJkICsPS9liVtWMt8HZYA63Ym2Osx1MzkHItI7ZrZ35OaG-WU
Message-ID: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
Subject: riscv gcc-13 allyesconfig error the frame size of 2064 bytes is
 larger than 2048 bytes [-Werror=frame-larger-than=]
To: linux-bcache@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: kent.overstreet@linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv allyesconfig build failed with gcc-13 on the Linux next
tag next-20250516 and next-20250522.

First seen on the next-20250516
 Good: next-20250515
 Bad:  next-20250516

Regressions found on riscv:
 - build/gcc-13-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: riscv gcc-13 allyesconfig error the frame size of
2064 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
fs/bcachefs/data_update.c: In function '__bch2_data_update_index_update':
fs/bcachefs/data_update.c:464:1: error: the frame size of 2064 bytes
is larger than 2048 bytes [-Werror=frame-larger-than=]
  464 | }
      | ^
cc1: all warnings being treated as errors


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28521854/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28521854/suite/build/test/gcc-13-allyesconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRoAAw5dl69AvvHb8oZ3pL1SFx/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRoAAw5dl69AvvHb8oZ3pL1SFx/config

--
Linaro LKFT
https://lkft.linaro.org
