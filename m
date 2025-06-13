Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACE5433A5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826106; cv=none; b=nlsqTmgvAvDkfOsMkvdOXT+L3IGB4CRwziFRi0gOs6sfgS6O2SawGWZCdiiBn1RlD5GA9n4QSpihm6up5+D7SBpI2lZ+L/Lu9xkqDRyV7ZfROnoEEsB+K5aV5Ldbp68EZ7Vazq6a8JRIbzv0esIDlBCuBtj6jqo2S/FkhG9w/Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826106; c=relaxed/simple;
	bh=LunFnbTFFDzuGfxH/qbk8l6GPWmy4BO3tDou7e+5RyU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OW5so+Ex+S9x9xl2UddU1zK4nsi0Bs6s1+Q84+1kw6TPrj68y+/P7uEB2hEowK6mbqO27l+gOBBKQCgqWoYsd/kwzVcA7oV+PviEX30yod+kJdiG+mowS7ypCDtwV0lVSutigCAcvpu3zi7jwrGe3495hu7W1wlknp2O6DpGqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2uBbAya; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2uBbAya"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5096158dcso1965044f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826102; x=1750430902; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mOYd+KSN0bGLBIlymGQv2zJrwVUrxAdmR0BhjkZJyc=;
        b=g2uBbAya+Y71MOM4DjUIP+qQMEIJJlos+LZBupBO4QaRK5eY3ZA+LuNZ7y1Hr9C/XR
         WGpWldglY9EYh1GZbQjIgyEX0tDspZCSJq/jMjmY8+zWrejND5z0AWCAS+Ext9K8SK+T
         4KxhATCe5GRhz7cFkBSWuTJv+l/rGx7pAEx8k3m98YQxYRuMw75k7bIK0wZOgwD8oVHP
         CFEc4hkLUF2bPaP5hflUxHH1lm1K+lh26ykPDKTtt4vBFf+iMzxkVBeIUw6Tjlr1C1Vp
         EoyOhHuwXYaXpT6pvKI6LMTJQ0TCCquV4zzhjMsHv/k/Y+VXbJR7o3SkYRdpriYrgWKO
         alCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826102; x=1750430902;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mOYd+KSN0bGLBIlymGQv2zJrwVUrxAdmR0BhjkZJyc=;
        b=jdykt1522q8vhoLvWrdKRTgDu7IvySfSt+cJB5s8OziXCgqXyMnw0g6lTqVTSheiRT
         maa2eZ0JnYGmHrxFSJ0Cifes5cmXR68jij8+nb59rKp6KpQSpXX5sg61paEAqxlW+ngo
         Wp/L6ERj7xlzH9jbROmyQBmqKWkfo2ETyKsLK8UYTaQdzwD4e8tf3v6oFeFZ9+A8k8sA
         F7EjEnSrwzDCkXrq5v075ldUOVJRKz7YkiB6+hWxAS2+aonFu/hHhKBwxvJS5kdM6Dr6
         Z3dX+7xYwHRu5IcsnahlPLudm9r2225bBzupC5sFVZXK++qyDRsbDrn0lDLGp48yN1hk
         mszw==
X-Forwarded-Encrypted: i=1; AJvYcCXx0C/Md9/zEt1/TOZo/TP+lbDEFgouyjyr3+KTjeUz5NY6UIyhMsFBW1joc+CF4XluktPIpQMAtDhRAzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50PaRlWiqvmx2EVkmjOQ8Tjt9uL3lkeccyiQkTBF80lXUhimy
	fT8g5uk+jQajqOn1Mf/yZtleUX3uEEPHf3PkD+xryCJ+TIz2oKktR3+iKsROYwevcfcvzXG+hFV
	wxvukSL4=
X-Gm-Gg: ASbGncuZeSAkCSNKNYkNDI7boTLLM5NOUOE/FXvq//dxkiOlgkgtr9IxAsMG2xN1LLS
	R0j6lpxdsSCy/AMP/zToPHJGVepCnr73o6faoufm0Kas+IMQCMzfd+gqLNvU2wpfXWvG8+f8MI6
	2jFS5P38PpfDEeGsaoEP9bOIE8mhxcFGTjlHqL2UOcVssfya2meMdJVqRLhC+bTaLbaGKqv4x7R
	Co03IUOHFe2WcC2nFCWMEfyzdbMvdSITWtRwzs5s/XxS9sM6aNjBAtPpXjcVi9zu02p0NtkrPTq
	UYvhCrlQ2SKc7zqHuvWIm308mEOiNJuqlufs8AJNoK0r2RU6QdPrd2Qnk2JxyZiVQvdRh6pYy0W
	uQbs=
X-Google-Smtp-Source: AGHT+IG9yKxjbUAlD81jUcQCQqnSyAIGryKoG0zNvJd5LrpgpBsrLCC2LN8O3W8Hm1XE98lIX1UEKA==
X-Received: by 2002:a05:6000:2486:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3a56877f1b5mr3610228f8f.52.1749826102428;
        Fri, 13 Jun 2025 07:48:22 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm56505835e9.2.2025.06.13.07.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:48:21 +0100
Message-Id: <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Ekansh Gupta"
 <ekansh.gupta@oss.qualcomm.com>, <konradybcio@kernel.org>,
 <srini@kernel.org>, <quic_ekangupt@quicinc.com>
Cc: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, "Bharath Kumar (QUIC)"
 <quic_bkumar@quicinc.com>, "Chenna Kesava Raju (QUIC)"
 <quic_chennak@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
X-Mailer: aerc 0.20.0
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>
In-Reply-To: <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>

On Tue May 13, 2025 at 2:09 PM BST, Konrad Dybcio wrote:
> On 5/9/25 5:42 AM, Ekansh Gupta wrote:
>>=20
>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>
>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>
>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 +++++++++++++++++++++++++=
+++
>>>>>>  1 file changed, 70 insertions(+)

[...]

>>>>> IIUC the driver only considers this on the sensor DSP
>>>> Memory region is required for audio protection domain + adsprpdcd as f=
ar as I know.
>>> next-20250508
>>>
>>> rmem_node =3D of_parse_phandle(rdev->of_node, "memory-region", 0);
>>> if (domain_id =3D=3D SDSP_DOMAIN_ID && rmem_node) {
>>> 	// ...
>>> }
>>>
>>> maybe some driver changes are still pending?
>>=20
>> Would like to add some more details here:
>>=20
>> Memory region is required for audio PD for dynamic loading and remote he=
ap memory
>> requirements. Some initial memory(~2MB) is allocated initially when audi=
o daemon
>> is getting attached[1] and this memory is added to audio PD memory pool.
>>=20
>> Additionally, if there is some additional memory requirement from audio =
PD, the
>> PD can request for more memory using remote heap request[2]
>>=20
>> The support for SDSP was added sometime back[3] to support SDSP usecases=
 on some old
>> platform as there were no dedicated context banks for SDSP there. On rec=
ent platforms,
>> context banks are available wherever SDSP is supported.=20
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
tree/drivers/misc/fastrpc.c#n1273
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
tree/drivers/misc/fastrpc.c#n1884
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
commit/drivers/misc/fastrpc.c?id=3Dc3c0363bc72d4d0907a6d446d7424b3f022ce82a
>
> Ok, this was mildly confusing given there's specific "normal" region
> handling, but the DMA allocator takes care of this one

Konrad, Srini, Ekansh,
what's left here -- I guess memory region is needed,=20
so do you want me to test with secure flag as the only required change at t=
his point?

Best regards,
Alexey

