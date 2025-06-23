Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF3223DF0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717519; cv=none; b=ObW5IkBkIt5P0fbd22kughCy1b9R1yvw6VzKlBLsbzhBmE1EmVLmyFcEt3D8fbc4hTHrBb8c9E49lKUPY+P9iwXL8hwp7RJ3jSbWLRnh33qEWmQcchKMhU8na+rn6d7KvbtP6kMFoeFVdZF0FqtEu64hg46h/cJdesBhGooHaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717519; c=relaxed/simple;
	bh=iSqfQdhhNrFUcXqgyYNd2M03410UI/DXw37Kxcdnpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAah8tfVM4bQSD4hQ9CtWDoKCnb0ukHRA+ZwJSKiM39z6RbG9seaotYYduelGpI6p+YU4J1ImTA4JwqJPdEJgK24lv80e5lYj7MWk+jjY4gzo5f0JWPbpADMh7fjoe5sxkYA9duq2yD2aDC1CMmKtZ3dknOQpQ998LmSO+iBJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrXt+LlS; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrXt+LlS"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40ab5bd9088so3125968b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750717517; x=1751322317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=IrXt+LlSxmPKwAhyJk5C6CjfpEX9I6oWgVeVt12x4fJ36lCI4p5sGh4hUQHsup7KXV
         tH2XQFM46tjozQK9A4RX8SD/4OLMu+CKdHZzd7VVMSM/fmNV/gjaWbKfXy2sFKWNwqYZ
         is5dI88r1mZLmemKAZZxHYDP07YcUWoU+Y6n+EeJczj5PmW3/v6+eooju0jstqXqj+Vb
         xUslRJ2MxDA6D2WNJQY/tWNaE9r9h/mxCTGjOxxtOn2i0hHg63FdnxLXA9DQ3c15Sfh1
         Y7OSTN+aZq00mjtbfZ7lVqxxF8PvQz4nApZtTdqVOTpOQepa3vk2qXlOcMtj/QQ4wWxC
         W+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717517; x=1751322317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=sY/FP37QL6LUN9OWmbzKoUeFVXg9U/cjZpg/t8Bsry5oNSEbFnhedx2GLOIA5ndRkO
         5uM0uAN7Xx/SemeQI99ZZtCFl9Qi0q792/wKaqlHFWsCssFt1+VA9/1MguSSTTaiect5
         4/BEZboZgJ0NWITQTozTVTLBcPceGFe7gbAMJogaVZrU1g2T3GSvc1n010UvYqYHfgjF
         kV4Setbks5k9WrHL5ANJoYwJw93WeuRLBabYFIc//qB/1y9oaGcoTYLDxKh5/7ejuBjy
         vwzZzQfu0Lboy8ShOtAm8ZZ1ARrApDCW7eoYXj3Hj5ynkRF0Rt0Nduqyrjq30/tQEWPd
         t2bw==
X-Forwarded-Encrypted: i=1; AJvYcCXxcXlcna8a9RT9NS8ks4UpkHEeLJ+fQThFQdCK3hkqKV5o2eW4Xds942v+t+T+x/JHGF+E4TU8qE2JS9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVxkQQGCZWNn3RK0gzS1fmj2+nOc0zY9ZXL+WwfVoP6F648WB
	cPUX4t03NNHVLCqPDWC7hJS9vA0ONlBVRy9sVHTCQPZ/7YQ6Lnl4cAnPMyS+8yCfWos=
X-Gm-Gg: ASbGncvQ8NOvW8G5KLTOqQ72aK2pWlBSzhqFNfgn1WEzCC5kIrTu6g9yR1dMZZswR5j
	23VmgiBQ4E6ffF65DGSe41tJDz/Ux7zRh/yGLPyblE08U4HIrIWt5RdP9j+gcLrPjmYEflbqbyB
	z2Q2T1zAW7mrhiFQ3WUaeU83GWQy4doF7wcvvOi87MzQFOEhDsRJSwpiONxLizNPPN8+r7z84fH
	gMVlSSqDkju3/cXEQiB2JsLbXK5UlGUsBf4EMyLyd6quiemj7hziill6UgNMvmrrvEEEZRoH1Nl
	emGB2QXzNhSyv+bCBha7BzknwDfuao2sueTH6CO36MheBIwUabK4H76/vHXU9sCs+mZ+jQ==
X-Google-Smtp-Source: AGHT+IE91XZYWlprKGhHxRhe/CzOGIt6hPjcFJioO4ZNtu61oT2yO1/raktvIuwHoxAPy2DMwidNoA==
X-Received: by 2002:a05:6808:2008:b0:40a:54f8:2cac with SMTP id 5614622812f47-40ac6fe3646mr10872876b6e.37.1750717517244;
        Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d3b353sm1557857b6e.46.2025.06.23.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:25:16 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623220958.280424-1-colin.i.king@gmail.com>

On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> The introduction of a padding field in the gpib_board_info_ioctl is
> showing up as initialized data on the stack frame being copyied back
> to userspace in function board_info_ioctl. The simplest fix is to
> initialize the entire struct to zero to ensure all unassigned padding
> fields are zero'd before being copied back to userspace.
> 
> Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

The fix is good, but the bug has been there since the driver was
introduced, it's only just now that the static checkers have started
catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
investigate.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")

regards,
dan carpenter
