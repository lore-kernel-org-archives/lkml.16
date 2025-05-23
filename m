Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88C1FBE83
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020139; cv=none; b=CZntZ/US+YmjRAhzKGJKBHdzGZDcPtx4z+2xqH+sby1cLROsNnvtgfYXdNvZ7+k6nuS8nltuvebOQI5c918MamZSumoV/4qiJ+6UXNgHltQQROFWzDhnWTM0dqoVWth2s4t+K3QWks9LPB3ry+avuvpkXzvpIR1VLuCAUutBKHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020139; c=relaxed/simple;
	bh=xmwqX7chZVO/kEkiY56vTvE11o1b2Lrld7vK2xD4TX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+GsLEc4l2wy2u2pXAx9ToBwskOTzTFIoatJzHKBEUbL34RdTCszfZEiY5tcYFOQFfXtA2B8OPfa3mHlM/88IlZ9CrLFwIdy+l8+B2dG25TUD5AnE41Y+zZBIMvO/svllJzqNNLz1E2kLOUIVUZFGjDBoT7G6EatZyxlLIztiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JdjxrqEK; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JdjxrqEK"
Date: Fri, 23 May 2025 10:08:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748020133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp/se7jicxj+yoOqMhHd2QTo+oKXWzsTfKIONfPMA4A=;
	b=JdjxrqEKEdibdsi/B60aiCVkr4fUBzMp6l5bYaizrhPakExw6fEKjA/8kDsWngzsqVYvBK
	q8LSo42femlOXj23Dnc4FlRmZpyv4uTgEY6FF344FYtxPuoezviveSbxDDaNPX7vPszxpj
	QtEUg5B4w4QDv39dju39/Sn2M9t/WIA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
	hannes@cmpxchg.org, vlad.wing@gmail.com, linux-mm@kvack.org, 
	kent.overstreet@linux.dev, cl@gentwo.org, rientjes@google.com, vbabka@suse.cz, 
	roman.gushchin@linux.dev, harry.yoo@oracle.com, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3] mm: slub: only warn once when allocating slab obj
 extensions fails
Message-ID: <yqpholhqwgffsdgfjaqgu5elf3p63w3mgwlstcvewf26t6cem4@lz4wryjv4pfi>
References: <20250523165240.1477006-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523165240.1477006-1-usamaarif642@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, May 23, 2025 at 05:52:40PM +0100, Usama Arif wrote:
> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Change this to
> warning only once.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
