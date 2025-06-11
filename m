Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93152253E0;
	Wed, 11 Jun 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664118; cv=none; b=fyVfmSvy8zW54GG7EQKYkpbbX83jxnIwkYWB/hfzXrbFT/gAxdbrNy2aJzNfhLnV0Czm+KmqY5jhG6xr8RexwFNGqnU3lJZLOa4uKy4NSrdASSaYQxJMtrHQUH93DOrvV/UxBZgRMKUW496lUFOactZtndA9+zXHqPiyfN5bZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664118; c=relaxed/simple;
	bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYRp9t0sY805FNfkVTqOcWSRcPWpEQeIRg09FBiwWiNkAaMiLXdYib7l5yQ66OVrClNlidhHlPj7mcFkTpVcNFgLqVu4w7ljEUPfafL7fuv5Y+EZCFikeSU3dF+xddDV1TAFP7XJ/O3S0sc2UBi34veZ1lXQt3jbGoRy80Zxbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuTbjOnU; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuTbjOnU"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e73e9e18556so115760276.0;
        Wed, 11 Jun 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749664115; x=1750268915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=IuTbjOnU2KYoQboUXU9n9vdfLhkduOlLOG2tzGVaDOSUc2iPKB+/GWWUBpElSqG3g+
         pNS8nexW48RBfqsXI8xdLkkD5Mq7pSmvu3ubxI4QQzUXKDnRK9sMH+7kTVBnsCZEaKaq
         QJ3x+sMBL25nd1dHtihxedYDf7Gx8xujaxYNG5Bjm8v0dQfEsrLIttcxnueQRzI0OIcN
         JsUUKpUjISG8uTvHaka/Gns8IyaHfgzi9y/lKnQ4UhZtYRmquyYHrSRygjDIJjQKHJ1y
         qAY6fBQIe5k0BjuHGtD/yzs3vFDEyy0b6LGETlV949mQwO+uyQ8l+pQbxYXxzp3XU3b3
         +M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664115; x=1750268915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=el6NgghyQRGHvrOY44P0UBbYwfTyH0Qi8vb/gUvBsWvBl8enm6Btow8eN7uen2I1Yc
         BUNUiVmjPji7zt5/l2XGlFGBpuym9vBhDMGdGyyvxsB7I7fPKLljcEWgnZXeHYQ4n0B7
         6RmNh2K2gkzCHGWu57XqX6z2A4w4u79evBRwtjrd277kJRu/fjBzPjkSZbYDfBtdHBvi
         rxVog2Z8coMowUvWxPTzhe0eSlP9/L6IyBcSOwMhvMTwARkBeiFVGHHI5zJSdHtsRN8A
         mG3kfQF3xoHuIetXuqIN3zNZ842A23rMGFeiOGBED6Q2xisO2pA6eZNxmJJqkmkjpvWh
         wvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1D2berBsLff59evX++HhZpHtGISAwWPHgiAgf13FS+6ofYLKcr5f+exaqW/Z17HZ/gwtTiH5h9Pjm@vger.kernel.org, AJvYcCWye3xVl+qy7Kv5BnzRxjcewkgBvuE0xv0VoHXX6hs51WfV9GwijqhjneBjMZDZEH4im5xhuQVRPzmlSRJs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5XXJx3SZ1vyGzK5C07StLrQZlEZlsyskY8MQGgxyUjBKQE4KI
	iOEHkEFg9thQ9UD6bOyHDugRFFChKYNE4RZMwsXZil3yeCfckUPp89KOOYGi+3Os6JR3XcE8jaY
	1u4MpmrrVuSyy6OMooyazt8fD5K9HCBI=
X-Gm-Gg: ASbGncte+ilcLg0d4G6W4tu8NfaB8WUOYWnM2fX6OcVoGoNabCNTRx9zUl7JSNGBST7
	R9AwvHZevCLhfc4HYgrEhpXvFJ2m/DeRIEokwFEDeZI+4DmjBsLPs9VCM1H1/8TeU07SNdlsfmX
	VWTJstSKNoTsxcUAbNKjgMD9pJUnZgFhJaoS8mf8mNlSLT
X-Google-Smtp-Source: AGHT+IH9DABL4wlDn/GdD9XoHB+8QanMkWBj0pjVvFYJ/W1MuhG7BWxLo4YCnNzNiDDh2Shj91H32KBlXFkEPsp6D3I=
X-Received: by 2002:a05:6902:2501:b0:e81:7e20:d737 with SMTP id
 3f1490d57ef6-e820baf7827mr480844276.18.1749664115677; Wed, 11 Jun 2025
 10:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <aEm_7NECSykMX5cs@blossom>
In-Reply-To: <aEm_7NECSykMX5cs@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 19:48:24 +0200
X-Gm-Features: AX0GCFsfxtx0nWUUwofAcCujP5Iz-6oqoAbr15qgAOq6KTl9zDhKhhwtvESKTto
Message-ID: <CAMT+MTQ=oxfdq+tqjxLXqDUPEAHzLtJe1qy1vDBf_SA6wQ+tkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 19:42, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
> It would be good to include links to the kernel + m1n1 branches that
> support this binding, since it's not what downstream ships.

Right, will add to cover message on v2.
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1 (the bootloader):
https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
