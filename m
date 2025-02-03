Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D220370C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583637; cv=none; b=HM06LykTIvvw6jfXfHF/IjxMB7epJZgnhPQd6hVE/65Yh63zXEy2Fspcs9+OPw0sxjNUublEqWsi9DKbQ1Rp5J0NKlYR2zx+GkwZiRxJbne3xMmTTcl7VJZUG0IYrAww2lFjbIGKwvZGL830OE3u/x2MbVoiwXFVr+eS/vAaMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583637; c=relaxed/simple;
	bh=meh/lrf3lQBId3u3rudz9MSEfCO2RYxB5NClOQzPRCY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RJCXHUfuxnI9NXHmrPEgUBHNCNNsxzWn2AITajdv8vNt7A/2lVGzWl4I/HVg18N1byv7yNkWX/GCvmbE8lmjvon9Zqp5HO1G2x6me4XPJw0nKQld99ApNQOMwaNcHOwmJqs7Iksv2Jg9BDq+Vk47F+eeM1BRovIdpkGYI63AKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxUSxLvz; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxUSxLvz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dbf65c0c4fso853527a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583634; x=1739188434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9tM7OqjYQPC/oIGbMDoNHBcwCYZBpgt07HcYPZRjQ8=;
        b=zxUSxLvzFi55qo/3ZY2ZY+L7uy+KOguK0ymUIQTtI3OOgjfgRWnMdfXaeCUeYCZZAc
         avEvbkVz/QkjwsXh5heMLPEmXRYnopxPUQD71P453hDFeRs/md3WTQXQrjDtHrbe6MA7
         hA1pDqOQtTZkA6nZ7rhbFNoPpshASzcnt3UmVkPc6oYMutMaMS0ZxLaWBjaASpcxCDAP
         ymSP5pM6Zm+EZCNlF+1LGsrvrEWvc675GwW/cc6rdYj0N9nJTLvEtHtXUIybfX6vB4ZY
         zA77DTg02tG8OJyFGkObijATmMyH0X9qk6qyXL4blqAW5H3k4b1evgGGR3jAw8q0nHpd
         numQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583634; x=1739188434;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9tM7OqjYQPC/oIGbMDoNHBcwCYZBpgt07HcYPZRjQ8=;
        b=nAfUjkk+BFp224ug69xj+S2zx0P/4Y7K5EQgrQFJP+GK8py7iGuvm+TIodvs2zgHuu
         OtQL2bK7Uh/bz3ScjrOeUA+vgOphK8PdKVv+xYdMfWOEAaaEDv2EGcpFVB0KGpL+fkBZ
         PtzmY4gwt2eda2Jn2PsFNKjrq1Q7/+6d7IcYikn6H+Tf8RfMKELpvSwKkATIkL9vZtPO
         tN1naXd2pzXXbjudqOfcOprY1R81X800eUAbR99OQ0VxGH+FEM8KX2StBnQpyfegKq4o
         9sqlsPOzBkT2dbunw1J3+5c+/LvrBjXrq/HAOgWyruIN55/lvL2SO9rD5rjRTihYygGp
         3lxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlpm9Df0WxZ3f93lM1JtBnPbLAOpLAX3CciExtuu2hHVdmj2mxnLPnozU9R2uSS04gtOB+2sfp6lm0DQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNM7N2jSJimfX37M63dbHa2ntQq2MQ6rcxRB0iEbLICE/aBQY
	BeSwnTgcLj+xVjZOFo6Rac1OkyE0Vq474UEmbFrVPtI5/dTy6JoXrq/U5MyfpRE=
X-Gm-Gg: ASbGncvRmzFIfytGHtIT5uMmO6lO5HhWGPLp/SEQFc6Vqc4Vdn6GW8o0sIsXOOSIk0y
	8te7+/6IOhGQYk3tz4TDypLjsaePeDABJB0vZQ/6aTBPK1QuwnCH2OkywosYHdKbB6cKeaR6knA
	FDvCaSOcv62CG7RKrxw5p22vwwhZTSiDcflqhLb6b9Mg0w2A/kZGh+A0VQXvy/8tvuQnn3UDLJp
	DgbVe2Xm0ndzYKstmrtub8uQW6kGjTsCCYN2kvyqxF0j2gUNRszVZrDwYHSNgoi+ovCF6SmkwV+
	cb6lpapioz8kDtGDkfynpEHvh8eDb1g=
X-Google-Smtp-Source: AGHT+IEwxGompX0RDX7IgATosUk/dQdYe878OcQcDjQG1dWZ5fVvuhozBCD2DX2UUP85oceDFhvY1w==
X-Received: by 2002:a05:6402:4287:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5dc5efec149mr9404962a12.6.1738583633919;
        Mon, 03 Feb 2025 03:53:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9cffsm7586519a12.74.2025.02.03.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:53:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250104141430.115031-1-krzysztof.kozlowski@linaro.org>
References: <20250104141430.115031-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: tegra20-emc: Drop redundant platform_get_irq()
 error printk
Message-Id: <173858363265.129675.12403410768215721898.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 15:14:30 +0100, Krzysztof Kozlowski wrote:
> platform_get_irq() already prints error message, so duplicating it is
> redundant.  The message about "need of updating DT" makes no sense,
> because this code was there since beginning.
> 
> 

Applied, thanks!

[1/1] memory: tegra20-emc: Drop redundant platform_get_irq() error printk
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2f76a890fd2c636c640af1387b333aeb0cf69c75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

