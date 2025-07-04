Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A2288C8E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636104; cv=none; b=UFWjRuwR5Usx2z8qSzy3TPxTEt9hFxaisYtxPLB6kiVzcXd16+SrtL6rlKqj0HmKyguogxB2jC/pcIOQYZ7O+1fki/KEUqF0gJAIV4uJp6Pfp1EaqM1IhKD02YRwvhY9drL9gXhMTUPayZSQZg8Qs/FFTDiU7l23k2BYaHSHWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636104; c=relaxed/simple;
	bh=r+W9e+IRHVkrDeRIkx9Qv7LNbjCKe4R15a+/C19zQf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYiHpS0sXlIFC6/LB+Rgqw2XyxWqHsYJy4MP1ujt9qz8bkoAOLzLxBvz7k3QkjXXuSo0HgOOsnU6aosBF4UDarxd7ihMTQuuDPlksN3U3wN2aBIpmrkEUIDJpDPpJ5j02bJmdPsai27bbhfTJsMInpKrQYjHcVoqyqmOHkmA67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7mSQklp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7mSQklp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so7284305e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751636101; x=1752240901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hnPhmdTRmdCsUnLwB5NFDmheZGNY+q/iIGXgQRq+iZ4=;
        b=H7mSQklpEeOGSe+xHcwBfSpUEPuhzvdfh6yJtFck7R9Nnz9chbUStsEEkq004NHyXq
         ect6bGW2/6+LoKvWsh6xWdNAKwllxn5ZMXROIDCNKmePNqXQFSBVP5vEh8UyM2ZhfOwE
         23MqiW9hur7XocGIwiaP7ftlI3Ol1/0gOb5/9/UflZWu5adPi1ZH/734fJ6UiPq9qs5N
         hgiFdMH3+RfXWzQsXYf+nWZRPwNZtqm1tjAI+a+XKiNxS6ITYJGDx7CV/mj9DqJDUafg
         sK71L6aet63CSF7IJkwzaMVbqXOjq3ITZyPvnGULqwp5WKAwEgYG0g+v+BLqYdffzSok
         SImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636101; x=1752240901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnPhmdTRmdCsUnLwB5NFDmheZGNY+q/iIGXgQRq+iZ4=;
        b=bPmKA+91T54LGcTLM6AtGPjzl34rVTzjUglsuC/1fkTzNv/WpcO5zQuz08tewcY3AW
         uMHqWfAqrwfpYstna+V7TIiyRs9p01GdhCnJReGm7qritnIfDOO2aZekg43KhoRj8kXC
         x1uQ5+WbMKZCBpXBiy3+xLHh2E5iuIDtGT9XtyqUPiMeVsKXm2NeEz//4a9ni0n1p7d8
         OQirazZPOlzU0PFEcO4Da98fAC0kNCurIVLSCap3WEelH5Tl3kSY4U2bTyIvVRkfhZ9g
         s0f02spFY1/NPgEN+6nhWpHEZzYuEw/+Db0/rnLoC4mkygGe51Erno0ilYnbRxBrbHxn
         f9TA==
X-Gm-Message-State: AOJu0Yy6qe3FUaMRnm7swMZYlS2JajrjoKwIB0NQ4QO/O05BMKf3F7Pp
	Ia9/nYuWniaBx3sanMjg7sP/3usfqMolLEwon3fcSw08fzmZb7LghGZ47vEHHQ==
X-Gm-Gg: ASbGncs4X/30oimcc3FcDGP0z+b+cedx3fvFS5sNNEtEHQwXxEufrVPbHjnu7XSiPwf
	a7w/GWA6FGDIuGzHPicb5bfO8O7mz+rFsZhfNqqkDI9hXLPkI01L+X297GkatUlts5s3MvvK2wS
	BI5LaEBX609O4aSzWZND5nOetIkxHL9s02Y2HJZJquTtMpGKLOJpi2s1mTnxuPc2JWyoQWTvjq+
	sZMWzlmaHB6WAn4z7+R6FBqvpUWVxoNkYy7T/oqEcOGhMq7GoxSzBFvdTbLDsVEn3wPmbrSYCqS
	h87deChxvQhA+hXK4B5c3urEXnMDhpXWiNcyuG7qd7x8Zqhc7MpzOTm8hyFBLPzu4TeUwMcUjdW
	GyfBR0rVSyhOMFnZd2mbf3RkaVemG/BHY/xaxTw==
X-Google-Smtp-Source: AGHT+IH61RV/x8NPyHLBxWvd/EQnI2VZSfwd68e51I2lRrpzG8eMEQDzFJoWVVz5e0NU91xptJnt+g==
X-Received: by 2002:a05:600c:4e8f:b0:450:d614:cb with SMTP id 5b1f17b1804b1-454b31158e6mr24923295e9.33.1751636100766;
        Fri, 04 Jul 2025 06:35:00 -0700 (PDT)
Received: from nuc (p200300f6f72c4000fa633ffffe02074c.dip0.t-ipconnect.de. [2003:f6:f72c:4000:fa63:3fff:fe02:74c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030ba77sm2553131f8f.17.2025.07.04.06.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:35:00 -0700 (PDT)
Date: Fri, 4 Jul 2025 15:34:58 +0200
From: Johannes Thumshirn <morbidrsa@gmail.com>
To: herculoxz <abhinav.ogl@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: mcb:[PATCH] use sysfs_emit_at() instead of scnprintf() in show
 functions
Message-ID: <aGfYgsXUPtlr2pM2@nuc>
References: <20250703103241.10199-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703103241.10199-1-abhinav.ogl@gmail.com>

Note the [PATCH] comes first and then the subsystem prefix.

Ansyways, I've applied it and will forward to Greg ASAP.

Byte,
	Johannes
