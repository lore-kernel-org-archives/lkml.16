Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD42750FA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715324; cv=none; b=rB0JC6rvJh3yBGa5kNj2MSz4lUuGU+xeZFWq0+JABVvk8m3W+yVMRsCtyhbqgfr8Hkw6/clwnvOhLr+9hCQoUTj+53aynpdH8cV0NsQhsy8SKZOdiUQI0cohW9x4FZbjUKXE+Jtt+mK6jGdnuwSxdEkwj4s9tRWLtG9sMul3nUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715324; c=relaxed/simple;
	bh=w4HQEETo+9J0h4a6Dg9A6D3uA03G0mI8l95GvwbBBeM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BNa9lgLatVLMWCSobiyt9jNgkzPxU6aM0muEdEh1aCppUmhjyo+xWCTIUrTH7gTsTFqnVeMYtIMMaoIC7ZJzpyxJxqY54b1sxTIrpp2tMfirA/3X0J+tU4wFHx/H3whHXJEVxG3ffZRkCKeTs9O2y6Wn1JQqpRGpnryWyBrd/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dn/X2QHh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dn/X2QHh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so7029495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746715321; x=1747320121; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrBaAc5FQu6qVDHDFOOHefs7wZaeQLwFmmPALPSgPQc=;
        b=dn/X2QHh0svRlgo2TkaJA3jKsVZxqfLiLD/2B68gQuPA0tnXgtSM8vbsveCgYt1se+
         agP3BHa+VCnXRNy2lc75OToHuskbhL4avmzXkD5TTy0/hTn3VWThGo1RwY4rB0g+f+e0
         uc0Kl2Ox9fo3ANZpSSExHh62tnfWvAEfeStNk6wLM2UsWboSjjGgZYMO7H9FzKYBJtq2
         BLM/50+7DoBy/5YmonOFWsbrIClPngqNSooaPHLH70uLHTslcjMH63auTYIByOunIMEL
         oKv4iqB0bAkREEDqfh0yPE1LluubJTdF8T6reUZTmrJbeKHtseJEjW8ZDhyNuZOVCCPD
         xZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715321; x=1747320121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrBaAc5FQu6qVDHDFOOHefs7wZaeQLwFmmPALPSgPQc=;
        b=me+iPuJS6lsu58WX6qqLprV1MnEDbo9dTA/8pPpJSY5zk1vkbSjVN2ya5m9bVNe5gN
         WRiCNACMV0g/EyT0Y9DKIDt3zuhnTY7iNnqbB7m+Io5IpVVL/aWdeK3GYp1aY3FGpEWT
         xJx2VrhgMOjq4/a5Bgvgjn8m7zpxH1k4X6DTLW8JM7M4sfNj9J0QpbqojaMO7YeIcuuR
         EHjIVtg4V3DlepRb6IWRRAUmydWC9g96bdDQMVw7yzg8+KgZwtrV0q94hJAS+KGadTMH
         w7ccUjwgx9+RHQ0qovEepZv9kT69Vbo2gdZROgxPAw/Z748SncZva3u189faOAUnfvDU
         XM7w==
X-Forwarded-Encrypted: i=1; AJvYcCWRjJx8svn70kfs2hpL1S0h0RZZPJkiNM+pmyzWpctbqU+SeMjxZOTCSxkNP1bIPTh/CWTD5DtDugOiOvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVNd3qeI/rV2e6qnggT7K5uRReQATeAgSoz5n8R+X6tPSvhWC
	VqjSrZexU165Bo12FEz8tO7bKXFA97u2STvc1hKD6vveZnDeNzJ2P0eA7LXorqk=
X-Gm-Gg: ASbGncsBjaafIM//7n1ffXRDoh2e/0PcAQZt7+Q8mjVM+XOxBuvpinZt8mCGRVTKrPb
	ZkXSsJJf2vPDTcaWMwOlGRmEf7GNWjVS9vn/MaPJzUUGgmc29M0QmOp/kveCPrtrtIsEbW42pVZ
	4x2w/U41dMRiEsn4SJyWObTK6QwvYlu9DDpX3SQPTkJpkmzL8cHkHw1YYkeYR+hvM/aSXJgsOQd
	jQgoywir+99tW1sQJsiifrjrBelBIvtZpJ5RUPPYAYKCsTTLSnEL8XU7oSAfpmcLSgzVArZrjYn
	Vh2+U0rTcVqWbk0Tfbjm4LKad+2oy/bdSrl8+W5jE2DWWA==
X-Google-Smtp-Source: AGHT+IEb3dVDFDkl4lU+FypjQEa7HUN4YGkquPGjrQFN+u1Dw3oq/2dd+jM5c24OSKfMwdJVv9cw8Q==
X-Received: by 2002:a05:600c:5491:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-441d44dc05amr64615065e9.24.1746715321230;
        Thu, 08 May 2025 07:42:01 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm40128285e9.13.2025.05.08.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 May 2025 15:42:00 +0100
Message-Id: <D9QUWKCQSNF0.87YLTECWRI3X@linaro.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>

On Tue Apr 29, 2025 at 10:24 AM BST, Prasad Kumpatla wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp board=
s.
> The updates include adding the necessary audio device tree support and th=
e required
> dependencies.
>
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same=
 SoC=20
> platform. Therefore, the audio support changes are included in a single p=
atch=20
> set for consistency and ease of maintenance.
>
> Changes in [v2]:
> 	- Created dtsi file to handle common audio nodes to support Audioreach.
> 	- Addressed the review comments.
> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095=
-2-quic_pkumpatl@quicinc.com/
>
> Mohammad Rafi Shaik (7):
>   arm64: dts: qcom: qcs6490-audioreach: Add gpr node
>   arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
>   arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
>     settings for audioreach
>   arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
>   arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
>   arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
>     headset codec
>   arm64: dts: qcom: qcm6490-idp: Add sound card

Do you have topology file and mixers commands (or UCM profile)
to test this?

Thanks,
Alexey

