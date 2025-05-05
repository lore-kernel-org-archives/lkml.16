Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055E1A5B92
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 05:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746423349; cv=none; b=GMighkHHWMOTYOvrMO4VD8+jb0++CGdpYnZQ1m3w+kXGLmcyxQwSBF6J8nvRZsouOXkAqY1qELJ5N1gFHotF+MSzXefcRNKH3LVh4KgDLMY4MUwETlc4efToqVXHT0v3zhuQeYoB+3bBZdqktY8sYeD1LFx29kEQ/Teu1FAZstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746423349; c=relaxed/simple;
	bh=TrFyW56Y2m5djMks9z2jgPyhCwUwerbPC9JwCgkCr38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kyuatw4eLOzJ+Fke1acz3Qylxr2wQ4FjW1ICCVo4HmqLdvDjRiXP/g9BbaHzKhmzDFvEiSeWId+b9TfegUI0eQwxxtwTXeBHuhK1mQd0oOfxp48LfGf6dD1Tjz/ZUKBR/Pmtc/G3v1lNzkn3B4u7eAqmxxYZUdF8WAdxm22X52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usXHinRh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usXHinRh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso31094455e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 22:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746423346; x=1747028146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=usXHinRh1rfgRaTqRd44up2xKkM3JgSi2Q0T03gm8Td5N2pq+Y/zFfVUUGLqW7Eu7L
         xPEpvgVOzd0L8v8a4e0AHPOm0jLS7uW+UWt57GNZaREnq6dubmvlCG4CUTl8+XoR80my
         DUeY+5lBYbe1WCj3fOZm0OcMmowo+J4iASiR30Au9gG25pAeC8N1S89nO99ecicHFrZp
         YMEs12BeULXs6igIWyhUsFWHJv11g08Emcn+F3Z1E2lwsWWqrrSb0jUghu9Eb6PODxSk
         rtxap9Vfg+rATJenhchqBoUvSUMcFY3Rl9I2eIOUsFSegXg/kOFswJqhiRbKCXCQpQzi
         XG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746423346; x=1747028146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=v5YInSUwARzxWNuR6u0XIBcgwgkCl7HbktYAggtlVxT+3XwRMCJw8vEUGvtFWO1gwt
         CKGiZBr/eTN79/TnM8rfzLR0hTs71uyaXkurnJiJ6XE8C2f5HepD6hRqnEC5faVq8Jxc
         B2DEZY0sCkCqz+kOMCUDV9F9BTEaeFdgdz9+F720QUQCIpOQ2rs9lQb2GggerU5q6K+s
         rtnsPfq7jRmpQK0ezbyTvXBk/m7LPA9CUH0yihWxx0plhwWHgFDmackOnBJiKip+CpLj
         cW0GFSCcn8EF4pdhL+0OBr8pWOfdzbcmQ++xQ1Y4DO5uMTQgw6NOqLn2hfbtT8EkJvE5
         KoJw==
X-Forwarded-Encrypted: i=1; AJvYcCWy2AFpgfGucQ5vUYxqhEBt1gvELfH+ucdWU0VJ3e1Lseke1pFcMDdm6AMgY++EEi1QfogKcNZmZSufBCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbmJPDtSRVBELq1K1UowZfD6kHCetoqYkAMvq8qJWTupJZWQa
	FeE4SKJMa8Ljb9GH6pFh4io50Qop3K/tDAS+7XVb/eCzR6P9S44tKAm/cLObZgs=
X-Gm-Gg: ASbGncsUjV9a9AqEnQKMpKarz7col8BrcfC78gYIrY31ZfyRxQg2jSXxupF/OfT/kiz
	80MGeoF7RzhA7+npIJpKftl/ppcVlin+1nW4CgHJd67Cj+BlCTHcxB5Jo47KF7WHW0dWuhsiT7t
	DlMFhUWkYywIJcgFvn3uDNgylHb7tP4bjqkdoU9kZYri7oBQs7ooUEd33AfSfryzOVJRLNHZtjE
	JZyhxqr9WH7FKBGcXkOYTfRGHz3l0ugJ2ZF71zkikfJByhZg0qyJdCdEvxWG64FEzXg+EnyKBf4
	jcFZG3Wd3iO0VdT3jreMFBwRTyw3gvQuFDZksCkIE5nc22H1Cj1f1oK6C4fxWu5kQT/KYlYUluO
	+7Mx4
X-Google-Smtp-Source: AGHT+IF9Cgs7u7g3N65e59enpUAXh9IV5tRS5n72PCqZAt3FK4OAibdOBXfsQEdn8nqmP06W58BwVw==
X-Received: by 2002:a05:6000:4285:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-3a09fd770a6mr3798232f8f.24.1746423345714;
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099b172a8sm9361125f8f.91.2025.05.04.22.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Message-ID: <c3a3ab95-0129-4cae-9494-817d7e2b49be@linaro.org>
Date: Mon, 5 May 2025 07:35:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: remove unused
 lvts_debugfs_exit
To: Arnd Bergmann <arnd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Julien Panis <jpanis@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, Colin Ian King
 <colin.i.king@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250505052502.1812867-1-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250505052502.1812867-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/05/2025 07:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When debugfs is disabled, the function has no reference any more:
> 
> drivers/thermal/mediatek/lvts_thermal.c:266:13: error: 'lvts_debugfs_exit' defined but not used [-Werror=unused-function]
>    266 | static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
>        |             ^~~~~~~~~~~~~~~~~
> 
> Fixes: ef280c17a840 ("thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
