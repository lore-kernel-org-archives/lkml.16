Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884CE225413
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751705534; cv=none; b=KIt/yf9OYq004gcrqysa8zFlghfMBF6mQ212UkZsxRAfY2ZCLfOMjTRiHHEaNguB/lrXTAzqMF4W/IJOIVmvJkxnvnos4SyVbJKM4l+OqE0o+k6AdyBh4NGWxPyHDhPn9Rm6QWkm62btI1IAKagHTyTxBMDv82x0XnebN3QkU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751705534; c=relaxed/simple;
	bh=AjKgpC4Io2DWBkbWPkG8zNoNDipMaCPIhaYJ1IqmYZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=azdsb94VBkICUdvYOdejXHaPLuiiEr+H5I1LGOlSYGMRO3NUNjKuyHKNJhNIEPtJDlYvAX+ZnCXlHCU+1F/sr+1fvlh3Lon7zp1+Nj0pOuKCI+V18I4Tjk8YrOPazCvqHLv6FQSS/w79WFbfj+x1gcfCoRisgefhlV+b37Pz0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGqciymb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGqciymb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so265073f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751705531; x=1752310331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=vGqciymbkx9Hqq22cCDJhqaVtKc/vaX4yNHk0lzqa8wheiW0kKJ2prW1VcNpDhQr8h
         nUeBblQ0QV2Su3hc+d2L42DPlIye5CSLkeFoITOIV4YsluBT0YJSt0gaglwqH6X2f7jT
         OvBrtxxeq2ZkK4SCbL5AJZgCMOD8+FqFYvBpoB1wsu5JtbaJrjYcJJp/cwuGmCecrW5u
         JJjb6h8++1ZHPixXa+3PP6fDgBJJeV4VL62UcLpk0zi6MxVSNzzauMG9zPu22bpKa/aE
         /APw/j57tGQ06nVb7wCxDenjSg9qsyZ3frO+BNdU+LOGeFInqe+x2BhOilUeXdIai9Mg
         McRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751705531; x=1752310331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=MmUOQRn4Q0PkdJ7nS/uvP5f5UNbY0tKLn5L7v1t6b+bqVqg1KImWmvgV/eZI76OKv5
         pyuFJhMwgpoD+j2B8hfIAZ4PS2HZ0wsdeI3OixVQruvyt8sOy01TDfKDhJ7WiAKMGgBt
         y3k91R5Nsl5hpvOkwbrlERZ0lqCV1VeXAg2lPk3rXgY4f60R9wkQBeLPFqSg/eWdGYhs
         pL21iAilXBKKDGzpgj1BeOsOfQczlh9csD21sIOC4IuehYmAcedc/QpCORHud3FVYvFS
         8gU46kgIQ6vkyjiiKBKCNVkRoPnqgi6Aa94u4kphxy1PBOlx1dJT6y+Kv0L4UWivDnI3
         Yx2w==
X-Forwarded-Encrypted: i=1; AJvYcCXCzPoldSjTeFtmY2ri6on2CUQCU5MEvlHCN2tfkrifp6deuCwYNWGUW6CtqCp5EDz5WsctJsEEKZg4zUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/T/5PUq1GRJR6Qc5iCvc+flO5i+eckfaNIZqpcQabjeQ+60r5
	JJvKBPclhv1jnw5mPdRxLmR11AJklbsm833MOBpALnJ4LgYeHpWHlKNT7foy4iZ7LLk=
X-Gm-Gg: ASbGnct7VgM6P+u0yoq4YQASRWec/0L6W8QbIVK+fZKzoQLays+3B0fnoWdAgd3DT91
	AMp1F6FcR0NaQVTUaBNKPfil1wkXMkias5OyBWsMUvzqRgUEd8ZL3WwZBeF+nr+jCsC71LKe3al
	gdlbNRTuR+0c18ZiPX+MOkh3BdvRAgv7qP/KQ0iMV5Y+GTjlFSCDCzoCzD4T7vZZqHS2PPG8GkK
	5/4zW5rKgPqq3DUv7q7WIQfJ+rwIoxWa2fVS+HiiAdYxEapFutyIM8GjRWDwvd7wRm9Uq7pcWfA
	lufwmTflpNImgMl8HOENomVZDufpd4Qbb7Iwt7yMJNvbWjzNbAifuuIbxuVLdM+OIBAUfYV4ooo
	q
X-Google-Smtp-Source: AGHT+IHKysufxmIYEaUhEZUWuBYxNVyIKb+YxnegutQsUA9aWiJMJC1+caAqnYzQR6tuQ9454ZDmhQ==
X-Received: by 2002:a05:6000:2281:b0:3a3:63d3:368e with SMTP id ffacd0b85a97d-3b4964c4845mr1539622f8f.0.1751705530869;
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm83558635e9.1.2025.07.05.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Message-Id: <175170552946.13533.13306736962764996194.b4-ty@linaro.org>
Date: Sat, 05 Jul 2025 10:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Jul 2025 13:15:24 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
> result is that irqs on gs101 for the buttons etc are broken.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: Fix gs101 irq chip
      https://git.kernel.org/pinctrl/samsung/c/683d532dfc9657ab8aae25204f378352ed144646

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

