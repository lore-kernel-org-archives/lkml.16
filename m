Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5115FD13
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910978; cv=none; b=J0AOy0aUi8Sw7UBpNM8ioNpsC+PK0i9XidC21Uru8/Jj9WDBXmRvg9wFX6VsrkwivN/cJ8dVhMnsEyeI+vsZ6TSFxpaTYqtpkPPlynh4ruSFeLvQGuajT/LO3YIsdhhnmzcVIJ4Js/PKuBtSmOcl5mp5N7eFnL9bkB4ShqUa9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910978; c=relaxed/simple;
	bh=Sj5i3eA+7EDHKM6zAxpLM+n6Y0z0oCg04XWj/RNF+QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIE5Z9lKOuG4X4nvtV79zr01AqV0zDIfys28RWenyP+3cFTP9g/L5Y6L3BTn2U9SS7bp1EzRx8WuxFG8VSGekKaL7Zsfa8jO9t18JjAYQNPB+zaTsF2ycNUMxjR5rF/+YGGlNIqnQ+w+CyGKDImIkE8muy+xNcBJn1Eyoz+4Opw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HDpG4cX0; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HDpG4cX0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y+c3RbgLLZ8Fjsx/qIA7GbI5CFeDrrguPRIE+c0Y74A=; b=HDpG4cX06h9+AslokoJp8LBsV5
	szR5PQL/b7Z2gI65QMp0uXzDpk/wnrPEA8S92vKki10SYzj1XSDKsBJefxJVLC/3pJx/cY4Qw0r0q
	YHw4wAjkJKxOUv51A1gJkxwtHMwMrUeeVBDW51br8sihTaa29Wv91TpRIkNiKTp1Gp5leLwCVDb1w
	4l1IxcqQPx6dTlpWoSQ4W31B0d+mfG2szZSWWrAhl723cYrlUHSto6f+e18kzqaagUo0QVYZ2TCkO
	3abIWcppRQkZzQ4qGSecOiCZIg4ago1Iix2zT2OpuA1fEOipSEzxW1YWQC7kbsK9gkA7oh24qmFac
	X5PCPuMg==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tgIB1-005gnq-RV; Fri, 07 Feb 2025 07:49:29 +0100
Message-ID: <7623f8e9-d598-4c0f-8f65-5cb0cf563d4e@igalia.com>
Date: Fri, 7 Feb 2025 15:49:24 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
To: Andrea Righi <arighi@nvidia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250207031338.393045-1-changwoo@igalia.com>
 <Z6WnCHiwkvahtdgR@gpd3>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z6WnCHiwkvahtdgR@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 2. 7. 15:24, Andrea Righi wrote:
> Hi,
> 
> On Fri, Feb 07, 2025 at 12:13:36PM +0900, Changwoo Min wrote:
>> This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
>> two scx schedulers -- scx_qmap and scx_central -- to print out the new
>> event.
>>
>> SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
>> to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
>> and pick_next paths.
>>
>> Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
>> of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
>> Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
>> scheduler bugs, causing latency spikes.
> 
> Not directly related to this patch set, but as a general thought: would it
> be useful to introduce ops->slice_ms (in sched_ext_ops) to override
> SCX_SLICE_DFL?
> 
> With that, schedulers that care about latency could set a smaller default
> time slice to prevent potential spikes caused by the implicit use of
> SCX_SLICE_DFL.
> 
> Opinions?

That sounds like a good idea!

Regards,
Changwoo Min
