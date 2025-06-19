Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172725DCF2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341149; cv=none; b=nVXwj52fwviQfRB/UCOqxEI9u4rSsdZ0cVY7GfefHt/h5L3LyN4wZ2Nytf7vYTy2tsACvSggZrU7r5Jx0PdADVdDNKnlznurB59s2exuou08Yvvyq0vnCUe1IFlYHAk+sPai3w7MwTCIeLYK1hN5jKtGyeKqdSRmXZBfQH+LOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341149; c=relaxed/simple;
	bh=hbjFWc/M1u0JtUeGDfraCyEfZ1LuYrMt6ic+SN3g7Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVGuFI81YT+0xirKQGNtzgygq0XnylHcgbmzcaXJDnCfpChRKGj6V+TqT1xIhagMCdlulQOgY7Xn2hqpgfNYv7wl2ModG/IrW6GsCMVPsVsiooQQ+LRoVQH2XnkNzriLUqXT4KedkUjD0AzC+Z53gyEag8CU3iAsLEdJdfq96Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=h3egb6uK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="h3egb6uK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so779401a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750341145; x=1750945945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=h3egb6uKzY8zyKkArGOFgTkn8A6y2C+ZjWwK2+3hW2MEVgKagYjX+n/JGSWIDHwHDf
         pOWHM/s/rB1r1d4+F8TsRCi9TCzSySOb0z0pWuo4urkAGLInz3FIGs1ZW314flToLydc
         6qZzu06leW0R/AMoxg3rNX3lpo830zgls3RVRO0VMLA87sCTNvDWYi9dS3yzusLc4giN
         IVWL1boNjw4f9BGxG9DAThZsLpKy9OqVhnox/YzpqCu0i8y2+j0qmvBlx0s1BC9fivgl
         NxM2lFnIzZ9qYjJf62+fBvoUu8/QT0CwWJk0HqL8ImpZaDG+yY58fjPJacxZSlbjWuVA
         Lorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341145; x=1750945945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=cwNAJmmSTICipyafB3H7+Aoq0Cc9dbfK98dSOvyjxGA3kRhQomfGVSVfgWQmmfS8ru
         Wg2H+SNcKZqle4pVrfMS/7B8XA7enC6CbL6IHLBsb7+aphMFn2XgMV6MeZMWeTcT6Vyf
         lW4aLYQbaaX+40Wwtej+sPJMOAGL9fPblD1XdnBj+07pOJP3WHbObUvci9De77nSjuAg
         OF6KiLTVaMmExB8BDYnZYznDL9WNnljc6IkzC+hfqtr6NFB8HU/Gh7oHMBR4vq1SooBm
         IqGbQSJ/4iwViO3Ylsu5EwnrO+brXMvWtAC54jexNS7QCtM1F0miG66V/AL1jqpj8tma
         7yQQ==
X-Gm-Message-State: AOJu0Yzom2OY1nZWv5fOTZ0IVQ/qK+qFatnQZHsU+nffqq49FXPaYUMo
	liFbrc1oPUobwD/Jq3it8JsPxKQPWmSuIMI1oBE1ClP1vj9fsnnN6+AFl2BkO7nO2ps=
X-Gm-Gg: ASbGnctj0KYLNXRRIu9w3Y0qEsVhvuRqEq84ValPSJD0rb+4uE0xDKg0EQ47xa/lFT1
	SOyPOxub5uprqwnwJ7NFjOr0OM5OBBW+1OhaogHU6EuW0HEgYGX6ut+j0BzaVTKvUOG43zpWRh2
	49x61IgHjv0EgB4j5D8Ei3SxrSa/+uyPT6Fx06zTtOR1eU4O+CvGdco0qAR1p27WpM3JvJkcUb8
	XeI/2748itVsfVcnRCQv3Yguggun/I2Fcm9xteFoa1WYEivQtFN5+1u8F2Sa2ahcY1pG3xxS2NL
	mmeclystC7gn9R5eCXzC4Ml3OEKVE8rbovZ/cFbQGIPLIB+7RMBFl1n0++nIJmhtVSXFYn74jxO
	me9oF4AEbYTRYlVPkrgHv5ovTGZZO
X-Google-Smtp-Source: AGHT+IGGIucBMe1Oat8JbgZ92M0GJuKp6vgypKqm2ECzF9rgqhJMaRksiSXRDwoiAj072A1XJRPzJQ==
X-Received: by 2002:a17:90b:3c8e:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-313f1d2f830mr34871658a91.30.1750341145046;
        Thu, 19 Jun 2025 06:52:25 -0700 (PDT)
Received: from ?IPV6:2600:380:4914:28d6:b267:8795:894b:2061? ([2600:380:4914:28d6:b267:8795:894b:2061])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365ded130esm120190385ad.231.2025.06.19.06.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:52:23 -0700 (PDT)
Message-ID: <53bda7f6-eaa6-467d-9998-0dfd279dff6d@kernel.dk>
Date: Thu, 19 Jun 2025 07:52:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/group_cpus: fix NULL pointer dereference from
 group_cpus_evenly()
To: Yu Kuai <yukuai1@huaweicloud.com>, tglx@linutronix.de,
 akpm@linux-foundation.org, john.g.garry@oracle.com, ming.lei@redhat.com
Cc: linux-kernel@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com, johnny.chenyi@huawei.com
References: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe
