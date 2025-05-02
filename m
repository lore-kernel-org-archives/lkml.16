Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF531EB5E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212679; cv=none; b=Cbr6XGRRYt896ieeEUJz0YxqmYueFNQkm3NDb1wHAavypEjreVfEXzFI4r2e/aBTMu7xD/8/ogUMSJlZBnP6HTbY0pSOgTO50ewBvhjv7pTuGUkA4H3SjTMaDO9sGDnE+0KJPn0WqH1bovWflm1u7MaIUXmvS8uF1ujrBPhnA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212679; c=relaxed/simple;
	bh=BqtqTKdD0wfSLUZ1EG3RdjGoNfqcNF11h+vSIZQ1Ymc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHXjR/wSY95Eht98ryqU/toHKTHUa3ndxszducSKlaDOpWf2OHUndPmzy+ZQJnIFH7zlA820NJ3kOAMNksiesx+vyk4QWqZRaoFMaFgGvczHaJ5oq9FJ6r2yIp/qwxnLh0Ffx2+oPuaimPtgEiUUj5nyRP9FZlwoGl/ZqGg2pcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NQIbCYgs; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NQIbCYgs"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c47631b4cso1399882a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746212676; x=1746817476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3PKLFA2VVV9aMJem6QKMjsF94f7Td0gw1o00ZukAD8=;
        b=NQIbCYgshIHLPb5s/7S2PaxLgdrPqgQz9QxSaL4FZyRUaWiVRsTHZ5Dzx9kXM/C6BS
         eeXRv2kuocbQG+gGzsrThpARB4mhp44abhCoZj3/IgFlX5v+i08F8ckS4wn5HHY+HjZZ
         Y3Z+oE3R587IfrZH0E38b5E0ecGDIyyNpllIOyPYRzTIA+xhgm50joqpRVN6tBjiu4EM
         N5LHs8o3nzDay2CnFGmVDzsnQe9S8s1iJ0CeW9ZM1Fx5eAc6Qr7QTbK6xtFeUCF75id/
         ZsvmNw+e64YbybAGWbEgjZlrTkPQOYHe6YHVeh15dWKzGNch6VgG357dbZZlU+oFmYs+
         A1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212676; x=1746817476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3PKLFA2VVV9aMJem6QKMjsF94f7Td0gw1o00ZukAD8=;
        b=M2bt5jNjctLZxJ0u/AQ7+qZD7W9rrMHdn2S9Tfbn+l3Inm8Un2BzHqi50gezSTTKX5
         OkLGYTL6SKlCl5bT3wliK2NyENOyf5j+fEAy1gz6yyZ8rvr5B0YB9+1P7hyCjfQoOm5g
         fMtAlluyBgk2PHwxgMbCQ1uLbmvwDAYxuAxyLv2ty78UTu1Ru4yXqq1z4//VVFo3w9mU
         RVLFNnmPE7Lx+MvLu8J7ZCtDL7vsPvxH4CjheIJd2CvvZcyrD30Wqk1hvGIQqBV/N4f7
         45FqAeODPVAneJd6m/bOu5+lUK68TlIOHR/1Aue6nQPn80qJofHmbzQTEYioz7P2hcpF
         xAbw==
X-Forwarded-Encrypted: i=1; AJvYcCVDdMq8tjXiYqnRIlj4N5L1F6HEr9KXY/JLagPRbVib0UIJqxmOyNBL6WCsvw2rvz/pFP3xY9SiweUbXfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFiIti9Ykj52+iuwiCX7WcoYQVL9+Tv7frryxka/xulY33WLp
	dIeyjtC0Bk+KUhiMxtiSztK99bEOnFNkcXEwk9EObsh9Vio0kwFSiYEnFaU3jUs=
X-Gm-Gg: ASbGncvXW3/Jk4CmDIJAt0oz0b0/lRAfZex9Tvs7YA6rh7DupZ2fVYqXLk+btymUag+
	iw/dtNtSKit0mu830+FiAiAmv4LZEthN+KjWBBxeaifK0+aI2/e4DQ0wxEeIG8tHaEBry74P6qq
	xtqpiWYjuYsQnUo0/NuSTFp6YE+gtjKIjiFx3KdEI3mFH50DfkAgi4JO0uNpgPbWtUFZjSOf3Zu
	YoyaYlG5/Y+jVZfSSW3CQOkX6U+80fc9/YHLhhqX8gF6pZwbcUO+lwuBVdmG/zsZcKyblE0Qh8H
	JcAgdtnvLDSs30Wz+SC4JDXk1X7WPIH5N2TeAuUIRN7LwBUdwVixIj4jlDpROcU/SUQkzqm9PHK
	cgqI66EySyXqxM7xgFg==
X-Google-Smtp-Source: AGHT+IFvwfGrNvE39uQ48bU7A3GY6kQiwC6kAAl9UGMdUVUY3hdyDs8bTqBwhUAODN9l0novkb6Y7A==
X-Received: by 2002:a05:6830:610d:b0:72c:3235:557d with SMTP id 46e09a7af769-731da159bd8mr2434917a34.13.1746212676619;
        Fri, 02 May 2025 12:04:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4489:d382:ca90:f531? ([2600:8803:e7e4:1d00:4489:d382:ca90:f531])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d31a1f04sm590393a34.14.2025.05.02.12.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 12:04:36 -0700 (PDT)
Message-ID: <2349fa18-efbb-44f9-bfab-323ab3ec2453@baylibre.com>
Date: Fri, 2 May 2025 14:04:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] iio: adc: ad7606: add gain calibration support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
 <20250502-wip-bl-ad7606-calibration-v2-5-174bd0af081b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-5-174bd0af081b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 8:27 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add gain calibration support, using resistor values set on devicetree,
> values to be set accordingly with ADC external RFilter, as explained in
> the ad7606c-16 datasheet, rev0, page 37.
> 
> Usage example in the fdt yaml documentation.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

Tested-by: David Lechner <dlechner@baylibre.com>
