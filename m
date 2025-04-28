Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAB8C1E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868705; cv=none; b=NffK4xu1SPvHVlspMxn/2Yf8bl+ZXz+wdLKH9yLk70urujJmYqdXiVkmtZUOt0P/ZnXHlT7As5GuNe7KxVJy95es6IaOIEObbfCuOYIWsB+aXgL+did3C8P9y/wqWJzxOOxNjcU/5AhJlVc6OJTN8OM69p/Y4NUym6fpQdNd1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868705; c=relaxed/simple;
	bh=tG65YvMdNuwVqR5QzvxPrbP3XqF0pgSukYlZth5bGm4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uOVJPMnW7ZLb0kyOteRvWjIsjPMKXPJdp3hR7E3/CS2BD93J+wKryk2VdUYgmHjKhHpoAUObcbzKDFgXepIckF8Ge8PkCU+8cASvJUlqGtHeAWBIGV7DX1ol2/NRg5DSAZNcCAJ0at2+cUZQiFXt42z1N/nCbWrKl0QDWd8YrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0MTUQdt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0MTUQdt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49265C4CEE4;
	Mon, 28 Apr 2025 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745868704;
	bh=tG65YvMdNuwVqR5QzvxPrbP3XqF0pgSukYlZth5bGm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0MTUQdt7bb20qpOqcbfI5o+64J+nSjxcyssfV/TcZ5tUmiYzDaAKIqJ7KP0Z7N5fp
	 M+Wpg1eedRH8V2UmW2G7nR57GAXAyENYaOlYih6QuMo3c0c4sIg9EuTvZ/UYAN6pWu
	 uheTGqoQRnnqqiifImkYJt7woQHrxIgL7SsGpksI=
Date: Mon, 28 Apr 2025 12:31:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
 a.manzanares@samsung.com, dave@stgolabs.net, david@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Fan Ni
 <fan.ni@samsung.com>
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Message-Id: <20250428123143.2b644354975c2b89e5ae51c6@linux-foundation.org>
In-Reply-To: <20250428171608.21111-3-nifan.cxl@gmail.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 10:11:43 -0700 nifan.cxl@gmail.com wrote:

> Subject: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and

What was intended here?
