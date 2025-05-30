Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D9278172;
	Fri, 30 May 2025 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635585; cv=none; b=XyjFG8djXn6u54U68kwK86MI/e2l5AGw6vwnBiSZAdR1YufUhko3kX8L8QGYoSQ6FOFNmzfVFf2wJxIq5ZEEBXe2TGxTJIlXYKQkt4JWAFs6IA2RET7kI3A0QhYzZsnVkRTFQCfFH/ZNdpKe+df5Uk6QkMknhncyiEzhKYqruBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635585; c=relaxed/simple;
	bh=V8aTG04ZAEGYlZwTtP2eJJ/cuAcdbMFJH1v6uIkjQdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8oe5kxGOGrvMqE/yRuSre5A5DteLJh5c89Y7Vh30E41+MHUFNh71zuX+ZDinaL9N62e3FC3AT7dPC89nELfhhWjeA5oXezNkt1l6CxJpqhS9ICeYUxBWG/Hk284BdEWw1Yr58HG8fMZcWPYjCT7BhkamQdImK8ROcFnhpkrBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWVmkXkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWVmkXkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E729C4CEE9;
	Fri, 30 May 2025 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748635584;
	bh=V8aTG04ZAEGYlZwTtP2eJJ/cuAcdbMFJH1v6uIkjQdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWVmkXkCWxK9+mwg0c9FMWRJgG0Fvf+KXSKGmCfTY8eO6amQuiKcdr/xN84yfFfsM
	 7zyyRLGrxu8m1VdvEvDJaglCGZedlpsLuF4xND2zKRD5HiA/QM9qUl7rh2ukQM/Dtw
	 j1jx8kzb3D3tQezSYlWmxHYg52T6An6BfjM001UbagESiqrwZoCKs4Ocl6p5+7tY4p
	 vGI8MBjS7obzrC608HunVqawuJnDWI/5PMQ7lGLkR1Y7TAjyz5+u9KFh88q1hNpuuJ
	 x2QkAPA6M8/110qZjJQftSPYBuJChVL4YJ7R+whln+uxm75fWCN7NDQA6GHJSVctpy
	 sK+cH4z0vJXLg==
From: SeongJae Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn,
	fweimer@redhat.com,
	stephen.s.brennan@oracle.com
Subject: Re: [PATCH v5] tools/mm: Add script to display page state for a given PID and VADDR
Date: Fri, 30 May 2025 13:06:21 -0700
Message-Id: <20250530200621.52327-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530055855.687067-1-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 13:58:55 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
> 
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
> 
> Output example:
> sudo ./show_page_info.py 1 0x7fc988181000
> PID: 1 Comm: systemd mm: 0xffff8d22c4089700
> RAW: 0017ffffc000416c fffff939062ff708 fffff939062ffe08 ffff8d23062a12a8
> RAW: 0000000000000000 ffff8d2323438f60 0000002500000007 ffff8d23203ff500
> Page Address:    0xfffff93905664e00
> Page Flags:      PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>                  PG_private|PG_reported|PG_has_hwpoisoned
> Page Size:       4096
> Page PFN:        0x159938
> Page Physical:   0x159938000
> Page Virtual:    0xffff8d2319938000
> Page Refcount:   37
> Page Mapcount:   7
> Page Index:      0x0
> Page Memcg Data: 0xffff8d23203ff500
> Memcg Name:      init.scope
> Memcg Path:      /sys/fs/cgroup/memory/init.scope

As reported to the previous version, I show below on my test.

Memcg Name:      unknown
Memcg Path:      Unexpected error: 'struct kernfs_node' has no member 'parent'

I know you explained it is an issue of drgn version on my setup, as a reply to
my previous report.  But, could you please make the output more easy to
understand the problem?  No strong opinion, though.

> Page Mapping:    0xffff8d23062a12a8
> Page Anon/File:  File
> Page VMA:        0xffff8d22e06e0e40
> VMA Start:       0x7fc988181000
> VMA End:         0x7fc988185000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:       0xfffff93905664e00
> Compound Order:  2
> Number of Pages: 4
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Tested-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
