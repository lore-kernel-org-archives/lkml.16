Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED20EEC3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708494; cv=none; b=lLxofykqx1ifaX3ZmE4K6uV9YtbKkO5ULq9SVgqu/yykYoSeOGbo48QEL2TOpZZrfo5xS6ZLonXcqaooUHHNiAoZ4/5qhAi2Rm4gjt3GWzsC63S1Jg64MQmlTfmxu0YvJu59TzDk6pTIPvnrXB5UIdUrdlrEAKqHJkbKi4c9xrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708494; c=relaxed/simple;
	bh=0eUTeZWOvy/sEdBDw2DnwA5spT7b3OSAoKHMZ2s8vQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACzEAZQCNNFUq1EMInUbC1C6STKhYnrYfosYwbthXZimYryZ7bMh2rq8yrjZDsvzkFi5K2Tj3R6hEz8te4tzO0vhPh3K5VAh/J82VfLqTVlz1mBaXJR5VAQLzdiZT/wHW3fnqFzFJKuNlYcuJEKjFXy+Pqvb7qpV33uUZ4RnSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b9hH2Pku; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b9hH2Pku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744708491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xBj6wYND6XkoPsEsHNHqa6He4rhHss1QsFv4wuPqUQ=;
	b=b9hH2PkubbKFvEiaoqCSk4hyKnsX1lEvmVzyBmwGB/Xt1EG80je2FgdT1cnfaZlKBLnEK2
	85Vd9I3JnCGctCeZVz8nIWCwjObi523m2OfFUa88wuIuSZLtert/1MfyBkgW2wBmRe9vK6
	CHaB60DjYvFD9ryM414kKd3p2abhZtc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-vjl-qwwAOhiQx6cSGjtJgQ-1; Tue, 15 Apr 2025 05:14:50 -0400
X-MC-Unique: vjl-qwwAOhiQx6cSGjtJgQ-1
X-Mimecast-MFC-AGG-ID: vjl-qwwAOhiQx6cSGjtJgQ_1744708489
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so26800795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708489; x=1745313289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xBj6wYND6XkoPsEsHNHqa6He4rhHss1QsFv4wuPqUQ=;
        b=ASohzuVFMCFzNFj4N0pgX44qs2FiCnPmDQUSaeCtiG9s5uQicN0INdm+yP2IZmLGI+
         yueWDpa6VrqmIoRMelL7CA0cdRr9q2txdUtk1CIYbV6R0zDfkhTZt2M1dVHtFOL2Hzea
         ZbL56l2QeiCBSZSMkElBKyFQ47CyNYGi0lpHuLBOZbduenOIQukfARDJ+gr74cU5WWzH
         19/2f1K9ozUxZw20Q2URrirD7Y2Tc7krtrycQwgxEF3MZNaYUif1ctRD3FIl+2G8Wg0g
         eLgKtf9Eg3b0bGOOecDi36iQmx+3W03PyFiLT4F54vpRCBIESK3CBSfQGePCmjQg4ZK8
         51iA==
X-Gm-Message-State: AOJu0YyMs2WolB4HnC7FA3vMok4Xdc63xJv/+Xdsb9fSoMuOkYiBSTCe
	TkjaYfaK9BpD5itpgua+R8ctZNtFl1bdeKdk2K7ECNQs7pTY6IbezJYE+rxlW683hyuHpgpBdu1
	g9Iddi+fLXrfGYCcMSGREQqh5YXxyi4ySC+wFYuq6w+74pSBrWSuvufi59AumQw==
X-Gm-Gg: ASbGncu1k92bX3T3V9GlvsasYizDw4qlgHacGj/R1lhE/c3lcd8Nee6CBrdtO6vt13Y
	On67/7P73UDwrdxETQefMdKm15052VvqbD4YixpErER0QNYnA5RnfdXMbHwHBVrDhZDqFP0G+61
	rveLuMhrqBnJKU5DKkwRrrY9bIWphBLvGruzUmHL/37wUMoPJPhbkRDfycbDEh++JsedWdcTttI
	Sn947wMwV79Z9NUt2UEJiPR4d7k/2SFcmddK5XNkLtw9CLp3AOXQMuet/mgFRBRe5NcNBQNZ8dR
	ol6HtF5GyIjSnULbfvVcBf1Q/LHK/fr6AG+MXt4=
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr161581245e9.30.1744708488745;
        Tue, 15 Apr 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfovw9rzSF7/UhE9C8ntddanjESFbdGIFJq3+2VnKz80vs7HYJjirXobBVEqXPkTQJgbF6JA==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr161580875e9.30.1744708488359;
        Tue, 15 Apr 2025 02:14:48 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm13673088f8f.56.2025.04.15.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:14:47 -0700 (PDT)
Message-ID: <6851d6b8-109c-4de0-89a8-a56659c87cf4@redhat.com>
Date: Tue, 15 Apr 2025 11:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1] net: stmmac: starfive: Add serdes PHY init/deinit
 function
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250410070453.61178-1-minda.chen@starfivetech.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250410070453.61178-1-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 9:04 AM, Minda Chen wrote:
> To support SGMII interface, add internal serdes PHY powerup/
> powerdown function.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 2013d7477eb7..f5923f847100 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -9,6 +9,8 @@
>  
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
>  #include <linux/property.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> @@ -28,6 +30,7 @@ struct starfive_dwmac_data {
>  struct starfive_dwmac {
>  	struct device *dev;
>  	const struct starfive_dwmac_data *data;
> +	struct phy *serdes_phy;
>  };
>  
>  static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -80,6 +83,26 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return 0;
>  }
>  
> +static int starfive_dwmac_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct starfive_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = phy_init(dwmac->serdes_phy);
> +	if (ret)
> +		return ret;

This is called also in case of PM suspend/resume. Do you need to keep
the init here, or should that moved at probe time only? Similar question
for phy_exit() below.

Thanks!

Paolo

