Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860A1F03D9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106544; cv=none; b=GKyjwwyyory84bwldVNo+gx0h/HPTL70FjJARm/nQ9ZCXnEkPXkwWGOq1AoEiVbC5XMCgUaxsb7eFnffJ2PLSb8kkweK8WYQ9h5CtTDcAeFrMohI3CLriBVmT9N1ye0eMZlQxxP5J4QuXzfpn7uZmz8iQHQoqNlvEzV2u69Won8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106544; c=relaxed/simple;
	bh=0j5gYjKOZOgxpjecfrLGjbWTh//vv70qPSNPVWr+hWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HBVgkfklcVQLxT7n4vqlGA3D/1Rm2blI2jPfXVMglallm1/lvvvOnw0c/rWWnZgy+68ZQId2wFSBSmwnDMQd3fkO90wq/0C9MsUT7PS3eSeSR7oVKPMyFtl+layFTUEAFtO5x8mgEpxa36JemIDU+On0j6Ntw52UHOBoF4s4JcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQPEMzmx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQPEMzmx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so416437f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749106541; x=1749711341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTgawIlCqa6snL5rle0l3SP+UrYy+5hrMdq2H5aZTbg=;
        b=bQPEMzmxt7JvWAxj9AecUYFR4daTtIaeBimU08YHU7p3GokGadfOko4cP4webaiu4G
         y5Tt77h35icOEQcZSUChqGwxRDNwNUDdMueGnUIWtL/TDcqDORrkZPhVxiQa41CfTZtb
         A7ULEdwp98Dmwo8Us6tcZ310y2NZxM61ygmo5Yt6vpP5kkHmJuuTYzG66apRkgHrqMfy
         skUzN1qCoc1d+QVZTfwIiUf1WR5REZteVoFaeG8c0EZa8nG5q95DZSzECthEHUIyMxF1
         kgYbJ+99m3Zqc8+UfuFgRX4ECLPO709qh2X4s4Kr4Mv8TJ5ON+/rMlyLAEn4vHauRhtO
         NsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106541; x=1749711341;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTgawIlCqa6snL5rle0l3SP+UrYy+5hrMdq2H5aZTbg=;
        b=Vm6d08k8MIJTZFAnoQ6OZM90ux+HsoFOPmPcZZ+a7dYhxBMTK6KLosfgVPpVe/MR8b
         pePlog2BROrnBQZtHrCAgx6XkpdXC0qljNBUBDoBsJbYG5wHM3AdAq6h0XTg58zsCeAt
         m1tykeLnMPsVCrWkWw+GiRoTnWBj27LeTt2IEs0HdlZYful/4xW8SRO9pTRG5Sw8g+3Z
         HYOiMpUnr0eeguaWKpnRHS12inbU3S9Fq4qJNp3FbJ/D/yry2WQYV9jvev5lHXVHnFX+
         ub9PvjDC1GIEf9nMJRiIm31R/vhkLLE4Dp6eivswGiO7tWkURBeed9mdDqy8WTDuh9W0
         dFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhbdsMC5hJXYAkgeSb3d1ccHCTFvBXzB4uE2q3xTh/eydsMIoU1ywsCkP46ho2T7kXb0gyki95sinYEnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9C9BXgytxeam+zo7f1efvO3qNonPi4vB52nxwyS1GdONlnd71
	hWmKGWBg//gADV5x1Xv41rF95gzvJi+H7MqUlb/mO3vT3eJxFBqw8Ub1vKKruhbKNR0=
X-Gm-Gg: ASbGncvQmMGQEnk1IpJ0vVg2Z3ctoS31ahnBzgvbzp2KN4RT7AqCbvOiTlVcNJ2Ugl9
	EAeT5YWkOmacEWRWrGjrIiU9Cf4g2xadq9vc/1ZgCuWhD8xsJPCCyaj23lPv+f9HAZe7MbOhuVC
	q+MFrJJr+YqSll87R10trX7kKt14AbSvo3XXJBH0ZXZsXOmifzcWC+E7fd2rVEmtRKxqOxfISMh
	17nMEPLQT4TPz6j7YM/FweK4cOQG6KLvShF57qwHcRZkC9x4ThG9QWd6RlFCzJIPq9ksTnp1G3P
	MjGAflyDTGGEkk3SnuvYWdSy7/AgCUBKPkbP8xVtbCPQK1s84gxyMBUxcrH0ITt8I5iKteaL
X-Google-Smtp-Source: AGHT+IEL+6tBVVRvp0xx1uUE5vKVrbbEUAQcz4JgR/37DUDVvCUG2yUMzTiEh2o7sHCW73N+Ae3r9Q==
X-Received: by 2002:a05:6000:26d3:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a51d8f8ff8mr4161811f8f.4.1749106540703;
        Wed, 04 Jun 2025 23:55:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:55:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250520074439.655749-1-mwalle@kernel.org>
References: <20250520074439.655749-1-mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01
 panel
Message-Id: <174910654001.1422723.810101462867818295.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:40 +0200
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

On Tue, 20 May 2025 09:44:38 +0200, Michael Walle wrote:
> Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a3bc2ee00b488bb7a90770447a886c678d64756a
[2/2] drm/panel-simple: add AUO P238HAN01 panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a45632ed3179995b2956cfbf140655701301471

-- 
Neil

