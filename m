Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EAE4A3C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835394; cv=none; b=bKK/niTrTZJnyIRz5SA6WDWOGIhxkszocSC1j0Rzn632n0V9Avr4TQrrffBzWYMRMg+zEKdDxy5oViIinM/72Pwitnzg05z2D6cxKh0qi9P1xif/PiilbOaqGonDQeWPKh/5cb4XMPeSBq3Bfc6yeeHDfdRhQn73XW9VSRgp92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835394; c=relaxed/simple;
	bh=kjwWvwzUqZtyo/Cdb1R1/OawiBZ7nsUXUV3vo6Njmxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDg7a5zpvtxpupFROD/ANjqaZx6agX6jd0f3WNq7OtcEK8lLjyNxTE/lUPtZHMJrVLBxwtN/ylZxRAzVgOVD1FKq5RvubRDki2nAjiBAcqfIEqkS1J4CwwbgF1Jj0Mxjs1VTIY6yxE3UfUDxb9FlZZu70Lk7FE6lwoPffjTTcCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ysq6Ej5s; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ysq6Ej5s"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f5373067b3so87050486d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747835392; x=1748440192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IKQQl9efsnE2dSsd0cBEgyRG4tNPIDJoQhNLTJui0Rc=;
        b=Ysq6Ej5s6I4wmXmU0KodcZXiIpqkdl24qUiWJAXP/d1xzrSTuZAV+aecXLg+jWX8Kq
         6oNtOoG2B3UW5uJrO84A0KN1w8iYDMtbIhtm0ZgT70ASq1qZR+sqzPqWNPg6Bky3dMnT
         nc7upcu9L1n5q1fz/dBmUt4JjRdl2uXyZdSDLviyoQjrn3QapOd8V2ditEeDlvcCKraq
         8TQ/P3oG8lqRleHqhvUjM2apZqcpfWsl/T0b2rbXAO1P4jbdtMhXkcZqPEpXZX4RjS/n
         CopNpyCGYcAi2WwQgk7WBYv4zQgRmO20adzyAXuRXLxBkopR4llVwbEdOdd5KAbMsXPL
         0chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835392; x=1748440192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKQQl9efsnE2dSsd0cBEgyRG4tNPIDJoQhNLTJui0Rc=;
        b=Hz+0sHOlkyBvsU3bLL3uR8KSDKTrQFWlOUl/SJh2vdynrtYoKpoK+45Xbt2ofbiu2R
         BGu3a+vcXupGioM+UF4lmjLee2+2gpcZetXKdyzL1el82TLa64+gyY1OpVvQNTChcWAk
         76mB11TiVVxTN3bKsdOytMlklmJ9F2L8EI75TzzWgkvIyWMU1BZcpQRDhvlI8sIQLdu9
         x7f7UK2l3IbCUnjusScOnMM67DCpsE55GZiuy+IRMioT92dIlizZfMfIyWljyjMBdOaU
         Jh41SC/oMCm6tbAqyI7WbosYIp2Owt9hzK7ZGJmejGU9xlJXuIzmxMjmRPxp44/jtbuj
         iPJA==
X-Forwarded-Encrypted: i=1; AJvYcCX22zW2kygkH/b30GH8Z46NJXtzKz6UcnKwi+m4a22Bxoyr33gCecPxD6yipuw/AQoCezf8ziriCvhsXxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpylt84167BKypqEgSoiUbxVPPoXZCX8297KZ1EkKGIsBiUw0
	Of9mM01zPQz+7W0SJEyhTpRbkSLVXMas+TSiugPGYcHCB3Yn9Y8sACPiYkOPYwdWvdSDqpfHhOw
	z/lo=
X-Gm-Gg: ASbGnctgnf2akziyTl0agEhQsOp5vQhpnV0Hu+Myp8Fi0SwF9I+UspMd9R1wjWBkyYS
	+w8/76/sxzAXVKYnXPh0tLFxN7Yr5xZ0lp80AHxnIAHkAKBf+HOFkWszQlIbOi0aRWWuMaIK4dD
	1q+zQ3VdogE17xX0+hTmTAhCb+hjwTGemBxSuI8fJSgyyk02tBqdjfA+QL4mi7M/slbai3++Kes
	Z4rMZUOlpFzq+8HJqHqJIcdDfs4PPg8mgtuAOoTLc+Y/SD+CIKUXSgctEgvqSDNQTGIhb3NzkUs
	SUJIRK6tgVTKD8mFKXV9dW+KmAr9xCky6iD+gRJzml5J2xfXoO+7KX4pS72I
X-Google-Smtp-Source: AGHT+IEduz9vjVMry3jT75IhTo2z8t5UN2ZLgjoAK3uVpOEwnFvqtCA0jcoE2LOGYXlGmBq0wdD1pg==
X-Received: by 2002:a05:6a20:728e:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-2170ce3aa79mr30392070637.41.1747835380880;
        Wed, 21 May 2025 06:49:40 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb082c66sm9710821a12.60.2025.05.21.06.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:49:40 -0700 (PDT)
Date: Wed, 21 May 2025 14:49:31 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
Message-ID: <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-8-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-8-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:18PM +0530, Nitin Rawat wrote:
> qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
> Remove it to simplify the ufs phy driver.
> 

Okay, so you are doing it now...

> Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
> into qmp_ufs_power_off function to avoid unnecessary function call.
> 

Why are you dropping the reset_assert()?

> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index a5974a1fb5bb..fca47e5e8bf0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>  		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>  }
>  
> -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -
> -	reset_control_assert(qmp->ufs_reset);
> -
> -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -
> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> -
> -	return 0;
> -}
> -
>  static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> @@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
>  	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			SW_PWRDN);
>  
> -	qmp_ufs_com_exit(qmp);
> +	/* Turn off all the phy clocks */

You should drop this and below comment. They add no value.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
