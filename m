Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADDF1DFE12
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610858; cv=none; b=DdrpkL75D5s7tumJx56X06fDreL392LWam8Xp2GvXGeQmVQxHRMqe4emFk4KLq+Iy7lUGSsH9TGiWJ+75wbIPoRPF75Y7wxKThqJxpa/iTJOAkaD+BTSOb1FZQYAV/0kxqd4BiE8J6XKFyRImEWieX28njCghMo3LqSfEsMTfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610858; c=relaxed/simple;
	bh=ZAkl/D4HYMiTs8TdHPaNq0qUfW7IR4yaQoTiRnukCNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q4hzuUBCLBtsaoOqQztcTG2dzj0X5QgPLg6H/LmpQZQb+GGV6RfRSMGwPUrEWjY1WF/xi+z8woHyLZlWmKVMv6ajMAzatA0+XyPX8NbXDMm/GjtsXuDgcjvK3etrW6eu//LiH6BlqS9fMp099z8Xi9E++WJ/GxgmyFsLEwjh5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0TWwhpa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0TWwhpa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso5862405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746610854; x=1747215654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
        b=w0TWwhpawoLeSkCQGcoV8GTgRzYmEFfPFh23PuMqFSRdcCIpmO5a3VaX/cuIUcG6K2
         33mFOXKr+Dmupwsiejyx57b0ygRbyyJvEuf9Y09sSjQ8DhPO4aDXw6rH2rslPyr1HXob
         c++ACrZYEa8Ou9yr771B3zBquhM0kUWWwWVuRKI/ibZKNSpHZc76K6pYv9RXWkbefdnb
         fPtB0+6O1vqRVAANeLAdCI6rr7763tDESe7hYpS1E0g8+cJzNntAcqEGdoj8503r016R
         7WFrqyDP+wPDrgDpVtdMNNrIRMxHGJ9Er5mZupVkhu22M9gyeBasYJBLV+aqqNmjQCEF
         VSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610854; x=1747215654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
        b=O3GIF0AivRsUD48WOftNUyiPANx9B/XE5t621DG2ebAerpb09w0OpSwHyq+d5O6Cjg
         4rbMoqpoNaD1aGQ8ixJ2iiEOOCi7S1RYXYlitridXFT8tWBClHUIP2f48q9HMJsqt3jw
         lAR3krS1S35redKF6uBH43wfC7HhkxWqkZJuGALP/BiNJkT3EQJIbFvrc6ss3sLPKaJS
         6u1FUoukhALwdF9GriQpfpbzsIIHmtUZE4uS9Wp3wnyUwLBwBq1wlycVoJK6O98DGNyw
         rj3OyAzFS8TVN9ZJCD7QLlW1m1mdfEm1KfucbNOQoeN+yvkY/pjH8OYKHa8FagfexTqs
         lUGw==
X-Forwarded-Encrypted: i=1; AJvYcCVbj3XChDVz2tpVkWtODZ40c89lUt9GNT3Jhe/UaFmd8ullTpXa1ZK4ZMBSMaa/1Rp9F3rIhzKZXTCSet8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+FMRl/vUXg+nrPRgIBP14ohYGs/BCw7oB6hbqCZArNArOm5d
	edDXaT84HfCozaM+VDSXeEzvjN7Lbo6IGw0t68kfQs72BnrpnvBH6/gsymU0VmU=
X-Gm-Gg: ASbGncvxfK6kqCtmeSO+r5I1MjwFOdjH685tAXQirzsjDeYsTg6V92MpXUx1i1h8vEV
	tJYYcZCeJ9bIB1SGH/0kxo+r13x6a4nw8EGL3MgZvvcsMdYLumIgLL+A5J3gmOtfL0oPDHB000K
	edHhtQSVk9VRCgv+M4A2kqAAvJgYPUiO38l+58xoRu05DvcEfROzq0ovLOa67f4zlkObAFfMTfc
	jaUOeKLSBXbKBv/NLjeCcDgHxDT7f1cHj+vdNCd8HfqNDz4poHYr3puBoGQzOJPJTbaaLvev+iB
	19J5pzAiDxdKPFIu1EH7QKGv9gM3cl17fTpk55w4HdhsnV+0Kl1NsaG5/lo=
X-Google-Smtp-Source: AGHT+IGTYzGThTxOdxwaI5G+9aUb3aVHRykaAtXbsesYBP9DWb7wZzv8RquKPzZDNQ1IOuOLVdxb7w==
X-Received: by 2002:a05:600c:1c8c:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-441d44ed543mr6268495e9.9.1746610854412;
        Wed, 07 May 2025 02:40:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, stable@vger.kernel.org
In-Reply-To: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
References: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] bus: firewall: Fix missing static inline annotations
 for stubs
Message-Id: <174661085321.105567.10502174461599708056.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 07 May 2025 11:21:22 +0200, Krzysztof Kozlowski wrote:
> Stubs in the header file for !CONFIG_STM32_FIREWALL case should be both
> static and inline, because they do not come with earlier declaration and
> should be inlined in every unit including the header.
> 
> 

Applied, thanks!

[1/1] bus: firewall: Fix missing static inline annotations for stubs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/66db876162155c1cec87359cd78c62aaafde9257

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

