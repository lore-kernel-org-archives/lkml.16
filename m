Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7EE29B0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743870638; cv=none; b=TTc6tt2kUc5e2ahcX0gV4ItY18juazzrxgFPH2xhtTb80Uuog0kyiOd8Q2oGiYpNNZoUK0uWLCqGt6XTK8Q1mFd2Ww6DntYxUHd/EaNntedDRl+Yis5oRrPDkQrmsy5mOi2OmcVmLcWA7tsNC0OhWli4uEAN6fE7CTdP1lN4k4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743870638; c=relaxed/simple;
	bh=iWgEZftyGtFM5UmeMg9l/DtOQzjAfp6fIREhwn8F1zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=djThItHDW+7fklCVtLDc0D7+tuzVU/jwId0fWmUOKOjGXryrdfQuqPgleRm11sMiu4REEmr5G7PNcdqCN8SG5ghsoo5OE0PqYHKa2wdFMWIXE0wz0cos9A1jK8PR5ykek8gdBx+9iBZAC9PGxLRDee7S7vSi/EVvwP0q6S2umVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1oBLN4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1oBLN4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDAEC4CEE4;
	Sat,  5 Apr 2025 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743870637;
	bh=iWgEZftyGtFM5UmeMg9l/DtOQzjAfp6fIREhwn8F1zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1oBLN4yRCvE/hf2QdwBCtua+suSwmqshi+rqVmxJ726br5dHinPbS14XoDc0uxH7
	 NYSF5AzhPWJZguesKJDCP4g5aHhpvwVpefRfBeA58YyPRpt2CSjsGPZRO2VD+5mB4L
	 Yg4qkYAl5aYmQsEHXaBYU8jHGjWZ8KfUnxV2Lu2pMRQNrUwVC0eixNlUtjZ9RM1J8L
	 I2GgWcipAdkNoPwhVs2BaaVbBGWcBYkIRCCixAWcQtkZEplsIPkVtVd5NTcIzjwO2g
	 3KpqKFmTpVLPF1+EqKJfZGcrxdEQ135dbX8vTOXGcPTh55ChDmSDdWrsryrcESKKzb
	 oY16cMgPQeanw==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	conduct@kernel.org
Subject: Re: [PATCH v2 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Date: Sat,  5 Apr 2025 09:30:35 -0700
Message-Id: <20250405163035.8906-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405013136.3863-1-hdanton@sina.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleting Hillf and adding conduct@ from/to recipients.

On Sat, 5 Apr 2025 09:31:35 +0800 Hillf Danton <hdanton@sina.com> wrote:

To my understanding Hillf is banned from the community for now, due to a CoC
violation.  I'm gonna ignore his reply until his mail can seen on mailing list
again.  I believe that aligns with meaning of the ban, and help people less
confused by mails that replying to mails that not visible on the mailing list
archives.  Please let me know if you have any concern about this.

And I have a humble suggestion for conduct@.  This time I was luckily aware of
the fact that Hillf is banned for now.  I think having an official and formal
way for knowing who are banned for what time period, and a guideline about what
reaction to this kind of mails from banned people is supposed could be helpful.


Thanks,
SJ

[...]
