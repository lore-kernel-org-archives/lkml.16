Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D282DE6E8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531672; cv=none; b=nA3r2ULeRPp8zb3hdnffZJZMat5+lM7/MmOWIXd5Qprknp3Yw6JlaSwgIG/fXfXVNsald792Tn2UenAxyUFN6RWRBlm/UWAVHwvRSRPALNn5G5dt/z4Asn4DpOAUBlv24HOJLSkwg4K2x5T5stFjksmNLeBvc2BYaLUc4vKn2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531672; c=relaxed/simple;
	bh=KiU0mOb5SXdM9IWDYReGvf6ZjDNAjg2kPIgG3hlcS6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zp8PefZ8rJsDlTrcHmFMxskeJoZrm4Qpprek/RVw4QhqKaInfd2TkGpcu0XRPF3lQZ7p6nw4o9DGFgpmQaCEYH0j4DBsu06QCNvH6zBLk2oEHkIKv7KgBaNsr8mZ9AaCi97q8kL1n9qYCBSDjUWhCh1K7y7Eq4ZUi4ml5l3eb94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8xi3QBo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8xi3QBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751531669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=221h2gTHX6oXGMnPCILS/QRTKOojZm+JGCoLjP5IEkI=;
	b=M8xi3QBoJWosophErrvEJKJISZRMRSwN0PWWTDtHVqV9NBGJ1/q/xKg4uh68EoDfShdOdP
	7NvoIRAkmkK7VfVLjOkOPTRAn/BB5kXJ8IVZ0E0E9h8i74C0OmNr/sUzGd5Z6d/OzyyJ+J
	ehrQr016MBpwSHiWI/2HM2Mi3ZY6B00=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-f8xMd7lMMKm0T5llJhRt8Q-1; Thu, 03 Jul 2025 04:34:28 -0400
X-MC-Unique: f8xMd7lMMKm0T5llJhRt8Q-1
X-Mimecast-MFC-AGG-ID: f8xMd7lMMKm0T5llJhRt8Q_1751531667
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae0dffaa8aeso81694866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531667; x=1752136467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=221h2gTHX6oXGMnPCILS/QRTKOojZm+JGCoLjP5IEkI=;
        b=r/8lunvQ7CeW2cSC21LggEeosmbzWzWoxiVSQvyMCQiGgck053nTRON+7HLdjC28RO
         AtrG9A+EofYhvkN6L5LF4Mbu4wSGXWn/UAPaYZKrnDboSSnwbXtB3XZEyzFnKQXa+9k+
         yF19bqc9Wx2mI7AnXM0TD8meeYMFNloJnSCcLyUXgzlgm1NJiB0SXeDbU0KLJ03tdz9d
         AG1D5pn+01INGbGfT1ghbBPysR+B/IXmauoBLPy9FsRTzc8G65B/EMRTlGbDhgZZa4m/
         8LRv3ZvKdCzyZdaqZYiaKDWgwKy8RR8Q4oCqXFy2binm+YOVTDk//IzW1rFcZRYIrGO7
         aNkg==
X-Forwarded-Encrypted: i=1; AJvYcCXO06ysQXbvUQ7MbWIvpaVVfNLrddLf4kin+i+MONXS7OYI5khViXx6TLQxnenm5MD1UkRfwsTOgkbO2Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHXHLXhfyOxPc1JrUR+8IXni+d1fPehacexRRQt8R1rDtIISw
	SquZoGPPBj/BgkcPeguhq2RplT+OaEEZtPgPgmSt24wxsMcWjaCLAGj1/jroKzyHv5xSZ4hX0sF
	AON5nQslzh4ZrG7HX6PW8tzYh9zLjR1SML7SA5Nt6JXMO6ewaCmdk5PgU6yOu10A+JA==
X-Gm-Gg: ASbGncuDsL3IWUpCo59fzXbH3HuhmZ2fNsgRfryvcDPdJ/+Enx6erL7eMnqa2vwXi2r
	ZZTszDobr7QZ+RbM9e3Q/zP9u08U//Tdi4I427DYx9tjoHu3f1dW7Jd6giV0bkEwWwOUv7M2cv0
	gcyOJp+Qaxz4KRy2HbTFZJzfZYNTZXhzcX0QbLf2VCkeNIpvR3VUt6onWt+byiNg5j843EHk2Uv
	vG7S45KgxzzYXaFFAuXnag3zmu6nMDCsjcu3xMnpEtjZC1uz5u/9tx3WP/GoVyMI97piRHurnYT
	PdmVMc/kyFuLdh3krkF4I0dw0BQcKI8yTVRzXS2G4pQe9O+724OiZMnkmYI1+5ZRxWt9Imchf4i
	6mr0PqXwD789T/H8Xl727QbluwSU9rKYHAaO67cgoRYDzC4+3qLkpogUQ9hDkUXdDT9ieZkPb
X-Received: by 2002:a17:907:3d8d:b0:ae0:a465:1c20 with SMTP id a640c23a62f3a-ae3dcc33e3dmr202629466b.14.1751531666729;
        Thu, 03 Jul 2025 01:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jetECjsFXFGgQLjZYc5QGYfQzjQBHnfhAK7F+xPPGCcJzJbtB9How+LBWAWH7EYvtz0QzQ==
X-Received: by 2002:a17:907:3d8d:b0:ae0:a465:1c20 with SMTP id a640c23a62f3a-ae3dcc33e3dmr202620766b.14.1751531665205;
        Thu, 03 Jul 2025 01:34:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca2ab0sm1202272966b.164.2025.07.03.01.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:34:24 -0700 (PDT)
Message-ID: <f5fe3fe1-903a-48ca-9249-b77bc07dbc77@redhat.com>
Date: Thu, 3 Jul 2025 10:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
 <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
 <e2159868-f31d-4d35-b6b1-2cbd1a9d249b@suse.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e2159868-f31d-4d35-b6b1-2cbd1a9d249b@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 3-Jul-25 8:47 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.07.25 um 22:43 schrieb Krzysztof Kozlowski:
>> On 30/06/2025 10:40, Hans de Goede wrote:
>>>> No one asks to drop them from the driver. I only want specific front
>>>> compatible which will list and constrain the properties. It is not
>>>> contradictory to your statements, U-boot support, driver support. I
>>>> really do not see ANY argument why this cannot follow standard DT rules.
>>> So what you are saying is that you want something like:
>>>
>>> framebuffer0: framebuffer@1d385000 {
>>>     compatible = "qcom.simple-framebuffer-sm8650-mdss", "simple-framebuffer";
>>> }
>>>
>>> and that the binding for qcom.simple-framebuffer-sm8650-mdss
>>> can then list interconnects ?
>> IMO yes (after adjusting above to coding style), but as mentioned in
>> other response you can just get an ack or opinion from Rob or Conor.
> 
> But does that work with *any* device that requires interconnects? The next such simple-framebuffer device should work out of the box *without* the kernel knowing anything about it. That's one of the key features of the simple-framebuffer.  If we have to maintainer per-device feature sets, it breaks that assumption.

The driver code for this can still be generic and since the driver
will bind to the fallback plain "simple-framebuffer" compatible
this should also work for new platforms.

The e.g. "qcom.simple-framebuffer-sm8650-mdss" compatible would
purely be something in the dt-bindings to document which simplefb
implementations will have interconnects and which ones will not.

The driver does not necessarily need to check these more
precise compatibles, it can still just check for the generic
presence of interconnects.

Regards,

Hans

