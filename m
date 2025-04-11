Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02527E1CC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360351; cv=none; b=oRSNwNj3+AmMmA7kCVPaCo6T2M1DoxUG8VRF1O7BgmyiMXjpPkCjQ8ZBuAfLAwfv1RiuNPIelVAj5C0dir+fKC2vJpYiWeds7UDDEC/pL1onqpYXTwC0odLCXbWeK9H8A8FyCQLYay+GyV6OLKRfVTZHE+awz2/1ImTnjWsagjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360351; c=relaxed/simple;
	bh=jDXgH9UOU6hxp0nNSex6a9gkLQoHlU/faUOtfQvaxI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBgM98ggD1Y+U1d39jjESE/36PB+PxXwpn8ALIGZjbO1TRc7V1tf4HINZ8U3aDNuiLfMhtfp5gnd/BpPiJAPXGVN9EM+Pho4DBnyCoi95SV7c1YSleAO2+cYeCAlEbc2YL4mJnXvRpAdqS6zT/tWUUODJjJkEvB3RVqolPVxPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AGEwTr5M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AGEwTr5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744360347;
	bh=jDXgH9UOU6hxp0nNSex6a9gkLQoHlU/faUOtfQvaxI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AGEwTr5MjkPRpn05kVhygBv1XSLJfkqASuXh75Ac/qlbqv7D2aXUl/WlenrdHvH+J
	 K3PBy9HY4NpnUOgRHL0Lf3447eMvXN+0w4rxNu1AAg18ApeVjwtm9F+g/8K3vdBbqV
	 /ptaIWd210ap80ZNEMpXr3gCM/D7cCxsg7UbwYPxKf4jbklanCx5nVOcOqsJUdN0iu
	 vEfnnmWQ0MC7RyfcN9YEhOWK9tg+yuzAzqzmxfur8IzY/HRyadOIAjXpkcGSGUDDoo
	 sQwcMZUmheIDdPRdPxXCis2oBPJjoBNZF7B97SyDAFHTGYUSary6TtDOHs7lvaDWND
	 ZVd2XVwvb9aVQ==
Received: from [192.168.50.250] (unknown [171.76.80.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E756A17E0EB8;
	Fri, 11 Apr 2025 10:32:23 +0200 (CEST)
Message-ID: <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
Date: Fri, 11 Apr 2025 14:02:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com>
 <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 11/04/25 01:02, Dmitry Baryshkov wrote:
> On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
>> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
>> exit with a non-zero error code while configuring them as warning in
>> the GitLab CI pipeline.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Use LLVM to build.
> 
> Why?

We are using LLVM/Clang instead of GCC to avoid architecture-specific 
toolchain for cross compiling. This is done to make the script generic 
and run only kunit tests. I will update this section.

> 
>>
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

Thanks.

Regards,
Vignesh

