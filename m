Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8B320C021
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280214; cv=none; b=iyTSTEyCRSSyzY9p8PFvLUkG4ST11vxzocrigjg0kJkZ+5FBR5F61UkbJEiWW9gX8PkhQTF4ldjS5Hneaar+p0RoUgyaqpYO+OPFGgYB9cfG6DxRn4qM+jQj/Sk2q+MbCXb9Lq68q/fCQLpTqfrqciQlAMZwVAezsNkY3mgBWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280214; c=relaxed/simple;
	bh=m+wYMRgZtRrAYN02mEsXVuCunbL24R0MwjP+cjQKIYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf1hqpSLVdVrG8ABSb8C1KGMEEQVCizkvzrNSKfskGnRRSnLdXmFkF8wcPPzzM+rn03/2VsXJxlsOOxeFn4ZGAC3ZA/W2DusfcKdoYxU6zOVxViUpvPDPOWqF96zkDotC+jZwgwACHvOiM+RI1Z51lrAyRPd/FFL+oJVi2zpWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b3T0Szcm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b3T0Szcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744280210;
	bh=m+wYMRgZtRrAYN02mEsXVuCunbL24R0MwjP+cjQKIYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b3T0Szcmj51npxxLqLqo0Xly1DKbYLoYwKjn4eDPhReGElZ3sHRLOIRrBsSPjxERK
	 a99jeSZAEylvrPvgM5/mZKBlPxHWXPQZpfqbqFuEpTSynvFg6u3tb/Li3zhf3bQCpR
	 k5e9ePa0tuYbYpTCZ9I8l41VhbEbOHxFhwBkRWmG+RQB2t92efC+f7mr5Zr3EWp1wD
	 8D4REgCPcjzhWs+NUyikbeE3QteFUdQoEAjTQnX/PoI5N4dONRIcD/JT9ediN9EbXk
	 tbcxR1L5eUh2VEgwy+sVwa9QKTlImy4Iyy0tvCIscqRokq0dcScqlCF7thJFeIElbg
	 HfVJwzlmvWqYw==
Received: from [192.168.1.90] (unknown [82.79.138.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2ACC17E0173;
	Thu, 10 Apr 2025 12:16:49 +0200 (CEST)
Message-ID: <89108670-c48b-4713-9bbb-98ab966f2197@collabora.com>
Date: Thu, 10 Apr 2025 13:16:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>
 <20250409-accomplished-vivacious-ant-3c03c3@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250409-accomplished-vivacious-ant-3c03c3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/25 6:13 PM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:19:58PM +0200, Cristian Ciocaltea wrote:
>> Rename the reject_100_MHz_connector_hdmi_funcs variable to make
>> checkpatch.pl happy:
>>
>>   CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>
>>
>> While at it, also rename reject_100MHz_connector_tmds_char_rate_valid()
>> for consistency.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> In this case, checkpatch is wrong. mhz != MHz.
> 
> And since it's not a warning, I'd just ignore it.

I think it also improves consistency a bit, as this is actually the only
place where "[_]MHz" is being used in the file, everywhere else we have
"mhz", without '_' prefix.

But I can still drop the patch if you prefer.
