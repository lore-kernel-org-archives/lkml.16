Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5984A3E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 04:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743393832; cv=none; b=IKe52aPJ45IZ7nIU/74xdxselIn9p9U0OLJpcieWO23fn7d/HCzf2Ez2mgInL687aK/R7hkf6kBX6kIdgPgW3fpMtVV2oeiuCQOoBWwkvfpOb6q4hPRJ8237YMNGVyqz40xkpe1tkTAxuU4TjD2FvDBpkgXbzfHPCxt/xzOyes4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743393832; c=relaxed/simple;
	bh=Ovriw1fRv9VQH8DhEJ92/4OemBiWmNygkfONdXwMWo8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oqgwbO7Dw8Pkh+uQmPO77xD15vijVzjEemJU7EdxfLX0YAQb18dKaMbAOUPjKdJTkJJQUT+4GVOcQO0QxwMB+BRiL6GqW6kSxgfnHG4qUjg+ilCB4xdKIoA2YbSJ3t8w/5fcyE1uIq8eTjYT9BrfVDhbIB62V6A/Ab8cSmngTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P71B8v9Q; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P71B8v9Q"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d377306ddso1526213241.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743393829; x=1743998629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=P71B8v9QCnu4tuvBiZWfA7YPlzGGIj5jIXdv71t6kaOG9W+7vnCcdx+jGDspR8aauR
         n6/AWxQdzJqegBrjQAjAlThFXaE8F4fClOBlL23GtCmAFOX1Laa7ELNK8UHDP7bkKNus
         SA98BnZJO02xM1NVjFGoCCHiguDwm/ykhke0rlk7HCX8/EFGilTQw+HASaVGvi2nX6dP
         3CPWecBfWFtrANyZFjPuepfMjzRTqgve6H44qCaasftYZ52UaSKtuyikGnV85monbbP4
         tiHDFDeRu09Cw7VL/PDoccWKWdyb8CxZ+vMeROnn7KGbKxBJ297U8G+1yPEQSe2kJtZd
         thZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743393829; x=1743998629;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=ZMJ7eb5vKMru4hjo1TFaKckFd7v/lXgdecAQYE8UkzlZikkVNLTs3g/Dx7e9kbh4eh
         omL+iPEfdvJTG0Oea0aBMAT5Y8H8MHVGhhMZsIkTbHI+Wbq1v5q91nnMcidfDx+9JGS9
         OI667pAJqBqUTL2EafhQ+LQFZlVxcoPyDA4jbr5Oj7NRuApMdXjIPpDv+YEjnOkqtb7R
         pZXr3hHtJCgtNvmdUMTJOMAnmsQ5QbZYK4ilggjdTX6BDfR2VVp+N5WQ9tTGzoURGmTk
         2y25UHlvEzfJk3QOvrEKCVl9Y35PZHLYVbx+ouqXaDfxZlep1vwrxNJgcouZvOC6LdOe
         tVsw==
X-Forwarded-Encrypted: i=1; AJvYcCU9iHO/zmmSbHTBJ3yIPYrmhEDBef9oJdorCIoSvTkJ7Gw486Fk/AFarsEywQKRYZ3FKquOzbnOkSoEfN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGU1iOYtLEjPJMhkguN8dtygGXVxB7o5W4Q1F3DEh7wlDQQxZA
	Vvl7duQas4sZGFQnJG2tz4RYGySvzWrFn4lfY16/SAg6WVctZd+B0yxOuAPYA7JJnwah8jX53y1
	D9HLimn7mfxxLXL/FPp89AK+tW+u1YxrMOoVQdQ==
X-Gm-Gg: ASbGncsK5JwNKGWHvj2PWfDnUAm5m9LsoKdfNgjLU8Jv0AJtRn+t5dMljoxQqR+0mRd
	xrEQ/EUHC7N1FdGaNiTzXVm6tqCAxjjzkTfFrm1/TqL2LpoLfY9ZYpLhLkMs7FQw6s+SQpw6U5s
	p0T0ri0FSK4QWSxkM300mqOnjwFRMCQUJH0/fh29g1v5SSWMAq5WbqiGmLAA==
X-Google-Smtp-Source: AGHT+IE+omrjH7GYgvhNd+blM0ysANeUmxf3FkJnco8pyeAxxM7AfoCsUeEAKslkGCMtq8noDXdfL+o2qkrwgip+9BE=
X-Received: by 2002:a05:6102:3e8a:b0:4c1:90ee:ab2 with SMTP id
 ada2fe7eead31-4c6d38cb31emr4067233137.14.1743393829232; Sun, 30 Mar 2025
 21:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 31 Mar 2025 09:33:37 +0530
X-Gm-Features: AQ5f1Jry1FfmI-B89oqlgm9LhT3dGEDfFcdu18qH63QTqu9-bEzvTnC6C9KspFU
Message-ID: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
Subject: arm64: juno-r2: SSD detect failed on mainline and next
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 Juno-r2 devices detect SSD tests failed on the
Linux next and Linux mainline.

First seen on the v6.14-7245-g5c2a430e8599
 Good: v6.14
 Bad: v6.14-7422-gacb4f33713b9

* Juno-r2,
 - detect-ssd
 - mkfs.ext4-ssd

Regression Analysis:
 - New regression? yes
 - Reproducibility? Yes

Test regression: arm64 Juno-r2 SSD detect failed
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to,
# first bad commit:
  [bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c]
  iommu: Get DT/ACPI parsing into the proper probe path

## Test log
  mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
  mke2fs 1.47.2 (1-Jan-2025)
  The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
does not exist and no size was specified.

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: acb4f33713b9f6cadb6143f211714c343465411c
* Git describe: v6.14-7422-gacb4f33713b9
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-7422-gacb4f33713b9/

## Test
* Test log: https://lkft.validation.linaro.org/scheduler/job/8188382#L1538
* Test history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14/testrun/27742015/suite/ltp-cve/test/cve-2017-2671/history/
* Test details:
https://lkft.validation.linaro.org/scheduler/job/8188382/definition
* Test link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/config


--
Linaro LKFT
https://lkft.linaro.org
