Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FB14831F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125274; cv=none; b=WGA7Q+M6Si+ZrjgmbFUXdz1ySVsH+8hqgo2LTlg79/6vdn7eEg8QQ4zA62S12sUG/aiksnjREwNXYf2VBO6KXLGROT7gRR4tuxVeqUwz/MOIVbUUiXEmVcJPh6zK5Er0YoCWrntrTCEzAYmBOWnFnGmA3VlW8ITJAVaa2mNZ3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125274; c=relaxed/simple;
	bh=wE83imfpv4jYwyzkj2RZFMFxxi58igB08hX6SRTGFRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mymIjqHaRDWS0wQUwOl+hwBR5LECcQkt5lSaNXEUV1M4uZ/aH4o6tTuRrIBFdrY7gR9WJLmjgkdB73Gz/Wxu34Gs1eH5ON9KFz64KHYvaCU+U/lhNuSV0YBXZ1/TJaawFFp4CKybG4CujUuWKdRdSVZ+RqtH3CVzh1NjxseC9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DYQfKvIi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DYQfKvIi"
Message-ID: <e88da771-757d-4cfe-818b-44230509bf9f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743125270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE83imfpv4jYwyzkj2RZFMFxxi58igB08hX6SRTGFRY=;
	b=DYQfKvIiwYCt/XH395Ge1y/3Ug5CF84ZMPDealDlsFFbndHOVVy0wzpR5ngurQhutoicjh
	W5x91E1mH33HOuDhWVtmcDV/IFWGYdUccl4kWzTrLbMJ0/V5m2Zq/CWD9SdZ4JKiKTEG88
	6lONkmc0KlmfGX/Nmhg2O17T2rQ3xZY=
Date: Fri, 28 Mar 2025 09:27:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Markus Elfring <Markus.Elfring@web.de>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250326011752.917564-1-ye.liu@linux.dev>
 <0ceb4ab8-adb5-46bf-98e4-61a1bd908e20@web.de>
 <7c278ba6-c1a2-4ef7-a4ac-48c233dce7a3@linux.dev>
 <49276ee6-6eb5-418e-99ad-3ed9d3e82414@web.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <49276ee6-6eb5-418e-99ad-3ed9d3e82414@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/3/27 23:05, Markus Elfring 写道:
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n94
>> How about this?
> I hope that such review can trigger improvements in change descriptions
> for further patch versions.
>
Thanks for the review and suggestion! I appreciate the feedback and will
improve the change descriptions in future patch versions.               

>> Consolidate the handling of unlikely conditions in the page_expected_state
>> function to reduce code duplication and improve readability.
> …
>
> Would you like to append parentheses to any function names?

I'll adjust accordingly.

Best regards,
Ye           

> Regards,
> Markus
