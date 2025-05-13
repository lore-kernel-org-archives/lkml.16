Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163402BCF4B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146580; cv=none; b=quTZnqNRkVs7niI/1CL562fhR7iuDDD3T2FVpcFd0gEjLqFA/bExKD8Q0qvSrq0uH0zibmKubJE9HSoyQrVO8u6k3WA7h1m/NfhmPQBeWb4/Gs8NHGvyBZ4Q5kg0QCsw6z0X76Xd5idzBKCJxJNVt5LTmaon5Fd+g7onAC5HAoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146580; c=relaxed/simple;
	bh=3r6EFmRwIAg4Ct9GeTXJ9nBhaVARUyeX0iflKOCi8wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSfrlobkHCWeJd1kqkGOPoVe9Zn0q/2MwYo5dwHwA4Pf/z10szurLFwlXGX+E9g/L6ue97674sOXvsR0IA7FYbMoy8b7LlmIF2ef3rVvDCu5K7IP7la+SrKrGNKHnLRzUWD2uciMTEOcoiku7+OU6t+6zsZ4r1o8PaGMYPDCc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUcAa+Qk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUcAa+Qk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso3435638f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146577; x=1747751377; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5T5EVqvVCDoHXLH6Qk0C5AKC1Zmg5QpTMVhHdRjdkFc=;
        b=UUcAa+QkCp+fZPLlvv7OIr5fbXBFHoMrmO7NVPxyGuZBdlK29VO8ZL2CGQj3VU6YHj
         9HKVKeDCmtaBunrunEXcHrxxKSvKQDaw7DEogOOvxvjeQtseua4ghGwH2I28cVWGR0KA
         VmDkp0EuZj82xiRaFc2wi5ElZyF5akhnR5dqeUSiMZUrAJC4v4aX8m60QZLmlWP6C/DH
         OP82jZcNYfK+0+xn3rM90zwc6yIN9BVbAaSFTTNr835PV/xP6WZbBtHNBNlJ2mRxXh2i
         SkvaD1Bt+sU/mlpM4jmkXnpdgLxKyYP6tb7B6V9MrX0DMwUB9e3uA1lotMUeuU3V0Yjd
         IqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146577; x=1747751377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T5EVqvVCDoHXLH6Qk0C5AKC1Zmg5QpTMVhHdRjdkFc=;
        b=bFWEmBifebz5H2jN8mXB9cr1Bvu2GTLs9cN6045OUoB01aLslBSWkSmzbROrBqMh3A
         BWof7rgqvfJ1Tk2rBTxLlu8m9NjP9GOEn1ypfYEbwm9vKZAX4r3ytgDSjzDaj9FELfAJ
         eHERGcsnDMEzrNbDxcGlxmnLuBkBRbHI7HjHV1MDLyPuXbieuPddIJyTF+osVz0b2iLO
         3xoZY/bDoe9OfD9xZWWBspBHl4mXRL8/u/wk6p88co9nk2togQdMkEd+XTooEij7YPO1
         KYd2hfqlmiYRPGwt3OSMnOEpw06KO52Exuxgqp247c2rASaeoXbYmv43TCb0RofKa0m5
         QvoA==
X-Forwarded-Encrypted: i=1; AJvYcCXnR6rOLFXtaeRuURVWwJ6VfMBnDkGAhOjJdwmr3rM8KiiCh7KiP1dF5U11cwbOLQD2E3uc8VO7aNPMoxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsJ5ybMl98JY8VDtwqhlRG9qI9et6tOeeBMLebT0r8tOOEnJU
	v0Mv8GzveKUBNyW8ofZ/qcOfj7cTjPE7OZyHQS/av0bqJvOxBaves756aYOfdtU=
X-Gm-Gg: ASbGncs5WNLd2PqPlj3xlLt/c+uMAq0qCpjL5mX4YifBDZMg8prLgM/dDi0OIak9Glg
	epg5XZZWLlPwvmdNcwnrTc/51GXaq+1sRmxx3NPD3aXtesuR+6T3/duD/U6cyQrAz8V208/W3mG
	O6aoThpbmEYyPZsqgn3M+Av5JZg8XcO5u8vd5HjW2Mj86yuObP4yg5sAcQH9jf2MsUHO1H2LL++
	yMJXHJQg8aHtiRdnUDjWijicMDs54VqX5StlUm53heRHCpFgWNoAY9BwDbpD5LeS1PtbB03zCdi
	r+E8ejr+h/4lKcglCOOXOmLO6F+19mOww2jT+Zcrm/TI2qSIjnQOIeTM5BuDxkcr1WVggg3MTk0
	WrqTp9h0VpaJ9f2Yln+mOsCqo
X-Google-Smtp-Source: AGHT+IHNQc8VSkvMb+be4xShmhohsEns4BbUI6HrioDELteMpaN+j7jH2OMJqSpLg6IVq7ISGUZrlg==
X-Received: by 2002:a5d:5f82:0:b0:399:71d4:a2 with SMTP id ffacd0b85a97d-3a1f6430752mr14506029f8f.14.1747146577463;
        Tue, 13 May 2025 07:29:37 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm16347307f8f.22.2025.05.13.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:29:36 -0700 (PDT)
Date: Tue, 13 May 2025 16:29:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert csky,gx6605s-timer to DT
 schema
Message-ID: <aCNXTvpa-R6S1LZZ@mai.linaro.org>
References: <20250506022224.2586860-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022224.2586860-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:23PM -0500, Rob Herring wrote:
> Convert the C-SKY gx6605s timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
