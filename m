Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403E2288F9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790908; cv=none; b=afoRo/ZuGIxDDjXPYLFqtlLSFSeR/UHkSTxg6ue7EeVLsEUFY9sGPJexcSWSQtzFcRQxQYA6fl0z0YY+1NmEl3dheU93iq20cYwNNQg1sdJD4HkXgLUGCJd0nhmqtGFgAcBSm40JqkLxQ8fAVxSw77KCVxXC7lw8mZJjC0QDOEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790908; c=relaxed/simple;
	bh=cISqzIV2rgmQuFECu6naEw6ahnHMaxpCS8NBxarpuTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tI3a/DjG3Rt9EpcL8DigUju9ztvrLroq6LWB52IX5cdreCX8/xj4aJsK/c8mEALLZ5xops1ZWnTT9jW/YqodPDo/NnO1RZlI7ZPDfi65/md2ZZ41pikBqyAnzOJd8JpwFvYajIu5SbNZgMtpNnzWOJuGmq3UA7ipnH1qe0/3UWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQTIoTgN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQTIoTgN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22435603572so61950725ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744790906; x=1745395706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmSfwQ+4oMYT6Kcqo2GkIzn25RS/V98reH2HMxWJJ1E=;
        b=tQTIoTgNqAXrldVnYkxogF62Z+ZlQyDqc2J0yfJ4ymfY0EKOxKgkWd5Ry7DLfvbBEj
         2Qvzkzc/SeNL82IPXzfPMNOdnJX+bKPJRaDCM8V6VJEN5Miw3hNYaHH2RkIVFNG5F1ct
         BLckGogd3SidOrpGdqs8bOuFTJMgkyUrbyCx2iEZoHQaLc8WFxuZBQxIpSjXAMXLWWO8
         Hf1uepXj5lFF6C78eh0NjPYu9wxZKWwTZEl5LtRxhwjnpNnls+8moRRBcaWpuwtG1Jkl
         K2hzK13e9RGBV7WfgnRW23jrTlcbRCBVMjRDDuWuv1JQOGcBsoVgP63V0UgF3LSLZuH5
         pq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790906; x=1745395706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmSfwQ+4oMYT6Kcqo2GkIzn25RS/V98reH2HMxWJJ1E=;
        b=R9iF3QShenrkllap8qHi3RVCHWb07lFkGzYtdhAs4982irG17MRWFmYcGNVi8QUYtG
         wPRj3yAfZRFcjp27aCKuILaNE1YVaYYM3IrytHWfzfLfXMgq4ONuBfogbrGnMfbYYYtu
         3ck6jMiMEx0EkLAL8QgVBroA310jV+zOcXELnUnIEf2j43l6Wt7nUSIxtz25iFza100R
         Mx/B9+RmD/4omorKDXRQEmxrjz9mGQ4UgLAYufpjaQ5fdFOCSMAkhPAAX+xgbONOzVOE
         2XmidZuRNia91e0rey4rnu1hBaTvcNmSJ1GAL19FwSLAnHDnZUIFuSbPERcWTSRW25WG
         jBmw==
X-Forwarded-Encrypted: i=1; AJvYcCXA7OnisRwIOWTc8IWG8bpLKhe7CKlj8vJxV6c/13cWJVcO8xY7DWejy47Dl3t7sOBQI1ibIkEmXxJ8TxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQERFOMTOWwE1phMahU+1nnwUS92iyPkdwdSm6aevWkOqRqR3
	yg1xkfmy88PQ87pcVkaDm+I19EuAZd1dTdWmvOdMc6Rfr0ascxGmkpejGXd8SDQ=
X-Gm-Gg: ASbGncsg2tcu8HqXazUU01ablE6C98IT2Wi9wfl5ATuigxe0RJ79ei6mqbFILGIQIQ+
	n3EBBfNzdpOItjOwy9jI6K5Utt70SdCAJPgKAfh5ahd75JTV+ikgRZBoOYhpH+qTDQdw63u3h0V
	YW64HD06fOfI2hQ5W2FRYtuu2S7UpeGbzTocJ27zCxQIsODbQnO3rH2eDMxPylKN88DI1K2w9/C
	ZKjpu613XaN2ir+pNOTokcg1xj8kd4vY9NbevvqJz2GrfvXXC/+0A289vXEMJQLMBHY8AL+dIHD
	wVacG3l9XWYND1OUfZW6YgemkBegPPr/mQ5zR06koQ==
X-Google-Smtp-Source: AGHT+IE6TlfbDAIcOi0+kKiF9dSLIx1avDG6iWMigbvyHt10Iqv0HYIjEVBLNqGX+RGWKXXryiaNag==
X-Received: by 2002:a17:902:f643:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22c35964dc7mr16617625ad.32.1744790906135;
        Wed, 16 Apr 2025 01:08:26 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5f4dsm8011945ad.121.2025.04.16.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:08:25 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:38:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, stable@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] cpufreq: cppc: Fix invalid return value in .get()
 callback
Message-ID: <20250416080823.o6urglwgm4qdx263@vireshk-i7>
References: <20250413101142.125173-1-maz@kernel.org>
 <23466140-5d0c-435f-8e73-d1c4826930ec@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23466140-5d0c-435f-8e73-d1c4826930ec@huawei.com>

On 14-04-25, 09:35, zhenglifeng (A) wrote:
> On 2025/4/13 18:11, Marc Zyngier wrote:
> > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > index b3d74f9adcf0b..cb93f00bafdba 100644
> > --- a/drivers/cpufreq/cppc_cpufreq.c
> > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > @@ -747,7 +747,7 @@ static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
> >  	int ret;
> >  
> >  	if (!policy)
> > -		return -ENODEV;
> > +		return 0;
> >  
> >  	cpu_data = policy->driver_data;
> >  
> 
> Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>

Applied. Thanks.

-- 
viresh
