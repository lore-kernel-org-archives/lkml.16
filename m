Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3FB1D79BE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744944729; cv=none; b=YIetJKh4p+0o7olYyCLDAYUKJxNXuBPLdW19UGlrOfZi4AXxNNWBrnJRlW5Gi8wdC2EXSD4/fp5y1L5xOJ0ZdH6xnT91D4JIRCBmhwXR68GsRoGmlelFB3obPu+v/p4WqWK3f39IS0qRQhH9ekorgD53rryw3uMg5VknpC0+g+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744944729; c=relaxed/simple;
	bh=SKfMd+634BuGsz7zz9NMuTghd0KBzLyIMLZAFsATDRI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=K/OmM1MhQbx1haC+PCMDj8gEap2INtNDgIlwRFhdmv8IeUL6JclFhgaAiWB/U8EfGiZqBYxdLRjbgKgWZ6Igo8JzfsTH+TT0lRv4bvKHaOODQY+Xq00KRTqhZwI607sagK/9iT6MQsDhHfwd4EAQb8iTeNyqTqS8fLFRm9cokNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YE/Acinh; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YE/Acinh"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744944724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L54MQQ1f5aq5yLN/fVD/w5qzYfx+/RZYsJtesZDDoWs=;
	b=YE/AcinhHhwcGbtga6Ln21jTnUpQDy4FH6Bqcr/hDVYcXqlWxMyuYIlKlNANybY+vvtrK4
	0JXcqFBWAoVR9H7yxqmFqC7IKsqlF5vhDOElVC/k/DcuSzP0vK5ElwDsrkRgMbjSgVWqs4
	ftQZNu2odpH+UDywuI4EB0MeGc0FGCc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 1/3] mm/hugetlb: Refactor unmap_ref_private() to take
 folio instead of page
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250417155530.124073-1-nifan.cxl@gmail.com>
Date: Fri, 18 Apr 2025 10:51:26 +0800
Cc: willy@infradead.org,
 mcgrof@kernel.org,
 a.manzanares@samsung.com,
 dave@stgolabs.net,
 akpm@linux-foundation.org,
 david@redhat.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <2E7B3A48-D631-464F-8940-EDFDEB07AB51@linux.dev>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
To: nifan.cxl@gmail.com
X-Migadu-Flow: FLOW_OUT



> On Apr 17, 2025, at 23:43, nifan.cxl@gmail.com wrote:
> 
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in
> &folio->page. Let it take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

