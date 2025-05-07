Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B205289E0B;
	Wed,  7 May 2025 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629831; cv=none; b=WihJ4yKxkJmyfIyr/qXFsON2l9P0rqO6hw2DkiAgkPMEZ28jZDMNWNxGno5TdhHmiStDtPBGVmn5t657+MbWK4TLNmYL4ygGl7h36/z9qECfrbn1UQHtVtdqobOBVSCBmRqry30EegRHBddNubUcSDZAFg9ZTg8ZSxM6shoeHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629831; c=relaxed/simple;
	bh=dDqtRZg26E4Et3Yjy8rypNhjSO073NNczyslrDzYN2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fAPXw/TZ5oDclMi6xN5JtT6DCEOAfBO4PvTD2SzyTechAfdh1Vz6BHK8Fs6iHJQSnJmEZgduZZNli2sXd6XF14P83nY6k6XB36It4K30iB6dt3X7qc1MOzOXCJQdNpLt/AC4iYVeRlgo9cY6gR5N4awpOFxFwcQfUNKfBvGdFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c3w6h9UC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uhSJSd9k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c3w6h9UC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uhSJSd9k"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746629828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmIM9bL+9pYqApP4iiFLa2aJhHWBMRN4cnMPPzQ7Uuo=;
	b=c3w6h9UCZfwIuuS3NCJZL6VICMiK/xZO9n6BXRGzZTeB8JGqEKsYIIJQEd+sCKVnjzB0mx
	Ut1PYkFchzhx9Hx8bDfwGnfRQrKm+oWIvMKhDIg9J0GkO5XbC06KybHbF9EmCRGmjm69D0
	7dHULGK9bVsIrb1YwTPdTvaS0TGFHrIA+q/v7BLB6QENoRF/k52oMT9bGEDnYQWKxBLOZD
	UEMESZJFZ8aEPFPnqnAx1yzpx7hQHLpEMgQDuxfabwD0Z6qYGzguk9UKrbJpvkVZWi+QjD
	j5dWMGyUKfbo8NntAtEVhu8ZsfSDLGC+j/sgbi/V55iFV01xcbV+yyqxYkUOaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746629828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmIM9bL+9pYqApP4iiFLa2aJhHWBMRN4cnMPPzQ7Uuo=;
	b=uhSJSd9k2sw9XI3tMkhm2D2DL5P+4G6hR5bf0vhvXUMS5HskOI3vlbVGHn1v576LCoIznP
	Fn6GgNvNKNPOdoAQ==
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <867c2sh6jx.wl-maz@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org> <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org> <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
Date: Wed, 07 May 2025 16:57:07 +0200
Message-ID: <874ixwmpto.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> On Wed, 07 May 2025 14:42:42 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
>> > On Tue, 06 May 2025 16:00:31 +0100,
>> > Thomas Gleixner <tglx@linutronix.de> wrote:
>> >> 
>> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
>> >> tests for level, no? So the test is interesting at best ...
>> >
>> > There is no distinction between HIGH and LOW, RISING and FALLING, in
>> > any revision of the GIC architecture.
>> 
>> Then pretending that there is a set_type() functionality is pretty daft
>
> You still need to distinguish between level and edge when this is
> programmable (which is the case for a subset of the PPIs).

Fair enough, but can we please add a comment to this function which
explains this oddity.

Thanks,

        tglx
