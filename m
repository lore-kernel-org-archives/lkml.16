Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2642AD2D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260294; cv=none; b=cnt6l8D5EtJDm0blxUaZH6hFyf9SV2QG5X6btsbCgvMOn7FMY6x+HV66fqeC1B1Q7kx8/LgAnPtIig1HgVqmHAUbrmmtXJ6LhCpcNTVTML9+As0ELTDYejQED2vepZN5ZT1Q/3B2AgfrXPbFNPBtWRK07tqEOEjmvBPrlEt41vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260294; c=relaxed/simple;
	bh=fUugPY0s1KURdB9IXzw1XnFv2mw/Gq/ptHmskrHIgx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0XMqrcWDu/OdBjYYSKg6f8N67GiMyY/cODpTVFVVdmEnL7jqsgDmF2Z+iX/3oRgW97tovGtk8KNvRDi+mYuGcDKUtShjilroKi2nKJeMPC/uCT5JuAbAQXVjTJF9wg5Ovb17GS+afL+io0I2PzkQbnd150lGu0i0xp4hb9HICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrZWu4dJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrZWu4dJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750260293; x=1781796293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fUugPY0s1KURdB9IXzw1XnFv2mw/Gq/ptHmskrHIgx4=;
  b=QrZWu4dJPMDRLvc2rwyckVt6iqs28rPcnpUk6S0npk26VD9d4AZqYVhd
   fG3UMqkAz8844zknws0BGSUrdWjk+BNTYs7v3PA9wh5hd30Q61oKSde9B
   cSCmCdGul1mDs+rHkWn0HNZMdNyu83IhoEl1MLvQjlrVngeV6wr7o5hrp
   XsSKKToGJqGqKncKYio085X07ygBQc79PD2n2iyJl9qHmegg+OSjmKaIh
   fkqOGlZU22H1iHxn9vXRvyBpARAZFXKmtmYJGtNWgOwkzeMssKhT483PU
   lWDkfF8TEUrLbCysNePaAtPE252Y0ulfPzZIpcOJ6HdE5XlgkzzSnSixD
   w==;
X-CSE-ConnectionGUID: YuQyCccXSEmKiCI7bNAPwA==
X-CSE-MsgGUID: kS+rH91DSzqCkicfvwMJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52407454"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52407454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:24:52 -0700
X-CSE-ConnectionGUID: xk0KwkSeTMi5+aYe+ZVmtQ==
X-CSE-MsgGUID: MqAYmnapTQuZeS0EjzcV5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150373661"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:24:52 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id EC57A20B5736;
	Wed, 18 Jun 2025 08:23:07 -0700 (PDT)
Message-ID: <7f4be5d6-7547-4e53-b35e-075763f10f67@linux.intel.com>
Date: Wed, 18 Jun 2025 11:24:48 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org, ak@linux.intel.com, zide.chen@intel.com,
 broonie@kernel.org
References: <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
 <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
 <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
 <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
 <1ff8ed73-f766-494a-ab22-81c2076d7f07@intel.com>
 <64f071a5-3454-4dd2-9228-da9b394a3d07@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <64f071a5-3454-4dd2-9228-da9b394a3d07@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 10:47 a.m., Dave Hansen wrote:
> On 6/18/25 07:30, Dave Hansen wrote:
>> If software is going to munge the XSAVE format, then you don't have to
>> worry about alignment because you'd save it to some probably per-cpu
>> 64-byte-aligned buffer and then munge it into the unaligned
>> PERF_SAMPLE_SIMD_REGS above.
> 
> BTW, Peter just mentioned that you're just going to munge both the XSAVE
> and PEBS formats before letting userspace see them.

Right, there is no plan to export the XSAVE formats directly to the
userspace.

> Big ack from me on
> that, fwiw.

Thanks. :)

Kan

