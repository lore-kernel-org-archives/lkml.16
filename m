Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C07242D82
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377016; cv=none; b=X286RXlkw1xbrvxHGyhLKsuZ03QDpsV+kFFhwj1FTXSZkfCInxx5+w5i41Fzu+S7dizYrOTFeCbyVRLdbuEhTn5LlTR3WBYwwhBTACr5x13rK7SzdlMj6acIXep55w7a/f8WGsJvM6avUMeOOF5tqtfMJI/8JYSrPUp7eU/ArfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377016; c=relaxed/simple;
	bh=9QFqR5XGnA9haLq+DpclluDTvXFmW6DXOr1EjPzn/h8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BM3grPo5opvAsdc+Pgs9arX9mT7nGrp/8QsBRATgUub56VYc5BtL82mwbaRQ8g5Rp+SSeRHfZEfpH17KzNOnBQ6NemSC1qu3Mo85oPSbIyQminthVXTALQHi2glgMdoAD1c6XcmyY8Fs4qp/vPyFzefxDzo3sISXULT82dtFTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1a8rR5Xw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ca1OAjzS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1a8rR5Xw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ca1OAjzS"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751377013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lWjty2NLIA3jfDEqCO2NP4ste3v3OPji2XeNBHu04Q=;
	b=1a8rR5XwxuV+onsRKmUHrr37JR7RTff0ha9iblWnSriwG0y0JPrzWIZ+ii6l6Bns88DIhB
	jmyMVzxY61nvA7VWKV1FtiIwSwlnK4QUVXnT/7BJKfUldENS/rN/oCKS/iunhVSpO6Oxfa
	F/QIASQjTgLa3Xljim7C4HUQW6rxxZo9uRJu0CaCEpX0ezzojFm1+HQSoR3qBq/gMFzo6T
	ZimGNyH31GHJJ6gzBGZF/9I16q33WgdRnmQjTLUuYOkLicTps27UZ9NTA8PDP1V1AC55ZY
	g9fh0vCvyJmj4aimgnU6Z+SfsH5Aj5Az7jmHDnHn1ExvHn/Pg9bcTPGEvRKLYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751377013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lWjty2NLIA3jfDEqCO2NP4ste3v3OPji2XeNBHu04Q=;
	b=Ca1OAjzSfo9LE3vgZsyC4bL4/dSzUIORqXl0DZiej1Je5CRGZlMoZJ/6PPp/Mx+dUMMKvo
	96ba7IRD8ob9iIBA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] time/timecounter: fix the lie that struct
 cyclecounter is const
In-Reply-To: <2025070124-backyard-hurt-783a@gregkh>
References: <2025070124-backyard-hurt-783a@gregkh>
Date: Tue, 01 Jul 2025 15:36:52 +0200
Message-ID: <87qzz0kp6z.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 14:32, Greg Kroah-Hartman wrote:
> In both the read callback for struct cyclecounter, and in struct
> timecounter, struct cyclecounter is declared as a const pointer.
> Unfortunatly, a number of users of this pointer treat it as a non-const
> pointer as it is burried in a larger structure that is heavily modified
> by the callback function when accessed.  This lie had been hidden by the
> fact that container_of() "casts away" a const attribute of a pointer
> without any compiler warning happening at all.
>
> Fix this all up by removing the const attribute in the needed places so
> that everyone can see that the structure really isn't const, but can,
> and is, modified by the users of it.
>
> Cc: John Stultz <jstultz@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> First version seems to have been ignored:
> 	https://lore.kernel.org/r/2025052321-plank-hardcopy-e895@gregkh
> so resent

Duh, sorry. I had seen it and I actually tagged it for merging, but
typoed the tag so it went into the archive ....

Let me pick it up now.

Thanks,

        tglx
