Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A89239561
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010032; cv=none; b=Zw8qSyWkUDFSnJkJlAaO2phQsuQpAEJgJptZWR8mL3YgnSmbF0HU38aJf/jV7DZB2AEYXn6GK2JQ2pIdcZRYkyBz75qw2WILSj3Z5bgoxdX+4kGMQc44tPLMChBd5BTr26VSqhWw8htLV0pe+RJ9HgJb7uEGvklQhJnb0Al82+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010032; c=relaxed/simple;
	bh=EHrmer8hwyV/Bhd0c9McNTUXPwjyu8F3CTmUnB8pv4Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Mm/oWG7h7n1NvOwWiqpv185zhVPujaqlU/PSIKgFnIQUt+kMNnuMo0lZnrob33cEnkDgaq3Axzvrfp0K+SZ0605yhRG6LBWUtpLCDyQPUBMUaZ3a/pW3aJpRv9szbTCu7tKkg/OAGAB/cL7/7bThtpDnQnAA0iz3+5xFOh1wHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5/xpMFx; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5/xpMFx"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso67628671fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010028; x=1749614828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M9l5n5/W+kR/Nj9vZ46RWfDMpxQ9l06cH6RjR/L8d8Y=;
        b=L5/xpMFxZeq/BIxp1nnZM3DX9yq/myIs5ferfNSwAeqDKU7o8IL6PII/vZkkfuxuqt
         5C+aeDSNNU0PrXJpZUB4F1zkkhnYCbkOf3jQL4IEnT0iptyM/ni/yF9o3mQ3TWJWrzk1
         ZVTjEb4gk1AWmU2ESjnMBtPAokci0akgAgsyvIQMnGtdzah8SzKwjGXIJvO06Qx/qUuG
         A6D6B6/F0CAEpJMq/SnajgDPQn0g6y5wCmYy5sxAm8yAimN7mzIPbf3kSjhWREcLIZds
         Edwqz8nfbYq1BrO31WIveYz0hCWpIgip2PDm4shVoueNLT+zcSRzsA86KViokBLcDVMf
         bkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010028; x=1749614828;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9l5n5/W+kR/Nj9vZ46RWfDMpxQ9l06cH6RjR/L8d8Y=;
        b=KWYJLJRKz3FPV73AMyf8AprWU8/t9l5RMNa+qsvT0oFAQH83LZ7d1j3hGwSeClwgTy
         vbIfxCer9xI0AZFMI5048BBM7+ZHHrqHSUKow5VCCcu6fwJcaVGMY9/xL+GBD3NG7TPN
         DbOufU+ml4C4H+EoOHqUS1oE71aWECjNp91mOML+xk3qBHERIG/0i4O5PBKSDoF00TXJ
         py9lLxkn4rAo8HswgHkMEAhpNOCYxZCzqOA0x+WNQMUM2mq7eB9TgPSi2NsDJ0mq1jDM
         sIZu+L/Rt4ffMFet9jJbNg5HdQq//4aaN1yCAtGQZ8m8b1P1DTWL4KDxGSYcOEWabm2i
         Kz5Q==
X-Gm-Message-State: AOJu0Yz+kGtTXYwxuswlyS3ZNf6ToOazGISSWFVwX2XfZcekTxR3QGBM
	YV2eFSOIp7cf+izxF8jitr8TERFabPCKpU/YA57x4gtD5QseIpNFIPOk5HK5QG9qLUnYP6hHHQO
	fO987VfyU4CtNrQfHhjgAzmTBRKjnMQ8=
X-Gm-Gg: ASbGncuq0uh4nyjdAiwfyCKKsup4aM2mIkrHUUE3Wy/Psn0YCiGB7w3K198S2BcdTPg
	xSYZTj5misaI+IWarbo8GZOVR5roW6KREIiFfvdbGnqtH7f0jEW3IrEihyrEcEKDhC9/MgLksH2
	Mjr4MsfXlpuLjaC+Mmrq2XKgZDmIIOsnjGOsY=
X-Google-Smtp-Source: AGHT+IEti+9ceQuBt7q1dVNTnpXUuUSNY0J4nDOPhEFz0fePlyXbKb3Hhefge9lD/E+NCCaIphuKs1nBJHy3scN5VIE=
X-Received: by 2002:a2e:a586:0:b0:32a:85ad:2148 with SMTP id
 38308e7fff4ca-32ac7204645mr3427661fa.8.1749010027554; Tue, 03 Jun 2025
 21:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:06:56 +0800
X-Gm-Features: AX0GCFvu0X7KJTFLiJblf4LqinpJt6Fg2W5T5KFb5ESFyS8PjbXzFtORzQYnlbk
Message-ID: <CALm_T+3=v=zMnYCMOjunYRU3anKrbOeWmsi=3jnS88gsH3qSPg@mail.gmail.com>
Subject: [BUG] unable to handle kernel paging request in process_one_work in
 Linux 6.12
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.12, corresponding to the following
commit in the mainline repository:

Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

This issue was discovered during the testing of the Android 16 AOSP
kernel, which is based on Linux kernel version 6.12, specifically from
the AOSP kernel branch:

AOSP kernel branch: android16-6.12
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12

Although this kernel branch is used in Android 16 development, its
base is aligned with the upstream Linux v6.12 release. I observed this
issue while conducting stability and fuzzing tests on the Android 16
platform and identified that the root cause lies in the upstream
codebase.


Bug Location: process_one_work+0x474/0xd04 kernel/workqueue.c:3213

Bug Report: https://hastebin.com/share/yacupoheje.css

Entire Log: https://hastebin.com/share/inasotiyuz.perl


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka
