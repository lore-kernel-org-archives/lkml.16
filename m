Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2349218AAB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440816; cv=none; b=TYiWZZNZfH9iA9vmY1q8wMOZ/JzmayU37OuaskglbifLoKQxA6+e89kfkZYyo8120ReCUCNKPfnmqHyUM+Kaq22706doj0+AAKt1p9m7a7l5mAmOoVWqRmfW2ezVKwRC66tAJHIjVrUKoJ4ue8JEgp5awPAOSXUluHoQ5SdutJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440816; c=relaxed/simple;
	bh=ty8CZ8PfOQuKhNDdbfpzSP4TCs0Z8KwtEq/Nni1TAls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvdD3d5847UMx20uVWLOkN+/2QLy6vHA1joiNibhIarwRvrfTQpxCKLG8lZlLA+4/VN3AGmsoalp0wxOpLPD6Jld9Lq1zmE0xI+1+DwRyHQJdlUUZSH8ajowFwzN5bsgXkHd5EGh8KtwgQu8MuQbDhYUt84yCtfywKzHYxIRwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4OTqmdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4OTqmdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D5DC4CEE3;
	Fri, 20 Jun 2025 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440815;
	bh=ty8CZ8PfOQuKhNDdbfpzSP4TCs0Z8KwtEq/Nni1TAls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4OTqmdRHh5E+XNrgmwzxQrtuSzLwRXfgIzn4HsfG80tofbr7sFMYARVuBHSIy1Ej
	 TInLIwudMQgAmC4xmggDADO3bjsI3ShIavmPB9BLIGYdG0THxuZ5iMsUUOPwBjYEmc
	 1m6ma5DctPAkrMIAPAcO0cPV2Ll3OngwfpZ3D5UwrEnWA3CCjpkWhvOBkS5y8GRtL/
	 XPgTscG8ZynlH+nCMiMKzv2vfPwA+n0y+LNokNX12frf1F5hDiI8ujOiNGwUn7dR8u
	 Q7xF3L550lg2WML65M0ylFAt9n4froQyWjumTYtXoBKtHwyhITTCYCm6glTArzfUyo
	 e/KrLYXG3iSQQ==
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
Subject: Re: [PATCH v2 3/5] mm/madvise: thread VMA range state through madvise_behavior
Date: Fri, 20 Jun 2025 10:33:32 -0700
Message-Id: <20250620173332.96194-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:03 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Rather than updating start and a confusing local parameter 'tmp' in
> madvise_walk_vmas(), instead store the current range being operated upon in
> the struct madvise_behavior helper object in a range pair and use this
> consistently in all operations.
> 
> This makes it clearer what is going on and opens the door to further
> cleanup now we store state regarding what is currently being operated upon
> here.
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
