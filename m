Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3919F135
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017268; cv=none; b=PDSwWXaYqumCfANZTjlHeAcarFm9ylWCIlOVxQIMuTNbYCog+vOciIIjqLy0A4yjE1wJ3eUR1jZoPyAGr4tVsp1QFhTJBM3/uDfafhGjh/hgMQPbSLYjRIJGcT4FlKAON0PbgfZuc0+7Tec/yHGfJyoatdIX8RuSoO/mOGr6CiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017268; c=relaxed/simple;
	bh=tCKwb4cPFpmdPUcNn0T3KSrbEQ/sL4BgvyRp10kVntY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4BcWZOK9lkSfdMlpkwVSrTmLaylorT6qn9rPyRtgHINPCvxi3z2FtIRv9Skz1kNvy7tUqfN5y6J4Klnjqpv4Fp73Cu52xejom9destWgNoOL3jSukP8dJjDmmdErpbo+l/3h7le2B8jXfj7AYKhdRTrwKrvFiV6BEH/RCJQZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VBmsEN8/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VBmsEN8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746017265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
	b=VBmsEN8/cchqW5QIprdptL4es3VaflZai1PQqallAID65kYrOEU4LqKuyMwTTkUQ0ronVH
	AgwBtsw//+dmkQBrzSaIaYsFC2ZimuN3tGUOB7GHrSEJcStftMAGc6pUYhw2h4VWSJ8/Ia
	XWoGnfSqyDHcIN+VPN8MfpspN18sbv8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-A1oXJcGoMNSHkVr8fWDcFw-1; Wed, 30 Apr 2025 08:47:44 -0400
X-MC-Unique: A1oXJcGoMNSHkVr8fWDcFw-1
X-Mimecast-MFC-AGG-ID: A1oXJcGoMNSHkVr8fWDcFw_1746017263
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912d5f6689so3804312f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017263; x=1746622063;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
        b=Eu2zUegANCkrjJXAX8UL8VzboxuPU36ptymZVfzcElwK0qV7gO3bXpNxMrc0y3knMc
         5OLVEvaq/YZpudhUYrP7TZ0Fd9tjFPBy83UZbaIeHaJC/nkUKQdfQ59Cm2hvA5lhnKlh
         T6gmUBc20zdTZZVXvVw5b2pIufSRuofHVTGcjbCJ66n/w/WD0uvrhVSjCmPovMIN8JJR
         vwfniyhmgazX2taRnCG3Yo3iHYiYXuHOHsO/I8ruvT64YNmWUPvoY+5k2rTlrHgJQOrT
         eNh+TbTacgJWW3qkz5hkhpbG//f4n0674k17fFd3QnIRhB6xVihQoGIVSROmAiL9W22s
         2nug==
X-Forwarded-Encrypted: i=1; AJvYcCWbD5h3AGCz0t2cxDtls5k5JpUamKolpR2u39ULDTHLVmghMNkvggwrFIaJvY3XS1VGJEBGVKemyhAe2HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJqQKPxc/V59yyCBxcStv+hLaNNtfmcTiElNgk+VRQtkZJNqhJ
	QrrvLPrG7Cq5fagRuJ0SZyoL1nLMYktP5oDHf7B6ZwuZrrrSAKPbcb5VEkbnqs7cY2Z2c5xA5HU
	jsR9kBe+ANYadz5NXGytqU05EuIVtq33U1ht11550dS5dtMazcdMyMKdgXB6BLw==
X-Gm-Gg: ASbGncvUfXfNfRxC0O+1dp+57aP9yVO06ptSeBTxlA6ohhzb7fRwYZnFIT/pJ7CV3fA
	Rp/9hWWw9ZYvh6vj6XO2oPfrLuj57/zXRMfhYwHIfB36DAi0EMdlbr7baHKzDAo+rbqudHmOBZZ
	HQ69gAJocQJzVDhGuRh0MeNN2wfbDBC1btz/WfdJh6lI3kFVdQngM0eoMhxa2EZpuB4gJ3POaBn
	BlIrAylk4sSggK049UZkRkL5j2Wk9Tt5qkNozQBhUtB/CxNX41YodZi4K48n2xwNKL7cKr463CO
	WLComq+7G/d7ZIiZPOWz+7fUNokTb4zF+7CwgaDZiOmF8rlYsYMcSNB7t7eklrUtT5uCdA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b1f5bffamr23643505e9.25.1746017262827;
        Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM+ceGhOv4JKCvz5Fh82bRAJjwTkYhN8POhSnvp7s6BTnIqcTj6XXd3hkyknjVQdUMFaljyA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b1f5bffamr23643345e9.25.1746017262451;
        Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20b36sm24245465e9.25.2025.04.30.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:47:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in
 probe()
In-Reply-To: <aBHZYgPPPYY-J8Vd@stanley.mountain>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
Date: Wed, 30 Apr 2025 14:47:38 +0200
Message-ID: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> The devm_kzalloc() function returns NULL on failure, not error pointers.
> Also printing an error message for kmalloc() failures is against kernel
> style so just return -ENOMEM without printing a message.  (Kmalloc
> already prints a message).
>
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

