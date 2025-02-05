Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A018A6D4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738812; cv=none; b=B80X/0jRhfrOkjb5UuRH2CIQfwT9aTnh7SUwtieOfaiqq5cSNAVD9yzTMzCaCYXBGASCLhjj6bajpbgIc/fSbGWU9LbEsYV9WlnkexxVX7k5ZiTzM5WRvvW2o3GZ6oXYk7qFj9cM+T74bBci/NolB/lcu9nOUulqH0H7BxqUmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738812; c=relaxed/simple;
	bh=im78vuXKud+rm5BqDu/3RU+3fVMHUBCmxgAjcZkyagc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYtPNsYp05bx1llWxp4U7EAbkJzA5A/14Lzf7eLVfOIqQtOh0fSmsrsBUzvR8WXItcjNTa1+pyqEAPxwKsVKgLepefv+kZ2bmdXf113e3gjFU7JF2EH3Q5mamSGA54Pg0xj0pIWvd4tv4nJRvZZSgR3SYiibncZ1ayqYOORP2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0hrGShp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0hrGShp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso113334655ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 23:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738738810; x=1739343610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8ws3eogQ75UF4XPAfpmrJb1OdBIIOKRn93Q6XsSWXQ=;
        b=B0hrGShp7cQGi+DnrA0R/c6eym9L9/W+xiniPfroqfJHeC0uwGNF03RGdETmWc7m31
         /fMePmsdr8iykw6MCVS03sG6EdKnimyYgEua+W2pau/sJT1FlD/vYOm/kk34ctPJfc1P
         B3i5rAivbazWVtAqIrVC4lY7MQvoFaZad0zyDpjRFNuOXBA2qCR1HooZffwH5atTa2ai
         WXEB2aVneNBXHUBR+m++8V4M+dV0WdyvZOJF+iywwaiBbizn3FFrAf1cGwQTk2rgNczK
         ABN9E1OFDu78xvwUKXEmtDgPlYrySGbSyMqlEpk5EGLxeBPFM4hPpWO1Wt5zwWkrwT7D
         A1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738810; x=1739343610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8ws3eogQ75UF4XPAfpmrJb1OdBIIOKRn93Q6XsSWXQ=;
        b=oeTAHqptFo91XCPO6ARBPIHqLWsu9RYGYglszkmLXmzoV1HBC4j6qL6onXZ2ISQYWi
         6btumoH5VnAQCOmy71aBvyII0EllMDZ6L4413sLRK25np5yODoOQgTjbp+Vxw3D3sP8d
         JtEtXHRG/y7FyQjjP/yWMBHgYI2qjvgJ10iWZjycvB3Br0qWc7FtFB1LOu+gx268DzrC
         z6fBjHFm5oIamomAbpBJ3pEvWtM/58QzEKkrq7kFGhCRrs3f2v2ehBB5SG7ey4H09W1G
         9j9wzDMSJPL48fPzs7UcbzEId4Isr/gNZr49jBVB5i3ySf7UbB2KkGqTK9g6nZ8xPYcv
         E7bQ==
X-Gm-Message-State: AOJu0YwZsvCnfw8BSO2VB/sC40oejgs4uzc5yxDTDGrQ73mmbmcCUtSo
	tE+UzBxctSphoJJoU2Ios5QuhdtR/+v0l3QAYrbkFq0NFTWGnZWh14wbN78Xhnc=
X-Gm-Gg: ASbGncvfLNS0AN+g3G07YmfoFlFBGY0Cwz0VRa/s8DNjTMJZnYbwLIV22RJ17zLOFxB
	Cu43f9aCuVB2Y/okfGLhQiZQ/PPPpU1DRfHLiBxKzG8n1996vwaEZXME/w34jfBxC9yybL47uyl
	mt/KfzCpDjztduVF8z4fYxyZIfRxHLd3p29jTGlLZD74hGJN0Jmq1uX+6FKmlv+ekslbygFg/Uh
	XvxSA8tfZhJOF5NUfTzOqlydflmWgHy6IzRw3DCbfcoTrFtze0HnAaWRuBOQ3mIlytsG1hpaH0o
	cZaeGju4q/PkS/wQ3Q==
X-Google-Smtp-Source: AGHT+IFcBfowwoWBH0FBPbI4cZlw9NudpkT74gZC6XMMWGu1ebXPwbrRqUXqsIP4PMl1f/5/sfi3NQ==
X-Received: by 2002:a05:6300:668a:b0:1e1:94ee:c37a with SMTP id adf61e73a8af0-1ede883b7b3mr3096336637.15.1738738810041;
        Tue, 04 Feb 2025 23:00:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba380sm11638732b3a.118.2025.02.04.23.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:00:09 -0800 (PST)
Date: Wed, 5 Feb 2025 12:30:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com
Subject: Re: [PATCH v10 1/4] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250205070006.zpslntq6nwo73o4u@vireshk-i7>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162439.3843071-2-beata.michalska@arm.com>

On 31-01-25, 16:24, Beata Michalska wrote:
> Allow arch_freq_get_on_cpu to return an error for cases when retrieving
> current CPU frequency is not possible, whether that being due to lack of
> required arch support or due to other circumstances when the current
> frequency cannot be determined at given point of time.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
