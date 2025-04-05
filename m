Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A0224F0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743896814; cv=none; b=A94C7JSkqWhvgyW1eb1tc9QQzi56Qx36hrqchh8uhT9SHN/pFMh5VwmhB5Sr18H0tbmMaEh1jBpcGd7A/UiNKFCkfdDLXwBPA9Psaneviy1PLpWbPaXs2x/UL20+14lff0YlrnWOZysgd4zLFLKAsQv/ISliIj9qUZi1wy9f5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743896814; c=relaxed/simple;
	bh=LyCYJFWQp/xjZPhOGVsyQY6KaP1pr75ZBRe+LWVfn5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ftEWxjnANjKYuZwTmiTtRtG2mc9XbvNKie8mHC3diQHyP7jdaEconsxw8UfGhPU/8Yq5bVN7/znXMtnKtsFnRxrJ+xQitdT1qH4e6MhS5R4t1ty6YKIgh0oX8Gij0ulLIgSDAko3egS5eFUwfqWG60MiBP3N0PbWG/vU5b1ppW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NltGjZvb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NltGjZvb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E44C4CEE4;
	Sat,  5 Apr 2025 23:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743896813;
	bh=LyCYJFWQp/xjZPhOGVsyQY6KaP1pr75ZBRe+LWVfn5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NltGjZvbFrUblso3yHKoDlNJ2bRMMs9r6fbkunQg0uJSkKqBzHim2/GUwxd+499zP
	 tCr8YOJ40tgB+qbX5up5RQuEorIjsLrYN7JFSHaxtI1Jv3MNilCWC1dn4CoGsNYaV1
	 QofvPV7tJZwG0k8PVLYff/HPIvbOThLELU5WLntnN6WNJWWuxXv6g8RL6rdm0iCJDx
	 gDLGhSsjhxravbX0xasfDDSStXqUsB6VUBjCKrspEKzyc+5fhFIfMkbAIDXeFDtHWv
	 3T+OOQUjHtYvqEAZWGPwS0Ar01H/XoRo1PVeKcUFtHClQf6K7kPphYf9dFKmukRtGA
	 FyjKpzp004UPQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	conduct@kernel.org
Subject: Re: [PATCH v2 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Date: Sat,  5 Apr 2025 16:46:51 -0700
Message-Id: <20250405234651.16847-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405163035.8906-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  5 Apr 2025 09:30:35 -0700 SeongJae Park <sj@kernel.org> wrote:

> Deleting Hillf and adding conduct@ from/to recipients.

I also wanted to delete public mailing lists (linux-mm@ and linux-kernel@) from
the Cc list, to reduce unnecessary confusions.  But I forgot doing that...
Sorry if this confused you by any chance.  Please ignore this and the previous
mail if you're not directly added to the recipients list.


Thanks,
SJ

[...]
