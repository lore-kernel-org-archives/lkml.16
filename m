Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2363329B775
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691782; cv=none; b=rujfueEr3yG3OQOv/itRaBMIOR/HeXmB70YMRpN0sMM3aM4PNoSIN5iR1ywb46JXw/8aKiscSAcSdM6WRDpsHYi3ewCxHT4Ohp4jWcH2XLhwR+6LDXBkEMNqGhzEC4Gt9J5Mj8p3ennzC8+GWtVNWEthGLNrzb8xOlrUPsNbdsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691782; c=relaxed/simple;
	bh=D1GT6VbCjRAJvafapIVJiMylB6amkTDWtI4OdObQ3Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7/0NXyR/lWrloyKDfV4fFH+hEEG5KZf45KSLO/FVgOpflw/QiLIUZlKJyL4GQu49shJ6m9MPqtRFoxGWEoC115/1gT+OkIXlqAh9y+L9vBTRPENDXtO015TKoH1aoKB5BCaz3hLaIXmZq02xjWEM62JWziN1tpwFI2IJx8YLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dsmeYcZB; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dsmeYcZB"
Message-ID: <0854ddee-1b53-472c-a4fe-0a345f65da65@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750691776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rd1u1j3eg8lhJXpqmh2gB1y5eFliojuhqpAg0rdcDaI=;
	b=dsmeYcZBdpgJopeN4LNPwALDwYY+cURYbbJFzwtvGAFWR3Lmky/rd1MjDVS5iF/C5J5Dx2
	WViTrdief/+/PyFhnRJPblh77uiIy/aKL5lLcFHLVHs/4iVkw+4eL+p5RlhkAkywMUl2Iz
	FSBlI6hQdcjFGHPHGSmncD4B4LpYKnw=
Date: Mon, 23 Jun 2025 11:16:08 -0400
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/21/25 03:33, Andrew Lunn wrote:
> On Thu, Jun 19, 2025 at 04:05:37PM -0400, Sean Anderson wrote:
>> Returning EPROBE_DEFER after probing a bus may result in an infinite
>> probe loop if the EPROBE_DEFER error is never resolved.
> 
> That sounds like a core problem. I also thought there was a time
> limit, how long the system will repeat probes for drivers which defer.
> 
> This seems like the wrong fix to me.

I agree. My first attempt to fix this did so by ignoring deferred probes
from child devices, which would prevent "recursive" loops like this one
[1]. But I was informed that failing with EPROBE_DEFER after creating a
bus was not allowed at all, hence this patch.

Limiting the number of deferred probe attempts (at least before
continuing to boot) is a good idea in theory, but would not address the
root of the issue. Setting a good threshold is not obvious, since there
are almost certainly systems out there that are missing some device
links and have a lot of deferred probes. 

--Sean

[1] https://lore.kernel.org/all/CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com/
