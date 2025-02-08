Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDF28F3
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002936; cv=none; b=VRm8oGRts4uGt2drf6LjrLbKZz7NIVk/vweorH1MuEiWyxNCCBkcM1svPSgI0zQTkcUSXq65xZUesLx77s8viDT6cUSDKDjuItLjX2scCRvCf0uUD/QqtZSV6W2GABjOUa/VAWOgVV0q7NOk6+H+jKs6ct+Cuew/h2QMvvcUQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002936; c=relaxed/simple;
	bh=dea/caygRkf0ohCBT/wgvhQEkyz4Y7WezMkAT3RWjp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrkJynbjzpfi+/THJRTqV4I7xgINz5mutH82GLgappLTLnAuMT5oipw9YXx+tRrHYUhm1YW9cx9wSjwgKfGXkN4ujII7T0esmbHw+u8JK7U4AbZnPaKDmsZGnmEqdJ1hKghsjMMgjRhkyvEIw7WiKZfRTaYH0Au9dq2YgnQ/eGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNRmT1aF; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNRmT1aF"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-21f4a4fbb35so32375005ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002935; x=1739607735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dea/caygRkf0ohCBT/wgvhQEkyz4Y7WezMkAT3RWjp8=;
        b=ZNRmT1aFx0jyftkOaJe8z+2MttMunLw3uAzRqFBYdCEWM93+rwrCZKlRoqEeQ3TYdK
         39OXBsAW/Evtbu9ZUq57iaSb94etFgx2iwc7p2uIQ+IoIx31YBZV0H7SFFm0NqAKQ02i
         m0cnX42WGbcrO1jRTFY6UWZZ+1bwg29d1PgBP/fxOd+N2CJKSEZ9Vdatm5Ws2E3QOjSX
         C9zcLUsre7/QId4rTSOlSFogjItLEF0MYDLqtqPwhFPARDpRtMLYBArMA7OkrSErVrrf
         OYMf4SDI4iFRcbbpuyuSOY7c+0IENHj2Te30f4bY4MVDhpoIKGDPpajZpQcb17gaPIXi
         hsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002935; x=1739607735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dea/caygRkf0ohCBT/wgvhQEkyz4Y7WezMkAT3RWjp8=;
        b=wafkY6AXfH2xrvD5nXrTx1pciYfLQSeAP6VMET7D2V9LERjkWb5Yo5hFoCEQWOv/6K
         OwbfA5SkbiUHQz/bsrBId7S8b3GAc65n7eiBstJQ/qoPDG19OszIoL5FENKrqEN2fWKi
         xkQ7FinCB94JAUj7Hb2T2paQS1986eENQKwxUEY4FioR8qg0MTD8UpmXvQnR31urrG+N
         xO6FD1sjBlvkqqPXaz8aGerDCF5JKO92qllaxgVoEbnjABV6sXUm3uoq05cXny1pIxz1
         utaH7x9J4QZpdqSlc3yt5k/GaaOcmSWbAyaVppsSwOwLDMaUtmDVoFzBqpZFhlnmF+WW
         ngtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjXEK9tu+MTxHuNbm2qrEv1s/f1NB6kXpNB8tZg1HLj7Qw7ypSB/jJC82xPpbuH4zFU8HRUG2kU0n+gSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/EsS9DvfVzs0HVxTpnIp4WMQl+xJ9lR87t2ZrZvETPfYJEnP
	QByFkfAqHA4YiOHpeRoWOkbTFXjtppbDdepN9d/NAyIRXOtaBhgj
X-Gm-Gg: ASbGncuTVuEysvofJZemCeab3iBp6tbXvLaFlTxL3u1m5LI16J/r2RbqEuXBB17OKU1
	6m3shir9ESnawpQ7c/RBnC6/pjL5bsIe+pxo3GaVTc9oSxIjFq1+jIAzVgWvKJFyUx/EtIdFRgF
	AH5QJeiP8AVlTNzOMFtBQ2uZ4RFKxOrD0xdZh6Cd2kQrYYH8NnDq/4fum0lU5WJfn6b7RINoWyi
	IO3eOSk21MmGc4SKMWwqqyTtor5gtpttbW6LM0MkgFZOuyF8PtnUVObx9Fp9PPCYcTq4iiVuYkj
	XRcyUFpKmbAKXbQdj3fulrnWW9TvZWaoF9o=
X-Google-Smtp-Source: AGHT+IFc8QjALKGHOGJxGi2KaSyaqbFFL6RWMZqwHaWHCN6HaPjf3mOOgLKYXcIdjDCSW6cPE+N3Wg==
X-Received: by 2002:a17:903:2b05:b0:21f:5cbc:8077 with SMTP id d9443c01a7336-21f5cbc8166mr66178425ad.24.1739002934828;
        Sat, 08 Feb 2025 00:22:14 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e58sm42519955ad.10.2025.02.08.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:22:14 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: vincent.guittot@linaro.org
Cc: 15645113830zzh@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH V1] sched: Cancel the slice protection of the idle entity
Date: Sat,  8 Feb 2025 16:21:26 +0800
Message-Id: <20250208082125.18973-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <CAKfTPtBAxgBkH4f-c7sHQr1=E4oaFRnyY7+dh41_ONqi9MEKEQ@mail.gmail.com>
References: <CAKfTPtBAxgBkH4f-c7sHQr1=E4oaFRnyY7+dh41_ONqi9MEKEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for your reply and guidance!

I have submitted a patch v2 based on your feedback:
https://lore.kernel.org/all/20250208080850.16300-1-15645113830zzh@gmail.com/T/#u

Looking forward to your review!


