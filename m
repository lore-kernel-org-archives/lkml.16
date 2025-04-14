Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003C28A1D2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656271; cv=none; b=PIk5Wt0ReGgGNNBVECN4gVuKd99wq8s+VZ757hdFIqpQypyjXb0u3/Pm0p71AMSmhh7VM+sYCGjagG40zH8Rhxqu/pNOdyL9hOBqwDYvjSlOCDPdjyz9mORJ3OGPu0vJ93IgnZxFbUoUi7LBKez/caNUDd+3chGTLVRw++O4R+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656271; c=relaxed/simple;
	bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Raed8jaeW6dLObWDGGQEuhWq8AGRTa/fJuFlSToScBnNW7V67HnjrEg0ahvlG+zE9ClXHPlRHGSqr8EjLJNSAhY9Wa4sAnwuvLiO78IHtGuXUcPwOz5Hpe9AGbrf+YQNjs/4iT9DgRLh35KKGpSInkWFEOBrTvvH/qaRnbszwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E12PzeVZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E12PzeVZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3035858c687so3616441a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744656269; x=1745261069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=E12PzeVZu5Exwy8LyxFk9HWgo0LQ+XxMijoqt+C1B+Mp3AYP3HgimWmrf9iOztUsrf
         4UHJRw1rgGT5K2jugGhaZYNqMS6qBc4LSCCwbOjuZ1TPhvHD/SZzcqq2/oTv/wxv6qsY
         hKoy7XFhw7AZeIAB4v0NuPvLvGIFSngF5FTv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656269; x=1745261069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=TvqJE/19I28eAsM8oXYCcmGTBpnFikMFqlc9rV7ZXQvahYWi/Qw1UkSW/RY+igKW8R
         8Fw0hHueUQJ4Wc6dC08dzzCbrJA9CAAgWU2gH6FAqe9FjMaqP24b0/IwduEfLblrboVZ
         FqNOFSUAZ4uvwgkyHygUHKW99Jt1iickS9I2LZLjzoL/XOvvhgB4ZYmoQz5GSF1rQ1YW
         1a1oUIYPXZmKWqVZ8YoPbmkGqNSLYS0t9ZBxH+s+zsJMGRAQRtpGVhQWT3gErHdj45BL
         Fv2cRctyp/k8AGJYgQOErsWhjIlGAsCtn9SEW7R5rRuIBe3f2EDkrDZAqNAUsDtADJOr
         cVrg==
X-Forwarded-Encrypted: i=1; AJvYcCUKXibA0iyKKIUSZYlVdhNOyPvMThJedOl73CUojguYFXfcao9c+JHMzHWi+2RLOd3grCycVUvIELGhTk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySC1Ejmjk8PZm/Et7yPrcrVvRJCU9eV0c60joVMbuaa5u2oO9F
	ke6kC0DHv+ZJZxO8ibmEf1ekjjQKiPR7XBLR06ryFo3cvJv9SoQhYbZ+DtdtjQ==
X-Gm-Gg: ASbGncsWH3xcQmQ7Zr2t6zM8IWRj63MfjuVujE94ScLBMvqjGtznKDVDdrNIovFpaSn
	XJoIa1rrulb1gJIRxhg62/sjmuiwJp/sSJVK7aTuCHZIcFVlp2E78f6jiCNVKZacroOb0+ZbczP
	4is7cJDfWxEVoyhqc+upTPwDeNd+eekyzro/WExoU3CeAXy+XDtDoO+S6Ox51jfZw7HGaxILKl7
	oYe+8Z3pu5gIarveea4JBC5ucRPqaDMX4ytGb7FfPGH1xUg3Y1+FtPRtrJSffFmgf/5QpwEyjz+
	6iV31FFA8yS+pGZHcK7dwaYcX6r0aZ7DVS9T+4a1eOVjX/n/iIhktSPQQOpicsvWWoHUslBM4B5
	8WQ==
X-Google-Smtp-Source: AGHT+IHRnGevNVFCEzzLtuARDY+GV3b1ySMboNdXjtt9nCxP859MMeYdEqvd7RpkkuyGR22MEOT6ZQ==
X-Received: by 2002:a17:90b:2752:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-308237ba788mr18304386a91.27.1744656268888;
        Mon, 14 Apr 2025 11:44:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-306df082327sm11386410a91.15.2025.04.14.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:44:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:44:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <Z_1XiNY2ujreEo69@google.com>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>

On Mon, Apr 14, 2025 at 10:26:01AM +0200, Thomas Weißschuh wrote:
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk().

Is this really true? Documentation/admin-guide/sysctl/kernel.rst still
has a section on kptr_restrict which talks about dmesg, CAP_SYSLOG, and
%pK, which sounds like it's intended. But I'm not highly familiar with
this space, so maybe I'm misreading something.

(I do see that commit a48849e2358e ("printk: clarify the documentation
for plain pointer printing") updated
Documentation/core-api/printk-formats.rst.)

In any case, even if the advice has changed, it seems (again, to an
outsider) a bit much to say it was "never" meant to be used through
printk().

Brian
