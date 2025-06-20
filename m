Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7426E6F0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408817; cv=none; b=HgmmhvF2qwPlwfEGLehA2PKtMvPe10M4eoMayu3hTt1GYSvZiZfzQsA8yjUyaUZYbcgWmCWgu4t2Pza6T2q6QPU6ykaCJvbpUb9DJYm6fFG+8Ce4hetGlYCUJopuXCCXciUIZDZi2vG4Kfdro9Sh1ZFZf5YQS3bEmdLa3DqVju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408817; c=relaxed/simple;
	bh=a3mQToStIF6B1IdwttoHX1nYEJ1tyZcwTnGtOMKW35Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CXo/oJ5xOu8faS+/DR8na8mycCcXLcrQkjUiB+FkDvcPQQ/+MI6BqP4x2Sysg0Zj1k/p87yyj/v2blP2/UfuAGxEo5C4FmcX81ogHNi1cI572m0keP4FoF6YW65RQeX0jmv7qcnStr551pVkUVKaWslA1uQ9/ybsJsXbNTw6wBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OzsPiecT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OzsPiecT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so2502257a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750408813; x=1751013613; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb6LSPnM0jp92EEKrNM76UM1fccTcugFDTVrUIjKDq8=;
        b=OzsPiecTJAWEDjY3lZVKGcTxZo1IjiJb6A2krnBK+QO63UFoy2xb0TJC7c+x27xhqC
         K8WPcXa8R5ILdCCXOBByLgtcytWRNtmsOZ9/JG/zthzGETQq/2fYFtvwclG094H+UI+0
         nIz53UkqIJZt+ICtDSDObVG9OvQ9ORUvlDGym3Rx80kk+BY9BrFKR3rrtR/BriuTB9/k
         M/9Nc9ti9da3+kBYbgfP9Wv4qci+5XbGRDaxp6aALp25RvhqKygC2Ard7nq2Fz63Xxum
         zc4keaPBkwSVzswBkmkNS+1zSyoieN9aWB+bkf3FQ4vcVozl3HdC9lkHMHw+qMQ/jObH
         8r3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408813; x=1751013613;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xb6LSPnM0jp92EEKrNM76UM1fccTcugFDTVrUIjKDq8=;
        b=NlAFZECcYlrPCPmvPzGmh5GYZiYTdRHwTwev2fuHt06JUdnT2hB+wQtJrv9wpRYC/4
         GB/8ugDMXmag7BLR0bIhZqk1oEYE2raNXIdinOKIPvMQ9pA8lh3kJLUOcnjJs19lLjIZ
         IP3YNfTPhLJPSBRtaPEaZPl3VqfhXZNu1K5EIt3mpt9NiYXVleEjsqrMi7LIqazov8ef
         ln126NffLwtXGjLddt9XaZBdMINZMwBWfIOBBo9RoZNRWqqY9BWEE8uUh9ADljSewJ+1
         vrVZ8iOGao5yNVMTllgyETTyZ+k9fV4AieGKHiLm6iJ89AC+ZJ1q1ejSsCAGF/4J3SrC
         yRFw==
X-Forwarded-Encrypted: i=1; AJvYcCXSiaMOs5IXi2AENhqiJ3YT+BM3RqSqHBvvb0SefvnwNwbUxc9lphhc03r47iocD0YEd5sTZWzAGRSvZrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM24VbxuNSXQruRWWAIJfTGJm0sEhUq9EH8DcVhcyKlI4wUEAC
	OJA6DWc3LHk3c7mIc6M0zK4TQJsjQq4W7uXJbUuEj9/502V4YLlK3+kC7lVbiHLdPkw=
X-Gm-Gg: ASbGncuiO+t0lmifInm6e9RRXpirfhXUwZiM5KhREQKmss0y03K5lVM0DHsHAU11nM0
	YsTovX5QebCTi4BzVAeOsY4FR6p8VfUX0aVvxSrAWBJoVnGpZqSt3XtbyTT8mo1QEWo038LnNW1
	M1EjqNU2ehFmUD6A1Y3o7i6OLmVIFl4PJECxGvOCGY5brGZ9C1nsBFqTNeAXL+6uiCqBOesrUCK
	KD9528qlMqF5CjXAxUzJekJ3cMPGGsAZDGiRbKzJclIHMA7UA5v0/0JyXgLvn9NPwb6zO2YbyTu
	e0Lm9+XiNGdWlPV+3uFi+Fi/N43wTc4R92kmitG9e/xdAVLGFEcrDlX+rxHOm34l7+TdSfHsQDz
	BJQ80QxflXodrdKTCD5nCp5I9g9aqyvU=
X-Google-Smtp-Source: AGHT+IHSanY7BYLP4aWQy8kFVBDTWraG5UXAI4rv0kvSKzHjiyN5FBJKlVrNJSNccFlJIgG0wJH/Gg==
X-Received: by 2002:a05:6402:35d3:b0:606:bd9d:a772 with SMTP id 4fb4d7f45d1cf-60a1d18ee41mr1852590a12.24.1750408813427;
        Fri, 20 Jun 2025 01:40:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1854362csm1084336a12.20.2025.06.20.01.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:40:12 +0200
Message-Id: <DAR84ZHFZOJI.3CRLDTISWFUEQ@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 10/11] MAINTAINERS: add myself as smbx charger driver
 maintainer
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-10-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-10-ac5dec51b6e1@linaro.org>

Hi Casey,

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Missed when this originally went upstream, add myself to the MAINTAINERS
> file for this driver.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2b570ed5f2f28341a3bcb7b699cbb250ffa2a88..a32e53d89c29cacf6e456258c=
4c7c0206cf8abf2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20565,8 +20565,15 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>  F:	drivers/mtd/nand/raw/qcom_nandc.c
> =20
> +QUALCOMM SMB2 CHARGER DRIVER

SMB2/SMB5 or SMBX probably?

Regards
Luca

> +M:	Casey Connolly <casey.connolly@linaro.org>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.y=
aml
> +F:	drivers/power/supply/qcom_smbx_charger.c
> +
>  QUALCOMM QSEECOM DRIVER
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained

