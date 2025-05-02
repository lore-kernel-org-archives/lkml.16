Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64CA13AA2E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175570; cv=none; b=GfBbsN0RoAqALahTIttWIenPbyNDNdyKOJKlE3rROHDmlTHqJyafMMvtAbdYeQa+3zkcBTrb1R29q1Am62V0XqU+Faqg2elL3aA0h9ctVeNlPHrkuWxmHnEngExviVZboVv0nJTImp0wH0Zm3ESlcyJaa/TVRUu5e7Hf+xI/iLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175570; c=relaxed/simple;
	bh=K4n6OSMgmZzGwORvCnmeTSGEVj5+u7yaqDjtdKdNNnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qF+9yt5XSbz7tbgEKON9OCZGcyMfkuGL4Oxl+joaXg0/9c4RdWiVsLry4S7AXU68pBvNruYqaCAypCjjNKfvNPFMnhv0W05/BDgaV6ZcTOmOMAYqIpqkxqLJO+pX3nB9vUVWcHlCdWZzotM1ePKrc5Pldr7BHzbUV9qLNVmlBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGM3UH/B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGM3UH/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746175567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0S/o6xgo9t+7UAMzIJWxBv0bL1jmctzRzHr37NpFa0=;
	b=SGM3UH/BmyH0KflCJex0PM702zT9kZ2bNcZdyLWazEXMUngHK3OCtJmwfnAGQ6DfUyM58n
	Nl+M5ujU4ov1SR51pl02ZDHXCcUUb5GO/hVF4Yv8h9yaYkh8e9F72v2dpzYQjkjW/2RTDD
	GSNzUYyjl9H3gmwq9ya07PWcUE9MFcM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Wooy1sHBPVGX45s_r475qA-1; Fri, 02 May 2025 04:46:06 -0400
X-MC-Unique: Wooy1sHBPVGX45s_r475qA-1
X-Mimecast-MFC-AGG-ID: Wooy1sHBPVGX45s_r475qA_1746175565
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso881489f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175565; x=1746780365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0S/o6xgo9t+7UAMzIJWxBv0bL1jmctzRzHr37NpFa0=;
        b=X6GsoGBLUw1n9kVm+AL4/fRkRzjJZSKGad8xfGcBtspefv4IAM+gcBYE5KUrPPEj3C
         GdBNqZpED78fwO+xSkO1b71z593M60EIF9yCoBjzraOwLkaBAEfsrU5Pzv8NeVN7+dhJ
         s0VSilwsSPqOjHI1wkXoG1Dk4GkgBe5pdzoH1rmb3vU+nZM1Hf/MctK4M8kP5pWPGk2K
         I3qPcWv7t+ikycJKup7/XSU0bEUs4a4QJ86y4YRpiCwYVcuU+hBOz2g8zLOKpO6iVgQM
         gPUK/YbNbLTLF66epJQvEh1x2wyE7jpRXSKmLnbWZcW0H2vmMkC0UYJwV6TSQJ4nPc4E
         5rlg==
X-Forwarded-Encrypted: i=1; AJvYcCUsROuFKf4okgHG5wiY6Y+YEzLo2GF/nTSqCcX4G5yA6f/GuA2/ahrhyQorKEFfKlEuo2bvOd8OH55O00g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5vb69/pgR2O42H5YfaDx8IqtiBnrRGg8QX5llQuksdjiCB7n
	9k7GqxfXB541H4jQVE4VwD5omSBhNKnxwdI6Z7pLSbanafzytrPDw+RU9zCd8UsPCgcXDrr2NyB
	p3ncaH4Hv+nzuyvg3dNuoZJDYCApF45Xuu0x3sVRqSnKoed6Ke1fchOVC24K/hA==
X-Gm-Gg: ASbGncsckp6GLSSaqP6/cmLEbFpM/UBPMmM7DfLYv7d6CZ4aI9wyNRIHkYVXL7OTFzv
	CUyBqw+1efL6avzuDVjMcLE67TQuaFWiAPlQioeLP+SN2HBngW9QsjjhMtGoD0+zhEeqr2hObyK
	TcrwzwFsm/CUjvRoiGQxdjblBbd1qD0zirYhwGsauEZrSYsgBuF7Mo+b7igS0fS8SYL+a71ZOj2
	km2Qc1YzSYR49C3Oli1f9BfcoDbviGnVP4mH5y9KJCyZe9eYWvlf25oq26c7h3JTPRDbUmPM9b0
	8kj1Q47N7/h7dkjPS4g=
X-Received: by 2002:a05:6000:4008:b0:38f:2766:759f with SMTP id ffacd0b85a97d-3a099ae9d04mr1137195f8f.41.1746175565361;
        Fri, 02 May 2025 01:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTEziSGfOUv+JnuXr70r6TvcxY29K/JkxO4QYwaYI++/LoyBYIanXjyXfHCszu7xVy4fBf6Q==
X-Received: by 2002:a05:6000:4008:b0:38f:2766:759f with SMTP id ffacd0b85a97d-3a099ae9d04mr1137168f8f.41.1746175564990;
        Fri, 02 May 2025 01:46:04 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b62sm1534788f8f.34.2025.05.02.01.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 01:46:04 -0700 (PDT)
Message-ID: <f82fe7ac-fc12-4d50-98d4-4149db2bffa0@redhat.com>
Date: Fri, 2 May 2025 10:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/1] Documentation: networking: expand and
 clarify EEE_GET/EEE_SET documentation
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-doc@vger.kernel.org
References: <20250427134035.2458430-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250427134035.2458430-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 3:40 PM, Oleksij Rempel wrote:
> Improve the documentation for ETHTOOL_MSG_EEE_GET and ETHTOOL_MSG_EEE_SET
> to provide accurate descriptions of all netlink attributes involved.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

This looks like an almost complete rewrite WRT v1, a changelog would
have helped reviewing. I'm unsure if it captures all the feedback from
Russell,

/P


