Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3374C8E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860821; cv=none; b=EZyy0jqXI76f2m9S4ltzPKz3nxRh/EPx7iCwI2h8QfYvH8hLOiM1wJWmO64/40cOih+XekBA3BdanLbeGV+argkcIcWqc6wmiqX4vnyh2IZtVF+k60MJ1BJJt2wxhKZZXIk6z29GDEdYjxV7HMElWJXAqgockymO4T2Eo7hVhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860821; c=relaxed/simple;
	bh=GprxOyHnQtSNu0PySsnNnGui8NBb/92gUrmZKWURi58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jN9lPyWW+MOnN0wpQ0qhHscjjlXbzAEOzJWaSVS6C/Y72Q4dHPiUfdDPd7oeqRSQwH/pGfx7E8iQguU8KZgTHPPTJpkPquaaAU3GYGqWF5d5Bk+ILKgBJcURm75IEke66keC39lP0JE+sKXZeFsB03I3VhlZbU3l9IBW5heU4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e54vJHQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e54vJHQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0431C4CEDD;
	Thu,  6 Feb 2025 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738860819;
	bh=GprxOyHnQtSNu0PySsnNnGui8NBb/92gUrmZKWURi58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e54vJHQpC2fICYi7U9+ZX73tXsHG9K3XHukYrLYKL1hKqoC2S1iUywXsMalmTcp63
	 nFVVdh9c+692gO1J9oLlTlqLHhh+nJShwiVdopo+9XudS95YZEGrzJLG6umIZDpl27
	 4LmjIO5mS2R9wloWnL9BdXqpOKsUtdNwaT3u8NovhZDDRfTaM0N1WicsUgGZKBpfwB
	 I/LIXj/PgcRVvuxAiwND6lTfAuknG7EDai44pcd2axp/XFiiYvRg6LC/RnNnxTUJvs
	 hPlZGUcqjpyIDwT3abwNlW+lx5eDiDiHVMC/qNCFXUJ0ZUOtlg2/RZ59ghgVaN0mKd
	 tiqTolQ2GK6wQ==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Thu,  6 Feb 2025 08:53:37 -0800
Message-Id: <20250206165337.6285-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <048896fe-69cf-479c-a89c-0242da88f84e@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 6 Feb 2025 13:04:53 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Wed, Feb 05, 2025 at 10:15:17PM -0800, SeongJae Park wrote:
> > Optimize redundant mmap lock operations from process_madvise() by
> > directly doing the mmap locking first, and then the remaining works for
> > all ranges in the loop.
> >
> > Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> But please fixup the comment as below. Maybe Andrew could do it if I am
> giving enough info to go on, otherwise it could be a quick fix-patch? I
> attach a lazy attempt at a fix-patch in case that's useful.

Thank you for your reviews and this fixup!  Since Andrew already picked this
patch in mm-unstable,  I will keep my eyes on the tree and make some action if
needed, to ensure your suggestion is applied.


Thanks,
SJ

[...]
