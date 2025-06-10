Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94252820A4;
	Tue, 10 Jun 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543871; cv=none; b=kDaHQ4CtO3PDRnMS9cG2DBaofUUlfAjPQPUXqifqrOlJt+QUbwm/jpvpLPasyyo3zURCWq8OigTO6GKnSBT1gvF9fTD4QizYnmA72wCkh60mZATb8P0NGDtiuYeCFi58j82yzw204NV+Gzpki0/eRgs82Y81L2xFMPH07bWZ8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543871; c=relaxed/simple;
	bh=66lxnOdLEeO03f3f5flu/jjR23hhyoD7CI23MWhCBmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUxYkpIqyWGhKtOadGLQV2buZpwiQ0jmalpwZ5vqGm4pCg0yG3YX8TWHxiMQDoVcanjkjz6RSHkZFsMEx+MRJ1Sd9Qd2TNfe4o7WEayglKU8IMOb5eV9FDFuWU6jnyoIiDC01kUSvddwQsGzPZ5axEJZzTAjHktzmRIX07o5E3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAglozZL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAglozZL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a51481a598so2973494f8f.3;
        Tue, 10 Jun 2025 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543868; x=1750148668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqQEs3AYaoL0gKOjKPSZkWHvVXObTv1esvtISy7Z9CE=;
        b=lAglozZLS4vliTD0WAUlj/jm/JzuPUyV8GVgSYwDAaDFwJZNaOkx6eGeSpTf3fqVLa
         4apoEj6xd/eJ1Ib2T5onjAf2lKmjlcauJeS2wBUlHailm88qI7RLMqzbZ9F6ercGKHns
         zSIvxGr3ydztiyBEFbymHbf1c4sJdfejAECsSVxQ3kgAZUJbAh5xwyRCiwZYABNs+1cr
         BitVeDYd1T5pvHzoPcCSGOtOl0VPAT+TUMDLNILB94W0YalfkT8cAFmEwHHSdWKxv7Th
         nyLVFBf8+zbQ1IT5Dfpe4Ln1h/yNtDhdbTASvSpL8gdmCGqAsFJkwUuo/MDjoMQfpsWP
         BmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543868; x=1750148668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqQEs3AYaoL0gKOjKPSZkWHvVXObTv1esvtISy7Z9CE=;
        b=IS2zlVZmAxUY6cytYe4L0af8yRB17uswwIbFj7iDDPOnGdNjpTfdfVE5+K9Mb0BWLZ
         6t938qtKosFgPuLmCrAs7UfgjWAJAYXMkLhUHCo7B0fEbdc5oK91Ucn2HiQjTHAiDu3m
         o8q09oK2gP7AGC2Lv65N5+ASb47qupheRg8IqRjGuFJg62RILaI+EDrkQVTKuESu79XV
         UsqZ3iJUB4ZLXidAVD0l/LyRZRKdIt+4uWY1ZdU5sD1pgWq7MUPCFXbSw+a6Who16w5X
         rOsxy4l0CLUnlBi7SbeyljRfX8pPEvdHChnxZ1W8pByyRgdL5UqzqbWENMO6Sn0n4lnb
         7TVg==
X-Forwarded-Encrypted: i=1; AJvYcCWLZXLzXRdfaDTUj4DAkinJwt+Da7lqeO8BMrLMnkD8qPpR6yULsLTxaa6weGdZvy7G9PILRlyegXFGJsJF@vger.kernel.org, AJvYcCX8E3uYXXLjVRcyT8qv60z2COzNt4ncnfMu7qGU54+tjJYgsuOM2sjOz1nSny8UlHCEMpPAlxpvI7yd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLG5Z/EGyw68gwW1lDvEe7nt4ZTsiUesgXr4yXdIIs+ex6Hkm
	T9W+FB8tB3XsBwFrmBbL7A2BS3KmcpNY8Rxe0c5UA9hS4QZdIL1/4jXf
X-Gm-Gg: ASbGncs6SgGsCPV0MuF0vAzuViJiq9vBDBOzAP5cNYiIs/K8st64dEQfReHzmv9DyJa
	Q1S8PwN3UvjCjOY9Ziwhepq8Xqc6QluFbYsZ6ThFumfG6fOlxFPEBK0mFOkjJG7jXJC9i8FXIM7
	2z6puRFNI1Jvchity8ZY8XXNjGGk3SdXZbl/BRQj8a0KpXN8APSc7GK4W/KAE/WmiDjbb6NHKP5
	U9yDknLQbHowqA9gFBhmiEtVowCweIaFHHZXfui39Od/Z6SNcdYVBoKc0w67zhvvtnjRfcru6uq
	PeTdhxObwY+S1pF7o+kVX90VfZQsJAlCZjjHc4/cRX7UZh9ue36VxYMVQifWQsQPDov9wmLMRFt
	18iflsjpIA4I71ROjEJIeYA==
X-Google-Smtp-Source: AGHT+IHq0yyKhrUtImiehOp32y/Vb9Nwaew2THNFw7WC+A4KfUrKVNKggo0D04iVTwMH9yptoNgA0A==
X-Received: by 2002:a05:6000:230c:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a5317868f5mr12249227f8f.19.1749543868010;
        Tue, 10 Jun 2025 01:24:28 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-15.web.vodafone.de. [109.43.115.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c08fasm11402462f8f.44.2025.06.10.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:24:27 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: krzk@kernel.org
Cc: W_Armin@gmx.de,
	abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Tue, 10 Jun 2025 08:24:25 +0000
Message-ID: <20250610082425.3368993-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610-spectral-passionate-chameleon-bc0b4b@kuoka>
References: <20250610-spectral-passionate-chameleon-bc0b4b@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you for the review.

> > Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> > ---
> > Changes in v4:
> >  - Moved the binding file to the eeprom/ directory
> >  - Updated reg property to use items: with per-address descriptions
> >    instead of minItems/maxItems
> 
> And the rest of the changelog? Where is v2, v3?

Apologies for the omission, I'll make sure to include all previous
changes in any future patches.

Best regards,
Abd-Alrhman Masalkhi
