Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B51E47C2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422901; cv=none; b=Kvi3gUx4/6XDwnJP/sMqMuBfrpzPKqEX6NleDpuL69oX9SceMoLBmeblhz0obX6bzmquDaXNlX1L0eQwsJm8K2rsyz5dxMkogQmuBaUwuX2QlgafcwvDkljwvP23F2WzbhGcb9V7NfJ9LLkGpewzRqsewI5utebCP+5kQJLJvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422901; c=relaxed/simple;
	bh=QuwsF68+q3snx8UQO0tlk6G2q4jfyRa42zURLKqW3PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIycfl9+uvMHeT/eLSGRwodMH6SxJhULAjZ7XmanvyodNPLsYS5I/XGxjGP/+1C31DoI8p1ezsD6J0e2iXAci8g60CcQevQkDFOQNvTGuZzTqGU0/jXmzDP+/UdJ4aUCuLXVnkS5cpiySaxJCfTW95lYxDRdJRKuAtfe9xIcjc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sPs4UG8j; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sPs4UG8j"
Message-ID: <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743422895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1GWmMoHCvsubRoH93WkHaw6HXEFrK/VzVaX8jj4hCw=;
	b=sPs4UG8jWktVkHSe8cvVWOu6j+50Z/ao9cJTDZ+VO6PtZ2s8yk3wYbKtpraNBurtnePyge
	bBEv/GqIJ/KC/iXzkR3Ae5udUvGup6od/aKoDp1tByiXTb5NbKhN7f3QNEhR91qgIlirCT
	O6hh/mlEMTs01zImwhtm0jU7sQOx6TE=
Date: Mon, 31 Mar 2025 20:08:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
 Ye Liu <liuye@kylinos.cn>, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <Z-ayTt8o656AkGfz@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/3/28 22:29, Matthew Wilcox 写道:
> On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
>> Consolidate the handling of unlikely conditions in the 
>> page_expected_state() function to reduce code duplication and improve 
>> readability.
> I don't think this is an equivalent transformation.
Could you explain it in detail?
> Please, stop with these tweaky patches to incredibly sensitive core code.
> Fix a problem, or leave it alone.  We are primarily short of reviewer
> bandwidth.  You could help with that by reviewing other people's patches.
> Sending patches of your own just adds to other people's workload.
Thank you for your feedback. I understand the sensitivity of core code
and respect the limitations on reviewer bandwidth. However, I believe
that reasonable optimizations should not be rejected solely because
they involve core code. If an improvement enhances performance,
readability, or maintainability without introducing risks, wouldn't
it be worth considering for review?

Regarding the reviewer shortage, I’d be happy to help by reviewing
other patches as well. Could you please share the process for becoming
a reviewer? What are the requirements or steps to get involved?

Additionally, I’d like to clarify that my intention in submitting
patches is to improve the project, not to create unnecessary workload
for others. If there’s a better way for me to contribute, please let
me know I'm more than willing to collaborate.                         


Thanks,
 Ye Liu

