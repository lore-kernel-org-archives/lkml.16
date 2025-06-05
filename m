Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01705680
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095991; cv=none; b=TEkuSpDpdxcawyxK39eU4YJWpckJDofikKEBoyHb9SHwpq7Vj+2dXtLFQYTC9XXtmAgt0sXj6b13J7yfbobFfXgMAZtfXwYUP504RGY6lvfsn4zCxG/5a3YF8uW0H0flBT4Hqw2AAnRZDURRSumwOy/k236SiSgW5Mh2qOVi564=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095991; c=relaxed/simple;
	bh=a99DJB7kgqKr/Mq3XFCGHLdwCFggirioNhGpFPuOmrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqLhFsJmxBbZ8XQW+qd9fvumzTCicsW2PoSMTvtTTuAZ7zDQxR+3fGFGPan03dzUaExOFJ1Xf05Sr3j6WcKCwIJcA/RdzcK7Z5Vih9MDBsYm2Gg+zzC3QKMNbUCraRknyfFtpYG8YX63SM3GiOqAwMWhRJr7pvwlUPW811Io5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GUoaivs9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GUoaivs9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso474777a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749095988; x=1749700788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=GUoaivs9kiZYpzwlYhipgAbl+2mUua5o1Bx68wK1PfOd7ujianyReMF6esYRs6UyXt
         phfbKOWiKiJhJv8eSneKtwh3fKAp9wC1yvo6Ir75cnqWk8X9mAuwNVNRiLfaiOeGOa9E
         yxPB/z9q25hVBcHrvcU8LoiTU0jKlr8ICGkeDKnjWTp+pH1gM0yiBadJqPVRrzYK6jzB
         DYACxj+sGvOME5fED7QuIO+sCrLppUd5IphfwgazXz24kJeHJh0JrWv/aGdIpcApsFl9
         2oYLknrAwLI5kbrEM2LXOJowH3zFNl5wzw85fqMN6TxJquLmS3WXBUGHGg4FUuKHQsgX
         Mh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095988; x=1749700788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=DedWfJSuMZuAcPDBqFyHgFuCsjVxV1jX7tqtksCE4FX5vGjmzHCjLgxXyrd6jfgy29
         6RjAstC+uc0N6ak3Z364DaEblCOp1yA+lAbsIbUHvtfwlX4p0v8FWePzcaIgohOMDMtK
         MUVncmhvpWAK/snz6MsyJ9fwoX0CgYVhQZ/S9SVip8DPGQZPOTYPpRhkbIc1dYA6XWFG
         OWhuvPpFkDl7yyZmW9wGXe3OqkOMGLSQMs3y53JbDvYqKQWkCCd1rDWf6B2PSg9Y6v/j
         GC2HGK8O6oL17M7QkatiaHshHb8rAj711YLt1Y5yd3yTnWYzupePdfm3cojU4RpI/aIf
         bYYA==
X-Forwarded-Encrypted: i=1; AJvYcCUlTCiF7K3GydjCmJKFd+Sd8FEo5+geGLbvy+xEwz9408HEbjSAe7opsxVu6O7/B00vvygELdfHocQ4Rsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0tywHcyj/tKZckVTkTWkJvCMOST5fNU6mmg3+o8ovr8rP4dn
	1RZeIsnbWWe66l1QGIvCsV3cmi1j9e/ThsU/DMedA6YmSzRWiGAGFSWJbYBa+KP4FP4=
X-Gm-Gg: ASbGnct3ZqfURv3tDF7tz9JehznUKcn6cTduidWvfuwrkMJlTSpSU2EwV/wcvAF3g8W
	7cNCJha4kaFWWX6et1cKXtnmGcDRKV0KbApD/rzr/HveE6THnR8Xn14So2XFz5Q3nOfBEGPVFkT
	S1OmPDEgbGoETcY1gM2iH6umrvBFSW4TRyXa2hpOKecgmf1pS50t2/AV1hVeTLe+xWlERTjdc4I
	90/kl5snXCMRCGPLN/9YH0qkDXBTdBiOLT71Z4Utw5iuxrfXuahUcblXdfGvmbDX+LF51nkmxUz
	QpKPh3dFvPg9xixO4/VryA8LT8PNsq/uXmCvoU6e1YnEnakWIffhTnM/zSfVOlWH/vd9B3mq
X-Google-Smtp-Source: AGHT+IHwOv1nfgRYxTOZRYlHLTPEDAVKxSayaPRlTfw7ratzj7blGucqQmZiYitkUOV/1EwZKzf8Ew==
X-Received: by 2002:a17:90b:55c8:b0:313:287e:f1e8 with SMTP id 98e67ed59e1d1-313287ef202mr2764388a91.8.1749095987904;
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132bff66d1sm495400a91.7.2025.06.04.20.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: krzk@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Thu,  5 Jun 2025 11:52:33 +0800
Message-Id: <20250605035233.3394026-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602-elated-aspiring-squid-d27ee4@kuoka>
References: <20250602-elated-aspiring-squid-d27ee4@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 02, 2025 at 07:55:37PM GMT, Krzysztof Kozlowski wrote:
> 
> On Mon, Jun 02, 2025 at 01:04:15PM GMT, Chiang Brian wrote:
> > The RAA229621 is a digital dual output multiphase
> > (X+Y <= 8) PWM controller designed to be compliant
> > with AMD SVI3 specifications, targeting
> > VDDCR_CPU and VDDCR_SOC rails.
> > Add support for it to the isl68137 driver.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

I'll wrap the commit message body at 75 columns.
Thanks for the pointing out.

> > 
> > this patch depends on patch:
> > dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
> 
> No, it does not, please drop this sentence.
> 

I'll remove the incorrect sentence as well.
Thank you for the patient reviewing.

Best regards,
Brian Chiang
