Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016EB2920B9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057416; cv=none; b=eMMU5+toPb+x0I2sehSKMZNXFQASe02xzV+RNPysYXUDqHpaLJ4l04p07wLsH37rXJ2zFX6xJPOfaW/+IidNAqZNGBP+lw+PvGhP73erzy4+3mLr097ldu10kWGdJemmWOcE+rnyDN05eIowrhmYLjXULBmwvqJ9DNQinbnVXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057416; c=relaxed/simple;
	bh=8MkZIe3Qbp+RcKdC6k7z0xCo7nQ7E5S6LK6DBi0+XKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbZsuRT7Ueh3fZgjsn7bw0N+zZ8Xv+V+fzYgLxb7ESBOOY6wtOsosVcAnd9L50P4h9XfwtvoMUdlr9Lplz3xlnGN3agWvZGgedAT3sqsB4hvInwJ/n1986D149cSKugsRBhsMuFXJxAB981kV8evjEo91GnPxNFuWhUMTsNomxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eE4mhAz2; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eE4mhAz2"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EEFCC40E0241;
	Mon, 12 May 2025 13:43:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id O_dZuhafoLZV; Mon, 12 May 2025 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747057405; bh=LUM0TIYK6V7MxGqCziEXETvadDUqaxdImRi2b8LllN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eE4mhAz2TzgI7BSAFJtAYYb+DgMQUtlErUsSY/MIHfGdER1pC/gaFN2Cvcv09VSag
	 g3Q5kTVCHN94VPDIWKnc5C5gM60XZPIAP6wxqFich4jCPwSZ3acIMPoAVm7rQtwK0J
	 4iujfJ7ZrVfu/gRPZBCwrQM6LU7y8P62jq1lsHZ19MNN7vuxb1HzLzajcSmNPXO+KS
	 AUHRRV2qm/vuX9mIHHYhFrF8+efwIOiOyy7rghnC15FEmlHOLgdALvvm1EfQjL8mJc
	 8O3Q1E44JToqwmJimBIcWS/s+/dtrkmniG4ewC6MWm6rJ6ixHO885eV9StNI2dtIyI
	 GPxJuC+fST9YRFPvQK8lOVzXwMzpxqbhxTOA6FjgDN1a4NarnTXQA1LCaKuv1MKHqG
	 YIw/VK+kk7TZYkeU7TqFFCyUE3DZihDSzi+f+P0VM5NdWbHvem+sGwfzKW67MOIUsL
	 CJUtddf5RFW4PkVVe/+dLm53hmWX6eiwq8Y1uu6KclsXPEQBKe79kr72/ecVMkacF8
	 CnlJLrScOgIXmaw8NtiyFur9QqTzNJAefyfJCc5lXgpU4ATsCG4KJYqJXQsTZob3Sf
	 0HCT3wmy7T1TB6591cn/VqHbscbneiph4SFkb2zk9hSTjdDoWthRUHOuFBDAzB49qR
	 OThac9YX1W46vvEtAbuyG0Zk=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4F14840E0192;
	Mon, 12 May 2025 13:43:13 +0000 (UTC)
Date: Mon, 12 May 2025 15:43:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	"Wentland, Harry" <Harry.Wentland@amd.com>,
	"Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Zhang, Hawking" <Hawking.Zhang@amd.com>,
	"Lazar, Lijo" <Lijo.Lazar@amd.com>,
	"Khatri, Sunil" <Sunil.Khatri@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: amdgpu RENOIR funky complaints in dmesg
Message-ID: <20250512134306.GEaCH66l4S5qKzYpsH@fat_crate.local>
References: <20250512121836.GDaCHnHNjeBwfyV0hh@fat_crate.local>
 <CADnq5_Nq0yzyaYGMHHjjvmZdAAup4PHvvxTLjH9+KbMeeQkneA@mail.gmail.com>
 <CO6PR12MB548999B70BA6108AA111D656FC97A@CO6PR12MB5489.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CO6PR12MB548999B70BA6108AA111D656FC97A@CO6PR12MB5489.namprd12.prod.outlook.com>

On Mon, May 12, 2025 at 01:22:01PM +0000, Lin, Wayne wrote:
> It's due to a newly merged patch which adds more logs indicating exceptions
> while doing AUX transactions. These exceptions might be temporary state with
> the DPRx.
> Will give another patch to adjust the log. Sorry for any inconvenience.

No worries. If you want me to test it, lemme know.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
