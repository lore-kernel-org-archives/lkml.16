Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BFA26A0E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962757; cv=none; b=Jxj+etr1NfrzOhBCFGW1BRgZn6t6U9NeEttTOkU8ua6w5sTnAPsxRCOA/SFgzj6q+aHAKQtbHqKq2IKXLJKi0her1dsGAzZ1oN9eYbmjYbDE/vZznufbuRSkM0YT22l2hYxXzjrb6YV80vZqn1/k5pElIFt3hn0Oc8eutBVIcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962757; c=relaxed/simple;
	bh=KrQbfYE+8CruC4nTnPg+ou66b1LDa4xDvIFDWhZZEdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HBC4jQslRbP+pEG2xEGHoE6jKMQmZCWQAS+YDW/p+Td4K/gRdR6geGcPU2A9NmGAIZ7QZlc1kWCGEjMBc5rzo3HVMNyysmQXNB71hrALrk0PzE+kBw15a24Bvjuyduy6gGxlgcwFr/dJwyA8PLGrWwLdBw0FAJHDVjLKY7H8CNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=puPoqqd9; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="puPoqqd9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744962751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nomFWiUadmQppRDCzywZzOvFHXhEKrvLAJ48m3RuloY=;
	b=puPoqqd9DM8XZgCENB3WcogeOSSnDm/JObuxwT33d4IhUIrPJcdxZLqllzCZZVm6DtsCRf
	me+8i3uX3Nui+FSGRkQXBzDYVLSk8HR5RcvASQT0LgqPyQ7/qq4rlV4aXhzy86nPgkOkJf
	2h0rVmzvh36Zjglst2ZQNXOYUMiAQsI=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH 0/3] mm: minor cleanups in rmap and memory-failure
Date: Fri, 18 Apr 2025 15:52:23 +0800
Message-Id: <20250418075226.695014-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Minor cleanups in mm/rmap.c and mm/memory-failure.c:

- Rename a local variable for consistency
- Fix a typo in a comment
- Inline a trivial helper function to its call sites

No functional changes.

Ye Liu (3):
  mm/rmap: rename page__anon_vma to page_anon_vma for consistency
  mm/rmap: fix typo in comment in page_address_in_vma
  mm/memory-failure: inline add_to_kill_anon_file() logic at call sites

 mm/memory-failure.c | 15 ++++-----------
 mm/rmap.c           | 10 +++++-----
 2 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.25.1

