Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04634242D77
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312082; cv=none; b=jPO2+nJilIKJ3fBDAS2nLEYSqcHYykk7rxJYzCcFxSCrbKKx0DJFjgL6F08PJNl2yx8jaMtN72mNVu/Jusx9kYkVSe14ZSNbdIc1z28DMtF/4t+5khO929+c7zohcXjbWICLzW7Z3pwxyYcP3OYUvgKbQvnvLLGEV4I3Kvdt+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312082; c=relaxed/simple;
	bh=G1pBc79YHeOc8teFMiWj0r25pQg23ExTkVNwbJHUxeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxHMu/LcZ//eHKbFu0lZUsQ0AcGKGfBJbtLm2NPRuN8atAPuDKvurgeVpQDjadj8AlfZ5J/fNneIO5+zyG4/tDVHgspoe8xILT/K+OdtGiazvx9r4vG9tauoqEHOflWuKvqhVKfAAa1ompf63RpbC9Ypyo4VRWaHi7enfx39Fjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u11Km7ns; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u11Km7ns"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2350b1b9129so3427355ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750312080; x=1750916880; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w06pRHUxpM/QQNGaUX6TLUa1ZCwsg87mdzg1cVqYuMY=;
        b=u11Km7nsRaFeAjr6NcA2cCOpcGPPe4gPB6F60BFTa2SDqFGAo/kEDOERtAErFJ7OZT
         wqfPAFeif9DFvTX+y+awgweW1sf3x9kePNlLY7bXKapDEaGctVBYMJzrWr6uq5/WniSy
         qEgLXfYR6pJrKhoXIr8mb+CzbIs+WI+sU4t0NdRJRQMzrQfUCSqwl1T8kWVtSZzwJUmI
         44sQH5wDEqWGDTOIbx0Mi4GhGPCcCvKI/1iSiwCnAdXPnwiNVzT6kzxBiZ3wc+Rs9nnl
         mBaY8iisvG2UCZMREpb2Nb1JgzHG4p76lc/k/1ApqGPj48K25lM3BWaPqyBspvvWaN+j
         n4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312080; x=1750916880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w06pRHUxpM/QQNGaUX6TLUa1ZCwsg87mdzg1cVqYuMY=;
        b=lXWVmWd0DwrF6S0KSj90UMkHCDMUo6TKuTffLVZVuvz3hk+ro3ADKOtZzvJP8E8C7d
         zevBqoyOAJ2WOx6yIUGtBSD2nbptf4UpQaS84uZj/PCzomTR8pg18F+CqafoWMFQm51B
         21XUhkZyGRh8pT6EMbCEuEQDKWm0gqREX3ba+KAMeeGGJDad3oSLTNkROh5W5kBp8mWP
         ZFIemhGqfVOr8Wbbvew1gtDQV7M3KgZhuVClyCvqWmzQBhwdWSNHil6FY0oUxR40a+AC
         UTV5pGtBx3lxd6Eg0W2fxbNjtglB85lfMdy0bULyC6TSm90uBok7V7s5za4omJRXCQAu
         NkvA==
X-Forwarded-Encrypted: i=1; AJvYcCUf/TbR66Jo0QyEYH6Bx9Msepl/sKZyf6+tbvt/hOdiMbv7kra2lWEsPBIRSFnLtH/zMzsPanJgDxJf3Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBz8MDeqX9JpnyFVpZTnULRYeNdT80VZO+GAd96Ph6U/ryARAV
	agjeRngWMQEP09dsSsed3MjEtdpzjEOLr4tnvTs7btvty/kdlJZ5G7ZGYK+BcwSfKJs=
X-Gm-Gg: ASbGnctTHO/KPuQiEgeWuk2Bq0+uzKE1rK77BmNBZBio5bRQrWUfAnC+yKdlCmjTHJO
	wuuYIy30CZoiaOcHA6XIKMKtBN++oJp7uBBa/2/x94sYKJt89EBhUuow/Ii4dST0VnnHrdGIZ6K
	B+DsMvLN6zUod0Fb8is/P9Z3LfW8waEX7HB1x/KlCNXwQxc5jFZqfdiKM04Pa7R93iuGycqpkd3
	AnzCj1YTrkuTWfvRWCR+oZXLIBaT3Z2KS00AyDZkm6rAPtwaGgXBlYMQdrDo3iO7zRZF02TdyUX
	l1Pnwg+097FXOKqgfDfoHkK8xTDlwEo8imjVkIKjSi1kseARzjYVSjjEYheQSEA=
X-Google-Smtp-Source: AGHT+IF25Vmp36Sdt4Pjj6dvxhJMSBF+fxUEb8+u1l4GZz3Fuz0LFMidJsQ+FCmOU1nj7dvp8f6VIw==
X-Received: by 2002:a17:902:e788:b0:235:2375:7e94 with SMTP id d9443c01a7336-2366b3c5b99mr313228455ad.24.1750312080362;
        Wed, 18 Jun 2025 22:48:00 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c54sm12206227a12.47.2025.06.18.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:47:59 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:17:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "zhenglifeng (A)" <zhenglifeng1@huawei.com>, robert.moore@intel.com,
	lenb@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com
Subject: Re: [PATCH 0/3] cpufreq: CPPC: Some optimizations for cppc_cpufreq.c.
Message-ID: <20250619054757.5nxaeckvmaiji5gn@vireshk-i7>
References: <20250526113057.3086513-1-zhenglifeng1@huawei.com>
 <9c82abca-0772-444c-8122-59a953c83984@huawei.com>
 <CAJZ5v0hyMANsOwskEUi1c3XB+heE6z0_-Dk1nqnw-SbZ0dM3zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hyMANsOwskEUi1c3XB+heE6z0_-Dk1nqnw-SbZ0dM3zA@mail.gmail.com>

On 18-06-25, 21:06, Rafael J. Wysocki wrote:
> On Tue, Jun 17, 2025 at 4:33 AM zhenglifeng (A) <zhenglifeng1@huawei.com> wrote:
> >
> > Gentle ping.
> >
> > On 2025/5/26 19:30, Lifeng Zheng wrote:
> > > This patch series makes some minor optimizations for cppc_cpufreq.c to
> > > makes codes cleaner.
> > >
> > > Lifeng Zheng (3):
> > >   cpufreq: CPPC: Remove cpu_data_list
> > >   cpufreq: CPPC: Return void in populate_efficiency_class()
> > >   cpufreq: CPPC: Remove forward declaration of
> > >     cppc_cpufreq_register_em()
> > >
> > >  drivers/cpufreq/cppc_cpufreq.c | 59 +++++++++-------------------------
> > >  include/acpi/cppc_acpi.h       |  1 -
> > >  2 files changed, 15 insertions(+), 45 deletions(-)
> 
> I've started to process this because it has been sent to linux-acpi
> and then I realized that Viresh should take it, but since I've applied
> it already, I may as well queue it up for 6.17.
> 
> Viresh, please let me know if you have any concerns about it.

I applied this before I saw your email.. Please keep it, I will drop it. Thanks.

-- 
viresh
