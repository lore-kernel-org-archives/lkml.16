Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA2F26C3A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364989; cv=none; b=W1pYGWTNUS8eXgmmnAt3S/EwKNFf8MW1KX771zdQNa69ajQK0Btlv5hrOtbKMClUNLC6Qgt04SPF/SDKRfm/thJIhKS12GA3cwTHdOIy9OPfSH2fZb0KQq1bOx/ofCCcVZ/dk/5bWJ6eqnUsLiPG3+YFdb7t/iAQbcz5/TdmvKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364989; c=relaxed/simple;
	bh=2vbNBkeXRi/g9zbIjofBUV/jYjTJHU7Rfds+Aml04H0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=jY2tKnWQYZ5Cs2+Cn5PYSRfGVyEYsomqDhzbp1aZYrwPgNdxDySMGjCDoGOzIPe0teeVpALL31X3q61EfkM4qjzGI5ghMbpSOV93nHI2V3/G3BrJ4dPB16PW0YUao9yKsEZhmPkE9YyqvUKUS4MPSGDqlhR+YboMuGCzWmSql9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zh96yD3s; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zh96yD3s"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso5175104a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751364986; x=1751969786; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xXy8h+9TejItbdqFIzK4yC4mViXvShPTEKGB2PqHcA=;
        b=zh96yD3skf/xfV03qpXhZd1nGNC115XO4MNv74tXOedn0eHB9Vvo8Rw46RLhfB/oL1
         zCyZeh6vTszxpAOexV8RLJl8JO1LwfxElToDDOC/ky9Ic3+98LMymGsgN4/Z6wqwMmZl
         KambGpZFVDIdwsj/lYwDo8d06n9IHCfx1pmR+cH6X66tVAQuezaBJWdm5zrhkIASoslP
         TsdvZoe67FPJCt/PQGtpwFlvWdMULe/hOWpzunz0o3CTZOP2ctqxKX2zKF0zU5dLBI7C
         MeuZXZ3n7/xHalaFUm9G+77KNz6RLZcUpX0DSfU68mMFO+R6NnSn1KeBipf85L8BUiVy
         EphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364986; x=1751969786;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xXy8h+9TejItbdqFIzK4yC4mViXvShPTEKGB2PqHcA=;
        b=jChckN8MDDRHlh3k56AUtb+lMjNSJoDb5LvHn+p6qDUHcQQFA4KCQRviLiAXAnQc/7
         UpDk8drS9IKY3bCMIsCaIVANLrkXxtglvafuWZlfQDlpI+enhCAJbg6HRu6upgljCawI
         sSPLGQBhT9dNueiBHcPV3B2wdwIA3WlMYun9/YVsTaTM4VwrTfW63pjCakK6rdeshG6g
         evjLo/wPyFo3X3VHvApxYv7ugrYH+nc8OMR22eYxxMALIkoGg0y0acCwulY1iyGReRWj
         d7fTxoKav27d8Xlo2J3FXQKlbJE1ErWD5J8apCZF6PK1AeQ9eq2TwQWk6ZslXkTnFiAM
         SQsA==
X-Forwarded-Encrypted: i=1; AJvYcCVQVC42v4cjcWfvunDt351yyh6lFTMzRmKqmEHr/dKvGO15hrZHgRNh1OmdghfJUO1Kzq5wvUNukayPw/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4wKL6I/hzHfkhyJ3+Jv25Qq02jhdYUB3HTQPS8JvM5AI2Ncm
	rLDhGa4Wj5YCS8xJ3mw21yLZckAxpJYgscCeyUhOhUU0nNYujU2FVLL4dxo86jSx9+8=
