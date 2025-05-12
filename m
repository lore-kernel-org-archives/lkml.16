Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DCC24DFF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087222; cv=none; b=NalK2ulyJ3mDZSJfNumauZ/sznhWHs+I9MZ66uynqs8xv5uyOenSmT3I2hTnuKdKWf3Wg6HJaT5wOydqlMtpy4vpqjHH55jQO9919iAWP8kcLpDNM9URK6ETUX+HUTtDG5X76NxOulLO0qiKjinJmwLGCvjAWwzVHSyyl1dBanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087222; c=relaxed/simple;
	bh=tSOSzxlq70TakGIh+BpXgPUlW8xGRO0+WUJHxZMcMJc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=k254egqKE//fyEyLkCegzk56ICg9jpAqnBqN1yFjrNA0XSSH+hGDiS8603i7zAxWL5OznIQAtBtzxgX9cvTbpVzE95d7GpR+Zkp0xz70SUBblwlJ1vuPfXJYaTdVD7c9kjiKkOgqv1G9okkEE0zlA31JE6On9I2hLd0aO8nAHsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a7Rs1SVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a7Rs1SVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D007C4CEF0;
	Mon, 12 May 2025 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747087222;
	bh=tSOSzxlq70TakGIh+BpXgPUlW8xGRO0+WUJHxZMcMJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a7Rs1SVkBiyf+2k12uoc/eKRUzL5eZdsa5phcpfOzmEd38bEEfwW3woMoGFx9RrIJ
	 xqoDn1VZO3A/NlYLAPGzb3y0YZjNt/mi3SUe7VmijzMBaVsQElMjdoGDiPlJW2hD+7
	 dpfCEz0+mPOqK273peliNxVgGygGkDMCF2MbEMoc=
Date: Mon, 12 May 2025 15:00:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Mel Gorman
 <mgorman@techsingularity.net>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, Harry
 Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Message-Id: <20250512150021.8a617c6feae9b9fb22ec2f61@linux-foundation.org>
In-Reply-To: <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
References: <20250509200111.3372279-1-ziy@nvidia.com>
	<20250509200111.3372279-3-ziy@nvidia.com>
	<ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 17:10:56 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Andrew - please drop this series, it's broken in mm-new.

Gone, thanks.
