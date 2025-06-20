Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839B4E56A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440312; cv=none; b=BIB1qMp8lko022BPKy8UmpZebGcTPDQxy8BKBZPvWPAvT5Z051+zap/HVhaDOepux3Zu3KY/sP9EnzrWzP7sCSiIn71Vv41c4VcY+5Tl4DZgcPrChQHqlNlnSrpUdsFWL3HnYX78ZRNqW4nAgNiMi1XUxdjEtGT9glxs4z+WApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440312; c=relaxed/simple;
	bh=p7hSvAtG8sqSs8KUmle/mby/GCjrkRGR+FksHhpvflY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R1NyItLN0EhdokhxTVWsNoH0HCJrMusJahV2mx0uYGBgkyH8tdVDutGWeIldg4MtZfBk6rPUbtFExQ3C4N76ilnsSkhYLQBE4tP3qBr+IFfXcnhfqMhrzt6q8lgBe1Q9Bqw6pkBXiSzzO8LgS/koX/+CbAcYqPSFv0Jucf9gKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0Dn4263; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0Dn4263"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9D0C4CEE3;
	Fri, 20 Jun 2025 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440312;
	bh=p7hSvAtG8sqSs8KUmle/mby/GCjrkRGR+FksHhpvflY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0Dn4263ULdT2bTjWTli5kVpEGdxZFCpKKy+htMmU5QYRXbrAqpVTeZZDkKCMogx+
	 10TAQXyB2QUjdjjqRJcOIHyaeDIn7Tq4UdEA9mn5ChwgfpL8dbST7oAbtp0VB40rLD
	 RikYfIq1rTPVHFQURRdQvyl/uvvLVkeI+7S1PrCyRiHdr0/26HOJD3KsC8ny3SUhxl
	 CWlHewBs1sm/QarAo4MieMI4b7lcYM74eZi2F99NjyDiNX83JdLgOijGV5UqtP7ix8
	 2MHBCmNTFuKZvFbRv8nAfx0iI7Ry79CpINPOgoX7hN4LqDs2pmvgu7y21Zcc2XTCZs
	 NBfcRdZlItj2A==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 2/5] mm/madvise: thread mm_struct through madvise_behavior
Date: Fri, 20 Jun 2025 10:25:09 -0700
Message-Id: <20250620172509.96062-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:02 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> There's no need to thread a pointer to the mm_struct nor have different
> functions signatures for each behaviour, instead store state in the struct
> madvise_behavior object consistently and use it for all madvise() actions.
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
