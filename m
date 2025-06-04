Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA71537DA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010629; cv=none; b=ND2hKRgiw/JQ+IuPC7pyNz109UuTYZfzuiHcGUwUzJaZ+wRSdNSMBZEOQ9i+ude4F34omRi7PASota8GDjDJnwTFxL4fqzatt4l0ZWmZsieQXZ4dF7JaQLzFT2RbaXz6wv2BRIUuZF/qFYq8QYpECWPzAUw0scNC0qYYoUmxlZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010629; c=relaxed/simple;
	bh=ZCgaY+erfqlfYlXx0N4bWHKlR1lngLaphaFixVdLeJU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=F267p+1oPZIVyrHKUBHx3dT9OV9eQCDKYcBndFz+lg3zsL+dmUMvMdOGHJjqRdyiEMsPqkodMj8vjEAPXS2vE7nQ80n9kRQ5EH46XDjdk3WaAoOgT+/wrFb0A8HdAUordP3g/swNqx835oEY3QGo8FwEiyxBjTeeP8WKasdVpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaLFJ4KR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaLFJ4KR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5533c562608so4972775e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010625; x=1749615425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jFhbuFZEV76kB9iHFCA2deOXj1dbKW0OVCEbvuQQzM4=;
        b=FaLFJ4KRiyUokMAsogUzpPp6xUqNwO/hVoge5EhGh2ouhKothQDY9dho8y8fF2yJbk
         rkGyYyuYLRC4o9CvwjQZ5qEer0APvebbm/1vv8d5l7+R6StYx4pLdl2VlCbILbXHoVW4
         o8xaj6jNKUpG6cK4gUtBGZ7ak1lVwRi3Py713Zm9sslaUX58EXjZbmNAD3N8tISiCke4
         SkLHIq40KodNWw0qJowCaFyFf15p3uzJG2g7GWIzIN2y07nJuB+AgtxWdqwDrKy2UYYl
         Z2d/spMrZg/xXzac7Y3mU5zg9tAevaQfD0dal+8XHl06MQlnqnwhtkpT+R4xij9RWt4X
         qLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010625; x=1749615425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFhbuFZEV76kB9iHFCA2deOXj1dbKW0OVCEbvuQQzM4=;
        b=EdPmhoqMGFNTxPfjy2kL8kepPc7bUyZSmLkH8DjvDzP4wdDsTIqsw57mZJMRwpjDCn
         GHbBb9vjkDzuDQI3nR7cv0LUqPkZmf8j6qv8vQUs6lT3WjOfFwhDf4Q4Og2kGHQhLRHE
         YPlgY0kOsZic6B8B5kV/ug67ew82+Havag2p2xyVOIjDiU22oumdlG2uIWHoR1KBXsDD
         92BilZRaUykUW7Xq0XWIs1WbV4nJcrjq5R+repW7V6fRyCs7vJKyquxN3k6To6jHY+gi
         Aq5Km+YWw+KYiEw+ZZT6HJrXNGCD6ok5g2trYOJiqok/u7N64GeMb4KmIxQ5SuS/uTwL
         W1JA==
X-Forwarded-Encrypted: i=1; AJvYcCXzUe2VaCHtsKNfoBfRAb0RXl48DSlnG24YE+ksNhO4gkd93aw7r9r0gJV/gMq/XZZO9q/xheuiTxUrcZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHJTtcegVB6v93d00MUmdKwEFQqzZqKBF2eP7VlUHMJjitmBh
	dyNFZL8s6f9klMhsZeo4b2N8L4RVHUfD0hcollTBUpCptIb3ldENYBpMddVuctVtoQXXhiQSJJJ
	Rm7uXqrYZpozmLMDdh0u8JgWznIT4/EY=
X-Gm-Gg: ASbGnctoB0pGjTu73GYLbhXgIwrEhUhOelqlX4vEJAXw1bcbYJ9T3cBMDMnLEiUrGvV
	oR74PCU0erSaX0C0eQTsPUGSETbEu35pIq99sgrcr4QRA+ZZkcHhWPpz0JaPxJoqxB7GqRTZ7a8
	nbQNdtdoyzwB8F95i0+g1dQXp4aJPWMktP2kE=
X-Google-Smtp-Source: AGHT+IF8JYcUurqoQVRaGs1znsIUmEcxTMMDwTYEFMllSxwzCtKHMcp9RJ9lMNUkGD4wl+T1v9ONx2pPqZkMAvVA458=
X-Received: by 2002:a05:6512:b10:b0:553:2159:8718 with SMTP id
 2adb3069b0e04-55356dfedefmr335365e87.40.1749010624804; Tue, 03 Jun 2025
 21:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:16:53 +0800
X-Gm-Features: AX0GCFvhccyFHKlZbwBTzZB85ZzyFsSf5as1lRKCg-8Sw62j4Daen-A1EwG4Og8
Message-ID: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>
Subject: [Bug] task hung in ret_from_fork in Linux v6.12
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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


Bug Location: ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

Bug Report: https://hastebin.com/share/xiyapaboxu.shell

Entire Log: https://hastebin.com/share/kibohuxobi.yaml


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka
