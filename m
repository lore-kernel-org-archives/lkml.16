Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCE4685;
	Wed, 28 May 2025 23:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748475755; cv=none; b=CV1kvN9GYzDaTTk6b0G8IANfgJBsvUGwHQOyK67ANRJxzax6qVp6vyNYdmr0t6zVAFDa8b6VGXqBtSG6wqpTDmXYJokIoazx5eOeASAfWmkWXrJZ21YIawCIgbER7/0/1IGkO8/QQOzB/KbmYQneQywydx/5dUZXpQf/0+2dC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748475755; c=relaxed/simple;
	bh=XpwMGRqSBXKXFCcQsstWBhlAdlbcLCDCbgOTySk2V/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=efXJWpdgRvSQ505rIbA5Y4cGo8cIqlWksD/7BPiJOwaQ2/EQvLZC44BR2+5osOcnj2EW94n2LZqkJzlB2LKxNzfXFvF1/rFOwjLwE3ybRK5WGPuK0k3x3iLEg5j8oThs4oUL6laigX1aYcihfjr600N85UMGBh7x4WmKNlL/UY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9WjqCgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9WjqCgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09166C4CEE3;
	Wed, 28 May 2025 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748475755;
	bh=XpwMGRqSBXKXFCcQsstWBhlAdlbcLCDCbgOTySk2V/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S9WjqCgDUd8ltc4h8HETFcSn/XpEVFFEknz3REaP2YrDaN8kTPGnUosS5wCyK5jC8
	 jOm/W1wDmDfmnZw/5jOqy/FtUdOU87QTs/vc5g3EZQgdcqKK7KTnrnI+mQva9oy3Sz
	 qviVw0e/8F9irW71zPLjUHqEBVlr1wadUQAng/KGKVRrKn93gV01ZvLWw5U3jD0/14
	 4FcKQX4vhyH4yzJyiUfvXa70vBHfAoYK+mStqATKjjmboWb7sOMMVu6S6jlflFN9J6
	 oU1m37bo+rZz76TSLeYEe7DzN4cw18tqAaSlSO9/6y5P2/fbXfnw81b3DzKUd5W4ZI
	 0PQBL1jOYY/dA==
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
	fweimer@redhat.com
Subject: Re: [PATCH v4] tools/mm: Add script to display page state for a given PID and VADDR
Date: Wed, 28 May 2025 16:42:32 -0700
Message-Id: <20250528234232.56701-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250528091543.355386-1-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2025 17:15:43 +0800 Ye Liu <ye.liu@linux.dev> wrote:

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
> sudo ./show_page_info.py 1 0x7fb3eb1b2000
> PID: 1 Comm: systemd mm: 0xffff8d27279f9cc0
> Raw: 0017ffffc000416c fffff31105a61b08 fffff31105a63608 ffff8d27121326a8
> Raw: 0000000000000000 ffff8d271b9dcc40 0000002500000007 ffff8d2711f12700
> User Virtual Address: 0x7fb3eb1b2000

This is same to what the user passes as the input.  I think this is not really
needed?

> Page Address:         0xfffff31106356a00
> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>                       PG_private|PG_reported|PG_has_hwpoisoned
> Page Size:            4096
> Page PFN:             0x18d5a8
> Page Physical:        0x18d5a8000
> Page Virtual:         0xffff8d274d5a8000
> Page Refcount:        37
> Page Mapcount:        7
> Page Index:           0x0
> Page Memcg Data:      0xffff8d2711f12700
> Memcg Name:           init.scope
> Memcg Path:           /sys/fs/cgroup/memory/init.scope

On my setup, above two lines look like below:

    Memcg Name:           unknown
    Memcg Path:           Unexpected error: 'struct kernfs_node' has no member 'parent'

Maybe there are rooms to improve?

> Page Mapping:         0xffff8d27121326a8
> Page Anon/File:       File
> Page VMA:             0xffff8d26cac47600
> VMA Start:            0x7fb3eb1b2000
> VMA End:              0x7fb3eb1b6000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:            0xfffff31106356a00
> Compound Order:       2
> Number of Pages:      4
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

On my setup, this tool works without obvious or significant errors.

Tested-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
