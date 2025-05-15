Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B491F4176;
	Thu, 15 May 2025 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323291; cv=none; b=juLoAP8UNzLa+5hTS7noK3ySZB3iH2LnlPrfWXOODkhzhhjvcoM3HBdn6ek6StD3iWsaj1uqxsw/yajPGOaK85JtGW7Oh7+oNjBxUw5HJLC45x164Oswr9Sl8ZQlO1TwV3YlcM9CwCQW1fccujop6VA32GlPkvQEOLzl4WenJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323291; c=relaxed/simple;
	bh=R1oUzeNn3PSQzFXS/GTf3c+fuc8IUfYozI68g4wCl1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5SSZUgOwhWiyqD/4cghlMkHpcOKSJX1Ev5zW7tZ4ppuwIZFPu79ZUcZcWeHueMgzV0Ha30sKr4ZF3tMmZGjj1EEw87udHoSdf9aQaKqXOwUMrH2/MYsdEnC2s9WeKE1xj7UDTXaVB2lxfMvRU9EOfxgY/ei1vbdCEDUbFUcVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdQk2e69; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdQk2e69"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85e15dc801aso89920239f.2;
        Thu, 15 May 2025 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323289; x=1747928089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1oUzeNn3PSQzFXS/GTf3c+fuc8IUfYozI68g4wCl1c=;
        b=KdQk2e69lqenue6mNG3FPiL6/2e64LONTFuaamPt1LwJpHJ8r5jDePMLp/VXICWBIB
         4sT62Y+i2LLGd5/H6UDpjoiFrKTlGAOz9QimBgdqdOkAycd7N+Rcgy/q5SMdI9gxngkN
         0VJl7qKTlRFT7GLiX4gxg/aoaetM3L8hUH7j8X9FUTZibQ7XydvNbDhSbfVxUuZEbzBL
         YJMvI6O/5/p17Ugo/zE9JlAwSw6sh3csVACvwqSijNqCKzz6JTp/41uVhfUpD3p7HKO6
         8yqpGWhevc6w0DJV0dYFP8gN8PyWi+aV86s7OM8TbkqU1fjzxTAS6P1Ahb/AZ5GDUjmM
         U9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323289; x=1747928089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1oUzeNn3PSQzFXS/GTf3c+fuc8IUfYozI68g4wCl1c=;
        b=g1yXo9rC00CsNjiiluWs/zZYUy0I4uvqOXmKY/cqc8G6a0MnpIn1b0EhHZmvx5/K8G
         q7tWrugWw+T3fJJcO/J0ooV5Jdeq+qQTWq2cfIF6+5nKvFryd5QNozsLU4DLpchJwOeT
         RpIKpvmGbztMF89nYQIuYyTRccNgkli/rKC+i/JzBXIrjUF+4y/o7Nf6YSFRVBOgOvNY
         v+unYt/zo4SVWqciyZHZJyH/zAv8w53gbFL/giJ9xfjECH5AWTkfzd4newE0+ZOGneZk
         NJc+uPTifcDwlTx/pmgyWdEOaBN71e8m+7BfRFLIsAUdgw/2BtWGoeRqiDZzIigDhB8W
         cSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZ/4A0sSZwgrPBECgodyh9c6Aopt7SZOo97uylhDYHVwqLDdrqWv2HkENwND31QEQ8b1NjQxEKLO7GK7U@vger.kernel.org, AJvYcCVD64VUzMI5kTbOX8xIkbpbdAbBxiqq50GHFzVS8Q1e4ipU4VlU43Ha3YaxeITyjhLHsuGFRYDAu3S2@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWTS7HJL9vaEhRn24YJYr/UXG+psDprW4Fxjy+3mTLA6f7/B8
	HdTRCUEYXRAcLX2DjRILEdTAsqRUCc+L0HXDExaLUtDL2LrRNWFe5/mKOl5JMmYO3rig6N783vk
	czchqEj8sNXT87hR6DHKtq0G3xJ7UuTI=
X-Gm-Gg: ASbGncuxl+8sbj6otEEeNHnXkvd60OSSq56zJKIn285aygPmyEHUXG9oSdEVYOBPu5L
	TBfO+istBk8gR96BTUjIwjTMklzpCwh+4AvMOsQt1ee+bkSoyqaJ0dtKHE6zOav0Eru+qFoQet7
	VfgCsk7r5kQQE7kxayT9Ppro0LP9X1Wx0=
X-Google-Smtp-Source: AGHT+IES9V8lVTTvWICKfzxYu+CVMAq48KVI6mYqwRTqXoil9/mI8MFLo8buShxdopzagn4Vwo06mZosFQzi/+WSNBc=
X-Received: by 2002:a05:6e02:3611:b0:3da:7004:25c3 with SMTP id
 e9e14a558f8ab-3db842d965cmr1447895ab.12.1747323288642; Thu, 15 May 2025
 08:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514173856.3677454-1-joseph.kogut@gmail.com> <9103406.VV5PYv0bhD@diego>
In-Reply-To: <9103406.VV5PYv0bhD@diego>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 15 May 2025 08:34:12 -0700
X-Gm-Features: AX0GCFtar0G-IXOcyvduUi1LOxjuzJw4BSv0FtZ2_BdZ4SN0PKzbJLc94dikmjI
Message-ID: <CAMWSM7iy0y=rUgok4XL4J5DDD9haq=9sLa-mAzhiLc78RRa1Wg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] arm64: dts: rockchip: add Radxa CM5 and IO board
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"

Hello Heiko,

Thanks for your time and feedback, it's much appreciated. I'll address
these issues and follow up with a v2.

Best,
Joseph
