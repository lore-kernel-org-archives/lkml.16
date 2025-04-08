Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6D1B4243
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120811; cv=none; b=HdhQA7+ey6BXoMtP6EY0BsImFKM1uPfNuucwyYGGxCKXH1FcaT4EimP6kg2GlEc4s0L5bupNQJna/Mf3AaxSkygXkYA98WwlFiLV6V13NjBEI3F4Mx8oDDkuD/sNvHpV7hng53ljE44yvk53tAU/1ZyTz01gBz8rWyr5LpqcYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120811; c=relaxed/simple;
	bh=rjhJe9Y3wTgynHhJ4YqcXIXWDRNk2mP6NqXT7bmHydU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Cc:Subject:To:
	 References:In-Reply-To; b=qh8zQfYAqnJrHUn5IIVqrgAlQjCMA+ULBJhVSas1MEyY3QIAfVfthk8R+hUjKQyrjxGYNwYxku2Q+MQiiKCpCFmIIH21TXn19ceoGZZedjPGSgVsjJeIy3aoDpJGvlmHOqF7odbbQtr34OvuFPGQQK0iQwRfjjtcJhTNp59yleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=lryrET8g; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="lryrET8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1744119910; x=1745419910;
	bh=HdVrKiLxUdmpe9fCrCw/kLf8rlGmiakOz+qziTYFDeU=; h=From;
	b=lryrET8gh2eT7FCkoM+uN9vHKtN906XVZi1t7VW5em1fi5XnbWatBPOZCykhzuVl1
	 rArNFcv8aGIvpqrZsR3Shc3kfhZgTseavpIU+B/jlTulYtCg93OSaZUPa2N/IrpcwQ
	 l9Ts5PNG2A53G1NjVW3UDIdA1YInpLYHs/r/Q7Z4dgNnzKgTHmtV+yMCzHQMmcVGTc
	 nNcmJbKLqMgOIsfrhui0MAdYu8ra7tYytRgHN95pT0GL6arC1/Rervv+KF2M+7xH9r
	 ZBLvK0cHa06Mdgf0TcSmU5VF6dcH64vd0FujVpEZOZvYarhtj7lZAl2aU1ycwTWEXX
	 sDbqARgpNhJng==
Received: from localhost (eduroam-out.ist.ac.at [81.223.14.219] (may be forged))
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 538Dj8oB069639
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 15:45:09 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 15:45:15 +0200
Message-Id: <D91AWS1S2FIM.GU2X20PXR19S@matfyz.cz>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: <linux-kernel@vger.kernel.org>, "Lee Jones" <lee@kernel.org>,
        "Chanwoo
 Choi" <cw00.choi@samsung.com>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        "Orson Zhai" <orsonzhai@gmail.com>,
        "Baolin Wang"
 <baolin.wang@linux.alibaba.com>,
        "Chunyan Zhang" <zhang.lyra@gmail.com>
Subject: Re: [PATCH 1/8] mfd: 88pm886: Fix wakeup source leaks on device
 unbind
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
 <20250406-mfd-device-wakekup-leak-v1-1-318e14bdba0a@linaro.org>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-1-318e14bdba0a@linaro.org>

Krzysztof Kozlowski, 2025-04-06T21:50:09+02:00:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mfd/88pm886.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Karel Balej <balejk@matfyz.cz>

Thanks!
K. B.
