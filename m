Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76918DB18
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660157; cv=none; b=NGbXRvxQGOhSTD3tkXsVucLeLlqXF9ich+Ymrc18RX81iq2tzWKd4tlNVGkdlArxkznjzGU6+k3I4qsWQDSPdw4TzPNI5xhRx9NJBn947boLxqlI7zXwATL57YHJsE2eoBaDAID0DwbyDs1aXkP5DxJ+qLE/Ozx1TdyqZQtXGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660157; c=relaxed/simple;
	bh=icMjSlKatgQx/TbsI4RIJckayqYv3CovYnZn2GdTQDQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YvoY5Il4dQYOAOPoWkLQPbEGGzr9u2iz24gm4A0IXJanfNVEfqcMZoD1RtFmh8/vBvavyH7tzap0J04bZubH9GKC0eJOSTHm8617n09eFMepTGUV5aDSzUQQKa/pbyaAueWNDUlDv1891f+/XCU3zLGPMAbghdycF4U7nB0Fl8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KWoFBuzK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KWoFBuzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743660153;
	bh=icMjSlKatgQx/TbsI4RIJckayqYv3CovYnZn2GdTQDQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=KWoFBuzKhUO2rIVo/tQbcH+RflY2dP9IgW9yhlHe3qg7S9OPrnU6c1fv5LE5HT1Pn
	 SWN8aPuycGyRZA+S2P+f4ohIx8nwVqTFFFHjm0HwbRmSiDrrr9xymiZk0dUzYMcv3u
	 knb7SGHinimZJoHcRwoVGwDE/59GGnA/jXGtrp/OowmflEUy6rsJRTxlPpJ0TsvLtJ
	 1r6OGIOzRcxY+5SN9OQaDJ+EkS6Vh6LJ9N54f+BkAtLjeW9G+OT03AZWGjzEugZIIh
	 cJr1BH5cYpvloYjT6Qt6RRQQyDnkuCWn9Sxt45KK7QA6sY5ZgL+K74dqqrA2W1vFU7
	 faGDcQipGjLkQ==
Received: from [192.168.50.250] (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E84117E0B0B;
	Thu,  3 Apr 2025 08:02:30 +0200 (CEST)
Message-ID: <544e78ca-4288-4d3f-97ce-0f8bda68bb19@collabora.com>
Date: Thu, 3 Apr 2025 11:32:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-3-vignesh.raman@collabora.com>
 <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
 <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Content-Language: en-US
In-Reply-To: <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 28/03/25 17:40, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:05, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>> Ensure the repository is not shallow before fetching branches in
>>> check-patch job. This prevents issues where git merge-base fails
>>> due to incomplete history. Set the timeout of check-patch job to 1h.
>>
>> Ouch - an hour is pretty brutal. Is there a way to unshallow only back
>> to the merge base?
> 
> I set it to 1h, but the job is completed in ~15min for
> https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18 
> which has 486 commits.
> 
> I will check if we can unshallow only up to the merge base.

I tried this and still checkpatch failed. Below is the sequence.

- GitLab starts with a shallow fetch (depth=10).
- Script fetches full commit history (--unshallow --filter=blob:none). 
We need this to calculate the merge-base commit.
- Calculates how much history to fetch using the merge-base commit.
- Refetch with depth (--depth=N) until the merge-base commit
- checkpatch.pl fails because the earlier blobless fetch (--unshallow 
--filter=blob:none) skipped file contents.

Please see the commit and pipeline,
https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/40a3fc31c2405f90f3fc3177a575a66a10b33324
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/73884148

Looks like the reliable solution is to fully unshallow the repository 
(without any --filter) and set a 30m timeout? Would this be acceptable?

Regards,
Vignesh

> 
> Regards,
> Vignesh
> 
>>
>> Cheers,
>> Daniel
> 

