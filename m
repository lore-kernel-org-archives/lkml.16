Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB9293C72
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158094; cv=none; b=Z1jYGbNR8MM1x8sY6g4DilJeHoQ/WivIs2gk2ecvJl8FxiL9JjG7Zj8GsZeyLjLOR2NR/wFP2/1883tnAeMt0W+YxBnIYuCKpyrVCKfbAxP5W1kMPSjQoYO15gszAWGJtfbXARFXGBaLyj+EDBrRqw0NGSWztu3vLMSLNRPisGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158094; c=relaxed/simple;
	bh=IBYQZSudqTgn34Kapoq78rT+fFWNWZ9+bS43x3EWBcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XUDPyfbfBNUB7VtgvEIda6ssESeYkGf2+C6oTCTyO52ZeeYsbs4G8ZZ8nka6zEmBVztW7HlsWr/N0WlC8VfQ1+//14JHXptIakwU2dnuLjCR+eiA+HpHsEm9fsllp2hd6TIfLZU/xreAlAoh5Und/Yq7fnG4U3UiHwTnrA8xHrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Qa0Mmh0S; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Qa0Mmh0S"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235a3dd4f0dso35398425ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750158089; x=1750762889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DHyU2R8WPjOq8eE9G+orQPQ64Wuq4IqqrSMYFwTCBc=;
        b=Qa0Mmh0SUDjvxQros6xspDcRisYS82W0rofYbdCTcSlLbgn0LyzGGoCz9sYazZGFKF
         T5w9mLsYXIE0y887zNgX+V6aiBSXYnwclbM/naIuDkv9Y0romKwnXW29WgtzIXiHUDeA
         HOIcqEv3L/RKmVEJsve+GNZTSlmBGljrJ6AWE79GU31U4zsiqf89HmfLrrV9z9G/bDdY
         5dkYhg+k28MP6xLcXwDbME8hlEsoAwKSSm6wOaaKWmr8luoQo/c+VLlLJ2FY1FqSOcVu
         IvvNYEhokAWi/iDO8Gdgn2q5Y7jTkt6lZ6DrohoRW+SIq/7IEWEOOU5CquhnR+8Op2KC
         Wy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158089; x=1750762889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DHyU2R8WPjOq8eE9G+orQPQ64Wuq4IqqrSMYFwTCBc=;
        b=bO//yXqilHYtTFWkHxUfMQ29dMelGCwd0HMFtVzMItMtRx0mF6z++IHne9Z78bLZg6
         2hR5ielUIqSX+ukoacpOy0WvJ5YY4nbYaigdTs4Z7REqkY0jWAUtC3t0fjXogvAGcvzW
         TrQqlOlOxFGyEO2AYYE6ButQkn8CGQcr+ASozTw2s6LlVz9cBl5bbjHI/khLt0Y6MGfm
         RBaH7dq3zsMgYfyvHwIF1fiAb+AJPoMFDDW1VqNaBoZLOCmsClUC7IKGuo51CaQ7V/5F
         IC9j1QBYggWJu4zECZe06+3y50fkfh/YA2PL1cftKImCFApledColaeMzCn7wRtBRqmu
         YEHA==
X-Forwarded-Encrypted: i=1; AJvYcCWAoo44JP7cRp02YzE0qg8fLxvC+B0I3NytV7NpUp9I8sVNgR1XetLi0VFoLPfEqgEzEcCYbtNebfjikCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2orIzHVxGdhTl32GuGs0akLERH0oqcb0Nkm39ln9uJH2ALKD
	PfaIN8Ijs2fkdw5gEMwddTqV+9loet5ADEgsZKB4qUyoq9C5J93FtGHjqcyDQxW7+gY=
X-Gm-Gg: ASbGnct/kyqhfsUXv5dgrDcnjZfhbjJU/FyGTZWPT1Y7DS1YDDy+CQEPd2iMsVr4/fS
	ux9GYuYXy2pAQpUVgUrVripEpM70N/N+khfca4V7KnGxFucgtSCrNWb6nyvZceaYZKc5bGdZPaz
	d56ZjscwuOAr4eqR3XrJJqZ7KWbKAtPBTmYFS7DirVK3vamML21FjumqhHHhKuGaFvFbIMYftdY
	TYGLEQAhw5OMvmZvv0F9QCPMmRXMabMu9X/FHQB8ieVyrZMOjuAvNemt0NrdFsNFsrHclIOwS0h
	8B3YeVzN15PsEvlmcSEuS001tg/B2E3kigWg+eMUBVF/sPKHhmsiZwVcDqP6FpCq1F3aDQS1jVa
	lKDQBqRE=
X-Google-Smtp-Source: AGHT+IFhiIFZVVRkKW6KlPv5Ms3limyDQ3qCAx3P+UVC13Dsqu72f+r1sPGNNNtDItxGQ9ngdyMNEQ==
X-Received: by 2002:a17:903:1a83:b0:234:9656:7db9 with SMTP id d9443c01a7336-2366b122186mr205102705ad.32.1750158088915;
        Tue, 17 Jun 2025 04:01:28 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88f423sm77142515ad.12.2025.06.17.04.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:01:28 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
X-Google-Original-From: Brian Chiang <Chiang.Brian@inventec.com>
To: linux@roeck-us.net
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chiang.brian@inventec.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 17 Jun 2025 18:51:41 +0800
Message-Id: <20250617105141.4081335-1-Chiang.Brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
References: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, 16 Jun 2025 09:15:43 -0700 Guenter Roeck wrote:
> 
> On 6/10/25 03:25, Chiang Brian wrote:
> ...
> > @@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
> >   		info->identify = tps53681_identify;
> >   		info->read_word_data = tps53681_read_word_data;
> >   		break;
> > +	case tps53685:
> > +	    info->pages = TPS53679_PAGE_NUM;
> > +	    info->identify = tps53685_identify;
> > +		break;
> 
> 0-day rightfully complains about the bad alignment above.
> 
> If you want this patch to be applied for the next kernel release,
> I would suggest to copy the hardware monitoring list on the first patch
> of the series. Without it, I get
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #296: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> Since I am not copied on the first patch of the series, that patch has to be applied
> through a different maintainer tree, and I have to wait until that is the case.
> Not that I understand the logic behind it, but I mentioned that before, so I assume
> this is on purpose.

Thank you for the feedback. I'll address both issues in v10:

1. Fix the indentation alignment in the switch case
2. CC linux-hwmon@vger.kernel.org on all patches in the series

I apologize for the oversight, this wasn't intentional, but rather due to 
my automated CC generation only considering per-patch maintainers.

For v10, I'll ensure all the devicetree and hwmon maintainer lists are 
included on all patches so you can see the complete series.

Best Regards,
Brian Chiang
