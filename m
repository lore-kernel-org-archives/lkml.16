Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CACB29A9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749177103; cv=none; b=Kk96F8qd4HUyoBPVdFC9tA399L5KA8iasCSNA00+gcwxwo8OZL44+wvMWnJs23fQ8pcIjHfEjwdy0h1VKbePfQfzbbIMi/JHiB2dzcz56FHRlHmvKMHEyf4jxa8G5xLUqEgaKglpv9FPGYUdLjQyp1JWN+ltJACr9tAxYrQbQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749177103; c=relaxed/simple;
	bh=NHbJRMovU5g1h1phG6fHk9x/84oGG3tK+HK1g+xz/uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yzw+mvYl3ED1d+U0Tc4QwYreeEnUdonedJx1n7RDB16vngJ8onxGgeUtvhxwS4Le0tQuIaHHrlKRxEEqFZJWjjWIeuA6KEh3+FZjS5GyPuBDMypepd9+1aLzZLURKjU7APXc87dfFBAEeaPOe8eEXFKiV87hN5EWFCe1puVBYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w+6KgyMH; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w+6KgyMH"
Message-ID: <29d26dea-a0c1-4b1d-adf5-6161c4b16c0d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749177088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aaVf2/WsdO7AkFVReBhXK3K/lsQylWvH/nAD0ji5RbE=;
	b=w+6KgyMHLmbfykr6belYApv97m3vg6x8PktJwYUoVSdbsyV7dxs71UUiGd69gjYyFL4bCp
	LgV09goKUHkelW7RmTjxjysj/rZMTMGMxRzqk7DKfCufLfSPLE74mZBZauIq2BCekkUnRA
	XFneJ4rzQAQ/ehA7V+FmXNGb27dWspk=
Date: Fri, 6 Jun 2025 10:31:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] bpf: Add show_fdinfo for perf_event
To: Jiri Olsa <olsajiri@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250604163723.3175258-1-chen.dylane@linux.dev>
 <aEIR8SBXrV9PgQ0L@krava>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Chen <chen.dylane@linux.dev>
In-Reply-To: <aEIR8SBXrV9PgQ0L@krava>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/6/6 05:53, Jiri Olsa 写道:
> On Thu, Jun 05, 2025 at 12:37:22AM +0800, Tao Chen wrote:
> 
> SNIP
> 
>> +static void bpf_perf_link_fdinfo_uprobe(const struct perf_event *event,
>> +					struct seq_file *seq)
>> +{
>> +	const char *name;
>> +	int err;
>> +	u32 prog_id, type;
>> +	u64 offset, addr;
>> +	unsigned long missed;
>> +
>> +	err = bpf_get_perf_event_info(event, &prog_id, &type, &name,
>> +				      &offset, &addr, &missed);
> 
> hi,
> addr now gets ref_ctr_offset:
>    823153334042 bpf: Add support to retrieve ref_ctr_offset for uprobe perf link
> 
> so let's display that
> 

will add it in v2, thanks.

> thanks,
> jirka
> 
> 
> 
>> +	if (err)
>> +		return;
>> +
>> +	if (type == BPF_FD_TYPE_URETPROBE)
>> +		type = BPF_PERF_EVENT_URETPROBE;
>> +	else
>> +		type = BPF_PERF_EVENT_UPROBE;
>> +
>> +	seq_printf(seq,
>> +		   "name:\t%s\n"
>> +		   "offset:\t%llu\n"
>> +		   "event_type:\t%u\n"
>> +		   "cookie:\t%llu\n",
>> +		   name, offset, type, event->bpf_cookie);
>> +
>> +}
>>   #endif
>>   
> 
> SNIP


-- 
Best Regards
Tao Chen
