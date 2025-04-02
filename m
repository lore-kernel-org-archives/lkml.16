Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA831B7F4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743562300; cv=none; b=GNy+0Z9tsp3F6BbzJXzCb5P7cXHt8WRtUrUtZoFGFypulvQE4uc9l/7sdT4OlbO8F8/aXm/QelP/yL4rKmeeoIGVkt3gpZyMNoCL3YSMx9ojVKDocOk4Bfj7Xu07W8LYK63WYWRjRr/uVmDrwMkw8o9/E7ZD806NEEkyrqwXiYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743562300; c=relaxed/simple;
	bh=ta+eXbSaKG0wTOb+JB+MwFT7rjeZQeN7XJaR4QVQztQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwA3/r+H+m20RzTJxnt8DmQ8zcTsobrJsEQqsao41ly0up2gMAqzaB/Gc2DVtBznbhQHKSbutJfrSs1EnHAXaXIU8L36WCgPDfnkW2T4V+9Eh4aY0BDvHSR4mkkf9djBd7VvfPcB4cxXut6YrVwrgjzJKO9Bs+7kTzH9GCXym7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m/MX+W2U; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m/MX+W2U"
Message-ID: <1eb14874-4902-4894-bb60-fe96a92ce9fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743562295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J2px99wbwE8spqn5oqU52qKC2FDVajZKIg7CpT3lGR4=;
	b=m/MX+W2U2I/8rbpRMO4hG7sENND7jx2+G5OIP7Nh/rSEsJ36G4j0VEKPeMF8Tv98+2vLlR
	RuPbx1oMeeujByIhwD8o23g1H+7zoNr2zEqoB/RUxtAeDwWzK/Kv9NLxJA2YDMmuOkSj4R
	U1X9fQqlciXzueni/BtKdQHTpLraW/A=
Date: Wed, 2 Apr 2025 10:51:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Matthew Wilcox <willy@infradead.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
 <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>
 <Z-q6iOSTzb5wibEW@casper.infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <Z-q6iOSTzb5wibEW@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/3/31 23:53, Matthew Wilcox 写道:
> On Mon, Mar 31, 2025 at 08:51:28PM +0800, Ye Liu wrote:
>> 在 2025/3/31 20:21, Markus Elfring 写道:
>>>> Regarding the reviewer shortage, I’d be happy to help by reviewing
>>>> other patches as well. Could you please share the process for becoming
>>>> a reviewer?
>>> Under which circumstances would you dare to comment information from
>>> other contributors?
>>>
>>> How will your development interests evolve further?
>>>
>>>
>>>>             What are the requirements or steps to get involved?
>>> You can try to improve communication skills as needed.
>> I don’t see how I’ve offended anyone.
> Just to be clear, you should ignore Markus.  Don't reply to any of his
> emails, and ignore the suggestions he makes.  That's what the rest of
> us do.  He's been told many times that the way he interacts with people
> is inappropriate, but he persists, and there's little we can do about it.
Thanks for the reminder.
