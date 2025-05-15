Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91628030E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297626; cv=none; b=W2CoOtkOCLw8B+wFOgRDj1cvLUnrtogVAwUKoLijvJPBZcphx6TCnmGoBTY/Fc9u4de+Q5M5NsBt6fRdS9i2GErhZtA05Q3eA9JujlUa8i+MuVKyhl8UooLPluVMd76BBGWvFPcvMK84nD7e698mOfrDUv/IzgRRJVTR2unYF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297626; c=relaxed/simple;
	bh=LsHDZiCuPmOtAdvCx0U068D1yrTVcVa5YOtbVk4xezA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFXtF1k4JqAaTn87DIE2GXumAUaWEwEzN7QmO6hHaelTgY4nNUV5+UPF1t1CSJoYRBMN82kDlda0e/UvWFiNC4QUJ8k/SqDnWB5E4lGcyvRf8rnrAH2KHaEthb6YabVc2QDOpjRqMlVUoJ2DubNVmBhZN54TX/8JZjGMtPelldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+JlG2oC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+JlG2oC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13478435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297623; x=1747902423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZP2kpXxaLJqJWX9jqWJnHzn7SyGIvOj3YHIWmjE3IsY=;
        b=O+JlG2oCKN3jHCLPQcCuFfYujszOE1pKagj496idyTksbaJxuO2mQOvK0W3XBvBC5S
         itUvBBQUuZeP0jMF1mZovnuLWjMVWa5Dy40fVdAeeAexmhdBN0Vi5mD6CE7oqs6Ky+/7
         t0ntzVUn1EpiMxkblC0fwJNQCajXPaTEa6QgRmRqSplUasdUEAAj5nZ32LYHtua7lUt7
         vMZusb7bNMvI3EpKcLIE8eO5Q6CJYlyfif/Kk9Clz9VbjmN7phfnit1693SW/wkJsxYF
         YwW2VhlCrvyHSMEaJ+K90URzjxVj4w1h+1T4WDdPBE4HAjfTwV1S5/t6qzxtb9RDUQ/n
         gyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297623; x=1747902423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP2kpXxaLJqJWX9jqWJnHzn7SyGIvOj3YHIWmjE3IsY=;
        b=gMlLoKDH2k+6O5b26QfzCDm2iUbgifqRbZY1pdA7hKyhJJlOHIQSZQ6neJO4lxFCbw
         KRySU2k++20EULT/J/rV2jIoiTsD4EE7x0ta/MfABriVNK1Z1Mo7LYmuUYUCHlZxn5h+
         rnVUdCK6tHEbxrYer/Ba9zEnTY3NO3lhBNi0EHp7GjLNSNgYBTcU+Qz7WI/ArPeHp1wq
         pWUXyryJO98FuvpZCPDj8/NxYB4pItFrKYquylI8zJN2+13DKtJ1ZyEkg478hz0vVWzP
         ddbjFZq5q8Sfq4T/UJKhIe4XNnvVPhz5qvU/qFRObFWeP13tZ6BJ/dOq8UaEKH266QyD
         J7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV4juWjM24KH6G0SFyGMX2SuRCFv+JaXACXi42MXQJlvNLnGSZVhK5GjwF1emqdyi1d5Zi+eYdLMwBLTjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQb4o9nMIFVDXinTB1360HGZx0memGNwYGN/gDwzo0oAOnTw/
	zOvz9wT7ixy/HDxotfbfBXMHH/tUhTkXPFVjH/gKtFu59Vqtd1qryOhub6iywEQ=
X-Gm-Gg: ASbGncsh9quwyE+I3OHXm5DFHM7IWp8+NVhdxG93SY8pl/w3yCctfPj4KQWSRXmBVjt
	0yR2NeZXGonCc6kQN3qrsMbYJSCuyUQFQKNdX7uBtngDTz05oBazg4BqFWgPQ48XzDLzPUpImTv
	lb7A6U9XEy7BZsLUYUGwxbzQuyc8Hi1JMqQD4Slvy10SWrmb1iAfZVL6/h1MjZDcaNl84Wgh+lN
	Ofp/KTWkEOKm19Rff9GlMbM2rl9VUC8vCpYpIYHuyIVZMf4cm6HP6H3DeEA3hflDKOYTps4oHw+
	ik7FlddhDXPkXMTArqPrjn09e07jKdF+6+inJy/nKrzIMxuVsE+mIOK84eJe0UqhlBHCkfRfq3U
	4+h4spbWZjuLdMRwxBSziHjPG
X-Google-Smtp-Source: AGHT+IFOnpARCWL0++dH6WUPgietCDNzTOox11Ti1tq0iHtelLBxkr8d2sfx33fOCaP/5Otj6lud0w==
X-Received: by 2002:adf:e582:0:b0:3a0:b84d:816f with SMTP id ffacd0b85a97d-3a3511e145fmr1575380f8f.14.1747297622627;
        Thu, 15 May 2025 01:27:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecb46sm22235800f8f.30.2025.05.15.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:27:02 -0700 (PDT)
Date: Thu, 15 May 2025 10:27:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert snps,archs-rtc to DT schema
Message-ID: <aCWlVD7yFSQ2mUFT@mai.linaro.org>
References: <20250506022313.2588796-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022313.2588796-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:12PM -0500, Rob Herring wrote:
> Convert the Synopsys ARC HS RTC Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
