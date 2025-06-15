Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C627713
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749976857; cv=none; b=DYYLQA8++yUq44oEI4d/6SjGzT7nBIZYvDmC+TX4rRMxA+cWpyWzsOVLPIb4Xryjv2yrpXqRaIqbquH/V73T2GrZYvmUO6E5AmqipEARXQroxhYD1I2YGoQF/BRLiOF8Tb0TcWMbGfnVFs0XOlszJLGfnP8gYxMmZLuCufI4iIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749976857; c=relaxed/simple;
	bh=xNtkeHyYn8cM4F5InM5NhdON4TpjZSQpR4gZOdJus64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnhTKugq0W/dlZCU2S5pOzXbKDUVZe7Tj5iyPxoG4x9ZOLoRnXVf4tqIwUFS+sfxOkY7NrgTeN9qN2LzoPpGKUilFM6UvTkPPKYcOvdDoPXr32nwRbIONK6zbp8brXkR4XZtjC8yZ/fskUtS60cg4Us3uMxZfWNqGmQE46u1/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1uvyX+Y; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1uvyX+Y"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so7361048a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749976854; x=1750581654; darn=vger.kernel.org;
        h=content-transfer-encoding:eference:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bf/f9V1uaGYy+ir778Ex6srRAmyrzkkdLjjrL7nO11M=;
        b=e1uvyX+Yn2TkL3bdSO0bTH4emxbHA1bhrx4D03ds7iUZI641jK3Ix/L8kVAgz7AHDX
         PpmHxmm3MTbiVmOlmTCEgvoOSuc973nlTd/Xli/mHtUMLxtUeoEOASThq3ZDXtq6qzoS
         IcxDSCBl6/DV4wvjHk5QH1nXLE4NHGJ/nZQ6P4BVCYwRyI5kMbXl8TKMBaht7I3N3LDq
         COHDAxeO5dZPkKvb7K6w1X6YYHSaetkvA93Vz57oAn8+u+yirIHWY3ZrHD83ES3AqKJt
         WviURwA46klc1Q2RuLL3Ij/T9GmKd+aOlyzRcX6XNbOMi3OTkO7CuO1Vuv6dp8LjpP5Q
         dIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749976854; x=1750581654;
        h=content-transfer-encoding:eference:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf/f9V1uaGYy+ir778Ex6srRAmyrzkkdLjjrL7nO11M=;
        b=GAfy11d+pn2WZvT9FNM2UWXae8H4hnYA8NXS20Ri2fi1lMUQUA0XBmHwILVZoXb5W9
         KJStlUe/XHUIG29XtxoAy71qnjs2QsL9/wslhT+AOUjalj58rXMIL6Sw28EK029CnzcA
         LcIVgrqdgrXkZONoa8qAfvMew4mFSf/87IMIzIyxkkliRsHlR45n9HhxvzxZgnaa5Eoj
         jRO2RkNPJaA5M5qaSPldlTXPz2S7O2OdGeotZLC/W/ophelWoeHslObRmkrjFa3hwD+S
         geAyrUbUnBRZq51+GDE/kL+A52bvfsGrjc30+xX5P9HbBYgS5syRmigXyviUtc6Ff6Si
         /83A==
X-Gm-Message-State: AOJu0YyjpHwRByX6pZpwYdttz1BN4CPuBRZa2y5ohvZO7eJIhb50cVDQ
	/6mybpjmpIW7bp39tU2LHIzO48dv6cwWO/9Epp0cXB/N28ZD006lW/s2CaRCZw==
X-Gm-Gg: ASbGnct8Vq7O0ZNLGUfEAFhDrpLh4TVoaW5zOibboXTIdWca5KRa6/hP0KAlRAzkkGZ
	iQuvuIntSFKzI/ddeJxFfnxLtUu9UhThkMpF+MZebkClIPfvsQfnqUHCd+0SBFX6ZBBTSrQN9mn
	os4l9kzhijzDTt6/Y9M0DX6JeK08cFxy33b+CFzGcEFDMOdkIlbx1VbBxeGUjd/C45FWCdrWFt+
	YkOTbLFSJYo3eIafxsk83OjggGur1XHPqGrCsS9ta9k1osC/gpHDsD+J/gxund0B2J2XOOMu053
	4tbq50HfaVbNdp21EMSk3GKF7atBAReLpq+9dDc9VSGr+c8F4QW8YHFKRsvNvG85ruwBdhV3/J7
	NvCdZxiPDklcy
X-Google-Smtp-Source: AGHT+IGE3OjFugy+ySq8fCIsyECdl+DbD3YCssU9A6tKEeWgOn/AZmlElFxPDKKyswciNvMuhcluAQ==
X-Received: by 2002:a17:906:c144:b0:ad4:8ec1:8fcf with SMTP id a640c23a62f3a-adfad59abbdmr452198666b.46.1749976853713;
        Sun, 15 Jun 2025 01:40:53 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8929371sm444949466b.117.2025.06.15.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 01:40:53 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/entry: Remove some redundancy checks on syscall 
Date: Sun, 15 Jun 2025 08:39:57 +0000
Message-ID: <20250615084009.906-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87frg2q1w7.ffs@tglx>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
eference: <87frg2q1w7.ffs@tglx>
Content-Transfer-Encoding: 8bit

Since there were no much objection here i think we agreed with that, so i sent v2 
for this one. Could you please redirect our conversasion there. This patch was wrong 
so i took your last suggestion and improved it.

Thanks for your patience,
Khalid Ali

