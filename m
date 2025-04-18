Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02B1C695
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970174; cv=none; b=IXIlfoEHvbQ/TPZfn9ZNOXcyslvuoC2FWEF4qyXCVa5BZRqD6yI7emE6SbnSITcv0XhMEnHcE1rSgy9vYKwZoxOuXIzwvVfCNiId62LHYbtqOF8zfSf/AFpV0DV0yClFaYmCXdXNanCqWxn4lijMdfWtH52ngYpshLZbiNId7lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970174; c=relaxed/simple;
	bh=j0Ff3+nMG3xyG1dLVdUjYisJ+FhsvcYQPgJC4zoQ/Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OiK2dwhUL6YxmMwcvXDCI9Cf1e7wY0U5PTRFc9BTSeJC49TGLqvmKAmJQ38vMuAQc+8pMlXBHS6vPZ2agXqRs+lK+l7SvzzG2hmi4tTpHzLqmgjk3T/h4LgcDPhUNgrIqGYiYdPgax93jJv/K1tZmm3JHP99BzGv/jRDiuyGDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=filfOH1q; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="filfOH1q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744970167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A/De1OCAsyjl8yekjNW7c9Xe8ONiFOK3f0kjYQPDMHk=;
	b=filfOH1qSY7rJ3TWA6yJFkQD5oVFl0idjMZorABhWeI1oRcxmt0idvd1CnqtQTt03zOero
	C51xNVNfbWzGtItz4wJCi7qU24aNU3Sa5DhspVyQeyig1eAf+ExQIejy4GW9tRIzUDzrAo
	mzj7V5aC69F6UBPLpXMg/NlR/cN95aA=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	nao.horiguchi@gmail.com,
	linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH v2 0/2] mm: minor cleanups in rmap
Date: Fri, 18 Apr 2025 17:55:58 +0800
Message-Id: <20250418095600.721989-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Minor cleanups in mm/rmap.c:

- Rename a local variable for consistency
- Fix a typo in a comment

No functional changes.

Changes in v2:
- Dropped the "mm/memory-failure" patch.
- Kept only the uncontroversial rmap cleanups.

Ye Liu (2):
  mm/rmap: rename page__anon_vma to page_anon_vma for consistency
  mm/rmap: fix typo in comment in page_address_in_vma

 mm/rmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

