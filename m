Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5051F3FED
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230902; cv=none; b=r50q3kdAw/QP09sjLcq3zP35saBXKx0nV1MAxR7Rwv7V7bGaZ4rtS+xbvI28QT1ViHzHMon6to8PG9Iul0yQbq8J6tA4HJklyFlNAR76+vmnFGLKFyt4cZ2H+vQuU0/tvgy3ksO4/OaSwef8Rbb4ebkBJ2fWIlCritIrjybivZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230902; c=relaxed/simple;
	bh=jjgjjvxUhNKOkYxrq2CUMlZkOE6sFBKcjJDHj5mJDmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0w/hsVI0n18XNezuF2xYJwTrl6gGKUWQ/ByN2uec2pjUs7o+YFPi6f6zfmXx/rZWs3psTnHpmNnudoWy9HLB7C7cSwdgvVChXeKdO5tfa2VAg9YWoFiiXboYUmuhJ2YZD4Yfy0FgTwzE8TBGt31DNJvfTLb2Ut/ZFJFOggPVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JQrC/PgZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQrC/PgZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363e973db1so3340225ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750230901; x=1750835701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjJnSSToadR7Ba5tsz+7GR68Uid3k/46i9xtxrs2Xm8=;
        b=JQrC/PgZbtlN9DjR6iauOxg9lhIiAIV2KLHrwC5sqSANfscpoIgdozsSohShwopyRV
         XZhtjSs7iG/ohdAgCefivd2MBHqLMzamxYpMjlp/xriboV/9oSKgzjTiSkT7L9gB7rwV
         Oh/J37dCJJa3RTHU0cWDraTu/uR17SSHZ+sv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230901; x=1750835701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjJnSSToadR7Ba5tsz+7GR68Uid3k/46i9xtxrs2Xm8=;
        b=lql8JUGAPlNk331NCu/MbQ420+BD/O7QqpmjuqiiUCX4tLtxAs7/TEZX+qvD1+Fozk
         Fl58uHMzmu1IQrf4ms3B+eOlXrZ2h9TX+x1pfCfdPBEOq/adcxaucince+fy5T8d4q5e
         3tpyE8DT7NwRQEAAJyhikhtYbSFNKVm/12sXAdLEGwovmHRisIaWulsZ9k29xZNnFqV6
         k/nxkhEo9fRqVHYbde0kuXSo+MyViHxjcY1V8XUhidwtjNG0q1ebcjMewJA6wl8bBser
         62uxRFluCjhPGSukXP0g3JP5WOWJ/a6dNc0Q2iBiEvRgsEX6da0uU+Tk3Z/2VvTeoWIm
         ZcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7vpshS6B+6/7CU8T0hxWN9W0pl76OkN1n12/vbMYDojhDm1hv7A/zUt2xM6+O3YLG5y7mEj7GcwaRRZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyablLNedITZZad4VpfL0+Orng69Gm/FEvjQRcmtnRmi1uJx4G7
	e72YkSbqgT4ySauSUMQQT5Id8N09LUMnw7AFgBTVJAyC9hcWm+J0s9Z+okwU5/85ADdyiKq5ei0
	i+88=
X-Gm-Gg: ASbGncsGm830E0/BgSlN35FTuDHntJqsxIKWpxCZVKgaFmSlYPjv0RjLKkAnJ1h4isy
	8nLDM9Hnw0SKa3WXR0NtZxYJFO+F2pp6EpziMKdhAcfy764NbOgiCuZhR2hFrHTHLG5YRadH55z
	IhYLscdTrHmvvoZjUtJc45SDRr4Vw9ZlIBoI4MIC+3DYw6VMpxHZrFYJ91rzQY5LDHWckAn3WpE
	f91BvNfw+8ivkvGrZO7+mJE6y/vGQnY/26goEPvf39jlVAXPkBNuBvQeuGCRG3asVXzeTLrNHYe
	jE4yF0nZcsyDcOL6RHrOZnccKamTSYuJPzQyYWJAJyGVrrqLNl6U5vapiytRK9Z8vIs3d0s3SDT
	gFOYvcILFjUaGaCHksRbtYGLD/Q==
X-Google-Smtp-Source: AGHT+IG438IjUYDsjbKl41hI/Un/Y8uEcVLgq5YHZ1DPs6JxJJdlBvseErAZZycJV8KQtTJVicvUMA==
X-Received: by 2002:a17:902:f642:b0:236:8b70:191b with SMTP id d9443c01a7336-237c1d2aa4amr28360025ad.0.1750230900859;
        Wed, 18 Jun 2025 00:15:00 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:ec9c:350:e14d:88de? ([2401:fa00:8f:203:ec9c:350:e14d:88de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0484sm92455455ad.142.2025.06.18.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:15:00 -0700 (PDT)
Message-ID: <2dc61f3b-f04c-43b3-bc56-f4a01adf0454@chromium.org>
Date: Wed, 18 Jun 2025 16:14:56 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixing IPU3 IMGU warnings due to extraneous calls to s_stream()
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
 <Zs14rHA2lGQibhRX@kekkonen.localdomain>
From: Max Staudt <mstaudt@chromium.org>
In-Reply-To: <Zs14rHA2lGQibhRX@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 3:56 PM, Sakari Ailus wrote:
> Thanks for the patches. They seem good to me, I've taken them to my tree
> (devel branch).

Thanks Sakari for taking the patches, and thanks Ricardo for stepping in 
during my absence - apologies for the silence and not delivering a 
PATCHv2 last year. I'm glad that this was sorted out in the end :)

Max

