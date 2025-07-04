Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E41D90DF;
	Fri,  4 Jul 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642695; cv=none; b=OeVCKhze8mAP8qu5+qsLOPGx8EfANUyS+wcB9IRc2sIY36P5cwBMk3bOJK1P2v8bbWsAqIkdEeCgoxwOzvgc4FJpDz3xg7NlFSKzfeSWR39CROTPMDOUku8+FlzjuY/jIOkzqzBlRJJ8uwQQBCD+UYE9uF5ETIj4HpmknOu3fMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642695; c=relaxed/simple;
	bh=xAd35bvRTKqhy46h4g79JkR0vHUD07jpCvDljPjDKSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RehTv29J2jYC4XJetEHau48VZF79RmquK/seKDK8krwwx0wZFfCquYzpDsgJ19/BSmsVKvwLW7yZhUriyRlUB7105K6cmwHkxXr7339pB37WiEfCyYxTeRfirJtFTchyLrSeHpV1N2GVMSV4HScKrL6XyoiCvQIvrikIjypJ7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEuzVTYy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEuzVTYy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad572ba1347so150223066b.1;
        Fri, 04 Jul 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642692; x=1752247492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ej3nCbFn1XbsBpYqHQKdTumXsRWi+Kro1lNdGeFzJSM=;
        b=iEuzVTYyIGLF+beps+Xa+40DkppvCgux2RvfC2rM7A5QjX6GC16xzqf4eFR06FaHDx
         O19aCJY3L6zX+pybPs8qfMWZMaAcNbkxPA/B/1U29+IYGurWirtgpxhDWZX5kPKuwnmh
         drj2ES/UmoN3H7NXxNmVCF85LYfSu0tKfJNlp1eY8AiTncZ6WXD+vMTlb7yKq60QWrd6
         Exe5qmCeX7nvL/AJUfg9mTtW5zLMZ6llzM5t653Z2TTV65mzFE1EMipH1PmUJ2CWN2wB
         xSrXorUSI7R5GxXvnHKIs/humIsT7fS7npwh399/Y5MHOykX39RKMePFNWKcL6lXkRWx
         pQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642692; x=1752247492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ej3nCbFn1XbsBpYqHQKdTumXsRWi+Kro1lNdGeFzJSM=;
        b=pyiLK1+Lipgp3FdaFZWwxJq60DcovULe9NZq6M0nqwVb5O+4KClD3USCvwyAE+IjlG
         YM0+dq3yJGUTuRrkcoOQhnTurq+KJEPCtJmxDPgVwy378vQ+8/85Tzat9zhJlZHxR2D6
         yV3OiJtHw+IJCLzzLY1eaqGkcK+I6vaOP+bQjie2hvgrBHXUkZjBSZDI5mpAsc/99SlT
         by1Tt7rSDbcVc6W44HTNIF6cBEMZsqKqN6pTJW5vVYZNMszRlRcuUNiAGxVi5/rv+yWz
         u1Q8PCVpfHYElsfWNjJIs6mUwShl8Hhv7YABeHhLeae1okDwF7mHsqY9fg56wMsi1Rce
         SrJg==
X-Forwarded-Encrypted: i=1; AJvYcCVNQBuf58K8C0bN+kgBWWj7702pjEqHG/mU8b8zh9TPPFxveYzlQ517I3eCeSkDg92m66d6ra7ktEao@vger.kernel.org, AJvYcCXF211rFx17/62wSpFviOZUok91qT1KAmh/TdqtTeU3h3X5Ebp8lz8oYck5IPGfEn3ErbswVVOneNZeIH+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oQIyMBF9NKEFuqf5J9WRYGAyEcHdI84Ju7qZLRXtO1doTOCt
	q/xXrjEq79cfOzur/aEtoEPiTHoxLAgFiMwFYrkMvbhfwYmjxmCGagm5
X-Gm-Gg: ASbGncuL+WyvSgty78R742qqDn4f+intOTJew7DAEQVEw0N1rakQgmmJcuzH3k6a+jA
	au+24M5TJG5IgIfNvK1cFdsIsb9Qs6mPRYyJ4/GVIYlzkZN/v/pnqr8tBk78qgqN/go7ldKd6vl
	pvWt66fHYrsCYqzfyhwyxy1wAuRMLuojCgPm/uXPF9x3JEI5VEUIuNSOtXsyHcMcgKtbTTZly+x
	AT/RDii4OBDKJkN+wy/vU8G3bY8Q78FSVBSPybwKijofKLxqdUj3/zJMhJpUuecM9wn4u9FjkkJ
	1dqryZwjFR2S/ZUzhKRDFgwGwjw1kIh//FrCSJFCjrFBviqkUEKn/oUWPfJTTvU8uHU+aBVYL4T
	DdYhdRrd2Sq57tlLjuZSsPCu1/CRjMCxx6BHWIWcr3hkHcsZB
X-Google-Smtp-Source: AGHT+IHwano/8F7J4IZ7KXk0r/+3gnI1s2HpUjYzfPDb1NoCmRTCepUeVhiNl6KYkfterigM84Tagg==
X-Received: by 2002:a17:906:d54c:b0:add:fb01:c64a with SMTP id a640c23a62f3a-ae3fe7f113bmr251053866b.43.1751642691465;
        Fri, 04 Jul 2025 08:24:51 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6abfd8bsm187604166b.81.2025.07.04.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:24:51 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: krzk@kernel.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Fri,  4 Jul 2025 15:24:49 +0000
Message-ID: <20250704152449.12156-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <765c675c-6ae9-4b79-bc49-865e03d54fa5@kernel.org>
References: <765c675c-6ae9-4b79-bc49-865e03d54fa5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Jul 2025 17:10:07 +0200, Krzysztof Kozlowski wrote:
> On 04/07/2025 14:39, Abd-Alrhman Masalkhi wrote:
> > Add support for STMicroelectronics M24LR RFID/NFC EEPROM chips.
> > These devices use two I2C addresses: the primary address provides
> > access to control and system parameter registers, while the
> > secondary address is used for EEPROM access.
> > 
> > Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> > ---
> > Changes in v5:
> >  - No changes and already reviewed by Krzysztof Kozlowski
> >  - Link to v4: https://lore.kernel.org/lkml/20250608182714.3359441-2-abd.masalkhi@gmail.com/
> 
> So you just ignore the tag?
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>

Hi Krzysztof,

Thank you for the clear explanation. I wasn't aware of the process,
I will make sure to include the tags properly in future versions.

Best regards,
Abd-Alrhman Masalkhi
