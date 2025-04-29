Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212DB22422F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916936; cv=none; b=pnUTyT0Fn2a5ptebvTNlWntBds+EaN9X8QiroCbhApxw4/2G80YL4hQmOpShzGh5xCkS2FAsC2yMPbZ80AkmYblIPVdY8rXOKFSmFst0NYhyi/RHfF+cjUWHFDn2iDlLpa6OcPcCEnHBTX5Dte2B4g7mEU/tDe3FDvoCPMvL4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916936; c=relaxed/simple;
	bh=aCgaBLZqC54bmMTK2wOteAHxvWs6yy0wgoTiN3ivLVY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q9oR0exYmbGdFvDBx1ipVi3F2Zs++3i/pXDtUuOh8ML+yziuHxmFVxtTgYXsnM1TxpiJR6wSXHGbSynFopKdis58fCRQhUYUxEwhQfN/arcCnuPMyY9OfsD7fPGuXzLTBaRA6ZCn9yOazSYvh+95NUp2IBvbPxNb+KFINBAs6+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CLl4B0Pg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CLl4B0Pg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so8920136a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745916931; x=1746521731; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roW0OfGF9cMH9PcSedzCGvmVycjSapmPRO8xTDpFJeU=;
        b=CLl4B0Pg/GyeBilvaXNy2bBWeEfrz6/xk4bfXtnf8l4scSvxGwstvqvRjO8KGnjheK
         cQlIyhbTJuKEUqbRIQhNSigN53KbIQP/mwzQ88ufjY7gtz775GoU1DCVnJyRNKmwoLPE
         TWgC4cyjDHVprWqcDDjKP2jgv0yHMPaYIMiauaAHb5HpeEgAh1iBi8vDcPToAfhrYUu1
         jhjikm+IQ9jKeRovahz/4avC9fQnPcBbUgT/bAF5h2r0I++6hSqkMudLdOR/MHtsLmf4
         mHMlpOQEtHd+taOUCsWLVeaVEOns0ODVZmIIayJn5nEsE9NWpNwO6gYWPFuaW3mBcrJ7
         WD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916931; x=1746521731;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roW0OfGF9cMH9PcSedzCGvmVycjSapmPRO8xTDpFJeU=;
        b=wobKGNN4UBd77Tw85v+yLFUGphR5CT61TG0XGZVUVoMSIIsSPRiDTyFoa6K8NV/DVe
         SdPa1sJmyut126y3XGInzXQ9PEqUNTZHXlg+f1TAftQgRF41wd4CYGRiLui6lu8DtyK7
         LUJ2eHQM6yA6lkneEs9DWREeWHGllCbeD1Dh2fz76YUlexWg7svkH/lJvacsUbTBODCT
         qH70eiDUBIUNzBP0I+JaUSKmRL600Kmlj/9UWTMANC+7KBYYShJuzrjTR34dES3kwVkS
         oSsmP5qVEdHBRs4uy7psDuvMB7lrhGqgGK6qPD5KCVtI8nYrlPb9krx/JwbSsNjkw4Wy
         VBLw==
X-Forwarded-Encrypted: i=1; AJvYcCWHG7Y+51koWl/dU2H80jUNmVR4Z+pLGrXTNuVYoWT7ny7fTS8QK3+LymAZFyw4ICelDsQcnc5SGGZ/4bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9ww5boTFcsmAbJDh8aIhkxHIjB4fNOOxv2rZUeehTkHiThey
	ETyKSTRLa25Jb8kljvPIb5bgy8D7ch9KfFIpIkiQYRAokhaaQoVa57aQpMA1/2Y=
X-Gm-Gg: ASbGncsJhuQLu0VDT4DimMdUwUfNDBm5WklBzbDACgGDvmOJ8BFyyTaa6vbwfxcH3cg
	Z1MMzqj2VHtZ1oUJK4yKmkGnNO+HU35oqgHoLdCmwFsNM5Hr36R3MHzyc6OQLpksCeLdAtPqAdy
	jAX4jYqJwN0132/S5RJsflMsi4j+UNsdTEEzpNA3Rg+3mofsWb13oL1VGPggFN0qpMgXQVFPUL5
	+2LrQ4tP275mitlk613PstYpRlSgCx2EjhGL+OWC6bFfBXpf8L2ADstOszj5CR5Lxhvo/bzoaMw
	AutP5torLk7O+wGb2QkJI7FzdESvhWszMl5q6SWnNWtDFv6w+Sct94dPizlDLuAL02dZGVcFB8g
	yyqcJFz+b9A==
X-Google-Smtp-Source: AGHT+IFfgGLN659eGRoPUHFwUEH1+twktHt4n5gIMSMWq/trLdkqbF2+JThwb4hpx+Sna0dh365yzw==
X-Received: by 2002:a17:907:7206:b0:aca:96a7:d373 with SMTP id a640c23a62f3a-acec4ed9e96mr313624866b.57.1745916931335;
        Tue, 29 Apr 2025 01:55:31 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70611sm754204066b.143.2025.04.29.01.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 01:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 10:55:30 +0200
Message-Id: <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
 <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
In-Reply-To: <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>

On Mon Apr 28, 2025 at 11:43 PM CEST, Konrad Dybcio wrote:
> On 4/28/25 9:41 AM, Luca Weiss wrote:
>> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>>> Enable USB audio offloading which allows to play audio via a USB-C
>>>> headset with lower power consumption and enabling some other features.
>>>>
>>>> This can be used like the following:
>>>>
>>>>   $ amixer -c0 cset name=3D'USB_RX Audio Mixer MultiMedia1' On
>>>>   $ aplay --device=3Dplughw:0,0 test.wav
>>>>
>>>> Compared to regular playback to the USB sound card no interrupts shoul=
d
>>>> appear on the xhci-hcd interrupts during playback, instead the ADSP wi=
ll
>>>> be handling the playback.
>>>
>>> "should" isn't very optimistic - I assume this works for you? >=20
>>=20
>> Yes it does!
>>=20
>> With 'should' I meant to describe the expected behavior from using this
>> since most people are probably not familiar with how this works.
>>=20
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>
> [...]
>
>>>>  &usb_1_dwc3 {
>>>>  	maximum-speed =3D "super-speed";
>>>>  	dr_mode =3D "otg";
>>>> +	num-hc-interrupters =3D /bits/ 16 <3>;
>>> Where does this number come from?
>>=20
>> I'm honestly not 100% sure. As far as I understand it, with
>> 'qcom,usb-audio-intr-idx =3D /bits/ 16 <2>;' in the qcom,q6usb node (whi=
ch
>> I've checked against downstream) we declare which "XHCI interrupter
>> number to use". Without the num-hc-interrupters property we get an error
>> that not enough interrupters are available (I assume only 1 is then), so
>> this value practically needs to be higher than the <2> from earlier.
>>=20
>> Why it's this value and not a higher value e.g. 4 I'm not really sure.
>> Downstream code looks somewhat different and "max_interrupters" in
>> drivers/usb/ doesn't come from a dt property. I'd need to check more in
>> details what this code does - or maybe Wesley can help.
>
> I got word that it's simply hw specific - please move it over to the
> soc dt with the value of 3

Will do, thanks for checking!

Would you have a reference how to get the correct value for it based on
downstream or the running kernel on the hw?

Regards
Luca

>
> Konrad

