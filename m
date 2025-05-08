Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CD27875C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730152; cv=none; b=MidzrPlq0oTqEbHjkdwgfLCwxBK80j87TJYil8cvYoSwWOSrDhkp9VDP5daYghdXoJMlkEtzezQSqTeMruAZuu6uIjckESQsj90P0DRDmLVZXro8Po0ICzFs+mtczhiLiY2/AqkOWHcXyGqIthJJJddnDFPsMHjlZAFNVl7wvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730152; c=relaxed/simple;
	bh=wK6rXqJv6Q9HETINckal3+AxEXHzzBeOeWS295xZTwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr21uSBp7wAfkIWaO2tHOFicxzJmQXx7kp63FRFwAIbLS3MtEhJIn3fHqjQutNYB7vdeU18xJts319bDL9sFlTHOBHdOmZ6NUbfrWXHUAr8okXxCawrmBHJW7nBpfq70vb7PFECMFAZ2JScp6YO4a/5tqRgvicZzk0aQfl3V5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HFWJqwaQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8w6gKwf6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HFWJqwaQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8w6gKwf6"
Date: Thu, 8 May 2025 20:49:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746730149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgieM7TFBIUGIGLPFDm65OyHb8JUxeHxxWcl08nZ49E=;
	b=HFWJqwaQ5ezyVwg/hm9exwbzdchg7qF7YRg02Jg4A6Eu6lxsaZiIVgGt5z10N2ulo6upfj
	quv2GnAIxOorTbzMq+RNdCv4g2rI7yV9cFAtwQbOb/zxmwdK+oPwGseKdCBOEUElotSvKS
	ckRlZkG4V6Fl/rU1v6KilP5dxmDFU4GFJnZiGBX7QQeXVdMS12A6wA0Q8XBvz0mIpFSG8J
	d1sZdsreydHuo+giO2sQIyhvTd63o/SzLlpooBFlIotWZJPjGJnjVNtsYWTvWz6ot1jIet
	zQCeBOHo8rhwqsFeoa7xgDJnqTV/iROK6Mbz1eAiwwLf0zmpwq0o3SbpXNPhJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746730149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgieM7TFBIUGIGLPFDm65OyHb8JUxeHxxWcl08nZ49E=;
	b=8w6gKwf6CQhGNkG/oTsQWa54y6twhI0eUpzRpc6fOklc+fbkawR0v/F97ufGfl7QMahzuo
	Qo6XA7TAUNoivKAg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/9] x86/cpuid: Headers cleanup
Message-ID: <aBz8o-Ikwvr9Y1PF@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>

On Thu, 08 May, Ahmed S. Darwish wrote:
>
> Simplify it into:
>
>     include/asm/
>     ├── api.h
>     └── types.h
>

Typo:

      include/asm/cpuid/
      ├── api.h
      └── types.h

Thanks,
Ahmed
