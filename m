Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21A27C84E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857327; cv=none; b=V1FCmzbz1YFrZ5jW1U6+GrN5wo1drrLdiGFax9YA9m2nwk+x7IJ3SWnGjxUeUEe528LEhYrx1SOzK3f0OZ5vkJIqDAxoimMPic69DuBzadFJDph4Mdb5gBuWTNY4w1RPkKaRcAPjVNvtDVkY4V+OQzEpe05uyFmX3HHWt/vVPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857327; c=relaxed/simple;
	bh=bpFyqVnuV1089Ku+5ux8rJ2ecmqFhHkgxj5EiEeZRv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQzhZsX80a2kPw3IxgNiziUm5Ejo2m5q2VXcZOLf6bPMbXW+Dy9r7Iwb+9FsWBw2WK9frkzPZq+etNX5j0w9zg1t/FbJXz+Sk9VgJ0lBGoq8LntVNCRQUlVTigcR+uefF7BA0jqtHOpzxGbs7CnVylW1QlNQ2IqpQaXks1Rv29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NibRXpgW; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NibRXpgW"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7082ce1e47cso42020107b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857324; x=1746462124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYJtlwUK9gE9rMaYOlbOBvLsJs+lLIqjK+LtZtlE7Pg=;
        b=NibRXpgWAWIKe5UMYOjZwFdat/f/I+EKWRm4WbRkQssJjXtQsl6YiIiMbHZ1qH74Of
         MlKo8+yt0mxBlg0KLHVgJDxuohwL0SCz24AlRuaMxgpgF9/YC/oLK40moVsqqMqevn8Y
         rQVFoyCF7CAMkeLlmUToFc2Z2F3IH2Nh+hQtZPHWLoZmPfIRCrJOBp7bWc1xpN1iA3qq
         fLGxERY1f2GGPm+mguKAWuf5P0dDgNZmynZp6RYhAGnjO2XiUqucFcy7rTetzOGUwpQA
         I1MWLY2isG86wcMrZAPYHiII0LIhW2NSBoBnFEcJKlUBRfFxspqxJO6jsklIJvKRld+j
         H2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857324; x=1746462124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYJtlwUK9gE9rMaYOlbOBvLsJs+lLIqjK+LtZtlE7Pg=;
        b=JHnjDsKSrk1Gpk15ZVxZJqpgR8ftGynbRUrQftvwlgK15V/edcKzmTj4ByWAneQ/50
         CaOTsy8c7rgL9ieTK391CHDhchy/wqOAHdD6zv6DkXVF9uHtY56Lvxnd31MICAUHP2uT
         7vvF4nklN/ZarvrKXRag1sVq75uy4n2NAHwshpARIj2VftkeC3FwCyGIzXqVyvLOEyaG
         /y53CSPr01jlxoLO4uyMk6dQOG/RVBMbzR3PH+f/+b4hYOLc8xDY9xCDEfgutkzhiUgP
         4IG4QljESTIetPHsmX8guDn5pmSaKcvLJQIQRTXVmO/iBf7ZqkixpfVoRnl/pHqNhfEH
         N40w==
X-Forwarded-Encrypted: i=1; AJvYcCVn4wNwIw41ozujD/yK+H2Do1OQ+1QPvLv+bQNcBt0Qfdppxl9vAKo+JXA9TTsjVjVHjRDesRlu8cb+pY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YywB6b9y742iIKypaNoeOruc89JC6vLunjqRps6HWWSfjjwGm/g
	qqUlhGvAfQ10DhBuS2zB6ypf3FsSVpyAX+BrOPDBO7WrsOeC1YZ6HSJ5R7zE7VsnE/mRCNTonuq
	+Ff8UhV+qEUFu42xSE8OhtF72XMprbrs5Us7n1w==
X-Gm-Gg: ASbGncuYpxrSSKHq3CJK9XM3oJHDzMvg5DdBm91dQYKx31KdNqNkQxAySpN+IL6xsYY
	n/RJJIGyqcEFDHZDlT5pMnm6yDk486wbzoNAS0Og+2Q3Mx7CxtRtRe4VcQ15FN0mUW5YpAvXCY2
	bmyhxdY6DcpXQ4v4aX/Jyzbo4=
X-Google-Smtp-Source: AGHT+IEnuPZVaSvesgsXBNiFjLoJWiZy53DGC9o8Sp1zW11942XKrl2X+yuR17blEKZkX8LjsFHcDXXyS5d8LGqn8s4=
X-Received: by 2002:a05:690c:4905:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-7085f23733bmr133253447b3.27.1745857323624; Mon, 28 Apr 2025
 09:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417151300.3570021-1-Frank.Li@nxp.com>
In-Reply-To: <20250417151300.3570021-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:27 +0200
X-Gm-Features: ATxdqUFvglZC6L-IAvGpqWBDcRfYWiynLM-kZ_f4pW7hBaIPW-FcbcKpWQ_mW_g
Message-ID: <CAPDyKFpEGn=xcaG=QF4KkvLxwN3Ak41dJ=1mgY5oDn2pRYJktQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: fsl,esdhc: add compatible string fsl,ls1021a-esdhc
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 17:13, Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string fsl,ls1021a-esdhc for LS1021a SoC.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> index b86ffb53b18b5..62087cf920df8 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml
> @@ -24,6 +24,7 @@ properties:
>            - fsl,t1040-esdhc
>            - fsl,t4240-esdhc
>            - fsl,ls1012a-esdhc
> +          - fsl,ls1021a-esdhc
>            - fsl,ls1028a-esdhc
>            - fsl,ls1088a-esdhc
>            - fsl,ls1043a-esdhc
> --
> 2.34.1
>
