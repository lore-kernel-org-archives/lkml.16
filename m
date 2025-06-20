Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A1B30E826
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443159; cv=none; b=rOYyp+0e/UwlcejRs7tUZRUtxeTdNWpZsGvmmMemVYnefRDS48+R7spzzfIKRHoxidIJtC3SdNBRqVKl3Vqfwz9Lrz/RsL/leuiLvd6MGXYWOH4k/zSnOR4ydyCU2q7mVlqg1rLiKmEBe/onGXmRb3oXFKC9Q/0kozn5g4OEpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443159; c=relaxed/simple;
	bh=heOBbXpk6f6Az4nE7nkz1RB7Hyg59z3vIhvOO8EBacU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Plsh3SZBGW6HgKT+TXgBUL52byJH351VdiuiulxifhWOwdrLV0H5GsKnA98wqHg0egILJg7Wlaoc9ieG/Y4foGvKqfDYRB4C+wvXqlQApYAWSo14kogmGB6wkgtdJkR4LZk9GSg5e/gmYPbA5tm6h/CMI4x4xYwEEvleFnTQsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hyo+Ediv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hyo+Ediv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2509CC4CEE3;
	Fri, 20 Jun 2025 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750443156;
	bh=heOBbXpk6f6Az4nE7nkz1RB7Hyg59z3vIhvOO8EBacU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hyo+Ediv5abBNlyhDXiHn/8huoVYtvblOGdRGNu5yoAYallcIAvC26PqWKAIPs+Ie
	 MXY4TA2aROA43grx9j0HEpY6EYz9dVSyxpla8Y7dko12PQEtPuirFuJvcojofgUk53
	 yPbOBGeGsZNETgRfSMiKfx1qAXsNpgE/Pu1CDwKc+ZAqrYL5P6W4/acnIiJPEZeFL7
	 QVQoGVJ4gATJ9I4TDr4g87s1ZoJZE2IZqw8uGpenIXvGwQQk+NSYLuXCPy7/Nh5SF5
	 jjAuNA28BMOR6FLOHuDg0GgI4ZUoL5y4nEV5E4+Ugf6NzEomj4o+2g2pcLXbcdCLQy
	 E1Hb+96N5FImw==
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
Subject: Re: [PATCH v2 4/5] mm/madvise: thread all madvise state through madv_behavior
Date: Fri, 20 Jun 2025 11:12:33 -0700
Message-Id: <20250620181233.96739-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <a7dad10b-11e9-46e0-a21d-5862a0167ed8@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 19:01:19 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Jun 20, 2025 at 10:56:22AM -0700, SeongJae Park wrote:
> > On Fri, 20 Jun 2025 16:33:04 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
[...]
> Anyway, I'll fix up if I need to respin but I don't think it's necessary for a
> fixpatch at this point :>)

Makes sense, and thank you for this nice work! :)


Thanks,
SJ

[...]
