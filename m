Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664241A8F9E;
	Wed, 16 Apr 2025 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789208; cv=none; b=VpXMkJwxHp4eDLhEypCKKC57D8tt94dInAPcPpPGrCrYCPtzH8Fzlhc2CoNnJFRpn4NIjZTQzjOtsIboo05PVlqNxuSlYXh4Q/RFZLJ/0GIsrlql7bfN1X8AEQ9lzWcOnm1/dN3A6Ujit229HjoprL4QZCYwBSjJCWk1ASfXjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789208; c=relaxed/simple;
	bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfxFQcSns/ukK+2/NMc6XYwGwySu/0+ZOJJ3TQQMpydfR5mMXAqKC3hvkPLs7holvPUkx4s0YQQ5YoppolMfsrKicvZMgalracJ2pZpf+E3i0gMD/iBw1WRYT5WeXvBcZGBydCeL6wdhwaNhDN/FELrVc54CrZVjEwgRCgT7KIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9GGMv+b; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9GGMv+b"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7042ac0f4d6so62054397b3.1;
        Wed, 16 Apr 2025 00:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744789206; x=1745394006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=l9GGMv+bDwARm7ExrHNAaUrsH0xXmScQIzuICVwJYi0XPdjt/3S4RJpaRqAlC7/2m1
         jfHPn0tVnQdiViSBZNDP2Wen167WZbrhDwmBTkSf74mbbHGBwNZEU5SDKixjUE+5TiPl
         umaeRZoT3vQg64HI0HhmUfRM3WqFQNIk4it05Qf/kzjxBGiZImOSMfmKoK1dkBJ+k8tp
         LhIyDr+YEwxUOp2qB85TVnXoTeKMxNAWl+ray5zmQ5dhuk1MH0+mIYdkZ/xmMPqXOWQd
         FqOYM2i6suRe9hqdICEMp51ZRSKwK+GaHTRkdGAtXNhTanfhk4T/LVskhXfyPKAkuEqq
         Nj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789206; x=1745394006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=Z6QMlWuPDLmtamX6qslqKU5PCTsQVwM7d3EeAKelXoT3T5XiMuAhavLmAg5WNMLupE
         YzPLbvlQgdVj3Msq9DuBSvcTiotj+H2Au9P3JDMYUuHw60DwMj3mfxDKDtaw2QXLYDyE
         QoRrNQGXkUQwLpj7Qzkl6R6MmHje9+tAQ4V0YgkL5KS5tK7LdyPLo//cYPcIXkHMZya2
         RNQ0WH7TSf4YB1pS4IgImSnHKPk8gCa+9b3qj4ie/UC3pxuSUp85fcjrRAhrNrpcKsN9
         UoOA4dgFDOoUsVjpGQXE9KOo/Mi94Iije+42MsQvYULpUNUuN3BjQwG3yyUOKuApAZr1
         EqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN7TfeiF6RvfhfSGQxUT1wboxfRB7HmKhs8MUhgdosJYr09VQG2PIIGCR+NtWKus4Q3m54hzvGO0UeS1Ig@vger.kernel.org, AJvYcCViM4KgDRhX5CmgxSAmaY5pxR/GkCOnAAZ37H8I5Wy3GXwm1iJkND4e+0xJbBsIwfakhdZyxOx5g1uP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Cy2nLmjw9gPB6DNFWgaW0jLJu61Tn3h24rgsiEKIBieDZkF7
	Zz2xO2Nqkvuo5OeSQJP5uzvblee1Skxgm0QWN/pTzSE9mnfokkmoBDoikJa5n9Pjd7x+uuLTxny
	BDdvVy6yqKH4Yc+lbNtDR2IILcMc=
X-Gm-Gg: ASbGncu3I66UUX7t7gmnjUB0zcJv3teUOBl1J25vyAueBJJHzJPRwFRByVkZZ3vV4e7
	sftTP1AOj6FIV1jb5r9i+Nyaz1kVNfMKpBlRq8n9KikPAjA/BG8rffHvRYaVKAHXXElUM/1DKgg
	f1QY5F/1Kfjg8iyyA0eW2EBceXdxtOfyn2rQ==
X-Google-Smtp-Source: AGHT+IHxbekuxWHZw8zM+wh6DzTFP8yHpFvuhbdM9QR05wWnGQlGmcOgzlNDdA0KhXBzuIW+VyQTVJg2vQPk1/AsoLU=
X-Received: by 2002:a05:690c:64c6:b0:6fb:8461:e828 with SMTP id
 00721157ae682-706b33627f1mr10607287b3.30.1744789206293; Wed, 16 Apr 2025
 00:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com> <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
In-Reply-To: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 16 Apr 2025 09:39:54 +0200
X-Gm-Features: ATxdqUGe8fo0djVdgl0BDmuxVBDLtZEU6DP9B-jNfmxJRRmqMcv0gVTVOL0H8A4
Message-ID: <CAMT+MTSqdzg9pBCW0qB1KMK4t9w0-fM=vRowO0kWVNqK9GtBRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 02:18, Nick Chan <towinchenmi@gmail.com> wrote:
> Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
> memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

It is good enough for the PMICs that i am adding, there are no plans
to expose any
other features to the os.
