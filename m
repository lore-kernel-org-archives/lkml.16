Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B51191489
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738217549; cv=none; b=dVkAR4MVv2W/5imyrXUKcgtfWi9J7+9UwS6LU9gZfXKveX/JU/Gb80fykBB36qtbj2Wi5AlPFqd6R1ycFCdhcV7wp4I1t+4XMs0CpLKTpgN7uCXwajA4myF9MLV8kFOM9xXQ8/BCiutH/cJV0w1mSg1CXrVSqq6sEaWXkkGHFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738217549; c=relaxed/simple;
	bh=7hogliHIaZyboz334GF4PXbYbt9e6tqrRBfBhNzz+vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itDeuNVfM7R3GzWpryLFM1UKYEe7T1nXFK3Bm792rycp+i7CE4J7Da2kvJAkGULr6lZOQqxCPrSxzUVnTuoZFtRraQVdxOqSD3aAusdNT4CjIXM9z8j28GyDK86qI/xy9hPbixh6A/7Wttl4IljAeW5Ks2AqtGe2qhKn1KZA0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ikhsCXu/; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ikhsCXu/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZoPX129TWGdSX0XxGVJPzDaAhkhtua/lGPD2fp1O8Os=; b=ikhsCXu/jx2gAWrfGHLNoMP/Ki
	pY0jiK31tjgzDqBz45yqHANDEUSc3sum7twMiN/mYTHYjyQ+I8T/IXQG7/wxBgdc8Cr9De9VZd78p
	171MHsVaSt3MgNUL5oGSnhpVaegtqeU3yBeIgYpKkfI1SFNt4EVbCE+GBGDmBk337pbnCfrEWH3vt
	D0QSyjisMFt+HB1GIiLB38qOssK9D4xZhwt3oYoDigHuTXiDxunN/xn3tk9yXJXglEUJJjgtPEh4r
	u7d/y8y81UHg/IGpZh3OnOghyXGToJA7s+TnL9RzGU0FbeLAotwATQt6MZ6Q9ND7eMs20i/SqeTZn
	rdENQd7g==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdNmd-000uhc-Ky; Thu, 30 Jan 2025 07:12:18 +0100
Message-ID: <0f9a7c78-9ecb-47c5-a8b0-91a35f3b248e@igalia.com>
Date: Thu, 30 Jan 2025 15:12:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] sched_ext: Implement event counter
 infrastructure
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-2-changwoo@igalia.com>
 <Z5foALskUB5OVMH6@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5foALskUB5OVMH6@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:09, Tejun Heo wrote:
> Hello,
> 
> On Sun, Jan 26, 2025 at 07:16:04PM +0900, Changwoo Min wrote:
> ...
>> +/*
>> + * scx_bpf_event_stats - Get a system-wide event counter to
>> + * @events: output buffer from a BPF program
>> + * @events__sz: @events len, must end in '__sz'' for the verifier
>> + */
>> +__bpf_kfunc void scx_bpf_event_stats(struct scx_event_stats *events,
>> +				     size_t events__sz)
> 
> scx_bpf_events()?

That sounds simpler. I will change it in the next version.

Regards,
Changwoo Min
