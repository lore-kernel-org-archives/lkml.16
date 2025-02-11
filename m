Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009541C7F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235447; cv=none; b=ExbjGchykXXUjSqw0Ng4CGGwLumDNGDs7C/hkcWUJYwTShF6u0xbLURje1VHzcVsxxAfwykIYk9zycpnlxdVyjYcYE2NiDPBnBVkRN8isONEUdhHr17/t+twwDKPacpriMWLDwk88pljMAQhIwJMOCmc/5clqg8LBJj+oKN77E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235447; c=relaxed/simple;
	bh=veOa1e1fqXZolRHTxUcJhvc7wIWeVNZRLTZpkPpIRfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfmiymsB+WEU0p09iDIdo47mJUuQcQRc5XGW2Cs0qBISGOadT59ZsjSeojwO/IKywctzFCQ3B/f6YoPqZ09YFJoIKtncsjXlkDIKqZkaTLu4MOPuvmvs0C5hKfycJS9ZLXH+9cgmYbZSuPQAJMhQcesEOB8q6/dBFsHEdZESbb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MoRl5CFt; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MoRl5CFt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3RHzaXPvSSsD3tcvq+PDetqc0A0Fsw+o/kApTBGNk3M=; b=MoRl5CFtqHV4jUa8hjd3chY/xp
	Jfx9tMuScPCD9alrsCUCLsTkq9dWCA+7wr3i2EbIOurqXHNDiqmWXdFZ6MRskgGQ3YT513Qh6fCww
	TKSCtkmAuhngf77R3fQMZlvRG/jI+OFlZe2NQbXqGvnObnIFC4OldnMRqnqHD+9w4BpL/TlQdvkP8
	9SJs/rs1lhjbBqoySkMScQxlsIXQgGg9qGBt/khXCceSw+2kl8kZ9N/QBoFij6mh85ulhlmLamBqv
	QwqUtOlK1ZV+qn9XXM7DtqjevdEr+EaoXZ0MzsSNoLozk7VgvoL3Q2JbbCiKIKBcw2HKrlyfiFazh
	Q3uUYOrA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1theaJ-007VYY-Ql; Tue, 11 Feb 2025 01:57:13 +0100
Message-ID: <8ce4d887-464c-4d4d-825d-0d01dcafe400@igalia.com>
Date: Tue, 11 Feb 2025 09:57:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched_ext: Provides a sysfs 'events' to expose core event
 counters
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250210143643.220994-1-changwoo@igalia.com>
 <Z6o3WOGS5Pulha36@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z6o3WOGS5Pulha36@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thank you for the review!

On 25. 2. 11. 02:28, Tejun Heo wrote:
> Hello,
> 
> On Mon, Feb 10, 2025 at 11:36:43PM +0900, Changwoo Min wrote:
> ...
>> +#define scx_attr_event_show(buf, at, events, kind) ({				\
>> +	sysfs_emit_at(buf, at, "%40s: %16llu\n", #kind, (events)->kind);	\
>> +})
> 
> It's nice to format things in tabular forms but things under /sys lean more
> towards simpler formatting, so maybe just do "%s %16llu\n"?

Sure, I will change it to the simplest form, "%s %llu\n".

> 
>>   static struct attribute *scx_global_attrs[] = {
>>   	&scx_attr_state.attr,
>>   	&scx_attr_switch_all.attr,
>>   	&scx_attr_nr_rejected.attr,
>>   	&scx_attr_hotplug_seq.attr,
>>   	&scx_attr_enable_seq.attr,
>> +	&scx_attr_events.attr,
> 
> This probably should belong to the root/ subdir as we'd probably want to
> keep the event counter separate per scheduler instance in the
> multi-scheduler future.

I feel this is a bit contradictory to the need to access the core
event counters even after an scx scheduler is unloaded. In the
current implementation, root/ subdir appears and disappears when
an scx scheduler is loaded and unloaded.

We may change the scx_ktype to something similar to
scx_global_attr_group in order to keep root/ subdir. We then show
an empty file for root/ops when no scx scheduler is loaded while
keep the root/events file intact. I am not sure if this is what
we want.

What do you think?

Regards,
Changwoo Min
