Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADFF4ED;
	Sat,  3 May 2025 00:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746232418; cv=none; b=CdtNSA7drOHRB/hlzCRBdXOe7s/7CM9IDbNCXmOOn8LY8+BP5rWaySaUEjd1muGF/dKt6uOpWNGdY4lmkteVikFwgcszuM4UhRpp/7oLjdWjDdq9T1WVXEZmfXDxS7vy6O5M0t2hFyT0T7xA22omnhIyrRRyi5ton0wjP9qwy18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746232418; c=relaxed/simple;
	bh=LTFSqRPGVj9+2UnDPZdR4t+X833DnDXklT+MH1u2efg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a65tN8IpOnfLWnWPqa4xVrQlsKUNPbpinfY996LkhzVJhH99M1QbaF8SmAk6/zJtTy5ImVYE08tRL90iKCedwFqznGuaByGSb3gvHOy6KZvxwqWsC65BO7z7qG8rQ6HpPQGPz+J/EH5S2pBw2ldqgGkcAe9lYQAEE3xlseJhmbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez2a3965; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez2a3965"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso420658766b.3;
        Fri, 02 May 2025 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746232415; x=1746837215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E+nfEIr9NP36BWGBRQtg1rt+NJr2xiXzbROWvXLKsI=;
        b=ez2a3965lvaHEwNpoMTeKP0ufSCnlSkNMjZ+p+EUTDb6Fqh6HOiZr/o6OsWtV5pvU0
         2jodku7oSpC3XfcLHMAOipaJ8/slFyCZOXjAfOYUO2HoV1t1O8XLaULS2F9H3YZJdT/O
         ANztSRTCoaQ3OUZFw69ZIzO9u8lLeclEY9p+TJM2wYPGqAyxyHjP9fBup3VTswU+tYX9
         KdvtB9c1S+75vxkGMw4OCbjAlKbwD9bpjpdCeolD3S/JX3W07N240pfKLh/obI8U5aK+
         O++TzabBv4UgAEjFCgGj/Y39g7cOJv8a9gVHh334iT5Sc2d/B2NM2ybh0A/KppqBzXTU
         BDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746232415; x=1746837215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E+nfEIr9NP36BWGBRQtg1rt+NJr2xiXzbROWvXLKsI=;
        b=Qm1SLTyb11CPNaC5vZUJ1AF9q3mOZWWCvVpbB72f8CP32ECjMSobhBAAdixnje/AX8
         xJ2TBF3G/KgvpoVT6z5WaQcZy6v87di+d1XpDpZvfi9fPlXfOaVDAWcaK/ZesounEdiT
         PA70Rc4hBu/m1gbUfg8YG9ruVuhDO70bcTR++jB1bpjkQ2gjpPlpVswHMZXgyZroVj7U
         pfviNQcO0ZyQWEQqAxCxaeSnYuct3F9OoAo268qTYbICKbs9JH3ircAlDakDuwOmX235
         mR6nx31ETzZyyNZSEhZxw8+yXzZiUGaiqv5p4v0xiB0IcDpv7uEpK2TEPGa863Zb4Tmw
         GnyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcRMnHjl0FY7hRqDWFNzCyr0xka8Ump3iEjkIOELFN9QtssWjNm012vqbFXF3ioUH4TUw1z3NuypYmLgv1@vger.kernel.org, AJvYcCXELKwl3MqVIx6E87ppRUx/gXI+gs3vow5qEPRv6ii5tvo65p4T5MyYX0JxeKg77+Xn8B6hxiITgmnmgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4CMcc712VL8TqKbW5selJCxinV2/SXONLJnCvG87dJwJm6WL
	Xdcv4xQ0R4vfwoFZU9psVm/R92j1wMJ83vMJsYYG5mFrCsFX/usW
X-Gm-Gg: ASbGncvsxPSA+1Syc99SGhPTpoxEkkN8rFKTPir3a5X2j7DpWZVFTo2ccerAbtu+y9d
	HIlxJh8TOyuQjuVmhJRMxYdSZ5U/0ctTCk0TnwdQtcwN4v0DIlOypOVo6rYBPmA0z/ZQwz5Is0X
	gVWIdSFnyV13KtNtRHu5/8zac7GQDd7Ff5CvlP0If/Covgo+EkFVWMfiW5+SSObeFHhPOVb2WXy
	Z2hEM2zrDt2yG/wnou1qlvQLUgvsEurAiNUWoMByfDFRrI88tbzlaJ/UvwnVUi74V5QOEtJyyQA
	n2bz+5dAo0s8PBr72jQKjBQlmGOh4HKIbqYzVHZZeX905iHGGc/O9TiqvejZNPtHTB79fL+cpTg
	Z7Ld99aTlIS5AkpM7Itj+rsnVtGc=
X-Google-Smtp-Source: AGHT+IFM6+9C5okAv1Q2Ar6XRN4BhOe7EdlWhBGPViB13IYuUYqQrOlnTc3vqHqy4JoYQUI57MlrfQ==
X-Received: by 2002:a17:907:9725:b0:ac6:f3f5:3aa5 with SMTP id a640c23a62f3a-ad17b5a8abemr525443766b.16.1746232414604;
        Fri, 02 May 2025 17:33:34 -0700 (PDT)
Received: from localhost.localdomain (host-82-56-126-113.retail.telecomitalia.it. [82.56.126.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c032fsm116057366b.123.2025.05.02.17.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:33:34 -0700 (PDT)
From: Luca Carlon <carlon.luca@gmail.com>
To: w_armin@gmx.de
Cc: carlon.luca@gmail.com,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lucas.demarchi@intel.com
Subject: Re: Suspend/resume failing due to SPD5118
Date: Sat,  3 May 2025 02:33:33 +0200
Message-ID: <20250503003333.5693-1-carlon.luca@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <666a5de4-92a1-4ffa-9535-c34ec7cf49bc@gmx.de>
References: <666a5de4-92a1-4ffa-9535-c34ec7cf49bc@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Interesting, please check which i2c controller handles the SPD5118 chip (cat /sys/bus/i2c/devices/i2c-1/name).

$ cat /sys/bus/i2c/devices/i2c-1/name
SMBus I801 adapter at efa0

> Can you access the i2c bus (using i2cdetect) and/or the spd5118 chip after such a failed resume attempt?

In my case, the suspend fails, and therefore I do not think I can reach the resume.

However, if you mean to list the installed busses, this is the list before trying to suspend:

i2c-0   unknown         Synopsys DesignWare I2C adapter         N/A
i2c-1   unknown         SMBus I801 adapter at efa0              N/A
i2c-2   i2c             i915 gmbus dpa                          I2C adapter
i2c-3   i2c             i915 gmbus dpb                          I2C adapter
i2c-4   i2c             i915 gmbus dpc                          I2C adapter
i2c-5   i2c             i915 gmbus dpd                          I2C adapter
i2c-6   i2c             i915 gmbus tc1                          I2C adapter
i2c-7   i2c             AUX A/DDI A/PHY A                       I2C adapter
i2c-8   i2c             AUX C/DDI C/PHY C                       I2C adapter
i2c-9   i2c             AUX D/DDI D/PHY D                       I2C adapter

after the failed attempt, the list is unchanged.

If this is not what you wanted, please let me know, I can try to provide more info.

Thank you.

Luca Carlon
