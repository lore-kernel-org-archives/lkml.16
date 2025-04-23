Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5D266594
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386571; cv=none; b=bTno6gx4Ky4HhuuG8NQu92Exh5R6p6K29Ogl66yshBeCLfjFULFRIRf5btt1HhRL6h3RC8y8aI/N/js3vhYjXBJN0pjmWkYOMhn6qzO+KUBFzgbuYvm5aTLjX2TNnzgW6VVzavWlQdEOhsSEbZPOjjvkLFh17qr8EkEhHp9+YDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386571; c=relaxed/simple;
	bh=znd3Gx+1i6NPOJ5fHPpMjC5QdTJie7kovH5k6mPOKO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhgNlgm7yO0t6FtbzhLLrJ+FFdQqZqLsHZSBgA1wei0VIn7/vtS3fo6tKCCgSYnMjuxRHpHQ4LQNB/rM9ysejzp+0yrRGbi7JuRwB47Dwb7hfd78tnc5zi+sRo0ScFN7HTE5b8ir5m9Q3T1bBE26KOjFXJdqz2TGeIgCIRT/BtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfn0ie8l; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfn0ie8l"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739be717eddso4662047b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745386568; x=1745991368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqXZmhQqMpQ55WXDkvwtb6bzPG8ypT7T0jmt2s5ZCM4=;
        b=yfn0ie8l1kYua/HCnXdMB4UPmI749NcR0wtsumJFxdtMr9ul2cJXyy2NrmAIvbZBqz
         KG6dYBb3ySWWeVEbv3kdV6gNwEl7ynbZ2uZ1VIU/HjliuFsaG3Ci/0gNu4JaRaASuzck
         WHSqgSShz3DWLxdMlaDw5q7LVbSN8Irg20jqFCyADjw3a/frVe3aL0vhvYHcuWL+iWiE
         9TWtX/URv0O784ADQO0wD21sFD+Q3VaL2dj9x5ZWpmK5WMVMfQ2MwL3gVzfOcdqnGOMf
         WlayqPWJc+GbFVX4ebBY5Xm8y9hq7D0U7O73gEH+LiZg2xr2TRemVM67QzhZpgrRjAQb
         HMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745386568; x=1745991368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqXZmhQqMpQ55WXDkvwtb6bzPG8ypT7T0jmt2s5ZCM4=;
        b=OCdNOFiHkmGPB0ijkyNUVVq+mJK9ayIMdBLpxJpdIPGCP+RmlNwP+D/K1BLlXoaoz1
         JiMnzS5MsX9e6fjdfpG1TsHy8Kgfj/YNoHVZPwNA+3sQ5sXRnQq4OjE8l1DJp3ntBrDm
         yCauhBC3x/WKOeinOlSyH0LwPmvy9xGx5m72E5n5UJtyd3VrQUk2GUArtxWB2794GM3h
         8suHgL5Hu0e6msqEuLWrL1vFNIK4ZzqGE+Pt0VR/avA4s5OA7pAnCWmK9biMkVJhOiqN
         2tKGYQirQYAQbADLPqCRWghiXXTF+yBXB+nvkxFsfIuccXjHEujOm/tt9crToSUgzR2p
         u7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXPlrSH5KF/CweVN3+Z1l/nzIurJmm8zxbxBI/zh4fCizp3h6Dd3sMfjG6jeoZ+MrWhKIQ6YjcO6HSIbD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuAFcIqfkpJsQh3nPcynX8R5v4NYhBTwgxqLu5vmayKuPp1fu
	JDrZFp3bIMYz4GOLDaX/r3EijsKS55LfG5E7wuyWzmeWqCR/A+4H9uSwRTDDdxw=
X-Gm-Gg: ASbGncu1koM5NnVG3Qb+GN+eFA4StGhfbc8CRDsMnSytkvMNLFXkIMn7FAhZBAvuouu
	IB0wqhuzJDzvetxbtUVPKt7/eA30REFGOx5lRCfaUSGhXYbXQfz3EaHIH7Cc3YoMzoWID4Tnck1
	XLXzJojG4Xw3KfNIVDO29WPUs7gm84iis1s1mKUVQ5dBQeJ2N2/Mx5c7ZUgGKZsskk9Rxb6dD01
	WIel0rXLEjF2g4zuIP15v61jW5YKO1xHFq2/A0oFk7HNLMcbsIpkkfmhIsQQ3bwRO8Y6Q7ZpTw4
	0YSVXjDerhDnempKjVH3mwn0XIN/uEu3XT1iuerpbw==
X-Google-Smtp-Source: AGHT+IGH5CEH3qbiKs7N8VcrCjZGvYVDP7IFgmEG+4RsZjJN0YJwU+Ch1jF6olLdlhwBTsOOZVjUQg==
X-Received: by 2002:a05:6a00:3928:b0:736:755b:8317 with SMTP id d2e1a72fcca58-73dc15d32b0mr25849726b3a.21.1745386568035;
        Tue, 22 Apr 2025 22:36:08 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8be876sm9697501b3a.36.2025.04.22.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:36:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:06:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 1/9] opp: add new helper API dev_pm_opp_set_level()
Message-ID: <20250423053605.63njjtz3s3krdeqb@vireshk-i7>
References: <20250418151235.27787-1-quic_ptalari@quicinc.com>
 <20250418151235.27787-2-quic_ptalari@quicinc.com>
 <20250421074004.yttb42qq4p5xzi3o@vireshk-i7>
 <e6e1ee6d-a12f-4e18-b2d7-65d1ccca5308@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6e1ee6d-a12f-4e18-b2d7-65d1ccca5308@quicinc.com>

On 22-04-25, 22:37, Praveen Talari wrote:
> most of helper APIs in core.c and even i don't see any helper API in
> pm_opp.c.

This is more of a wrapper over the existing C routines which is being
added to reduce some boilerplate code from drivers. And so it makes
sense to add this as an inline helper. May be there are others which
can be moved too.

> as reference of APIs in core.c, i have used  -EINVAl instead of IS_ERR(opp).

That would likely be wrong, maybe we should fix those too.

-- 
viresh
