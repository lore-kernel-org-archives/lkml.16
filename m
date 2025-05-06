Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6CA72624;
	Tue,  6 May 2025 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559794; cv=none; b=HGD/SfZFT7cse/T5xb6niNl6fthdqdbftsjQBij5vmEpUiKyNeKPSKDBw+toH6wJ1Z9qLJl7q61y7x8rWBVQt0nVY8f5fRjU08GuYR/CaE717XEY543OndG9J+usM1GZTme3HhGkT6vW0I1Gzsgo6FmH9qj9KBiVtK3nyDyvxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559794; c=relaxed/simple;
	bh=2Nr6xoHOYD2AZgbjEKQatn263DDeL2kognSV97Y6VQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHaLCLuxaB//Kg0/VhXYW7UPCaSPBgQ0bCNMH7B3TpCP8BMu3u/jJSv6cVaUePq7X3XJpB1Rbie8hlz6LGA2JstjmCxqiujkG2MP1TAYesvQvNKO9rmjm8HnaTrJr3lnPkphxPmaqBmFWp1GTmFotliIJEfeL+FNDg82Yf9OfLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G67WQ/J8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G67WQ/J8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc45dso95771575ad.0;
        Tue, 06 May 2025 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746559793; x=1747164593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpkYYFBreEWHOH7F3jeTr12XOgMxGnYzg9h+2a61kIc=;
        b=G67WQ/J8mqmh6TZFMbw3IjD+ZRKT+wU6EamiqI3JDObUDBFLxUZmRy4JFAiX/HOrtw
         vqYQ9cGJfuXGJdn3e+Mx1ZxYrd9PsGL5OTcxJUAvsrsfyPrzMy+1tiJc8uPr8uif10ar
         HmWDlglRxEjwRr/8mLCv88Lp6bZcqkwMdhRLuMzu7ayzsZFpcUOAnviRdms7qp93DO4M
         WxGxyNkptFrRPElo+WeX5N7iFE+RSDE+UqwjJcFUWgWuwrualvvAW/AcH53qHdrAAqCm
         LXwADdbEQvOpm7M6kWvOsNVluyJR+ecXDTqa3wC5ZzBZxTFyA1eY838lk2/Nes3KuNrp
         GRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746559793; x=1747164593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpkYYFBreEWHOH7F3jeTr12XOgMxGnYzg9h+2a61kIc=;
        b=GWIpcAkacA/a9HEihGqdm/Ict9Mnqv/pD586verkhjevg+bL4BP0kw2+JyoveoK0yT
         tuXUPeo6CfR7iPkhy4dMIWnfot9GEqIRRmrbITjg0s0ILH0+xeZvsHi+w+2QLoSDzcpT
         lQY0oN+oLDzGMzN7zSKDybGhhDxxh7tSdUSNjc8oF4jzo6a0Gb7sdRj24zHZeSX+Gf86
         FsMWLHKPueslHWMbOKH5HdjOMC0WnSGyXHurV3Ll+emKDcXnKcY+1RWSSVBPbh8wJUEY
         Q3GjuBAjMaB3OeOren93VnYlknoJgSXTuZ9pD0YMurMWpuW/YDmu90Ecm0dqAJ7v2Y9+
         1GIg==
X-Forwarded-Encrypted: i=1; AJvYcCVU3xe5bcraLu99thFJ7Lh6Rl+S65pAwjGrQj+n0d0IyHM22Qr0fRlx/nc8aHe71KDP7zXWDzaPBqaqTk6f@vger.kernel.org, AJvYcCX95Ea3W3V+2bEr19ersGI8Ty3Cu3pGnKyt4bDbhH2YfusBqmiGeZRVkak+NC3SIs+vls0irPqwh0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5HysAD5MjCmerEIoJjK6PFHF2PkZ4QY77dj3pryBySeLm2gIJ
	ykphs1eoWgHssbHRLL6JyRzQ1b4fb5vIM9WSQdYmO3vKq23ac+QgB5FzGJo7
X-Gm-Gg: ASbGncu3mKprMrVd8aXZi9xkkoJUU+JCudnldA05yBGYgjfhReABh+sAmV/50NAbKxm
	WtwQjA0hwh1plEwZpQrpxvpHigFIw5X2CwtqRyIT9q865OU/X7i2P+6841V27jNhjPcKdPVDMVa
	YQ2R5LdveETKCLNz9YdAg1u8oHupW20s50Ubdj92PdCuemntb0lu4sR/NENRXG8GXwj7B43asgL
	KmKVqO27HKWpHMT007PXGz2RIWw2N3zGFUX9JVtWyllqQ59Ca3p6guBFbmeUVzD9B+t80pVAdBs
	oWOzaItc378LuwOHFgHj7thz4ebK0D79yKkzS9O2u3UQIA343ODR
X-Google-Smtp-Source: AGHT+IERN6pWd7PqOdXnAVYxBJizmywR1rfimLAvRPrCgrDfgBt7psbyQxn7CavgvmMOvMw8Rl60aA==
X-Received: by 2002:a17:902:f70a:b0:224:13a4:d61e with SMTP id d9443c01a7336-22e5ee0b785mr5732955ad.51.1746559792808;
        Tue, 06 May 2025 12:29:52 -0700 (PDT)
Received: from localhost.localdomain ([104.28.249.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fca324a9bsm5264577a12.0.2025.05.06.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:29:52 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: Re: [PATCH] docs: align with scripts/syscall.tbl migration
Date: Wed,  7 May 2025 04:29:00 +0900
Message-ID: <20250506192900.1547017-1-y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87v7qdx59u.fsf@trenco.lwn.net>
References: <87v7qdx59u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, May 6, 2025 at 10:01 PM Jonathan Corbet <corbet@lwn.net> wrote:

> So this seems fine to me, but I would feel a bit better about it if the
> relevant architecture maintainers and lists had been copied.  Could I
> convince you to repost with those addresses included?

Thanks for the feedback.

I'll resend the patch with the relevant architecture maintainers and
mailing lists CC'd, as suggested.

Best regards,
Jesung
