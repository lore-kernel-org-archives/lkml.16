Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533F2500DA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209989; cv=none; b=a0V4goIAZjE8mcFf8nu8bJWgwJW0QBFb9Iv2MTmlju8PYevAiAgDcjExdTrkn/oNXIxOBNE6KtDo8wQSJOiJS8Wap4kaaAwsrdKSKrkOQBn63PKwgJ084MyyNY4SZ4QqyoI7q+BsbzAdcDEQE/8OpmbH7zzoOwa8+3nyfK5E5UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209989; c=relaxed/simple;
	bh=U+YQ5PhZVcxOIzhFI+20sedITuhk+41a7YpPgwQM7HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3/qXU4m8PgagLjlsAe6jdplUqvPGmGBULtA5HQxnzerlV1HXt7iB3KAUTP1JL/ZTPBuRL/hzLvMzJu6X2myyHuyrj41x0j3yui4HHjxFtwxSLQDIs+A9qgpKiV/SNLwET/FuENmJT4Ez2ddCjflrPHh9+llXB2kTjMDnzw5SIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KDBkQNeS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDBkQNeS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa19e1d027so5807148a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739209987; x=1739814787; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGsMNA7hkuFPRoTb9bXf92iX6DhOUuWxNMoqTKxh3jw=;
        b=KDBkQNeS3QfNzmRGRZsNWvNWBJiQhiBPXYbbiF9ipG2ZPXAh5CZ3hmbytZ+4eX8SYp
         xLZRE1sh+aJkqb075+yIxx+7UR43dWa/pyknWkf6MkJe80QzMumX3ky33M8v4P7AiwQ5
         QQ4o/AYvthZCSwKis7OmhBy4Pm2iZ+Dxil2u7p/fKSdMgqwsO21ypPrDa6wxpBui7AeA
         TH0lSsyQq7QCIcNw4IXTwzHJsHz+kZbfEbAnivhM45xpKHP2WBGjJBjcoxOEHpifbWM6
         YYpNjvzBxGybdovKXZD1Sq/4QWHYLGKxb0S4RIso/hsOtzQzE3C+N+h5TZ8F9b0YfFMg
         Z0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209987; x=1739814787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGsMNA7hkuFPRoTb9bXf92iX6DhOUuWxNMoqTKxh3jw=;
        b=sE9Em6enOzzvADnMv3TvmYjHgx/+naDZ8Nxfcq5GfkoXT3yS85ofBYdJCMGiR1ficC
         uEkCerOtzfqGHJ6uHvY59WFGNEFQokgc+qWBMnPAriiyxgnSd7Bb9eJfCgnw4bu38kOn
         vp6+zOY1JA6RT2qux7hzo87BHLNU7+rzWxpBQ36CKcqg0KDAh9KNeVsRPKaWse8/0zFL
         +UhCNLKOJquHYZrRQHcdoG5Or+iZdr477uRukz9QoemP/slWxw3ICALd2AsHyL/R8XOX
         pSY0GdPU/ReY7LQz8OZ7MD4sW9lldwmnia7ruD6I3KWopUaHyqyRe5GCcP7y3vubbZoh
         GaPw==
X-Forwarded-Encrypted: i=1; AJvYcCVySYOjXI4/HL+owNMfzzBoD5Pg19VoPRH/ADw4GLIcOhs9UPT2LczbhC4/Zdy8ebwqgPm4ALQYPQe/KlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzadaMgw3AH71xCxJRi5N7F0vE8gpMir8/FPKvCo9TJFRt9PbRH
	xdFG1G22JRgqbPZtfhnFZ4x07jv6saxwTMETQWK5kli2SGB8BTyLvUCnoj7bJg==
X-Gm-Gg: ASbGnctU47fF7N2CRYR7ncBaWIP7oYG94x3+8ADFRdZY7K5u1EAxjcEshEaGEOrHdTC
	yjMDL+RO0z+9g77SuYwXc9qxcJueeNEERyFF7q6ULNQ1PS77umZrxqmmk3iNbC2aihWEmxlSExY
	eu7plE9EH9fEp+onTDTzVdtINIBMkbYDD7boS5JTKbltfccVygAKCvV3dpR6qo4SKXquB91upC1
	TdYPWQTBLr1OM/Q5hLfNpBeRx6EpzT9PjPW3fHnT+Orx+d9LJsXZ+U/5y6HHqN6I/J6b9PWcvdq
	VPM6epgpvoBUIBQq2LMhz4s/slF0
X-Google-Smtp-Source: AGHT+IGXtPEY3mjc1Vv3Gaj+GWe5Fs2qY7xOB5/6dE0Jux/iJmgud1Xfm7AdIWKZQ7mORD5U/TLpnw==
X-Received: by 2002:a17:90b:3e8a:b0:2ee:d96a:5816 with SMTP id 98e67ed59e1d1-2fa24062e1fmr23566047a91.10.1739209986903;
        Mon, 10 Feb 2025 09:53:06 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f4d6asm9079409a91.6.2025.02.10.09.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:53:06 -0800 (PST)
Date: Mon, 10 Feb 2025 23:22:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:Hyper-V/Azure CORE AND DRIVERS" <linux-hyperv@vger.kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, Hyper-V/Azure@thinkpad,
	CORE@thinkpad, AND@thinkpad, DRIVERS@thinkpad, status: 
	Supported@thinkpad, PCI@thinkpad, NATIVE@thinkpad, HOST@thinkpad,
	BRIDGE@thinkpad, ENDPOINT@thinkpad, SUBSYSTEM@thinkpad
Subject: Re: [PATCH v2] PCI: hv: Correct a comment
Message-ID: <20250210175258.pwaqr3dqxstcjmui@thinkpad>
References: <20250207190716.89995-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207190716.89995-1-eahariha@linux.microsoft.com>

On Fri, Feb 07, 2025 at 07:07:15PM +0000, Easwar Hariharan wrote:
> The VF driver controls an endpoint attached to the pci-hyperv
> controller. An invalidation sent by the PF driver in the host would be
> delivered *to* the endpoint driver by the controller driver.
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---

Where is the changelog?

- Mani

>  drivers/pci/controller/pci-hyperv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 6084b38bdda1..3ae3a8a79dcf 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -1356,7 +1356,7 @@ static struct pci_ops hv_pcifront_ops = {
>   *
>   * If the PF driver wishes to initiate communication, it can "invalidate" one or
>   * more of the first 64 blocks.  This invalidation is delivered via a callback
> - * supplied by the VF driver by this driver.
> + * supplied to the VF driver by this driver.
>   *
>   * No protocol is implied, except that supplied by the PF and VF drivers.
>   */
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
