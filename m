Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C1277807
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982847; cv=none; b=QyiPaAmjekDckOZ01N1XkL7eA+H1K5CXmwEhA1J8nNH1uBsKdVPfwqAYN84CmXgwJAY6rXS8bI46aiy5fx+Deoe19/SJU1IKzdXWoPpTJis6IrB/SN45/NXKJmVKGJZrONOF+f08lv3Gj5XOM5BNA36xuSDicFXktWWrdOEUa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982847; c=relaxed/simple;
	bh=ZfQD3/+RCCp6w2X5pFl73K13VoUBihGR1tLCPPFL6bs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LYUVSXo/QHhQYu4/ksbPSNKlriEMKlYW6so3V7pcQf9vHnP3Bmr+I48C/XOJJ3XFD+PbJJOVvfLG9479C46JcJTd+TPtIlunz6Ikxq1BYIZ5/rRSUYlCMxs7Pl/4WZy3jlCyzK3AaVt6X1fFb/p1wZQkTxEe9mLE2AIhA9cY/uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jXgqJ3X8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jXgqJ3X8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so281015666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982844; x=1745587644; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxgFXjvo+MA6Q5OOS8hwkxxF0ljFWJI+c946KCUiiiw=;
        b=jXgqJ3X8/5NVJl2RhmCLQjS7E3JUA6AiBSWizYSR+H4JAkuCKdxEfMe8qp5cqWNAC/
         0MXao4deM+fegnNiCrBB5qRriM7dTE6TsC459xX+SlFe+mTrhQVJcH5JKSLgqY3Zk9qs
         /yLCJiV0Bg2a/XUH3MywNBQKSfZaaVh4XoNoHkoeg64kd0UI3ZvL8ooLcmRj0V9+rlD9
         6H4gB2SC1aL1lGeWNK5uv/oHEz3aPmUhtcA8yQtddagczy4W6EUkL7ym0fqsCgDNfIhz
         LcoKVBA57qc5zC2d9u3zIecATIGoEXbRvQXR4x0yfbfp/PCJP4BBP05ksMQUHf9tjCzJ
         wzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982844; x=1745587644;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uxgFXjvo+MA6Q5OOS8hwkxxF0ljFWJI+c946KCUiiiw=;
        b=c7LEgGTeI1XZr2XFMjjn57hbXJOn2jTFGJvC2ntXXwcdx9f+IkK9IUmIMY7RBC9Tkk
         thtVmlmNAFSfIuQZ03bCTvLxLf1baSie2cRWMHNYau1yxtWW2QtFBpMzewxFUCcc0jHr
         cVxoBgzROAVkxGV5mHmc7K88p9eqcRLYZBAfI9qsFjH/I95gvqyp0Z0qjfij4VANnGvT
         H+OL31POQXuyqtp6l9EwUlI3Fn+SvqPJxmwXpgLEp+b6xtE78NeLWM57ZC4yJc/hyKgj
         uiibEHE16F9RT/chlMETHNSVfQPyJXi0eLItwkExeQ2g52OPxEFCPB/YP+M+7qIOsCZI
         IhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3IPRKpRoiF9U9/6jFvnuuGY8FGsAbqnefs5NX8aBFI8YZDLf9UvvkV22oHt+Z5vusfrilhkhvdJ/0cdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPykGB0AttiLcvd2DTg+TOQeDQQkO3z1N/M0aBKZTR+2jpGzw9
	T6XokXfO84JMPAgwKel1t0Q+UGexjQgL4X/A3mSOcqxdNb19UoPTOkz/eQG+Xsg=
X-Gm-Gg: ASbGncvEKFPuWiUK+VORzA9NsysILR+y/ASGXv8JGag5wy8OlafeyxtQhdBt2+mxKSz
	Myw8rt+p138dSjYgdhAAuotQBo9teKMbVAXuw+x27gC6Yodd0THYrEL0Jk7xAlp8jUU7bURLRAL
	53wCL+ZA21VsZnQgGBHjIg9iDIRJGYWctOvLL4L+XTHkg1rx3RDHqAn1ke4fiGXCvA7yKFcHp/N
	dptkU9kRMU1uIcaQNbMaK8uMEwsvq++eOpPqJ0oqkeXE+CqFZZiNXC209hMFDPVKF/XTiUStphu
	/Pyh0ddWD+V9gXsgsHU4KWl1phyaFB60mhuu89XZQ1x/MEvtiSuKICOtCYdnPxhnFrHFEY4AIOU
	oJ4hiJSzujw==
X-Google-Smtp-Source: AGHT+IG5MqN3XHhnQCGQht4kZrrXV6XlNR9m/tX+qwXV2gswzunEL45vEdv1W+p+F4CE0N6b52FGXw==
X-Received: by 2002:a17:907:d716:b0:acb:39c6:3974 with SMTP id a640c23a62f3a-acb74aa9634mr240183966b.5.1744982843560;
        Fri, 18 Apr 2025 06:27:23 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf5bsm120065366b.117.2025.04.18.06.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Apr 2025 15:27:22 +0200
Message-Id: <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
 <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
In-Reply-To: <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>

Hi Krzysztof, hi Dmitry,

Any feedback on the below proposed patch?

I can also send out a v3 with this patch included soon if that makes it
easier to review.

Regards
Luca

On Tue Apr 1, 2025 at 11:32 AM CEST, Luca Weiss wrote:
> Hi Dmitry,
>
> On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
>> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
>>> This series adds all the necessary bits to enable DisplayPort-out over
>>> USB-C on Fairphone 5.
>>>=20
>>> There's currently a dt validation error with this, not quite sure how t=
o
>>> resolve this:
>>>=20
>>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: por=
t:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpe=
cted)
>>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa448=
0.yaml#
>>
>> This comes from usb-switch.yaml, it requires that 'port' adheres to the
>> /schemas/graph.yaml#/properties/port (which forbids extra properties).
>> The usb-switch.yaml needs to be fixed to use port-base for that node.
>
> Thanks, do you think the attached patch would be suitable? It does fix
> the warning for me, but not sure if it's too lax or doing the wrong
> thing.
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Docu=
mentation/devicetree/bindings/usb/usb-switch.yaml
> index da76118e73a5..9598c1748d35 100644
> --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> @@ -26,11 +26,15 @@ properties:
>      type: boolean
> =20
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
>      description:
>        A port node to link the device to a TypeC controller for the purpo=
se of
>        handling altmode muxing and orientation switching.
> =20
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?$":
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>
>
> Regards
> Luca
>
>>
>>>=20
>>> See also this mail plus replies:
>>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairp=
hone.com/
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Changes in v2:
>>> - Move adding "*-switch;" properties already in earlier patches
>>> - Move wiring up SS USB & DP to SoC instead of being done in device
>>> - Pick up tags
>>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0=
-e6661d38652c@fairphone.com
>>>=20
>>> ---
>>> Luca Weiss (3):
>>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switc=
h
>>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over=
 USB-C
>>>=20
>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++=
++++++--
>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
>>>  2 files changed, 104 insertions(+), 8 deletions(-)
>>> ---
>>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
>>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
>>>=20
>>> Best regards,
>>> --=20
>>> Luca Weiss <luca.weiss@fairphone.com>
>>>=20

