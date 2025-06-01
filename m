Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C32DCBFA
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748761092; cv=none; b=lnt2WorJYkMO0CBk2MCrlm8Z7SkTtrfVPH/R1lvRVxJLrDM96mioINMJQG8ajjhLBhiraqqnWarDjHl6ZZTPG5WzHNdK1JrlhUwZMO1JWAKUaEKXrsc7Vd7dpjpMAcMlRNjs+VcU220dP4J2b5OLLfbS5IZt5qkHAk+6r1qPMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748761092; c=relaxed/simple;
	bh=eSUi6mmwtriXuiK98d3JawAKXWxnhpANAYkppm1QY7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjAodoOz1CwP/M/t6XJKHYqAVTuQoe+VtYfTt6tvSVfKy0t3fm5lNHcj35zmbBhYcQ5ryahHZWZrHTNAlYzYv19D4K0h61rsUbRDabAATOyvkPTYv4oixCoKvbZGj9aj3c9knEuBHxvTIB5ivlV/+8NlE0906SFzhTixXuPON3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wg4BCu68; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wg4BCu68"
Message-ID: <44c3a765-4300-44c8-a3fb-eef8f4b7c39f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748761084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYg4W8sQIGZJe7GW8WiUziY9FirriCAkkpB+aVxZCdk=;
	b=Wg4BCu6828ffzhpti/R5N1sjQ2d8nk63y1px0GVrXVbFRmFa4AzELhRagJRLEOKacDEySI
	QXjR1+2EdttnBcyctmxQSiYFvvLrGzOQL3e1BmwHVxu6kc7/XGL4ycQkFcTachYzZIIpKU
	8hClrSUc5s0Fg0mbGAPo5tE80dwIi5w=
Date: Sun, 1 Jun 2025 14:57:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 1/3] bpf: Add cookie to raw_tp bpf_link_info
To: Jiri Olsa <olsajiri@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, qmo@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250529165759.2536245-1-chen.dylane@linux.dev>
 <aDq-F9nK4K74ubjo@krava>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Chen <chen.dylane@linux.dev>
In-Reply-To: <aDq-F9nK4K74ubjo@krava>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/5/31 16:30, Jiri Olsa 写道:
> On Fri, May 30, 2025 at 12:57:57AM +0800, Tao Chen wrote:
>> After commit 68ca5d4eebb8 ("bpf: support BPF cookie in raw tracepoint
>> (raw_tp, tp_btf) programs"), we can show the cookie in bpf_link_info
>> like kprobe etc.
>>
>> Signed-off-by: Tao Chen <chen.dylane@linux.dev>
>> ---
>>   include/uapi/linux/bpf.h       | 1 +
>>   kernel/bpf/syscall.c           | 1 +
>>   tools/include/uapi/linux/bpf.h | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 07ee73cdf9..7d0ad5c2b6 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -6644,6 +6644,7 @@ struct bpf_link_info {
>>   		struct {
>>   			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
>>   			__u32 tp_name_len;     /* in/out: tp_name buffer len */
> 
> there's hole now in here, let's add something like
> 
>    __u32 reserved;
> 

Sounds good, i will add it in v2, thanks.

> jirka
> 
> 
>> +			__u64 cookie;
>>   		} raw_tracepoint;
>>   		struct {
>>   			__u32 attach_type;
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index 9794446bc8..1c3dbe44ac 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -3687,6 +3687,7 @@ static int bpf_raw_tp_link_fill_link_info(const struct bpf_link *link,
>>   		return -EINVAL;
>>   
>>   	info->raw_tracepoint.tp_name_len = tp_len + 1;
>> +	info->raw_tracepoint.cookie = raw_tp_link->cookie;
>>   
>>   	if (!ubuf)
>>   		return 0;
>> diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
>> index 07ee73cdf9..7d0ad5c2b6 100644
>> --- a/tools/include/uapi/linux/bpf.h
>> +++ b/tools/include/uapi/linux/bpf.h
>> @@ -6644,6 +6644,7 @@ struct bpf_link_info {
>>   		struct {
>>   			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
>>   			__u32 tp_name_len;     /* in/out: tp_name buffer len */
>> +			__u64 cookie;
>>   		} raw_tracepoint;
>>   		struct {
>>   			__u32 attach_type;
>> -- 
>> 2.43.0
>>


-- 
Best Regards
Tao Chen
