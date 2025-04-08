Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133672594
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100797; cv=none; b=Qpj8zitBeiddS6OdsbIrMwzXgbClM6DytqqBIarQqosqhocROVbaYQ65qfbWjaxXUpCgqEhfsR46RG63wVnFDdkEf9YpIEFn0u9TSHgeyB8CIPq6LwrGytzJutSX0PrIMmzR1Lg5JrRu0s3cRMsYOTYYNL2bL0hn6dox3JWZB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100797; c=relaxed/simple;
	bh=sYVb49tTeUBnYvvmqq8FJYBk/cy/MQEUoZ4gX5PSDpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fK1odao1+BOEGzHzNSrkRMXGgsN+as5gB5IZEmEV2UrUUqul/rS3vY40Fgt7fR/zBE4DWvFB63/GEhf46fzQSHuj4XLNQsPh8u9u3ggM/pwePNztt0M40CDL05fETf6ohWp5gDUfM6oD88x6izXZbe9Y5mXc+DQJZ9zP+WUr9b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=BY4NRvtF; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="BY4NRvtF"
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1744100198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KycvnFWvB7WLb2FMk02JJRuq8Z8TQ1r5p1fwmK7UuQI=;
	b=BY4NRvtF8TGoqRIlOh7vqXec44FXLXMcGrQLgiSlHUoZiE1Bc9+uNECT0fDAo27IT+iXqD
	hOzTflwyN46+PtVNtVol6lKGo+7HladIctIV9TD8NXhvUHw4PRBDt9Nvt5wArpvnnpUnEY
	bdd8fzIFmrOyE69kfnvxNS7XwQ209IY=
To: alexdeucher@gmail.com
Cc: Jun.Ma2@amd.com,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	arefev@swemel.ru,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	kenneth.feng@amd.com,
	kevinyang.wang@amd.com,
	lijo.lazar@amd.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mario.limonciello@amd.com,
	simona@ffwll.ch,
	srinivasan.shanmugam@amd.com
Subject: Re: [PATCH] drm/amd/pm/smu11: Prevent division by zero
Date: Tue,  8 Apr 2025 11:16:38 +0300
Message-ID: <20250408081638.5295-1-arefev@swemel.ru>
In-Reply-To: <CADnq5_O+TMVD0B28Q6CgzhAi1aDR5ofjogE18HDXrJOJ1XwbDQ@mail.gmail.com>
References: <CADnq5_O+TMVD0B28Q6CgzhAi1aDR5ofjogE18HDXrJOJ1XwbDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> index 189c6a32b6bd..54229b991858 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> @@ -1200,7 +1200,7 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
>         uint32_t crystal_clock_freq = 2500;
>         uint32_t tach_period;
>
> -       if (speed == 0)
> +       if (!speed || speed > UINT_MAX/8)
>                 return -EINVAL;
>         /*
>          * To prevent from possible overheat, some ASICs may have requirement
> --
> 2.43.0
>

Hi Alex.

The patch 'drm/amd/pm/smu11: Prevent division by zero' was sent 
separately, not part of the patch series, maybe that's why it wasn't
accepted. Should I resend it?

Regards, Denis.

