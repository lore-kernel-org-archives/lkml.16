Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEA251795;
	Thu, 17 Apr 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900034; cv=none; b=ppfVmV7zSS5DC0lAYAEZ6VYAWwZLWwiRQJf2WmtdbEizpCm/nyqrxtKO6wRSWl2Gf2DQ3McJXWhD7g74Qs8QdG5Jf3uen+bDZJkCq0rpsuL6WP3Gzl2pPwi4B+O8WyM3N5Vtyasdq4rlT0DXsxBcHG1x+pVKFaJtvSbTfGbhPwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900034; c=relaxed/simple;
	bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyYoydpjcRvla97a6feVEX7fTX5MRQ0lkoCFxRJhWa5s+bLdpF072zeak+kK+9/MrQKNOZzqV3FtMm7wstd8TCKxlEIM8otaI8BCf6ZewXAJqUQekYQNbGF4HDW55TV3p27o++ijzFZswMyOvShC/N6hYhSyYQmT0+SHcRZBmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktDIIfnF; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktDIIfnF"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6febbd3b75cso8028507b3.0;
        Thu, 17 Apr 2025 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900031; x=1745504831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=ktDIIfnF9QQFR9/iWhuzbLEKrbx2Q57E0vG3JH8tuxa0Lc+wQ7FEs4L/2BDiEqcDMC
         XAzlYBZE5ikcjwGkTTWDf+wuu/F1dUOksnoDdCi0wB+D9WD20jjclxmbTPJy7Jl/t4kI
         BOb0+kv7BQUqOx2LR8Qaw6OcovMZ8k06hIxSzBg2BFs/F/hgTv8CFlb/cgLv/hvCjXJq
         KSIykJVH0Cn6xzo852nUfKK/cBZJZ+DeWspYcLnXj1PntLzgm3G8zb+RFRs51R//YuA4
         r8agetFM/YytiHNdks6bLWhauofXe7IihZLWzZpL1Wta9/k6jf5BkDiJzTT6MSJCsh5J
         IBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900031; x=1745504831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=h4khsZUzCA+fd+7kldmDQtb9UGSzJcsD6euDOCYNMXVQjsc1N4cdjta5rpt6AEBy7w
         mnaNB0p5XZmkeaAOBRIspVka76uhQs/cxL7bSKLm7KNFETGG2jyQoWY5lDWbh4Nn35zI
         aEz+SEan7jvOAu345P1VmeU+rt270MN+agnC5Q1TyuQCs6bOshZmAZopTrdS9M5RHPRs
         fYeNzYpiHzk1YTC9QiM1a8reaCYTLkeolt+Cq++p10nbGBahXGekYx9Wuu3Ax9H6ZM9+
         sKzCUoTH2CE3tw30cD9dDuOA08F5XNM+OCYOEshEIcebmN13CyEJwrwvxnHQFI6NJEDe
         +tmA==
X-Forwarded-Encrypted: i=1; AJvYcCVhixsRHTpkxrQJPu/NJ9IeS4Ku8LMzoQFmBygdTsxmf+1eUKFmEX8hyHnMWAN4AiuH0bs1dcD0ACPpi3yM@vger.kernel.org, AJvYcCVzKs/Zj/gPYXmg2ZndT9+s2h6KvAGpuY4ohBZNCsWaDhWgqKd4rscQ3dnnZTVWAGaDCZy1KTU2GZpx@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5QwSlLKqc0344LB09TQI/dIOxgrk+an5W3Lm0bxwdGIFxHgj
	cEPj3GR//gdL0zEbSQSmO6UjwxooWVNN8ecunHucBsJSCJAuOFvF6YhHo0BJM595yyGduY9SJvY
	q96Pael3wDHSFmpH4zzTHVXGPbJc=
X-Gm-Gg: ASbGncuKHiRaPxnVnfGylAVRw34IyyeWE8K+eLPJO15t3pSVi1AhVFTT5jMb1X7/mwZ
	d2w+X75p5pYGW+AcuWNIutjmLTvyC14ViWBNBhQxvVCPVrFhZPva1BE4Pcr+56uP0kUe8GfR5+s
	mSCqn02+adQnGzSh29XCKEnuk=
X-Google-Smtp-Source: AGHT+IFlsRdoOPNKP+IgFk3s9dutZbcvjVOYZpKbxlSBuHkLsa+WbDm4tMUPjfUhVNf9zruI9fG719C6Puhpz/icXwI=
X-Received: by 2002:a05:690c:6b83:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-706b3255c50mr92412037b3.2.1744900031538; Thu, 17 Apr 2025
 07:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com> <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
In-Reply-To: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 17 Apr 2025 16:27:00 +0200
X-Gm-Features: ATxdqUG-QdtnFm03q8e1kJSl7Bv2F6tlWh8pqcBflMsEFPTlm2gMwGAFKqTZq5A
Message-ID: <CAMT+MTQ6gtQaMpH=5ATtJ_A7X6EjT2ra2UAe_1XiDAk1YGP2Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 15:34, Srinivas Kandagatla <srini@kernel.org> wrote:
> should it be:
>
> depends on ARCH_APPLE || COMPILE_TEST

No, this is not a driver for an apple-specific hw, but a generic thing
for re-exporting
a set of spmi registers as nvmem cells.
