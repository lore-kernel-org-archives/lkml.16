Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F926E6FD;
	Wed, 11 Jun 2025 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669479; cv=none; b=JylhxF+sfjGJLmKNIRd42Kqs/GZUr3eE6RQ2w65fv4c+VDP1vhqCwR83zmC9zIdGnVDpXlo8xfKhJ6maNyPhbG8KpTsimZdhEPlGCo+buKBFkGytR6A1KGpHWgsqaqFKjEpFyYuCVojIq0ob6VBX8eddzwLOVtSWd1b/uVTA19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669479; c=relaxed/simple;
	bh=ixMFPUH8G0la89VryFZZwZQQgubi9L+Tr/reP0V53i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqfFR69GGFXEku4e7Nk7+QXr2TeXPiSODaNtVMMuPr7VjMIPHDjLSEM7oopd1QPumH1OwwpYYQKSqx9sD9wuiq9veaEqRODrQ4biJf9qEFxTb+B+N0BOxO+5MfYGWl16qxvfKVxXuQCvB8i0Lr3OjQQKluDPlbgsJcCzguGItTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6+jHSbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6+jHSbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5CAC4CEE3;
	Wed, 11 Jun 2025 19:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749669479;
	bh=ixMFPUH8G0la89VryFZZwZQQgubi9L+Tr/reP0V53i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V6+jHSbZf2qJ30VWwYEhPQo4xh+oakbO97KWLTzBkqRVFPOKjTpT38tDFJlzgHQUv
	 i5SWQYgEUAiJIJ6+BmgDC+MJMfg+M8LidmiLu+nFmInp0g6ow8ABMzU3dNTxv9WU1w
	 MW+0uMLguy7QsEfubvvKffhSsvz7oB7Hdk+fD+5U4VMhZ4c4NL4iG0f7CA7MqEsUKl
	 I0UEshpoJCQS4NR/TCJif62mQ27Jz7zn6sOId0Rmrq17MuexRS2bdeQ9xuhGlDTfJX
	 5jXr/R/bOf8Zl6i6dm6OXweRyrEvDLYkYzSCfDu4nIurrck+hT37gEcq4P+zAlGsa7
	 +rFDXUr2fu9cA==
Message-ID: <5b6a642d-b9c6-4648-b1ab-1823bbcb7ea2@kernel.org>
Date: Wed, 11 Jun 2025 21:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
 <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.25 21:06, Sasha Finkelstein wrote:
> On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
>>> +      - description: Driver-opaque calibration blob
>>> +      - description: Calibration blob
>>
>> Like Alyssa mentioned, this description also raises more questions than
>> it answers for me. Do we know what these two blobs contain or why they
>> are two separate blobs?
> 
> At some point in the gpu initialization process we give the firmware a bag
> of pointers to various stuff it needs. HwCalA and HwCalB are separate
> pointers, and they use separate gpu allocations. We do not fully know
> what is in there, but we know what some of the fields do and how to
> create the blobs based on data from apple device tree.

I looked at the driver itself and there are two comments related to
these:

HwDataA: This mostly contains power-related configuration.
HwDataB: This mostly contains GPU-related configuration.

Are they still accurate our just outdated leftovers from an early
version? If they're accurate I'd include them in the description here as
well.


Best,


Sven
