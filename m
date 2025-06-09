Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5F54769;
	Mon,  9 Jun 2025 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503723; cv=none; b=SBuSlEU2B6o8KRJdZXzQ484OffaQYQpgxsJHwPrx6s7zes/ZEg/4+X5Uh5ZCPKUUnVGoIUr15LGkQXfyG9G0tn8QYWIEH6faVkbaGa2gsxntO/bUc4td5dYaIJyAhANWzQn0Js97UtTmCxClmR/PV90H6EfPA0cSOMVKiF3gByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503723; c=relaxed/simple;
	bh=WyUwyNOQvv2NmP45NwecvDzJaMkCPdAlzB5N/NxWUtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABT5Y0CXmRZ6H6qusv0fctt8wv2zYItk20TCYmEcLIths2t4GOmY1gqZII9Pf8XnRHXWOzXLaCobJghiCyE7FHWmE32s9hLPloaezl56nFglaYgU8UcJREfEkTDy3kkoJcc5g7Bhq96PSL0nGHJ/x4slidrB2H1U7o8SN+XWa7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgwAVupK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgwAVupK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54690d369so1394349f8f.3;
        Mon, 09 Jun 2025 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503720; x=1750108520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdUGPtTlpUC6/v+J0cKF2p2ewGq0QKstWDropl6Dl2g=;
        b=SgwAVupK4eiKTMnhnB2WqSNdoEUMa+FkQi9KIoJSU/k6mM9VJBrgOLUiYsFa+8kHnD
         TpPZW+WtOtbb/f/399sXV8BEhuoyp46PVf2c9mUSf/y9LqQVCFaVTwggQyclS4ZdZN/V
         liEH5qvCz7/5OK1f1575fA+Z/4EnMC8YeR3pu6/c7Tu+Gyccv8ieweHHCTleNIS6rVA3
         Btnv33dhhV6185ppaocRS1SpVRVZttc6NgHqk7g0uDxPEki5AXpWX+kneqqXNy5JxyNV
         5473I8QI2M9ZkCbVX8/dLgQ5QNgXkDi75LdXw1I54TQ4kg28DHhaBIdkeY8y7QOgcrWW
         pYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503720; x=1750108520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdUGPtTlpUC6/v+J0cKF2p2ewGq0QKstWDropl6Dl2g=;
        b=KWzoF9QX2VyHtGuDJxRWaMK/OBUEcCcyJDXkMujfS9KuzvjRputvd+33cV0JiXRVwm
         qgnyRgQ5iNcvn6u8kR8u5XoYbyT7YKdYT5/gP+AajvseC4mH5r+5rYxhLJOiV9tqclMU
         dJCYB2Pg7StvdyEz6CWaPCFhye8qXProrzu0uwvGnKP5JEInMdKbcnBUBUVn0nHe/W89
         H+4w9DkbYD+3n8RIFQngH085si/n0jrmuPYNEac7VxqjlTMsGNHuDlF96jar5U5+KCtL
         7IA/Nh2pUsn4Cq7oBUpV7lPD521stWRxBquHCGSiEtY6QxlLCVGLc+Z3N5Bx4CSrHvZ2
         CF8w==
X-Forwarded-Encrypted: i=1; AJvYcCVnH1s+zzZ8A8OVcQWMj94avBNNt3d/WuTidi4fHBjyOSr3m5T/8WXYz8F04l3rzJbnNDbcKz55cC7D@vger.kernel.org
X-Gm-Message-State: AOJu0YzTm5nSSO6h1JvXu3LiyPjKL5fvoz6wZBow8jj5zpLh//UXM1J+
	c3Qae13GgIOyIfAFWtjpSHB6NIX7Kjf8Glw7OIj0rmIVLakzuKWHgbsi0RPUSt+sJo5IprtdXUg
	sLUL/9HZy+HtdQGyj6oaDUehyXBgd7Qp5ct/gxQ==
X-Gm-Gg: ASbGncsLwT5VZscOOBVZSm2p1hau2587AeU25L5puLmXf2oGTg5LXpO640e4xnzwsAv
	2iTFrJjveaDax3B2R7Ahlu4y0p9HFWsxeJl5RyAusTxRy+o6S2+l3svX4K1JYfrTXJktL7ZgYiv
	Jyodony8OvR+ttG0OET/9n8kC+bsRjdsDARBJqnpjlXBo=
