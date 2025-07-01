Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FCA1FDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358976; cv=none; b=csAeVYebgYB9HyFHfgsMnPLBceWFxFNcm7pvWHdzHIMx4+pE2x2ODRrNMeokLSagtgfWNwzUggpUPdKMyF8m+NPvPlgSoPtAW3y1hOtPOyDsPdR0XnAmqQhj+1o46sE+6h0GjiVPTIxPlE0c83+YL4NYnmLlEKBEMZRyGMYSB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358976; c=relaxed/simple;
	bh=cXLI30941ROwGzJVR5Scxp5sDnxdSZCi5lkuSXGg7as=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=s5SpIAKihUh7C6ONSXIMv6fwI4ve/U4/HFXPFcacWjFTlBlruIkPdFVpur3fVO5JfwbtSAxyx+F1n/4VwGqLP1Oa4yDKObpEaxfPKGysxmtYIkCISQbynAaRqMch8w6ZX0Wav40/dQcuMbmpu/YM2x8Zv9kZtKZ2ZcGC1MoOaU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R0FC4q1L; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R0FC4q1L"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751358967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXLI30941ROwGzJVR5Scxp5sDnxdSZCi5lkuSXGg7as=;
	b=R0FC4q1LfzIQtmA9M1w/wh+15H+6XM2zLRoMns7azhIJ1+X8Egj5BYFTWharUQzPcy+Tv+
	P2s+AxV3EHY43HWm1wFNd0g/D1VAjPifwHt3MLnXbzi6z9R0Gyl6NVX6slov3GoK/+BuAU
	wjmxSth8WxM85SsBX8F0XOSHGSgpTac=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <b1d80881-89da-41a2-8402-c07ec704775a@arm.com>
Date: Tue, 1 Jul 2025 10:35:52 +0200
Cc: Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3339A0D2-76EF-498C-858C-EE11C8C1193C@linux.dev>
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
 <b1d80881-89da-41a2-8402-c07ec704775a@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Migadu-Flow: FLOW_OUT

On 1. Jul 2025, at 06:43, Anshuman Khandual wrote:
> Seems like there be more than one place where such str_plural() changes
> could be made. Hence could you please collate them all part of a series
> instead.

There are only two instances under mm/ and I didn't think a patch series
would be necessary.

Thanks,
Thorsten

