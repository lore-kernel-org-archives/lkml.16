Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89739D2FF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802234; cv=none; b=jc8oLZUnxFPLzavHA2XF+CGYz4tK5i2jXxUCqj1sWNGpLMCpIkOwj7Hx8tfNR7Y+/u2UTsLPQjT7ODmUucPr6QZaaq1+v2/oDxeD6svt2fOy6Loum3/MvPtImUgTY9Jw1do3KalvRL5tSu7+eVs6JP6b/dwqU0Ee87wlEBdn7uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802234; c=relaxed/simple;
	bh=5Z4xMKpZQ3lBAbdfQ2sL0DdNJuiXEH98wodMhJutk1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qyBXNyGSxX+BCXeDq4IxNk6NHBj0CgPHUlbo2DVdJNX4P6BKvkvfjh1NxgqIdnooMT884cMPQVL61NnWOxMmwvbk063OwX19s6Le6mPuaVZgy9ACgPr4ZysOfk9tafsb1EbLf9Ce3wXIseRY0T57oiAIXcydwjoCJYlcIOpRMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PMVMFhuI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PMVMFhuI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21effc750d2so6295235ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802232; x=1739407032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mf9gALaToI+NxAqQsASvA6CATgLa2Ir66Qnk8eDUTg=;
        b=PMVMFhuIU97J3ZIggnkETkyzyh1Fv57cJhMdbq5seCOs9qhNfAjcDZHH+bkK3e3Q2v
         bWim9nc6WUIusWSq+leg94IgP7fM7jq1uvUz2L4l1RMdqVhkYABIYDMudInUrRGI1ruq
         rdwKaFAvXcQ7afQsCxq0RZL5bj5DMnbRjE+4iPZSBUNkb7wat/o3F/ZTvlOPLm6hkTg8
         fFQawJamKsk9v3OegHkb85FYTB5cwjPZJ/9FCvvFfh4tdHTEIAISkETNWdaXEY/r+sOm
         6yCc+18jzm/w0GQNOx9FLWL+yG1ygF/sL6DMm4DXuo9aHtJfnN5qZQ5rmhPZv+iPM0oW
         iPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802232; x=1739407032;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mf9gALaToI+NxAqQsASvA6CATgLa2Ir66Qnk8eDUTg=;
        b=XhO69/FyBtYWs1kQeJSuhmST9mNVoxrWyPr2F2quzt/coHEgQB1PH950iezYHmQoRx
         1KEq1TCc9rVGrvw8ScioUjVL2+dTScJzdTIGpTE457i16qBh2gpJ6DbC4rdbyb0iLzN6
         +nWytqhHFbAcLxsvTNDlO+WjnzmTwZB24OtNVCP+i8IH/g7IbnwgxKRq4ZCUNDOoZjLK
         +LJCtLZPInyiJwQuvhzcZ7i5pnzd+VfqfGuLDaRVB2jxd7yZ1sC2ivEp/qPj5W3U7PKv
         y1J0VTMTyv7q79QaOS6LPWiBgJzRZVs+Kci0F6HzpJbJXhI6wohkf1HPN6K/U67N6UnW
         WijA==
X-Gm-Message-State: AOJu0YzetkVmggflDH5YM5wXZpnJYYxTWlrhhgeb23JzvQh2nmBUk31S
	4V3MpAwUkXcd+jHgdimgTvFDqNi3i/qoL4WF1SO+Y0URMvYDW1u0RATiQZfqYyY=
X-Gm-Gg: ASbGncu6QLTLJEdPmk7JgHuDByy1e+t6KrsDh2NCr8rjMlEod21JbOzMw1CcGqG2d0U
	lo30ZbZyDv4cXEb/CFEtBCew0MWg+NJ+wRqi3lEUIniSRqZYUMh/AJ5RHGtbrqNDFPMUMYclNE9
	X9x8/e/J2IJHZ3okTYexwqp2GogqhbX3QH7CVQ1P6HzFIADxFCaqVcLHw3S40vRU8wN4ee4jxj1
	blpCvZ78GCA/3FTH0jK7HOlgmXSLh3pTruJhBetFoL2CHAYIc55RfHtnQUCf7xEsGdH22Y2/lEk
	m0CoXL5NNqPwXA==
X-Google-Smtp-Source: AGHT+IEB+PtnOUiRYqtGHWqMCkWeS4QmJz+ymWa/TmAkHEsEUp3fEiBQDPHMWYpJX0ZEQ4SEeQ7CWQ==
X-Received: by 2002:a17:902:d581:b0:21a:5501:938 with SMTP id d9443c01a7336-21f17ee3df7mr79414935ad.52.1738802231724;
        Wed, 05 Feb 2025 16:37:11 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653ca1csm107735ad.58.2025.02.05.16.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250121200749.4131923-1-trini@konsulko.com>
References: <20250121200749.4131923-1-trini@konsulko.com>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
Message-Id: <173880223103.2488567.7048498989184670189.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:11 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Tue, 21 Jan 2025 14:07:49 -0600, Tom Rini wrote:
> When moving the model and compatible properties out of the common
> Pandaboard files and in to the specific boards, the omap4-panda-a4
> file wasn't updated as well and so has lacked a model and compatible
> entry ever since.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
      commit: ea07a4775df03852c353514b5b7646a17bd425be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

