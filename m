Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7A1BF37
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265957; cv=none; b=Sy4MTHWvAFomrWvaW2y1UM0Rf4agiKucFtobwHJafWFOPt130He1yTXIvGxg1CyPab8SqciEhT8CzDAOF65Mr4F4LmSfPfCf0r3xcaSucZUTCwG3Aum3xEGscmt6YzBX3eP9MO/xUJXpr7zcl7IL6XwdTjvregT60+y3CkdsQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265957; c=relaxed/simple;
	bh=GHk8Y+WJYHBXno6Zq2dTjJGVahR88buHcB//W+dfb4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVJLY5KtGeI3eHIvfY7Uae49CuBW6AntL42U0WzCcY7cf9BsMlKWOI2x1YXuQLAf6hptx2Geq4Xo5dELzAw2cbDxSCWGv4JUcgoLjQznsg0uqrA5o6Pnoz7p/UZjOPaxh5HukMBW2PNJMGy1e7/QdUtJfVtvgezpbNV38Jo1gqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=LTSqb0ts; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="LTSqb0ts"
Received: from [172.27.3.33] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A6GPNl3943272
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 23:16:27 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A6GPNl3943272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744265790;
	bh=7GWzQYcxM1qb4FyWY0v/8IQ3XCa4IBsPxSQ7EM3Uv1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LTSqb0tsliwoVoETPYTJjF2eKcAv9gnoL3saUwC9r016YvncuX9grSAJYGACSCRcB
	 dYBBQfdFgVN7quwyusn7GAFzo/LV1F0y7VPoJbmoagFK6KhycJY69kjvzKMbeMOYuv
	 4ucO783q/X6Zb7azBLLO56o2E3DZ78ZeJbJ7dR2B3bAzrd25wpc1QuJI7UF09j80/Y
	 d4eDaTrQzlpC4igx6PfGmizQanybIqjJCuhALvYeWpCPzKgOOymZfDpKE3buzHFZC0
	 PVOvSvMy43mZhNkYfFS4c3e2mDXHTrkNHtHV5KoTx1h1T77vaztePczNlCnTsRw2Iv
	 pSXyKg7Lo+nuw==
Message-ID: <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com>
Date: Wed, 9 Apr 2025 23:14:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
 <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
 <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
 <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com>
 <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/9/25 20:53, Xin Li wrote:
> On 4/9/2025 8:29 PM, H. Peter Anvin wrote:
>> On April 9, 2025 8:18:12 PM PDT, Xin Li <xin@zytor.com> wrote:
>>> A question NOT related to this patch set, the MSR write API prototype
>>> defined in struct pv_cpu_ops as:
>>>     void (*write_msr)(unsigned int msr, unsigned low, unsigned high);
>>>
>>> Will it be better to add "const" to its arguments?  I.e.,
>>>     void (*write_msr)(const u32 msr, const u32 low, const u32 high);
>>>
>>
>> No, that makes no sense (it would have absolutely no effect.)
>>
> 
> For the API definition, yes, it has no effect.
> 
> While it makes the API definition more explicit, and its implementations
> for native and Xen would be:
> 
> void {native,xen}_write_msr(const u32 msr, const u32 low, const u32 high)
> {
>      ....
> }
> 
> not worth it at all?
> 

No, and as you know, I'd like to get rid of the native_ and xen_ 
functions entirely anyway.

	-hpa

