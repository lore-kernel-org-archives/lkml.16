Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1581A01C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938526; cv=none; b=BqdrwfO5tarGtKNfNyHaOBTjQz68ltXznHQT4szKFtLFyGknSSwRvXeY4rz7uY9yY+IBwflVMbd39JDTBcv653OzUy70D8uGPsEEeC99/SsdMjfezs0z7tnChcalY7WQZaDL2B8UoyHdSmPMSSZH6go3NNsPCVuAGx8ImVJiSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938526; c=relaxed/simple;
	bh=NF64JsuJIWIqZ9I8k79mB0WKf9Zo8IW+FV+6nEFXaHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyWblxkO3ll1G4ZRX903TEJWXG6tQXHgduTE5b5mPp/VGw7QhAmfxLCJTlErSSSGRE1N5uXjL98R7YFziCz8fXxCmSUR95AwN46uTPKyjNQGq60WXRyGWMj1DpO3ALELYql1iaxL5tgfcJimGtx9aN9bnYnOvwPcnhRjbeVHkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jrzrLSLR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jrzrLSLR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HwwUQzl2D3BmUBvszgNuv2TqAHKnY1hIL7TIDiTl2xw=; b=jrzrLSLROaYViBzc8snOQcBTBq
	CjVKgSO3BcCNtF+Jay50sRDaoRvdGQHBSzVVeyqB54BrKlF3mF9qxlIHnZvNfUiJr/GU2gTtNv1TT
	8Z7ne2TmuHAqcfbYRSUpLVeg4fAIctj+/KlrcKelFv1+Pb8CKShSaLTUnKwz525fVNwRI+4WDbB+D
	eIMGsvfJypwHE/BK2KGIT7IZk+kqqwybhqcLnQOZeGu/Dg+cSfNpaAj7llQI39sQk792eZndhlrBS
	umftwv++YOSAy+Om5gRt3t9nZi7My8D3cvPoBpd3oRZm7x9fIH78QDafyYi/Hk602CH6UOQlSsT4+
	ozIPB23g==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uIAee-00BqOC-DY; Thu, 22 May 2025 20:28:32 +0200
Message-ID: <df1d45c0-60f0-4850-9324-ab52a3f7f8e1@igalia.com>
Date: Thu, 22 May 2025 15:28:27 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250509142627.639419-1-andrealmeid@igalia.com>
 <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Em 12/05/2025 03:52, Thomas Zimmermann escreveu:
> Hi
> 
> Am 09.05.25 um 16:26 schrieb André Almeida:
>> Replace open-coded mutex handling with cleanup.h guard(mutex). This
>> simplifies the code and removes the "goto unlock" pattern.
>>
>> Tested with igt tests core_auth and core_setmaster.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
Do you mind applying this patch at drm-misc?

Thanks!
	André
