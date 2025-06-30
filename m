Received: from out.smtpout.orange.fr (out-74.smtpout.orange.fr [193.252.22.74])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A028BA96
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292485; cv=none; b=bLeFNscAOb4fINjBThfTsTphR+crdtUxp71IDPBGKceTN4TKM22Ef8XZYAmKnIUdo1vB+USmUy8qPSwpBPnmC9jy37JHFOPSwh12mdoZLAKFSO/LvkoUO4mPh5gf1Y7gj+NxExT5pdiqrPFZHJ53JmqjnAiMkaJYSexfkS7zoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292485; c=relaxed/simple;
	bh=OMyEy/eA/GfRiYd4uRro5rpWsIP5eFoRR/jEDjUYj2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0y6bOH+fLzAEVMsDBHZmkaXr1a6usY1kyIruV5Essp2oZfUR6rq4Tc+PrvIiHOLdMxLFOMn/nm0vFNiNCQvZJDZ5jaSnp02vW9sEbihzecvE+wFVAjt4tMzg/1W9+qb6YTTuBxlHfI7M3h726jTEPtKR/g8jSJqZYMnUvKg8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=cqVaIdu3; arc=none smtp.client-ip=193.252.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cqVaIdu3"
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id WFAduaqKfqZzlWFAeul3vp; Mon, 30 Jun 2025 16:07:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751292474;
	bh=tTexb+cTcXGL+gL+NpJHDf2kzqCBdMTVPHJ1Go9LRPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cqVaIdu3JspQ3qsDe/EJ8PiuDm2rb7Qpe379S9UCwkmeAREkS2yHItEeK0RaJp8ch
	 /5MGXR6XEAcutV+/knlIsEvTbcw9MTeRTjFJzp0kTFTbwSl09xRcxQi3DNop6tRkEG
	 rpPLh7QpxE6eO5+0B1Mj7Oqty771/D0oYrklhKFt4nhiMtuO9Snu8cYwQfiexHiTMu
	 GxswsW+5yxuk7GHkeAQCKkIpCRZb+B+eTAS5/SePITgrFhXPr+phQKgMCRgQNHLWOR
	 CXgE5sEdXrHyPbTpST56eueCDluApF24VRAcHYrpES5Z6C64oTvKH7S74PIm0Dszzv
	 NG9/XaQHS/GcA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Jun 2025 16:07:54 +0200
X-ME-IP: 124.33.176.97
Message-ID: <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
Date: Mon, 30 Jun 2025 23:07:43 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yury,

On 09/06/2025 at 11:45, Vincent Mailhol wrote:
> This is a subset of below series:
> 
>   bits: Fixed-type GENMASK_U*() and BIT_U*()
>   Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Yury suggested to split the above series in two steps:
> 
>   #1 Introduce the new fixed type GENMASK_U*() (already merged upstream)
>   #2 Consolidate the existing GENMASK*()
> 
> This new series is the resulting step #2 following the split.
> 
> And thus, this series consolidate all the non-asm GENMASK*() so that
> they now all depend on GENMASK_TYPE() which was introduced in step #1.
> 
> To do so, I had to split the definition of the asm and non-asm
> GENMASK(). I think this is controversial. So I initially implemented a
> first draft in which both the asm and non-asm version would rely on
> the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)		\
>   	(((t)~_ULL(0) << (l)) &			\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
> 
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
> 
> and so on.
> 
> I implemented it, and the final result looked quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalised to u128
> integers, whereas after the split, it can.
> 
> And so, after implementing both, the asm seems way cleaner than the
> non-asm split and is, I think, the best compromise.
> 
> Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
> untouched. While there are some strong incentives to also simplify
> these as pointed by David Laight in this thread:
> 
>   https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/
> 
> this series deliberately limit its scope to the non-asm variants.
> 
> Here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-9 (-4)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         352     354      +2
>   mst_stream_compute_config                   1589    1590      +1
>   intel_psr_flush                              707     708      +1
>   intel_dp_compute_link_config                1338    1339      +1
>   intel_drrs_activate                          398     395      -3
>   cfg80211_inform_bss_data                    5137    5131      -6
>   Total: Before=23333846, After=23333842, chg -0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)
> 
> --
> 2.43.0
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

I didn't hear back from you on this series. Are you still interested in this
cleanup or should I just abandon it?

Note that now that the GENMASK_U*() are upstream, I am done. I think that it
will be better with this clean-up, but I do not mind if we keep it as it.

Just let me know what you think.


Yours sincerely,
Vincent Mailhol

