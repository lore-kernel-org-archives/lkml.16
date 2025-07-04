Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC911D6DB6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594249; cv=none; b=mDulx8LzPqtqRUjQ504jX0V6RySxSAFLLD4L7zW/l9h5g9guXP41st0dMuqqxygy9tpm9yo6JpC3bEZ4p0MkAZaqDBfMqNM8gBho0a2k1uAhzQ/d259eBhVmmWw74uERS2SEvFMV7SAaFW1U68TA4UqxlUYQNY8NQkFFfe/LgVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594249; c=relaxed/simple;
	bh=OoCZq6LdsFnIFXOYI9tB7SS91E2B0eFrGNPYaxleC80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f8Lbjw0RTrqqu3WdP9cKUnMWEjuv52ER8tPGfbMNnKCgbhilj9WMfaDaA4qLsvs6W/Y9ssOzh/r5AMH7qWespl6hVtEBTlNweQIzYeRap3F9kmjhTqv57mXT0wfH87NDxVXEqOzR2+kIvAI3iNtNGh10uQkHGvcrI3rYQcD2b1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=M8tTvihy; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="M8tTvihy"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86d0168616aso46302539f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751594245; x=1752199045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcpGOYJoS+x1DjWEeDlJG5WLQCM2ycI6S4ggaBmrR7U=;
        b=M8tTvihyw5twFRgof6N8pL8bUYCiy0O2vkpwc4ngH+zw01ziJxn/lmmRrpRHG1U+Xw
         zlIwhlHD7FcOZphxChse2nDF7i+cBZTxcF7o/+kjmxs7n8jOPQ4xAFuoXp7qXly9NNx1
         l2k/U+lt8lDwJHKZBitXFGLyyAj3ZEUYVdc/irArvXzx4ho4A0Hma1c4RZA8dUsPTvCZ
         RReBxqu1GS0A8s/n6/dEwoZ7JZTTUg7yx+ndm3cukkNCujS0j3G3TedANK7UH4VyYLGp
         9Qr1R/4WklI3Kf1ZlUkVh7NFG/X73KTVmVctt+A/fX/0PrnmE+HVZc4m4nahuBrlWBlk
         4isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751594245; x=1752199045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcpGOYJoS+x1DjWEeDlJG5WLQCM2ycI6S4ggaBmrR7U=;
        b=JlKfvrG3f1moGrsaaPolPEw5gX8KPGpDL+1OsIv3YBLkE9rj9H1I2kdiEiPOmxmkXD
         vJnz84vepvGKFptjJquYDnczkNltFUe3aAdaG5LE1gekLjn27o08jC8uwTRhI4gMj4tX
         yckuXXE7Dt+im3etFDXcIgIIQ7KwZtzFbmqIeAxNxIYAWr5BhwBfIULDR2BzIqnQrV/s
         F/2aneqKtyChl81LRHibjB4CjhuG2l+rW1KkvJFTMF1LRBAKp6ZUJYliWKrURyMnvVAY
         3kHqFwy2gccWkof3IqmeIuGcF0WPPpmasJQRUhz9aHBX51f+gYHxqy2aDipLgqNYMe1f
         Tl7A==
X-Forwarded-Encrypted: i=1; AJvYcCUHQTPqgB+4Gsc07TrMFWCWolxVIFixNcX7UR4hRLzJ5WPyuvlgnYixTTBWNxZ5DAm4zuvj/1KV7hlgM9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUAyuNu+n2LYPpCC1gw3nIaOYK5DpklT1xPjYfFGDlak+3i65
	/zWWhvVSLwcMbJ4cMrdjVjrI8Hg6l55I9kgNm4LffR5FTfYT9gx+VpLSi2mlpffnUTLDzlmEDho
	bnSWe
X-Gm-Gg: ASbGncvtiDPNWZrKQeEBA8/9w/SROoANioorBbZ5HAXI0jSi0RAVwIi/G7xrC7EkeCi
	YBviTM2AfrDQ0yq8DGfmrS+OEvnfjOdT2myR6Yvy8EXkgvDO3vh+4GT867MnOw6ThL+xd7zazNs
	oA0kQXbC/JmSKX5i2ruCCkUXgV2b+R+4H3YtT7WyGXKUIM0wJfWxQNrAX2jwAcG2K4P+HKeqAFz
	pNZrBdPQtjPtaLZ1XQMztIkvh0pA9bvkT60MmF2s6AtNUs9tV/OvQg6dHBO+7pCYw2HwkQh5pxj
	azdQN66HZdn61jFcaKOobCMadCgecq5TyznVn8fQuqT8vBeVftd86VRz7k1xEYYR
X-Google-Smtp-Source: AGHT+IGUGe/QPbULYs8yVIdrGcRGsydBwpQMFK+/9rqX/ujQ16crNXvpMjb/DcznQMGXzDKwDWM1cg==
X-Received: by 2002:a05:6602:29c6:b0:875:acf6:20f with SMTP id ca18e2360f4ac-876e490c7famr9887639f.10.1751594245338;
        Thu, 03 Jul 2025 18:57:25 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b5c38a6bsm218292173.120.2025.07.03.18.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:57:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: minchan@kernel.org, senozhatsky@chromium.org, 
 Rahul Kumar <rk0006818@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-Id: <175159424438.587194.16568667665048848339.b4-ty@kernel.dk>
Date: Thu, 03 Jul 2025 19:57:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Fri, 27 Jun 2025 09:22:56 +0530, Rahul Kumar wrote:
> Replace scnprintf() with sysfs_emit() or sysfs_emit_at() in sysfs
> *_show() functions in zram_drv.c to follow the kernel's guidelines
> from Documentation/filesystems/sysfs.rst.
> 
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.
> 
> [...]

Applied, thanks!

[1/1] block: zram: replace scnprintf() with sysfs_emit() in *_show() functions
      commit: 264a3fdab2365395e43d3a0b40162a29e61ffa22
[1/1] zram: pass buffer offset to zcomp_available_show()
      commit: e74a1c6a8e8af2422fce125c29b14f1d3fab5b5c

Best regards,
-- 
Jens Axboe



