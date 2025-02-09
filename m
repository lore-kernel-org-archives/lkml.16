Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411F288DB
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739143144; cv=none; b=RyvdoZJkPBltCpxOTB4dGtjoTLuVbaPXEdtCpMrX8cMfdtvLk27iAhi0qbf0gBFFwHibY0XOLVDgExf2BRh01xx78D2OI8zU8hHVfuBT3IiZTlA6kkVU5JhZxm3gVKS7pPEY5r7V1D2rxdg+vnzDr1k3B78kQXvK3hf79Hc3g0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739143144; c=relaxed/simple;
	bh=rszgRj3NwhWkiN0CdYsTuTKC/8cqBo5K8xVb7QGC3Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcSyZ/vCBHJyU2bGE+C+ltvnDceAGmvkK8lfWzM7T8dS3rgs5wtGRSfBTCjizevMLxIbhYHpWh1c+4dvnb5thqpXNhtP9Hx+JGg9zn1WIDzHVW+VuKqloRWqpEARCuj5C04e81usEcbBdlhaXUTDAJ0hSBXl3hgGKSnWgQUWP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yco7x0gZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yco7x0gZ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54504bf07cdso1601599e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 15:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739143140; x=1739747940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6CnvZUnsw9udf0ZXFbInP3vAxxI8mGJaRGUFTF+U7I=;
        b=yco7x0gZzVR25agxphJ6OJkB78fMBGy8G7juGG7/RldwEf9e8TcWmktttmruukd9bj
         RC/QB1ofDS7HW3eY42Ee51f3YCrWmMd2JHdJX5dxtycTrZyCsxl79Z9ixR4vpmSqkoqD
         GGihABikwTFZdr7UQ2tRkcvb8uddym5LNnThPhVXpigLtyhG/9l9MUJxtsTZN/HHuyCA
         DO35IxZX3u4uxOUg3dCWWZQfZRypvI3gD13/0MdOvgw9L8Fsdw+O2qiXr9RiFOqyz8P2
         vVUbcoOWsBnvgTDUA8+BP9/Wq1aI78lyz7o3jK4MCs9hkXuYDlqzNU8DpucLit3wZSh2
         /dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143140; x=1739747940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6CnvZUnsw9udf0ZXFbInP3vAxxI8mGJaRGUFTF+U7I=;
        b=mCygYmYLNLC1FNj58F+LqNnIesuzodWVIOdkfoZR/Em1Ko5G4/48f//d7EjuOicY2S
         fsJfCg6X2Y/1+mkJRryUwnL7W0kSQD+naPC4XLCNNgXcnYCI1wbCXmvp2NH4iuRevNmR
         zi1n6FcGgNGtzjDu5lhMr2VRiQbgEo7+q7Qu/AXugXT1IArO6exWegRjfZy8HjFOTn8k
         FXQFeHg7910jtmBwgosilRis5aQYdiZvxFmVulv7lyr+qCCgZdOeVVxmVatoxAitdA5k
         0xDmcbJwYIeqTDOc9bo+LqmlrGpvKS7bN0/gGyYcDtXepTEOdvqjPvPvh9N+wLUEnsOe
         jRXw==
X-Forwarded-Encrypted: i=1; AJvYcCX+lFsM5FeZbsk8nG4dKFdBlRTabBZiHUZNKQQ84FfNxA/kCMhE2Ye2OeSKQqd1JwPUUW7/Fr0GGpB6DuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4hPhfMDQiGJFplQ+ZjWku7+NhxPega4F7UZztyCqSivtra7i
	FWzhdpHUjTT64WbmnsT2NApNJUqbnESl0ZF5dFtC0tHHr+6RxpizXfh6L73HzLQCWWmVtyp88qa
	3SJA=
X-Gm-Gg: ASbGnctad8YL+YrRNcwGFI609W3fYQ2cqkJE/O3HvLvQdnE2KZgk2ZBFzLF8WMsdfax
	sSzqSV9xuMlpbcqoBxO+4PJblZSUVBeqefULqrMKQ2aaNPeqcFF1ozq/wOIn38sdOtKKOerkEM5
	qvNkzGzDNXpkP6XTgqjk8qX06sw0AywX5n/C2hN+W+4y9ezaorn1xUP9ZESlqCVJw21SXf1HkQa
	szz+g2Vund0YlNceC+/aTVwWjCd33kw0x+3zY+OjxxC4L/QTumiF1Ce3JA7k469km+hTDZKC0mY
	YRrvMqCozyAqMCd2DffaoQmTpWvNQKSlySCHSXy7scmimq24K3rx1ZIP1P/B0Zpu9F1ULj0=
X-Google-Smtp-Source: AGHT+IHcXJtP320S7JR6jpYgriqZk0+Tqz/hq6HC6F86RvGWyZmZUW3pqNMIDEOADnMK5kEm/Dfmng==
X-Received: by 2002:a05:6512:234f:b0:545:aa5:d455 with SMTP id 2adb3069b0e04-5450aa5d5a8mr764576e87.15.1739143140089;
        Sun, 09 Feb 2025 15:19:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450d6f6e13sm82253e87.89.2025.02.09.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:18:58 -0800 (PST)
Date: Mon, 10 Feb 2025 01:18:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sam Day <me@samcday.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
Message-ID: <6t6ho5ovwabr7gzr7kzpsz7c6pclpxa5mdr37p4sycg4jbi66t@bg323llk7g3n>
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>

On Sun, Feb 09, 2025 at 03:09:12PM -0800, Rudraksha Gupta wrote:
> Copy bam nodes from qcom-ipq8064.dtsi and change
> the reg values to match msm8960.
> 
> Co-developed-by: Sam Day <me@samcday.com>
> Signed-off-by: Sam Day <me@samcday.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> Changes in v2:
> - Reorganize sdcc{3,1}bam to be after sdcc{3,1} respectively
> - Link to v1: https://lore.kernel.org/r/20250208-expressatt-bam-v1-1-8794ec853442@gmail.com
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
