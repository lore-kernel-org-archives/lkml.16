Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D4284685;
	Thu, 24 Apr 2025 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513093; cv=none; b=KvQJHZRZ47H4QWOA0s1EUQ51zsg2et1U53JqxvvXxh25W/JdUAcXNGHKjM3PSHfypqe60MXUxAEVopPi9KYgLUXUZfgB8t6ub9ESxLj0vKz5W3GdQ3+MPdrD/sqFmNVAnw/eH6+GpaeT0n0HeyeYcC3yZ5mFfhNnwM/arL+cVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513093; c=relaxed/simple;
	bh=7NCmOr8ivNGpObb9WZ6jd5tfqxQcsNUuuFxY9SHRXRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daINND96914+w0qEjfTQmxcAzfsayymXrtSMRKO42rKVl07hWqEKW4/adUlrPy2WWGGGMWzXFLcdCiVx0+6v8jYOpuFHDzKyrjFTg3ADOVnpeDcHq41fESGUd1kmRaJoxAFVjX1vX61tHx5+Dc96kafuE2dX0JIfTvs0zTpNqeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHhLeZB6; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHhLeZB6"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4775ce8a4b0so23582061cf.1;
        Thu, 24 Apr 2025 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745513090; x=1746117890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCmOr8ivNGpObb9WZ6jd5tfqxQcsNUuuFxY9SHRXRE=;
        b=DHhLeZB6SyBzfDLaqc6yJCeLTFzzFATT/5c1kBzOu6prTSRO56Rd1lYMFzb0QD/hB2
         73HMIGpFhUmdwWRkGSuHCU5LBfW8aJf9F0xNpRD62P3S2+w7n7kLmPXZvqjh2UxU4ev6
         6nf4VNP39PkRtrZKF5XdIU/k1JVA2tK88f1Ef6ORMb2HkcCiFjD+fjRMAOozSJfu22C/
         fZfr9QQj9w1vH0+rYJ3gAIKpFMdIuEOB6e3d0v/Eet8IdF8DfGjWszr1KEmDA1dOUpDW
         pMvahxWwQXWKWRU/6ldtYK4ipSzrUakghNaok4LdzUyemPUsfBn/G51sKPKG8b4OxAWX
         Eh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513090; x=1746117890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCmOr8ivNGpObb9WZ6jd5tfqxQcsNUuuFxY9SHRXRE=;
        b=NF6D7FLGn+l0Oj7OW5FRpSWN3mWo0KLRFrr6JkhXUgtQzc9YmAnvTmakWnLIK6EJPj
         /d5Ae+7EX8NivKlThBp4b2ESjiJT+NSocpYQCu9mdePsOuV5NDZ1imHSc4Y+RW/nhgUG
         qM/mV8jFotkJMRrWKUJos4Q/YRnwt3sKEl+vMRaGOoFzhTotBWebl3ZZdWyxwoza/JJ/
         icE+P2Ebdrxeic7d+1P839kmNW17h2zSBv+dYfYzIgo4cOoXVYrHaBo+T99FdxUXIVun
         9gBKvaRzQ40DIUQFbDOABoYbkglg7/qwIp3FdOzC7Fg5pi0pgiCb+IFybZynRuHA4T3m
         PI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZHI+7hGwdWkD/JWBVXZzclUmEtBxWsNCpoL/3z0WEH1sIBqv333ZtTVHtlGt3ym3+bVLmw6QO2AY37Ii@vger.kernel.org, AJvYcCVGPgqs22MjSG2kcuKFJusEUzi9tW0LvV4d5QsnGewcPJAcwgIGMw5Acz0AFfDbXuEP90fon0QMmDKe@vger.kernel.org, AJvYcCWIa0M8B2oORYCXarKtuJUeIs2LioZdkgy0hK36eB4XRlZy39ZxgpZJs0zelfpKF2A8nugqtnsU6vZp@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBFnzVkk7dUTdu4jPuqPV/O5yYPsRpgQkvUpLLP2VGsODdawV
	MMxbpwvAVbb+tqGkOjPurOU9NX8DFxPOi2SefJU+IDQ4KUwtCcGdGjNM4qbnD0uWQxEDh9Ul6Cj
	xb64PtPKDe15JgxTX+sL1TMEAQFY=
X-Gm-Gg: ASbGncvPUPsRqcylEJpI8BvX1A08987opJWBnJTPULMYftp3+EVtfTgptFSm0vDnqqB
	md1ZfLjFZJopY78M/oOEdRzkAf0jVm8Qjls56fy6pd0Q0XUedzlvCIfshLIYCm6iVWnSMz1tMoF
	NjkNXWGw4yT5aWX/Ruz/ysJJalR7fLkH/W2StmV6C94l6OWqo8bCKyEZE=
X-Google-Smtp-Source: AGHT+IGwl9qg5A47WQV5p425vPqexd2FWCCDotFZYmPIcXKIAZfxaFLI9IbWZk6/iOtRT3QN34xhomcTq3HV9qCkZj4=
X-Received: by 2002:a05:622a:15cb:b0:476:97d3:54f with SMTP id
 d75a77b69052e-47fb9bd7a15mr6813021cf.14.1745513090302; Thu, 24 Apr 2025
 09:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-vt8500-ehci-binding-v1-1-1edcb0d330c2@gmail.com> <20250424-chaffing-mating-e512c198c0e6@spud>
In-Reply-To: <20250424-chaffing-mating-e512c198c0e6@spud>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 20:44:58 +0400
X-Gm-Features: ATxdqUGf0ng_ZmgBzRLblE9E8xZ_d46r02HWPlW-sjruIqBiqFg4Xxg7sTs7hGw
Message-ID: <CABjd4YzyUfE7YUGw+B5VbVzhVJevsbODnSJ14gwyydvfJxfb6Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: generic-ehci: Add VIA/WonderMedia compatible
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Apr 23, 2025 at 11:49:45PM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs use a plain vanilla EHCI controller with a
> > compatible string "via,vt8500-ehci". Add it to the binding.
>
> You should elaborate here that this is already in the driver and dts
> files. With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks a lot Conor! Will submit v2 with your tag and elaborate in the
commit message.

Best regards,
Alexey
