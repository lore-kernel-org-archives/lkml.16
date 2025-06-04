Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE521C177
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038575; cv=none; b=Ms7bqZGXuO9fWRFHW0MZoeb3NeXqTCaoPnZAc+3clI602rDCuVkrIGpnIN9k8BsVbEzRoB2XbwFIhpDZNnZLka/TbL7XH81tReciarhRfbSjGQZR2T/7XClYEhbkqUKqMJpxEM1l2lgmJbJBgvLzGebOdAkii4LncvXDnOAyJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038575; c=relaxed/simple;
	bh=I8eBzeTMW2V+Qw1JI1vRGHg7SCjvgikCILck2lndrl0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JM8TcLds39du1LDw2m+wbkHhoWr0GCd3hD/7F3gno9gMO4YUz0qBlMq3bzXCXYE1sCOFggJQExxbo5Is509ucwOAQWzlOMRuHvmiNuqLYedCMCWQsjomMtfY/Ri3SxbrvyKbnmEJvGjY0RT1D58Dl/KZWf922KXBy6p6pRmKZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F2CC4CEE7;
	Wed,  4 Jun 2025 12:02:53 +0000 (UTC)
Date: Wed, 4 Jun 2025 08:04:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox
 <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604080409.448a27e4@gandalf.local.home>
In-Reply-To: <dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
References: <20250602170500.48713a2b@gandalf.local.home>
	<20250602171458.7ceabb1c@gandalf.local.home>
	<aD4boBrdZXtz_5kL@casper.infradead.org>
	<fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
	<20250603102959.20c85adb@gandalf.local.home>
	<aD8iL4cFoXpIVK_0@casper.infradead.org>
	<20250603132736.554f611d@gandalf.local.home>
	<CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
	<20250603140632.168190f9@gandalf.local.home>
	<dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Jun 2025 00:03:18 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> I vote for the "select SHMEM", but Thomas and dri-devel and Linus
> should decide.

I only tried "depends on SHMEM" which did not work, but it looks like
"select SHMEM" should.

I prefer this solution too.

Thanks,

-- Steve
