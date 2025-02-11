Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD626157C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298744; cv=none; b=I7qDUOK8lD0emuSA+ozRr7cRIKexwOOwBOXh4RvsEQEQVllOfMHwDX5vQ7m2Qj2h6e3BY9qpij/s4jLGpp6RL7Z+HGnsxZOInxevAElKv1Z4TEdpt11C23yJYmluY95+IfJm0CN+LEpuDRe4wfZL3ft+OrYIvyVEwB1E5PZLSao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298744; c=relaxed/simple;
	bh=N4pAmpxe6ZMr7DiTwr4tmWINAAYpWO8BPpplksgqNrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiBrQBwEIwIokaY8LP96v044Q4urbzHXC3nHwkE90CYqMrLcWNFShdet1qUjvUjVjgTvJSoMgZAhrHYM7KTgXUUisTHqIH1TdnKm678i9Va4yyj4puifHV6GFvYGoyzqXKJXcBK2shueuXiSxMb1KoVkP/IMoVjTQAysFT5wOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrtWeMuq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrtWeMuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D74C4CEE6;
	Tue, 11 Feb 2025 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298744;
	bh=N4pAmpxe6ZMr7DiTwr4tmWINAAYpWO8BPpplksgqNrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TrtWeMuqAkXBN6dJT/thaPKCnNxwUZ/t2IgXKBCCaCYDTNCqVNKJbiWFAf8TX6pNz
	 sjw4qpOBgfv4BmpDeTuX7An5iIy5LL5cal5G+0OxoQ8XtK1GcPNA7/8uN6HaP6XBYQ
	 fh5KZNP6CH5Bfw1Veom1heO8ko+iDQhiuVz/V10QUHN5UbIfk521W2D7e9+w2O6GW3
	 +ZeULi38mp1fWsHCOKVCZ17y454Yjrf3dhrwy/mxBGd4KQ9DJgOQfJvggMpQag6m45
	 z0fgCzVTgZlqhX7z9hc8XFZTVD22Ts8brR+pdFKms4H4ONRnz2+eq3H/sXoeVCLZ67
	 GL/+fT7sFiolw==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	"Lai, Yi" <yi1.lai@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	yi1.lai@intel.com,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Tue, 11 Feb 2025 10:32:19 -0800
Message-Id: <20250211183219.4281-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <794c4d29-8a75-48f2-a1d8-a519d0243290@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Feb 2025 10:34:19 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> +cc Naresh, as [0] does not appear to be in lore which seems to be having issues
> (meaning I can't reply to that thread at all), also +cc Arnd for his reply in [1].
> 
> [0]:https://lwn.net/ml/linux-mm/CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com/
> [1]:https://lwn.net/ml/linux-mm/fa1a7a10-f892-4e7e-acb4-0b058aa53d88@app.fastmail.com/
> 
> The report here from Yi Lai (thanks for that!) appears to be the same thing.
[...]
> OK having just typed that I realise SJ sent a fix already. Lore being broken
> means I can't link to it. Sigh.
> 
> Will reply there.

No worry, and yes, let's continue discussion on the thread.  Seems lore is also
working again, so for others' reference, the thread is at
https://lore.kernel.org/20250211063201.5106-1-sj@kernel.org


Thanks,
SJ

[...]
