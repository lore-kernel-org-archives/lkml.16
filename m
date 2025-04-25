Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702B22E3E3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573793; cv=none; b=PzArH5K4h1GlMozYUCsYtv+U7Ypqd8QDoRbXMmCs/1JXSTRZeMXQP3TMoKPnOTwqQGLyOu+94QoCQ/h8yEtIf8CWlzI40GKo99oadthvNrZtsGnTkO5P4mOpwSBw9fVmtSdnvPwgc6EfTEpi2FEGAdGXbENSmO0ujWP4AQuliX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573793; c=relaxed/simple;
	bh=ioigkbjdcAhl3Sy/dq3GwJMrCQmcZVCmohh2bSLTNL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKBsQK3ssOKcL43xqKkhCkYCo8JGXpYGihX8VTsS/1ckIZtP473ZLgfwKWlEX6xWW2dsWp9QLj8bzrEokR97xG86V/amIn1RS+y6UP0Jds5YJYPAc//iAoxJ8v6xH++pg6I+9wUiqkTZZ88SaE8W1rr3hiUjCYrfihcjUjtY914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NkLwhNKw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NkLwhNKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745573790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lD/LvDHoI9QqH/8Vxi3D6OYMYIKwTaooepYa8dn5Hs=;
	b=NkLwhNKw/tvw4dq4PNdHdR0SkHEjk0U/zaQzwu1ijUF1kLu7GgrloodnAXr1H5jQm6uhZ8
	Yna9/Gy0OpbzuM57AEu1WLsN4DSZ0fJ7fuoEU2/LHEAVeY7Cvdpv2bPnTYZOhjSsLTL7ml
	xgolR98cAZzzfn/I19X0TwXnNiAeK5k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-akjxUarnOKu0tpay3pBj0A-1; Fri,
 25 Apr 2025 05:36:27 -0400
X-MC-Unique: akjxUarnOKu0tpay3pBj0A-1
X-Mimecast-MFC-AGG-ID: akjxUarnOKu0tpay3pBj0A_1745573785
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 971FD1956088;
	Fri, 25 Apr 2025 09:36:24 +0000 (UTC)
Received: from [10.44.33.33] (unknown [10.44.33.33])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A67B19560AB;
	Fri, 25 Apr 2025 09:36:18 +0000 (UTC)
Message-ID: <bc28ca3e-6ccd-4d43-8a51-eb4563a6ed06@redhat.com>
Date: Fri, 25 Apr 2025 11:36:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: dpll: Add DPLL device and
 pin
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Michal Schmidt <mschmidt@redhat.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250424154722.534284-1-ivecera@redhat.com>
 <20250424154722.534284-2-ivecera@redhat.com>
 <20250425-manul-of-undeniable-refinement-dc6cdc@kuoka>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20250425-manul-of-undeniable-refinement-dc6cdc@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15



On 25. 04. 25 9:39 dop., Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 05:47:15PM GMT, Ivan Vecera wrote:
>> Add a common DT schema for DPLL device and its associated pins.
>> The DPLL (device phase-locked loop) is a device used for precise clock
>> synchronization in networking and telecom hardware.
>>
>> The device includes one or more DPLLs (channels) and one or more
>> physical input/output pins.
>>
>> Each DPLL channel is used either to provide a pulse-per-clock signal or
>> to drive an Ethernet equipment clock.
>>
>> The input and output pins have the following properties:
>> * label: specifies board label
>> * connection type: specifies its usage depending on wiring
>> * list of supported or allowed frequencies: depending on how the pin
>>    is connected and where)
>> * embedded sync capability: indicates whether the pin supports this
>>
>> Check:
> 
> This does not belong to commit msg. You do not add compile commands of C
> files, do you?
> 
> Whatever you want to inform and is not relevant in the Git history
> should be in changelog part.

OK

>> $ make dt_binding_check DT_SCHEMA_FILES=/dpll/
>>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>> /home/cera/devel/kernel/linux-2.6/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>>    CHKDT   ./Documentation/devicetree/bindings
>>    LINT    ./Documentation/devicetree/bindings
>>    DTEX    Documentation/devicetree/bindings/dpll/dpll-pin.example.dts
>>    DTC [C] Documentation/devicetree/bindings/dpll/dpll-pin.example.dtb
>>    DTEX    Documentation/devicetree/bindings/dpll/dpll-device.example.dts
>>    DTC [C] Documentation/devicetree/bindings/dpll/dpll-device.example.dtb
>>
>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>> ---
>> v3->v4:
>> * dropped $Ref from dpll-pin reg property
>> * added maxItems to dpll-pin reg property
>> * fixed paragraph in dpll-pin desc
> 
> ...
> 
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^dpll(@.*)?$"
>> +
>> +  "#address-cells":
>> +    const: 0
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  dpll-types:
>> +    description: List of DPLL channel types, one per DPLL instance.
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    items:
>> +      enum: [pps, eec]
> 
> Do channels have other properties as well in general?

No, other characteristics should be deducible either from compatible or
in runtime.

>> +
>> +  input-pins:
>> +    type: object
>> +    description: DPLL input pins
>> +    unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 

