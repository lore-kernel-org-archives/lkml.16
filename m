Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C311863E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750045279; cv=none; b=NpK+fwO8P+Nt9MyvwpogJnk1tzmrewrL71Ghiz5gBWx/IAkZzlZqpgrApn1majM+ZlBiSsJL2nvUBIDDHMe21i+fksa5E5Sa4AJOeCv8vcTry6nEPD5eIECA+IGgzZ05IfitS6t1P9pfvM81hNbzlZT4GJ1vSNIqb2oH4y8pMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750045279; c=relaxed/simple;
	bh=3bA7chCM15d+s8mDU6zuce2UCXcrS8l/DCUUssjA3Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVa6v0MRRX2bF7qOwco2/OQiBZqsaB3rH4p//NwrZ3jyU+XY4Kyxog7wDMxD62RNtH0ocJ+UiecfcteqPRx+a5s3Ls33Did/xuvOBQhlcJogVe1k4kl1/mQr0vUaqrQynozPX3BQu5tMgMTFXlcXkxBCFMkaylYrr/Nb4BCN24k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G66oOrwS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G66oOrwS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7481600130eso4409894b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750045277; x=1750650077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjwCIT4/G6OsPqKKNi7etA9BwyZ290LnHAyZ+vvEmLE=;
        b=G66oOrwS2MGU0RMPe5Zs1k7eICUqbR5cb48XzOizIclJ+V37lfn7bmyBcmB0Unti8E
         o5r9rN5yK2WGph9dfnxjNBEqtYkuEMuasXp6Q5QAg80rdRBoLURWGc7+nFON3zdXejSH
         ASCJmbohtdtTpjlj5jWDv0jEIIbwYzVtWhD5q2lLiIlExKhjgqDIWzpa4pqgHIjvEB1I
         K6ETNBrTuScW7M8NxAF19gqJ+/rtSfW41vm5N/lHsmq8XLG0eHyQAtLpECA3bHSNI3eN
         yS/UuiPCVGQLo8Ez2oppn9IbhrVJyPSo5HKEDr9Y8sTUPIuHJSb3keOwmZYl/2kkPL+Q
         FAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750045277; x=1750650077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjwCIT4/G6OsPqKKNi7etA9BwyZ290LnHAyZ+vvEmLE=;
        b=qMn7ZS5y82+fpKm8uMp42wtb86MvvCfBGyOC/cnXHW6cH079zwh9b6sgp0JkRaq9Qd
         /P1DEaBhN9oxnWVThA1Gh9wMUlRpvcz9lOJESkZ8LAg+O/WVls43DvwRBwr8wk8TX4jL
         OlL1H2QmisgO81Q6L9ZREuhOr2+7AUYLPW0GYjcqjQWQBULMBm3A+PZmVqqp2a3tX3M7
         /SmjqxWUWZfybS4Dt4n36gpIbEHYdG70X4EzZPF0Kikhuob6XNRG6QbEqbdp/tDWFyWL
         WeJOgehG2itPiM8RpJQkMVL/HzF0d/RFnXgHs/ZW27+F4uOMG13RCHE0CDJlzYALUa0h
         U35Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvAwc8EnEGNuRQlRGcTheU9379jEC0Q1fSCJX9gWvAhuemB0V+ALle+fudakbtGfHbQzFAlmVP4/n5b+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIblYqqp2az+En53YDESXMMtd4+esP4ZtNnPDJyvd+qrAhRXUE
	VlYTK2cioXu6cNw+5Dz4kGUll6tU6ZXQB/joYetpTeX73lslXLjlChxw
X-Gm-Gg: ASbGnct8xTXGunuIGnm9VX4sjg/WlcgbIzxIV9k0pLJ0zgXCZSuzHq1rnGkYx+tJysR
	nZUer7Jm6LipdVnqMi2MucfdBPgtPgvTVR0ypJ7zF0RwnaJjKpyitczWCfRe5XeXna/3q/nEM6n
	P/pRnu+2LT28iuOThYDs9ePqQ+5gZEAAt70Rt4w0Yt6E06BnSfXua66HWoyAFP09FPky4Nfdgv2
	YC2NX/SmW80tzyVqTbW+kGO9aHjRuqSW5ldhzFIC7OZ/KT9px9RVxreKHTLDtML6TkBrq0zzr5I
	RrmBOqm0vamcGFy+yLotL197aexwW5PFeJRJ+7yYmmYD9LDxPTOh1m/n0VS4i4dgeeSczBZDaVo
	DswaZ
X-Google-Smtp-Source: AGHT+IFoXXdADq54s1YJVoHHCyU6912PkQq0oVs1W/N3IeK6HcDSKJErbEsGyC7KzvI7wyF0q8jdCg==
X-Received: by 2002:a05:6a00:2286:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7489d1999famr11297185b3a.21.1750045276897;
        Sun, 15 Jun 2025 20:41:16 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b37ddsm5809347b3a.134.2025.06.15.20.41.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Jun 2025 20:41:16 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: nphamcs@gmail.com,
	hannes@cmpxchg.org
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	andrew.yang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	james.hsu@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	matthias.bgg@gmail.com,
	minchan@kernel.org,
	qun-wei.lin@mediatek.com,
	rppt@kernel.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Mon, 16 Jun 2025 15:41:06 +1200
Message-Id: <20250616034106.1978-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
References: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nhat, Johannes,

>> The way you implemented this adds time-and-space overhead even on
>> systems that don't have any sort of swap compression enabled.

I agree — we can eliminate the time and space overhead by refining the  
code to hook kcompressed only when zswap or zram is enabled.

>>
>> That seems unnecessary. There is an existing method for asynchronous
>> writeback, and pageout() is naturally fully set up to handle this.
>>
>> IMO the better way to do this is to make zswap_store() (and
>> zram_bio_write()?) asynchronous. Make those functions queue the work
>> and wake the compression daemon, and then have the daemon call
>> folio_end_writeback() / bio_endio() when it's done with it.

> +1.


But,
How could this be possible for zswap? zswap_store() is only a frontend —  
we still need its return value to determine whether __swap_writepage()  
is required. Waiting for the result of zswap_store() is inherently a  
synchronous step.

My point is that folio_end_writeback() and bio_endio() can only be  
called after the entire zswap_store() → __swap_writepage() sequence is  
completed. That’s why both are placed in the new kcompressed.

The use of folio_end_writeback() and bio_endio() was the case for zRAM  
in Qun-Wei's RFC.

https://lore.kernel.org/linux-mm/20250307120141.1566673-3-qun-wei.lin@mediatek.com/

However, the implementation tightly coupled zRAM with reclamation logic.  
For example, zRAM needed to know whether it was running in the kswapd  
context, which is not ideal for a generic block device — the role zRAM  
is supposed to play. Additionally, the code was not shared between zswap  
and zRAM.

Thanks
Barry
