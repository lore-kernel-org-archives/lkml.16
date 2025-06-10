Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0128C2C2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553860; cv=none; b=NNFfSdvBDaC+bVZSiIcclXYgON12Wvle4/KPXz+SWl71Gd91LcTAUk9iyocm7FXv9b/a6v8W77TPra2OinMXrvIJJnDN458/+TPomJR3IhpLpxe0/aLOW5OqULx1891aAIx1u2UcdPa/OPKKYOi4Mqv+Tz20cSfPv/WL4jlPncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553860; c=relaxed/simple;
	bh=moz2wim/rfV0N0Eam+BybWtmQPf4KPqMQ/vPGwKbkWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBUBGS1F8zAJObAJ1Em78+zYnQs6sqjue2X5acsrjNShixlFm+iFRIoZuYuAj3hVdHT0/ODwl/Txv1JePoVZW04TLtD86eTntEwcu0rUFUmIxKPImSXZR0qJCcStOPazsjJ7whuMXK+DhUOueop9FiVY8MdgVTmZWMxMG+HEaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bZf5KJZL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZf5KJZL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442ea341570so34677055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749553857; x=1750158657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q/ZgTSjkrs+z+mH2vucvlcudnmZL89/lUFX5jLOims=;
        b=bZf5KJZLAlvtQ6h3Hx+hicQ12578idIoM4pQTxaGuMofgNp+6qd4JgVgp1W41wVFnM
         gmC+yVoo/u+tlh0lWhPjfyu5YdzRcHG0ePQiCDZUeolMoUEMY1fC7C/HZ1PhvKoas+qI
         gC4CLreXQgGl7hn4jSHWBh25786usgQHdXq3ZlhXtL3DsTXDCtnkMav+xrB4DJ6erWP9
         m6bI4LZE8YOXKy8wkDDQk7IVSQgEIUwNWdjevSkkdEsJqj4xq/dh9x35LeE9P3haEyFQ
         D5Mm6rMkpcab0DURPUbFrkk5IxxqdTiROmcvqzm8j1LaZCbNgj07hQXBa2v42wRw3oYu
         K2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553857; x=1750158657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q/ZgTSjkrs+z+mH2vucvlcudnmZL89/lUFX5jLOims=;
        b=n7V9dVq+LPUh0g9uIW8fChBgJVKf4pX72B2uJsxIfsneqdKQbMGhMwBUeUO8gVuD0s
         N6rylQI4Jsl6vKUFEAqNmcJ9YG04KMUYhS2cXtBzk7UQLjRhiOCCdowAL+jHhtTrUEYG
         ehf8arpDbRJV7SnvIMyRoJ30Wmqcjp/DzS8McCAhUD2pwJYywy24ez4E9KnQrvTXQYhg
         kED9CAbOrdHuhe3v67HEXfgOfh7GCfdu4Vf5eU0wRDd4o8nQr0mOt/AlT4bRXLeqIs3W
         tZJjV/z8Ngli411AhnFgwrNZVXv5+i1UfjeNyaHSwspWywmoM9aMIpMYnwY0OFSDq4Io
         SC8w==
X-Forwarded-Encrypted: i=1; AJvYcCUM6q35+TWZHjAEJmJ0JPhLCuHwi3OnpO/WRmCwHZxPKGe1kOVtuQ2rIKQbjkoMA1A5kf3yu5ScZh54PrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrE/08hCvN33MS+wQITm15y0V9KicFcqhyTLXa1lOfBu7TvS81
	jCgKb/s36Ygte5mswyuvtmJp5vso6PdP+SEX7MmJt4NjcGmq7P9ND8l5JKxbFNtX7cw=
X-Gm-Gg: ASbGncuH9fl0SBIsJCGRQNrNjEzw1uqYs6UAHmSHvEiBmxBbeP5QVntolKJWk/KmdF3
	CrFrXkF2VAmrAV/nL8sNNSpX5cmlr9Yp80fmeVaKPRgvWvCkWzys/E/r12iOFTITb++XPWQ9BHi
	8j02UhfQuzYt1J6SQTu4QpxNKP4KdPJGhzfXvX6rZPYKq+kURrcCJbVG7c6OUktwVVq6/RxGodG
	9m8sGNRGcLrvkDREhQAnxi+XpQHp3Uon+5urB1ghFq4jFmX0G7oGa98KHPOBlUjpzFlJMODKC8M
	dg4bmOpAnPQ1r0+sN0VZPSlyweoDY8xQnAwm331qOvUpqOpmXDW0iko1bFwQqOIvpCV/1Azs
X-Google-Smtp-Source: AGHT+IH5Y3x1Ki501vRLyJm67k0wpvTB1sBYw1TI/SnhFi6z5THD53vwm2fVgUQX/KBtW47aDeeIdQ==
X-Received: by 2002:a05:600c:5396:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-452013681efmr181694725e9.2.1749553856655;
        Tue, 10 Jun 2025 04:10:56 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452f8f011c8sm134431845e9.3.2025.06.10.04.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:10:56 -0700 (PDT)
Message-ID: <2a6336cc-b5cc-4f8f-94a5-d0872a3c95fd@linaro.org>
Date: Tue, 10 Jun 2025 12:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: Fix pdev_resources_assignable() disparity
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Rio <rio@r26.me>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250610102101.6496-1-ilpo.jarvinen@linux.intel.com>
 <20250610102101.6496-3-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250610102101.6496-3-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/10/25 11:21 AM, Ilpo Järvinen wrote:
> The reporter was perhaps not happy 

No, no, very happy in fact. Thanks for all the help!
I figured out that I need to get familiar with the resource fitting and
assignment code, and PCI in general, before trying to fix the problem
with the downstream drivers. Which is something that I can't allocate
time for right now.

So even if I couldn't fix what's going on downstream, I'd like to thank
you for all the help and time!

Cheers,
ta
