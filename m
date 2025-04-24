Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7201C84A6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517944; cv=none; b=YijaCSE5KcMerX62orReoKXmbnpgLf763PsvJ7sAkw9ZyILE6NNerG7F4xHl4lHuOXv53B4N77505YXslHgaRlz9r5/twTucV9lK53ExWP5kAWoiFqBCHcea4oaP0ZL5ZaYDBIYafWkqEmxvkn68IRKiHA7xRRDWClcogAoRBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517944; c=relaxed/simple;
	bh=z5KtV37b9MRSMTCjoksC8Kocl522RSyH2oJ82WBKUCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snwneffssnbQc3k74/tFnUicD28KKDEO7yztYur3VQGnFKVHdreKLeGb3de8+8MQhr3nFbf3rx0j53ObTlLhIZIn/k789lVoEJPhqctED9vvdbXuZnTgIM8zce4mxtBlzG0H5Epb38eCLe72u9R9QHp26addLzu/nJrt7mN8aS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd+WXSSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd+WXSSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAC7C4CEEC;
	Thu, 24 Apr 2025 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745517944;
	bh=z5KtV37b9MRSMTCjoksC8Kocl522RSyH2oJ82WBKUCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fd+WXSSlpTayUciOk1TqPPi6JDc0zF0QwAF15wqX+VV+y4RxMvdWc5G1DNqcTR71Q
	 4ebLuBeVpxfRooBycxGG9KQ/I8yGmVNIpzUnQdDoJ/2YB5/qVmucr4kjM0xQDrEx4n
	 HtQN8qZYF9KDGjssSSkMLsJQYy+ySODSWKF2iHwckWOmoeIZ1dKuWLrEVyxfTEC7Zd
	 8wR99pd6B+80GChtGegoGK9LWbahROo87qVHc7Wy5ikdAn8gvHBmxPzhzwt/pqRUWx
	 HYRCFh+iAhiPYNotv16KLSs2qDn5EMqjns91BR+vvXUQIhoutGTaWCI6hYd/nihxOh
	 640s09g4GAIrQ==
Date: Thu, 24 Apr 2025 20:05:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH PoC 01/11] x86/linkage: Add SYM_PI_ALIAS() macro
 helper to emit symbol aliases
Message-ID: <aAp9dMyCJ982GvKY@gmail.com>
References: <20250423110948.1103030-13-ardb+git@google.com>
 <20250423110948.1103030-14-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423110948.1103030-14-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Startup code that may execute from the early 1:1 mapping of memory will
> be confined into its own address space, and only be permitted to access
> ordinary kernel symbols if this is known to be safe.
> 
> Introduce a macro helper PI_ALIAS() that emits a __pi_ prefixed alias
> for a symbol, which allows startup code to access it.

s/PI_ALIAS
 /SYM_PI_ALIAS

What does 'PI' stand for? 'Physical memory Identity' map?

Thanks,

	Ingo
