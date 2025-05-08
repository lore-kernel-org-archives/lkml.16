Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F512868B8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725194; cv=none; b=U5sOSp4HMW7vHL0AqtRCAJE1FJdqQSZn5PfdMtgu8YRgZDacy67TMVYaiuOXNKmu15CetIWiuN5Sj6RnAwR5OS/NY8PNIlgbq17yxyVBTluqmRucxcyZCaYTJTU5waFiAOihcTDAYmCZUnycDanPjvWR1IzRzxal3+Q34rFjtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725194; c=relaxed/simple;
	bh=UFTz4o3At5AWDU0VJEZF+Qdyd/60ha1lOaoGYLHMTjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXE/6cLsw4ZgBrXTiMXRkt+FxMA7JjevdT9KwtlPtBczUP68z7UVU3FggCL6sJyPSfTS67HGMz2iIHMG/RwnOkSsTWamR9WLENgS6cTxzKdDrcvX+LbsGK2SGSYUQ2k+0qz7gBw1oSchLmXMq4Q5JVG8DDqe0wrXJ5O5gHmkG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dtlFMQnD; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dtlFMQnD"
Date: Thu, 8 May 2025 13:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746725187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IKqMX+RotZHDDp9nRLTd9XVDFarImD2VtHq2rcxDtQk=;
	b=dtlFMQnDLtMNZZzbHoK4j4FyqufLlAqmSu/5xop96cg5fabr2C42sFTOW0WVTxIwdbqv2Q
	sDYHfEzRS+WAj/GgcmUx3Didqu0onJgnqiw0GK2aPMCNuEbWOv1zcvY/pQFpzUmHc3ouWH
	dyGRTNFV18Rk5f+WTIfN/NcsEZsp+2A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <dgwvkt7l3m7sqgneoaxf2mvmgompob6i3gfvle6aziplcr4si3@pwnu7n3azuqb>
References: <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
 <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
 <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
 <y6d7vzvii5wvfby5446ukpvdmulwd5lzcyki6rpxckh432d6jz@xwtlwnkhztuo>
 <7bf1ee37.b6a4.196b0b6dce1.Coremail.00107082@163.com>
 <is4valhxssgmj7cjdlp2gfvyivhdflu75vzzbkjeiyb47wom55@yx5lfwsptamg>
 <5294252d.b74a.196b0d583c6.Coremail.00107082@163.com>
 <64e0d38f.b791.196b0e73c9d.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e0d38f.b791.196b0e73c9d.Coremail.00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Fri, May 09, 2025 at 01:17:46AM +0800, David Wang wrote:
> 
> The impact of accumulated iterator rewinding could be observed via:
> 
> sudo strace -T -e read cat /proc/allocinfo  > /dev/null

Well, that sounds like it's worth fixing then :)
