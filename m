Received: from sonic314-20.consmr.mail.sg3.yahoo.com (sonic314-20.consmr.mail.sg3.yahoo.com [106.10.240.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9220224AFA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832546; cv=none; b=Bl6Qfp6B6f97GwaLanfCK3A9d84aYJbdbA6ecS4t61Pos0QIf4ioqr7IDf6j6VEaz/zQVtxK+jIpSD41M3O2qYTHthax0I2rUyEYuSPYUGhMhKH03HLbSd+ytDrMvKm3Th/VLur93XzJq94O6skJ2lCfbXgRe6S5+JZiuSEqNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832546; c=relaxed/simple;
	bh=Jt6auruo7x5ZZTORZONlVhBpyrs/7CjUq012jDYG+G0=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To:
	 References; b=SdBtYboxA67xceZPNWgyfj5GNobDUY2mqMs8xj1qcMVVQodwIf74nqXJzB7s3cZJHoR55t5xdpUmdkIQbIiNzL6nkTw5Hi4AYzyKakY2bS98KWHFPS0LhNF0oKkDCXKX3WJYzvxof4RAm1xVKRVQD1nJjHjAWPgu5G0x9GSb8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Q+qbS26Z; arc=none smtp.client-ip=106.10.240.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Q+qbS26Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744832541; bh=Jt6auruo7x5ZZTORZONlVhBpyrs/7CjUq012jDYG+G0=; h=From:Date:Subject:Cc:To:References:From:Subject:Reply-To; b=Q+qbS26Zm44otVBsKJNf7+S3fOihuyKckQNjE3+koU5qZbrw+8pMzYOBBcPnuafqwgBVUJbfvN/wjnjNA7BKDjGEHp8yhdBnIePKPbGbx/xBFaDkFiuuYZQahPW8DNdBf24vSXu7/fRarGdIQRFw3Hu0ROUs+aH0My5xtC6oouiBSbWa1gFdxekIBLgvzw6gssbbzXYwmIkEyQD1Y9B0wovsv5SFx2+Lfe/GNYkLL83mBGSHAYwLWE9TkrnWXZtMDeUOoPEyXp27pqVwUZTHVL5LJIF0tKjAsiAfVrevRuDBSuAPTaYz161bka6EbepMkzIxP/Fxv9kd8bqdwkaEng==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744832541; bh=yFnovo6uM9JzrOD3/DYoJJkPgJYpeNuP9Ck9ynEek1y=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=SCuAlBLxTkw3roYWA1PyHgOh3RU5HANYQoJUBoJEPjqOVSb5Uv+qne3iZE0t76i3xfQxwMhXvt4xbeVNZKxgKdLZM9OAInKu9GbSgH4f0PTEXJkf1gCQtp0X/23OQl567JfqFYubK1IrV6ftsq/MjKql+TOEEVx+17UB5gW4Ios8TE/gObYb0hwQqTEtm3elBiawNvlTyL+dsM/OktBGWORvNHd1pDH4AMmwYyrCfNgwKTjimTL348ZjL5RRcAvcdSAQCcuxDzfQ+8v5RhGR1zknceWF7AXIcwgSN64mYuMkeDbO3IrWb76BIU1SO1u2FnmFVl5X2l7tMvCUkJQXaA==
X-YMail-OSG: TfUvJQAVM1ktGRqQ9w7b2WfifeJYB0qU2YCQ7e97_cAqO870ykoO6tz29gpJRQW
 vNnYc4wsGKAXBZ70uaJ3L5vbau_RmRSC0M7.0u0QNkbkyWMdp3mRr.POKKDqUK6hiFvm3AgDRd.f
 9TcSdrCtLninJAfLA4.L4E8ohbZA_1sGtzeyuVFttywsdgQa3FMdCWmgsVF4spKf6vPzeMBBXpMH
 LCm2GcLQ65c_st3Hj9jnZjsnW5cB98HhuoW6.9_6ewtI5aiHyT1fsX98u1LAs1KW6mGUFMJ8mMPb
 L.G8TgCJfyza2grcGcCfqXwiJ_WmDCjPF1JoOIoGr70sZBciU9R1Dk7eWL4W1m7AsFueYMy_6mtu
 V7aZOf5sG_CaSrBknkHvg.smUPGBbadWI6X2U5sXvyV7Yo0G0u9.QsnObk3OaX_k.ZWtCEwxX3dq
 X1B5NZsdgB2EZgJjEQph.Hdd18_DTwiVVu6Csf4SEqEDUzdriDb.o1oH1t_3H6IvHv5bHslqYmwb
 AcbKu3JqQOYYSnSw2GtXByuKi5ZDkhL0dqeTxN82gVKSNmgrbIJmIj.sc6AZXu92y8Bq8gQUYwT6
 Uy.3n6VkK3JVVI1RTlkzUdYj6GgLxcTmsINRCt038Mn2eCmRgDyr.fzLffEsiHmyeFozShyjSnK0
 SzdsfLEp7GUDti9F8ykNjwYCklpIvYYawyzPxhYxBf2_A3FUv4QSIZSHF.bqPFhLgmVaMrdSp4zC
 VFw91D.1F69zMSlT28E8VSY66rDFxabuf0SianBByG_h1fig3P5aDiiwjR4uJN5af0U_sCzOPwKL
 sWd3AyceQuiTtg0pWN.WqGObJ3MuGABnjDpNE5021y_CQKuGnR.qZLpeYjg2E_CZm5TxuugS7rwz
 RyzwtR.xVmYCboTl5igfEecIrFxwHKsqxYYlMnIob6NT9Un20IJPjrcxAg6Wih2EhoO5CssZ0RuY
 xRmdauyU9x7qHbskWBLcgV4iIcL8bBXaLCryNm3.VnK3II2ibxx10FVSTOqQBdvch.BTcMyrsIlv
 oQ_FyqwvwfA9lZJzpC6vHLnur.wWlHvWOcA0mVY_Y41zdrizmOse5_5_ZtjC3QT4dWfO07dTYc9Y
 NSG8bA4G7qboO9eyIVhIuZfcjUX42BjWjgFGrJdpaJicdst7uo2vWh1QaoQGmBDiHx3IPjLECZKj
 cqVddtbo8d8sXXUIB6_7NO6gQ8UhFz5BJYd.d7jaXPnTprhjPGExSScsGym1J0Jyn63DFXhMCbQq
 dlcld4RsNjPcUyN0cZnWrDwJ0UlDPeutQ8NaONfR6dGL2ZW_02oR_yt05D91OxxkBbSRi.PmCjUb
 uHT1ob0.2M83bAp5is4EylkwzcisJq8jMbEjf4BATzFoWYIE0Op9RBtnAc8I03iYNSYnZnLDP_MD
 STf0Kt45xyYp3fqvng9fd9sSOkKtU115pTAEiWso9c7BE2HRk10Ft7U9SiYy9.2fZYIrneqkGOi7
 RiSEFXVHwcWWUgFuMDN_EJ6UmcT.ZML58h8c26TWa.kaN48ahA98m15fKQasrMK53ynlQ5BH8brD
 iXecomanOXWrP8mgLroxvJeVUsWowB1MonCTS8ByU5YkyqIgd8sW8taJUamd1z7MWlMNJgb3iEzR
 8gBm7tw20aWE46UxlbuKswpczjSinIQjw7vM3kfSrMvMdZ2fVeCuvAkind2bKOwZSRlFl6VQdHLS
 gD_NQcpUK.eq8x4TuNCqvL7hycokODDXdIQbTkIM7wv6gCMoq0M1FUNyZO9SzmYwgSybt2lA4rsl
 PMNom7gXIdYSkHywL18rMklnVqfNbGaTY.rthLzWSnp3Nh.98GoNmz3cBFGrwWO4uPnSpMVgo316
 gy7sGQ3.3T6oHFPS5E3N15Y7Ue9LtSzYKnoIzDRCdGwcEIoxhIL.hVKvGO8K.eyyImofLlXgrXwq
 G7U.0ku4F0A.m4AtVYeosbhgDr6kvEGTbnrKkCcEuucxzCkgaRON61rhjjF8rJti4dZ0xQSXZY2q
 fjvp1XqUTWEGeF6K7NmQ8.SMWUXCaJ0TfI72.eoJXxzMix5ork7wpUb84Djb9bUUDpcV6N32NWSD
 .zrABvBVNQAWJ0JO_CLvLaaivEQBLlDj3X2WFxS0fiMF1iphCs5qiTOALK7iMGjwA_hpegcKxG3s
 gx8_RJVof8tv5K32Dlhu2SfdnBg.yzntFWio2zK1w4PlawFV9StyPQq71Ln8njBGgKGaB9iUK.Gg
 nVPxeQh.r.r_kO4AmE6kfZtdYaFDID0j1MgZLt.vXQ1xGMA--
X-Sonic-MF: <rizky_fattan@yahoo.com>
X-Sonic-ID: c04944fd-fb6d-4f3e-91e7-26ca44f077ba
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.sg3.yahoo.com with HTTP; Wed, 16 Apr 2025 19:42:21 +0000
Received: by hermes--production-sg3-cdfd77c9c-6dk4l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2407fc4b307aebe39201309e5da38d98;
          Wed, 16 Apr 2025 18:21:17 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Rizky Fattan <rizky_fattan@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Apr 2025 01:21:06 +0700
Subject: Re: What would you like to see most in minix?
Message-Id: <063B953E-5FE2-4D89-B3C2-FA71D1ED8934@yahoo.com>
Cc: linux-kernel@vger.kernel.org
To: torvalds@klaava.helsinki.fi
X-Mailer: iPhone Mail (21H216)
References: <063B953E-5FE2-4D89-B3C2-FA71D1ED8934.ref@yahoo.com>


Dikirim dari iPhone saya
