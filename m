Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479E7E9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542728; cv=none; b=WRJqaVJ5XWEgvr9FD4fPLnUk6bnq2mMM8OjVwUL5Fjim7ZUT/Tm2obu9mKV0+nOLHPuslWdlQubTsCVH1sgIVvxnD/dvtg+JjfIb8/YqwmmOn/5NhKTF13m44YTp+iDyPmaoNX68xTfrdM6G+hd5y4IewagZ3SCX7YhRaoLXZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542728; c=relaxed/simple;
	bh=4Zh7RiF5xvVOQeZfnKB5CVBu5plMz9I03BCwKIXjnoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r8uX87T4CYWgmTqcu5n5VF68qRvDXjJcy5sCrSvA7naIwU/x2oJdaqoSzb8NQCaUfF9ioRbajc7dpJNewSLf1qsgReRtj1LpKgc0z38cHdpvjF8X/L5239pJRyIF0t19EL1kPNogPlgkBEVqE0eSAX0nhzGPczP0c6uJMlyiPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+VeOcWr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+VeOcWr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso396038f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749542725; x=1750147525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi+FbgRt5AdbLerxlhwzpPZXiNwhIK+rehJzBWIm21U=;
        b=m+VeOcWrahoGOgXHx2yiI6OJX37vFg006/3wCbxGWk3fao8hX06myrXyujqjBxGrXx
         b8myNAQka7YSIJMnzgrHOR8Azp4BjdzRAbRxsd4ah+RG6yVwWYATlp1ClVYlDv0sCe2l
         zDbZkQSzIuFlpSgIFUWTnJURcjP2PB7+ncL4Y5FQfR9jUkHNIJOZLZAm+5CWrhz6y7Ci
         O8qVGZd4kmgisauf7ukEFxx0tA/WR9IUN++MC8SpXW+R+ZIeCHFcTaRpjFmstxjnrLMe
         lDMsD8owiOYEqO4PtHrpOISSHfXWMwV5gqrF0CB/dDiHZfPHpw6wAh/8RSXp6peYVWbh
         vtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542725; x=1750147525;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi+FbgRt5AdbLerxlhwzpPZXiNwhIK+rehJzBWIm21U=;
        b=CvNxwKFbev1dyxK6/CsOkmtFlvKxiiJAVrebpx2xGCGiU4CqmHzkAPPIoYc6zmmb6O
         71yoOmvnqGfGj5nm1YU/0WJ0umTeISvIuMafIXDNkyY/3FK358Rsb0fxpvUoT0y9tFG1
         Cyza/q2++s8wS6GNwl+zgSdZbCxhuudfj8IhyVdyKTVJypRR/mD1k7JzYhN6FKBJ0ae2
         52aX8hs7PzhUVqoW3xK0nq0B/dwBPIMv1yz9cP0UmiQB6TuhzDkrI05MQvaVXsTglJ6i
         iV6s5gPJDEUhn+1/SOuISH6DF69eAuTTYTBQH5WHqSwBHxDebH0RT83AwjU/EoxYrHm3
         rYpg==
X-Forwarded-Encrypted: i=1; AJvYcCVFmk9o03sar2b5G7OXykokOgCDkVYI12qgEoYD67k2lZIG3O1R0dnCEh6YAF0GP4LUB5PEri6L2KSBYjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0XHYZwVs8ro3kdN/3mOicQD2Rp2NH4cI2IcCo0JXXe9bzMX1
	C4kxw4pCd+ATWJeOTkzlPjxg0iSw+vlrua1A3WfK3gbh46nPziBy+D1ZXo8Bt0uc1C0=
X-Gm-Gg: ASbGncvXdPWIRfZip/OcwYgBv4xybpp90JCAx/E7rr9j/UBACdAnXAnIkSPjyCDS1zc
	DD6MsY+oJiQMVBNCSul2O65xJ16pS3BzDSj/87KzUtow0hhS+5K3ZEOFhWCY2LS3xrbsavFSSBX
	PEsggPzYPkCt0Vlcu7q7XTDmXhTvcmiwqiKaInafw53dEu2a+h2kl9OLFuFKTUwc8yLy1XDUkOK
	WsgdDu4K711rkcV/qu8UI5klsfexZXfJlOm28ncs0pAApQLu/qLpMATh2Pe72DW3dTyhg+dwzxu
	EVde6FpjSNPQH6kI3Rz2iFfNnnhTNSKFK9GSkvfGt/swSDQuurLxqGfeu47USkpTgvj7wAuKFWP
	J8349CQ==
X-Google-Smtp-Source: AGHT+IFPshCAnzRVud/+4WzTAA+YTAY2xsB2lNYDdxTragRIlj+LWu8xGXsabLMvMnYT5ti5eoMxQw==
X-Received: by 2002:a05:6000:250a:b0:3a5:2ee8:ee1d with SMTP id ffacd0b85a97d-3a5331abab3mr4136397f8f.16.1749542724746;
        Tue, 10 Jun 2025 01:05:24 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323a8acasm11335078f8f.26.2025.06.10.01.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:05:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>, Andrew Davis <afd@ti.com>, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20250521152354.92720-2-krzysztof.kozlowski@linaro.org>
References: <20250521152354.92720-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
Message-Id: <174954272317.113318.17542006426784858736.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:05:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 21 May 2025 17:23:55 +0200, Krzysztof Kozlowski wrote:
> MMIO mux uses now regmap_init_mmio(), so one way or another
> CONFIG_REGMAP_MMIO should be enabled, because there are no stubs for
> !REGMAP_MMIO case:
> 
>   ERROR: modpost: "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!
> 
> 
> [...]

Applied, thanks!

[1/1] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
      https://git.kernel.org/krzk/linux/c/5cac59c59bbc81c3cd081ee575c41c917123d11a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