X-Google-Smtp-Source: AGHT+IHnDY39rqfyXabM6C2ZA5mBuCwtPEAzPVXFzt5iRMPIpTDMxpxRGVfXFcrg7JQY26Gbw3PE8rR9i3j65YW5u7E=
X-Received: by 2002:a05:6000:290d:b0:3a4:fb7e:5fa6 with SMTP id
 ffacd0b85a97d-3a5319b6aa4mr9849350f8f.1.1749503719942; Mon, 09 Jun 2025
 14:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk> <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
 <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
In-Reply-To: <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 9 Jun 2025 23:15:09 +0200
X-Gm-Features: AX0GCFuiMAQqYVHmaTRDSvAAvhlUTnBTSPKbj7XkjGfoHP15lVN94hgLVXQNI80
Message-ID: <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	jens.glathe@oldschoolsolutions.biz, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 22:50, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jun 09, 2025 at 10:32:38PM +0200, Aleksandrs Vinarskis wrote:
>
> > Thanks for your feedback. Yes, you are right, they _can_ have DT
> > bindings for them. And typically that's the way to go for _embedded_
> > devices that are eg. soldered on the motherboard. In this case of the
> > webcam on Lenovo Thinbook 16 [1] the proposed option was to utilize
> > the existing "onboard USB" driver, since it already has bindings and
> > can be used for that [2]. The issue with this approach is that being a
> > USB UVC device it is plug & play by definition, it does not need a
> > dedicated driver, yet we want to bind it to a vreg to avoid having it
> > always on. Thus, adding VID/PID to a driver just for controlling the
> > regulator is not very scalable.
>
> I don't see why not, and this can also be approached from the controller
> side - it's providing a USB bus which includes power as part of the
> specification.  That's just a question of where the binding happens
> though.

That would be another option. Could you elaborate on this, please?
If I understand you correctly, you mean to extend controller binding
(and driver) to take in an additional supply? If yes - I'm afraid that
will be hard to justify to USB controller folks - as per my
understanding bindings (and device's driver) shall describe the
physical specification of the device, and in this case the root
controller does not in fact provide powered rail(s), nor a way to
control it - its an external addition controlled by SoC's GPIO for a
specific device, so it shall be described as such. Perhaps Konrad
could share his view on this?

>
> I'm also not clear what the relevance is here?  If we have a dummy
> consumer we're still going to need to work out how to instantiate it -
> that's the same problem no matter what's getting instantiated.  A dummy
> consumer is a userspace interface, not a firmware interface.

Ah perhaps I should have shared more examples, my bad.
Currently suggested solution, which in my opinion is not scalable:
* Add VID/PID (of every camera, iff known) to onboard usb driver [1]
* Define in DT as:
```
camera {
  compatible = "usb5986,1198";

  vdd-supply = <&vreg_cam_5p0>;
};
```

Proposed solution with dummy regulator consumer:
* No need to explicitly set VID/PID. Define in DT as:
```
camera {
  compatible = "regulator-dummy-consumer";

  vdd-supply = <&vreg_cam_5p0>;
};
```

The problem I am trying to solve is to avoid adding entries to various
USB drivers every time one would like to add a new DT for a new
platform (variant). Proposed solution is a device-agnostic regulator
consumer with PM capabilities, for devices that otherwise do not need
a driver. If there is an even simpler and/or more neat solution that I
missed that would be of course preferred, this was the simplest way I
could solve it.

>
> > Having to add VID/PID for every device that does not in fact need a
> > dedicated driver has another issue - it was just confirmed that Lenovo
> > Ideapad 5 uses a similar setup with USB UVC webcam, but of course
> > VID/PID are different. That would require yet another driver change.
>
> We already need relatively large sets of quirks because laptops have
> firmwares built for Windows which is happy to enumerate things based on
> DMI information even when there is a perfectly good enumerable interface
> that could describe things directly, never mind the bits that aren't
> enumerable.  This doesn't seem particularly different.

But how would we approach the lack of particular information, in this
case all possible VID/PID for an embedded camera? VID/PID was
identified by checking the actual device, which does not rule out OEM
switching camera SKU on the next batch, same way they do with other
peripherals.

[1] https://lore.kernel.org/all/20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz/
