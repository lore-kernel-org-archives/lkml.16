Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D2215062
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120716; cv=none; b=OC8lQ0zCL1ZPup/xnTkWOuoVJGEKAEIZ1nvPS2FuFyYyPDJwJ9/e9CQSyHPmMXymp4hN6+3BXPQAjEHZTpzEbTUuPNswP6q2z/erhO7eecjIzvtMORGwY0HBhfQma9DXazEjkmihjOzXuGJ4ISwA6FZOdQ+zElWjXr+J9JMqWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120716; c=relaxed/simple;
	bh=9id0PzQTrOqnlN917S6tmcSU7arYBTtwcAmTKUqpTx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6QaeLKYTam/6MWcMQk52XAvJ4fGPqp04+JTsmTZzmP+ZsPa4vm4edMRavBC7JZn3XL0jjnIFLn6iYHfgBtPkXMzkmYYMEi7DkMwS0odNnUv2H8S8pPtK2nyf+ShCIkUDfOTn3hfIyT1xFvBltA/Ok20oFbElJ6Qwynq/gdh5Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbtrbKPB; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbtrbKPB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so679897a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120714; x=1749725514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxflC1Je6NBv1CJoZue5ehKHX4k8+2rNxAhbjWUDhZM=;
        b=hbtrbKPBfLdZftS5m6fu1Ss2hIstIW3Cp0anwuguqXV3zglRPeYqKXFTwGrzUn+tH+
         vJ0vd89KqScK5E1AAr4CFqjRKjbF9ywpifhSEv0vZFa78/75Szn0iqXQZHUtoR2SPiH7
         hx3NWMIHr1VfTb0WU6ZkYcHwOCFMlF7z0nJJ+0c/1NyFi68EZBzwt6985ZWOuj4gJ7Tt
         30MHYOBU8RfIUKI2ijyfgSk+k3oa+atXeNcD09oF3jFhFvq8gZP690d6MVicFuBL3Aa4
         goPyaBwxOy5+cbH3wy9u4HjmLtjSPG0X/W4N9hjhkpmrHufigOG/IpWQ38OYMgyIuMH2
         rodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120714; x=1749725514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxflC1Je6NBv1CJoZue5ehKHX4k8+2rNxAhbjWUDhZM=;
        b=fi28zrasdSotAyT+g4o7okr4KXdy5FeYGOTXkoI+3zwopvo20M9D6IjzOFQfxNtokr
         eaeD5WIp9G7PVZrVZUE1AeuQGHiLBrKyQS7dZQrh6iTQGBc1PkBCRJfwlESUquTMOQgA
         vQ7oJBSAxflcIieTlL6nzUojeKtRGRiGDcn5ZzSQQOIxyUhLhb3L5BTMfTjarPatGh27
         SRTjsckukQxEHFDM0SJm7JMHvREyZed3vB66hKaFR6aT4k1hkyR1tDo9j/6/pOtUTPKR
         bU3AG2xx8a6j5uzZieu6OU+uerLorEjjXntZ1qasUzHOU58V2XFXDI3AYA1pxBh1wmwD
         FIiw==
X-Forwarded-Encrypted: i=1; AJvYcCUtDyFfCnWCZvPubZ38e5ahYWBl7KUJtnGkEc38M7oRKx+9C+ORF8gPbWoCsIo1OM+CqO1T6NBP1YvKtnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDE4wXrg7t4GlAzKlVAZVS4K678KUFw2gL/OQdMEQBaHNgKPew
	3oG9WlSJ69QXTJXcK5Iv8Jc4CmWolg/t3zrxZYH97PUkUn37JefCYZtP2oOTPswM0Js=
X-Gm-Gg: ASbGncvA+OT2TRtoz/xZ2B93mGpWXODi55RzTNv+kLEcRMqWTpxvrTYEiy6FbGTDIHq
	B12BtUo03hF6RB5UjWktrSjvHrc6YZiaPPQaBlv4N/mIqY9ipSNe/1hm++2SRd5TL93NMtjZAPj
	fADwuxhZ5/6jKJyp+Z8qvnbauWhK6eC7X4HpC+njz2PTMpiFn49L2WRfvh0gsn/DZf1a0IzHtqc
	wGMJHbLgnuApoIqs94lzQU1mnOnYvBkAKlUpJN0BHug1oALWUwLojdbjB5BC/d94yorIrtwO3NE
	LUwDRE8+ysrL4lozcadE1I8L0deNUAro01CF6Y3vO0qt0mRe2TvWicRwpufE93w=
X-Google-Smtp-Source: AGHT+IHu4tZbsrp8f4l8H1I6bLci70BraNurpBDLKW59gH4FCKAHsDuVR+Uq4YM1lGTVhc1gzWLHVg==
X-Received: by 2002:a17:90b:48c1:b0:311:c5d9:2c7c with SMTP id 98e67ed59e1d1-3131109959amr6859743a91.23.1749120714352;
        Thu, 05 Jun 2025 03:51:54 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313318e6846sm1016088a91.8.2025.06.05.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:51:53 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:21:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: webgeek1234@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250605105151.5s6eblr472mbhunt@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
 <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
 <9826e66a-3474-4a00-967d-b7784ff60be4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9826e66a-3474-4a00-967d-b7784ff60be4@nvidia.com>

On 05-06-25, 11:34, Jon Hunter wrote:
> I think that would be fine. Given that the tegra124-cpufreq driver is the
> parent, if it fails to resume, then I assume that cpufreq-dt driver would
> not resume either?

There is no resume interface in the cpufreq-dt driver, it is the cpufreq core
which resumes to doing DVFS and I think it will try to do DVFS even if tegra's
driver failed.

> Has anyone tested this?

-- 
viresh
