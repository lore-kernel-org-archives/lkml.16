Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5617BA2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738286014; cv=none; b=dRl2JXpI1QndZ2znjqHiszhkB3jV7GHVzYqj3qeNLiRmObkrYQf/0IzsRXE+Gqrd/86XAUnPoJMPjb4T2F5HBVUIpwuUIK2i6rZa8BbK9ukiEOJk/NUmsiaYqzFBssTp4fe73C6tYNZHlsqpC8/j8mqr6UHJUr/TIS/sIbsuSoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738286014; c=relaxed/simple;
	bh=S8OGgHDwsq35MAaXhc4puKcVaxk49WcBoSkGhDXe0u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMhLoSBLjTcUSBZ/XYTi5etapT++FaaWyBpJD3KBVhVpMlVsXD18gJIjqoO9uWH7+kX/tMO8vVMRJQotKBWpq9yVpalRdCCpAIPcucf8pZApZhWs6hKzrxhUoqePRoZXYDLRPNKk4LrPXVQAYiGu2XxbEJ1aueMVMGMXhapDNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=SR2akEJ5; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="SR2akEJ5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=njDymEON+c0O08qFkWnMWQL3J7Snc0UKRTNc9apn8UM=; b=SR2akEJ5w86B5iX6snWKQFn5Vi
	QJdyYCPddgL/p7uQMo1nAlFT+E8Incigx/Axq9OyOd3nlilDkMIR3dfTr2104cWThmyVSzMeY3yOE
	cRBLnnQpNQdjb0TuA/HrhE8LzE+kDBZqdHsQtscFQyEqz14qREhQUIThmzy4w3vv+3ddqvpE7yNqh
	E189zkjglsA7e4CUWqwvay9evRytSR2DmUuO2ZTP70Uov46Mj0RctL+lbs8OaGLwu03c32aVIL/dD
	33qFXja8oM2TfcsCMuC8+WbabQLAyQnckZjecHBKaOmzRmJfW28CImuzBgcjjmDdhpaXN9Wzh44T6
	Bnj9n4MQ==;
Received: from [106.101.137.64] (helo=[192.168.211.21])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdfav-001FlA-38; Fri, 31 Jan 2025 02:13:23 +0100
Message-ID: <4ac7b05f-fabc-4ae0-abe0-fff53a10acf3@igalia.com>
Date: Fri, 31 Jan 2025 10:13:16 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] sched_ext: Add an event, BYPASS_DISPATCH
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-9-changwoo@igalia.com>
 <Z5fm-ylLemMG-YiQ@slm.duckdns.org>
 <1b3cd342-ddcb-4d53-a0bc-07e4ecc2973b@igalia.com>
 <Z5tvnjpNeuFZzdwy@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5tvnjpNeuFZzdwy@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 30. 21:25, Tejun Heo wrote:
> On Thu, Jan 30, 2025 at 03:26:16PM +0900, Changwoo Min wrote:
>> Hello,
>>
>> On 25. 1. 28. 05:05, Tejun Heo wrote:
>>> On Sun, Jan 26, 2025 at 07:16:11PM +0900, Changwoo Min wrote:
>>> ...
>>>>    has_tasks:
>>>> +	if (scx_rq_bypassing(rq))
>>>> +		__scx_add_event(BYPASS_DISPATCH, 1);
>>>
>>> Can we do this at the sources even if that's a bit more code?
>>
>> Sure. I will remove scx_add_event() and __scx_add_event() and will use
>> this_cpu_add() and __this_cpu_add() directly.
> 
> Oh, that's not what I meant. I meant that in the code quoted above, the stat
> is being incremented in a spot where most code paths converge and then the
> specific stat condition is being tested again. It'd be better to update the
> stat where the condition is detected initially.

Aha, I got it. Thanks for the clarification.

Regards,
Changwoo Min
