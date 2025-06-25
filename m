Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E805D1ADC69
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873773; cv=none; b=nIF1a8pfs2Al6eBcfTv1cLsV3gqwb2dO1gdvxUDrM7bnGJbqgRZpfDn8dMbLZu8Vzd/um29GJsUVk7XUWtTxw6TvbJ8NIzAb+UWbaTDqSHB5ovKb2UMPX8G9dlecPMpk3FBsgbXQuHMF7+YbkNLMH65exyfmMIqkcWAgKSEEl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873773; c=relaxed/simple;
	bh=gHURVpUT8xGnrP/mZ8Kh74Bg18Chq0fqFtTO9DFoKMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JOYn+8LxEqwZxxUXiT7y2d/m1C6bwRKiX01J1msSEtyWSL6cAaG+sNCnnG+tlQ45bJ7WvF0VV8o6EwWr0ebZ0zH1mlaO34F7pR+vfwlzKRwhtcO4xpb/MNGvFLQUZOZb33kAQFdfSRA4F8kZczlVO+U2AdEdBW0a/uyLM+u3vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIVbmWSp; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIVbmWSp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b34c068faf8so131108a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750873771; x=1751478571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKPoygHmek9vtlAiSPTqKcPVr1OpZZ2WrDzyM0DWDbg=;
        b=IIVbmWSpDqoK4G5jeGA5Q2vM6y3dvSu+NwiFeCpnV6LcC45OAUKqmYPzAjrO4GkvUp
         hoScp8NXYPWn5TLn0FccRcwuKC8Tl0TK8wQtHjuHlR+bO1KqnXyUPRnpRs+FhD03hRlI
         MhTOnJJTR4/eAzuXazLqf6ZFsgIrIDwDo531ykkB4Vez1HZpKe7/iNprFior9KsZYpkj
         3u6+LcktG0WQ8drtrV7G/xqt5cDnkeyGzPpFYxyREAIWCLwHNTAlGQNfID8KKYMWdlyq
         wNtEJU9ZLDB3iBJafYNVx9oF4sjMX5pZLjNm9L4u6GOrwXnKOah3hd83UMWnkv+7P8bC
         oKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873771; x=1751478571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKPoygHmek9vtlAiSPTqKcPVr1OpZZ2WrDzyM0DWDbg=;
        b=r8JNVqe08qFBadlDD+iCl3TegQqZA7oeagV8N+HlLSZyFb/X/3SOtTbW4iapiEaRL5
         pD6RQsdToEu7WFprMm1MbRa6QWqnTUa7U5eK+yZllupBjH357nfcED5H1Bv2TjSBauCV
         kRUbxerZpUTNUClRcVoUkve+JIAddncOSDH1QFmikvYo6RFijPlrYp4j0H+PDEsr6oI/
         M1Uo6IRQHo4mkEM0AhcT7wfNPgMj6bYgaXvA35q/G2UIC59srKA/1yajfolHs+o9qUPB
         NPWdZg60QYqPVDSEsMyhskYg5GpIgu9Y6wF1WcKFnpLYyfMxL3RQ7wY4RQ7+6dxoQOrX
         ICtg==
X-Gm-Message-State: AOJu0YxlaJEM7r/ibYiccsmGAlAEcBn2l3BdI8yzFaD4vQIxny3G5273
	58brdiRYCiFMwceS1XPplUauKWjPoxrvuo0veMgn6+49EhDPGvw2Jc1sO1bfJ/3g
X-Gm-Gg: ASbGncuDYvmj7rASq7FZAMQUdq3gXnosUQKzUJOwiOCWH3fP5vHhZaMNn+DhGC3UT84
	Iz33gQuvc7LsAZLpgmudI48I+LdK+ecf8GZs07WbPYucmQLzKe2j1fSydF86x5Cfp5psxCLoztZ
	9n+F65oVEr2ccJIfcMqzdLSepRlfmqH66mjF2aDhL9tC4SFzV78J5Pk9LHNxyPJ/9RIdLLxs0bA
	06RUzIwYBLuuKDdgiVAkp5aH7H2ugLUZCQtTOsUgqAa0hRr0ghu3D+iBw+yLxoFn9DYQdDk7srx
	dnHV5jkP5LxwoqstAHv6G0yr06vnBkMnJ1/izNm+DmLZBnQ63TUNyWQlErxKwGpcIOu8jKiE84q
	VFhWJWtYyoLgHGnkMj5pT
X-Google-Smtp-Source: AGHT+IEGKc4PlKwHTryODTJ8CFkDTJ/2/4oBjIzki9EynrKNZrqt3JjwxvumsRuU0cu0A6YbznIGiA==
X-Received: by 2002:a05:6a20:748f:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-2207efa479dmr6671547637.0.1750873771104;
        Wed, 25 Jun 2025 10:49:31 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-749b5e23879sm4944869b3a.57.2025.06.25.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:49:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH 0/3] Some remote_vm folio conversions
Date: Wed, 25 Jun 2025 10:48:38 -0700
Message-ID: <20250625174841.1094510-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both callers of unmap_and_put_page() are for tracing purposes and
interact with user vmas. In a memdesc world, these should end up
operating on folios, so convert them.

This patchset converts those functions so that gup - namely
get_user_page_vma_remote() - can eventually safely pass around
large folios.

This iteration does NOT allow support for handling a large folio all at
once, it merely makes working on subpages of a large folio safe. Does
anyone have any thoughts on if we might want to handle these in larger
than PAGE_SIZE chunks? It seems like a lot of work with how kmap()
works right now...

On a similar note, might we want to convert implementations of
copy_{to,from}_user_page() to pass around folios as well?

Vishal Moola (Oracle) (3):
  mm/memory.c: convert __copy_remote_vm_str() to folios
  mm/memory.c: convert __access_remote_vm() to folios
  mm: Remove unmap_and_put_page()

 include/linux/highmem.h |  6 -----
 mm/memory.c             | 52 +++++++++++++++++++++++++----------------
 2 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.49.0

