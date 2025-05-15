Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4192298275
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309909; cv=none; b=qTX95HEBtPmxirXGG1FGUe61rkQRl8wYokmmweS29ZUIX+EXyb48MW6AU2Ho2sDpRCgXfncTbwIB/OtMbp/kp82hwhB5xNBnGUctrpC05emLYsB137dKXBCsMhp3EKi5UjmoGfQIC9U7J9HwT/vDx6X9tPPuRiAZLV36uId/Xxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309909; c=relaxed/simple;
	bh=dAGgG8yyiAOY8HZUMAE4/N5xgfwh4+9Wjt3QcwMtdTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5ttqrB7XkOKIuPBuy7h4YBhB0IasaweDKVWwhfcQQiJAGR2voAhQuQBIYcSS7PBCVYf5/UFjKqkOLyZhtyR8hYt10eDHqQesHeoJe00G/HKytUu1a30PJZBaAz+WwUB4f+T59LFxRDBX1m6d/GyqMXRJSAaL3cys+e0b38s5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CDFkX5D9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDFkX5D9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747309906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mvKOz//up2sPARV6VPRBQteHxfVgFtg2q1br9Ju/3o=;
	b=CDFkX5D9Umi0pLFBE9/I6PVaePmmbVmsBdvgb0z4v/ra5WaQCG2FSYdix57yzLstVGWfFy
	xs+8lYetChHh4l5a1k2enqo48WqVAeW0vM5xiU2nybO1r5We+jhp+JB/ChHTEQ6MFBTWdM
	xVYH1jrmuWgH87hKzPZ4nA3RVUDFqOY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-JJitsx7nOYGzAuriG4tS6g-1; Thu, 15 May 2025 07:51:44 -0400
X-MC-Unique: JJitsx7nOYGzAuriG4tS6g-1
X-Mimecast-MFC-AGG-ID: JJitsx7nOYGzAuriG4tS6g_1747309903
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b2e56da1so375751f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747309903; x=1747914703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mvKOz//up2sPARV6VPRBQteHxfVgFtg2q1br9Ju/3o=;
        b=QQbPdaeZgKjyfPbjBu+VeswD40KhbPTdgLCAnLSDEVu4Nv9HspL5MVF4x5FIkd8JtH
         6crZJ7/ymiUTzeISDD3AHZBw5bpnZG4g8yZJyApuKUa0zp2EBLVYp9l29919OPmBzMJ8
         0gxPPmj2NUyzzMksvJHSi8nipb7BgQNFi/PGmVIvfGAcj/LvJwSyXRSizYJfGJtjARyh
         ZTYzy3r+AO3wyPIz9j/Y+gFNMsXr1yeyit28Ols9z+wRRu2xVvyVOAH7bjFYhED+PCGJ
         Sqi6k/tEc9xibGiyZxilEhnfdnmGHQGWApyhUGs5y3N/OlWGuGL5qqZq1+eZFPhfWT2W
         0uow==
X-Forwarded-Encrypted: i=1; AJvYcCUOOuL722OYm9ZOongQzMbE2dKH7cHrHIV52KiHfSsPiUa2orN/nt8s333DAoTzVkXTIWYRDscmLo5EP4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoTyQExYV5OhVPeL8f1pRd6GY56n5XLr7/MhH/M1abou+JMxE
	bTGE5BnVegg3ptYPTrazjUvBENjj63xsitmC2Q6uH+rPNdMuCvR2coG72cg340GCbDIuTkqQOdn
	X3R4t+MAmEk9gzlUz84gKU5ncWf12rhS3MxeBkjD1KekSKVTC+jVSYvAR1cRp/w==
X-Gm-Gg: ASbGncvuphotz6vTNOrivpahTNB3bT8geTCwIGJUtP3Dkv4zmrR8c5MEYDnpSrhUAGd
	yUW10XSZhwFZ+qMRSvq0lw1fhnV09crEHlBBDKVUY206EG5r3oZX4FOf2R24NqM8pzloGCzIk4C
	bsnj9KphEUTvrlzixlHf5BHoRZxOmnKRdFso6BXO3XWAUtvGxm1fa5BPUSVWFPX9ObRhZh3I2f7
	Sh5YU0JwcM/N4yXKi1M1Tnv6u54xJNKRJdK74kzWGYaZk6MZFshqflyIryU8Fk2DU905u67uzl/
	vmF5qrUiFcA8azCNBrS8RX0DBQoAYqejUALLcG3d8gZVZfdz7fqPERzqbTA=
X-Received: by 2002:a5d:64c8:0:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a3537480demr2229883f8f.25.1747309903392;
        Thu, 15 May 2025 04:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeJPO3okWHQzPk/Kq//Y4tisgvsrwh048orz2HvG3kmOZOLmvph3DCI1mcOIyLN7SeobjP7g==
X-Received: by 2002:a5d:64c8:0:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a3537480demr2229854f8f.25.1747309903019;
        Thu, 15 May 2025 04:51:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2440:8010:8dec:ae04:7daa:497f? ([2a0d:3344:2440:8010:8dec:ae04:7daa:497f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd2dsm22484374f8f.9.2025.05.15.04.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:51:42 -0700 (PDT)
Message-ID: <c6eed9e0-8f44-4ffb-b316-d65e0b5a192a@redhat.com>
Date: Thu, 15 May 2025 13:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: Add support for providing the PTP
 hardware source in tsinfo
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Xing <kernelxing@tencent.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250513-feature_ptp_source-v3-1-84888cc50b32@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250513-feature_ptp_source-v3-1-84888cc50b32@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/25 1:40 PM, Kory Maincent wrote:
> diff --git a/Documentation/netlink/specs/ethtool.yaml b/Documentation/netlink/specs/ethtool.yaml
> index c650cd3dcb80bc93c5039dc8ba2c5c18793ff987..881e483f32e18f77c009f278bd2d2029c30af352 100644
> --- a/Documentation/netlink/specs/ethtool.yaml
> +++ b/Documentation/netlink/specs/ethtool.yaml
> @@ -98,6 +98,23 @@ definitions:
>      name: tcp-data-split
>      type: enum
>      entries: [ unknown, disabled, enabled ]
> +  -
> +    name: hwtstamp-source
> +    enum-name: hwtstamp-source
> +    name-prefix: hwtstamp-source-
> +    type: enum
> +    entries:

This causes a kdoc warning in the generated hdr, lacking the short
description for the enum:

include/uapi/linux/ethtool_netlink_generated.h:42: warning: missing
initial short description on line:
 * enum hwtstamp_source

Please add a:
    doc: <>

section.

Thanks,

Paolo

