Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC41ACEDA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776813; cv=none; b=pO3Hri1LWIZAP2Bj7uf+0agkRNV5DdhVa26JqF5Q/y9Zz02dsbAk7IHL2/FNnWZn/kYON0zU0i5t27+pI2uS2LyifgbKOlfrJVCI82vi0hIZV5EA8lGjN2/6rggmRBAUkpwIFQx1kTcOrQRbpcaNXPuDAXCROVHGAKommPd4nyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776813; c=relaxed/simple;
	bh=eFaKS7jJzEF7jB9ryuktjITi2UnokSZBYj6plQNNj+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWcXOCD5kLw4e9JsjKJ1M/oFLZ2JmSerLofL6iZzSjRTzm076+dG23i8bEflhOOih5mGrBkKQ1khr2JQfYdwSRwKudJ9mRl5r7jHIVKZRGLxxcduZkhXbqbe1NtmOGmwW9jv9fhTjyPa2qHITzjVa6ks7wPnkptrablFx3lNil0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iUqdSnBU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iUqdSnBU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2F9DC40E01D5;
	Tue, 24 Jun 2025 14:53:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CDJohe33vWcM; Tue, 24 Jun 2025 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750776803; bh=9t/noWSBGb+Lh17aN+LlXbrEMHGa+OmxPPveQlyB7Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUqdSnBUcPHb2PKkh2SwIR6yAnoK6Lt49ZgAeuEHXVYHh735Zg51n3vwfgqhPu2sp
	 ArY+083JCkULpwvqU4luuaVG67QEUqC0DqLbjDOzBMlCK7h20Re2bpvrJ9hd3aOOFk
	 w5LawGO69SXm0IezK/i7eAg2+2gc6SHhl/81aTJStiRL9QPbUCHw2/5ugIHcltTBGF
	 fnCAtljMuIDzfXsUQbZzq6mUV6fbnVl6M22JfW7LmwT7DF8juKW2TC80vuhnHNyAAg
	 pZpWBC/PbmE8mYP8eW4DmjJaPgNSwvr+ByuusHsmzRzWUkSGQNiyJNKBjdRqGHinr8
	 xzTa9MzOD2JyqdroA8GlFB96cb+CgzA+D1lKighxMLjdh+TC2jMMOZSYl5nSn+VoMR
	 TjYYPiRhivVD4SvcbF+IRmQ90BZetWKs9zZo5uuLam8mCd7LHjfOmGYMuv+vRPdyGm
	 H76l8ybyhngmlSvzbSiI8Y4Da/C9pnrUlwzVxHuoQLwBj5GkMCgW/JG+aTsMb/Gdkn
	 CDxApTrhZbeoEYy6lM2Tb5xUiWc4CA892dc3JHrspZbvR7Nim3c5qdk3OuHTYFmWUH
	 8CSVSvw0yewWKFBTGcN0nrIjt1vhEPpmOD5si/eXHctaqRdG2MzTJ1szO2lI8PnRb/
	 Ixe+8tF6KO4VoaHVqzQLfW+w=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6BB2940E019C;
	Tue, 24 Jun 2025 14:53:16 +0000 (UTC)
Date: Tue, 24 Jun 2025 16:53:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH v4 0/7] Retbleed fixes
Message-ID: <20250624145309.GEaFq71dXBBU6wfsLy@fat_crate.local>
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
 <20250622160122.GDaFgo0tAwyUpIfiGS@fat_crate.local>
 <n65yrom6bgghmdwhuk2gszpltnznx47xftjsbovlo4bufow2en@ux4uuizje6ye>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <n65yrom6bgghmdwhuk2gszpltnznx47xftjsbovlo4bufow2en@ux4uuizje6ye>

On Mon, Jun 23, 2025 at 11:35:31AM -0700, Pawan Gupta wrote:
> Do you think also appending the vulnerability name like "x86/bugs/retbleed"
> would be useful for someone filtering commits based on vulnerability?

I've moved the vuln into the commit title. bugs.c is not that special enough
to have it be an exception.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
