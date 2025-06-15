Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA625D21B;
	Sun, 15 Jun 2025 23:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750028921; cv=none; b=hp/GJyx2HpXUwka39uomGUdGA2UGDQZuBOzfuVxSYYn6b4umjE+fvwiW47sgvGy70SrloPcLfM7mdXpHzNHrEyO7+MH1NZFjMPRUMN6rvp95lbHJcBn/c60K0/ReFFSm6/DluzVo91Nv6Uu2MoCOVpACIDBz8yZM4g0wPMUI8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750028921; c=relaxed/simple;
	bh=Jgo+ddaHnkDR4zhjpR0IZz/6tZV3TCgqcaGXgO9TAWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYZSM5tdtumqV15V/sy6fha0IE4svCbe8Xhd65RtxaKLPdCe3ji9REqMMnxmhTzqx9a27FMhA8Dh5HOLFp/1dLJ7lUv1gJz1ayWtY1A2v94Jp+aB2z0+tIJA8nZEeW3wXlSdtst6GKbSmddiVZP2womidKSQu2qwuOWSgD3nyAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBPP4R3O; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBPP4R3O"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747e41d5469so4189771b3a.3;
        Sun, 15 Jun 2025 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750028919; x=1750633719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7M6sHxo0GXb0esGwDPHWorg1GzgI854D9hqbAJXaSsI=;
        b=mBPP4R3OVlA5Wk5laOFzy+4mPxx7ippWcBELjv9I3E0wTefCl/RrOG+9JHC+udhNKk
         JkVRoI3AApQXv9dXIPaaWjAS8BHMEj0IyHp3WRwXWqBESfVkzPKGxfv757HRmfUk3r1Z
         kZ1MuHFrWG0pqZLYbud7O8+SWZ2TeSibAUpanismwShvx6yqgG0/A6dYcMcpBwnvub6j
         b982JYV9sAa1/l4nPH/zvtbKqxKlPg6VfvAdZBru0+6y4gG+61CkLOfKC/RDgHIpcvsu
         zxzSqdLaLSB4E4HixKQiC/5KjOE13lv7WnbsQazErTnCAxzT/ywxThYcpPFVRbiqiFem
         LJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750028919; x=1750633719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7M6sHxo0GXb0esGwDPHWorg1GzgI854D9hqbAJXaSsI=;
        b=wP32XmBZf5QHyl2bHUxloUdhRPvU1pbWbAX5mCjD5pHisAFhlBrqU1GImK+WpIoN64
         3bEIDOr4TdlrSWPx1UrfuB86tWho7CZfdh3YR/70rVm/zMBUpCf9CM0xoC4jUDrfsRmg
         TjZ7WoIKP/1dpwEo+pRdpbkQeBvGTPwOaTbbYE904PC3xUtalA9UNqjEAvYa8LUxBbbk
         Kka93PieQwi/r6NdKgKWgcB20ldqNsioQumlER5UljUbdT4Gtg6G7+W8MYt27m2jYjqa
         1UdxtPKOf5sP6/IPh6bck8g7e9tY2pJKcn1KZNO/GQCR1eaFa8RPp/XJbmV3jKpX9AUF
         yQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0Bm+1BE8sZZothESuZM3CgE3OTbz2RjvJtRnl36x5o42mQUidzBKDwTk9U41QJSKdx3PD77sFONH@vger.kernel.org, AJvYcCWmikYMDqp16qfQBsg78CxJzFl/WtOg0dcHJb9PjJzksQ8dFk5HvdqrfsSsJheaCwKoRMLs880cqtnsPz+j@vger.kernel.org, AJvYcCWtqMnvL6bBA6Y4bjGAyvViBEdF+qkNL7ka9EmcJjjFFuVDW/115t9D+WdZYLwvNFKzMrIOz3cbkk1sR0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygc2p4ykMPY0II1vCYZRsgUykJidy0JoKEp2mFTTfmEypVTqDv
	f0yuXACLqukV+xLwGX+HI3D4ntVxDcchmjt3ky4iu2SB9ZHcm+/I9sC2A74Iig==
X-Gm-Gg: ASbGncu4cqVeb4+IQmOTTRdOCCz06ZoSdW0TYy09Xj0lkkqo0mx4JAfwdgZQuwWfXkk
	aHdRrNnWA8nDYstC9XSP6jqzQY1P5VXrj3LamzcoLXpRX7aKpbnYoHokRwNSKlPQjhBrKqx02gT
	+4hhD/tVqWXzqwaqB59vOhFv7nTR8i5DPUXNaLgJ1svQfVWCO3RAa3mIQsACe6y8GLpiTJJNQjc
	qI6prS3hety5gVX6cOUbtbybPjCMYOSr9YQ8JbDxVdgp4n0aMTBwZuEiHWBh8KhAgYoS1/4J/Ec
	I6yG2/GKwlwnnUP9rV4jo30m9mdoolYDBVhgdBFRU6PfffZLL2uwjGTbzxugJkOAdPGTJ5+6tWy
	JgoUHU29sMg==
X-Google-Smtp-Source: AGHT+IF06qUOkeqQeWH4MTQhhQab05HnYMbi5h9FTg5gPU0xeHX+ZxfgIklciCf8mtY+b7vH7ktghQ==
X-Received: by 2002:a05:6a00:ac9:b0:748:2d1d:f7b7 with SMTP id d2e1a72fcca58-7489cffa98cmr10489332b3a.21.1750028918966;
        Sun, 15 Jun 2025 16:08:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2af2sm5416100b3a.119.2025.06.15.16.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:08:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 15 Jun 2025 16:08:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v4 3/3] hwmon: (amc6821) Add cooling device support
Message-ID: <aec2567b-53e5-40bc-bbc5-0f2a1e9d19e2@roeck-us.net>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
 <20250613-b4-amc6821-cooling-device-support-v4-3-a8fc063c55de@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-3-a8fc063c55de@toradex.com>

On Fri, Jun 13, 2025 at 10:42:40AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Add support for using the AMC6821 as a cooling device. The AMC6821
> registers with the thermal framework only if the `cooling-levels`
> property is present in the fan device tree child node. If this property
> is present, the driver assumes the fan will operate in open-loop, and
> the kernel will control it directly. In this case, the driver will
> change the AMC6821 mode to manual (software DCY) and set the initial PWM
> duty cycle to the maximum fan cooling state level as defined in the DT.
> It is worth mentioning that the cooling device is registered on the
> child fan node, not on the fan controller node. Existing behavior is
> unchanged, so the AMC6821 can still be used without the thermal
> framework (hwmon only).
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied.

Thanks,
Guenter
