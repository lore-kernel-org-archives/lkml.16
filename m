Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B07D182BD
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739067087; cv=none; b=LabteaKV7I+3elNar+hJOiutsiAAWNrhYfCJkDbev89qqvzVh92avvrrP3l0i6pluDN9HoKrBRyurI2crMajuKzIrsE5rt6CHHavU5c51YbbeAWKDXeEm5PGybBhLapa+21mIbzfIfxaPkQO3Nw1iFp9DkfRTnYzPG0h+lxO0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739067087; c=relaxed/simple;
	bh=bLbRU0VUteluQrdSON3zhelkX6NJiUzaSdHHKT2ZUc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBXA2xcer7HyE8ZeQ2eBguvzZTr1AbLvuYLhFX0DofQj9kpIQ8IVHj/YgzLRaGoqxdjawIPGkkkdfcFobPVj4yrhuPemKlr7pArXX3lnnOaH3IUD9ASAhMp6867WprntW6WN0dM624ruh96GkDRK2sbJh9DmiM/XWF0ab3EyP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysPU03sg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysPU03sg"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307de8f18d6so24629531fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739067083; x=1739671883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xAVhVop2aTDGIjV9AdqhKriCgeATAkESM8gozGS0rY=;
        b=ysPU03sghgqbtAMLQINHFRCQC2EYY7wMsrDo0nZdBS6jf+PjLHHQS6osivkMG8/2u/
         dW88bPQM8CHqKPIz2OYWBTOitHXOn7dCDbC2adhzG7EuQJGezjvkFLpR5Yxo13FpDZt9
         JHRDuQWCqbr84VtYpTln8v2dYJzzfT+DmMIu3C15oixwfxeXMXGiha00SgauRirSmuxD
         cesjMJtBegI1aSU/K/qilEBi/oI01lY+4Y09Xdm3/ufwEqoVdF7eyQTR7dl/0oUGZul2
         ErP7JmQTLGdXmyvK3sbOmbFDfv0/6Sso1mZxZ8VqPSMroGVaJ87bbWdq8JH/jazzG2x0
         sf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739067083; x=1739671883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xAVhVop2aTDGIjV9AdqhKriCgeATAkESM8gozGS0rY=;
        b=Oh2WqKIdAvH4Pk8pRKbKb9SgQGw+ecc7tgSOmv3C9P0YoD7lQ17BIW5+5zSgUR+jN4
         qISw1+H2mRimkwlkmzT7dv2qiO8eFeaAZAjSr3CJjmfM9zaoElEZgbvR50teUX8wWVEi
         oq3vEYc6zBVDJzvpmO9uM9hyBBmtEfsMw0p2UKiNr4imAbpNAZwRUNTzGb+g9JIIz9i3
         6Ser69fuCTe6pcYvatOmoSCipLy0WNb9zU4kM7dLOUsoh2bo+DvKOiA97cMGhwLIh9Ki
         MNwkowSHY+L5JRAmC/ZM8/a1LF+3AzP9ueUqGBRp63kt+2pVkMnA4oxPObzxmyC5bxXR
         PglA==
X-Forwarded-Encrypted: i=1; AJvYcCUzKNIcHJYYNSDpNjVzdIMpByIeHYWUOZbNUe0X8oN+P1tIBCt+UODmI4/lhjY3KUeT3EXx8dmk5EpgM+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvVtJW0egjkVvzjgcGjlpoA2Ql/cT4vFEBCI/xCPlajEuqgpv
	4skFgbTGLNGnXeV4qGvnztETD95cXuiOn04hqaqv5HkQ0j7SAfXfgbyWm2HE5qs=
X-Gm-Gg: ASbGnct8eXq0PkiFJUvymkwKVW8k13Ni+y+Pe2GICPfMXr8oRwfVan4IJfS4/S3fPXC
	8Aal12b/yJxjeAxuy38ZhQGIU7jkqYuzuTMI0sYjWSfO7AdbPEw9H0t+sefBuMSClRaS4bHmFhR
	SBSWX9fu39BdewyDHULeEqt+SCGFG+B78JpjJXtmTYLJUaz7Sh8bCiBbbc2PZI5Bg1wx7XrAUg4
	GHX25kf6oHCXZLrm/Fcq2laFX22d23RIv7y21WxkKwZeBqzGMbaXT4h3T2ag9M2lCZ3t81ydi3N
	B+Jo9Ypy08VgDVHNGX/xDCoczE2cjwwFc2PcTIy68He5qAi7iPb9PCotMSX4fbKxAzzJ72s=
X-Google-Smtp-Source: AGHT+IFs6OrEdoSwUPTIH9fVG0mx0aqa7qNKEWV50/9z/Cggn7qt0oX6DOfpW1sximTShUpmIGidTw==
X-Received: by 2002:a05:651c:546:b0:307:2bc6:5eae with SMTP id 38308e7fff4ca-307e561ccd1mr27868491fa.0.1739067083535;
        Sat, 08 Feb 2025 18:11:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ea506dbasm448771fa.51.2025.02.08.18.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:11:22 -0800 (PST)
Date: Sun, 9 Feb 2025 04:11:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_modeset_disables()
Message-ID: <ktlxm3pzw5n4fkwzocz3itcl33pv7z5rfrngema47pyal3x46c@5k7knomejiz3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-10-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-10-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:38PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_modeset_disables() disables all the outputs affected
> by a commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
