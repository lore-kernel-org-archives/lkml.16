Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6A2E264F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040803; cv=none; b=Xpvp4f7hZnDPPzFJQuqRnIV6ebVDQQp58XEYEZJYSOE7Yg9bzoyVoKZV9C6a9uvwEXEwmY1uKZW7a+SFwRQBdnmiUMQVaXUilMUC87PRRDmCGrHzx8jpLTR+dLn+RlOoG6N2mdC0bfMrbECZmZaW73WU1eQVFXcgoz65W6wR038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040803; c=relaxed/simple;
	bh=s87iftt3M0xd+S5nypoMSz3HspQP+qOBNTIvYEchE3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8e2sB5VYmnVtsRyXVkwQ9N9FpeP5UPeCytfMEWWolEmLqSI11x+WuTd25J8mF/a0Pb3LY1HWzx8gZfhnd7TqGfRsmDglmf1VeXxj1Bv+u0G8MirYqBvR0vbwIdg1j2OUsYWRPV0hGMz+8l+XNvhgr1atRc0cJqe+DncPYZXnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd0NmH0a; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd0NmH0a"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso40100276.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751040801; x=1751645601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR5MPIlTa2PoYXve2Gi2m66jUTuWCrLna8bHb+jCXJM=;
        b=Yd0NmH0axQqo+ye1+WnCUFoc7mliIWOn580fw4o7I2/G1NYxL/LdvvXxBDu2C3PCv9
         2/cuN3ouW9rzevR4cxHdxJVm9mK7ONaK5mx98nPhfqKQ/AX+ze4Q8KisSFKAmynsOtO7
         v/+54pt1P75Tdr/+hh4aGHnqvNesyLuc96GUkV0VdfZrZPvRDJOPYWUYMq7gOGwnTgpA
         689RDGrjDlaSAiJHpOXEfRPnhazLfk8B9H6cFmE31aZUolKGlO7US16Z9YbgYI1zho50
         4G/6jy6PxD0+XufPTOBBQE64ysI5G4ZZSOR2mHuZVJv15mrhXJWf7NJAxS1DouYjHWxM
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040801; x=1751645601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR5MPIlTa2PoYXve2Gi2m66jUTuWCrLna8bHb+jCXJM=;
        b=HMbnxKchporzDEhqvyN1KUucuVFhEvL8+LKxckwwxj9dnCNwY7TWmM6ah/QX3WtZr3
         sJ9QX5zW69SR/Q8RG3KxBmCKRb/OQPma7RlFDtCIKB76ct4M8uzPcKUHmErKFu1Byt+1
         +WaNzrBdGASQLzH2bRlTzgpIz54lCJh88MElVGd7fpENFMiO0U8cSm7K8YJjuKt+ar56
         B/Y38BwS4AbRyu5YDTePlVg0/lORDr7Nm2sZ3P+oLRMJry9U5Z1xx7o5/0yAVDRouniD
         4qJmj5SC/6H/Y2Je40NYVQRO0ytbLJMeHwKe22dBNTMXWHwkmO7HcC0A0bq9i0lFrO7t
         +wHg==
X-Forwarded-Encrypted: i=1; AJvYcCVYzi+/1zc5yhOJ3Qe9DDHWt/DAy7Ytga4a4xDQ8lZorbxBwRw6rJUez11qjbDsbgQ2TjTq9UcDznWl4l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkEa6G9D+3J+jbV7d6qGc6VKzNCYuUlVDOWqe2F5rGI/MK1hI
	48Qs0KbAaWQ6xnpb8ZQEhFcADywgFyIoaaIUw/00JPHCnZp9wia2+ujJ
X-Gm-Gg: ASbGncvgIvbHNR+C8gdYMaNMPqs0W04C4siTSd1fIEn1EQyLa+47Ed+Oy+xGThsnZV+
	sIAyEVYwkmFHKIH11BYxvyEGEGc0tgVxMtyQZrytAV/8M7mhHDgONp9+EJZSdghxlhiq3BsJnG1
	T4LuGOZsD4T1WiHWCHYtwICd7xMT6nIinto641cAvI49FfdxqO53L4ODQg2wMysNFDWD/0BNcy4
	6WTVR/mowAtyW5upGhZO+ZQBa9nuZJ3GDzXd/Hm1z6971XDZD41OgzCihXAApTNrULCQv4x1NvY
	0d2rwvou4yTi+t5p0Ts7jmpPm3pvM2juFrewBuEyUgoyiDz1DKQHFPxgbUAy3A==
X-Google-Smtp-Source: AGHT+IGYoGw3Y12KQQ+u7jOP+q4hfx5i8DJ1Ymkci1iQSqm6ujlUokE29l8NKgb1YWii/pFbW8GX7g==
X-Received: by 2002:a05:6902:2ec3:b0:e81:f864:133a with SMTP id 3f1490d57ef6-e87a7b01d5bmr3464143276.7.1751040800830;
        Fri, 27 Jun 2025 09:13:20 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:11::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e87a6be423fsm646653276.47.2025.06.27.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:13:20 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted interleave
Date: Fri, 27 Jun 2025 09:13:18 -0700
Message-ID: <20250627161318.1898633-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aF4d8YcGbfTktnu6@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Jun 2025 00:28:33 -0400 Gregory Price <gourry@gourry.net> wrote:

Hi Gregory,

Hope you are doing well : -) Thanks for the review!

> On Thu, Jun 26, 2025 at 01:09:34PM -0700, Joshua Hahn wrote:
> > Currently, alloc_pages_bulk_weighted_interleave can make up to nr_node_ids+1
> > calls to __alloc_pages_bulk. The additional allocation can happen if the
> > previous call to this function finished the weighted round robin allocation
> > partially on a node. To make up for this, the next time this function is
> > called, an extra allocation is made to finish cleanly on the node boundaries
> > before performing the weighted round-robin cycles again.
> > 
> 
> task->il_weight can be operated on by other weighted_interleave
> functions in mempolicy, so it's not just
> alloc_pages_bulk_weighted_interleave that affects this.

This is true, and I think that's what makes testing this part of the code
tricky. I'll elaborate more below.

> Observations here are still true, just a correction for clarity.
> 
> i.e.:
> 
> The additional allocation happens for the current il_node/il_weight.
> 
> I *think* I did it this way just because it was easier to reason about
> the two chunks separately.  So I don't see a reason not to improve this.
> I will say that, at least at the time, I took the core math and
> validated the edge conditions in a separate program.
> 
> If you get it wrong in the kernel, you'd either fail to allocate - or more
> likely just get the wrong distribution of pages.  The latter is
> non-obvious unless you go looking for it, so it might be good to at
> least add this test result in the change log.  It's hard to write this
> in LTP or kernel selftest unfortunately.

I think so too : -(

One test that I wanted to do while developing this feature was to see if
I could figure out how many pages are really allocated from each node. The
difficulty in doing this (as you pointed out above) is that because there are
other ways that move the round robin forward (without necessarily calling the
bulk alloc function), it's hard to directly attribute the page allocations.

If this was the only place that we were modifying these values, then a
correctness check would be equivalent to just adding a printk of each node
and how many pages were allocated on it, then adding all the numbers up to
see if it matches the weight ratios in sysfs.

So I think I will do what you did as well -- I think that performing some
tests, at least on the edge cases in a separate program will help give
some confidence that the code works as intended. I'll also continue to think
about if there are better ways to be testing this instead.

Thanks again for reviewing this, have a great day!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
