Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845A522A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633073; cv=none; b=mgifKtu/qcuZaBBKpl7NQBfII8i8y1By36hgsxCfwof93KykWXzyrgcd2T9Rcm9NhI1YOSUO/VYRYTYL/7q8zCbMNx0PeN0DgDLhBy0xhE7hwK3Km49YJpKa50FXgk+tM3cE3qnnrMmT6MvHPLwCYJlNjnj9fNcD+i7+A3ZsVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633073; c=relaxed/simple;
	bh=fPT69akKUvCLeYLd3ykQ0IaW9r9Hfel/YzBumW/Zfts=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e6Zs5aCZk77bL5odxIIO5ZacNc6dYgWBnnOJlyOeVPQ1PH7VoLCtPEYpBHMQtjOVyijp6E3xiaPMP/D61joLawmhOdbC8Lge1zul4PsgPliqQX1aJfQJ8pIcTb8r7QTGKwCaJmAkDw/6FfBTWm9XK4DZ7swuDZ+KkOi699KuXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=q1bPYxA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="q1bPYxA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA7AC4CEDD;
	Wed,  2 Apr 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743633073;
	bh=fPT69akKUvCLeYLd3ykQ0IaW9r9Hfel/YzBumW/Zfts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q1bPYxA718yqygzniYGCOiIIyYgq5mLHH2fYc+LkE7Dyud6IJ5zXKCXI3Fd11KvfP
	 aiB8ZZNmMjWbDTg5We9aEcyHO0ZCY34W4u8kkQZl6EWohBbkcRplygYQTK4RWRtlSF
	 vHzQf7kQzmRM1eOZpNYcYDgBFQLsN3kFhgO50j/g=
Date: Wed, 2 Apr 2025 15:31:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, jannh@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
Message-Id: <20250402153112.083e39e03b9d5fc88a672846@linux-foundation.org>
In-Reply-To: <5598853a-8f04-4bcc-8e45-984bd8556372@lucifer.local>
References: <67ec7e14.050a0220.31979b.0030.GAE@google.com>
	<67ed0af0.050a0220.31979b.0041.GAE@google.com>
	<5598853a-8f04-4bcc-8e45-984bd8556372@lucifer.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 11:19:45 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> I _think_ we may be doing a 2nd PR for mm?

yup.  There was a bunch of material awaiting a -tip merge, and a few other things.
