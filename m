Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC62EA746
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545212; cv=none; b=G2EugrVDNHM2YWajfk9ZRNNxgcwncCKYpjXVDDGXi3Zw+Oxbwp+AiBtwg/2bwXvr6wlZqNjkJCU9CCvdhfeZi+V77ZJf5wApuD+wcVHwfrSlgSocSYUX4qOt6JaH1Q6atmBOcZOFPUrEH9ZoELvSwGK+N1Fc2+wF3Avqx2sWaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545212; c=relaxed/simple;
	bh=H22Cm7fAW2Mgix3sRqzR1xLudwssIplbSErTvmzGv3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM25IHVJSjeUG1fZdhQpWbUat8Yw4xYbXQseOD5I2GiKU2AzATbLlKkInQrtG94DvcVatjGBD/8ori2ZACnrLgoVFp75ubUxfbrnPSFWJLXveGbll3JEy6iL59zEPWGOKfxo2tdDFpfijeheYSxZS6Er32KmJtsgtBtxCrws8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJXzZJOk; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJXzZJOk"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso4637467276.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545210; x=1752150010; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfwdzUcr077GDT95X0ikFnOKfcLc/LKi5CDyQoMdQA=;
        b=DJXzZJOkPLA0wrKmKvpP1dWoueX82Jqw0EKwkQaedkMPaDxW4DbktalE+5S84MdCg5
         rs6/mkLyOTPUM3ZvRGMU4J6GWkVtjslmdBFZtZsbVWSsRMDxXOo1MYKmF1nB5wiirX6Y
         7D/zMFmsGSfOrqa5AbzWMvgmQ5B6MgCBl9R6efXSChKRj0U91ervPfQ8v8HTa4OHHL16
         tPaDehHDkKvyPHQ6XxCvVKV93gPXPttOVWgMPzQIoTbyUispQf4kzfu7KPy2WA6Jgtt2
         lYpEsDyUXQcNDTnBbOLtVThfMh1sPOXuUgIoxKEhSBp5n1O1P3/i4FMPeuBu/TDwgqTO
         eDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545210; x=1752150010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJfwdzUcr077GDT95X0ikFnOKfcLc/LKi5CDyQoMdQA=;
        b=bL0OmMW3OeI5CVvsJ5W2b2fZnBvQ1XhH/sp0uoFh+9Odcxh0RyRpOFP/KqZY3Tj9mr
         HuO0LBsD6jm7Gb3heyhAXzUlCHssTncIqHSf7acRxITO2BEtuky4poaAUlhnf2LQCuiH
         1sMz9wnXFF8B7yRX1W3tpkT7VnZEHu1imP0H/bBO54X64djqsEhnMBpZ87GMmyK9d43r
         T2z6k6SXchAs0hD9YwvXo82XER4Y88GeTwjboIkLPfPOHqhMWWrVG1Tdm2i4ALJ6b644
         hTzWCH7ZwS6QYizacN9+eH4FGxP5SXqy/4oG8CVi/QfAxekNTP9Iv9P/jsfAYoy6pqoc
         f5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUSZI25axG0L0r8earGcH/0F+V1FGWiEUnzrvnuUBzaLVBs4SNa6gj7Gx+du+zNGCMLqiqXOQn5iontJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRX4Ie5l9ON+au3x+4oAMKmYn9yoQAAK8+TCLaA/r2Bqa1g7l
	RVaROAOY4SiCJQIzyYNI8wqHxZTnuNtPUGYV1l2c+t4h3lXDZBkZRxAklehi95fdDiWal9L0viQ
	xzOltnQB4D/FZ/WSRWMqKRMkMhx9sDpgpzo2g3SD33g==
X-Gm-Gg: ASbGncveZcsck1qHsF16BLcYhISO3PZm1oKVdKisKgaeAOpJl8yHYfj4P0UKDaHWBT0
	9f/l4hLWEhvqenGzjN+C2d9AF5rT1Gfbbi6QHpwTSrrRMic0sn1Qx2GDUcJPsU4vnLEXZqsCFAq
	MqxRGtRI6KySUWNDfcWqPL2slH/mFYfwtuox/lSr6pgx5WZWy47AyPnHA=
X-Google-Smtp-Source: AGHT+IH5KK9d/YuYxQOB2tPs48I1FLMdjmeeJGaqw1PPBtxv5ff4Hj3lOd6N/27ae75D8h/sJhJCSFTlBM89Ljh9umw=
X-Received: by 2002:a05:690c:6ac2:b0:714:250:8355 with SMTP id
 00721157ae682-7164d26c4a8mr89863427b3.4.1751545210173; Thu, 03 Jul 2025
 05:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702085927.10370-1-quic_sayalil@quicinc.com> <20250702085927.10370-2-quic_sayalil@quicinc.com>
In-Reply-To: <20250702085927.10370-2-quic_sayalil@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:34 +0200
X-Gm-Features: Ac12FXy4OCjuCOdO4kTz7sGzO0ku__i49w4Rk35FXh2a6GcbuOrgABPgI4LBfco
Message-ID: <CAPDyKFrP3EqozUObUZuS3D26YOwnViSrWSOcdNX8J6419TpPKg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: mmc: Add sdhci compatible for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 11:00, Sayali Lokhande <quic_sayalil@quicinc.com> wrote:
>
> Document the sdhci compatible for Qualcomm qcs8300
> to support function for emmc on the Soc.
>
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>

Applied for next, thanks!

Note that, you didn't send this to linux-mmc, hence it did not reach
the patchtracker. Please make sure to update the to/cc-list next time.

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b..5ba2da8dbc7d 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -45,6 +45,7 @@ properties:
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
> +              - qcom,qcs8300-sdhci
>                - qcom,qdu1000-sdhci
>                - qcom,sar2130p-sdhci
>                - qcom,sc7180-sdhci
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
>
