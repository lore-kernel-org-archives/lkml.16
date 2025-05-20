Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7A2620E5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759732; cv=none; b=bMWTlG/qY1h9r72A4l7xJNdjidJCpzOPfS47G6C/0nNv78mKtuPqdQBlh2EIExNvtxtNourbHrZk8qpf0tlbaJag/uhSnSPGZ9P7eRX/b3mv7Fc6nAjaplK+LaFuLuKZHVY+ixuM58aSFirRqV6Q9HFvHYCvWYjKsCFsPmlVivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759732; c=relaxed/simple;
	bh=lxPVCVzxdWABlEZgskmtEqT/Yu7jBM+w5aHz2u8PwDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9tegYUSXdqhsH1eFFngrvxVybzLU2iK+AXhQ6bC9tXRDPnJQTa8QjGQV+wKJjzIdWl8J/6hpjvQli6gosS/3Q2iOTN0IrlmyJoXDOYgokUQWQElV0Vy8dsqHoQLz+1Ai7THon/vhVAG3gP5LtkvaJ5lGla0x5jwgDguRfJmqXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IHnt2PhS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IHnt2PhS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 448A040E0238;
	Tue, 20 May 2025 16:48:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3QCDYpxDbJng; Tue, 20 May 2025 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747759721; bh=mqR8m/ZKezKr0JKZKXH+XBAthMYZSYKB3uDgEUcojlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHnt2PhSbiSMglQhHAV3s85S9ppdQPzeBpfuJ3/aYan2a0dYupuAt9XFLQmiHwxHv
	 oME/egXhEBSSIsw9bVSM8s8rgajeSK/6JNHnLZGEdKdIln195knoSVoQUrWXmOPx16
	 Ifv7rDjDIaJK/ZDqo4ludA1GZk86VGiQ1IpOXgTaYbngfx5Uc3eCo9XyAVrPqic+z3
	 V1CTfQc0zzb39NVGYuhHcEBDq4PMN77bQJl2qz9JMQ5S7xprJ2g6PpEed5I3pOJVnG
	 cUKwi+GFk02HBAoCfEGRhodaE4DmNDChFln+dQuXvdmW3/o7jUsI3D1dagEUoFMYgY
	 cCEr028t+/+5+my3wiPOEwDZdo8TI5blemmE63eK3xi6v8Ynek4mHeIRkGoUvQt2Mw
	 JPHy/z+Im2YOyKC8ABFM0XGzuOcSkHEZMnTagrawFZ8qtsWGvS5Xm6F0YG/0bazAcH
	 9CrEqN/RATxxVV4zjpGJA3AmUTmQ82l40zem11zwJxOhlcqYHLEfQCxAMI2ksONjuF
	 moXiZh20aLnPWCLwJSy6ViC3aetSz/qOfZBXlhNQQSTOiiq3K9T3cWAWYjlTzw7YG/
	 XiEAukrJatyUGyBzQAZ21qgve0sXUkoIXfRSZQg63D6GZwZBmyJoSvK9UBLwi2uiyG
	 4wKOPTJR9k1sQSYUkiPPsbYA=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C1B740E0192;
	Tue, 20 May 2025 16:48:31 +0000 (UTC)
Date: Tue, 20 May 2025 18:48:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
Message-ID: <20250520164826.GMaCyyWodIiRMuBtw3@fat_crate.local>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
 <20250520163221.ndezdfrhoav43sxi@desk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520163221.ndezdfrhoav43sxi@desk>

On Tue, May 20, 2025 at 09:32:21AM -0700, Pawan Gupta wrote:
> Index 1 (which is now ITS_MITIGATION_AUTO) is missing. I understand AUTO is
> a temporary state, and it may not be necessary to define a string for it.
> But, assigning an empty string, or an error message would make this obvious
> for a future reader.

Yeah, this AUTO gets overwritten and the other AUTOs don't have strings too.

We can fix that after the MW if you think it is important but from what
I looked, all the AUTO settings get overwritten as AUTO means, user didn't
make any decision here so it is left to the kernel to make it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
