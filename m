Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D94BA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267008; cv=none; b=W/VsJW8k0Y7JhNJUQGjp4HpJ+qyApBJRBzZM8BYA7N8E7lq2c2F2nnMHp3CpPmQSmP9fcwQVjoj/cy2x1e0b7fIRwLy2mUGVAXbJEQ3zShBd/+QSUrlw/tY+CzUWNRAyobZ5eCr4i0ILfR4+d1EhkpU6zYVWpgyM3YBaytXvbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267008; c=relaxed/simple;
	bh=cVFMe9EJOQ/jsxGOAibcp5pr1WqAIaq/WZ7Vsy1s990=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plonVU3oL6QR8Fo0kzf+/peDiLyHYu0vKwh19DV9anzsH45TS3HK1kSL4Gjkq53AMM0IhOpoZeiLpD67vtzZIpOG0NCjz86d1z6w+mv2SxlaM9KVotvgc10NJJwvZxgPSeL0ShjzxFfQOwtyiAWlsHjRFDuE7824htCZZgwnZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=BP5iEXql; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="BP5iEXql"
Received: from [IPV6:2601:646:8081:1f94:184:3e0a:4d92:bac1] ([IPv6:2601:646:8081:1f94:184:3e0a:4d92:bac1])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A6aJUn3951143
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 23:36:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A6aJUn3951143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744266981;
	bh=qzSIi0KMoNDMBCSOLRZ0wFG1sfzdjBGaWQgbClKobKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BP5iEXqlA0c32WPRsPIBpnhx8sr0IurZKlCZ55tFUcYcTWzuWPncjhWADeRsbg3c2
	 dbbxbJ9g/0gc9SsDygwPbtAqrqy7egTxZB/ewSwp5TNuCdDnAbsoY3FQb1dh0hIN8l
	 cd8jv5y4Bz6RDYhaKZViNfbKGDsAnGNZe7/Ag4IcIu9UHukNmj7ME4UJxXQh8V4X0V
	 3KANXYInlZH7+17HnRqzzTMK6K9S9ZFp7kaDGTChGRCfN9jsC8VDVoM3czw0LfXLLH
	 HigA2xNcYMYKgl7ZZGRLkIDn7mFbOUqk0KocrM3McdyJSBKWfzaVWLqUezz67/psbZ
	 mJqcGQ9VsBT+A==
Message-ID: <854c8d02-4755-4e54-a699-44f4da672572@zytor.com>
Date: Wed, 9 Apr 2025 23:36:14 -0700
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
 <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com>
 <5e7cc9d1-c2fb-4657-bd35-f471c78daaea@zytor.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <5e7cc9d1-c2fb-4657-bd35-f471c78daaea@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 23:34, Xin Li wrote:
> On 4/9/2025 11:14 PM, H. Peter Anvin wrote:
>>
>> No, and as you know, I'd like to get rid of the native_ and xen_ 
>> functions entirely anyway.
> 
> Yes, the change is in the RFC patch set I sent out earlier :)

Another reason not to try to micro-optimize it right now.

	-hpa

