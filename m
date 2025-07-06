Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08BBE5E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833893; cv=none; b=gSeZkrUVNLkQg4IaCJJ+uIjMYcvevQz6igMrcZf29MyJkykTJcWTH9uiV7jxhOht4sFtm4nMavRCkhCstX4r2l9GFq9kAsAnZlkUSTeNEHzfOJ/er8D0cyhjcO3MDZ8xYZsUnv6b8+dATFp03RztpIzNOoCD49YcBfpPDG+GAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833893; c=relaxed/simple;
	bh=gcU+UcYp/914LtP3LulC00fYo+9oiTUvJrVaJpNjKs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNflHFqSo5WLoA3iN1qA76MpBQWElb2TXLxlAJRh8KGBIIp0/ZjPMMVztt240YJ4P1XN5E9oCkCqETw+ADjxpNw8a1eQpdBCOw9D6DIm1uON3znNg9NDie+pMl7ty8DV+Qa49FaRivq3I0irS1FOaeCDNNnaWJS5iOE0yQ6Q1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=oOkaxDBu; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="oOkaxDBu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9086C610CD;
	Sun,  6 Jul 2025 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1751833889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4VZQYg93SyyXK/wCT2Zksrf8X/INrnR/YJa2agpIGS4=;
	b=oOkaxDBup5zPxRuKGibrnPkOY5PLlDzenV/37ZtnXdXaAUq73lke9oCFQNx5dIrrRor9jb
	w10d6N9oU9GEsBqhZA63tkAXr+D/Ga9hemJlK7hZhfHHnlnS1Gtyb8t9xnSZPE5z/v1fJJ
	6Me11BCH5sHZnAjaFCOMz/1rQN3AGPjSboOsOVHynX72NV5rHD5eiDlJ2vDPyb9u+tnCmY
	0ofw8uOVpwueh1i0GWc+9LscibbW0/7JQEJIjpLwxG32Ou3yRzRzMj4T+O6MZBlVb2uw0F
	/JCWZEViz5HcuMMcSQGluS4cv/2jZXvPcbHywVrVGI6bLoIv6VJkaginIp1awg==
Message-ID: <cbb411e3-cdd9-48df-988b-04bb09268ebc@mixaill.net>
Date: Sun, 6 Jul 2025 23:31:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
References: <20250524145319.209075-1-me@mixaill.net>
 <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
 <1ebe845b-322b-4929-9093-b41074e9e939@mixaill.net>
 <20250706170741.GAaGqtXT99yYVoEmCh@fat_crate.local>
Content-Language: en-US
From: Mikhail Paulyshka <me@mixaill.net>
In-Reply-To: <20250706170741.GAaGqtXT99yYVoEmCh@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/6/25 8:07 PM, Borislav Petkov wrote:
> Looks like it GPs because CR4.PCID == 0.
>
> Looks weird, we need to check PCID support somewhere, it seems.
>
> Ok, let's get a common code base - 6.15. Pls boot it, send me full dmesg again

dmesg with vanilla 6.15.0:
https://mixaill.net/linux-kernel-lists/bc250_log_invlpgb-2-dmesg.txt

>   your .config
https://raw.githubusercontent.com/openSUSE/kernel-source/4552ba89cbebd55482508c4ba4fc290df58f9386/config/x86_64/vanilla
>   and the output of cpuid -1r
https://mixaill.net/linux-kernel-lists/bc250_log_invlpgb-2-cpuid.txt

