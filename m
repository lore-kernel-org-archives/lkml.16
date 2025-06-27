Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38729296168
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018823; cv=none; b=jhKLJmdJpT4TtsUCs3mlM+/2wocQcbgAITazBNo7Ra5dXvJ5bJBkK49m0W6ziN4HvWNLDGO9GX4pzaGJCvZytEUJLQFiTwLTs6/UUNE9Y6r0WQ5lsn1J4ZU7S0Jdl+XefBygMhYf6WtRL/ikFdIJkITp9niRnejbnAl+iVnstE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018823; c=relaxed/simple;
	bh=+IXYk0BLsk9VOjPdYK0JSoHlaBQmpqTb5SeExnFFEbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YLPj72MMAKN561Q3j4zWZVoZqtfLwy/uadosueRWW2ZY/eTP/CbrbAHO6EspH23RvPl2pJLBcx6B/XEAsg9j42DHMMnjy8Ft8SS4F+cNo+b0m3E3Infnexq0/3fLsaQ5wSXnXS7FmwtBxFGNrmGONYaZYjMj/hKSu8nhOJhk7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzHNWuRI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzHNWuRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYXXAceZfrCUqpQ9OsgNrpmSa7NX1ldTsGlTcQdd5wI=;
	b=PzHNWuRINO8x9Gopq4f/mEFCrmSvjM688Jqv04bPQzU6SH8cO4ImSmpko5dtFzngoc8i6K
	m2ilxQdRAe/SkQpdZgcoV2YKoGdVSzSYg+wVwHmVPB/9gpmzHMbT/4qnRndTSXMy0gsdx0
	M6sGr2CTgIV0NasJ9vSjKRxOudDkYDQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-e-hRwPPnM9qFZMWgx4XfXw-1; Fri, 27 Jun 2025 06:06:58 -0400
X-MC-Unique: e-hRwPPnM9qFZMWgx4XfXw-1
X-Mimecast-MFC-AGG-ID: e-hRwPPnM9qFZMWgx4XfXw_1751018817
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso840807f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018817; x=1751623617;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYXXAceZfrCUqpQ9OsgNrpmSa7NX1ldTsGlTcQdd5wI=;
        b=UtcJf2fQI4fPr/k/+v2SIEbwBU/p2//qN6xsHTb3uGxUMgPoUMu5Rb0z32ynOhDPcC
         fzbZSIgi4NcbLuWgbupBb1e8hYS2vn4Mu8R7/ymX55iI5FiZSzHLjSZyVqj7jYcXjHv3
         keCFeBvBzgOpMaBUmzhhzTpyl3RBcxMTBIaJW9H1LCgtz+aa6SbCda/pSCqGgvVGkzm0
         GI/EtaSg8jfg9HI5Ti2Xc5NhljRLNFlCCadhk1rxGt0o2NWnlsPo/K1Rbo6V9s1NnhZa
         pGYKadxmzZ2V73SOtnq6TPneYCEChpZlACkiflBdJpNUZG/3WJSOaHzRBVDYaN89GXl3
         cixg==
X-Forwarded-Encrypted: i=1; AJvYcCXLzxDPss/LoUCVUvulr0k3H6ErSDDFJ5h2Pg15twZvvvoc0sLRn+ZfdrGXzAtbR+4Z8LM47EqSZ9OnLA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlvgc2j97aTdRxZuWpnsi8xVsGWGnHF5l7K3RktAS3xNPn/Bd0
	blu4/EriqZf90+zriyubpgWCHPSfAJBpyCuw/2wQq5l86l9oLo4nm0LtKmO1UcYgnRfS8Ymydck
	kA1R4VP9qmVE8YdhUoYLcKKdNpTD+HcuoININ0XW9w4tu/2fH9QqyvoSAP0IwUDpG6Q==
X-Gm-Gg: ASbGncvWJFBSsnzohMq2MYUorXV0sJwsYqaERyWDQORiyfnPSZtioqya2Q6eAfh9CDB
	D2nE7h8nnTg+AbYw6kLNjuBAfe0y3lHXkaC5eueeRRjUf2Rq+FxEbrT1G6h6Iy6i8dzC8vJY3io
	pdqm8rRYoi74UwB2jaS+2uLY/BxAD4pFF5OaMcZJZCMoXQQt+l58Lxc5OOAFrIR5XMmHMYv62tS
	CCNqkzNcrzCwEVK2WlzeUalYTDMX99IK/K3zvrAxGpHCcSj4+ZwOpOsf8ksOPtfuu9U+SMnz0n0
	Jp6lvVRRwtzm7gP2HvuZdGnCL+9jEi41B9ORHyGwuKu/sAB4jfwyu8IKJRqeUe04l9UxFkETsR0
	h8yhl
X-Received: by 2002:a05:6000:23c8:b0:3a4:eef9:818a with SMTP id ffacd0b85a97d-3a8ff51fb85mr1792636f8f.27.1751018816826;
        Fri, 27 Jun 2025 03:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjPZ2YyzP07UvUHeXF1IowQrFwAxVkZWw/RrEy4ehDzyrnnvfw0IfiYAn/CtAHUzPqxVhAtQ==
X-Received: by 2002:a05:6000:23c8:b0:3a4:eef9:818a with SMTP id ffacd0b85a97d-3a8ff51fb85mr1792609f8f.27.1751018816340;
        Fri, 27 Jun 2025 03:06:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f918sm2247895f8f.100.2025.06.27.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:06:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
In-Reply-To: <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
Date: Fri, 27 Jun 2025 12:06:54 +0200
Message-ID: <87o6u9birl.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> Hi Krzysztof,
>
> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>> Document the interconnects property which is a list of interconnect
>>> paths that is used by the framebuffer and therefore needs to be kept
>>> alive when the framebuffer is being used.
>>> 
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>> 
>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> @@ -79,6 +79,9 @@ properties:
>>>    power-domains:
>>>      description: List of power domains used by the framebuffer.
>>>  
>>> +  interconnects:
>>> +    description: List of interconnect paths used by the framebuffer.
>>> +
>>
>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>> some sort of resources in unknown way is not simple anymore. You need
>> device specific bindings.
>
> The bindings support an arbitrary number of clocks, regulators,
> power-domains. Why should I artificially limit the interconnects to only
> one?
>

I agree with Luca here. There are device specific bindings for the device
specific drivers. But this is about the generic drivers that are able to
scan out using a system provided framebuffer.

The display controller is setup by the firmware but it might need a set
of clocks, power domains, regulators, etc left enabled in order to work.

It's true that the "simple" is a misnomer, probably these drivers should
had been named sysfb and sysfbdrm, or something along those lines.

> The driver code also has that support added in this series.
>
> Regards
> Luca
>
>>
>> Best regards,
>> Krzysztof
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

