Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87DF199FC1
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746899015; cv=none; b=VWOVMgDG8LmCmRRgc++3JXZJ96SjpEIUF2xj3LcJBj1z0gkhu3S/ioFuCkoMOQgQNFYmAReyyPH8nYa7MRcuoYMAyHp8RDWIZvtqK1AqCz6jcgzqy1J6lrK4/Ce/I3jzaf2hnxd2QPqkJebQDgs148EveEeeeZzSoyfvzSX+dqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746899015; c=relaxed/simple;
	bh=jMyHj2bRFRLFLwnL0P0MWOlET2HCHY3sbBxhS0iCR5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2AF+ZkHG8LV8ScFixLXjRYoH28tLej0PeaIAmjPVzUi9TOP62z07Dlq1AaWFKiZyLL1Kea4AStnsQM2iJDGd/3gvjGumlZ+2mFboZvMEpNE2T12PuCbaA0nIipgQQWxCEekKZBGZAHjGraaPhjndOlEB8UbXgjp/yTI3JQ11c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJhO0HEg; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJhO0HEg"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so6850876a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746899012; x=1747503812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XudQIlWXwf0Ka7UaZjcMta2G0Y3PX5txiCv6+/rb6yY=;
        b=nJhO0HEgtRrzj1/EXjAyjs2k7a/a7PvcVatWlbpyCuYqasG71U4yWiCcdLwwipYBrJ
         W7Zz53X8kcKveyIKqslQj/lOOofgk5EsuVBRHksmWuy5h51HKBwqFTT94IHF82HUXhbb
         YAqiN8GkSZF+pyoH3qAQQ5EARQPnOPw2TsciLzq9MUi/axOlhnhLSd62TMvKI9xd9SN0
         CmPu7vW7s+AGLENL3QF20BvAob+oEQRfxIWYspWMytyywhuNWIQ3RVaq7vqgGTmkIIj3
         JupHkbISgouFEm71eRHaw1SiXrWMKAXKO5MNUr5UI2Bj3DWW2iGI3fXr9jB6tBWtkHrf
         qFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899012; x=1747503812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XudQIlWXwf0Ka7UaZjcMta2G0Y3PX5txiCv6+/rb6yY=;
        b=s11Gx3QWLzuIuxgja+37sUFzE13jhD+sRRmj4w8Xx+VWc+J9Tgfjcv9boWY5qvKcBv
         dz1AWMlVvr7BXqKdTSHvsfnL7exu3k9ai8GRY1hJwOknE4gCOsfeyTB5+JonH8Vqm6Me
         EFvvoMo1IR/IBlMKjzGs3ju3tNNCvX6MFuqXfK2WB8YleiGq5IIo4uglygbRSNYT/bnV
         dtl81y65zy4EMlIFxgSvRi9c6erkAbX6rdzUh33iX2vNDoZQkmfjkQ5Kul3I1YaYO+i/
         Fn7Y26fNkQStPEOx9qBIdEJuA/KtctCh13T31yFYLT0ttUWlyTsftTO2ZcEeL4A+gUJe
         Vacw==
X-Forwarded-Encrypted: i=1; AJvYcCVpUOrbm+294pdrWATbD81e5Yd//rQRz+0h7LCi1g4Cy0QrNPmnX7U/QmEX6AuEbbUkoeiVX5MY0TcU+bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytfvxokL0u6cBbmpkgYyYU1cuwmozglWJAVXCrRZtRiEdpxJ1c
	KZcVeP6MjJPsebS0TxC8kxwblK387ckLdDl4EG3K/3M8xkE0wFJ1
X-Gm-Gg: ASbGncv3mqbhnlIYAn0+sKME8snavMXJXHmr+I/QaJs7k0weTNlQK69+EWsXPvFF7y1
	2ZA6bOb5sBYoR50jqreJQwGmG9Xr+nKAs6jMJEe2CXg2TRpzzOJZQDDIfFyQAn7l28Xf7+gpgBh
	CBBTjY+yzQwFuUVuR32Dixx7kO+k9huQHDhm74XWbm6naxOAtccpUKFobtU+UgeilB0X4n5+Gk4
	Vfqn4VQoSXKuzfo81vNgeIQx1yY9wBpGD80nYtYuo2k+o3+dDcKZ2jH7eewaKvQz5S+Vcm07omo
	uYrmmPBx+zCzejY/NlILcet98SwAQgDUnrKTQtFw/LWtPm4FtrzILWU9cXnYe9xt/Y7hgpVTZi9
	hLIjzJI6dbo3RzMouIVeI5TBuz0gcuLzBNd/r57tD+SPgVecKGI88PxkK1usVAuy8vpbvKRnTMH
	tVbSAXU78ZoYKYPC896kEXJw==
X-Google-Smtp-Source: AGHT+IFxcxlx2x8TBUFtxBWf7qjrNckgV709Zpt3md2UpCKd4rKDt0E0SjpeXSciSxXU3cEGDq4j6Q==
X-Received: by 2002:a17:907:1c84:b0:acb:b9ab:6d75 with SMTP id a640c23a62f3a-ad21b4272fdmr702172166b.23.1746899011668;
        Sat, 10 May 2025 10:43:31 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8608sm343613666b.26.2025.05.10.10.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:43:31 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dpenkler@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] Staging: common: gpib_os: simplify return value handling
Date: Sat, 10 May 2025 19:43:30 +0200
Message-Id: <20250510174330.297207-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025051046-ipad-overdrawn-8890@gregkh>
References: <2025051046-ipad-overdrawn-8890@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> But again, as this can not fail, why is this needed?

Agree, should've checked it before trying to solve the "FIXME".

> Start way back at the "ends" of the call chain.  If they can fail, then
start propagating the error up all the way to here.

Sounds logic, will add it to my check-list from now on, thanks!

Best,
Thomas
