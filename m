Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F3242D9F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315726; cv=none; b=Z3vDtvzd3Y0zyiqXnK3aLzH3mcV4UiHc9dKgibvfkh13DEocPOq60RliJVhYsyUC+7lqxw94N6nQHo9800gKU0nMTORa8SsIROd1mcjIv7gaRLwk2TOIjDW6JrHiCpkdfwDE72wnzKU9X3fVzLCPeUksmRCAjLSWjhkiMZsODMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315726; c=relaxed/simple;
	bh=GDWG1PRFU5j96a1eFhV9iCAO2DXLLc65o4M27oWsZjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb7kdigOZ9EMrnbNFCexPWLuGnwXmxBeCpDV4KT39xG2qSPNxm4l+GHWA8adbZMihxeW3Gj1c+DKfCAHen0hM3gVXqIcnMzjgeEwbJM0lGGdsOIAFLZieyeT8g1mVX1pBMBi45JVBYHoafsLbsghT7fcH6iqFoM23HhokMnPqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeXUMA/I; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeXUMA/I"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ea292956so5206725ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750315724; x=1750920524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmj4980sim192opiuFZyqbVPlAdyLpck7KOLA4fpTtA=;
        b=YeXUMA/IPzTCTFCMqfoH8C29AHwuLyLXxomh0Tj/xzEJo968Svc6VYfAmwA6BiOwuZ
         vKh0IsXrlD2rAgmeeulFXxfbSUJbem7KgE/EAB5cnnnSKtzFoV1l/Jf9tAksR9q3b4Gj
         +gvPBjoymtJj5IQ/NxIVnU0uOmIFRyyL8w23TrJ6jj8KlCTIs6X25An8qQzAvAUFDb1E
         dHak923mFcLYiF6ztc3Fl+rpZ+av/OmDjctB9NrfLysazIfhOF0i3CUPFtNtBI8xBK9T
         pTKKayxqeMXSUSOFQFZGyQTeFx5Yc2Xt4kqvX+tuZFnAPCzXXBbkWY0oJ/5pZxe9aCEz
         /XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315724; x=1750920524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kmj4980sim192opiuFZyqbVPlAdyLpck7KOLA4fpTtA=;
        b=e+B7ITvWEPv1OMR3fAmJA/wEz2QNGaUilTgwc9+Z2KIy7PwUNN8cOJrYZC6GgzT/1u
         p5Beng3jNnNRNkE/KXheYXAGKif9j1ApRpd0PMPY3GJZBIaDbkNit/QpAVNRx8DdLFP3
         oLIVcFpB0UePwWgWzMdX8cNapzXXC90NJBoV8z1pkArSgIe0/9NwgKy5N2v3MJMH70+/
         GuNLfQSJxtqQ+91gwXTbpw059km1lgZtHT65XkKnR3j9+k2ZrgiPJqDUyQ8BA2HoIc92
         VKM2lklg6FR8geTnlIoHeKWWIgky4P3EB7ExTNDLIad9z26LsBGtC8UKp7jAeC4sUfyz
         0UJg==
X-Forwarded-Encrypted: i=1; AJvYcCXhM4P9LuD5GqWaFgJhAaMwsOBcl4ZycXLxg0/X9mCFuMIZwqx/iu8AodkcImc9Jpr99efbumK97HY7fY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YybsZ0CGJvs9Bfayr5erigPYmgtLWzkUu0K3C6NH4RmKKgfzQr5
	W3vXRZBrb2tVnGgMmu6X+iXTLY8A2xKSUk4iJT+jQbGVEb40ADmKlrFzNNYpJ0rG0V4=
