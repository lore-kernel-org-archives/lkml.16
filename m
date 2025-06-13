Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE661F37D4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832733; cv=none; b=b8RO5L2MElLuyu018R9WNScH7fLTcd6zG03atA5fWqoW6fibVCu/9WkVMzkM7w6/oSMGQtgIPMls0eGqDe5oiL1gcsEsgnCVC05K006Gh60/+RjCJw02JdMiESwoO6Pp2EsviuHqTYIGyddKQhuPD/n2UBKMRFgNFm45LL0ffNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832733; c=relaxed/simple;
	bh=z+N8jqjN/nASPdQ0iP1STfKAC3rAtGf71WFeCKFFe4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Umin0UeldtqI3agfBwPDGx+1nweWiejHdM/vxrc9RowAWaaJBdkSMV3Zs6vKJqNvVr7ih4FrKpy4xhQt99i3ZeEd5DR7kQdRcxPDF+IZYORCTdENDViR/pFzjGGaCmhopKA1sSMzDdju4pJHFZtk1hpDFgwgDrPwJ71/mrdXiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrXvI2eT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrXvI2eT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b377e7aeso64512e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749832728; x=1750437528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=UrXvI2eTdCBGACPLTStoFa8xEcUAVUfn08PBuPpbkf1o2OudeK+zyn4d7/uwR1kpr7
         xY05abDosFePjvXdkjq3Z1G9R7cDDO1/abE1MGoIVo2Kynbdwyx9/pzTsXu+6ooDg4Mr
         Yg+OCI+kQyTIK40or6RBfD73KsUYzD8O1Ly5AOG1WDienuUVAS1IrHjr5HztulybFshF
         pSlyU7aFEnuL9ijCTk+5A5sbZ2FCCT1AT3/2XPa1tfqSse98akdr1To7MHDu2qMWjGuu
         WmB/2TxoU74ABPrDg2gMovvypgfejojxyhoY8tHiKbrueSL9dinJMD1dFZMSNF2N0r/e
         cTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832728; x=1750437528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=X6vEkEMOSs4xri1U8iPmlfLMJxPOVARWYRbFn9fl4NlwM+ev5XpYQJKLUq04pCfm/Y
         LQvRY/B5/2J6r8M+PWQG/S/jkYmE/taEB5AHWAR7J7FUs9aDbYEJdts2r3arT5QX9dHZ
         DeOVrBfmySXrRn1eNVn8OxGkzqLhpj3uauwinhy9s8MHmmxGgbS2yY2tDoqaXXNROqT4
         uFmHTPPrfL5D8wiGOvFSPUcFomg5VtmkPxfzhBUnhDROXCTfl63WmK5Yc3IRwEqpWzw9
         HV5Bn923LMwxgOK37e6jC1FTAaebxJC9IOVrbjp3g0yD0+mYJ5tss2on4hdOy7IMG4mn
         7NqQ==
X-Gm-Message-State: AOJu0YwOm6kEmZbYfJQm74znxfAPKLjVVUtP7oXzMpF0FhX+yrt7WjQi
	UgOONwCMa3FIYZlawvHeNY6NIuFOvgTIMJvZQz/SortHp9sN9z0pNN7GRN3oTVeuePw=
X-Gm-Gg: ASbGncuRo791KaHSQfm/vcFkQtFzEc24Vd9EMQxO9604p3qt9IgZyeB5bmTxNTgsfiM
	ae9HaW2lp0ojahQViMtMZDWThtbS/QZQQ6LbJ8e7atM6h4vgtw7XOpmHv1EaAi1KtkWu00Cx33f
	5195yUXnTh6nqUCR2+5BvI9knLGJfwQsFvxNgr1ilrJiTBfGlXUZlI90riCcG8xDNY6Ux2W8r1V
	pvBVBCJMw7LKwXW+fauvxM5o40Lt8h+lPWt7IRIo55aPspNMomM9vsgoa+an0k/6aQz5xpBXwHE
	4eocc1h9100n4jvx/kodBi6c0Hm9Ju/tRmv4pn+52DhLYhiJIwcOk77zmnDY0zXq90bsrbGZKef
	S3hK0MbWUPk8F0AuvTyb9rqsa9noixnUB7rYtSAj+vE+VODNLd8Y=
X-Google-Smtp-Source: AGHT+IHj662g3SbQNpP4iPqUmNkvYX9U4szpKPW9FX5yhoIuara4ioYwpzJZkOyb7Ebp5gFoz9go2g==
X-Received: by 2002:a05:6512:acf:b0:553:2421:f5e5 with SMTP id 2adb3069b0e04-553af991409mr356267e87.9.1749832728513;
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fd7aesm494781e87.258.2025.06.13.09.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Message-ID: <0b94f65a-ec4c-44a1-8021-cbafe6beab31@linaro.org>
Date: Fri, 13 Jun 2025 19:38:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 12:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
