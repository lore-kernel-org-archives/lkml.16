Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DB79E1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866150; cv=none; b=H+4KXF9fSuamXjh5oTwB5xpvdj2MLM1sAu9sOUEgNlTJvg4D/GJyCtBhC5oHrtySadbTUkwZ4gZA739aHdEzuS6mdNhKc5R7gtXzlgaB03iLmRc7NJeXOt6z/Vk04f5IwDLto0pYjUyavYSriydi+G3no7W9KHuGW3abxEiRAY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866150; c=relaxed/simple;
	bh=9M2r/BN+wgJnJLiMtl0Q6+EJzSQ1DU6UiVV2RyTO9jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3knnzDWhA18F1Pbe0JgRP5LaIpWoKS60Y3S6xyt3G6xqvWTmkyIwF8YMnfrhDuEL7LTfxIrjb098S53NC79bmsvQ/Atbb3nAGWgCzOJcJEbTqDyeTN3GEdT5jrFI4J46OZoTIVFTJWGQ5Ax0Z4rO7LKVK7nJOU6YQ/vcNOukCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywX7QEex; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywX7QEex"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b0c68092so267095b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744866149; x=1745470949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZHfsagG6Q2hcjMTlAC7HlQ6ESQi8KB+OYVG8WQKoGk=;
        b=ywX7QEexMkd2HJwBKaSAvKsao0bDedd1u5pEheaIrK8YQzwzSEqZG8E+fRjUdXyNVJ
         7vy/g6OCSvrbnxo2Zw/Wwpn9WMSzk95QPalIEJs0XFypLk+/PN9HHjeR7vkGq3kAB/RW
         v2vjFCRXmikSwFksnfntmtV5PY6fOD7gnWfqCzdtAg51pUtpQX3JOG7tCw+qsV32rrk2
         zh/aeJ7OE/2mnvSObu3rKYk/rucu7MpSnoMqtPotRnxZ3DSjck11WMEvp1zC+pKpvdrF
         rrxWtwnzsND8ZNs73jSgQQdIrXueBVqG00hWXKiKPUE+o99tfW8Dmz8sjOYuNfr2XVAN
         eIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866149; x=1745470949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZHfsagG6Q2hcjMTlAC7HlQ6ESQi8KB+OYVG8WQKoGk=;
        b=L3halCCm3LKaUCAc/AIkcdazMvIf656v394fA7lGKskFqTAgG/J6n/wxOaFMGjGzfW
         N+RDc+pmxiqwHwDTsefyQdKQ/2PLIhrnInnrni7uZvnukqdop29edti5dT9xfDRz5J6b
         BOJQsavdOzFo8CTtWy9gnt/5D/4cWrvkV1dQD442ZfYl9pIAZSn/y43uZRXffMulj7he
         ES9gxNJva+qBbGsXmcW8Hxgo018j3krC372Mt5Bz63IyNKIcV6LqRS/jXPqdRuRaos6h
         MFTt6KjY1H/VSsPk+7ZcBnsps3ttGaZy7R7vH/LS0e11/Qzi+EorFt2lHWKyfP5ky8th
         C5sA==
X-Gm-Message-State: AOJu0Yw33lZuhlU3qP3i2PvNJeZZRJP39bxcwdkgmUu3TTHKBQC8Ge4k
	h3JGE1FvYDCuhn6aTbMPESKbmaRhka3JXeFJ+ZZxVBFqxDPCtkFa/jc/Rq8wZxw=
X-Gm-Gg: ASbGncuFydPdXRpTeH7YpPb3Y7izvFnieVmTr+4poybfqipdpDnJnvHKgYWKZI+su6I
	4g0j6WvyRV67yt12tFFqzUdfsvDptmRUwWOVfpvP0F/NUFeYoE1F97nsxNaaJ/5c5xA705+CmdD
	z7lAuqfJ2t2T7v0Uqvn5ZRIzgGEHJl63rBj/+yKSsPzdL21jS3txBIweVhy4UDBgEEN3gWeK3+6
	JrxXtsyH7arnySv7wxFH7N+Eigd8UrAx7VKDwK5AtAVGQ6Ex5FUiJFqplNlHQHErI5AHYgbguDy
	dDTIUJCZQK2Mpw2GSC0HEt2zxRKGXEwg4drBKYctWQ==
X-Google-Smtp-Source: AGHT+IFSqgtpQYxJWwym9yAwruethfN7kMgJzdygmpSqtMeWwFsSzwF9wIfwPtkLQ/Exq5QZsCWNiA==
X-Received: by 2002:a05:6a00:451c:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73c267f8a15mr6255222b3a.21.1744866148664;
        Wed, 16 Apr 2025 22:02:28 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c338fsm11376269b3a.43.2025.04.16.22.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:02:28 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:32:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicholas Chin <nic.c3.14@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	rafael.j.wysocki@intel.com, rafael@kernel.org,
	vincent.guittot@linaro.org, zhenglifeng1@huawei.com
Subject: Re: [PATCH] cpufreq: acpi: Don't enable boost on policy exit
Message-ID: <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>
References: <2c788c2ca0cab09a8ef4e384f272af928a880b0e.1744781329.git.viresh.kumar@linaro.org>
 <20250417015424.36487-1-nic.c3.14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417015424.36487-1-nic.c3.14@gmail.com>

On 16-04-25, 19:54, Nicholas Chin wrote:
> Unfortunately the issue I reported still seems to be present after
> applying this patch. Upon resuming from suspend, the system is still
> entering boost states descpite the boost flag being set to 0.

Okay, so this is what we know so far:

- Force synchronizing (disabling here) boost state at resume was
  making this work earlier.

- Setting the boost flag to "enabled" state during resume works as
  well, as that makes the cpufreq core disable the boost frequencies
  again.

- This patch (though doing the correct thing) doesn't work. This is
  one of the known places where boost was getting enabled before going
  to suspend though.

- This means that some other part of kernel (or hardware ?) is
  enabling the boost frequencies at suspend (or early resume), which
  the kernel was disabling earlier and not anymore.

Rafael, any suggestions ?

-- 
viresh