X-Gm-Gg: ASbGnct8yzVocJENNCUMeIawSxnXYjU1mYROktme8a7tpLQSmNWYtursRHOey0kk6SW
	KOSDn3v56T0aMXuN/4lSt+AH+ok2nfXuRiUuVOs0D/5OF9o5FErwqqLcqaaIv2OWtVc2PatHrol
	fXBTfLUL9llFvKz7rbECNA5XPgtajfibqKST8IXtB49EvHcjp6lKmhtSihucPBEVGr0mRN+WCV9
	kSZB+Ln8KkVVk2Q13OacmKsoenBYp3P0QGYolFqLGeAUFZkBnXA6anvZ5rzoh6cZuN3IaoS0at7
	2T9LNIOQpCNyKrXhBgREgdIihPHx41+t3H49qa9pcqPiiNkERE8cSb9QBn6Tyz0=
X-Google-Smtp-Source: AGHT+IHvn+UOJxoqNp05beN1Gg13T9O+dl5YLHIw6quhM0C8oFi8rF/+koOdFvtwRsFnrVMah7quFg==
X-Received: by 2002:a17:903:94c:b0:235:f70:fd37 with SMTP id d9443c01a7336-2366b006110mr307344745ad.19.1750315723908;
        Wed, 18 Jun 2025 23:48:43 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decb0dbsm112588285ad.219.2025.06.18.23.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:48:43 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:18:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
	"zhenglifeng (A)" <zhenglifeng1@huawei.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] cpufreq: Fix initialization with disabled boost
Message-ID: <20250619064841.ksab7dilht43thaz@vireshk-i7>
References: <3cc5b83b-f81c-4bd7-b7ff-4d02db4e25d8@arm.com>
 <34651625-08eb-46df-8075-4c5a08d15c18@arm.com>
 <4b551b8c-6572-4fd1-9bd8-6669aaf69271@huawei.com>
 <e9fc6154-7199-4709-b428-3f848f1597e8@arm.com>
 <9710acf3-9ffd-4b29-a51a-21d91cbbdf5e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9710acf3-9ffd-4b29-a51a-21d91cbbdf5e@arm.com>

On 17-06-25, 13:56, Robin Murphy wrote:
> On 17/06/2025 9:20 am, Christian Loehle wrote:
> > so calling policy_set_boost(policy, enable) is a noop here if
> > policy->boost_enabled == cpufreq_boost_enabled():
> > 
> > 	if (policy->boost_enabled == enable)
> > 		return 0;
> > 
> > We have policy->boost_enabled == false on boot, thus never actually
> > setting policy->max up ever, which leads to the following:
 
> And for clarity, this is with the cpufreq_dt driver (at least in my case).
 
> > # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_boost_frequencies
> > 2016000
> > # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
> > 2016000
> > # cat /sys/devices/system/cpu/cpufreq/boost
> > 0
> > # echo 1 > /sys/devices/system/cpu/cpufreq/boost
> > # echo 0 > /sys/devices/system/cpu/cpufreq/boost
> > # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_boost_frequencies
> > 1800000

Hi Christian and Robin,

I am not clear on why this happens. It would be helpful to get a few answers
here:

- Which driver are you using Christian ?
- Is this during system boot or suspend/resume ?
- At boot you see the boost state as 0, while policy->max uses it ?

I tried this with cpufreq-dt driver and this is what I see on boot:

# grep . /sys/devices/system/cpu/cpufreq/policy0/*
/sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/boost:0
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq:24000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:960000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:208000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:900000
/sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies:208000 432000 729000 960000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:ondemand userspace performance schedutil
/sys/devices/system/cpu/cpufreq/policy0/scaling_boost_frequencies:1200000
/sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:208000
/sys/devices/system/cpu/cpufreq/policy0/scaling_driver:cpufreq-dt
/sys/devices/system/cpu/cpufreq/policy0/scaling_governor:schedutil
/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:960000
/sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:208000
/sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupported>

# grep . /sys/devices/system/cpu/cpufreq/boost
0

So both global and policy boost are disabled and they don't show up in
scaling_max_freq or scaling_available_frequencies.

-- 
viresh
