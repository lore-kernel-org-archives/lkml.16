Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903591C1F02
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196538; cv=none; b=rkDcLzPsFVRnb/DAOJO+lT0jb9l44T2ZPAMtOy6lI5bIrZyazIcwQrHDYZulBIGIuFKXuDhXjm87LXvgPAsMh2juUEkebgMzJWXyNo1dWv4vyd8v+Vi/X/va7fxZm/IiwKSAIwcpxgv5AthzfbujZnitLVw7E8ry4GZSPzSXbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196538; c=relaxed/simple;
	bh=cHMF6CdwWo2B6ji3u5lhqzQvAYXKub/8u6wnptL74UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyuNhwF0xH/8N4L5BRKCW3yp5PDfvqdFkdV1fQ30BZVWnNJ+fqB2j2kGwsZUdTwomkjParcFjFmCIs30Gh6Re+SGngq7aikZxYzE+eYgjuqVbcA04apJoEJCmKR49qsxfNZ6zU0MPpUMAW6FMdhAwPrl4+fyWKvlrOpIdvSBPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd8NwSYx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd8NwSYx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223a7065ff8so17735125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743196537; x=1743801337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTx9PeQwT1X+9gbRyds53dDZ2KW8HvFTaNsAU0bFORY=;
        b=Zd8NwSYxkCqF30rqcroJxbIf/Hnsrx5jTbMA8u3pfe1TFJY0QHcnB8d8eBBHt48dSm
         DITYTo1JT2a9lhHabPUgaqsrLKB+KTjJ7huPgjmruYFsndy6i83HNff17YQUs7SGVVRb
         GMpKUvAJBFOJeAmLtc/jic7lliw/606MQr9ht7UH+5q4Zpn8pZv07qTbNvLeM2Okbd5T
         +jdDdLpqtSknJGiBColZQWqYef1tXDgKUB36SJJSzEVZMaf0A1nYvHCznHn8NdQb5iMR
         V0kh04DipD7fH18egTAzlEdald0zG0tcRHl/7jfK2qh2ItHx6Dcrd3UVK6NYAU2iTMMX
         DqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196537; x=1743801337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTx9PeQwT1X+9gbRyds53dDZ2KW8HvFTaNsAU0bFORY=;
        b=I+CXXfuRRlDmBD79Ao9zcw6vpQbuMrlfyOUTGqvzdbz2wlpLSSV/CwONG5P30AYFA6
         +mV/U2kmcJkyauwX8+ZwXD2J6vqv9t5CcmO5XJcv6Q+s45Om5USFLfMfqdNsbl/gEA42
         xitZsWY1B2y3uZ+KkJXNi6pZuq1aU7nXTsWO6JKZivo/atK4mWrRcbTAdtdZl3J64j+P
         El0ZJKQbUjJWNYFyUCwvgjPBsTETGMpjnEnFvcdVp39RGmzpt33O5SqgIVrD+8Fca8D1
         /5lBg/xRRaIDQJp/2jwykFkrS3rSk03dA9NMV+0Qx+bW89fQa3Ct20UBF6/tfUZU0xs9
         trGw==
X-Forwarded-Encrypted: i=1; AJvYcCX9IsFBP93PZ60cgB5FFmCy0UqoccGOSaLWDhbkWKDqV+ci7NRNZu/VLRDTeyzBsVgshddmzxcEjBUChRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzNIOJ3QhdJsS4ucxYalapGGK4odwvNrkJIdfqLc8BG7fUjof
	b5Q40zKY77KKnoSUHBn5w0QyPjL1Rg+6sgDSw1kkpqHdx3IUgr5Z
X-Gm-Gg: ASbGncsVQpISfnETCwFfIY24AttUmehFA7SkRu2QLvmlGzLzzr4YWC8JTi/thoHAz4Y
	DK1KHGWFCk6bBJHW6bvmFmqgjMEOw59Xugnp8KpBPJhcB/JgTFoa0zsJStIdG4ZnLYCe6bDgjkA
	MF8qLWV+D1U3qhYkeWcsrfGurkmdjdmbl75Dqsn0HMHAmDO8nW5HfezvIOZ2LQkHLOov6C8cgg9
	YekDdx3nLBl5EOjN4dUKNv+XNFubFLh3TZzCyZpRXQevrUxddmcVjF7O2IuuVo+xp85S29N2wSQ
	EZwQtnyuR3TMCY17aRXAfRf7dUFPX8MAIpyUsYiW7HoZkvvAhePfgKwDLmy838SDghLgFEuO1c+
	7v+E=
X-Google-Smtp-Source: AGHT+IGs70dKNinSk6xs+uKvlizZG0H7CFgDVfANoOBzIG3JipqlW0vixNHgt2NVbKGh++aSVmSFfQ==
X-Received: by 2002:a17:902:d4ce:b0:223:6180:1bf7 with SMTP id d9443c01a7336-2292f9efbcbmr8893855ad.42.1743196536540;
        Fri, 28 Mar 2025 14:15:36 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-30516d55fbasm2407137a91.15.2025.03.28.14.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:15:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Huan Yang <link@vivo.com>,
	linux-kernel@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH v2 0/1] Introduce vmap_file()
Date: Fri, 28 Mar 2025 14:13:48 -0700
Message-ID: <20250328211349.845857-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, users have to call vmap() or vmap_pfn() to map pages to
kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
without struct page). vmap() handles normal pages.

With large folios, we may want to map ranges that only span
part of a folio (i.e. mapping half of a 2Mb folio).
vmap_file() will allow us to do so.
 
Create a function, vmap_file(), to map a specified range of a given
file to kernel virtual space. vmap_file() is an in-kernel equivalent
to mmap(), and can be useful for filesystems.

---
v2:
  - Reword cover letter to provide a clearer overview of the current
  vmalloc APIs, and usefulness of vmap_file()
  - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
  - Provide support to partially map file folios
  - Demote this to RFC while we look for users
--
I don't have a user for this function right now, but it will be
useful as users start converting to using large folios. I'm just
putting it out here for anyone that may find a use for it.

This seems like the sensible way to implement it, but I'm open
to tweaking the functions semantics.

I've Cc-ed a couple people that mentioned they might be interested
in using it.

Vishal Moola (Oracle) (1):
  mm/vmalloc: Introduce vmap_file()

 include/linux/vmalloc.h |   2 +
 mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

-- 
2.48.1

