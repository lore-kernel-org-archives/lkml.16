Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF33B1A4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812975; cv=none; b=fWI4br2cz2x2lYUGTOGqDHRj4kwS7KYNTdjgaQhVvx4OjxkyppKs9U+DyTdK7LPcUxRLo8pmAkClZ+vUnJ/XFt0Oe3w46PvcB3aUTCtCdXIKE+JHr3qhx1kDxu2xmCJR5uWh1I4KlL1WqCsIvbwNw9JQJI5XL6Q/cgg+ECG9BgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812975; c=relaxed/simple;
	bh=nUn7jpead0jVpksmmBt3fvbMOGLyCxMY1xFmiLz0+Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oASkU1N0HLcrfOyZaHGPghRdYd1Ju1uEc2X993sCixCz8iF5VSq3vlChi1Yu9agUn+xKb8KKJhwzvAcT70Zn9SWN9MXYiPsngIxedakirMRRRi1tiFTL1R1FWgl1cQ5Cv7VBh8US2nXR8Cs63ZBaYYIpUYg/WdNSgNGwWguDl6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0dPKYfU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0dPKYfU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165448243fso12694265ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812973; x=1739417773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIOpqioAgB/ndF8DP7XFwysQIB8lV2nNyd0Ih1ODRvU=;
        b=b0dPKYfUUKw+LrBc2GVnI+OqvHUJoGRb+NIpzvr5zv1Gh0tR7qjLvZt0zN2B0r2u/I
         ZrW69w1iq41jjpt+Zet6LxCo7rkBEyAJone251wf1UbzcchsLz8S0Q4q90jrlUgCn5we
         i7N+CVKUZq4o0QlslEKt9w1NMew1AkwJNvJXVfQ2Aqra2JOxhju13EmDTzMb5bf6EhXN
         w+vdhIjUSwuJkzFqDEQC76sYq4/zyhcEOmHjJyO7pH9Wm7DxmXRVAXellxLmqxCjDZOr
         Mh0eL8DYYHsDXd3UJgPm5Gczrma89V56cPSkRbBkWQSnHcGqwJcpjusjhrJvn/N0qdeG
         Gn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812973; x=1739417773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIOpqioAgB/ndF8DP7XFwysQIB8lV2nNyd0Ih1ODRvU=;
        b=pJCa4Mo9AnzwjTIwq+NrbiZY+pnjWVIRSVzEc2SuwvOOXJZQJdD1qZzmsP7IjyILob
         Lagf1ECvwVkxKX/th/rFuz5/fCE+MtY1KTSHfRR/R8GvnQyBtf8fpNonudWOzcwXtNXg
         aIocY9Iub/1j0ZhZABOT/VCWs0G7pno7BzRL5ka22j0DIXzf/QZhymBhLFfO9ERHXrxb
         ceCUw6VdoyY7LaLw2FZhVc5MuhVCzA309AHApvWwM6fJop+Pc8SS0vCduenIyjJ17xpR
         Gxj7XULTfMkbp9PvtNdz7IaiuEtNANSTZ4PXnxc+XnOhtadyjgmpouRD0wLdJ8I+InII
         iyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW+7bbuglrh5z5EOWZkA1yNHbZj0GUvFmY2WfHxN+CPU5u6wF/rZMDZg3SU5AcjiCNA1OVI0gSrdAd3js=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0SXmB+JDu18hZR7gVj/pzC4RM4R2wb9GuN/RtHoPDIKRPBfC
	RMgGjvBtxO+MGxA5v135zFy/QSpxZd5OHHyZc5aVFH5sK+VAc5WUCZt5+N/AbdE=
X-Gm-Gg: ASbGncvUjZ4pTlx3Joigr1/idUFvkR11ugCyX/0a0yV3avAvwMlSnAN8vlzf1H0dTdA
	tNGj+fZ2MwKpf21QmUvYcJZnBR+EKtSbQi2F5GGxF9Onxabm0oPS5BpBZ67sVPj3pJ6OjSEykca
	qgPxgFneVGzeEkA9wQCUbYz4xzYaH96N5jdgoXnQtrW4/UZZMib2cW0vVYmvqus4MMqUjU4eKfa
	vPWxW9lIcydmvEmosymR132k5eYDs9QV2acw5TdIj/FYJUj7YCl6m+tsQolHeZg29CvxLELp3CR
	FV03pPPhyPr0TR+93g==
X-Google-Smtp-Source: AGHT+IEqTGzce3M40oO4G0cKjxaLxgPjJr9NNCtr2/Bik129TKMeIjQQMblYfK3AauPHmIrP0e8gwA==
X-Received: by 2002:a17:902:f681:b0:216:61d2:46b8 with SMTP id d9443c01a7336-21f17e275a2mr86399375ad.23.1738812972871;
        Wed, 05 Feb 2025 19:36:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368afde8sm1668905ad.223.2025.02.05.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:36:12 -0800 (PST)
Date: Thu, 6 Feb 2025 09:06:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250206033608.qgllu3dbcmv5o4fc@vireshk-i7>
References: <20250206115403.67140b26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115403.67140b26@canb.auug.org.au>

On 06-02-25, 11:54, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the pm tree as a different commit (but
> the same patch):
> 
>   9d51d2710061 ("cpufreq: airoha: modify CONFIG_OF dependency")
> 
> This is commit
> 
>   90508a1bb8f0 ("cpufreq: airoha: modify CONFIG_OF dependency")
> 
> in the pm tree.

Fixed now.

-- 
viresh
