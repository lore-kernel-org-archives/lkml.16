Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C91E9906
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649307; cv=none; b=MhV3O02nkbnDG9FlW9/vLesEQkbKmwQ30iEUaYRis3I1k8gWU+GpGl7MLzermxP6LtlyDDB+H/v/rjGyaCD+xbual8C7Uq2nFQXlqrqtKhBos+wRx3WWIlVbKyEsow+RhhO5ssx36fOGr3pXRb737XMyYwQnsCUzfXo2fG2cMM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649307; c=relaxed/simple;
	bh=z/sjIVYh1QCOUgieYgekPUG6x3X7vMY1sv7Ow5t/JAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAAK+H7ByVWJLgK5I4UeAHpfR0j2p7Z3ILKxUf+bnguNB0E05iqifI+z7wSbaMtJ+6ebDELjLP/4Z0aO1amcflSDDK62vO0S5z4B5v1atccZl+CPYBD2sLRAw6rzGbMKCK94SZ4bfqd9U4FYO/dH5MOlkIV8TAgNs8qi96H9DBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvaJdDcd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvaJdDcd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-232059c0b50so13124385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747649305; x=1748254105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PuBulIo1CkbxayB7KEtrbV86yLWE3VV7SPvLxmKhqYc=;
        b=cvaJdDcdmBcmDGGxC++gm7bjRghNQbkwZvTbIWdk+mU77A3KmqRvVFdIYT7XmCKgl7
         U8Ldx2atTGWkbFKfBDZ2D+z8MxWBqwbv3joLquNwRlxIVmlUDFCPG5TjPMz4NNH/mMaM
         I01H+s9a4quWcVDCrSc3KXFDZLEAuITj2CB2O0ZDcxQWpLq93iEP2qCH39V5DdF+xM/A
         DLs2OVA+MgWvXwte8CAwYEAcPUqJypQARCGG/I3KgMimJi8YkYuTwPpKxHV9c65+COpr
         b27vSFuhATO/NSXM6OIQy5bCRSrmgY8APi4QhOKaq0Y+0Ak3OSCrXKjJS2TOsPKSmzei
         e+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649305; x=1748254105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuBulIo1CkbxayB7KEtrbV86yLWE3VV7SPvLxmKhqYc=;
        b=LLNEIN5dkVp8Rh+UqGQRD9TEpQbh854EUoIEqvPR41nObSh4x8XgAY5U4M/Og3j0or
         gaRpR4VOz5lH8h7s/1DSxD+L88fbvRyJhgkuXjaR/EcWktH4+aga8qUIBoEhOAL3b6Wv
         TgcuDDXeSd77nMR5UQ8kJRB2uWeqY35D9xXuM1BTf07qGZoang2Bx6e+xT3heVDcz5tU
         JPIg3DOJLscJztsAMQbbznhsd2JrXaBg0xDq9pTpgRj/1/FFMRJfk4gQSQjev8KL9vyy
         VgH2XTgkGqGMzPTH03KniufPspgK+MyNjjxpdJR0dLNkzv5DL5p4xDjwiWv1YAyx52qp
         s2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Rya5XhWAbDaHhjg4Bvjaf3abeQ8rIpdYPX8mxpWBi7kZP0dR6rPNvQwOO47/wKeerjUB3Q+ni/vcQHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0syzSKE2hB6Qx4XIOtkiaH/dk9Zc2DXLLmAEgNyCba57KTrj
	MKRSRLV/ZV01uX0aVB1q4PXYWFkQ4x5ikbHG39mgIeO2PTpVelhB2dLaC33Kfol31hw=
X-Gm-Gg: ASbGncsrJHyZskyri63m8qKdJSpYc5G5TT7PSCX1cAnEGh8rT6fjPEQ7LO1HGKxQHkp
	XAhLjyqBXFNEpL6g4lTwS9KFexSJwo4eQBUw/Zu/y6mlnBWESZVFh575lICdXIJO/+7hp7d9Hdj
	deb4lAdV3R8j8zNeGKD7ovLjfoZQqYL0m4v76zGBgzIlU5ZMr2JxRbfiD6SWuDmJFMIThuQpaJX
	Tf4qODTPk6HfdcfqRq9K94cB0IYeQtgbUdqzVHiOSOij8g44eWCD36CLZvmaiCGiRziRuVtENPi
	oTOgS85+hO5x5HM1E1R/qV9WvFlDh2Qdf8Gu1ozyGVjiIw/KMtJ8d5zELz5xOzw=
X-Google-Smtp-Source: AGHT+IGVe2J3cpxAL9EWq9+6d/4gOwJD/80cWTDZrTmrnV8DWVsCp2X+TptmRzbGQd3z7gfCQALgqA==
X-Received: by 2002:a17:903:41c7:b0:224:1221:1ab4 with SMTP id d9443c01a7336-231de317b43mr180365815ad.22.1747649305463;
        Mon, 19 May 2025 03:08:25 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed5e7bsm55732915ad.249.2025.05.19.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:08:24 -0700 (PDT)
Date: Mon, 19 May 2025 15:38:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: zhang.enpei@zte.com.cn
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] OPP: switch to use kmemdup_array()
Message-ID: <20250519100822.evhd4vs6p34irx2q@vireshk-i7>
References: <20250515201312562vXizlDSg23_PhQ1nALjYV@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515201312562vXizlDSg23_PhQ1nALjYV@zte.com.cn>

On 15-05-25, 20:13, zhang.enpei@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Use kmemdup_array() to avoid multiplication and possible overflows.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> ---
>  drivers/opp/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 72fbb6cadc23..d85e3371493f 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2087,8 +2087,8 @@ static int _opp_set_supported_hw(struct opp_table *opp_table,
>         if (opp_table->supported_hw)
>                 return 0;
> 
> -       opp_table->supported_hw = kmemdup(versions, count * sizeof(*versions),
> -                                       GFP_KERNEL);
> +       opp_table->supported_hw = kmemdup_array(versions, count, sizeof(*versions),
> +                                               GFP_KERNEL);
>         if (!opp_table->supported_hw)
>                 return -ENOMEM;

Applied. Thanks.

-- 
viresh
