Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B912989A6;
	Fri, 11 Apr 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365326; cv=none; b=eEgxdoYs3SX4V1DNoxGBk1Pw76JtZ/uovplFXt8JEWYut8rv14HxGleql+dpWDmZObLEUB5heEDferW4Cpe/v44e+nBtmkLbAd94VJGrrDHUOZhk2ur/0caIifcEWl1cA/XgH/JTczs0So7xAL1o2T+QO4uhxlidB+iIWtE3O+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365326; c=relaxed/simple;
	bh=fzuHk7gnHpykNso93QwYWcqCbfx9xm7veKnjadys5ak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q8TvjIWZC0QtIDUB6Spe9C8Az31vMJXtwQ6qmkx7lhit0riBIFPvmbDE4azxLU0XeLEh0Z0kK6Vp1Uo83/FHcmadbK7tDtZjCHyrb0gxZHRRADWgH1UxRqqhswM3iOZI9uTOrZrK12IBZRQHj+tGoWy6ibOL2LnuK5f2EPKBS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lldZTB8a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K/Gh8U4C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lldZTB8a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K/Gh8U4C"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744365322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFilB1CWtJRNPPBhabQDjIrMR//U86n9XWn9p+phq6s=;
	b=lldZTB8aa3KylyrLGpWT3q3PIdaWlu4BkIKbhmi0Vwqtf5DpEsfRYbG0LTyUr8+UgMqsaH
	92IE8hVzpaQ7jIFVvXotuqddCs4ueHRNSSA6AyTt0QCzL+hZ/Jl7FpwyGA+0lqMHB8FnYk
	2ZgN331Fp2lWsN9GaB9sn4KSR857ErFolh8FNe/CPpOuIk2Kq27+9vbRagUYNHAISi/T01
	yrAl0oBah/SlbViI/yxNkYS8aAk92ZxuyTKzMPaQvoBmkzLGp6OkGZXXKLUcNVgRR2NyBD
	0xM+1NGeJGFLPwrVbbp1P73nRYoDlcdaYxT1hchYih7EoHKH316WSu9KeA1L4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744365322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFilB1CWtJRNPPBhabQDjIrMR//U86n9XWn9p+phq6s=;
	b=K/Gh8U4CXj+l1NLqONuUhEP+NCa3T+gi/I84He2UrtbFNxqfACmP8QJbhrqX8/KZ7DBdSC
	bhnQPg63Dk/LunCA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Liam.Howlett@oracle.com, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <Z/jgL52ZVdcxTEkP@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
Date: Fri, 11 Apr 2025 11:55:22 +0200
Message-ID: <87plhjrpit.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
>> Maple tree entries are not used by the driver, only the range tracking
>> is required - therefore the driver first finds an empty area large
>> enough to contain the required number of LPIs then checks the
>> adjacent (and possibly occupied) LPI ranges and try to merge them
>> together, reducing maple tree slots usage.
>
> The maple tree usage for this purpose is an RFC at this stage.
>
> Added Alexei because I know BPF arena used the maple tree in
> a similar way in the past and moved to a range tree because
> the BPF arena requires a special purpose mem allocator.
>
> As Thomas already pointed out a plain bitmap could do even though
> it requires preallocating memory up to 2MB (or we can grow it
> dynamically).
>
> We could allocate IDs using an IDA as well, though that's 1 by 1,
> we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> using an IDA could do (AFAIU it works for 0..INT_MAX we need
> 0..2^24 worst case).

The point is that you really only need a 1-bit storage per entry,
i.e. used/unused. You won't use any of the storage functions of maple
tree, idr or whatever.

So the obvious choice is a bitmap and as you said, it's trivial to start
with a reasonably sized one and reallocate during runtime if the need
arises.

The reallocation happens in domain::ops::alloc() which is fully
preemptible context, i.e. no restrictions vs. allocations.

For the top-most domain, the callers hold domain::mutex, which excludes
concurrency vs. ops::alloc/free(). If the bitmap is in a domain further
down the hierarchy then you need your own mutex there.

Thanks,

       tglx





