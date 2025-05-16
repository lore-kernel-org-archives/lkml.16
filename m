Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42F21ABBF
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386713; cv=none; b=biXPvLIIhdIyXqey9Zj37PHgC0yvDhCkp6Ge2sX0pXjaZcHxGbmLqgCtxNgs4j8GFIrmpWK3mTmpflDeDtlQf3kqlxkMlLMCsyxsNcxTZV7vfC/R3A3EajD+Q/cTZmFxXVut1jvFRg4AExCsKW1YLlKnWRvBKK8+Ry5q5wdKJRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386713; c=relaxed/simple;
	bh=scJc5ntLqs5pH3aPhx3ppFySMhN3SIrwwumf18q+O8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mp3Xwy3vZ2ev7iKQaFOULGOCGYDxL6HBinqB3mgOLSnMUkTAAagbRNKmFr/8NOAJ2JuGqPoe2SQE28QuyGzjm4IRdP/PyHO5mBIMb7UZqRDh2m4P4Z0n6hWTbqiYrL5SM8TWS5jOLkqX8biXH7SkquWv7JLSWSgKhT94v7B+2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnMboYw+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnMboYw+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a363d15c64so20989f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747386709; x=1747991509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjEZ5Ge0QfE2Uu3iAKcOD88CCG1vBxpHSQayKs9W9g0=;
        b=AnMboYw+yPMJhp5Y3bn0sov38mnShcAjsMbU7oxeeT270mQFuUO2y0CHc6COzj5qhb
         cXWn/7w6YHRu2j7p/Q2t8ItwDzJafm080sv6pcTp+mNJALrP+RoDMRpZWDp27lzrUpT0
         kcV4nG7WfDmGFHLsp5Z7tf3fCVZ/bG7LQzgnTYO8828Jd3uOAaRPWrzJGIE6VFI+fpYG
         UpBhSWxvkX9xpJYuWJYR4Xs/BcmobDtNyODr7Ry3vPIuPm8h1SmKnETQXOwhnLL+UF1n
         P2JDx5AqO5XbddAniHfDKurxH/KKwmQ54JkUHyHVi4uzzCSUkmwS/0mjU2W0v96n2Zsi
         PC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386709; x=1747991509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjEZ5Ge0QfE2Uu3iAKcOD88CCG1vBxpHSQayKs9W9g0=;
        b=jtMh9Avm3qRlKT2tv6aHI397JBnfLS8lgN81JcTzUeau/bOZJCVnCkYjpDtRHZF08m
         GTsxt0a4Rg+DraJyK9pRzXjNB7fM0Ilr0bGisN34vEhPJwvQClbmNu8Lqb1FtppXM24u
         VuEeTJ617NuPk5WcozzYYvX3KpgkfSjStfwoMKCPrWgleIV8IqB6zJvaAsrG9wMN5ayl
         dbDtL3A0HBqT454Ifg/HjK+PL9OGh2GG6C7uaAICo3DP6pXVeho0cweDYtIIwWDpooiC
         NQsIHkCglXc3fy0RGnuKD+DXxOm6g2cZpZYUnmKLkOsidkOsjKD7PW9BoYU457RJK9rG
         SyqA==
X-Gm-Message-State: AOJu0YyO9FWjxQh+c7Hp1fD4O7obSJrDOvzFts5W9UCE/VZY1uWnGEGb
	xyGESKs3KPdmgRk6Qvp9Y1W6ui0gzVL67RJu8gEJq1yp7Q035r01cXjynwsHmWyFijM=
X-Gm-Gg: ASbGnctoxzo+iXJop6u3wdC0tPdvs83hYhJXdIUuAF+62doJiH/kaorqCn4GPTXSujE
	Nj0htbBujQ8QukGeEslIMstIBigt7yT46McCa5fcoIHeHZz9kjs6S7IYLAEZ63PX6yp61DY6Ebg
	Gv0o7BCkCq967+ud63NRRrfgHyvPubNxtQNslJ1OSszyiuUgpRKXIwaqMW3xSe7JVllZCywyg5E
	XjatBhQWuKwyT7xt1GwRUWneWJyB7Hx56ljnqG6PQPu5OEmnICBnYfGvmhHvP7R/jBRAejh1nuT
	4Q+Y2Ye3PFP+F/ILhDeOqStbWOtPrwffPb1NsfGvbZuQm0fZdPZdJ1iKkEVRcYy9Jxb923QmsR3
	7L2Nljdrf9ycf
X-Google-Smtp-Source: AGHT+IFNUTuIstQezL6MQaChP/LsR57dqefIl+e5tbhmk79x9d9G3qMwbPat+AN49vK7UttUY9Y0Kg==
X-Received: by 2002:a05:6000:400f:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-3a35c808b27mr2666079f8f.10.1747386709362;
        Fri, 16 May 2025 02:11:49 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca62910sm2246831f8f.50.2025.05.16.02.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:11:48 -0700 (PDT)
Message-ID: <de1e4c74-2ee6-46fb-b058-db3bb72bc346@linaro.org>
Date: Fri, 16 May 2025 11:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250516164342.74fd3f15@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250516164342.74fd3f15@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/25 08:43, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the tip tree as a different commit
> (but the same patch):
> 
>    1732e45b79bb ("genirq: Fix typo in IRQ_NOTCONNECTED comment")
> 
> This is commit
> 
>    0128816c42b5 ("genirq: Fix typo in IRQ_NOTCONNECTED comment")
> 
> in the tip tree.

Fixed, thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
