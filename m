Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7365258CF5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355452; cv=none; b=Uz4bGDN6VcRSrchA4z2FlTcG+f9unsbwli/XerhqtphQVlw0R95SAP1pfglSnDvFoA3z7opS1sNkrmqN4T+vKp0DMWSEtBRMh6UAL9DRquiCWLgXBWdyadPs5KkJhImVltF7RX0mR6JsfUIMMjoHWJSob92lcQIXLVEyeem7jew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355452; c=relaxed/simple;
	bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=S0NbBnYZ9+qJe80pBAphp/lLjk9/QL0m+yG2gFVGq5OFbO5eFMcNmG5npnC+pX/Abo3EbEwNBB9ZKTNUzxZeT7IEc/iBpd/5VELKtcHRdO5hPIw+aD89ndJ1NSF69JuUWHrMOlGt5I0qwNvGuP9Q5bitRfyNFnmgWe2C75ZpFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWoXrTj5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWoXrTj5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-440685d6afcso42767155e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355449; x=1748960249; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=PWoXrTj5c0wrG0Y6Jv8+00M6uhEEK7DhE36StAOFiZjUSCyW/eWIQn12d7nMnaZ138
         DiAd7KJDg49x7dkOkeK3TDjE5S4gGSLFpioteWAyQnw7gnsmHHPxo4WC4COBWM4mFQzc
         oX8nTtYncuXaiCNKex3BZGNMPbsIBp+jmAi8LbUkq8fZY3x1S+snE+zBQ246zwrrg1+l
         d7eOPRCNZNTfK+EiySop4Hb15WQriDh9wHVIKrqV7LzmYFKaTEAmkj23Pan4sDkQ6eDs
         YeRUFCn/B/n7Add3qeNupatooyaoDQd8mDu6AmkpQ06yqy+YgL9PNSzf+CuNMMC8tejx
         4Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355449; x=1748960249;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=DkSejNDVE4EuQvVAdmzJfvI2wk2t2YaSaMZCWoalGtVVDsQAgVixX5xR7SQNtesv/J
         xeoKQ2tFarA4B5sGtIFlHyFGVSRJOmpw/DxgzOjlERmHVtuDFAMeoS0RLSN+eVCUO0Ce
         Hw8cgT1HOmlH0lh04R+soN/7U0K/Q4z+LCNbqA/sIJ3ir3rjqWJ+bxPnr7ZAC1Irf5YR
         PvWEkHCxn2BoXN+Y+vwn5lDZAsxKcCNFGCtZ6OSGoS0qVMp9R/1h4dkSSJK6r1B6e3ua
         F+xndFM627gg27AVEgAqixeZQNCjbqDPkYl7NcdNKVMYtK8nGlthlBhLewMJ7ZpUTvys
         edTA==
X-Forwarded-Encrypted: i=1; AJvYcCU+oyvVxVkKe4xupPjYYxfPsKZaFamj7LADCTUz/ESaLSvKdNmoQ4Dw0rS1XFpVg00wvKFYOyWADL/H/xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37bnsFgO0caxqn3XyBVjXiKuqQREuG8MEE8DrwhPeGQNHaT6y
	YlzqPi8r1om1BfdhDvGiKv2HNCICgX2RB+5TT8pBL62985kfK4KXcnF2p8ZJkWoyyl8=
X-Gm-Gg: ASbGncuJylNMzCewolfEwmcNm3kzIEra9T/QX2WF1wEwLCI6gKEA9+q1a9jbfNAMP0G
	Ru3ubFaisDWHDBynVCH2MOqN81K3qUMDHllJtxboS3UuU2HWl4SCpY6HCl7lgVV24w3zr3QoELJ
	xmMIC4K740rSRiGS8MP84fmRPXKYzBK1kgOsBTj4NsZryzMMf60aPlaTgFdbODR2VK1sHN5nVC9
	M8/DSKRsEK7r2fJitv7lU2DoF+R+NRSu51dInnN2QElcK5uRa6mZDDm/AEMG73MVRXfVACkwCop
	93UzrH0Tmry6EdbhXHFC/b3R74ALbB7qDWGyybtk7+Jgu9e+KCwH+E18aQ==
X-Google-Smtp-Source: AGHT+IEhc9SSryCY2JDYzu6BuvIZwbGB1eIwIJMculZ/SWsJAs6OkosbQI944ev/3eMu/PMW8z+Bgg==
X-Received: by 2002:a05:600c:5103:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-44c955da49fmr100008385e9.22.1748355448879;
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99absm266645615e9.37.2025.05.27.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 15:17:27 +0100
Message-Id: <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>

On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp board=
s.
> The updates include adding the necessary audio device tree support and th=
e required
> dependencies.

Do you have topology file and mixers commands (or UCM profile) to test this=
?

I already asked but I don't see any replies. How this can be tested?

Thanks,
Alexey
