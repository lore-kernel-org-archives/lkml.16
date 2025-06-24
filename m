Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963B2E2EEC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782922; cv=none; b=ITcp38hcsDGr/+mXQa9M6dec/fYaGXuH1pjcv2mOEzmFWAl6tzDUS0d1egeaXDPTShm+/bwUxTCWtxXTVCyEjmmHCuzC6Hk0G/TSTM3mNfiIdh71jT4YH0tUefXwcy/5v9gfLpNfb/HBz0Y3kZuYI7sgN/YPm1NXYck9lzcw1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782922; c=relaxed/simple;
	bh=LgqKg/LAAr84QK+xHhLmopAEBcp7spYzMX0tSsgSNIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQzYLue3erzOOgRNF7HHI4mKjiEYyPUT4foki6ShvnT/bM4HLMg6TwX+Gv9P5ssfkLyP6C6RYBpHTzAcMsbawpudYau+OxfNb3Uw0XpMEtj2O/mTLQZuobZbgC8izb9QHVr+a2r3GsjhgFAaOcBs0SEnMRgPHan0RkOVmD6Vgok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYjWDOPQ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYjWDOPQ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2edec6c5511so195582fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750782919; x=1751387719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSz1JFe75zgnTFQjk7azgszRdIK56k+5FDXoGc03hUA=;
        b=TYjWDOPQYZzh+khVA7ezUXbVqmdY/Qarq8RBzoir4t4rPmrwaipf8UeSNqrlE+8WJU
         mUICQwksP3go2SWRgBP3iZg+S9Z0U+fFfeL9yHARlWmll8qUiJ/pVBdi+370+uYcLNdZ
         zM2SVKiGYrQGkzE47nPWjfgWfpoLjbTzj5BOvXG0eClDOspgwj80kHP41m+7L0A94xkR
         c7AYuVzpocUADeMje8FZ1A8irLshMNGt6GsP0pZNg3ZGH3mQOQ+GrXyaLFjYSE+XeZWA
         vwmh5RnyM7tEIsDTzD+zucWoaLfGwSzhS41JM/v0so08gO1S3PCkHoFRMUwELdPuX+ht
         r0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782919; x=1751387719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSz1JFe75zgnTFQjk7azgszRdIK56k+5FDXoGc03hUA=;
        b=pRuDpOGBAKZlds5GN22kgFtXlQKyYlvRGj3mIxqcZ3g/gcc78JLiKZHKrEv69Ysvxo
         ZbVg/mZOhAvwI3nFmVoQrJUsbJ5F6E/nbIxZf2NLMR1+fzbPvlzeQFon8XzaZOlmSsAd
         hSb222nMrz6kvQ3voCrhhdEC8Pqo3hS8IQLHfgMGCzMS03JFM/934pRkGFhjkwbPhagl
         /5uqFn5op+WmYHdBX14KeSURUbV3drGKSucbtgHW/RHvUMUjbv3X2/LEL5YMA5fdorYQ
         4raOqjWT1uXn0+iujaOYGpnMI9sOgilME513mrXzHrGEIjE3TkA99Q7WGMYLw8w76gOA
         HG3g==
X-Forwarded-Encrypted: i=1; AJvYcCU7cd74gOnCKafeZuAIWoux9nKvoMFkDdYtqGYSUANo16z15I9DETzCXVn5Rc3V8boHd2lFnwiGLf+Sg7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPpw9U+dk2hmcId/CRVadF0vUa/zk8sr2U0Shd7n9QBAF738v
	/0ZU8GEtVUjNaWpoE+kT4EhojUFeOIqY4i2rMNRJjwnifQyzGaJaOYsPwlgvsLkVStU=
X-Gm-Gg: ASbGncsbNV/cFnFpVsSZMewpm5IvlkA0upntQTKws+IYxnzybNS5b/93NpmJa+I6WM6
	Q/J1bX/7bjMMSJrwMHh/ZIiRiIxneoheDmALzzTz6s6KjqXCNKDmoXagsWhfGts+1GXUnoa1RsU
	EzHP8zz9X/pKV5YeEsehchh7ivMNPCOGMmWZTffadHIcO0ipEXWZEKWRtyUW0RqZwBD/+9uzjyW
	sz9NFvJyaIgDumbg0DkaYeHEPjSjC0DuaOMBkQYo81DytIsldlwl4EdksjBw/QUpfYfitD79Kcq
	YuyCONwV8nW1+2zY3+Fo3yXo0st61ERHAkxclIe8/Ls5Xr6cNVHco4HbDHd83ME4H5qrig==
X-Google-Smtp-Source: AGHT+IGLBmzoZDcj+02IHdZnbhdqNE7ZpcxtaWGwO/yBFtE/sR9o3STi9jOIWS56QlRwP/UQ/l/YfA==
X-Received: by 2002:a05:6870:a44d:b0:2df:5323:520b with SMTP id 586e51a60fabf-2eeee4e4535mr11595383fac.19.1750782918736;
        Tue, 24 Jun 2025 09:35:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7a1d04sm1323856eaf.20.2025.06.24.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:35:18 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/vmwgfx: fix missing assignment to ts
Message-ID: <0b83e41e-7bb3-4e20-b568-12feaf73a79c@suswa.mountain>
References: <20250623223526.281398-1-colin.i.king@gmail.com>
 <CAO6MGtiLtHKk3tuvxpz5wEC8PxshANhdP97MQ+jD9euu8UmYxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO6MGtiLtHKk3tuvxpz5wEC8PxshANhdP97MQ+jD9euu8UmYxQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 10:02:41AM -0500, Ian Forbes wrote:
> On Mon, Jun 23, 2025 at 5:35 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > The assignment to ts is missing on the call to ktime_to_timespec64.
> > Fix this by adding the missing assignment.
> >
> > Fixes: db6a94b26354 ("drm/vmwgfx: Implement dma_fence_ops properly")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Was this caught by a compiler warning? I'm surprised I didn't get some
> sort of warning for this.
> 

We've disabled uninitialized variable warnings in GCC.  Perhaps
Clang would have caught this but I'm not sure because tracking
uninitialized struct members is a bit more complicated than tracking
uninitialized variables.

regards,
dan carpenter

