Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8C3BBF2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743163839; cv=none; b=BdgGMw+1xw9YLSHZG8hjKx4TWT9CfUTO4wH1NwSolt87L6ZyUH294jBbeZUzftslHHIgSWpTgZ95MCiSsE6249DrfSyPTq2Wv6uJeF6ACbRxZeRiWxkzurMPr4cmsJIGdC2Ns6PFKkys7p2UrFnwWYJlnAdQwK9feqSOh0UKUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743163839; c=relaxed/simple;
	bh=YsEgAqwxWCjkg5XyBi0RW8U5VcBymAfTASedAi4c+W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNTNNUykCo+si0Wkyy9LqMWExD1SHUFUi7s/hva00grJ8nVTChApB8b6V/cXJSMIPbFgjvVIJ06R23lczew116IRx6sKxYhKt2YoGU+vCkn3QPX5SwHW7Q5oBX1nDUYJdGHcwjCLmKNX0PRrag3bTcVyyM1lyonggUVrARMUbcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g8GQpK1Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g8GQpK1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743163835;
	bh=YsEgAqwxWCjkg5XyBi0RW8U5VcBymAfTASedAi4c+W8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g8GQpK1YldVwr/ptBxWOcAiIdLv2O2JM1ZpXcDV3iGsw71MTzb9xjP5G8cWTauNLW
	 3zAFefKULI3dbZRfbtxOQPKdaUNtIUYrob7N8QIAiFJ8SZaMJLSxk+ANLPg/cEI3oe
	 txsNJIuagc0INGGg6TwOX3kilU0O/QtG4fXPsGdAP/FGVFUtSbAsLZBzzlmHwgy4SZ
	 IgGuyoImiH5zywrfRy3po4VzrKACH7Sle59ksl7vnsmrXEMUrJJIlQphVFcXXs5pKE
	 owXWiD45f/xdycsL53XwIbpsh/YrjYROllLJSvYLNl5YrxI7zhI+57MqdbqnWJCH8k
	 oZ4ONsleMaXQQ==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14FB517E0B9D;
	Fri, 28 Mar 2025 13:10:31 +0100 (CET)
Message-ID: <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Date: Fri, 28 Mar 2025 17:40:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
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
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 28/03/25 17:05, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Ensure the repository is not shallow before fetching branches in
>> check-patch job. This prevents issues where git merge-base fails
>> due to incomplete history. Set the timeout of check-patch job to 1h.
> 
> Ouch - an hour is pretty brutal. Is there a way to unshallow only back
> to the merge base?

I set it to 1h, but the job is completed in ~15min for
https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18 
which has 486 commits.

I will check if we can unshallow only up to the merge base.

Regards,
Vignesh

> 
> Cheers,
> Daniel

