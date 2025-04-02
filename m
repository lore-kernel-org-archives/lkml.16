Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB782D7BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606311; cv=none; b=jVvVA9a09tJE+gvXI9iu8zTUIItl2dwWt3sXTk6viTQrTcowNchGXA5aJw1pkC5uciZ+bEnP8Xiyl6bYTOcOpSiSgWhRC3z3M8Q7esVrbeZs/92k6phAW+MJKsNGQiUSXmk6ShaE+aOMXvC287JNJVcLpXZ6pDwcB3v9iD+MfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606311; c=relaxed/simple;
	bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYd5yLEiFEhA9L+bIZodSGVIRAH9zgKZKcvSN/N1Uq4C9Fk+bZ/qnZ4ySXAf0Z2HPeIbLTlSmGUDHFHtM2L4+WyuOzwyWxhgPRy6Jk8pvCHkDtdHpLDhvqFL7fHD5CsvNnzd0f22Md4LAFnOsYkOsCcsPwA43whXLjCyM+D+jlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umZf6EMA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umZf6EMA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso65242145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606308; x=1744211108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=umZf6EMAtuQjX+nLwIOVhcIVhFi2NfdZ6qC0kjy21ILnBRxECleVB60UIhRhz9MUSR
         gEy6Chf6zh2HMEClEA70vEua4b3G+hsVZl177puKUYXa87kDjqluUICnH0JbeM+Lh697
         M/kAXdWWO8Pnh/nZueeBBquA7NJXT6dioENyIrXsGSsPLzAZiB1CkOUZ38AqC8+U1UVo
         mzHrh/vQLNviBSBr1SLHPnvQhcj65Qk++Nq6N2dfMryRBwN8d2uFCcHN2FhH7UnBEKbg
         bbT/K+FHsNmwtPjy428+XnDgKTd1SKvS9mTzJNMZNxsXniUztZf/8V/dehTNYpVGUR5i
         vtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606308; x=1744211108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=IOXokqQWw4uXEaxe/b+wMlR2Ct9roLxk9Yc8TKzQl417dfjuf44TfxIuZ7xgTBB6EV
         Qeey/zoZ/HSooFHJn42irqd/u/8Eb+26Z85V3gd85hsJJci8zsbjteLsWkHIlGFIXy0+
         QWK+3zqkuiErl6mspXuZSMvlgWR37PbNSNprBgZuCTHOphBn+Chlrn56S+jTSANhOJov
         jUTSj0UUhncegBqJJj3/11b85agdFffQuhrKIwTaO/cIJzC9So+4mzCgCx055lBhEFWg
         2OZJDXEpmW/altVR+KD6uPY8VRfUDLLj8BoMp8RT6Yk45LpAIR0eRzS4w1jyaG7eGMrx
         rK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDiYQdO3/EuKFcqno061uzxwoF8/PyyBxyCdCnrq0+DI1J28JLvb4V6Tcj4bZdxNgVnS0Vm6YW1IeK1Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuLJh3UwbCTaPNitRw+9AB5UAR0bN3TC6BDUvMO/46v9a0arA
	5wXD7YiQIgZnSjOWtw5HVRydg1JrfzdKr4G9Xz3PihlpFDAxbKG31P1AyGB1QjcVFzsmEKyHhQ3
	U
X-Gm-Gg: ASbGncs4wIaPHYH4i3a0Vc1rk5Vb+doa/4UtuNoact5fvNixHslQiIpCiZWIRzXkmXC
	ZOPk8Zqm6pNYwrqjDcbjFJsr/OZQ4lt/zbi2vIW8t0BrY9zKH6LQYRsMH9KOJgtU51h6MYxaeTk
	hjq0bJYtKsKQkhaR0WfOPzfkdGDySFEBWZ7hfUDmE0neyfw4dBg4xdfiwUMfu1dWZyiFih6P34n
	7dv5QhfykfFVJzl2f8ixTH1mkBUUeEujEOHY+HpUUW8ugyfnU6TozKanOoDJkaUxtsYU7pWDU5Z
	OCRvdZxFRaXGTnsgbD3v7E1iF/5xPnmTqdI+OS0Fz3R2qEldpqRaL/R1zVbS4Yhl
X-Google-Smtp-Source: AGHT+IH/IctG7myIORO/EzXrC3V+Om4UPDBH7NpSniE6hYbkLj57G56aoDo7s5vsIlXA9aB5eig1ew==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr159095505e9.18.1743606308125;
        Wed, 02 Apr 2025 08:05:08 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a962sm16969806f8f.46.2025.04.02.08.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:05:07 -0700 (PDT)
Message-ID: <abec749e-c382-4907-8f49-960595c9d3b0@linaro.org>
Date: Wed, 2 Apr 2025 16:05:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] mtd: spinand: Use more specific naming for the
 (single) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-7-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-7-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
