Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F79293C63
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017732; cv=none; b=NtQbEGo60Es9pQpkW/JJJQUS117cxhzTOM3CS0EFHu/w4XXLaHU6VrIwJa4EvPkNUVjVhzSs0tjIXq9GH9Q4mG4lQbx4bazsx9AK1SoPUzKu+VKHt9kDcHExhDxpaUiInqFvEjzGK8TLRTqvkDLr/vu1t9V2ciJlVLrZUW6ni5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017732; c=relaxed/simple;
	bh=jk2XiQuMfpRR7673S2qBhzwFnyhsfwKb+E//hNbwE/8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=NGAXzM8Uuu9lsjm9Z+7m1mqV8d8TqJAk/06ErD3JPsoYg6Tn2YkNg2pPy79aVtsQIo8u4gVeTMCmgOM2De3ntXapfE/zE5krO2jj1dy6Tzo9I149GtbYQQLnqTvJ3I6KaJTMtHJbeLT9jp3zxwtpJhHRiXEjBgB3llbIVHiv8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DgnghXcj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DgnghXcj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0dd62f2adso296761866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751017728; x=1751622528; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCDsaW+29dJd0Q/+M489tK44pMH2jQe/+cBTe7kaALo=;
        b=DgnghXcjsrotg8y7cMdF4zPAE5zzvSYpFtnjEJZXTdqYZxnl7KoLWQX0+Be9yZrs9M
         EMSjj9kbC/ZBATAlw6ajk+s9OHKhyssHXfUtVzgxOzuEbxf934Dn3PK4aKmvF7cRMNvx
         VtvANfhXNRv8+hTJ+e9v7pv7nBAr24RMzQlCW5cQAfwPOVKsU5EeCkuj3qaqjanZA5Uz
         YbPOBeD5Jbs1rp2jdh97zfdcSDCuUwXG9oRvtUqbeyfl2ltPOQYXStsKAXl90+BVegcp
         pzDp6JqulaX8w04KV7BkXB1TEm9vDH0xaiLWTKzlWyVLmnVrN9N6XK90D0YKiKtnaOR0
         tP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751017728; x=1751622528;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCDsaW+29dJd0Q/+M489tK44pMH2jQe/+cBTe7kaALo=;
        b=OefwWdiGa1kJsz8mh3zfj/pTrIqEYDLHXhkJMSkwZx1qAS0UA+QKE30AJwuVDaJGRu
         85OkCNetV6gIgIVOaT3M2fYL8vxO9jPEb/w1bBh4qj3gGdn2QhuGxVxOkXwgL9irzlj5
         mZEQiiJSr4jCQS+ML0IpOUek9GVkxefMEwRNoTcjtHNXu9U/lLlcyGbF+4GlLi/5BHfD
         aTc9yyocKLIgaGvCl7pZFExdhDTQhVZCy1WOGMLzq8bMxO6kvIw5k1o6iiPbeN69tYj0
         SLR7tVGgxej6Zmz9JTJPHFYgQGDK/uGjARYuXprw8Iama1EwrC6GlUuuUV0YS0e6psc1
         6YqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMoa48QFUbYnC4p4+ZX09nyMfV2E8ddypGX4fzh00/xVVF38P0p5DLW66Mj2ZbM3ETbb6yC3tJGtiqkA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YykMt7GFe+44I7mvJS3qQRW8IhnWiR3i5H7uKwnWYYpyO72sbYA
	B0O0d6vpdJxgEI/3Cc3mZE2+UCu3sAAM9Zy/M+qC8MfnxrlzkA7GR3ci9o+t5JjUGI4=
X-Gm-Gg: ASbGncuf0DiB6U/qXXa1poR3nXk1CiA1yEPyMOUFmcJzFZg7ENh9HWDcVrzV8OZTD1s
	k5k17DGbb4QN1jHZ2G68A5hfmBxkfQnWfAAjniAxYKXVmat5Lv3B8yuoZVTgOb7Zjscvdkj4MpG
	92K242CLIkeNw48baf4fwcQR6YRWWyuvAibXj86wd9o/N8ecqJDBWMs8eLLrFbdbV9o/2A0VEOp
	EeOE1EPj51WRQNysuXHX1r/72xVtiSWr9nW1cUTincx5O6+mbo/MrcMwK5VXqZz5SQRX4J9Sv6H
	zN1fTVsGzuyl4OrKDdjYDLRfGqCHjrskBqUe51UV4B4Mlurq/QFhCXwcjWOBjwbCwpyU6Stb5kp
	7alZZENkkvHG/gk914wfykAMnuFwYOwY=
X-Google-Smtp-Source: AGHT+IFvxLKtOUHTAM6IaJNk+LxRIz+Sbrpu2XNC5tbYBRY8piKKH2knwTobMqopOBPkPqKUqvHZeA==
X-Received: by 2002:a17:907:1c0b:b0:ae0:6dab:1a83 with SMTP id a640c23a62f3a-ae34fd0783bmr221032566b.7.1751017728509;
        Fri, 27 Jun 2025 02:48:48 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0427bsm92425166b.84.2025.06.27.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 02:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 11:48:47 +0200
Message-Id: <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
In-Reply-To: <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>

Hi Krzysztof,

On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>> Document the interconnects property which is a list of interconnect
>> paths that is used by the framebuffer and therefore needs to be kept
>> alive when the framebuffer is being used.
>>=20
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +=
++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffe=
r.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c=
654b80e2e80850cd 100644
>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> @@ -79,6 +79,9 @@ properties:
>>    power-domains:
>>      description: List of power domains used by the framebuffer.
>> =20
>> +  interconnects:
>> +    description: List of interconnect paths used by the framebuffer.
>> +
>
> maxItems: 1, or this is not a simple FB anymore. Anything which needs
> some sort of resources in unknown way is not simple anymore. You need
> device specific bindings.

The bindings support an arbitrary number of clocks, regulators,
power-domains. Why should I artificially limit the interconnects to only
one?

The driver code also has that support added in this series.

Regards
Luca

>
> Best regards,
> Krzysztof

