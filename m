Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528017548
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749154433; cv=none; b=NnTpWJqLH+eCjSGG5tQVs5uyDLwhmI6kMxBkj1MdjknsN47whwEfZI16fQrTUL8e5pGZpxdUfBgFKAaebtkPVTxDIHo7VBbfR7KmSAM8VvvF4duQ7avacpsXGP2hDaSTd0ughPxWkbCZGmtAj2+EuDtPKglinZnkD753jrk7Nig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749154433; c=relaxed/simple;
	bh=ZMhXG3ijLnG2wlKkqX2hbJc9K+bPFna5WC+U9pMyo5I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AsgS4raufQOxtrpdd4N3flwG12GTasbH8euXTRMBf1fOBQiVWPwg3vaVQAtq/dBJsD7VLfNMTvSglpkeUKX+wq5Klrqez1fr5QcNHkeXOlsPYpRBFukQgo8PeFGJiHHtrCwVBYsw/bebzsAzu38p9MS9rz+j8INBFYJH6Yudsrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=taQLEAK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="taQLEAK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C96BC4CEE7;
	Thu,  5 Jun 2025 20:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749154432;
	bh=ZMhXG3ijLnG2wlKkqX2hbJc9K+bPFna5WC+U9pMyo5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=taQLEAK8GC6OoDR+R6i4qOHPp1PQGGb9NU3CWa8ZHX0tKCq4HOknxwH7ATYrW09fD
	 RxvF3qXGoapEdwnccpFhegiNxBSSa3xKK8kA02HahjWsGpc2/fPYf3cDrKeNWGQckN
	 ndvCSN9zcRyv9RqyZm2c0OJPqmwuqHF5CX67wcJg=
Date: Thu, 5 Jun 2025 13:13:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Baoquan He <bhe@redhat.com>, Pratyush Yadav
 <ptyadav@amazon.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
Message-Id: <20250605131351.1500f8b434e4c99ce8803e39@linux-foundation.org>
In-Reply-To: <20250605171143.76963-1-pratyush@kernel.org>
References: <20250605171143.76963-1-pratyush@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Jun 2025 19:11:41 +0200 Pratyush Yadav <pratyush@kernel.org> wrote:

> Side note: get_maintainers.pl for KHO only lists kexec@ as the mailing list.
> Since KHO has a bunch of MM bits as well, should we also add linux-mm@ to its
> MAINTAINERS entry?

I think so.  Please send a patch?
