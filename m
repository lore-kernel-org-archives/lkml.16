Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631611F4168
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749076978; cv=none; b=s2jjOGkPKEpOo/aeK3MVe/VoGTd6z4KY4+um9Oon265RJrTIChrQVsfmrBWDIYOeL8LUKYY+pPGOs5AdBm1kio5dM9JHCzEZGziwiGUwATw/axUSNek4+65Q+cZu8xdnIUIPIbSNAy39Mm8//ixeJdY9tdhETd1zJ//HAoZd26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749076978; c=relaxed/simple;
	bh=rMVLIYUJTZMmmv1LowNwLpFsZ0PErqcNHIAoZznFWH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+0BxNTo02zuwHLIgPG5wEV8MRlimPMbWvkW4z91CmA3Xcv4Ccp9wv1dhTXXLYnY9KBovQcoz33RU4C3dnpIaWXHG++YrvLSRAaI6FD4ACKi2+2hEGPX8N5rCrRujpQBNooor0fjjWHRvCX8CExmpQ5e6SuVnKlBYFQS3ItMcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=l8OmQlrs; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="l8OmQlrs"
Received: from [IPV6:2601:646:8081:9482:7a24:4997:8aee:1bc9] ([IPv6:2601:646:8081:9482:7a24:4997:8aee:1bc9])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 554MgVF0207604
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Jun 2025 15:42:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 554MgVF0207604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1749076952;
	bh=Pmweby9BKnrTj3+/yRYtoyGaSnJqLt75ZCHvxakfouI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8OmQlrsjgIV/bVT21nEmNTN3wUm76mz2yS6qPMflK/GhAPu3R3iAzf+fcC5Z7od6
	 /XxchwvgQ0u016entEOXR2bTesvQ/HokONubuQKhexwfH8sJPal0YGu11Iw+IoYqrq
	 kQLXcBwW1OanWAhfKLWH3h1+FwKhYrL2qQZOF9M6lpmG+6qrm12EBWaEAgW3DQTlZS
	 Q9QhAD7U1deCHQjbPJGQF+qvb/ifNS83h3Ux6mqzJ6xik5BofFpRk8HKTkrwNIjyi/
	 kuupr95B5ok4kOGYKpx2O71bvhVULroIm3ey+HzILxSrp0NrGeLPBRmj39/y57TtyK
	 yEnHprm19RgxQ==
Message-ID: <69118db9-4394-4c65-b53a-084dca917f14@zytor.com>
Date: Wed, 4 Jun 2025 15:42:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kerrnel/FPU: clear MP bit of cr0
To: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <20250526082414.689-1-khaliidcaliy@gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250526082414.689-1-khaliidcaliy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-26 01:22, Khalid Ali wrote:
> From: Khalid Ali <khaliidcaliy@gmail.com>
> 
> Clear MP bit when initializing x87 FPU, since what it does
> is making WAIT/FWAIT instructions to react to setting of TS flag.
> Right now TS bit is cleared so MP should be cleared, as it is not
> needed. This should set the bit in defined state.
> 
> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>

Note also that we DO initialize all bits of CR0 elsewhere in the code 
(head_32.S and head_64.S) to:

#define CR0_STATE       (X86_CR0_PE | X86_CR0_MP | X86_CR0_ET | \
                          X86_CR0_NE | X86_CR0_WP | X86_CR0_AM | \
                          X86_CR0_PG)

So it is currently defined; this patch would actually *introduce* a bug.

It is a bit confusing to have the bits initialized in different places, 
so I would agree with setting it explicitly, even if it is redundant.

	-hpa

