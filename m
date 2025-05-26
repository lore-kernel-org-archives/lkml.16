Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82971F12F8
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252527; cv=none; b=uy9o5p9AJ+xNCPtrXvd02NlqP0myssSw3Q8G1TphUkfQdDk+ElfvdiJ4tXQLDnHjRpDQbgqYufXPZj0sDQEW6RPf28bhrneGCzf2uvneyToq7xDJxnSxdS9OVFnZ4WZzzPWs4BltKMnq6BkN6kJiP4xYCQiQl95cknrhmGY45go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252527; c=relaxed/simple;
	bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW2uL8s4IIGkkwDQB2fxRwYOSZ4NVPC1iy9bx+9vXdb9mN6MWHqnDhaDe06xdBCQmmmkBdlJNnZcxq0dxpd85m4tQMs8ssKDch9o1FWwJscoyC0zMXDlgeD3TX+z0PVlt/m6GlxdMF5NyazDMQvnBs0tKraSn2H2FO3NhkkSTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=VwSakXoz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="VwSakXoz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso15583595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252524; x=1748857324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
        b=VwSakXozz/3SRJRYu7ybWRUpHuaVIpUyPaMMLFUzLddZLQcVlmmS2jTm9Uomb/61hh
         W4f5Kp4P9d/gig+/H6t/qBsfrUbiZTyX+MioCE8+B/gdw0QoU86SYs8ZgdQv1MoQtNNT
         57pCGXW7oLLs0wQGIWTgPs/JXxxiwTcgt8eyPh8pMFr6V2a3SyGrGlYggcNcxuK7oVrw
         diqdGM9Z7JELko9YskyJjYZufCMUUHb42T6oHUdi9oasXXZwUM/E4ajoHZHy4FqBVivv
         +8IRiuqCDVz81zZE33obk1+M/9TC385hcg/BQ+TqBbGFOql+FkRYBRZvEFnBI4hQqF6M
         PpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252524; x=1748857324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
        b=GvburHsLP3GGk1CypGj8/+BfdkiN+inTFMcowynqhdBdTJHElz20fVHIHB704a2Ilk
         3bH4EUI2Zs/DNB2aUD+lCsmtRPSIujFcfSQn8ql/uQAWIUVwKOb76CIq/ibrB5UWxfs1
         egEx0ZzdCsRjXUqr/A2OdYFerqV/AtaaNT7uqW/A0OfekAMgRViZC8ENdjWXNy1H4JyT
         3KoUs6jsjbm4vuzko1dYyAWGFxgKFcOnXvgLupCAtMrqOR4Y+L63W2sp3tXLqq+HNE6v
         zetBpftxqELB51RWXkLIgHRRKqBDqXgiSOB6x2nForlTU/SpmqjONt8qYgi780ki5Fkj
         pedg==
X-Forwarded-Encrypted: i=1; AJvYcCUPmcgPo6FMXeiBkzoyAz/yceEqIspkFOFTnwlUvEPAZoyMIRKJpfNaWunp1Thv5iaoHDYOTuFiHVCRkSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR/57S6cxBq+AKTrG6wYQzLOIhSStl2fWjD4S57zyaWaCrMvKi
	z5T0zMgo8jmGw5W2muOJlk6LHJLqg7HiNTMtmIS03oor5bjTpDw0eGWaSKl2pdLTpDc=
X-Gm-Gg: ASbGncu8r9TRTqAJ/bHZwQwTK2Dk1U8YAAHoi9fniedFMasMUPrW19zfQQXVsz21zTo
	ZJyNWkBqZ30ldiEBvcAb6+n3JQPHZuowqzl6mB8kNLwVZtlvxD6Rg6MzcvARR1HeB3T2BCl7eYO
	8iik9mctq9tV0V2145PBT9MfgUHrBBHfjPgXrWoo4COM0lo9YzAauFYTBbGFx8LqJKjz2bZrj9l
	nscxmtTieF00SswXJ5THub60hk8S3SszWLBLsVRDDtKR8U9buxTS+cZJhldowLD3mf6GATvN7XE
	HREtuZZaE7pc+7nbn7v277c6d8RGGrJmrROl8ELZTviW/a8kcDy2OUSGb/KIkwLqntMp4oorFqv
	Fa2s=
X-Google-Smtp-Source: AGHT+IGj/TCuJ1rymJwAmhwD9hEHb2YavTmDlg3uKm0ah5yuR6f/5Sm9EUvqo4UPAzGWQCJs2xZcoA==
X-Received: by 2002:a05:600c:3c84:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-44c9301660cmr86938965e9.2.1748252524118;
        Mon, 26 May 2025 02:42:04 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm242667995e9.7.2025.05.26.02.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:42:03 -0700 (PDT)
Date: Mon, 26 May 2025 11:42:01 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-doc@vger.kernel.org, Milena Olech <milena.olech@intel.com>
Subject: Re: [PATCH net-next v4 1/3] dpll: add reference-sync netlink
 attribute
Message-ID: <pu6s2lvqaulyurarklqxumdtcd3tql7djhyun3ylgvyv3lmsf7@oun62hhb5hkk>
References: <20250523172650.1517164-1-arkadiusz.kubalewski@intel.com>
 <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 07:26:48PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add new netlink attribute to allow user space configuration of reference
>sync pin pairs, where both pins are used to provide one clock signal
>consisting of both: base frequency and sync signal.
>
>Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
