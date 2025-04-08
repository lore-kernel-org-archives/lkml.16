Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BC935973
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744086629; cv=none; b=uoU7RUmD+nQCQHUiZjjVh7lSVAUJ/XzKjdmzuHQG/Eof6i0JuiYgMEgkRin8SiR8mr0dzVMhJ3Cb/PyjCin/VWDQmIKMe1YJzh2BoYeeuKUoBJw3FoWPf5kKkjRVeTIoeY1jlBK9YBezi5AB9Up7c8yQugVjH08gVztTRnB8GAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744086629; c=relaxed/simple;
	bh=iyXwAoHuhvl6gMeqiYjfxKQ6fYCfi84EobhT7OOmjNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxt8usqdWJ/cOQPq5m9xm6ZHzMon3F5Q4D1ugvtdRcSH1Cd883hRFbCXQMGNXv6MJUnJPCvav63gcKZGC7a0MRUv6B+7c6vngKH775s+Egahb+SjZw/92ex0/ExnPdmuFhM3T2yU4CNm80VrWGGBLRRwd4Owgdxga2i5LySjta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hWdMTvDP; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hWdMTvDP"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c759bf1b2eso2645121fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 21:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744086627; x=1744691427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4OEy6OZhlILwQSjnmY1MsVbpm/U0GgRRZk6ChIa6gk=;
        b=hWdMTvDPugpBVtPx8KCTgOfOPxZK2Ss9BCJt9XMckJJwGBEHW3ed32bnE/dT6B556a
         LdvQUwpSEyY1+Bly9ATUYgxH/DocMVAMkJlESPsesyZ8VfNDjPVYFh9Sw/cKZ2XoWtxm
         1iM2md0D2xPoMaD6afaYf/8oyZTPBQsq7Q7ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744086627; x=1744691427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4OEy6OZhlILwQSjnmY1MsVbpm/U0GgRRZk6ChIa6gk=;
        b=ofgnu1HJO18IoGb0RuZfclxIiivXaN2IeAnogVGfhbLhCQLeyyJzfHcCjrCNszGHPc
         msGxrJE9IrwHazJYufSEUMLN/QXPYgK3Ol61mobgF5sbQPa6CffMa/HsR5J1Ey/ZMyr1
         vmP1MwVBtVM8e14ZVwOZr3PiXJVG+kxgJ/kXnf9MBGTPisepTFsYHz+RsH9v12I3djOl
         m2708iH7+hQkoFPzK6LxwMh2Ap+7xo+LsxQFuiN5U9NPF/GXPZZ3tIzGIX9xwBMmfLe8
         7MI6xVl4SH5XhILaTD9qN80EBxRja80dcdEsWp+oOWNmlyYLm8N5llW71Cd2fq6W6a2X
         u9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUhtMSlLH01Gb3E5qvWmP9pXyaPutdPbNJXizS0xeZpVhwOFdfAV79t48exABa//RHFvoIOf8+uxfA99hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzkHS5ZqRbnoVM0qvRsnwgDWlQBXSCmhVwaGbwU1qa1ropWNi
	IyC5vETL6v7EtU4R0dyyFnEmeqvIpnLP1QEKq9ydMykALaWQJ0SyX50georWQ3T5zrPZ45c2bWw
	VfzuEAlJ4UjZOT+6/IYnCYKX7l/XeBNi+w9eN
X-Gm-Gg: ASbGncs4zJkdBC+liGSOumKyzTgelFvBxuHC/PXHt9clYjfcroDHjJgSIS17M7UYrsA
	kXZbI5L11PaRl8I6B1UepLx4XpW8Y7kpu7fgyNV1MwDTY3ZL6uVY+2jQJy5UzAsoTKhfqMUr+3z
	TLuMLvobSoBXjlFXJIFNFfXwhOUgN77AIM2dK5gVJQB4+D356aRbBv9g==
X-Google-Smtp-Source: AGHT+IGIaWa+KfgK8+1VG5ShGQowLo7UFNgp7dmEufosO5bvsNVXRW6PMAFRdrmAeiUK8d7+qNV0I3u3wqhsch7YYTc=
X-Received: by 2002:a05:6871:a4c2:b0:2c2:d2b8:e179 with SMTP id
 586e51a60fabf-2cca187da20mr9125832fac.4.1744086627210; Mon, 07 Apr 2025
 21:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328082950.1473406-1-treapking@chromium.org> <20250331-loud-micro-booby-e0fd4a@krzk-bin>
In-Reply-To: <20250331-loud-micro-booby-e0fd4a@krzk-bin>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 8 Apr 2025 12:30:16 +0800
X-Gm-Features: ATxdqUFiEcJNcUtOjwZOM-aq3gBXz60X9bqBSIobqCxKWQP0Fw3DK0sWRPkE5Yo
Message-ID: <CAEXTbpf9crpkTGctoWseoG1fz=jvUbiTi6e2adZy0JJu78dTgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add binding for PS5511 hub controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

On Mon, Mar 31, 2025 at 4:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Mar 28, 2025 at 04:28:45PM +0800, Pin-yen Lin wrote:
> > +
> > +title: PS5511 4+1 Port USB 3.2 Gen 1 Hub Controller
>
> s/PS5511/Parade PS5511/

I'll fix this in the next version.
>
> > +
> > +maintainers:
> > +  - Pin-yen Lin <treapking@chromium.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb1da0,5511
> > +      - usb1da0,55a1
> > +
> > +  reg: true
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  reset-gpios:
> > +    items:
> > +      - description: GPIO specifier for GRST# pin.
> > +
> > +  vddd11-supply:
> > +    description:
> > +      1V1 power supply to the hub
> > +
> > +  vdd33-supply:
> > +    description:
> > +      3V3 power supply to the hub
> > +
> > +  peer-hub:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the peer hub on the controller.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
>
> I don't understand why do you need OF graph here. Children are already
> defined in patternProperties as usb-devices.

I would like to describe the connection between the hub and the USB
connectors, which is similar to commit c44d9dab31d6a9 ("dt-bindings:
usb: Add downstream facing ports to realtek binding").

I'm aware that Rob expects a usb-hub.yaml binding in [1]. Should I do that =
now?

[1]: https://lore.kernel.org/all/20240301175653.GA2469610-robh@kernel.org/
>
> Where is any upstream DTS using this schema?

The device using this schema is still under development. We plan to
upstream this schema first and then upstream the DT after the device
is ready.
>
> > +
> > +    properties:
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          1st downstream facing USB port
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          2nd downstream facing USB port
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          3rd downstream facing USB port
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          4th downstream facing USB port
> > +
> > +      port@5:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          5th downstream facing USB port
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - peer-hub
> > +
> > +patternProperties:
>
> patternProperties follow immediately properties, so move it up.

Will fix this in the next version.
>
> > +  '^.*@[1-5]$':
> > +    description: The hard wired USB devices
> > +    type: object
> > +    $ref: /schemas/usb/usb-device.yaml
> > +    additionalProperties: true
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            enum:
> > +              - usb1da0,usb55a1
> > +    then:
> > +      properties:
> > +        port@5: false
>
> No such property.

Actually, I meant:

  - if:
      not:
        properties:
          compatible:
            enum:
              - usb1da0,usb55a1
    then:
      properties:
        ports:
          properties:
            port@5: false

I'll fix this in the next version.

>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
