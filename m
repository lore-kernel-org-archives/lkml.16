Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202A35959
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038689; cv=none; b=V15O0CZfprQEYbOHkjksFqlxN0tR/hzaER0E9kGg8VSTX6D4Rqc7BGfzrcPX90FfAUHzh9MUGeSKyTiQmsIyEsJqTqPinDlj4TBRGKXs3lUuz+exAFZjEOJMfMTYEaS/onG0Mpfi0xFCsm+hE5GI/+mL9ijK/YNnsP68kBMuZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038689; c=relaxed/simple;
	bh=3kxkXpBhoJScEEurm+b8lsAO1U7qWl5x/4lmhlHIsxA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Qwu45iwIpvRK/1c+iZG2sK8C2P/ANDmm50wyxETwgQikoxXu+48Hqpt8fc+o+T8ZgY/BZyAG9tAKj4LKHoIcQAUX18LTGqhmO2oK9gbsrw+yo/RI4jpIU5VodF3nx8cn0PkBBu9W3cLF55MizpWXvY43kcPanYrJvBChcA5XIS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smPIZ4DO; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smPIZ4DO"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-523efd77006so84421e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743038685; x=1743643485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnBfyElwB7pR2NOpIQEhHFwjTaj6cxlSHySqE1g9O24=;
        b=smPIZ4DO9v02diZOUzVSnZP4+S4t8KfxLaB40rAD+oKbLjQEJDYakIVyYMLM6p6PyZ
         IDBYG12flFMFcarU8zOWUITvgPgx9oQV4k8wxyom65D4TLRNwupvigR7/6UCRo/NNUQ8
         Pmx6zSegz+5qZfGvcV0rVS6hi8xrKIaK6dmjzc7m/QDLbkvtvC03V4sZR3arGQ78j1K7
         xRgZ5NPTjwq7g63QkEKrqQGqE3ZDac4vtsoT8PhG1oeuu4/jrZMDEMXqrwOkkjhk+FjL
         PqfUisWScyqG6PtfDhgZMGSjvKSj1d4Ncl4qlW27pjGTvtMErEK6WWO7c3RN2GAVq80H
         MYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743038685; x=1743643485;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnBfyElwB7pR2NOpIQEhHFwjTaj6cxlSHySqE1g9O24=;
        b=HeYskaUsecOCjtf9ycR006EVpqGYo/5nLWaKQp4Xw05X8BffXUUaKdEDVrOOU+XlAy
         qY8coSRovcI52XSlVhL6dLJn/L7Q7uuf25pCI51nP+CBxPvc5Ye7C/+lg952xIbx6iYR
         8UVfqXZP57rgPDXtWTcmT6buq78balIPHOmiL6bB5Ce+91ElXZBVr3fh0Qk9FYuGZNeE
         Uws7EzaX3fh27JUeO3NX9GbwRmkP6ES9Y1cD32PC0B1EIPttIiPcqz8hxp7qTPYdKEMA
         3nDHrL7BPaJpmkyzcCTeZD0Ewf+TPmOi83CnCYqPW0MzjSxKDWMrUUTjAE+61yYKG0td
         n1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyXVhwc0XWHadc3kSdPBTKdyWIZ1znSzNQiaJADVA4cmCMQmfftkoBgKpXcVyAkIzoRDmMc9r3ss1A1Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8LZbHDg1QRFNs4XB7Xh1Cv0uYT/hBqUUDcRgEQmncSdB2Tb/
	tdqNnhNmGQBx1OnTvxVKj9WYB9GqIzniuNzndqdxu9QEVUeqe2TtUEwqn0v2bwn4wOA1vKLf7m+
	bubvtWPysoem/P6s81A==
X-Google-Smtp-Source: AGHT+IEMXalzFI1RmQMmbOxY3dwo1qPrh8Qx1TkLKs2CMrepip9P0Lapptz92/BHPG+Q/ecCwOSxQ1kdXgRemPD4
X-Received: from vkb18.prod.google.com ([2002:a05:6122:8112:b0:51c:af44:e006])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:3d0e:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-526009144f9mr1633987e0c.4.1743038685245;
 Wed, 26 Mar 2025 18:24:45 -0700 (PDT)
Date: Thu, 27 Mar 2025 01:23:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327012350.1135621-1-jthoughton@google.com>
Subject: [PATCH 0/5] KVM: selftests: access_tracking_perf_test fixes for NUMA
 balancing and MGLRU
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yu Zhao <yuzhao@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is a follow-up from Maxim's recent v2[1] and the selftest changes
from the v8 of the x86 lockless aging series[2].

With MGLRU, touching a page doesn't necessarily clear the Idle flag.
This has come up in the past, and the recommendation was to use MGLRU
generation numbers[3], which is what this series does.

With NUMA balancing, pages are temporarily mapped as PROT_NONE, so the
SPTEs will be zapped, losing the Accessed bits. The fix here is, in the
event we have lost access information to print a warning and continue
with the test, just like what we do if the test is running a nested VM.

A flag is added for the user to specify if they wish for the test to
always enforce or always skip this check.

Based on kvm/next.

[1]: https://lore.kernel.org/all/20250325015741.2478906-1-mlevitsk@redhat.com/
[2]: https://lore.kernel.org/kvm/20241105184333.2305744-12-jthoughton@google.com/
[3]: https://lore.kernel.org/all/CAOUHufZeADNp_y=Ng+acmMMgnTR=ZGFZ7z-m6O47O=CmJauWjw@mail.gmail.com/

James Houghton (3):
  cgroup: selftests: Move cgroup_util into its own library
  KVM: selftests: Build and link selftests/cgroup/lib into KVM selftests
  KVM: selftests: access_tracking_perf_test: Use MGLRU for access
    tracking

Maxim Levitsky (1):
  KVM: selftests: access_tracking_perf_test: Add option to skip the
    sanity check

Sean Christopherson (1):
  KVM: selftests: Extract guts of THP accessor to standalone sysfs
    helpers

 tools/testing/selftests/cgroup/Makefile       |  21 +-
 .../selftests/cgroup/{ => lib}/cgroup_util.c  |   3 +-
 .../cgroup/{ => lib/include}/cgroup_util.h    |   4 +-
 .../testing/selftests/cgroup/lib/libcgroup.mk |  12 +
 tools/testing/selftests/kvm/Makefile.kvm      |   4 +-
 .../selftests/kvm/access_tracking_perf_test.c | 263 ++++++++++--
 .../selftests/kvm/include/lru_gen_util.h      |  51 +++
 .../testing/selftests/kvm/include/test_util.h |   1 +
 .../testing/selftests/kvm/lib/lru_gen_util.c  | 383 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/test_util.c   |  42 +-
 10 files changed, 726 insertions(+), 58 deletions(-)
 rename tools/testing/selftests/cgroup/{ => lib}/cgroup_util.c (99%)
 rename tools/testing/selftests/cgroup/{ => lib/include}/cgroup_util.h (99%)
 create mode 100644 tools/testing/selftests/cgroup/lib/libcgroup.mk
 create mode 100644 tools/testing/selftests/kvm/include/lru_gen_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/lru_gen_util.c


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.395.g12beb8f557-goog