X-Gm-Gg: ASbGncsw9K3IdZmwspFMH7RxT2lzuDGMekXRRRkGcj4aTuOqf2LKnLBjBBvrvpeJUMT
	a9acchPkPqNlayo+N9qNyV5vhI9/9RMXwRwbsvFyzw9udXHokYyw8KhGaXA7B5sbvFrDnJIku3j
	Iw6L+gqteakVILUuGdgWoGtEanlJIWkXpmu85RNNcOWSsHuxkd/vIccmT81pK7ZtHWLXdkM9jmR
	Kemrg8fDvYPg/sH4AlCX71Ro9O05SxRBQkO+/deY4f5S6Ji/qsPjtb/BGSxSI45PsxQnyJTyhX2
	1GmZsCYQtEM7UyyHNobXW4X0vzvgxI5WTJf2DbiKaon8X1xEAHFsRnAsioTCw41VToJYhHrGmep
	pUfLIqNk2DvnZ5AItE59Oa/F5z7KGardHstqrHP3GSSkSD1M/bphufcMp5SVjWVkknZz27hV1jF
	zIpOrQeQ==
X-Google-Smtp-Source: AGHT+IFzOBuC3mZoHMgSDKxYE+Gp2QoQjARO39dkLRc1i2qcYef9U28ETLuq2rRvzxSOj1rllcECwg==
X-Received: by 2002:a05:6402:2694:b0:60b:fb2c:b7b3 with SMTP id 4fb4d7f45d1cf-60c88a41c83mr12973871a12.0.1751364986494;
        Tue, 01 Jul 2025 03:16:26 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b5aasm7072967a12.76.2025.07.01.03.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 12:16:25 +0200
Message-Id: <DB0N2N5JIUNS.3UFD0C81VYS9F@fairphone.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas:
 document SM7635 ADSP & CDSP
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>
 <20250701-pretty-vivacious-panther-540ff4@krzk-bin>
In-Reply-To: <20250701-pretty-vivacious-panther-540ff4@krzk-bin>

Hi Krzysztof,

On Tue Jul 1, 2025 at 10:14 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 08:55:43AM +0200, Luca Weiss wrote:
>> Document the ADSP & CDSP remoteprocs on the SM7635 Platform.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 +++++++++++++++=
+++++++
>>  1 file changed, 37 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pa=
s.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 2dd479cf48217a0799ab4e4318026d8b93c3c995..44cc329be5067ab6cbaa0a46=
7669cb3f55c7e714 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -18,6 +18,8 @@ properties:
>>      oneOf:
>>        - enum:
>>            - qcom,sdx75-mpss-pas
>> +          - qcom,sm7635-adsp-pas
>> +          - qcom,sm7635-cdsp-pas
>
> I don't understand why this is here and mpss and wpss are in other file.
> It is supposed to be in one binding file, especiall that:

Is that the idea? (see my reply to my sm8350-pas patch)

>
>>            - qcom,sm8550-adsp-pas
>>            - qcom,sm8550-cdsp-pas
>>            - qcom,sm8550-mpss-pas
>> @@ -165,6 +167,24 @@ allOf:
>>            minItems: 5
>>            maxItems: 5
>> =20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm7635-adsp-pas
>> +            - qcom,sm7635-cdsp-pas
>
> it does not fit existing cases!
>
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 6
>> +          maxItems: 6
>> +        interrupt-names:
>> +          minItems: 6
>> +          maxItems: 6
>> +        memory-region:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -185,6 +205,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,sm7635-adsp-pas
>>                - qcom,sm8550-adsp-pas
>>                - qcom,sm8650-adsp-pas
>>                - qcom,sm8750-adsp-pas
>
> sm6350 fits, doesn't it?

Not quite, for sure the firmware-name and memory-region for adsp and
cdsp on this SoC requires the dtb firmware file as well, apart from that
it looks similar enough.

I'm also okay with creating a new (after the whole renaming thing)
qcom,milos-pas.yaml which contains the bindings for all 4 *-pas'es.

Let me know what you want to see in the next version.

Regards
Luca

>
>> @@ -239,6 +260,22 @@ allOf:
>>              - const: mxc
>>              - const: nsp
>> =20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm7635-cdsp-pas
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: MX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: mx
>
> And again this is like sm6350 :/
>
> Best regards,
> Krzysztof

