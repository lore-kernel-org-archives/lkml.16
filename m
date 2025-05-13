Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592728C5A5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134151; cv=none; b=eVlm6CXgSYcuNRs7wNhV3B/PQjMbbc7oWaGwKSlSdceuEkInSHEJRBMm279K4dhM4gcqJUks+5xkdPQ0XiZkvJRcbDg2XECnlj3bTXCvDEGe79zpM3Z+qsXDMhsDsRYMLnoD27lcs/qaaHUz8+4Fe5oSPjjrrh7KqlqlvSwSHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134151; c=relaxed/simple;
	bh=mssKbIoY65LmLl/b0fCd0FyJzxFycEEFgEHhfJY3hHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FivwlmDEWqYz0PcvgfbEcQ1lKUo6ZoZYOTkTsthxbn+6mlbZzZQhbXDF/ZviW0cRh4yhqf5zOKmjIuftdc1YVwHAfV8rQxos2AOWkWF0AVGa4P9H2RGKlVIb48dj8QOodAprZcQIshgoMLrmpSl2nxh+WwlmZ/7VGctqGlMOozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EMoLE7XP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EMoLE7XP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so3775154f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747134146; x=1747738946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o26ZWiTP9c7iIOQX7GPOxDhZLUi1kJ7hn4K0Nn53HKc=;
        b=EMoLE7XPE3TTmkTn9bTQyZREiIRRGX7YVuqCWkphzI9ddUp97JommvmRhnOeydvBAj
         5uYo2197zoJvfViND81fRgVY9vn2k2iNuzcmZWZZFBA7dJcrrYmJiJNOq69n7mFrpd/r
         aRfIYYx0A9LaU3rMyYBThw/E9nw+83fs3APRrDdoTAKZdl8rAjrnQ/xCTOrm/3s3Oj6n
         M6am0bYek9vV7wDwNQsBudi1TEGSO7GkAA3Xz2ULryoHMI17a8npEM/rZF0mvfefoyvA
         q6bdqH2TR++reOoqgKQ2aEh7IOlzs+y1Nr01J5xCohyO1cOIliELvgIVqfJdJ69sHnua
         pSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134146; x=1747738946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o26ZWiTP9c7iIOQX7GPOxDhZLUi1kJ7hn4K0Nn53HKc=;
        b=PiZ6mDG9r5RWehUXN8qlsb5SZQRHxawZowca/IvvFgB3qDhWN5/BfbmjRp6zAnC2s4
         ykTHg27pWRiugsdCt1Vd7bPXu7yOaXQY71nwL1wwKhf8PTKdwY8wFa6/NbEsxi0SmsIY
         0H7FjeoS0PIrG3m93cKiPFCHhyKuMbGHKRGLS08PfsZjyJTphWgCaXocsPTizVetg+S/
         E8C5m/6g7q7CbyTKAEHL0+0VVF33d5aMlm/98Icl0YQL4G+oj5RIEIR9kSGR27vlzjQu
         5LIfvtGoF5ql35+xviZl+V6pO+5IdBo9Xc2oa8zCpf5UGUHmqWA7Kc6QDrzGuhrkor2O
         LJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1x7TdWs7OWtcwheV275pTqE6IXyLKCxvTbjbsl7Q10j7Jg8RZOFFNpGTir+rgUnVIWYb7Rls0iPCgCBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUXZ1wYw67PxxvsH96VdpYvdRnHjjkXUMzsoUdx9eeTLAIHpR
	SOVtnVdgKG2WUUzbGXktYNCGs2WMqS+j29DxdvK/hYLcaPkZxFrXNx8KLY+y3Wc=
X-Gm-Gg: ASbGnct/6mBrBv/RiA3g95M0uSVN8/iMTd7mvBf0B3lBW1lMw7n3Aur7P+8W3PnacRT
	lRuTnXw/DxP9ClGM4a+GJnUpQK9W2bQc9f9Tbsb4azkk3BVoHmOH7OQ7riWzNDWaHaKg6NjjjL/
	KOppf1sTU09P5owUT/E3kn3dQw1G82gKXYhWbhYWWsKNY+h5xxVf4OHZCaIupy5tUS4UDv69GuQ
	X31teRAX6C+C8ZzEy7ZgPrzhcV0rq1hMziRYlUGkmc4weGu63+UGaeI/DYlZtVKSEtYjRJZjqNz
	l3ZWtfvWwP1f6LFQVG+8JcP2HAsQ7GrTRT2cvXQjSdCBWljwmjcXbMMb+E5EWcZ3SSRTKLjOj7w
	FV75EF7mJqAByh3UUGhMrq9hJ
X-Google-Smtp-Source: AGHT+IEFFJTx+ExeQ0LxjZrLVtDg/lSkbV461KmtV93IzN3+6IjslOyP/QaT3NmsrWAQb9LLcZHxEw==
X-Received: by 2002:a05:6000:4287:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a1f64c0df2mr14090834f8f.51.1747134146531;
        Tue, 13 May 2025 04:02:26 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca47sm15851252f8f.73.2025.05.13.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:02:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3] gpio: pca953x: fix IRQ storm on system wake up
Date: Tue, 13 May 2025 13:02:20 +0200
Message-ID: <174713408243.11101.5617298935758722435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512095441.31645-1-francesco@dolcini.it>
References: <20250512095441.31645-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 12 May 2025 11:54:41 +0200, Francesco Dolcini wrote:
> If an input changes state during wake-up and is used as an interrupt
> source, the IRQ handler reads the volatile input register to clear the
> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> triggered before access to the register is granted, causing the read
> operation to fail.
> 
> As a result, the IRQ handler enters a loop, repeatedly printing the
> "failed reading register" message, until `pca953x_resume()` is eventually
> called, which restores the driver context and enables access to
> registers.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: fix IRQ storm on system wake up
      https://git.kernel.org/brgl/linux/c/3e38f946062b4845961ab86b726651b4457b2af8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
