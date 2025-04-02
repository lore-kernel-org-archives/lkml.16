Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA49186287
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614053; cv=none; b=SSZwV19MM6UGRfS2PqW4MWeGkeXwEIpaPWXIA2FL3UC2uQ06kEjaU+eMSbHqsl8MkCTxQ5hj/Wf4RXXaZlvMgbg/pjIv4I22atZ74nSMdodFdwrwZ8LMuQKkxZFrSwcnTPVGz1SrGOf9umKYzZbRLQSJdiuREQjhTgYyooiocR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614053; c=relaxed/simple;
	bh=WuHN/piHcY7kYULbd2Y1notYfHLl9mGaf7tFXMISNt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy4D2cC9cbEUrYhBMp7NNGLnZvAZNy+LQeXRFDb21T+a61pr2ws29Zb6TBp3PXaLrE3gDSc6wvPQSV1ppwaK3ZKNm2FpoBtL36Nx4xp8h/Zo4UJg623xO+U45ovnlpOvUispN95wWIktF4vY/3atZ4vZC8NHZwpviLbTBgYbX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdF+MCkp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdF+MCkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743614052; x=1775150052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WuHN/piHcY7kYULbd2Y1notYfHLl9mGaf7tFXMISNt8=;
  b=kdF+MCkpNADFeDFXRV0w/Rk1JXtxvRZglNqfcJ6VYphz4tNGEdXZ5Qum
   bq4m+wZJC/VkA+o/QpxYV3OWSjlzByEsXfK5uddAfLYTg/kjZp78UmD9c
   1cENxJSntko6aNfqcYWbPOlEMZVrzkr97Z4TKZRB0zsjKSvdaUFWPFTo7
   31xlSBiNWepE6KM1Xc2YbksOsmmoXsiQcysNbUpwgaBLm+PoWCwmb0ODe
   ZtnrSvP2z9w4Ywe6DhOQ6AkW4KyoI+m274CX96zgyO9k+snXdj8EVVyEg
   kDgkKf+tdJycKZz7Q3eM0abdMRq9HhAwJewsr6RM11HT67TwzceSTPoi8
   g==;
X-CSE-ConnectionGUID: fr/FoennRV2JQyt4ozlvng==
X-CSE-MsgGUID: n81sIhmnRQe84I+9ldFzJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55658954"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55658954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 10:14:11 -0700
X-CSE-ConnectionGUID: 452aB8zGRa+niL2CLaBh0g==
X-CSE-MsgGUID: nWELuBnIQQ6HDDCZZyA/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="157756874"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.124.222.41]) ([10.124.222.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 10:14:10 -0700
Message-ID: <54308373-7867-4b76-be34-63730953f83c@intel.com>
Date: Wed, 2 Apr 2025 10:14:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] x86/microcode: Support for Intel Staging Feature
To: Colin Mitchell <colinmitchell@google.com>
Cc: bp@alien8.de, chang.seok.bae@intel.com, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@linutronix.de,
 x86@kernel.org
References: <526df712-6091-4b04-97d5-9007789dc750@intel.com>
 <20250326212928.2360063-1-colinmitchell@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250326212928.2360063-1-colinmitchell@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 14:29, Colin Mitchell wrote:
>> On 2/28/25 15:23, Dave Hansen wrote:
>> You seem to be saying that you'd rather be (for instance) insecure
>> running old microcode than have the latency blip from a legacy microcode
>> load.
>> What action would you take if a staging-load fails? Retry again a few
>> times? Go back to the CPU vendor and get a new image? Or just ignore it?
> That's correct, but the latency tradeoff scales with the platform specific
> size of the microcode patch. I'd prefer to have a more deterministic
> update path and believe the potential latency blip would be significant
> enough to justify the option.
> 
> Adding configuration would allow me to handle the error as needed.
> A retry loop would be a first step but I could also look to migrate VMs
> off the machine if the platform specific latency blip would negatively 
> affect sensitive guest VMs. While an ideal solution imo would then
> allow me to force legacy loading, I could also settle with it being done
> through a reboot where early boot would already skip staging.

There's a lot to unpack there.

But, for the purposes of this series, I think what's here is fine for
now. Let's leave staging _purely_ as an opportunistic optimization.

If folks want to make this more configurable like making staging
*mandatory* and disabling legacy loading then we'll look at the patches
(and their justifications) as folks submit them. A good justification
would be something along these lines:

	Legacy microcode loading causes a 5,000ms latency blip. Our
	customers have been complaining to us for years about those
	legacy loading blips. Migrating a VM causes a 1ms latency blip.
	Those 4,999ms mean a lot to the folks running those VMs. As a
	CSP, we would like the flexibility to avoid the gigantic legacy
	microcode loading blips because they are bad and getting worse.

It becomes less compelling if it's something like this:

	Legacy microcode loading causes a 50ms latency blip. Migrating a
	VM causes a 49ms latency blip. That millisecond is super
	important.

... and increasingly less so as it becomes:

	We like knobs and flexibility for $REASONS.

You don't have to have down-to-the-millisecond numbers here. Orders of
magnitude are fine. But if you can't demonstrate (or don't anticipate)
orders of magnitude improvement from the knob, then it's probably not
worth it. It better be a 10x improvement, not 10%.
