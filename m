Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E91922E6
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178371; cv=none; b=n0gFENVE9Nr6L7EODh/RV4w/KiSa58jyu+yDSWCTfzMRj0O7tT7PO/aJ83PdYRxMKlv8PGSng7XylQMpUI81/Mj7lIXfmKIkH3REVpv9xaUCDzOScuvYFxbIWfbQRGBDbtVk6+5wJpl1ncSSbhOf1mFxJAmL0Mil6+kLheZkPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178371; c=relaxed/simple;
	bh=SEXG89I1TdTia3hf92Sj7gy18CB8EXF8ATsxIuvSrgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3F8MI5QWXaES7GwleijhN/BPTnitMzJJzM54FonHeL1euyjXfIrQ9COeH72in1NZjhtwwqSjd2LVHTeVgSk0BW2oUUd/rqjV+NY95DaXgbsc+BqYl4EqNiWPX0cITJKQ/LEnuMOsiZk0DUVsvZJ88L6KKKgTqIRvBYcCYXO0Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HcgUwmDp; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HcgUwmDp"
Date: Wed, 29 Jan 2025 11:19:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUTZKgL/l9z65Vjab4bD6aDZuXa+1w1OsDLrTSBsMqM=;
	b=HcgUwmDp6RwIq5PuFeJvf+5vPJftrpDCgUEPLOYO4Q+VhvmdaFrka2/fNclwXpz5cUv7Yv
	Co1hnwF5RquKlSxfXyhv2iHfgVPiJmxLoI4s9Ver0gFB319i2ZuAutbwvMsOcZI6LkibvE
	ZyoET/36nzdPomfBOxgw2JWpT2brOIs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 3/4] mm/madvise: split out madvise() behavior
 execution
Message-ID: <afx75yzgadhefig2vin76kkwxpjwzqdtpstcygis7mjvzlmgbu@t4umenugtzki>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-4-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-4-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 16, 2025 at 05:30:57PM -0800, SeongJae Park wrote:
> Split out the madvise behavior applying logic from do_madvise() to make
> it easier to reuse from the following change.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
