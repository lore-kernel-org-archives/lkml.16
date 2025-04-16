Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D618C32C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825041; cv=none; b=LK/VokFqzg5O2FPcBMR/GNb8046thooJGnEXneaYtZWWqTm4/0XXTyYxlHMk6E/h0sphuhXHhlTLxuuwh0hMYOSc3vIt71cOBP/tim8Ur5NyUXQjaxZEPmxv7C4McpLLfVUWkdzrPSByjg3dBtDYDDmVyAjjZMvOqZoudWL+OMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825041; c=relaxed/simple;
	bh=LiA4Ew9/bslUQ0woQN9yhgqfWbuYxHGY2sxaYeyT8GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn7bPwfe4Bk/i3X/qjdntkcIcStyDTZ+Dq3F31gqh11U/X0hFeX4eyIfp9YYNTHi30ntMp4pJ5HsfjXIgdi9GlCZJvUMqgapIbCZOpHjHcV5HeuYoa4iY7PnYoF1gl/K/5x5yT9J2u4RRY3g5eiYKD6enIbGBTgEl2bV5vDdJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1uQgUBD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1uQgUBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744825040; x=1776361040;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LiA4Ew9/bslUQ0woQN9yhgqfWbuYxHGY2sxaYeyT8GU=;
  b=n1uQgUBDGiyOXi6D+aA5c+gQ3gjkdcOxAKuufUPpgkmrYasy0idJWzN7
   xhcbrUc+tkjDcEUxYZB3Gun+jAzwtJtQdlPXVozv1XUZvNUW+0jbVVj8q
   Hv7gQNQeb8MTpQAzOBlMW8LlRG1FmQQ2y8eb6xdioPtHWvEHBUBRWiRU2
   To1jLMm2L1IeL4HD2tZe7HbmfCaZaIZDmlJhDU+I8p+iolb/V2iSI2L2b
   FKHKIH02WYngdVUcIKXdyyhE+KziTSEcJNojmJNdFaEHaBmYokm/NJC+J
   ri0Eb5O2AVnwnmzozpJVIMML6cERItqnmwvn5cZjUFvnFgLxmzSr6pltG
   w==;
X-CSE-ConnectionGUID: IjwehowNRPqAT+siKnHLUA==
X-CSE-MsgGUID: BZ7qtOqeQv+FaqZkG53uww==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57051927"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57051927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:37:17 -0700
X-CSE-ConnectionGUID: RMTCV4fjS/m5+n+uLolu6Q==
X-CSE-MsgGUID: 5gbTEe3UR8eldM3FeRy2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131105676"
Received: from spandruv-desk2.amr.corp.intel.com (HELO [10.124.223.6]) ([10.124.223.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:37:16 -0700
Message-ID: <d30ab1d0-e09d-41ba-b98d-9b7d039f6d80@intel.com>
Date: Wed, 16 Apr 2025 10:37:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/microcode/intel: Support mailbox transfer
To: "Chang S. Bae" <chang.seok.bae@intel.com>, Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 colinmitchell@google.com
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
 <20250409232713.4536-6-chang.seok.bae@intel.com> <Z/+7O6pYQ8FkD+Xj@intel.com>
 <166b29f2-a178-4d60-8f5d-218bfd7b51ac@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <166b29f2-a178-4d60-8f5d-218bfd7b51ac@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/16/25 10:22, Chang S. Bae wrote:
> On 4/16/2025 7:14 AM, Chao Gao wrote:
>>> +/*
>>> + * Wait for the hardware to complete a transaction.
>>> + * Return true on success, false on failure.
>>> + */
>>> +static bool wait_for_transaction(struct staging_state *ss)
>>> +{
>>> +    u32 timeout, status;
>>> +
>>> +    /* Allow time for hardware to complete the operation: */
>>> +    for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
>>> +        msleep(1);
>>> +
>>> +        status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
>>> +        /* Break out early if the hardware is ready: */
>>> +        if (status & MASK_MBOX_STATUS_READY)
>>> +            break;
>>
>> Shouldn't we exit the loop if the MASK_MBOX_STATUS_ERROR is set, or is
>> the
>> ERROR bit always set in conjunction with the READY bit?
>>
>>> +    }
>>> +
>>> +    status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
>>
>> I still think this read is not needed.
> 
> No, if it times out, it could exit without having read the status.

Can it? There are only two ways out of the loop: the explicit break and
the implicit break from the 'timeout' check. Both happen at the "end" of
the loop, unless the timeout< check failed up front:

	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++){
		msleep(1);
		status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
		if (status & MASK_MBOX_STATUS_READY)
			break;
	}

> But this is a slow path — instead of trying to save a few cycles, I
> wanted to present the logic more clearly:
> 
>   * Give the hardware enough time, but not forever.
>     * Oh, we don't need to wait anymore if it's done
> 
>   * After waiting, check the status and handle it properly.
> 
> Isn’t it clearer to read the status after the wait, right before the
> error handling?

It's simpler to read the code the way you have it. You don't have to
consider if 'status' could be uninitialized. It makes the "timeout loop"
*COMPLETELY* independent from the rest of the function. It could be:

foo()
{
	spin_until_ready();

	status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);

	...
}

for example.

It's less likely to break, too. Let's say someone added a new break:

	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++){
+		if (some_other_condition());
+			break;
		msleep(1);
		status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
		if (status & MASK_MBOX_STATUS_READY)
			break;
	}

you'd have a bug on your hands.

I'm fine with the way you have it. I probably would have written it that
way too.
