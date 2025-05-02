Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354329408;
	Fri,  2 May 2025 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746221793; cv=none; b=HYlE3WiE6Qyi4Jc+kXGhrbmsSXowgmDSIrTBRHlLoJ1QHnKoczM9F44XCedZSYDAnZHbKNxxGp6KuxR+4BjdRF+cjeAC0jGUUnYlswxp6uGoPDkL068KTlLs/d3wT8hB6O2Meh81xBjms6lm87p6LxlUdZlog+rUwAz+QeD+keo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746221793; c=relaxed/simple;
	bh=yGXalRNqfxRtXQ2JtLbUw9sW9Gy9K1M0ILzwPvTQPqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5QayPOv3rdSNEuZSfBrmQ20+UHPGohNIENUYscBzLc9hmirLZmyXKUYNcBt9w8kbrLnNGATg2FrBYaFE5S9Vr+YKDS/VIHh2RkDJRqqyT4ZZPxvWVf4zNXcSCxBdCoH6z3aBatGd9faC7VLJlw/O+UgF+a5b2FKfv4Z8wiAv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXJT2dCq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXJT2dCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746221791; x=1777757791;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yGXalRNqfxRtXQ2JtLbUw9sW9Gy9K1M0ILzwPvTQPqE=;
  b=TXJT2dCqAmkKXng1TpYv2oiVLzpNsFemapNGG929jVB8VLssLyBv+L+5
   BdB10mkeeE5cjPrw4zAq8tnw72AylR6UrVCRl2MERgSL6KAkHGf9cg+uV
   i6T1itk1OFV3dVMxqJ7LtNAm+jV0WUhZV1elKmOBvoXNdmT0iR+YwEDz/
   5dXIyGDXaQq83SXNj79uCXErQ5oWY+5Md7N+/PidfW1BYm+SzV3TeH6MW
   JIpFjZqfIqjkggfZBGsNhkx4IjGp1L/CdNTtG68DrPS0piLuE3A3lqqYQ
   O8RSCrAwayssMGKbtbsx/R/VK/VB2SS0csAFXcJIu8+zfb0851w+f/UaU
   w==;
X-CSE-ConnectionGUID: pwc/zP2NSSizMMvCCpWA9A==
X-CSE-MsgGUID: tfRT3LDFSJukM6wSHfvzrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47628481"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47628481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:36:30 -0700
X-CSE-ConnectionGUID: 0tv1uZKCRtiDDNTIFxekOA==
X-CSE-MsgGUID: k8wn7LtvTyWv46JNpypiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="171986956"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.220.153]) ([10.124.220.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:36:28 -0700
Message-ID: <d6c09132-05bb-481a-93dd-8e9d664981ae@intel.com>
Date: Fri, 2 May 2025 14:36:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over KHO
 preserved memory
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com,
 pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org,
 ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org,
 saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-15-changyuanl@google.com>
 <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>
 <aBU2JQRKXjqoFClQ@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aBU2JQRKXjqoFClQ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 14:16, Mike Rapoport wrote:
>>> +/*
>>> + * If KHO is active, only process its scratch areas to ensure we are not
>>> + * stepping onto preserved memory.
>>> + */
>>> +#ifdef CONFIG_KEXEC_HANDOVER
>>> +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
>>> +{
>> I thought we agreed to rework this to unconditionally define the
>> kho_scratch structures so the #ifdef can go away?
> It's either #ifdef or double casting and my understanding was that your
> preference was to get rid of the double casting.

Looking back at the other message... Sorry, you did make it clear there
and it just didn't penetrate my thick skull.

The double cast is goofy, but it does seem to be the normal way of doing
things. There are lots of examples of it. So, grudgingly, I prefer the
double cast over the #ifdef.

BTW, _please_ changelog this stuff. It would have saved this round of
back-and-forth. The changelog is the perfect place to say something like:

	This looks goofy out of context, but it is unfortunately the way
	that this is handled across the tree. There are at least a dozen
	instances of casting like this.

This series is generally a bit sparse in the changelog and comment
departments.
