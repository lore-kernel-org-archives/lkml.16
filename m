Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD22DFA58
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740115; cv=none; b=iL8ZPCTGlrvdznISb9sBZa6VeaL4hVm8IKIVzJ6nwMvNdDmiE+9jc8nVfbxfKPb45MwexYbISh3MVcgl7SXeHg6zYB0FA9FADHDYcU4g6YgCZM7a8kPzbgc93U1OPzAZk3HwDOgtRme9tHptQzaNQFHB7GBjaKkAYlBvYJsAX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740115; c=relaxed/simple;
	bh=EZkcBzEwklFYHdA30Mkd9gwwJhwN+Uhz+aWzVBgHtOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrRnRVr+LkQFUtyrKXtrtmWT5f9Fb8lJnE6fo9bx7Cet9gH1xthO0+Y1KgP3oYmR6IjvLZQqXX+h70WmOkMSz2K9eUpZrsDc52jA2YQIKKPC6PCwSrxePNR2CdZSQ/1yv/PLlI2LZm+btggm+HUc50wlSZOznk7qJczbrK+k3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ajwELetX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ajwELetX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 708EE40E0242;
	Tue, 15 Apr 2025 18:01:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TeArVCvk0sca; Tue, 15 Apr 2025 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744740104; bh=iWWIR36544IPsAfZOkt4jW4spzPhPRLmPKIHd6pLcNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajwELetXOjJ+J4On6fZN6WsNzNE6y/rt36kjidyh5ffA/xS/CArfWBwnS0/d2d6ns
	 ep2w+IUdhSiFK2VROdsFsLNlqo2uOzmyg90Qa57qik8QB1sl8r31VvdH05kt2RJWPo
	 Y5t/F7feb5f9eumIFDCpg6qfq3SNMBUfSz2CgzpVLAd2FN3DXUHVkGGrO3VLzbX20W
	 Ze38YgAA/0XzyKwU7QU5XAOY2Rt0ACIdDc6bVAH5U+Pd3wNWyw8o9sH2Pe24eABMJl
	 UfxuP6eBb8B8o2xJwfLMhLWrzWq7F09M/4UiB+07r5P5QIlD+3S8lfz18R2+hOO21U
	 K7UPcCMrfIMxZ1gJtDLUWjnpuZfcJE9orLWg8t21XmPSZbQ9ktlZcvnUOxBurW2X0V
	 bbHe91oaooTE2csskWibNIpWxN+SZa8zTuYHUiaaWdZE9AqUZSZv0JSxEE7TKAdxZL
	 6eOygf4ebYruIz1gzfxZIPzrmGWZENC704j0ePUJ/9OWqKn+L+H/rONg2lVD7/56Bk
	 UWQX1YJehKVKHnh2jMj+oI5q2/kkQI89ESEuH4q/q8d+200yf0Y+7TYOAgOEkEh4NV
	 oBUnva1D/AP8fYE8oWElyPMjaqqKazO+sQ+yxX4WuMToq9Jo3oxO5wMw/x7vFIxbjn
	 4Ifzea7Kr2om3gvD0CdK4qq8=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4464D40E015E;
	Tue, 15 Apr 2025 18:01:36 +0000 (UTC)
Date: Tue, 15 Apr 2025 20:01:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors
 during kunit run
Message-ID: <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>

On Tue, Apr 15, 2025 at 08:25:09AM -0600, Shuah Khan wrote:
> ./tools/testing/kunit/kunit.py run --arch x86_64
> or
> ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
> 
> The tree I see this every single time I do my tree testing.

Doesn't reproduce here:

# ./tools/testing/kunit/kunit.py run --arch x86_64 > log.00 2>&1
# ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 > log.01 2>&1
# grep -i error log.*
log.00:[19:04:52] [PASSED] error_pointer
log.01:[19:44:06] [PASSED] error_pointer

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
