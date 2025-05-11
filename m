Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6DFAD58
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746963326; cv=none; b=e0YA2EnIZuNvR68f/JUxlKD+wYs+cxK43wktJLeJfj9R9fJqwkzBPF6S/6iDv5q9epqiNZ2NLvAnyzr4XDD3wH7Y9Dj+E9kM5wGa49Iwg5VZSAhPALNTs6zlheEw8YISKBLoumrYluif6gBGFrZWExKjMt2yxwM1ziP2coCRSpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746963326; c=relaxed/simple;
	bh=EEjR51WfiEO0OpgvOkKSeg/13MinUURtfaXnr8XuD4M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=u2GsFaPPqhllbFy4kUFSU4+c3r3vzafd/xrJTcsnZAnapbn8ExSDnXIyc1LbtFMSSY7/wrtCrCP6poQ3zTAyB7fQeTgwfySurWPsQ5klfRpkvJfxZoVO4jZwXQQxQYuyvpYXPtxE7oS0uIvMdhi7eP0psggft3SOKNiBX2qBghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP43G/6L; arc=none smtp.client-ip=209.85.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP43G/6L"
Received: by mail-oo1-f68.google.com with SMTP id 006d021491bc7-605ff8aa9d2so957689eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746963324; x=1747568124; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EEjR51WfiEO0OpgvOkKSeg/13MinUURtfaXnr8XuD4M=;
        b=ZP43G/6L7IcvWUBtEc7snguUQ1xyNLTUhVYqmW9QgDG53e4vlf1uUMonqQqNNiKZ6g
         kEUcN9HQEx1yuof9gT3BVWNkIhxIZpQZrSjBHKTF2ctvLqEbKm+SrVxt+zKCYmMDJZSw
         5CjodbnbeB+5kt+UVp7zeW2xB/urEeuuRkpu/dRj2J8m5tA/H+Jypdz+XyNlZ5pQyBCt
         ovwzmJDmZNtLKAc6Pal10iraVGfTbjK/U2LOnflx95Z6kQsYFupCfwe9TpegkSBUUlKI
         PYwlLdxn/TAnTqd8+LNoHeZcFXnOaMg3epYh0MexiqBJKSFKYjVZ6UQUUSKVlHI05hn1
         XkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746963324; x=1747568124;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEjR51WfiEO0OpgvOkKSeg/13MinUURtfaXnr8XuD4M=;
        b=Of3xVxz/JYV5Pl2NU1OAcizHI/g+/zkArVhW5+QNVuSReyQgRKYEV/CZT9xLGlv1Dl
         VTjkwBwjheDij0wjHLK+bMk3hphKLbpi0tS0LAl8MSWW9wO9TNyqpORAA9iuw++VggkC
         7yU1TbgUMMK22TSjyQ88REinsK7kaUYjZtJZvGxRpUv2geVWI75oNoLgTZ4QuVoMcy1H
         FRjSRmOaj4IUx2gfpUdkGJIbwwsHClc15NcJAdv+B/EThPEo0yqE7Iyfsi8ui95u5lbA
         4TnVVJ4Ji2Y3yuJ8QMm3D+VgDv2IH4rNJCbtw0fpJwgaDhcDoplarwf1IOmwzOo4GBkm
         zpCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCNBn8ZPZRceg3fYrWhgPqXcj5EFEsGU06rBHI4amdNSTns/trkdGTETxa9DW71w53ehFdMZ8z+vXBjNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDo9CC1oVd5iKJNZmFLu7TfBy6puQ9JC6yhENYh2dartejwH5y
	zyIeWv3NsgZesLdbdF63dkw9qJ0ywU/cHuyzay6iWIX2j4XLl4ApaR35+7urhnJhLjZekfwHrPt
	37MyebLPLJnoiu9Ny9w5pKJfPhBGfC1pKtb490nqR
X-Gm-Gg: ASbGncv9EfL7gJemQey+TKu7oeY5m/6w2W0+iyT2Nw2Jjs3ej+U4pRdmvyePOScUN2F
	maudUq/oAFOlgjh5ESM6iXZNA1pKx5JHAUv0pzNpqeL+kGK+uT4Nf2LM/rJ4UjTu+eGK6AU7Ak9
	b23HjzET0jJOocfxJzOlVqHDFE07scHcOScF8=
X-Google-Smtp-Source: AGHT+IEeyUPjOpYpj0j93yFswOfpVnspKbhghWc7KPLsIIVD2FvMgq/bvyuCANoBF8PUzxyaeOv1CX0nC7ZF2CXsJIk=
X-Received: by 2002:a05:6820:2113:b0:606:44f0:a963 with SMTP id
 006d021491bc7-6083ff0e627mr5596290eaf.1.1746963323816; Sun, 11 May 2025
 04:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yin Guoyu <y04609127@gmail.com>
Date: Sun, 11 May 2025 19:35:14 +0800
X-Gm-Features: AX0GCFsZ_CQQ4OCqxx1C3Lofw5s5jyK3H--1GSn_DS0hcFU_6NUH-yNJ-3gDBio
Message-ID: <CAJNGr6ve_6o6drwe_+bRW6UU4Ew9EjaZYaBgx0JAQjYb+A8VSA@mail.gmail.com>
Subject: Kernel panic - not syncing: System is deadlocked on memory
To: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
When I test the Linux kernel (commit
38fec10eb60d687e30c8c6b5420d86e8149f7557), I encountered a kernel
panic issue related to memory allocation, specifically in the
alloc_pages_mpol function. The panic message indicates "System is
deadlocked on memory," and the call trace points to
__alloc_frozen_pages_noprof failing to allocate pages, leading to an
OOM condition.
The error originates in alloc_pages_mpol, which calls policy_nodemask
to determine the nodemask and nid for memory allocation. The
subsequent call to __alloc_frozen_pages_noprof fails when the system
runs out of memory, with no swap available and no killable processes.
This crash can be triggered by executing the provided C reproducer
multiple times. The reproducer performs a series of system calls
(e.g., file creation, perf_event_open, io_submit, and filesystem
mounts), which likely stress the memory management system and expose
the bug.
This can be reproduced on:
HEAD commit:
38fec10eb60d687e30c8c6b5420d86e8149f7557
console output : https://pastebin.com/raw/T4dfWHSf
kernel config : https://pastebin.com/raw/u0Efyj5P
C reproducer : https://pastebin.com/raw/3hPqjF6M
