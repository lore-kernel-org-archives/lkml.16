Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898215A85E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744171472; cv=none; b=iSxZ3fl5y957ai2D97pNXN5W/wW84joqlTdguUWjOOHGGfMFQ26nKX4b7xxzH+hkiLATcktJHk3LrPNGf6klU4DY+Z7ARCKuJWI66E2WGB5bOykS8Vn/PnEeZhoJGA6dK4tJIpuJlvOBgkt/VTeyPi//nZ0JOypt9bHQk/huxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744171472; c=relaxed/simple;
	bh=yCu93LjqeX2aYztx3cMVxU9CSP/hvv5zO/BxHil2Ghk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ices2ebvoil8ZgQo/+E9yJweoiYXyEsFNraNDnhA+yHhC34OFLVVvsRyaic/64AaTxvk55kBK6gDA9tiyS+9YFJv9kpYqxAdinErjL0jBD1umE0vDN0cCrlzBB1bg3eWvikd/cHQ/qDg4/6qO2PunzZ750L+YJTnrtlvUgTh/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Z/Wzxxpy; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Z/Wzxxpy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KMy80c3f8tEJeFyo9se2EyPspzDN/qpz4L/88YxV2ng=; b=Z/WzxxpyINanl2EsfIlsyFuev5
	SIbAThSmAa9X21F0nhcUC1N0hxDY0QhCj2+G4w/ENuHe3y0HRsTp37pk7nGsa3bvnnkdzZLeOweVO
	+L+F1RQRGPvyFHqzdGgNm51jbAsSTGAxUxR+WqgrPx4K4vnv/V2XtpMYnPFO9L13C7iASIgkPQtyr
	1+7QzAnVi6cGgHWoQNliHWE/ED832NhzHZo7gqBhgOEWfIC2TqBO7yQAFl0FR+rGhm0Xj2JCd2fkk
	daIZu1ZL9ZsFt0qWyDLIeAZwJ47YHCSazcWsdJLQ4BuXgJWxerkOMhyKwQIcdLgMXeyo4M8aD6FEa
	V6xVQ/Zw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2MfV-00Dmp4-Tt; Wed, 09 Apr 2025 06:04:06 +0200
Message-ID: <1d7eac7c-e0ab-4208-b003-26b818478709@igalia.com>
Date: Wed, 9 Apr 2025 01:03:57 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string
 array
To: jiangfeng@kylinos.cn
Cc: mripard@kernel.org, christian.koenig@amd.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, raag.jadav@intel.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, airlied@gmail.com
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250409014633.31303-1-jiangfeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 08/04/2025 22:46, jiangfeng@kylinos.cn escreveu:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.
> 
> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
