Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264A18C930
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750730; cv=none; b=NmLS8mtMEylZOhSDIaan5z+zL9AwhheWNH8F3l20r5F9hWgikxecoD0eCq1t39YKwFWlmGlVzLfPv1Cl8GjfyEiEsIpOA4c0j7WxRZyXIxVLXQJ5iYAXv5bfqoj0ZnX91RRKK6uYHdPk/ryVUUQGI4qh3+KDv58SD/wfeUmmRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750730; c=relaxed/simple;
	bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=VKCMy6VzsAqArL1GSOlcCCWZynjtZgLU7hXqjgcGLsj3kOyNiAbiTx/3wmUQXpbBDel09OX2+s50cJclyq950y5JUd8y0NrQ2uoR4lrQeKwduBl4i7ExVniyxL/YPmDv7B0Y8g8VEo7rED3OkQBIgnPGaBvXyKx9pzHRbtpCadU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CG8dWdLM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CG8dWdLM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso307536866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743750725; x=1744355525; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
        b=CG8dWdLMsTxbZTBlmZmH7+lJRcBpTSOrE+yAZKODTsIQQQ7rCx/hwFYGwe86eUjrsf
         GoKSsBFpx/os0Fam6hkuRVwJm9m8l/Tpm/KCYCEKz7ia2DyiuYBvEpNySIom/2PzrDW1
         C6qwjki37n/PeMyxr+bR2l1hQ5fYv0ktARX/AtWMZYOoLuO78LBTRv2QqoPzgHPChDHO
         4PM/4VX6jScS17JYmp1kjhefgcm8tjRmOO86D97FlGQbFjQx4tvrCuCXM0Gykjsw/dIe
         719KxaKA4s41OxaU3Gn0OIm2d18PB/x6pThlrcf8bF9KMXzZj3DJcORg2Gn2fJr9BY8Y
         PFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750725; x=1744355525;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
        b=So+v3edeNOnP+aiDvIcdpteV5h2qfZ9vCW4j4jVrpeHMzqu0o7ws9AcrN/1UJxcR7+
         H3cvS6CPP13hnNJLR5Ba9OgYHxTA8Mdegg7YaJ4BHjUDzC1QgGxsiNQnBLsDThoBn6aA
         Qf4IyPVkLvVhqs/iUJhYQHOvSW1D5uPH2QVmaT0HUUzKy24KSIZXSEIjqePpW1mkidvP
         uyhs5qw6h98+nLGII/cdPNkoX9O9fuodPHJ21yogEY219sNA1b1evsujNn1dgTELe7Dd
         EYxHx5pPtsCJTuA4f3h1jqiNGojj3UrUPmxznWlCxa0gpy9nrSXlp9lwFu1cVsCsRmLn
         1HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Vs68bbFLofWsDTSgOScYqb0baofK98XNOWWpC2sQ+rZP9GC3Xwvk5dRMghYb5FWN89VRZ9+OYQK5Eak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLe1QlkUk1Rj2zWu1XfkFFpyhTBFgIFW7whM/4ztktHfGXYbhk
	mKmVl/ukY8hd33myXXz28SPkpIGGu8Wfnwp0qez1dlOHlzZk+DRXZlqlh03LCoA=
X-Gm-Gg: ASbGnct7mspXVrgssR53Q6fPDA/wEqCD4o7lIuP1tQRIj3a0rDI4Os/U95VIvgEA+XK
	JbjHsWU8/TNFkTQmjcdTOOpYhDjsH9YRyzQ/Ywr38M1I11ssKVb6juzu6KqIllMLHsN7rmOV82+
	XQXc8AefdAo9Pp+8e7vZJILlidGbOohFOpJ8ZAWOdz1gj0LpQfimYfGiv8tDDjvE2/UN4QOPMxk
	CeDehVhWOQ+cnRRsEogmT5UAzazAEPqWnWDYfwP24yptOj7HWjI713aLTWrqfc+dTqQIkBfnTRH
	AxB8owdyseVAtOPFvgdoWlQQhr+GF7u3vZUt2+5G2KEO44HAuH6kNA6meCTZwt0j4lnb+2sWTt+
	NdGqACsUk6GoA9A==
X-Google-Smtp-Source: AGHT+IFN6J+KZNpV9GFYn4RUt9e/peo9TpSfWt8AYxwIXQxs3kWCtPSeLrpO1q1TafhsMbSbK20xMA==
X-Received: by 2002:a17:907:da6:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-ac7d1c39469mr190978066b.47.1743750724902;
        Fri, 04 Apr 2025 00:12:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm209663066b.13.2025.04.04.00.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Apr 2025 09:12:04 +0200
Message-Id: <D8XO1JU37NEV.YN595H7NEOU7@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Prasad Kumpatla"
 <quic_pkumpatl@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA
 and VA macro clock nodes for audioreach solution
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
 <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>
In-Reply-To: <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>

Hi Konrad,

On Tue Apr 1, 2025 at 6:05 PM CEST, Konrad Dybcio wrote:
> On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>=20
>> Modify and enable WSA, VA and lpass_tlmm clock properties.
>> For audioreach solution mclk, npl and fsgen clocks
>> are enabled through the q6prm clock driver.
>>=20
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>
> Instead, put the inverse changes in sc7280-chrome-common.dtsi please

How are we going to handle other sc7280-based platforms, such as my
QCM6490 Fairphone 5 needing to use q6afecc instead of q6prmcc which gets
used in this patchset?

One solution might be to put q6afecc into the base sc7280.dtsi file,
then we have a sc7280-audioreach.dtsi which overwrites q6afecc with
q6prmcc which then gets included by boards using audioreach.

I also don't think we can split this across sc7280 vs qcm6490 vs sm7325,
there seems to be any combination possible on any of these SoCs -
depending on the firmware shipped with it.

So somewhat similar to the current sc7280-chrome-common.dtsi but just
for audioreach.

Regards
Luca

>
> Konrad

