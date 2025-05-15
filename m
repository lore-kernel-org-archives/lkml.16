Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8C15278E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297226; cv=none; b=NdvSZnrWOfxOkAWnxPBvidpNOkmGr0Zkw8fS2BzK7vkSPK2jiDgml0qgaFF2UvpB0O+lYfornd6qoVxfnOImR2vkg5f5D4BcWAJ7nezGfxCnLmYD81KrnLpplgKmAXfIs8UyREQYGYifWJzUJbpuvKXpJ8/DvJRKI18ltiQv57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297226; c=relaxed/simple;
	bh=FIaTKX7b4nzW2qlX9kj69WF5Z2/Wk9ZzHbCQJtLHzog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWYPWa71QIDBLmf5+TL7XFeygqhXhhZMfRPS4fVFZ2r6Lv5HnZTZLub7q/fpk9KanqUMgVJlokalB9xs4evlUbpnVEQlScilqv3+OXqhGBmqsTSZkTBUlb4ee2rss7YaAHTkMNSNjCZ3rL/8FBED/CdLKXH2GWMXaWqkq8aCCjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKQPbD8C; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKQPbD8C"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so366484f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297222; x=1747902022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3sxhMO5RpeGc8vdDtyGXyj7URCP6ZAr4eRmvlXBLrc=;
        b=QKQPbD8C5euGPIjYCE0UhSQjLerneuvpGLcMzKRL9uQOlnk5nSC0kpOaO/AdgXjz8D
         QhuxCGGpKGZd7ArgdGVeKsfFQEDKZrFLb/eN3qTg9EDj9ylxbr4d6W64nOOyPT+4IS/m
         ZwD8G2Z7O2uCFOSMfky06l5zURp/PVbyORZFvIQBpMpbZksTEwbZSu8+kfiIf7dlllz/
         KzXgND/YOBCdT76JlctgwriMxLXAb4vtVmoT6a76R+7K/fvAkZroLX7Y1S0UCoBrDfbh
         Zx9+72gzK0qtwPkPXZrhyKWN5lg15q949Gr5FzOyL+scujBDSXtKMoqsWSxpwgPDapyN
         pvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297222; x=1747902022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3sxhMO5RpeGc8vdDtyGXyj7URCP6ZAr4eRmvlXBLrc=;
        b=C1cjpxyDTdAsf10TeZydocGbAt5mymIe6/zzJC3WO8ggA67U+D8E1ivfRnP4dkxJM/
         Zi2DK258YaLFN1xjISCpkg40I8JVgwy/mLHploufm9zGKwdWK8cMrFt1EkkIZIWXw85z
         vP8pOsp/034b5I7jo4g/MH5zO9HKf8n0N+ln99rgCucuD7Y3cAU9m6QqsNS75iTAdUOx
         08z3hmTzHKks4Gil0Pq2wHKceIKUwvo04GvezfSthGrvBrmvlAFgXnSm44lZzytIPHsh
         nmZ3eg9rkJfI8CmCPqtpIaD+W3TPRt1U2LbAoIqPRikzH5BZ7lyjLQA/lEcglsfV7C32
         i5WA==
X-Forwarded-Encrypted: i=1; AJvYcCVdOJbvVgL1uyznc2pC2UaQAYPEzIy62zFpEhhSief/WkV2U87LyHgquAYOs5tlyi/ZlQvcJ7hs0QXBRjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3KQFAGRFJxpb95RnjezW1IAyBHhrIouezyOuwbGsHJAOayYl
	KESYXLBt9PXo7il2YD7Vt4dOJha1wP+smdZx2KOKF6dbRlAUPfO6x5dmeDGv3as=
X-Gm-Gg: ASbGncuhkyi398Xm6GZxSfw9Bx/xDOCdATHMocWCRBzI+/SOiWvIBi2ueCCw57/X7oO
	fjUgCGydulIj1NFxrUfYnnwQJoxhuF2FPUYnuJPqguca7WZ0p7o3WydOBt8dn1VIbgMXepS6W/O
	0ziziiKoApdbJKxvOzqmgPDKrWelprXa9Tj9+/ConeceU54eUntMRvZ5qQEDb7x4wW0IA2KDlXB
	QurL0Ya2o10StkQsjSSxOismVlElfi+HO8D9PTpBi9ZaZujOfwodTP+m/tQKEQRY1OvNzncaebd
	Vh/zBH9DqcV9pZrUPZ04XLmQ1la9lMEhVIPhveogttFwlv2akkYGO3uq+2OH3Jr30uDXqWV4fVH
	YYiAR7CdT7i+hGA==
X-Google-Smtp-Source: AGHT+IEa1+58d1+6BJSAIo2TzY5wWJOuVJ0+Z2TtfkoH5bi1jAgj51GkhbBm4Ay68skIHC+1J/fe1w==
X-Received: by 2002:a05:6000:2484:b0:3a1:fffe:6b6c with SMTP id ffacd0b85a97d-3a353749125mr1354915f8f.34.1747297222207;
        Thu, 15 May 2025 01:20:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39517f7sm58550155e9.20.2025.05.15.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:20:21 -0700 (PDT)
Date: Thu, 15 May 2025 10:20:19 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert altr,timer-1.0 to DT schema
Message-ID: <aCWjwwE1mDzAubNi@mai.linaro.org>
References: <20250506022202.2586157-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022202.2586157-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:01PM -0500, Rob Herring wrote:
> Convert the Altera Timer binding to DT schema format. It's a
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
