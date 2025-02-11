Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E9433BE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255879; cv=none; b=cjdcEQXtIO3c9/nYUu+0YqCtXAcrFlZ0TLWv7NwYA6N6Wwp7aItOSPORB95OWqimJDN9CsNO3ddgRI/4d+9nGcZ1PYTunRUFMJGYDFmFVhhziuOikK3CZVa05PIrBwjZa2l+Nf7ysBIG43xFtrgJ0Ukru9HSAxtBf/IyxXzyVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255879; c=relaxed/simple;
	bh=6uZQgoR0uA6VEsip3oI4LwHkKy77TFCniPhoImzlKOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a8uk8mIZ3M3Ta4eX7awkUAR0ROSJzQ5qOBBRw/W3rEHXpnEJDNiTrLZIAyIzCUkyAat1TafK3oq8t7VcJYUpwOt8JzdLCEQaJ2eyARjoS4wke92V0h138ywZME03RCDDpsHj/Ub6X38un/Nt+rSBlz6azb5ZwrQJqvQA+58sd68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCekxHfR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCekxHfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E975C4CEDD;
	Tue, 11 Feb 2025 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739255879;
	bh=6uZQgoR0uA6VEsip3oI4LwHkKy77TFCniPhoImzlKOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UCekxHfR3Vwbv3V8w51eiJPq01SQgFoFy6WDbLi5JFN0sQymjeUpfZiz0r51D06Vg
	 ztCTiCn/L5pMHlrdhh/gJbPeN84HGuJEMNDsaw/buy3N/nWpwEvnhJ59CtAP+F29VV
	 WH44U/WtrWjXkx2vygzOG2vGkuL1gvRFhV0I6QXbHoulSihJmlQopL8BJCbQ++l8WP
	 ilicZ9uBPek5stvyD6Snk0Wdr/G3AczCJv1Ai/z7stMpyWSHAHFeE2pgh4TyRD0Phw
	 1ekVM1AkRk+uK1YmYgRjEkoeZcz/XBlQCOTczDhjnMTeg6P/4kXN/E4Hka6Tvk/qP3
	 JMGFAnJtOv5jQ==
From: SeongJae Park <sj@kernel.org>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Mon, 10 Feb 2025 22:37:55 -0800
Message-Id: <20250211063756.5195-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z6rgiVp7221r4JZ5@ly-workstation>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Lai,

On Tue, 11 Feb 2025 13:30:49 +0800 "Lai, Yi" <yi1.lai@linux.intel.com> wrote:

[...]
> Hi SeongJae Park,
> 
> Greetings!
> 
> I used Syzkaller and found that there is WARNING in madvise_unlock in linux-next tag - next-20250210.

Thank you so much for this nice report!  I just sent a fix:
https://lore.kernel.org/20250211063201.5106-1-sj@kernel.org

> 
> After bisection and the first bad commit is:
> "
> ec68fbd9e99f mm/madvise: remove redundant mmap_lock operations from process_madvise()
> "

Nonetheless, I think the real first bad commit is f19c9d7b57cf ("mm/madvise:
split out madvise() behavior execution").  I confirmed I can reproduce the
issue using your reproducer on the commit.  And I think the fix may better to
be squashed into an earlier commit, 948a0a9ea070 ("mm/madvise: split out mmap
locking operations for madvise()").  Please refer to the fix for details about
why I think so, and let me know if anything seems wrong.


Thanks,
SJ

[...]
