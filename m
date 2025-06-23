Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AE26D4D9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697442; cv=none; b=iqT9Nse3K+7cF9SiWWx77S7pw8e/5wYifPLd1gjMEUZr5O2Q1Gb6LZGFSkVgC5+AdY6GmWq0uFQq4jdbh6V/tx3cVoLd96cIh039U9f9N6Iq9EvV/sWV2swH+yioJANZlFgalR8FMVMiVpwnS82tpkR2uDJ8TjZMmZZmAvO9oZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697442; c=relaxed/simple;
	bh=ZkbTHFqp4OOayCxB+8smrXfMGunG4i7REp6CpRVicc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Unb+dOdW0OKJBTqGK/nEnE+ndKGD+yrSbeu5281mQvvKHYRX0VknCnYnZ/FuYwtfljxxDpx2fRQXk3S4JkyvXnXPBkbifcb+tG/RRYc52sU5lqZshclo40HFN8BL7Ir/apvzOorW8jtvdND0LFNG1iIEGTuNgPE/a8GZINHsIfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku8Iyg+I; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku8Iyg+I"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso99475966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750697439; x=1751302239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkbTHFqp4OOayCxB+8smrXfMGunG4i7REp6CpRVicc4=;
        b=ku8Iyg+IcqdnO5AQqsV1QVdDD+nhidS5zt3y7DiMgm9nlECwOoGtlivScykeyd++76
         WIQX5ONWYb1b6yPVf0Wpb1QMFaVqv6MKW8jGtgq18ogaTyOV5r142a72HwO9V4S1a3ff
         Mwo9s/tajqHkl4ZranYx2KdCx41VVLLUJNi5kz9IHnh8PXXZNVafMNU1L5ZCGGhIWqJ/
         4xlsFzpUJwL0gNOXFAInz38T8uW/SnGEfnbNy0U57mgnGYQaMOc4T0camYg1VNbabCmb
         T8sX6HQKYd8sqY//D3IBvmuSlSj1QHQRLxiCPC9wHsBXCSHqmnJbjn677XU1kcRx2IEg
         drrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697439; x=1751302239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkbTHFqp4OOayCxB+8smrXfMGunG4i7REp6CpRVicc4=;
        b=qJVYL8M16oz93bgPJYgYFR1rA+hztJp/xpaw6Kwd9SPZ0XwWrxxVifx9ySAYFHsN7Z
         oW/nmJLfVkTvKvQyU5fJg0nK4atqaMBD7so1v0DfSdvWFOI8Ft0dzLRg5LrqnqNLG2fP
         LXBcKMSGAMFII5yG0svgmEmGBc5vr0linmMP3/ii0z8ytLStm0fGHq2Uj/+HlihFEgz7
         90OasXrZTJIa+OUtr4G/neueBp8uiowSdbx9p570P3pkM8hBO+8DUjsfH1/4gZ7E3zxS
         SUWnfDuFLBwmSiI2KBS98giT5ffOhcWuX0WfhF66o5GdNl0lLIdp8nfzVMeus+r5hBCd
         xbJg==
X-Forwarded-Encrypted: i=1; AJvYcCUF55uHR0zLJu5byGzrlbjvndEKCrx8hOC5R0ilTFtqgLrIjuxfyMdVN8ESxXP75anzqMCYqAp0R9ZkzbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYOghTBTYbMFsmw2DwdRcSoTTLLId9heFa6j9wybjgdMDgKWoS
	zR2EIHXQWIwWClYvDPNLzueEAQZEn3pACDwI0ZZ1YVoBzDad/7W41unc
X-Gm-Gg: ASbGncstP9J1cT/0YYpS4qGUEL28gF3wU5qkWC9s9Z4Bndk3ze/cnJt5ADZDbhlu1Sd
	zDZxshMb7qxXKmUZyQHQ+h84+XU6vYbeZt+dc5z7Sa6rx2dQorayMLQQaatsO/9X3GpHGHEQKTx
	aqNl8cCM3SMC6GrVPk54zRA/TeFPC9L/5cjIQ+PBJZXIoPsUiyGOojFvR8HemDy659CNkn0/f+i
	vhPXnGREyx6BlbWyVYSil4YY/oTpSk0W30LdhK4XiquTDRne9FPlHMJcLfHivULZLvaDg6SI0sP
	CIoYyEm2JKWTtqUfmgb7aI6olVaJF9WHB6C97FJ74ss1Y2Za1QxjGZpxeUay3Yney/Lp8PquCv8
	u344n99CjVcV+gZr/FS/yVLLoOu3SzbQJm9RUsjYNLi1tgKU8qjcGpIbjhphpGg==
X-Google-Smtp-Source: AGHT+IFjhAA6UeQ6iJtINER/INOY7ygvNNOjwHW/YCzhUOAkeneTAX3+lEeXKstulP3ywyDPHp9tkw==
X-Received: by 2002:a17:907:2585:b0:ad5:431d:fb32 with SMTP id a640c23a62f3a-ae0a740dd8fmr16761166b.14.1750697438854;
        Mon, 23 Jun 2025 09:50:38 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18d01902sm6357004a12.79.2025.06.23.09.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:50:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:50:37 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, max.oss.09@gmail.com, 
	devarsht@ti.com, geert@linux-m68k.org
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <cypbfwbsimknqtuzutprhpst2ugeih2f5c2qf35vtwc5qx5uzl@y6rsjwtlw7ca>
References: <20250616093240.499094-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616093240.499094-1-j-choudhary@ti.com>

Hi Jayesh,

Thanks a lot for all your work on this patch. I tested this version on a
board with the broken HPD signal and can confirm that eDP works as
expected anyways.

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Kind regards,
Ernest

