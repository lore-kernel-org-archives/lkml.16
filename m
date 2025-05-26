Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF822425D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291218; cv=none; b=Di+0oRJ3dDm+mmiX7vekxnSUY7Rlo3R5bSHKM8Rt5O2NplmyNDhjxZNGpLclLMUaHNxyfSJX5oYQqwyE6ppwrrhdc6hETr6kvI0TPAbLr3CLf+nar9g2WV3N8UxY4KALUMGmCQ0O5RgYvWE2UsOSjBE1ObZ+o2U9o93lfXBzlsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291218; c=relaxed/simple;
	bh=/pF8uflug4iJXw8P2bPeBVRDCzFidAhfVujarTx3tBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJi8+SCvKo0uMICOkNNNP9tJcaKoOIVXNa3cacT4SWd35DoeL39ix7cvl+wlRGuI4utPyB3EVbZVxqtoZxL26dah08YcjYSNvN5KUPOKbELWSvnOE/qhpwLjHYQOVXM8sfU6b37OuUpqj8hrDSCy6JI2AVSUEen+ifkx/C0tndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Achy2bFd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Achy2bFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748291214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
	b=Achy2bFdw1F7eU14BhUsWCetWHQKM+VH0c+pzYI8f7YNO47F2Zbp9/RjZKRXRHs1XlG1jS
	7uDeGH9sRjy9pnTTf9PUrRtK1iH0kN3Am61gonfgL/D8Vk4skjJZOXmjxVyDsLdsXpJnps
	JEfyGTUr/F5fdUAkfWKJG1bip0QkQPc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-akJo8BoKNyefqfA5oKNFLw-1; Mon, 26 May 2025 16:26:52 -0400
X-MC-Unique: akJo8BoKNyefqfA5oKNFLw-1
X-Mimecast-MFC-AGG-ID: akJo8BoKNyefqfA5oKNFLw_1748291211
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so15030055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748291211; x=1748896011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
        b=fyfGztz46TdpQPFKUcogTXaIfSLhACnzjDGwhrVFbzlJmlBgi/ZALVCaFw7DA8FRtm
         /6zrqv1+cuo6Rz8cE4Ror59CKz+SWWFCFpquoSq/SyYSBE1mn1ll+HaG0GIJJywG3GVa
         dcfBgu2bnd1T7Y4j6GYp2C/Jq5JrJ49y6eFFt+DLcriAAGBP7BnOeeH5bE+koemfjrrK
         nGHFr8uSb2FErop2487YZTfmkLrC3N/ilrWp14vuVKtNl5vB+tlbt97HRIcC6YSlNYqs
         /xgf6BI3i0eFjApBlwUfcuLwkvDC19C/CVKU6XvSJFjtVyNEfiV5BcfIqK/fHfJurlsv
         mGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWtUtyk7z+gjXtNy9buK872VbqGQS3mg0EXvLjdIM8Blgeh8USlbCqqwEo4rn2yE1YLUnCr4JHYBOAGUnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSJVqCeaztdcCleZtc+V6nbnxHg8T9ZwVNeq9qWp3xG8Qi1cN
	XTeok4JkOIjuxFPEm9eKGx2QsuxmSCaRo5wzMWlpqBhWdNebvEIJm3uUmg4q/YJAsIrkbPoh7RO
	YQ9SDyT5Ai3M5ciezabj6EqE0lFyi+ZaslGNVxAfnOc3krlP7s0FyHQ/S6S3lWM0AlA==
X-Gm-Gg: ASbGnctewamIW5NL78KCx0PQFae66OFPdBLre3pPwEhFZBQwrlmYOc/7L2xGfdbVFFH
	Kh2HjUejfpyp65L9c4X+Z2pHBEGurmrmhZSCPN+RVrvmzM+ad/GifPMszjc2yRkOhPJR49eT1+W
	mrY+p2agqtM7QZveysVtAfrT4RM5Q37P5pDyG/JehkkzQOIcnqpIB8foB54qk+WesW8G8BwDsLN
	6LRltb0S5669RCG9Ab6pjwB2gP9dhpPcRssQrj+415bKtP226uFJ0eX/XPOLi2xSCmSPhLN/6A6
	k63/ucnBo2TR9w1XmO6QXt6Cb3V+p/w3qodTllxn
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-44c93016686mr92837635e9.6.1748291211244;
        Mon, 26 May 2025 13:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSrD54L0gvE46Mtr1bEDCW7JZuh1RueZXOjVf2VgxDZDxuwPNbxQGifhSFMWHJcVtKTkfH2g==
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-44c93016686mr92837385e9.6.1748291210810;
        Mon, 26 May 2025 13:26:50 -0700 (PDT)
Received: from [192.168.0.115] (146-241-32-247.dyn.eolo.it. [146.241.32.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cfcece9dsm7354854f8f.5.2025.05.26.13.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:26:50 -0700 (PDT)
Message-ID: <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
Date: Mon, 26 May 2025 22:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: platform: guarantee uniqueness of bus_id
To: Quentin Schulz <foss+kernel@0leil.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 5:21 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> This is an issue because the bus_id is used to generate the mdio bus id
> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> stmmac_mdio_register) and this needs to be unique.
> 
> This allows to avoid needing to define ethernet aliases for devices with
> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
> stmmac devices to probe properly.
> 
> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
> alias is set for the device but that is easily fixed by simply adding an
> alias if this is desired.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

I think no need to CC stable here, but you need to provide a suitable
fixes tag, thanks!

Paolo

