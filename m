Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6C1C861F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687209; cv=none; b=qd7bp39rYdmqqj6tSJn8zWw8bCKGkcE7CdNovo7LBqWEZ0Inw5sknuHIgiRBcy0PACR0UvnRkkxo5M5o5cURcb1NWMz+sD/VD5y78wfV3G3UjOCXOAzE4OpVgrGS9M26shg0Dv0YSmARAlsc4KgdSWw0n+U4EUwnjMaXmBoemJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687209; c=relaxed/simple;
	bh=Stf4GBlAENrbX62tTgzgbry1kGHvlfGiAZfmAAHsTw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnFuthXfeykRA6otfU1dydtarRPnAqe6G8NPPyAZ5zNP8mG5W3PEjXViVj62+99P4g2mSnk4qVUHiccsZUjtS5Vj9sUhK59uKixd8r6wMYhL5CQZEFnxI4J63mdmvGS2yxEsyt8EylkwnaJooCtSGYZ4UOog2LSrFCA07nc8lZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X0g9gYuU; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X0g9gYuU"
Message-ID: <f845e90c-50ff-4e0f-9b73-55a704ba934f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743687194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZZb/gFwlvAyeQdhrFBMQJGozN69evNRZkpQ70NB8go=;
	b=X0g9gYuUWXhqaBGqe2Ml5tjAIfLCZLssn5d1/ph4SSR8JC6znA+6tYTQoUUHxBWP2I5TTV
	i+x5OmIW7Ae/c3q76GRVGMXb7bH9bHV8gt+6puvHCWaBUkTSpC5hju+RWpVvU5U+wWsP1G
	64pSTIK/0ogJCQvnP6OmJnYACt6lhEo=
Date: Thu, 3 Apr 2025 15:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] RDMA/rxe: Fix null pointer dereference in ODP MR check
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zyjzyj2000@gmail.com" <zyjzyj2000@gmail.com>, "jgg@ziepe.ca"
 <jgg@ziepe.ca>, "leon@kernel.org" <leon@kernel.org>,
 "Daisuke Matsuda (Fujitsu)" <matsuda-daisuke@fujitsu.com>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20250402032657.1762800-1-lizhijian@fujitsu.com>
 <a0eb561e-9fa9-46ab-bb0a-6e68a8e0d834@linux.dev>
 <20551f6e-df87-460b-9927-70c93b8d6149@fujitsu.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20551f6e-df87-460b-9927-70c93b8d6149@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/4/3 4:59, Zhijian Li (Fujitsu) 写道:
> 
> 
> On 02/04/2025 16:58, Zhu Yanjun wrote:
>>
>> Previously I once discussed with Bob Pearson about the function names.
> 
> This is a frequently raised question, yet I have not discovered a definitive
> coding style(Please let me know if you have). According to my understanding,
> the common practice I adhere to is as follows:
> 

You have your own principals. In the linux rdma maillist, there is no 
such common principals. From the debug perspective, it is better to add 
rxe_ prefix to make debuf life easier. But if you follow your advice to 
choose not to add rxe_ prefix, it is also OK. After all, no such 
principals exist currently.

Zhu Yanjun

> - Functions utilized within a single file often do not require a prefix, as current situation.
> - If a function is to be used across multiple files, I believe a prefix is essential.
> 
> Thanks
> Zhijian
> 
>> Perhaps it is better to rename is_odp_mr to rxe_is_odp_mr?
>>
>> Since sometimes we debug in rdma, with a lot of functions with the same name, it is difficult to recognize the modules that this function belongs to.
>>
>> Thus, in rxe module, it is better to add rxe_ prefix to the function name. But anyway, this commit is fine.

