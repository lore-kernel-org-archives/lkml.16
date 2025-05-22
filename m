Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF482126BF1;
	Thu, 22 May 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929048; cv=none; b=cnxO96KGblmY6KLcg86URHTEBoIhSorD6Rxh1LejmvxH18S24Fqy34XnErKwIkb96gv80POzFPDHWqfGLEinlKVSZV3uQnf2Wtd+75rAbigzHC4iGWmMT4k7aaQrHjF/L3p+nWhufKxdSBmzO+uA84bHFmOWv3wVFQ4B44kNhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929048; c=relaxed/simple;
	bh=HieFrw78viik/mNeGsiMtWSV8haZ6nV5KUbTQ/BctgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjSCHZiFRZqe5HAJ4XLGnxuKtoW/4005W2x5+0CTw+HIC93Rq/Jx37bGeap9+z1lPnmIOTPAk/2+13ZRb7sBf0NZP1LCxrIqldZHAcO1H0b7B9iUlW1WXBeBvSP8Msqm+o23J48Ygo6yuNZ5yqNdcTz8kBK0nAfhQaVIm2AzM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK6kKI9l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK6kKI9l"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742af848148so4869043b3a.1;
        Thu, 22 May 2025 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747929046; x=1748533846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXxDPs6mqD10etya1zY6US3+TrWhWmXHSYfy4AVSsyY=;
        b=aK6kKI9lg4nCoWLvF5VvUDWy6Q2BjWofCIl8TKLS8lSHYdIfGxKANAtasla5qq7cmL
         F63lMATNFRErOSpPKhB/8iJZjyuYbKgXUk0jSdFLcq19QZi5F05zaefnARrQsPsTuEYp
         SLzMsscnaTgp4Qq0uTybWoukMWtk9hWPMSnSQXBFlzB2a29MdHSpFlfuYTRERKn0kRop
         60AQNAqx22Meoimb1Q5gtT9gZoKinaacw7P8pabEj2EvDFihJ5FiWtjHq/VyvwsBBNV5
         WF1oCQ9o/rmUAlS8+t1vUusfAo/VYlSLdOsqWqogP2v5sUysubFEw9sYWcIB/ixBsEaq
         v3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929046; x=1748533846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXxDPs6mqD10etya1zY6US3+TrWhWmXHSYfy4AVSsyY=;
        b=PFVLNl8zlpZl3BWu4bDFWK4r/eZCjcp+u1Ga0EOWDvkYeqlKjKSpCojQ3Jpu8qauEF
         EmoNp/rqVpbI0ZD7g+8FDGdh6bzb4geGPIdAY6DzCIhwZmRMjM7/pM3ovtzI13U8H9AF
         mBTDN/k3XbGpjqXGn/1Ne6TaAawnTBuzjfl2eSA9T3D5AGMPejORz5ytOO7dr+HPyA67
         UmNkJ25aYu4ZqRVKm5SZdf8zlnCk/H5NbmcR3XM9nQb5ADWkkYuQW65vl1qVf/HMz2tl
         n+r9I08+YkihLy5XIbIMr/i3oB4L1Vq2PBtNhZ+HcDuLtlBb/b19xVSMfwf4/ZAkRfSz
         28Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU2207l18FyrVX1/+D1lwgPQYyG4sdDWCoPutoNDIodlnveVczMBbwXMwsXN5WH82ezISUCsE2ptMon@vger.kernel.org, AJvYcCW6REHUkeWB4cx5kUQ49w1rEVrGj+uyNUV7Ga4HvusRgK1Jf+IbU0Ogz7pZR6M5HesGUKCLv02sQxXNNjzg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4awVv/mGmyMl07LLaHn1Q2FkjDamzaBGxaKFOH1r6CRtrhfmi
	c1f6/NZXVCw6FYVpBOk/SWTNew8eexfkAYpidq11fX3wDuW+aFeUEF6gvg4FfuQz
X-Gm-Gg: ASbGncvDsILZ31lV3D26KWmD94anfyDle3jkH2bgbibHSLYIhX8Xp1VESc5z7robOTz
	7/LGSVHZXvbAXoiWbPS7mFm6vJALQV9JilbbYZ5eezEjSTHigf/bueeTGZhXzn6jFskWK6JagxS
	wDdZZRM0xXMj0ZaX2ECVtBuGcvBxhnsHhXR/N2+hEl6/WfMc5YPaUK/EOP4BpJM88KseJnYZzVh
	iaZ/P7YiEqW6CBuoMtpIDAOtcnVm4xEfGdoZ2n7CtewimGzjO6/PgB/YCnOdOUzVKxN8gUHJXEp
	0B7+fBQDuOcrBxxySE7jLWdsswQSRpRkV1cV9w6faPnxud9dxuBsXfyxw20exUjXdAk1GTeDY0I
	ww/slnigRBI3XKb4p9kOx3YWipgWN+E0=
X-Google-Smtp-Source: AGHT+IE/4uJlUKfJ1lBNm4F3zrP30ofOqjG0ZQIkuIfHT+6H0l21LQm7Iel/rOgyCw7xg+YRpixsLw==
X-Received: by 2002:a05:6300:218b:b0:206:ad2b:aa9a with SMTP id adf61e73a8af0-21621a03161mr41708416637.36.1747929046032;
        Thu, 22 May 2025 08:50:46 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c7asm11459919b3a.85.2025.05.22.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:50:45 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: robh@kernel.org
Cc: conor@kernel.org,
	onlywig@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to mayqueen
Date: Thu, 22 May 2025 23:50:06 +0800
Message-ID: <20250522155027.3412993-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522-difficult-yummy-84376495b270@spud>
References: <20250522152220.3408999-1-onlywig@gmail.com> <20250522-difficult-yummy-84376495b270@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

Thanks for the clarification and guidance on the rules.

I believe the nutsboard prefix is no longer in use, as the related device tree files were removed from mainline starting from kernel 6.1. Additionally, we have informed all our customers to upgrade to the new hardware. However, I appreciate your explanation and will mark the old prefix as deprecated instead of removing it.

I also have a question regarding the new prefix. The reason for this change is that we’ve developed a DRM driver, and the platform device in the driver uses a compatible string referring to the device tree. Without a vendor prefix, I’m unable to upstream the DRM driver because it lacks a valid compatible string.

How should this situation be handled? Is it acceptable to introduce the new vendor prefix first for this purpose?

Product page:
https://github.com/MayQueenTechCommunity/PIXPAPER-213-C

Best regards,  
Wig
