Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B7FA23
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 03:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738984669; cv=none; b=HHcoKmQxTxIzYJvCDQLvGohlOE47Os5YRWh/Pn83Wik69yJrlynJrZ4Qhma6xh/YCgIqOeD3GnKmEtEc9wr2NSYIDZwe4AgYku9jyoxtXUyPd9HG8EDy5xZgwHrJs1nDet6c+MFBg9Iy4myxawwWzQWUnYULUYBQ600uqUxv5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738984669; c=relaxed/simple;
	bh=/UPr5zPx5T4FSgK65mwgjPcgywZ4qh8s3ZC4e1gvk/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4QPQ1u0AtJVfm121XhHiEOiSmHv8PYGP34hiwzML7x9ra4CYShzxBF//eS0t7QJwCFRP/mDza/8mCCZAhvqazM0C17bzqIJ7NUtM7cOJSRCqn4ddvc6IHj9eeARPY9nkO2YQKLbYU8kcWLoSRw/wPhwbH3MlP5ch7LC8adTZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OcRAQPve; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OcRAQPve"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JelDmvVCl54XiASmEJAB3CTSP86k4kOSQrqZHzkfw2g=; b=OcRAQPve0gXqkJK5PYQZiAOl2q
	Y7mTExz2R44OC0LXKvrNWJmeox+vs+C24b3O4CwQ8Q02E+Pwe1Mbc2t1vfkUHgbuCbbgqz/7pT5pE
	c8amTn/hmICzhW/pehfI3Ju4axJEc6mnB+aJ+OtfqXrCLJYwxHOOrYOQRwtO7CO4FGVnuWIQPxX+3
	AjDG5oHgYur54cUFJ08nYvqyf1kdqfLRL/NaCOzGlEi480RwApxpSUMFtgt7r7WuuKZAGFeZfHh8T
	GhLXeu9RmSUC+cXzlfnyJ1YGoXIz9sj8VDZyKRYaYWDN/UZW9rwhN281t9GZ37wxCk5qttdv+JCXo
	aq4ptcmw==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tgbLQ-006Eux-QL; Sat, 08 Feb 2025 04:17:31 +0100
Message-ID: <aedaba97-08a4-47bd-bb0d-7192dc2a91a5@igalia.com>
Date: Sat, 8 Feb 2025 12:17:26 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250207031338.393045-1-changwoo@igalia.com>
 <Z6WnCHiwkvahtdgR@gpd3> <Z6Z9V7GgZxpFlp10@slm.duckdns.org>
 <Z6Z_CNBMp5greLf4@gpd3>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z6Z_CNBMp5greLf4@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun and Andrea,

On 25. 2. 8. 06:45, Andrea Righi wrote:
> On Fri, Feb 07, 2025 at 11:38:31AM -1000, Tejun Heo wrote:
>> I'm not sure. BPF schedulers should be able to avoid getting the default
>> slice. Hopefully, with the added visibility, this should be easier now. I'm
>> not sure how much overriding the default value in ops helps in terms of
>> control. It's a very half-way measure. Instead, how about we add tracepoint
>> to scx_add_event() so that folks who want to get backtrace of specific
>> events can get them easily so that it's easier to debug where these counts
>> are coming from? Let's just make it easier to avoid these events.
> 
> Yeah, that's a valid point, the implicit SCX_SLICE_DFL should be seen as a
> countermeasure for unhandled situations. Instead of fixing the
> countermeasure itself we should try to prevent it, if it proves to be
> problematic. And I like the idea of having a way to backtrace specific
> events.

I agree that adding a tracepoint to scx_add_event() and 
__scx_add_event() is a defenitely useful extension to further 
investigate what's going on. I will take a look.

Regards,
Changwoo Min
