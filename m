Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4E5280A4C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543129; cv=none; b=UtIQ3eLcQT6ofOE3NSeWRHPmrp4Vxq+nMFsf+BE6N2aoP+wd08vFlsbWzGfEM2+dGq6o2F+VlWkZM6aJD4FbiX5zEPRmqCw/kNFjEkFYIqB0A6o7AU/NgkQa7gpto0SjrU2i9zwBqgr2RiYg8ddB57Z4C0w19/azwAviIIoEA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543129; c=relaxed/simple;
	bh=LlCBFvgGHBbep8sr+0DAiL37oJOemIk9HgQQlbWJ7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdexS1hJXqvgMUUiNko+hkeedrSELv5/qMD2HL+8vUjgFu45+4oQ1JGOShK7GDPZbVRhA0eR6UkTVnssdAvG4gmxZ03NxSBjVNfWJak4U/aG0GtSHP6kDb2j5uOdBUC6crRuz/81SDqrSh7PFQ2gZvBae/9PRr4YFDd3ezISoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HP00iorz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HP00iorz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d3f72391so66921095e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543126; x=1750147926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=HP00iorzToU/HqO+E8upO545HFBDrKqsemL2rKKKi3IW2Yeq6ydAlbjI5zwBLY9L1h
         UIjPZMcgQ8DNgfXW1wn08okr9o5QVDJSr+nT9kdWLL/smwmu30hlOf8ZJilPOZpCg5Q9
         HBgfi457yUqdwlBxR8JmCjuvLXyvcGTHSSwL4vmfod2sZRGOW14VT9E7K7ROigbI/AKF
         AGEpF75qacc5I33ZLSdO6vMp7S8u0wQgcHzqiXFmUMb3h7dMoLTIFQYD+A8XTHcFRPWa
         PC9pb3zXb1ArGXuHoERGEJskM4P6NHoQTQEtXDgiBr+vOGRRMs+fSWPeJfm5DfheA61H
         lBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543126; x=1750147926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=YRM+oKopr+uS4kPudiNtCKn6pHwj579H6ihJVSSae+JEYG/WAUyLxWtUoY21tLxjDk
         qpvR9hZr6q8h7PZc5y3FY5tH4gD3zRO/6Homzt8Xf/FWxdxkc6RbyV3qnnu6V5eiuqny
         tKxVCoaOnzFsFpSxvK/XU2r7hIDBMZItmBTROLMbTNz1mr1CmaxqRszN0DWYGXeD/T8u
         /H5UhZE8BtpUN/7aSw2AsfiUP9SQF9KW6mjJ/TbjP/Tn1KbR4vI7aBacLduqSKRHksZt
         UDdQt8/kb5mHjPJwnwqQ11TlOScqwYA5vbKtQ5Pyt9rRwcxvZO/lQ/+Ky1Xh2iBzyCz/
         UaVA==
X-Forwarded-Encrypted: i=1; AJvYcCWkpwTPPlnMYwLhMSVDhJDTJOb6FE4ZCEIYTMq/Nhdk+JGhZdmHW2uMwU+Tx8V8IQDDg1uhuvSRpHAdZQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1+alHYdmS5SkxB8XBXhKBE+aO++7NnnPNiNxh023AJ36pYoH
	Rx3Usg22xkGlP8LVZorUFGYeDyOA0l9p9t9tgKup6gOrcNrZACMqCNVI5clKigAuyOU=
X-Gm-Gg: ASbGncvciuQROmrYxxJBmVj8ujLjkycj0+lLNpaSLYP66uQTfIyispzkgWzRt4uVooi
	QyAiArXWOVjn7R5rC4NtNoGBX8JZunQ+dyg1mJbkCyz7tlZAnMnBa4o/KhufgEMnsl5LywFb9+x
	/z3EVM8PNWb8gPUFBomiHcMfA6yiXwvhLIubP0ULok9YFU5KNcUKVqVel7tn3qVl8VEq5d4mbf2
	Udq0d+HeZDt6kLECULwyi40eAMcJb4K8ZKdXd/+KaEkQb2gkPKOGd9cE0A0otqxCvIAZIWv4N+T
	BoGHvxX1TQZFdkJ+o19RniuKrMCRIFS9AKyvTt5qqlKxo6f1rgOvV80P7uHV
X-Google-Smtp-Source: AGHT+IGqKuY3Cpizdlhx4JXiy9x4C18UAtODglyX5DLPCu5C90go6V8r9W9aiiWBn1UaTTcmkgTekA==
X-Received: by 2002:a05:600c:3e0c:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-4531ce6e9camr20957955e9.5.1749543125773;
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:53 +0200
Message-ID: <174954311120.28634.7991564107488098129.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522223742.516254-1-Frank.Li@nxp.com>
References: <20250522223742.516254-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 22 May 2025 18:37:41 -0400, Frank Li wrote:
> Covert gpio-pisosr.txt to yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Set ngpios max value to 32.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
      https://git.kernel.org/brgl/linux/c/08894232efa4b53e7cd064450a6d444b92ab24ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
