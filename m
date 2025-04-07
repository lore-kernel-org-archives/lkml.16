Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D770199EAD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026370; cv=none; b=HaQ2M2XVfN5Hj0d2HPTlzFPe409tr+E00Z7x3yh0Vy6TztbdJjxqVmYrRX0WEFWvw5Rvhllm6ixTYTjswGfe/XRC+21Oy6a45ijw46N7xHRU2mX+KYBS9bYVw2YV4IvP4SDPeth9iiqpEENV4DrTMHFQdbwIhz2bThtcwqR0khY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026370; c=relaxed/simple;
	bh=A8kTu4vOxFAwnxbMPk7okErIzXN4OhpFsl+LBPki/7k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bsBIytDO6uwxOQKC6Vz+txvhunDaMOE4gdx1io90Rnbd5EixdtLCZBUmjzCYxQdsZbJsXdjJYLvVHm3SD9VlHZ8yCmiQJ32plHWu817GMc6/v+MIJzV42AMnurklMCmKcBqBZNmIB5Wlq43RfpyPbYJ+U5hIYI8vfJ6E7lwJC+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOaMrzgJ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOaMrzgJ"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1331622e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744026366; x=1744631166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=dOaMrzgJeWRJzezRFGSlAkPLe5nH244MXNOoBXTvPvs7tZIqWRNJ5OJiieVw3M8lNi
         imHHVHUYPXDNZ9u9Rp38Sf2ZofS2IKI0ahu7GTof17KxQtnMj/GIZPl6e+EHtBex7VHF
         9ZCWL3SFJymDfRzfApXjrh+M58rl3OLZppEKmdcacOufXdOAU2WffBdJxJ+rQmntGzMJ
         L3xgRL+CSZ1aGet0JcwQ8WP0jXtqzNJwr3Ab1vr0W1woxM3Xa7ldx2ehHODbSNBhZUST
         sjs0oDv3eciyBcwkYHf27x1RNsboqZNENRlfZDwbqOlgMB5k6OI/qbncSYZDrHJVz+AI
         +NYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026366; x=1744631166;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=X1Lomp55dr+pHhppD9Adf5ZUKulekDkeDHWlO9DogqdzUx1bbZ9+KxLa/8MGdD1r/w
         0D5tIL3aGEEZ8SEsJ7AgBLmgp3gKT/UHwTsc3TJNq4EexrILMBrtXQMKoXcs1IlL4B42
         HT2sKpyZn3wTi4camBxYS8wTQtnW6rcKhVMoJVyrvXpDZq6oKpVttwiWntZOz6BpWDOs
         6fydlu8SpH2xOrHcyDOUeaqwSl566IBS72ZQHs3EhbEdfgrZjoEN9qV2bu8eLOUmVeHv
         w23NVURZDIxc4uB/msHGPldwXvNI5rhulYFi/XJ1TaPkXIGt/PnLnIa1h+I+ZsCzvaBs
         QDNg==
X-Gm-Message-State: AOJu0Yx+HoEoVL2tsqnZSkAn2bg4hSmwBwOR1xVszV/kXr6kJyiR5+ht
	/srSz60bePuZnA9ETLBmcdCmdYmNAIPVsl5u3s2mRhXT0oPwfJJs6GxOcBYjFedR0WlRf4qakQo
	68CDo9uHwiDfhcqpEcBQabpKvUh1TcsXVpFwmtJMdgW96KSDEFtU=
X-Gm-Gg: ASbGncttwqdXwFMLP9j9AHirMcrcqTRBD00e2iKRmKX9qluLTGSa4gIaeDG4rcE7YSm
	tA0oZEUEe6GEsVj3/0F5Fhk78Ydd3Mbn9tB7/B2NNXHy2SSVmDIpsf00Q1XUMFZJlNdNqWHqF1E
	vkF8LnaLNvtDgPQzfPNRvmaxY/b0XXk3zEY5UMqgpyTE0jdbFa7/S+1BkjWVE=
X-Google-Smtp-Source: AGHT+IE9MxO7qQqlLmViUipY97IXRe0HOeQE88hqfb3Q8OgiFR34X0CHQfKfsgfdHN0p4DcAQoZhNv1HOhhMCdAhmoM=
X-Received: by 2002:a05:6102:292b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c85539e126mr8042397137.7.1744026366667; Mon, 07 Apr 2025
 04:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 17:15:55 +0530
X-Gm-Features: ATxdqUHUzOVzZWX9xHaaGdI7CQeUYcGWMEQ1NQQGH41E_gk9k9xrAq8CaQ9neOQ
Message-ID: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
Subject: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log but
 gcc-13 boot pass
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
Linux next-20250407 and no console output.

The gcc-13 builds boot pass on qemu-x86_64.

First seen on the next-20250407.
Bad: next-20250407
Good:next-20250404

* qemu-x86_64, boot
 - boot/clang-20-lkftconfig
 - boot/clang-20-lkftconfig-compat
 - boot/clang-nightly-lkftconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
<no console output>

Clang-20 versions:
  "name": "clang",
  "version": "20.1.2",
  "version_full": "Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)"

Clang-nightly versions:
  "name": "clang",
  "version": "21.0.0",
  "version_full": "Debian clang version 21.0.0
(++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

qemu-system-x86:
   installed at version: 9.2.2+ds-1+b2

## Source
* Kernel version: 6.15.0-rc1-next-20250407
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
* Git describe: 6.15.0-rc1-next-20250407
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930138/suite/boot/test/clang-nightly-lkftconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/config

--
Linaro LKFT
https://lkft.linaro.org
