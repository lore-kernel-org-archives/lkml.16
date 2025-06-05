Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A961E1DE2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139090; cv=none; b=ZM9ABuBGrke19XpYFgPZk5eEEwzXXmCZgV7ERX7E7cE8Bw/ujD9cpwrrPaNjsSZPHifLE2Ua12TOi+jMkbKm/8m3shJvHVl9WhN/NNK/KQ2R0IKZAMFUYTZVL4HEXsjm0jQT4WwZWvqlsZWt6G8BIRAfWhg61K1GeMn6QlOCcU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139090; c=relaxed/simple;
	bh=vvxsdQUfbACEHt/eKBX1FbZkUxMW64PwCAQm1kKd1aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzAonSawMREEzA+3yVRKXJ5DnWBZF/zxJ6TLUJ2+dxnaj5MttGH9yplVslqi55hjqeeAdkZ7zrV0R2YaigUNKOlKqUyaAKKTa3Svm6VYSzHvRwftCpQ9dZcLq7ChKqyOkRj7RbfmOTa7yadY66X46eIBVzu1SLYd9Zd3tAFuJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=Yogg4UR9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="Yogg4UR9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5533c562608so1128898e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139087; x=1749743887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=Yogg4UR9qXNQnQXykkygTXAAwxWobGNHOHPlm0CcF1Y5PaewbzNNS1uOyM4Wr9pSLt
         noRL59WF148p0TeScTzDsmcx3ngys2nVfUyj+l5bIaOFrCQ9sdhsY39hUslxFWw3K3iF
         oc4oeA4RDciQ5RwDti9H26qL4aWWdzZaWh+VAmz74CEPu78dsw7CjZllDhP3tBtfJrkX
         88XLTUUUJOKprfCN+DXy/gfvB5eDOGnPKL1k8sPu76o6s9Ne0Qo39GexQi1TLJjyExe3
         AXHT+iR1zid0Qg5RrP/q45hNi0NdaBc2jUifChK9BDSfJ6Nb6NlYLSjmsexNsAELRgHz
         4D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139087; x=1749743887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=NGI66fU5jKsMtO+dVV+9F82WTwCCOPTqQ5/pPCcUgUajDTh/zFHGPLxxwpQLUb7E/G
         ntMg0vixhNFXzAGtKphXYK0K8cDnCE5VyVrOj7jqhMI+gHyOwo8LVZQPblayYK1Vcmul
         pmticE6dHbhFj+2I0ZwVrjy4cumzpqXzRO32qMlIVQCvAcNdITrhTzKdBVezoq8JjFja
         PPSUWhC9swenmWM/FZJLxRC9qxPT0XEHUQl4kJLSzyIeqDktBsWYMknJfcicaotKpHeq
         fC4xfSZcl+wDy4tFli/oRoRMOBKerblyz4W7XqzNLpG4a/UD99bsddsW/fNGy/lwB7jg
         f+XA==
X-Forwarded-Encrypted: i=1; AJvYcCXFGo/4qTcO/xGYkmil6Bp68HVeO3/kXxaiUoN+cBv59dqy9fazf5tyLDPCMIpGgHGtwHrJOJZhhT+Z64E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpoplacymnLuriFceXrbbDDRpu/wluapy4ZdioQhgJI9xxGQp
	4Q8dQzr0qYszjqDKsiuCGRdO4afMabihPJGa+ti+VeTzf97YvBpv6+KE1U4JSWVpN3w=
X-Gm-Gg: ASbGncsqLT3WSeOn3E+WRJ6vOAk9VIGEL86dNO1wiVnMsxKxBDLffH7z5xQ2ixJe73N
	HMAJY9sq2ZOrIlr3ZY1XpqPzKy/JoYVJTB5OtBhDL/gA9TkgcVhJNtwFF8kUIBOBeMhUfGXQ7is
	KbnArgrZHi139yJzwKyIq4gBYlHSm7Ia6uvpsQumBvQNOjy5UGa9d+ABqn2cG+Jmiei5/DxksXt
	5b3UOKuj7XlyfmOHFRjiU68nxWFM+amHtfgS4EIaQ6FYNLUNP+Mm4qG3mTbqEyJqKLqrtAK8o0y
	1em3IBXCJ2ipsWGqXcaP+3+7ja+grApZmghEPiunvFWDTKiuazoogCw9TZS4PgSoSGaLUwRxn2y
	x5kkmbhiQIiWbfnIDVxyvUoM71AE2aC45rgpJnF0cuWtp
X-Google-Smtp-Source: AGHT+IHjllPDbBesbytdFFuw49H9HPzHUpGX6GEe0oIbdOiIF9gTADeGFDpUFlmOhHLdYd5ybMcj7Q==
X-Received: by 2002:a05:6512:1195:b0:553:2633:8a63 with SMTP id 2adb3069b0e04-55356bf0810mr2501601e87.17.1749139087260;
        Thu, 05 Jun 2025 08:58:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55365174a43sm69173e87.6.2025.06.05.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:06 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Message-ID: <uomne25xskd3iswn7htoqbwvyws4fivogfkhhl5tz4t3uydsrv@sfiivkwxmfsd>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:01AM -0500, Bjorn Andersson wrote:
> The function checks if a program header refers to a PT_LOAD segment,
> that isn't a hash segment (which should be PT_LOAD in the first place),
> andwith non-zero size. That's not the definition of "valid", but rather
> if it's "loadable".
> 
> Rename the function to reflect what it does.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
