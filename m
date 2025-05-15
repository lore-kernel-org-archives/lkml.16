Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9E288CBA
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297670; cv=none; b=BJrhMgENO/8+Mm4ua4dvpN6o672FwRiioHcSD8CBC7e7VAej2iOAnO5h1j9Cj+xql/hie95wWU8MG1YoaAVoK+lEYdJnGtP4UCMK+bXmT2fvjfhyahO6r+6mVA/nHWxcIIbvtdaSdJDpoolKTUTmXAd3QU1ysT2bP++M9bhQPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297670; c=relaxed/simple;
	bh=XBkjoe00oBlTYtry2tGVHungSfbmtqAa/sjWoE6QvJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SD0HClYAbm33GXb7qqIfD3OUW9IB1NpGVDGw9/0kk+f2ASEn6LYXVuiBrS8QBOhIAcGSM5IH6U5xbraTZwKk7jC/84I3XoLE/Bjbvu1b83lGAoVLBd261yIDMtvYXa75rn5bw4NPuIHb14jzzP3ZHvOPcFH8FNtmDwIZ8SwO/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayGimTK2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayGimTK2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so371410f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297667; x=1747902467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcWMQqZPxyGhQrPRZPMbMh16WqECLxz8mt9XBFFtXJo=;
        b=ayGimTK2N+GnitVxqnsy6/zogGhwOow7hQgD5wYCHqibU530PL5W3sMpE2pdxKaTJD
         WPIyh1GhNRRklXWZLjHO0iHI/HGAIJpdKxWABVQ0kxgrXhPxAoEFJyqXygB9U4WpSJB7
         IL9zrNwHnXNTNMfo8IixXlYcyWHCZMA685IWeyKPqevjYqrx/E1nyj5gs/c6Bof6W19S
         AvFADcqJe9sspjjdIiHtjguSnRwHzi+TVv3vM8uHtGckikyGe8sLuZtDhwfD/fu+UM3U
         0lehgRxwqfttKqatV2WVy+bM+9qA794cP5+1hpPzpD6frF6YozBNLJoJBG/FNYc7YmYM
         i+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297667; x=1747902467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWMQqZPxyGhQrPRZPMbMh16WqECLxz8mt9XBFFtXJo=;
        b=WdWKVm84YQFEJ2knENqxkc+aNoJVEReLCaM8IVmopnxUksa66rjFntHNVeJR8t3yqd
         TYb7bUI5j/nnpJl1mYctbeeoij/jSlREip9E56mSiQsm4KjN+eDefwHXaiirhw5vV9zq
         kpCyl9snP0egODMlma/Hxq4dEq84+txeVXCTfkz6jdOa4u1Q/IIh/a5CUp4RjwmWJapY
         tINOcEjUfyFEHU/e1BPxyb2rcmRSUMutU6N8ox9+ZKEglqx/ZR7v7RKhLshCQrmLY+G4
         CvjFnADgwudne2ZFLlWyuYbuebHQyEpV6jG/2L/tqoEyJj15vbxcjrVKC7VKLtRJYPuJ
         PTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1WbpJ82mI6TEzb4gopjvlCqNkVfnLTY8TXOqo8qpkh3a9UM0WIif2GrO4kmK5OY+3SxHCWH1uPMbepv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xOjndqej1RbTnzAClu4BOU+RQf2r1ikQD4pgU5J+VhJGZZUn
	u6TTri8lGTjIidPR1zRSt6s87nhAjhldud7agmQ+mb0OMCgRU56mZ2PJM1WZFVQ=
X-Gm-Gg: ASbGncts4oZ1dKmr/uyN4U0cf+k9FDUyGLNeVNngO/QZ2zuAKNngRadohIIyi0T9fyl
	RvJVigUy0ZVl8uTXqt6ly0KUOxNYTjUVAk0djEQExnHAp53kzHMxyEf+PslhCWuw5TWKItam5cQ
	C/RkCbeNu3YAxUkJrwy/5G68TVNumvff8uNerHmzEj+pY7A63zXe7OhruVxRgq5Ewm5GxFdOE9G
	KEdn/WYlJca4z77hb1mZ+AJY6kLUsRiz2neldpRoRenBigZwYvBvrCsKWIaNE1ja1ixgwTxCbKN
	x7fiXu9ILlJTh3huPpRzAYQlUIE+wLbTddQeu2O1MQc+4lWdtY0adsmyJb+eF0gsaRIjJAGdvxQ
	51rwIgZWOWBLLZg==
X-Google-Smtp-Source: AGHT+IGM8pVAAaN2XH1upx9CNuC/JzogliRzg83rBByyimAhUDf8Q1jZavviL1SU8l8bL2kgFHxkWA==
X-Received: by 2002:a05:6000:18a2:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a3537b2ef4mr1237676f8f.52.1747297667377;
        Thu, 15 May 2025 01:27:47 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e853asm60841685e9.26.2025.05.15.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:27:46 -0700 (PDT)
Date: Thu, 15 May 2025 10:27:45 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert snps,arc-timer to DT schema
Message-ID: <aCWlgfKXUC9LOou9@mai.linaro.org>
References: <20250506022317.2589010-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022317.2589010-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:16PM -0500, Rob Herring wrote:
> Convert the Synopsys ARC Local Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
