Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9EB23C8DE;
	Fri,  7 Feb 2025 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946212; cv=none; b=Zj+rR4GknDTzMs5lI7S0touzGmJ776SYSpL8xAh79b8bS8KHPEN8VUaGz/aYcjIQusg5/Slz4RDHelkNzY/9EACoRbHohXANR+p5XZEqpH/ixXpMxAQWNJxgh/y6scJqFoVYmFNi6rDaCy/JV6KAYCcGR4MUgBA2cmKqFOn6DKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946212; c=relaxed/simple;
	bh=4wcDetISmzj/V1tnv3RY0ha2PT7y3r4HNbD8S1w3aLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cthUVFyqwWXLYNw12KxCDatRnDN87OpNbUeHBQBe9H/MCNTAB92UV3x95K3ETMRCHyLgt37jAGHz+5QSPQR3j/OnJ+B+VBjH0+0V0xoO6hVcNUsloyTGeiez+zlo+8pCBeELOpUPBQZ+AMzmDNxHquY/HjfBFGviTy0lvqhixZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ORuSbD5F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EffqKlyu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ORuSbD5F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EffqKlyu"
Date: Fri, 7 Feb 2025 17:36:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738946208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pf3AU/CopcQpYFGvzFyRsyVTetnXSUWJM4AhY2SfU1w=;
	b=ORuSbD5FLVodd9/gvh2Wldn0pg7iU+hl5EIxKeoW65OIqqZa+iv7TyZxxcfYgu0c1MJ3Tn
	azE69wjofUv70O5YphvQKTcSBlNrngtHynRQUwBtGkhTkfKy2mykPw5mDe0JpzYQCLoDAe
	JpKKehfEPQyvYhESxH2r2FtDlraD5r5cADYp/25/VbqhseK4vSYZ2SE9Fqa/nKxDpmLwVh
	oIydUJmb3Qy8hjen+xO1Hf526ZBCoHYHolznSqeftU3asYyQddoUAcNbRClQE5xVHed7/7
	uU0Dtutj3ltIuYS3G9IkvA3WoDtZqiFHRu/cz4iJltZ9ubeD5R/rUIw5XhiFIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738946208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pf3AU/CopcQpYFGvzFyRsyVTetnXSUWJM4AhY2SfU1w=;
	b=EffqKlyu48ogWHxYZR5ty7plTx0+625OTA5aub7GDL6rDyePCqQBe/wE2aTnc7DdoTSKvK
	0HFRoYHod4XUvRCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jillian Donahue <jilliandonahue58@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] f_midi_complete to call tasklet_hi_schedule
Message-ID: <20250207163646.cuiDH46x@linutronix.de>
References: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>
 <2025020708-manned-antidote-7d57@gregkh>
 <CAArt=Lg25QafefcOAGcvj2ZHuQ4Keip70NFSF1K3mau=2Y12XQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAArt=Lg25QafefcOAGcvj2ZHuQ4Keip70NFSF1K3mau=2Y12XQ@mail.gmail.com>

On 2025-02-07 09:10:50 [-0700], Jillian Donahue wrote:
> > No Cc: stable?
> 
> Cc: stable@vger.kernel.org
> Like so? I just emailed the 3 from the maintainer script.

Yes, in the body before the sign-off and so on.

> > And this is a v2 patch, right?
> 
> I have sent a few out because I cannot seem to get it right. I can add
> v2 to the next one, if that helps.

This was v2. The next one will be v3.

> > greg k-h
> Jill

Sebastian
