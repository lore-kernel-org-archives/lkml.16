Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056C1EA7E2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771152; cv=none; b=Whgaq52+i9aUIrh3cNsFvNRCCIJqHtkOVfAF4047X0atjJDmdcv93/WY141jCbTyFe2zqIZxiJJwG9PDBY4iutCjxAYIQt+wjzOQFkLs+uGKjlkUNNN8IgLJUI07LKkQc3+9Y2roO9nwCuARO07PcGvA5wJfIcsThiPP1W766Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771152; c=relaxed/simple;
	bh=rSyWljWgOpiiMEZiTLykd/9NqgJXQ9olRcNpovHlunI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkNNdPOSMMeHhvIIRE5UUiDJe8mNxpNGNLWEQk0pIbXtcRYV0YfM95SXO6Rw7ulnQPJFKeZ2vZ7/0On2nQUKcIJSItnNnZqzev/i83Y/EQ5LXstCofD3zBAvFy7UoVHqODMV5BEjOsG33mGwq5G+++JqQnAe/U2TB/Ro2xt4pSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWmDEqUS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWmDEqUS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso20995785ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743771150; x=1744375950; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DKMhv36eTVwOYBrxUb1Bibo3iK9Aa6oEo/P/njWpUJg=;
        b=MWmDEqUSbYWhhgRpkle05339KsKoXTCsJTBPaQXGvIuEKzgxwswQ1PJ68KMLWh5ysR
         J/+lEPz5Jieb3P1YuIMIY1Q+E7Xj1wtTOXsoWN6c+x99pCqNsZ4JFNWnsMk/2pzAdwg2
         wCe/6rrKOYbWzyzeQTaTnMoH+hl2h4JXS3kqrtnRvEhDBlybgruNQEmO5pqFjjY3UrIN
         TM7B74LZIuAfUSpU4NFded5j2NDbmbySH3DQzcmGqX7kOrkqakZSNdg8Zm5k89Pm2vZY
         rvK5rHo/bRHgtG3IA03qwjnubNWdnE940OvDh1VDMZAfw5bj7pI7OyB9owhrtxMFB5R+
         /lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771150; x=1744375950;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKMhv36eTVwOYBrxUb1Bibo3iK9Aa6oEo/P/njWpUJg=;
        b=iHPxQrJtm+lr2ZNlToPvIvhofSpGDO7p2ZZQfiIx1f9bPzNUTbLb3z0VWXFxRfVK3e
         C6KlzcxYLLA7r9aLBeCBI+O0yt9AZxIxFWvr6P2Ll4w6FnZMJPTAD2+n+O8p1oCXQCH6
         4ZWtHwVcalg8eMwZGFjt4tRYocFr0ESw+ty5pc9I8w6OiEnRuTYJRTo9OuNnn3I44fI6
         ePBqcglx780GXm5CPBqyFYImg+pKSEJsCL1g575jsi6B6jz+WQo+0KSva2EjwyG75B72
         /E8ooH+hjFH80Po2gR3M+aiu3+Uzh6mj4kCTuRWwbbDewG1EZH2QEShahhE6FEq0+Fk0
         eg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkGlZS3yL+lxxcwIlYdU7mDQKjSQOXCGC1OMQUjYkuTlZEiRtym9U8oHVNUPZDbpl493Lhndyo0fzdidM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3AOYUd9DVlhv0MCBrBvBOszZe06bBG3HNQEm8CqcLsq9SoA1
	AA1kSzOGfu5++tdNz7Ds/0aMTcnAWQNbRt7VjnSpB67NRkBw3XDn1ztHMvDl+w==
X-Gm-Gg: ASbGncvwJEo5yaMRHLmEifg6xwKq5p0hIjSFmrXyVbRyLH9CG89WXdrOaPBIaYtrrCE
	H6lct0ImSiPyv0Fa9irr8qlX0akcGXbtaPQw7+ArHDfoacOtz6HEH2r8vKZyxZDa9BA2XTnd7W6
	8ECnnHso4kPn/z6YvPPYcg0yj2B/mC5u/D+akqctur+ymBsD4Wb/efyM+DfZpFxvnDOSe9ug89G
	j5W2z+dihaIqb8yRsqAt1Lp1dARucGb3c49AwcNIaGrGhfZT72J9ul6+JNIZ1oWGKnYgMEnf8Ms
	d4X/wEf3oDnLkQiS+5hieeXfdLK2pv9vJu5nygorz2nB+dr6llDy15jAsfPF+qJvCg==
X-Google-Smtp-Source: AGHT+IERCFn6js6qeVXEwdJZjCbdeV3RjyphuuYpeMmQ+ZbwSxAgINay3FYEHGIrYESdCmhtl9xeVQ==
X-Received: by 2002:a17:902:d4c7:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22a8a85a18dmr40259765ad.2.1743771150028;
        Fri, 04 Apr 2025 05:52:30 -0700 (PDT)
Received: from thinkpad ([120.60.75.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad83esm31289735ad.20.2025.04.04.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:52:29 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:22:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shao.mingyin@zte.com.cn, shawn.lin@rock-chips.com, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	heiko@sntech.de, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn
Subject: Re: [PATCH] drivers: pci: controller: pcie-rockchip: Use
 dev_err_probe()
Message-ID: <4mbdugltwhiaw5kgg2d44jq4yz4mpdrscjiomp2kmnv5gk5i22@hid72rovi2oj>
References: <20250403154326411S4luMrK8A5RXovincATzF@zte.com.cn>
 <03d12cd2-c719-4703-a0eb-2a32ef41af92@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03d12cd2-c719-4703-a0eb-2a32ef41af92@kernel.org>

On Fri, Apr 04, 2025 at 08:09:40AM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 09:43, shao.mingyin@zte.com.cn wrote:
> > From: Zhang Enpei <zhang.enpei@zte.com.cn>
> > 
> > Replace the open-code with dev_err_probe() to simplify the code.
> > 
> > Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> > Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> > ---
> Considering zte is sending untested patches from poor automation (or AI
> generated), this might be correct or might not be because it does not
> look like probe path.
> 
> Anyway, don't send patch by patch and line by line. Why you did not
> decide to fix all of the places in these drivers?
> 

To bump up the contribution maybe :P

But to reiterate what Krzysztof said, please send patches only after fixing all
identical issues in the driver. Patches should be split only when the fixes are
non-identical.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
