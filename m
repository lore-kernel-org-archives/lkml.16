Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63714A92E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747687868; cv=none; b=MtRVJwlKF2POm798JCKTfKG/aX+ZrgrlTw0a8itjgrGB4H9CgcazM5ylGok1y8wH8H/Rg7KZAaGc+uXC7BmtNXYLc0GHnf4EnHreGHqiVMQYpPX+QSSJM3b+6KsMrr/R5Y9UoNjkqG3YkpT3Xgvm1LxYBTY6ubo9QZBN4EgU/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747687868; c=relaxed/simple;
	bh=0Q1/O1EqPx2mHdNKMN+z2QMfW2DsEo0HtjrUptELn2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4+XZ3NQhZJnbXKQtkRTWV26Ns5XqhGjhFJCiBaNrdr8CkgihhC9D88/SYJzBMY7iVd9/NyPht5E1HBqSmjZD0w5c86gcVz2bMVtffDc6N0ygs4KI5ogU7lv781qmgzrGDsRNQ1tiaVQqOizwEl2djWpsb9nF4biTFrtO7jprmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XemC90L8; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XemC90L8"
Message-ID: <96b21aa0-97d8-415d-9fbf-529b0434b25f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747687861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGlArTtgUOUj740Mzo3b0ERQs4AjG6k/geZL7DXeETU=;
	b=XemC90L8DlP7lHEfQe/6YT5nXiboLVsNPfxid6qDytTG7ortwy1b/PntPkjfe1V5VbOnxD
	dbz+wvnu+qAUoWapyohMluzeBpJJjslsLapo2BoHMkJiMmpKrSDCoJhSPh/LAnah16WxiK
	S7A6quHCGMTVCddnc0juwgsYeTNbKNE=
Date: Mon, 19 May 2025 16:50:57 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <rrendec@redhat.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3>
 <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
 <20250514123823.GA10606@willie-the-truck>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250514123823.GA10606@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/14/25 08:38, Will Deacon wrote:
> On Mon, May 12, 2025 at 11:56:28AM -0400, Sean Anderson wrote:
>> On 5/12/25 11:36, Mark Rutland wrote:
>> > On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
>> >> On 5/10/25 03:04, Sudeep Holla wrote:
>> >> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
>> >> >> Cache geometry is exposed through the Cache Size ID register. There is
>> >> >> one register for each cache, and they are selected through the Cache
>> >> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
>> >> >> CCSIDR changes to allow a larger number of sets and ways.
>> >> >> 
>> >> > 
>> >> > Please refer
>> >> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
>> >> > 
>> >> 
>> >> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
>> >> | in conjunction with set/way cache maintenance and are not guaranteed to
>> >> | represent the actual microarchitectural features of a design.
>> >> | 
>> >> | The architecture explicitly states:
>> >> | 
>> >> | | You cannot make any inference about the actual sizes of caches based
>> >> | | on these parameters.
>> >> 
>> >> However, on many cores (A53, A72, and surely others that I haven't
>> >> checked) these *do* expose the actual microarchitectural features of the
>> >> design. Maybe a whitelist would be suitable.
>> > 
>> > Then we have to maintain a whitelist forever,
>> 
>> There's no maintenance involved. The silicon is already fabbed, so it's
>> not like it's going to change any time soon.
> 
> The list is going to change though and it introduces divergent behaviour
> that I'd much rather avoid. The mechanism is there for firmware to
> provide the information and it's hardly onerous compared with other
> (critical) things that it's tasked to provide such as interrupt routing
> and GPIOs.

The mechanism is also there for us to discover the cache sizes without
requiring any devicetree involvement.

>> > and running an old/distro
>> > kernel on new HW won't give you useful values unless you provide
>> > equivalent values in DT, in which case the kernel doesn't need to read
>> > the registers anyway.
>> 
>> Conversely (and far more likely IMO), running an old/distro devicetree
>> on a new kernel won't give you usefult values. Bootloaders tend not be
>> be updated very often (if ever), whereas kernels can (ideally) be
>> updated without changing userspace.
> 
> Updating the device-tree shouldn't require updating the bootloader.

Very often the release cycle for the devicetree is tied to the bootloader.
So they may not be updated very often.

>> > The architecture explcitly tells us not to use the values in this way,
>> > and it's possible to place the values into DT when you know they're
>> > meaningful.
>> 
>> Well, maybe we can just use these registers for the hundreds of existing
>> devicetrees that lack values.
> 
> The fact that the device-tree files tend to omit this information is
> quite telling as to how useful it actually is. What would you like to
> use it for?

Say you have a program that works on batches of data. You may want to
adjust the size of the batch to fit in the L1 (or L2) cache. One way to
do this is to benchmark various batch sizes and select an appropriate
size. But it would be more convenient to the user to pick a batch size
automatically without having to run a benchmark, just by reading from
sysfs.

> Short of having an immediate functional or performance benefit by
> exposing this stuff, I wonder if we could add a kselftest for it
> instead?

I'm not sure how well that will improve adoption. Do people even run
kselftest during board bringup?

--Sean
