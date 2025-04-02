Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76281F9F7A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583509; cv=none; b=RDMsM7xjjkeicxKAX7cGulZqczb9RxScNZWfONej9ejiccjuxhxRGiblkw9x7AQzrvw8UXzcAPGQdjX+egJAD8d01Jvw9cMi3hD8xG6Wi/76++3QpT/n/OnJUzljz+Rw5nS5WJbHG5ITQ/5t9Xm9B0v4yar9VS2cWtsryM2nCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583509; c=relaxed/simple;
	bh=MYXtt+F82yFU/HF8RGrdrV4yjQ+SYvY33Hbn9q1VIBk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GPw7Z3CtP9xUFWzLFhQd6Li/N3MDDRr3+aWQ2ieEmFQaCSpJ6/85oS/uc1S9p5JQB7PtMWygZ49PpRr8GAr0xCX+FI/hKXyXRynyHEweekHoLEHffr13jhORBmLrZNgcLLS10LpypWWaLeTeUg5OYAwq1Ajg3GQz4yMCVo4ILac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWHoCHcw; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWHoCHcw"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86b31db3c3bso2719499241.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583506; x=1744188306; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hgDb3fVVBUB/IfzwnOD3L78L7lK+HAMvWH+VtOqC03g=;
        b=nWHoCHcwx9AU2L8fPOmIHMl1xAPKZoQ+DSeh5mK+1KiKSDYn4N2efBfFvDDuiyI3L0
         UT4le4RGrGBt03Tia9BjuRTuetblJ+1mmKAPEpAqsl1chDySQM2WGX6Dxd87c+H5r+PP
         mYLSVHnScBpSpXmPXU9H6NPQsxeus3mj0Z6O5kvikmYjcqoq/2zZ0AqKS/GKx9YpUV65
         Kgsn+rArosOX81x4qoQQLJmLvTQIyrxY0tY36Y1uUDLjDV7de4ulgZXofvY8ivJo9VXE
         7yitwSbO2mTzDWfR9kV8tVQJNo0bPMVWLUbBJI8x7x79kh+Fj3xJ7FVV8TIq09vLijmd
         agOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583506; x=1744188306;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgDb3fVVBUB/IfzwnOD3L78L7lK+HAMvWH+VtOqC03g=;
        b=cOA59nsCJZgaBlB463DtUdsGYzHwjx76STRY8WQfwXeU2SmC35hWWs28SgaFKgxQjM
         z845vzd2b0/86iiYyErJH7qt3Tb3JGLhff54/g70YU+eR42gaRoYW3fAOG/jdOtxNS3X
         iWA4v5MSuj15iJbk8+3hwFvfJcnoN9Ahe2y2w4Tv01y9Vc0uGb4RiP48Tdy6q4/C2C1F
         4QUhRcOLE3Z16K/1TM24A0H7VasVMqmJxKPNSt1JySqicxkWXXfo38wnjRlr1bCzD/c5
         8SbRm/wjtdF4k3O9P7GVpUtoUDzkI8L4+BXkwwjb/XOa067byShrfa0gL4JSGhl+OEul
         4XPA==
X-Gm-Message-State: AOJu0YysocgCfTE/LVjEB0zqqZ3EdhPnkbJrZ/tU+gs89ItnUtWKeHpw
	z7FyybKfdyr8ZPIC2py9SmmLgG6gg5TsajD5oYbKjBv3uVa/kpo/fopfsQOnGTymrQ1kZbpQ/AA
	ZXqpwJ4ooNMAOAiIKnyNiTPbTzh4VqbvXQwe1Zgo50XJ6b7wGs0g=
X-Gm-Gg: ASbGncv9T3B3Abunj7QE/BHzTq1MR6IXJtvZ7CPotB9S+UNIyDmrKnNmdt0B+8ie4pc
	FLQpMHy9kw0Hk1yC5PxzyAuNmycPel23xNILQiws0IaLZbFuzbBhK2WY2lc8oFNGcSGsFjezojH
	BfIsDg6npWGVtkoF1p7I9DL52bkZrI6Xpy2vOcBtvkn901YGhPhdmlR6+bNw8=
X-Google-Smtp-Source: AGHT+IE8fq6fgnNiBlF4pjBGjNOCQgZFHKYt+jyYnPaGvFt9HHKIIGxzApITzblIW2SBZ/TFBbSfqRsVUBxL6jzuEN0=
X-Received: by 2002:a05:6102:c12:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4c6d384b3d2mr10951298137.10.1743583505840; Wed, 02 Apr 2025
 01:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 14:14:53 +0530
X-Gm-Features: AQ5f1JosHeaxk-JjURpm99TBi1ldYeuLUsjGtGWwli-pgYAQe5pPal7OZ5w-kuQ
Message-ID: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
Subject: qemu-i386 boot failed on mainline master - no console output
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Vinod Koul <vkoul@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-i386 devices boot tests failed with defconfig on
the mainline master no console output.

First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
'char-misc-6.15-rc1' of...)
 Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
'rust-fixes-6.15-merge'
 Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'

* qemu-i386
 - boot

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Test regression: qemu-i386 boot failed on mainline master
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to,
  # first bad commit:
    [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
    Merge tag 'mm-stable-2025-03-30-16-52' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

## Test log
<No console output.>

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8

## Test
* Test log: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2vAGjk1bqJ8kqDGEyo2jXerYOcR/logs?format=txt
* Build link: https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/config

--
Linaro LKFT
https://lkft.linaro.org
