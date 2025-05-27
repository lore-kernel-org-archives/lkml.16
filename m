Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DAC26A0A2;
	Tue, 27 May 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351529; cv=none; b=ixCiHRcq9NmyKkxXKg02McOYEryi0XzRgvLClRNXSNxXXs7t2nlMFrcWSyUl26vo3yYnrBhbpqoRNnxJg0s9rr/6wmCuqlWKq9x8vntlPFzU1D47GHQLFMN0npyFois2z+PEak9mcxbVU5n8ZoW1kZgrhJbM27VcpPT5yF4iWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351529; c=relaxed/simple;
	bh=LYoSmLpVw0aOUJfTJhGfo1hR+Tvd3mIzYxJE3L+sk9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s4K8xRLi6SdhX0k56MVSyZpq3OqYj54xJJS07aFxayLkJups0wJ63uRK/awzEXdavrVKVmW5zPFZHhaNjkOupq81JPki5kqcjmWDXnyEkrDNNudQ14XZAsDkH4XvW8qLxa1sOx9pC1w0+R1Emb5+EftpaQPCXLA8dZ91VuEkWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fux6CNzT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fux6CNzT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb39c45b4eso517602066b.1;
        Tue, 27 May 2025 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748351525; x=1748956325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/ugmzgvO142CU4ox6G+tmUexbV2T5LSjf/umBdH9s8=;
        b=fux6CNzTQfH9qA3aOpoNogbcJ+A33QEQO4fPrL03iaYx/7eQzUJZ6eHitpWZnzJTT3
         Hzwlbz3I2LDav9rC6rsezbPeg9O2mHxXF7KFiPrJ4kH30K5Z4xcD2wK8XmBDBwwiortp
         9SY8nMVbxRamADvJKz0nf8Fnmm/tkUGxvBbzhKwCJ1a7kPtokQIApGgTohzYveB1ethq
         XRhScWJa8wuGHNgAG/7FE+n0TROykO1W6QDZXZs4gqWV3nN0xSnUuZBP/6E8UgdDLO7p
         KOyx98cl49l2Qq3mYmIE3C96FFCPYbjOITBbFNGyYcQzZGUM+nkfyfX42GRFuhyphzM3
         M3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351525; x=1748956325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/ugmzgvO142CU4ox6G+tmUexbV2T5LSjf/umBdH9s8=;
        b=BhabmanYhdfNpphZhAL10KHsA6tK6ssgRiSF5WMiXeH6s1pmOMHHuBRxr+htE/4CCK
         bqmffzWgynC59Dm0xikNDHkUkyerKCwSIMN9bD/O6ce/tBgZeX6KGMjcOccY4b5NyWq5
         NIBmO5ulWJWgpzDoFzcgusjG/233ab7/8fMRNVhjJc7YrtHljZvk4zW9rNTi7UGClsl9
         EVGS/+lIKXQBrZhUw9xTtuyWw26ZgisViT+osGP9OCk5Yq/jiY7sgTwIunfcU0Y6tBBi
         Orl4mKAHLJa4wUBR0otuBaHSCtun6QBOb2MWXlJ0Rwazqp8DMkZGzFZTJXi0Uyjk7sVU
         cnjA==
X-Forwarded-Encrypted: i=1; AJvYcCV2BBhk2+YH22rU9q6WgpUw5Tsr4QViAzJOT0Hp9C/gNS54vXIPVzoTh4PUclgHSfuxtMhZR2VOau+x0sOl@vger.kernel.org, AJvYcCXGSTLq9k1/FW6Pv88ach5/+B7arM3+dKncudVFKpV0nL+phYYJMhKlEsIxpxOFfJBo4mHmUV+UKMBA@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHg84RveF+Bq82+T4eLO/PIit1RiEVu/VeQdWlUTpo8pAEYWW
	w4aWxtj20xpvhuGmw4VgtYLI/q0gGfkl4uxx2TE4lMOl89KQrmT1WfN5
X-Gm-Gg: ASbGncsRHaryWcrkPopwxNFghfYGESjfNLbtpSMhIsfWxbBMn4x8bYd+RVk+X2G7vJW
	UIvhJ/AwIpr+zu4mxvzuHVH+yXeaWbKMJ6/0xZm+2C6sdmq3dzh7jnnX/LPwmAsQBYJ9tBxjH3i
	JscjQev2eA3RNbYJsJKYeZUadPYjwBGT1Nvrs9CU+qrbjmCDXhfIP1Xd5D1SNpTDH8MYmOVa5w2
	ErnJgpSJibVJiQnlec7h/J7ZI6sHhQ+usa3FGGFaS+yk0hy+pWWtt9m2a9occ3WuU0GZcaBihTw
	OQUq8fpxb3gf37YsuRXH+Z/pFKwKV+7YaKWQbKY7Lw5BI+Jss/d7gsQ+WKlmbojspwpnfHHI3s1
	8fa7GG5pGCjrISWZejXu+K8W5F0OwJw==
X-Google-Smtp-Source: AGHT+IHB0ZXKkcg0gnpJjaiU1yTkVnD2JMx0qD+x4LssRGrwt4U5bwIxE9XFTakPQqpfUeS1dTan3w==
X-Received: by 2002:a17:907:808:b0:ad2:46b2:78b2 with SMTP id a640c23a62f3a-ad85b0e0479mr1012816566b.18.1748351524889;
        Tue, 27 May 2025 06:12:04 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5d2c6dbbbsm793002366b.117.2025.05.27.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:12:04 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: foss+kernel@0leil.net
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jakob.unterwurzacher@cherry.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar
Date: Tue, 27 May 2025 15:11:42 +0200
Message-Id: <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> should do the trick to disable the circuitry according to the TRM?

I measured TXCLK vs TXD3 on an oscilloscope on gmac1:

	Setting	Decimal	Actual TXCLK delay (ps)
	00	0	47
	0a	10	283
	10	16	440
	20	32	893
	30	48	1385
	40	64	1913
	50	80	2514
	60	96	3077
	70	112	3565
	7f	127	4009

	off	x	-315

Setting = tx_delay (hex)
Decimal = tx_delay (dec)
Actual TXCLK delay (ps) = Measurement from oscilloscope

Plotting this we can deduce that one tx_delay unit is about 31ps.

We can also see that turning off the delay unit does not give us zero
delay, but setting tx_delay to zero does (almost).

I did this on the Rockchip 6.1 kernel because it allows to set the
delays on runtime via sysfs
( https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf )
but I don't expect it to make a difference.

Regards,
Jakob
