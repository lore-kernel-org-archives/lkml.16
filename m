Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092D22A4F8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941376; cv=none; b=O2CY+0qRlvVZ3bfKeXyxQIOK1hz3GKYFdj9S2uEdzcVlzgqOu7BFIGNeBhkVAbXKcIfRO0QgvBPQWbItMpGf3QcvAAQPfp5oGNoccizDeT/ps0DzEu7aEMSbm4YmwCnbXibbdNXHBcy98KvX34eXu3FXEFCQb/AUA74ZQNNT9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941376; c=relaxed/simple;
	bh=oh3lGHnfxIaGYpsahYhO0cIoVjRi9G3OXpSZP1EDW0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snv0KhWr8sLuHq9tlVOUYz6rFEtKJw4THJzb45RJ4JX4CjhXQEYHjj62r7xJLRdT11ntlZlluz4GZY4sJVjTKXqKeQ2ENsvqqSWIsA3POPR1KWrcuMayLB1acwkq8D2YpI3CNxcMnaKIf4n5QZHxIbLMdYfaGZxW/dghIuJfPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dXeBSUws; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dXeBSUws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745941373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7ryve8rTEMKbXeLpNAkgCd/B515QSjLpqJy/LG9vjA=;
	b=dXeBSUwsP6XkW3RXW9StHQKtMgBz3YJy9Lmpf3E+xztWR2PfDm5HlBLCyyxiKDLj9i1Sqp
	gafgePJJauj3lGJPD6Ge9AYXll8/YKGx9WHuQa8bzj4vRDNFJca6UmoXM+WrOQOiB44yDz
	uP3Gf2NP1nA2RNTfWqnCvrilrF7odNM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-TFhUhlavOwWtGkQuL4PRcg-1; Tue, 29 Apr 2025 11:42:49 -0400
X-MC-Unique: TFhUhlavOwWtGkQuL4PRcg-1
X-Mimecast-MFC-AGG-ID: TFhUhlavOwWtGkQuL4PRcg_1745941368
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso614423866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941368; x=1746546168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7ryve8rTEMKbXeLpNAkgCd/B515QSjLpqJy/LG9vjA=;
        b=LOAtH9TD/eTNZxGv/IntTJhnynNub41P4W0VScwAEmy52I+p5JvSac0SAcoBQoy5df
         BL9ndy5aL5i01l+NRnwhQ/O1xcbJsAL5TZFB5dDAEBp8OmXF+SRYYR09hpOVatjnCnSK
         9N5BjoPeJA/GQTq0CT0skz7ADMmzBkdG04l87s8PVjT56j4MzltN9aLyVJ40QUc+SLD/
         ZjpFa07fvbm6PgvkcjD0fm+IBJw7hpc1PkUiYzKh1d6dK92qjNiRG2dUzmIjL3Gl0d5A
         MTj7JNzPsOuaiWRmzEXYYNA7ERZ7Zn/yQQifChPgqy6dh9BvaIFnzsmjLBCLfg4CfmQ3
         jKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SK1ldMdHj793MdiHq/Aikl/hdECv8LjPGi1//TC6qWMiSpY50zmN3GxVh7o0GDBg7qKjdANennbv/MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAeTZxUoIavqat2L5qewW9jGZVYkpcpkAOKv/FoEOMVP0ry+C
	595PRxNd9RcmMaw8EmkWjTEYPVNsC3HEvnkeMlMg8vNMMRNp0c3f92CqVjvWLBK/YlUoqyDoCfj
	wcvGLqXUJXf4cPN6cd3CUQBFpYJLAj+PZRjj21GiVuy/qV/EKJdbfwun5NbKdTQ==
X-Gm-Gg: ASbGncsjZbT6bc6rTCDYADbr8DdMUrBK4LEimCvIFlfIP5YhXbkRWoClInXYViF08FI
	eNJqC9EeyndW9uJPdLm/5XkTwavo9FIZa9Zw79alakqvX1j0pxp91Ki1AONNq1XzciGtrosjY+L
	g4WhtuEjINRbpDWSZlVmVJoBwkgsxaOqFY8phJ31GwGEC950iaB8HpogghA1HllJEQAHoz3JSE2
	I0+KF10QQyqh3wcB2uk2mDQ2OGGjsWq9gZWIHNlXtWZ1Vft8af+4HunXsBisaW3Uq6vAJtSWTUt
	oNQpSP7DA65tXHDIu1at7eSpfVDfyjJc0sUTRHqXIkh5tq9LM1sWlMhhPzZ6gfo1+uxgccX8OWL
	00c3u7iX01N+hPsarvEmcP12Me8GVkqizJ5xYEWaUP9IS/boPhh5dPfCM9PTuLSPB
X-Received: by 2002:a17:907:9706:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-acec6ab33e8mr329705666b.47.1745941368354;
        Tue, 29 Apr 2025 08:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFubXpfW+kmfgKJfs0fMd64miCv7/wDMCUb2jCA1Md4rCnEWoTksuSovTaTvJNXVE8SKU/8Kw==
X-Received: by 2002:a17:907:9706:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-acec6ab33e8mr329702866b.47.1745941367987;
        Tue, 29 Apr 2025 08:42:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed64fc5sm794100366b.129.2025.04.29.08.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:42:47 -0700 (PDT)
Message-ID: <67e9e989-b3e2-4a2c-9332-760b79f4fb15@redhat.com>
Date: Tue, 29 Apr 2025 17:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
To: Conor Dooley <conor@kernel.org>, Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
 <20250429-effects-subscript-58eb41737816@spud>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250429-effects-subscript-58eb41737816@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Apr-25 17:31, Conor Dooley wrote:
> On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
>> This should be added for boards where there is no pull-up on the reset pin,
>> as the driver will otherwise switch the reset signal to high-impedance to
>> save power, which obviously not safe without pull-up.
>>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> @@ -45,6 +45,10 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>  
>> +  goodix,no-reset-pull-up:
>> +    type: boolean
>> +    description: There is no pull-up on reset pin
> 
> I have to wonder, why are these system using the reset property if the
> reset is not usable? Shouldn't the property be omitted?

The reset is usable, but it lacks an external pull-up resistor, so
the driver cannot switch the gpio output on the CPU going to
the touchscreen controller to input to save power as it does by default.

Regards,

Hans




> 
>> +
>>    AVDD28-supply:
>>      description: Analog power supply regulator on AVDD28 pin
>>  
>>
>> -- 
>> 2.49.0
>>

