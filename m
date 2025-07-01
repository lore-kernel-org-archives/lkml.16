Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C71E51EB;
	Tue,  1 Jul 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751404627; cv=none; b=TOv2YST7/HSOuyZxERkeEZ7eIa8ZWqFCotmUWId3TbZjSjeOX5zcE0OkxrXbyI4tBwDGWjAzC4BIJ3p1FHRinYwGZ2OB1+kybYkH57otZswLesfmlSQaBs9zetXGaqSW0zKTQrMNLR5cRJi6gkADKUuMspd5i6HxlnVFYOmXuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751404627; c=relaxed/simple;
	bh=7eGyOEV7x7wAt+ZhaYCGZplsavyBFsM2rS6N9UhFUQ8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=STXoBqCj1X8+9UoANPQj+EsyRYJU52kk2RLWfAFuQNdV6qoPIr0uwgXxeSKBj2MRdoVt5+0QUjZaYvJyxF8GtyU3Sx/qOqO6q7I8uk9w6JUR3dhVA0jpkfEAgZrHEnwePUYr7An8xxVsOzShMaDeJgRkUpXLbkipiBMg1f0CfV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=12uUgrBK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="12uUgrBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5CBC4CEEB;
	Tue,  1 Jul 2025 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751404626;
	bh=7eGyOEV7x7wAt+ZhaYCGZplsavyBFsM2rS6N9UhFUQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=12uUgrBKhm5i1StiXqgwObMK+FWuQQrAJLnv40gfKzaoYNpfhtSzahhZDh6i2wdSx
	 Kt4EAgzr1RioihUsPzPA7+YOjbKfXJdx+YdDCXABOh5F/4v4Je8BZEIqdB0f/jwGPx
	 Qpf5uc2iRbb2/S/DxNqVppj6dWpS1S1SKJi4omsE=
Date: Tue, 1 Jul 2025 14:17:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Message-Id: <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
In-Reply-To: <20250701143100.6970-1-lance.yang@linux.dev>
References: <20250701143100.6970-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Jul 2025 22:31:00 +0800 Lance Yang <ioworker0@gmail.com> wrote:

>  - Add Reported-by + Closes tags (per David)
>  - Pick RB from Lorenzo - thanks!
>  - Pick AB from David - thanks!

It generally isn't necessary to resend a patch to add these
things - I update the changelog in place as they come in.

In this case I'll grab that Reported-by: and Closes:, thanks.

