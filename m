Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD31E1A05
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704543; cv=none; b=lgbD5uR9MlbfoIx/E8DkW55cjilz16VmVDtsiRSevRapCQxSSxFc4efNQJKrPCayi2HjhZXukxHK/LB/e0GvmWxckXKrYX1Jh+upLazCwcSVczXl6qIGDtkKeEnwTS79qpNrTNe+cU3ULDpSisl1/DA17qDfLrgoDqAuMVPDWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704543; c=relaxed/simple;
	bh=kFM0TNlX/U+yDgwFjIEMNOTe+9mt+VLKNv3TBfQoHu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ealAv76GwqvGNIQm7gczJINUhyxjfLy4n1mzBuasbhOEmVaC37G/kuRpU+N/4BtjSwg5B4MWDv2LoYUbazNNvwTprAyICVs5yB9L/9uvuCXQcZ67CbIUms/x7cFDE6Y97Mgu5jDlTMXYLgRdvqxmJRPxVUf/T34H765pDWaSUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PXieTfFN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PXieTfFN"
Message-ID: <a8a3e849-bef9-4320-8b32-71d79afbab87@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750704537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPeP8du2qBa6yFfD4N13fXz74Emk3SySRJAz2DZwT+g=;
	b=PXieTfFNnH2x0MB6xi3e+6LGZLqrOxLZI3i0CcOdyGfCvdjd7oBe6wW/zwNLrAyB877f21
	ejPCyCi4UknfuJ1Xgqn8myevhtFm14NvQVD9OS0Q/Am4s6Dc+xdwaO3JAtIQ1BLfv3DdhU
	bKacHtVK2GuqyI7UQ2SIZtfsr58L+QE=
Date: Mon, 23 Jun 2025 14:48:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Saravana Kannan <saravanak@google.com>,
 Leon Romanovsky <leon@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-5-sean.anderson@linux.dev>
 <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
 <0854ddee-1b53-472c-a4fe-0a345f65da65@linux.dev>
 <c543674a-305e-4691-b600-03ede59488ef@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <c543674a-305e-4691-b600-03ede59488ef@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/23/25 14:27, Andrew Lunn wrote:
> On Mon, Jun 23, 2025 at 11:16:08AM -0400, Sean Anderson wrote:
>> On 6/21/25 03:33, Andrew Lunn wrote:
>> > On Thu, Jun 19, 2025 at 04:05:37PM -0400, Sean Anderson wrote:
>> >> Returning EPROBE_DEFER after probing a bus may result in an infinite
>> >> probe loop if the EPROBE_DEFER error is never resolved.
>> > 
>> > That sounds like a core problem. I also thought there was a time
>> > limit, how long the system will repeat probes for drivers which defer.
>> > 
>> > This seems like the wrong fix to me.
>> 
>> I agree. My first attempt to fix this did so by ignoring deferred probes
>> from child devices, which would prevent "recursive" loops like this one
>> [1]. But I was informed that failing with EPROBE_DEFER after creating a
>> bus was not allowed at all, hence this patch.
> 
> O.K. So why not change the order so that you know you have all the
> needed dependencies before registering the MDIO bus?
> 
> Quoting your previous email:
> 
>> Returning EPROBE_DEFER after probing a bus may result in an infinite
>> probe loop if the EPROBE_DEFER error is never resolved. For example,
>> if the PCS is located on another MDIO bus and that MDIO bus is
>> missing its driver then we will always return EPROBE_DEFER.
> 
> Why not get a reference on the PCS device before registering the MDIO
> bus?

Because the PCS may be on the MDIO bus. This is probably the most-common
case.

--Sean

