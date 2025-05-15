Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87304286432
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333881; cv=none; b=QsMMG+N8b3Mzqu+LLZuVh/DjKGmf94qOK+yd9N9xusePYJueB+9PvkC5IwBAmWodQbe0mxIKU/KeQhfmWzoSt7aSK6PB72KP+TlAUM7QhHZCVN7ZVK0OTdy/RESS7TqmY6gK4cW7ZcNr1cVyDCuDWLR0Qx7iu4mVQdSY0gr+3n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333881; c=relaxed/simple;
	bh=1d/jKqYLW35S/PzeicTI3Wl5jOANEO+bjlVRodJAlhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbyVMXOlLJFlOXpcaeLeLgm7xfZjqsdO2em9v5VvqPzPTVrMpX7EMg/XIs+EEOqCcYsXspH6Ud27Xh2FFKEAERu1bchtvhuAlxokQeCoK5rTRVI6RkmSggsnJNtaUyYuOUoNAS1op9lDWa6bTfrDWLals9J/CXAN3Aom6Nn1umw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DhaOjPS6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SOsSVuuL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DhaOjPS6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SOsSVuuL"
Date: Thu, 15 May 2025 20:31:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747333877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GPw2/F5pp8S3dJy5eoZyWdo6HGEwXrROa5PhG1i73AI=;
	b=DhaOjPS6dwcT/z6hcMNIxdeSSAYwSzTqpI+sLcCJmJUAYjDaD5psQ+JuNXEQOV/H56ZLJg
	1pKqTf4sj9lrXXJ9SQkBz/EntK8//BbiGSjc0Jd2kK5WqgE4+Y3YZyRICXUl+tY6FOWuGu
	3U7qamC8Mwh1WpiHir2N+axaeJEhrqjC0xRGhkpfM+cfSylYNrr9z9VwT9XuLiWxL7qM2b
	//unjtKQ2RiyDruFPcu3AZ9kAJs1KYk8w1DdHbgMlthK73l5tnASt5LtFRYNFSkq4aN888
	M+2+lh1puta7oxkUtMZwVSIkQyUqQtvnhxXV4KM6YcGVZbdsH3FreFx7Ncc+vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747333877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GPw2/F5pp8S3dJy5eoZyWdo6HGEwXrROa5PhG1i73AI=;
	b=SOsSVuuLqudS7b+xdAhj+CU4SANJto3TV0ZqV/I3gOTOdCrWIAhlCs5XA6/pZbCeWZbMUW
	6Spgu8AZvOggvDBQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/9] x86/cpuid: Rename hypervisor_cpuid_base() to
 cpuid_hypervisor_base()
Message-ID: <aCYy9Blvu3jH-LJE@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-5-darwi@linutronix.de>
 <aCYY7CE57Al9ydWa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYY7CE57Al9ydWa@gmail.com>

On Thu, 15 May 2025, Ingo Molnar wrote:
>
> So the interaction here looks a bit weird IMO (what is a 'hypervisor
> base'?), and I think the 'CPUID base' phrase should be immutable.
>
> Ie. I think it would be more natural to call this method
> cpuid_base_hypervisor(), which would mix reasonably well with:
>
> 	kvm_cpuid_base()
> 	xen_cpuid_base()
> 	jailhouse_cpuid_base()
>
> These lower level methods are prefixed with kvm_/xen_/jailhouse_, as
> most of their internal methods are.
>
> Likewise, for_each_possible_cpuid_base_hypervisor()?
>

Makes sense; will do.
