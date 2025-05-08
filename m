Received: from mail-vk1-f201.google.com (mail-vk1-f201.google.com [209.85.221.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF92147F7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730015; cv=none; b=KnNnbQK9Fen25AhxZ7h9IAAZN5WxQLDqfy4S1vRsnRW2kFaMGdTV1MtiN6SdDoFd/dFs1ZZMzLp/hPnCjKol1/xJcGa8D987LXt4bDSrVF+PYMO1A4C59ri4beXeT8LfklqPi0htrS9idqjjAtox8kHSsknFBm2WTLyki8XfyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730015; c=relaxed/simple;
	bh=cEYIzm/T90Mdhu+u61QCs2qDWMrrQfrENpbfSSHD5gw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QWiLdPa8SpQctxBHNpZIwE4LfKLo0Zud+UPI9sS3whuEnox4ZxFht1q6CMpL0FS26D77JNQ53jD+9L1asqWxv2wR9W7MOaa29X2UikLLQp8YExkwSXqb1NzVQAqUEUp2wg9dQ+cy29FUf82Iy8AjsgJk7bcJLsnVzjlonQdbnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JIbJ3uCf; arc=none smtp.client-ip=209.85.221.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JIbJ3uCf"
Received: by mail-vk1-f201.google.com with SMTP id 71dfb90a1353d-523dc97ebd6so882743e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746730011; x=1747334811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3g5FPzsmLcEhVEHZ4NjqMXRkBxeDVnDHLfZENlQDEc0=;
        b=JIbJ3uCfjNJQzgmefMvX91yvUuWXHYWehEJNPqN1S735BlUUw5sxVWYYL9gS/FHxcd
         Ax6IuIV471u3kRJ/u9b9qEb4ZKmMceQI+zH259OHofF73+mkMjx5Yes+12Mt1tydJ766
         ZRLx0bwBNkevU4RnCbd2+soBzCWWfeUG/fQdHAhL2D0x53bEKu11Upb5vfQlvXc361Qh
         yVCBt3EHhVT0vLmaDS352tZNg7eIk6fx2j6azjjT5ZI4ZoedH4Bc6vxt/PcWsPArVdaS
         Ak612jjN3QtnUQgsyfmGz7mbAcQwNFwpWxEOfEh6wy6M9Zbw8HBRJ0cwMe+q6Tq0GGk/
         Pbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730011; x=1747334811;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3g5FPzsmLcEhVEHZ4NjqMXRkBxeDVnDHLfZENlQDEc0=;
        b=mfnQICkuCbZX+1ElRA56jXCRVxGarps5v3xx2hqS3IiI72HbDAvByBHbN/BAUxnv+4
         LXNf9uGzXbhbKzXgxz1DSvjey5SGG+Pm7F7Gb4qBb0b1ph9jZ3tnsf8VYn0yR5Nb2ys0
         RveRht3SmxRlHkQiAEGe/ACWCyyhvAs/ujMKoHRQ0qhjc36pvmGio6h8CdMu5HLAFk00
         bMi7FGNWxKNUqDgPfa9H8O6S/e671KJOkPkH9RKx7Zi1da3RFlNy3upogfEM0uXwXHBZ
         gIo3QTfhnzgfDrtIKO2q+pXLxnRuud32j4Z/thk8gO+vm3QbqCBzHm5S4AmwE4eKi5ik
         BA3g==
X-Forwarded-Encrypted: i=1; AJvYcCU58wUcxCKKQ2PP6l9L87bCIUd1V2/ZQk8EzrVlzvSq0akCiEMi9WpMmlbS2F0kZciiJMsIeVCdeILH/bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFO86iQAnIuCP/kYzV0BYEXBJ0KxELgucESnTCEye6/+W4XJen
	/3R3Z06Od9PiZ6jjgpBeIY3psmqAToGFFonuMNxrumyv+SOvdPXcArktJlqm1MvuV+6wKCIFKtn
	9MjM53R+Cdyd568cpWw==
X-Google-Smtp-Source: AGHT+IFpkJbQ152C8gUuCHDjN7GlB0H2WXKBSGKbjiVxbzv2G9JOo14I0G4pGBVWjLQJVqTip5Gh+kIyA9M40mbh
X-Received: from vkbaz27.prod.google.com ([2002:a05:6122:d1b:b0:52a:9a03:a241])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:828d:b0:520:62ce:98ed with SMTP id 71dfb90a1353d-52c53d2ff33mr1085749e0c.6.1746730010919;
 Thu, 08 May 2025 11:46:50 -0700 (PDT)
Date: Thu,  8 May 2025 18:46:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508184649.2576210-1-jthoughton@google.com>
Subject: [PATCH v4 0/7] KVM: selftests: access_tracking_perf_test fixes for
 NUMA balancing and MGLRU
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes some issues with access_tracking_perf_test when MGLRU
or NUMA balancing are in use.

With MGLRU, touching a page doesn't necessarily clear the Idle flag.
This has come up in the past, and the recommendation was to use MGLRU
generation numbers[1], which this series does.

With NUMA balancing, pages are temporarily mapped as PROT_NONE, so the
SPTEs will be zapped, losing the Accessed bits. The fix here is, in the
event we have lost access information to print a warning and continue
with the test, just like what we do if the test is running a nested VM.

A flag is added for the user to specify if they wish for the test to
always enforce or always skip this check.

Based on kvm/next.

Changelog:

v3[4] -> v4:
- Multiple fixes to access_tracking_perf_test:
  1. Fix for software-managed A/D-bit configs.
  2. Fix for expected number of pages when guest page size is >
     PAGE_SIZE.
  3. Properly check youngest generation when looking for pages.
- Do an initial aging pass for MGLRU. This allows us to check that pages
  move back to the youngest generation after the first access pass.
- Add controller-root location logic in the cgroup utils, and use this
  to make the test work for cgroup-v1 (thanks Sean!).
- Some cleanup for access_tracking_perf_test code, comments, warning
  messages, and the commit message (thanks Sean!).

v2[3] -> v3:
- Applied David's directory fix on patch 3.
- Added SoB-by, R-by (patch 2, missed in v2), and A-by.

v1[2] -> v2:
- Re-add clone3_selftests.h for cgroup selftests (thanks Michal!)
- Some comment fixes, patches 2 and 5 (thanks Maxim!).

[1]: https://lore.kernel.org/all/CAOUHufZeADNp_y=Ng+acmMMgnTR=ZGFZ7z-m6O47O=CmJauWjw@mail.gmail.com/
[2]: https://lore.kernel.org/kvm/20250327012350.1135621-1-jthoughton@google.com/
[3]: https://lore.kernel.org/kvm/20250331213025.3602082-1-jthoughton@google.com/
[4]: https://lore.kernel.org/kvm/20250414200929.3098202-1-jthoughton@google.com/

James Houghton (3):
  cgroup: selftests: Move cgroup_util into its own library
  KVM: selftests: Build and link selftests/cgroup/lib into KVM selftests
  KVM: selftests: access_tracking_perf_test: Use MGLRU for access
    tracking

Maxim Levitsky (1):
  KVM: selftests: access_tracking_perf_test: Add option to skip the
    sanity check

Sean Christopherson (3):
  KVM: selftests: Extract guts of THP accessor to standalone sysfs
    helpers
  cgroup: selftests: Move memcontrol specific helpers out of common
    cgroup_util.c
  cgroup: selftests: Add API to find root of specific controller

 tools/testing/selftests/cgroup/Makefile       |  21 +-
 .../selftests/cgroup/{ => lib}/cgroup_util.c  | 118 ++----
 .../cgroup/{ => lib/include}/cgroup_util.h    |  13 +-
 .../testing/selftests/cgroup/lib/libcgroup.mk |  19 +
 .../selftests/cgroup/test_memcontrol.c        |  78 ++++
 tools/testing/selftests/kvm/Makefile.kvm      |   4 +-
 .../selftests/kvm/access_tracking_perf_test.c | 281 +++++++++++--
 .../selftests/kvm/include/lru_gen_util.h      |  51 +++
 .../testing/selftests/kvm/include/test_util.h |   1 +
 .../testing/selftests/kvm/lib/lru_gen_util.c  | 386 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/test_util.c   |  42 +-
 11 files changed, 865 insertions(+), 149 deletions(-)
 rename tools/testing/selftests/cgroup/{ => lib}/cgroup_util.c (88%)
 rename tools/testing/selftests/cgroup/{ => lib/include}/cgroup_util.h (91%)
 create mode 100644 tools/testing/selftests/cgroup/lib/libcgroup.mk
 create mode 100644 tools/testing/selftests/kvm/include/lru_gen_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/lru_gen_util.c


base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
-- 
2.49.0.1015.ga840276032-goog

