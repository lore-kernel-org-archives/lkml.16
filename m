Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DB210F4D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425509; cv=none; b=U0RCWk96YqlwjRDUxuzopaN/U4dajyeHKFVChl/DPKQjFB4mZSL+2gSwaG97b/WK9tS6Jk5xPUPEvQBh7e4GwEUFmASKvwvyO7kut42tne1ad0reoNZ1Co9xPN/JQBbLumxTML5inXilcUNXBzCtXao1Ey3t3lALblg8AHBjvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425509; c=relaxed/simple;
	bh=v3wQM9Ejj+Iy65AhJxQ0Y+WRn5r9k4FONXp7Wx1rPK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/FYvxXu4DHF8MmL37EiKjDiZxVEZ9lbapdsS8pbgU6jm56x+0LJtxidSRajKPJg3wAjUtqi8AI13HkAfgQ4DcMIkPzZbsd7WU92o9ZNEMQsKKLSejePFQ6whvYUCfkYsetvlaxOpk65hk6z1g/YCrgbP9wRfbUOe6PimaCijes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vYKJubwu; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vYKJubwu"
Message-ID: <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743425504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewznl65RNkeccHlCjpGDXGzaa1MPhX9mGfWAWmSXFO8=;
	b=vYKJubwuym42iosd4jr5O/MhHD5ueOKYFgh/wPqbztnUySBK5jgLZ5B+0RTD1igxGvgcRE
	cZEtzs0SZJYmTMlCaPozouKcq1ksAhoEWzx/TE22DLK9N9FseBMDTU8c+k8rJpQMozHHOB
	QLXtrXEMV74i88AB88ALOdc3o/8N370=
Date: Mon, 31 Mar 2025 20:51:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Markus Elfring <Markus.Elfring@web.de>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/3/31 20:21, Markus Elfring 写道:
>> Regarding the reviewer shortage, I’d be happy to help by reviewing
>> other patches as well. Could you please share the process for becoming
>> a reviewer?
> Under which circumstances would you dare to comment information from
> other contributors?
>
> How will your development interests evolve further?
>
>
>>             What are the requirements or steps to get involved?
> You can try to improve communication skills as needed.

I don’t see how I’ve offended anyone.
         -- I was simply asking about the process to become a reviewer.
What exactly is the issue with that?
How did you interpret my message to warrant such a response?

Thanks,
Ye Liu

