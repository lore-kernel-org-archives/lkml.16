Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C76201278
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960959; cv=none; b=R6Rsguugru9GlXsevavCKxZ9yoplaoL4PO+j/DYeGQPohHN8wFO4WiMR7kE0od1kAbmdDdYt0TQkBvotiSDfhJhG1iHHyI4jTZcIwzJxif7uiSXsT1S0LKHVHu7xtJcPneenFeSyYvKF4ae6bW6APvB0YJmEUNLZ5kuNmlc8J8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960959; c=relaxed/simple;
	bh=cK/F/XRWVdGgsrv0imtZS1Am8/D8n9MBxKdjORBtKh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOtSo54kt1VBete+Kcne5j4U68n14IkqTtG7rkonu9LhsXuFMU4sUrhsgAaqJNSlJS696lnPEODTANybhMkpa1fMTEAWxrw5Z+rDD2lnsQZJ8Q/N9nuU7WSu2nPknDXdvmA30FbSrBp9LbvEP8gTfeWmrbyVczN+qMzaE0TX9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qS6LrOFc; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qS6LrOFc"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ea58f008e9so1084377fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750960957; x=1751565757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
        b=qS6LrOFcoGJPol36dCkR06Sd3/5yY48D85PoxmviiUjfbenRFsTQB/C9kQvoEfX6Su
         5b67XJ7u1abs6mlgQTjKdFkqzaYjgQ2B9SfShNebj8Q8uTy1bVcg7jbpVXvtGvW5wZjL
         DjeDMfb/S9w6yK5TvYcLd0Kw8AaxTuJ8xpezxztzhTOt07lsF/y+DPTbhm0KSPjL0wet
         rIajgtL5uYgXkBV6XFW7tqndBgk7ht70gAbWag1YAG3jPRNiCzxEpFlRaUbQ8eNoMUvE
         iQU9H36Z+RhlNzVl8VZbKVcFK/dXqCWZfg5KqaV+nPVuwl9yUnR1vgNBdZ+t16UuvQap
         uQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960957; x=1751565757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
        b=Ne2i4cWhHhlXOXSoIMGmRk+qgRWJfGjmcVm5yD+rIDwC9Bx7EntbrNBww8rgxBVy0F
         HhPNcU6TIFWgJPIsyaTP4W95ZI6iZlsLP+9DqyaGAskkNp2L9hMB06wqd8JW09NEVsTl
         IWd07eZpkft00S4uiEDPBP8/N5ClfLASWYPo02Zla+nlFGcXLDL0EymTZw+zXrg5rxi1
         uOf8j7UK7jSKXQc/j3NaNrme+UMzP8NYjPlcSYc3Bt2y34SEb+2/zpRBeOA6eEelu8mC
         HIQvuRsrJi1CyPoO8JhM3fTgc8xQoljBJJe1FAarafVT0576SS8+YFymrBPyvYujwQu0
         YExA==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ+wGcZDcF/cM7LkQI0Iwf4q3aABavixizpT5ItrQWVVAVqTdxyzSHJN/LZ4BpC1vt85fcLXlB/r1iB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfsYUlooq6AU9TzQIOWCru6nuK1BjjDpcJ2s8TTtsKEv7iz/8
	nLmwSe7PoDZGQutgBmHtf6U8YlyuFETI+BAvEwPxh0O8bRIK/owHkWONVwgsYHeWiWQ=
X-Gm-Gg: ASbGncs2bQuEX5cNKajQcUmdkfJpEa8wBuQhlyMgIXhVzfoKaHGO9AfxVLStUXqTZI3
	OyEmWVoGo2c1xreIpX25IbdunEmOYuRiQ82Ia8E52o5c+dY3pfAJ5+FWHp1DlJ3UEUYNSvk/aeI
	HWx4pofoISu/F47LFXk69h6B1yZ8MywVmtJo8N8Sk2Fx1G7B22P2rUpTJNpesdjtRLgTtJLIgZ/
	snH0vi+SRnKPHr2YKC1+BNS7UxBP6DnSiwUj5nEIXvEpdWqyCdKqXypVoSF80R+tZEhoWveYKgM
	kP9wMf3cJ3yre1QidBAI9f51fZUtvzYHIpTT+h6/+Dyi9kQyzEbl8BCud+HgzwkLeAoa
X-Google-Smtp-Source: AGHT+IE0Wq2OGy/UBABihaj30tjkXqQd3OF/6SvLXaubvLuwAxvs/RkGqwkr/Rqy+NYKM/SPFesEow==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id 586e51a60fabf-2efed4b5be6mr15093fac.14.1750960957043;
        Thu, 26 Jun 2025 11:02:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b0cf0sm453080fac.29.2025.06.26.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:02:35 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:02:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <407addf1-4cda-485a-83a6-5eb2f6d5f7a9@suswa.mountain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626172412.18355-1-abdun.nihaal@gmail.com>

On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> In the error paths after fb_info structure is successfully allocated,
> the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> freed. Fix that by adding the cleanup function on the error path.
> 
> Fixes: c296d5f9957c ("staging: fbtft: core support")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

