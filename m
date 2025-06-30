Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7230828A718
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294326; cv=none; b=mLLHgCPYa9rNf91BX7evYrywVsEDv/JN95PO7Q80MIQnjiVQYP/aRGIjJKuc2tkasIxjcxxrrFyDutJFERfm6UBwMNEMDKQFHDmF6+PS8jtuRKUQlijgUteCwJSAtWvu2PUt4Scv+OYBGfRgkc3Y31s0sVgADP+9HxZb+y++N+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294326; c=relaxed/simple;
	bh=q41UMOkYp6U8rXBQmxcMnX0PDl9yne69OVTJZiPDNQg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Sf4XrwUL05DlWnyBjVvzN9Ycvd9/RNwxVnaXhKXk618iuEhMpQn0FwRYH4nzSDlJFe2H/O3XZDyrDZUD0c5HbIGIwtxdkms9ZH1pA/i5OeRnuPgViS3UIXA+K6lct2jdgQ6pbZd/uv8RUfznu7hPs6BIkjS85pW+zgDqnGlq9rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com; spf=none smtp.mailfrom=hifiphile.com; dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b=PyTzx8bt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b="PyTzx8bt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5550dca1241so2161981e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1751294322; x=1751899122; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5aROwHTVbyl9D9zeojKZoCOh6LjGW5da//8YHEuJ/oI=;
        b=PyTzx8btQ5qzpnwOOtYbHAOP8nuTpRUf+bwKaq7/dvF1+KGquUbFUCJMhb72Uin6Bv
         M3yh44T0NyL0kH+9QCeUvYZg8bO5MAo+j/E/6nA6OH7aHDhBV2y9WyNp+kHGc4zRbJM/
         jApjz7benoWiMnDobWa1KgKKhStvv7er3OhfKfTigyJUUAjIINETmpznkO9z7xv/Z1Mc
         4cgFBkFWPcmuxch6wAG5jg8GBIYTKHEnguOgkZ1kbL1zCsW8jIbXxgFVNf5ubRJLvEsQ
         9eh8rqm6sHR9ZrSZrJBl2z+vSX2P7QPLvvNcWDnwfXBa3fvd0pKgJBakQkO4NtqAOvqo
         J7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294322; x=1751899122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aROwHTVbyl9D9zeojKZoCOh6LjGW5da//8YHEuJ/oI=;
        b=bd47BiGl/US1VX/e2VDWJvFaIkU9B0Kxqpma1OaByi/F1ESKExpKy+r4c9hSCyMqL5
         zK4zGdkRGPwY/flSkbs0Z9YuchUNkF/QmyJadyeo/RGCSShyrDUBtbsKZMseeaRi9bm3
         Wc67N4Cv2W+dt1MwiuQadfUHxVtaKQjv334ycVhdvS5w5jfvqZ1hG2XOY+QD1QEVKHHG
         ca3rFDBvzOqckIY5tE3fOUu2Bz7bmTmPmigA97JzAJE2dGN/xelBv71p2+MzcuSYRTP1
         YeyzGQr3pUD5OHqr8ZWDkVzcLMW6u32jj58GPPakfGmdIhyFIUAx603yGR1yanvwC2xt
         uF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKMN1P1Y1lR2KLh5hJIUn+x7VMag+OZJJT5XXonD2/qf9Dsee1RifwsCZdF3J6HRZlWQn9UyxbWbV6jzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIAMyp4CZyvoROKgHohF8tyqSVNEl2nWnUITWcvjTIzxAOKyh
	pd2g5UMXNjH0lWB3xmjPpBl9Laagfp600d4/DytW9kvd4/5zOAWWffkJEsq4IQHxbJ5dGjhLiXQ
	nFdPgyyGIW5Iy4zCZNe/CSSZbnAUE7C68moB/zFgxnQ==
X-Gm-Gg: ASbGnctSzZcomoUs9o3+AybRsYWsVgKoasAeBgFFXYGsYga52EFRHepiHZ+qSR2YHfG
	+/rn0v/SIczSd910Pz0KNqnPMZXv2F6ZozhCPSReaOMkosn6kxV1lfskQrnEH3+T5ii9nm7Nnvc
	yyiU7WeUPTUmWOt2/JE3CVPGdsAcQLE7euBPMCw0bCtNU=
X-Google-Smtp-Source: AGHT+IFnqcLpgxNaCsk7PoNMYONyRs0hnLK3ll4UkAxFSTpn8mAkmMX5sbsExFDwtXdwFg+jhcuCDPedsHKii9UuAHs=
X-Received: by 2002:a05:651c:1116:20b0:32c:bc69:e91a with SMTP id
 38308e7fff4ca-32cdc525e8amr30785301fa.36.1751294322210; Mon, 30 Jun 2025
 07:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zixun LI <admin@hifiphile.com>
Date: Mon, 30 Jun 2025 16:38:31 +0200
X-Gm-Features: Ac12FXyz1YASyU_kIOho436uejsR4G8SmZtLl7LY6YsKeZfU1QFCNlm6WQE6lL0
Message-ID: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
Subject: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-mtd@lists.infradead.org, 
	"SoC support'" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

After updating our SAM9G25 device from kernel 3.16 to 6.6, we have
encountered UBIFS failures with ECC errors:

  ubi0 warning: ubi_io_read: error -74 (ECC error) while reading
126976 bytes from PEB 8:4096, read only 126976 bytes, retry

On the old system (kernel 3.16), nandtest passed successfully:

  nandtest -p 1 -l 0x40000 /dev/mtd2
  ECC corrections: 1
  ECC failures : 0
  Bad blocks : 0
  BBT blocks : 0
  00020000: checking...
  Finished pass 1 successfully

But on the new system (kernel 6.6), nandtest reports many errors:

  nandtest -p 1 -l 0x40000 /dev/mtd2
  ECC corrections: 1667
  ECC failures : 1205
  Bad blocks : 1
  BBT blocks : 0
  00000000: reading (1 of 4)...
  218 bit(s) ECC corrected at 00000000

After some diagnostics, I used devmem2 to compare SMC and PMECC
registers between the two kernels. All values match except for the
PMECC_CLK register, which is 2 in kernel 3.16 [1] and 0 in kernel 6.6
[2]. It appears the clock setting is missing since the kernel 4.14
refactor.

According to the SAM9G25 datasheet this field must be programmed with 2.

Manually setting PMECC_CLK to 2 (devmem2 0xffffe010 w 2) resolves the
nandtest issue.

Is the clock setting moved to elsewhere after the refactor ?

Best regards,
Zixun LI

[1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
[2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
