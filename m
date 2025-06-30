Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1F28EC1C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298083; cv=none; b=emHhp5bWHWVfW5SrK88UVX2vx7TvNCSzfpTPwXIUeqGZPcepSXtTrE+eD5mnl7c5mgudsXup6Z8IXSqmBrwabrNGdIguJNImtB8TSfBjMzFlEku0cpZB4xChAuLb3GsTn+ma5yF9fciuRwI4wzDKXQhlnEUX1/S/uzx6G/+CVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298083; c=relaxed/simple;
	bh=46wZXqrVAlM8DzG3Fc7YjqDTGNq4EVFj7pqtyU56Opo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AwcmVelPisYIvzgpWqGBSI17ih+9SBpgx9ieuHyXPT5HKA+/7zHez5ojGlg6awkII6TDxvP+7rfdZKdPanRVNmOpogyZqC1w/FF28uMtpdFgP9qUgKdiNqqDtkhKS/Y1ojrN+WJtSwDhQnlIBILdHoJYuztADYBBIGHxKmpB4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqIWphc7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqIWphc7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso23416635e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298081; x=1751902881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E/kjT2ltjbIwc2t5rBywTAc8OGpGOaC4vFH3C1Q88o=;
        b=LqIWphc7U+jpnEjiTOSvqJNPe+yJbbR9CfnpWECDJh/K3OZUTlDACRwizP8cyzfbde
         Kr9JriMm9PmvcdR6BVHhiv1xHygK6zUkhXPntWf8GEJuqMICJNn2wnUPc+UmEkqllIWh
         wik/QzU0QQeGWsV7l7qfO+/W9RyNP81Mnc4SET+DHaJpJPlz6I96ITNzNXS0aOBLbc7c
         rTIWKKwTbjkGbgqFKSzoB7kTRHlF952LUzkBH+WJHKEKfJvqfHOSxMSqttJ++vRS+HKD
         EgzayYlUfk5xHWqdDRH0sHU/7SMQIOlo3WagGioBc0NdUHgsuuAulzqvM4WblLSuQNa5
         t+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298081; x=1751902881;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E/kjT2ltjbIwc2t5rBywTAc8OGpGOaC4vFH3C1Q88o=;
        b=tPrZp8DX5NvXzMTX6VLhPxLhM4LSN5s0DHVfPTg6pSN594JDIbOGoVI518UNyqPUH5
         rYTJs6/0FQDVZa6EsjkwZqeFf8ECxSK+aBJemDFMlZC04YRZo1V6/2rV6Z0CdhfYWhTX
         S3ur15QFtm8HXT49lBdbdMMFab0whPlPyN3rwS16YbyKumHjIARJYpxE5bYHT2QF6Tdm
         UhPQ7KGF33mFyzB27y/7Mm+Xc+t4XyQkCmN53D5YEjc1nCMLB9lgEUcAoisfJd+7b93u
         LublekvOUsQUqYzCCLePe+7oJbWIkJHwrGvV0duuNglmWl6h43nwLaAaLRIrlXyGarpI
         kQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVFrS7ztZGne746VXwmEcrxAgt//wJLXvIBywIHi6Hz1wym53RgkPXz8DWvo9YV1b/UORJBlYZpy+Z0qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlHAh8riABFyXUragmLNQ77WAtPc8QiH15bEIteeRElkGWXWM
	qjbOxT5ivTFTQrg/Bdo9aekZqYT7z3sKSmCRX5kgrGzNn2vPJguJovYPocNU4SJ4Sdc=
X-Gm-Gg: ASbGncvQzcoIQ0zqA0rPNJyrPA5w0VAL9Xb2zvQei6S8lO6cfZqKbnlJmWZNvT0Hb75
	9z+kLGF9l0fOYY+/65PkEfHuHh7uJkdUDwS0v+81j33bQipV1B5Nw/2+X35TzCAHtuE6d2GjwHW
	tEicbco4Y/CZDp4ZtNMON+phpVR8dmbjq18TZrfg8PspBMPFK1XVIKMuKTLadtB8dG+i5BQlRB5
	AAlPX2ZzZvjaudN9F8R1FdG2j4GdV0FSDbi6ByKbkCHXfpGd50LrRXejntjHFdt5vIHionkLtq3
	I5voPUS+BO670+2dOr5oQyXUjXfeLO2bJfJvzFGzwqju2xEuzKKzQTZsQIS4MP+YNY+3A+6Qbx+
	8LBY19gg=
X-Google-Smtp-Source: AGHT+IEuT9/EiUwKESon6ClV7CJktQo+yFrFWhG+bJtZTumFOvoppPXGadHx2JbaoBOarca6MzKDRA==
X-Received: by 2002:a05:600c:1913:b0:453:8ab5:17f3 with SMTP id 5b1f17b1804b1-4538ee837e3mr128984475e9.22.1751298080673;
        Mon, 30 Jun 2025 08:41:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: conor+dt@kernel.org, quic_jesszhan@quicinc.com, krzk+dt@kernel.org, 
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
References: <20250616070536.670519-1-andyshrk@163.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
Message-Id: <175129808011.2286551.3854555524045172494.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 16 Jun 2025 15:05:16 +0800, Andy Yan wrote:
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as RK3568,
> RK3576 EVB).
> So make the reset-gpio optional.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Make reset-gpio as optional for Raydium RM67200
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7513437b42d3ea682967e8fab113e20e558ecbc8
[2/2] drivers/panel: raydium-rm67200: Make reset-gpio optional
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/941461216c8d96b2c8b91233ba71483e011f78a3

-- 
Neil

