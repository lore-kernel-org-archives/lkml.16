Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBD1474B8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521259; cv=none; b=Xur144P3E0pcCZeOnkUskG6P3O6z33/JYXS/jJ4wAuk+Vay/tjnSQxfbeLyRZuHklUixi2rPq6QSeIQHRqXsrMAycatdq74ucCqUMfEffwjwU8u+5I6naDTjZn3JLRPgd1MOiWupfySgCfjpgXJNUvVrBeEyVlcqumQuz5N9bH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521259; c=relaxed/simple;
	bh=uFE8YL2UMZqE3KxHbYLbjg+9Xj10CmA10qs4ssDv458=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS+gNAmQOufBZVCm4HW0OYts5/F/iJeI5MGbCleSajOyEDc69YTHhhLtagN3jRuyPxGYZiecNgp9JoJJFloG5uZGdfU6O8caFW/X0zgC+8jfK8QP1CdFIZRjJB/9P5dh1nXYDE64cTlzpd2wHrJsne+XtP6OyIXTcIwWxwKD2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QgV3Zq27; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=acUoLxzx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QgV3Zq27";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="acUoLxzx"
Date: Tue, 6 May 2025 10:47:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746521256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFE8YL2UMZqE3KxHbYLbjg+9Xj10CmA10qs4ssDv458=;
	b=QgV3Zq27gjvTHZ9NaQUkn51LjN7jy3mKrDGUfOQ9zUpq9W/t46fIp4bvPERo8eofkvj04q
	+UCUliANGMt+jJjxsTWX6ZKMhGnkSuuv8hPO94a+dhtFPcG8nIN+lAqq6ZW02ynQ1CPhnt
	cTMrgfchtbS7nUGKydz1du/5v0rBB7PD4XQL/FJqPsk2q3MSEX9wc0yCAU25Rl0W+XKa1T
	VzyAWXeZVbtEdJRKSPlSBs1DC3QaV/1yTyF9nAvcDG0bzLzzPYECE1QzZYFtwXbvsZBLDW
	BGGuJoHoCIodKPONlpKqpqq//xX95bAfYdpIJgvADJccfhZB+se7yj/UCI7caw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746521256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFE8YL2UMZqE3KxHbYLbjg+9Xj10CmA10qs4ssDv458=;
	b=acUoLxzxwX82j4KymZWPScMF9pA/j5iMXdjkbqdQL81QJxr5/vH9EdjmI72LwbG194tkBz
	EPFQRWF1gnNAozDw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 13/26] x86/cpuid: Scan CPUID(0x2)
Message-ID: <aBnMprnsFmPJDqaW@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-14-darwi@linutronix.de>
 <aBnFRrnZQ9HwwULK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnFRrnZQ9HwwULK@gmail.com>

On Tue, 06 May 2025, Ingo Molnar wrote:
>
> Could we please emit a one-time syslog warning & diagnostic when we run
> across invalid or otherwise weird looking CPUID data, instead of just
> silently skipping and sanitizing it?
>

Sure; will do.

Thanks,
Ahmed
