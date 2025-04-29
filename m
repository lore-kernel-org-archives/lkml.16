Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0642BE0EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919042; cv=none; b=T32MYoxhkVTdt+tefTe7y6tQN/akDqEjaDtewMzHYKamLp44sOv4hG7VLbUQ0VcAeMz3q6xd2i7IJ0carf9/6XxBXZDhTsRnws+/agI+VkEmNHX3OOdFBy5fMh3ZXqWidFmQv7rstbgUltBRya5rX18wQdx3FUAe7o/3HSYSM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919042; c=relaxed/simple;
	bh=hXonJzExV6f/cYOmpVW4RG/5EKao+OkAqFLmiQh/hcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZZQO4/EaASibd2bYCmZloBIZI8Si6Th8lRbpnsfJOdlL+uK+NlpK6xMHYpqXp9bHlit4zSG+HR4+LkkesDuZ4YUALaGZLZYI9dErFm08ilal4mA/nPH+9IjVvIkz/l2M/JLZc3RAhWp22a5u/Y97kQFWrt3v2eiDCNggisCzk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzLecNAs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzLecNAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745919038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKFEHdgHcLwRfGZHvxEjeWO9rZ2vSungJ+/BDNwcd7k=;
	b=hzLecNAsInqcDTm4hEwQkwkh2u4bak60DKiQNVjmHwaoiFBURZM4qDrInNKmzqzQ0l6xeW
	6BgxRdjcK3w/YXkWJyvrE1N8AO0aMjIzAVLxEaGnqPs3gniA2ob0shuFD6eru12oKzZ10S
	pBCmpvW8ITCSDq+SARo+qDNXUelYhxs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-YIwONv6sMfOyPAo2Ar94zQ-1; Tue, 29 Apr 2025 05:30:36 -0400
X-MC-Unique: YIwONv6sMfOyPAo2Ar94zQ-1
X-Mimecast-MFC-AGG-ID: YIwONv6sMfOyPAo2Ar94zQ_1745919036
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so1397158a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919036; x=1746523836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKFEHdgHcLwRfGZHvxEjeWO9rZ2vSungJ+/BDNwcd7k=;
        b=R73vGagNb6JeToRp0x9j2ax3NTXB6NTPL3M7Oi88cczo1i6bRrKtvCZTS59sGSxGws
         hcr2NXLjh9d+yn+XQwP3p97K6bLcpIsr41cPpotqb4YaFZ1aVbc5syDhXegmUwt+u9Nk
         EgGyYf7GnXvwwPlT7isaiXrwrvM6k1cCpS4+ylBJJUFp6XgteCju0LE3ngyMQh/NN6h/
         Z9353ByOIZjf+U2uafTjCqkEUiPvli605ZKibe1UbiyQcAPYIZchq+X/B2FYyG3onBwB
         wWc+QSnFkOe1HISWzgAahv80McsUSpzbdfWyBujFvzkgEZFmQh6CGpOTOqw22rWGKWff
         cbTA==
X-Forwarded-Encrypted: i=1; AJvYcCXybSVHd8uP56NcrNmuRoW2661lx3yygquTgjswB+UKIpgj+KJvTqTGgHQDEP1blXYfGtvZthxMSMJxEfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZs/se/jyieOlKyBM0R0gqD0Z76fHwBYHUxW/lrzrPzDbhAPZs
	W3zjRe6Y2oAl48f2IDjwOAxP0C32+PTPoJQrngeTZElDmJeH1/XcydiBxisqzwq3o7RkgNRFEay
	RqImSx/mROjrVSqJZHdvWrXdOKgqLu8IDu9UMGbX5RYs+IyMww8SwuvzKimNl2w==
X-Gm-Gg: ASbGncv4SPWnXnXOilcJcFeygUdCl66L2ZIK4qgcogpcxKVFtU56QpzlZTC2N8C3fQ4
	Oe4XebWTMxc5NZxtZyxP2x0kk4SkwVa6wIBv4bnRqpL2c05GztCfmAOweF3SqYC0LxV7JYqANyX
	HMd2+Pqjk+zBt6yyxeqzidXzpGHWsjr+xW2Pe/Z+ZJMIzkr7seW3VMR87riM6x4M4gAK6xqqvCB
	7raCBf7Uskm4G0LNb5jQTdbfHD1k5HaR6m/HLzyYTHRGkow+SLr8/IAbr23y0W1+wjb+oJOChJC
	bAhmRK9yzSx1B3KqkUUTVvwWdHSkcjpRwHfULsn5q8u4sX4sKrDSvcVfuu8=
X-Received: by 2002:a05:6402:1e94:b0:5f4:c7b5:fd16 with SMTP id 4fb4d7f45d1cf-5f839224a59mr1942335a12.6.1745919035695;
        Tue, 29 Apr 2025 02:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS2Aal7Wz+dVWPGKPbDkIqlChFVLqNPD6xjJGGYetpQ28hV8efTZJRlGmop13TtQQ6QsChxw==
X-Received: by 2002:a05:6402:1e94:b0:5f4:c7b5:fd16 with SMTP id 4fb4d7f45d1cf-5f839224a59mr1942313a12.6.1745919035327;
        Tue, 29 Apr 2025 02:30:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5db6sm7332402a12.44.2025.04.29.02.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:30:34 -0700 (PDT)
Message-ID: <60643797-2466-4200-9abe-9956bfdeaa73@redhat.com>
Date: Tue, 29 Apr 2025 11:30:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 07/13] net: pse-pd: Add support for budget
 evaluation strategies
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-feature_poe_port_prio-v9-0-417fc007572d@bootlin.com>
 <20250422-feature_poe_port_prio-v9-7-417fc007572d@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422-feature_poe_port_prio-v9-7-417fc007572d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:56 PM, Kory Maincent wrote:
> @@ -223,6 +237,17 @@ struct pse_pi_pairset {
>   * @rdev: regulator represented by the PSE PI
>   * @admin_state_enabled: PI enabled state
>   * @pw_d: Power domain of the PSE PI
> + * @prio: Priority of the PSE PI. Used in static budget evaluation strategy
> + * @isr_pd_detected: PSE PI detection status managed by the interruption
> + *		     handler. This variable is relevant when the power enabled
> + *		     management is managed in software like the static
> + *		     budget evaluation strategy.
> + * @pw_allocated_mW: Power allocated to a PSE PI to manage power budget in
> + *		     static budget evaluation strategy.
> + * @_isr_counter_mismatch: Internal flag used in PSE core in case of a
> + *			   counter mismatch between regulator and PSE API.
> + *			   This is caused by a disable call in the interrupt
> + *			   context handler.

The name itself of this field is somewhat concerning, and I don't see it
set to any nonzero value here or in later patches.

Possibly it should be removed entirely???

/P

