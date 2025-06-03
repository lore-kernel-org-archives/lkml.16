Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD3374F1;
	Tue,  3 Jun 2025 05:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929227; cv=none; b=gt2KzkeA0B8qqixX7XA3mVL7E7lev9mfChEjIeoHZugeCuaFfc8U2BmuEww2tyBW7o45tAOqkwzXf16aTuAo1W84ewb8OKalIEaXr722MY8qgX5T4byAlcHYwz3lAK0iwJgXe5kNxlwRcplAZK762SyPhsQusOFFrvYqU90Pxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929227; c=relaxed/simple;
	bh=DwYxn9vDpODMOTH/h4CocQx34sCVwHNa/e51oSaYH84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrK7UDNOYgLG4C/FcqVwt9iQdYn4IdvJ9sL4WOkjirGGDi7QfhAbjBI74onMksRd85aalQcSEw2JBdSYD88Mmiy9UWBa7YfYQhmYOQrrGz3UE9joSvigtbiMZf0N20tfvRorTQaZ4pQuFnHh73XZYqAYoNvMfr+sLC3/VIHX8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRgup8qg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRgup8qg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d54214adso18165805e9.3;
        Mon, 02 Jun 2025 22:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748929224; x=1749534024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TIC2bvXSPjeQjwa8QuCsDYTY0EZfD1mls4YldcSio0=;
        b=IRgup8qgh2gLNJfZruG+XV/3sFZYdQ47Lpqv9DvVsNDMaAcuGl7FHaRtx+yTHy9AOg
         7U9lH6lUyHvwH+6U/Ue0QYzrhK/X6kDWk/5AGeK4ok2g0YsHnFxed0Elj9xmA6q5lCnY
         rKX9nnSiW3Q5Q7liFGmSH0XG5xyB2niEzgh09DiDAzIO5KLbTVKYmI0fLfcuW3DbpdNg
         Cn7qPDb8YUNuU9MpuRsjoYA/hrRewM8xP2NK9GDyY039qOcYleYfNzwFBjv88/QanKOb
         ssitM43Z5u3B20ysWSs1IC7ZFeaYXNPw817zLhkyRYAdn2X4m5V+k3V6lk8JIBvzN/y1
         jTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929224; x=1749534024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TIC2bvXSPjeQjwa8QuCsDYTY0EZfD1mls4YldcSio0=;
        b=rsmsoSMcEvx1hwf8KnkOKJPp+KySHxCuEkSoz8naqUqB5TFIj0RTK/YD8dHctiR46B
         hBcJUyW6TTlvtAW+NHL9trA6nAxwn/cI/PQeDF3Y/RZPXr0CEeCc2y+bPCxP0TOnjF3B
         Np+/mD7NOj+/dgonRYGtyDuuwpv0SINtrZWVj60mp4gCEfHmmuNmsmdTXGYrQ2L5e9AZ
         XtIO9AI8JWNq7wl+erfv8QxM//FTgr7NJxgTc+36VayiaqLW6QK7YBk41ikwlm/j72Jt
         QI7MvVJkArVwhUG0al/C1MLttJcCQeyeFbpwOzGPec8zKhIr2ZI0985QM+dnvabQAdIr
         iirA==
X-Forwarded-Encrypted: i=1; AJvYcCVAu9WT6qe66YKKwTgMKcLswlmcLv/GVR5TxCtZHzgQJh63ItGlY2SiL5RUI9QyuP164+YHtr1pIhKi@vger.kernel.org, AJvYcCVv5NrrqKdAkwQP/09y2SST0TuWTSB2VLFxxGg6mBrulRaMBmaq5NOFPOROwfnJixkSl0nbjPFFtKmdONTb@vger.kernel.org
X-Gm-Message-State: AOJu0YyAY/6rE87e8EHreQLaLnkI0SYOLrwzSaLjbfcyJszqUA3EuLX5
	WhxuwmqxYMRatMFnDOsCdHK6jH+S9RwyqQ8Nqzzt5jO5VfcD4q5eGiPO
X-Gm-Gg: ASbGnctbfkUW7tVbVrlbW5oDMTFvyHqoZduRqdPx5dhbUoQgS3rJnel15ww8CkPEStm
	ZrLQaNgziepDuT9Te3mXEuRdNFH8pIPfwUqkb37pKshZKXh9sHPUdgeF2Ijycw7EIXRFVbKlG/K
	E3LQGpIOYu55uA0cz9kQ7xyXP+oE0IuC8ahyL2IMabGZX52l+IrlT+VtP3vx/3SF86bqg1w8yBE
	C7VJHSGPIX5F9Iwno/oKtK3KJDFwZPWg5n7AjVSczr9FtXGLtdvifEYrO3oB9dFj5RCexS9ZJEE
	T5uXtbCvKd0g1hQap/zgxIFFLJepInkGAWsCk/lYWnFB3Bklh+pwwqBwqbtbdHGlitP69TzI4wT
	2y2/G4Dn05q4=
X-Google-Smtp-Source: AGHT+IEm+DBDRYxs/BtdjDM10vW8OQRQhVgDKy5nrR+eNf7ewrHEoW8Z6836tRJmEeVTNyiNKjwEOA==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:d8f8:fba6 with SMTP id ffacd0b85a97d-3a4f7a3dc8bmr11491978f8f.6.1748929223590;
        Mon, 02 Jun 2025 22:40:23 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971efsm17469585f8f.62.2025.06.02.22.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 22:40:23 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: robh@kernel.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: eeprom: Add ST M24LR control interface
Date: Tue,  3 Jun 2025 05:40:20 +0000
Message-ID: <20250603054020.2030216-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <174879559905.2719478.15392001971491179573.robh@kernel.org>
References: <174879559905.2719478.15392001971491179573.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

Thanks for the feedback.

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/eeprom/st,m24lr.example.dtb: eeprom@53 > (atmel,24c04): pagesize: 4 is not one of [1, 8, 16, 32, 64, 128, 256]
> 	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/eeprom/st,m24lr.example.dtb: eeprom@53 > (atmel,24c04): Unevaluated properties are not allowed ('pagesize' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250601153022.2027919-2-abd.masalkhi@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

I had already updated dtschema to the latest version and ensured that
yamllint was installed, as advised in the previous version. i have
executed 'make dt_binding_check' as you guided me, but still it did not
emit any errors.

Best regards,
Abd-Alrhman Masalkhi
