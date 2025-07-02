Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4C27A110
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476948; cv=none; b=oRNZaYzO71sWvesOZPUk2je5o/D0eAo8IBA2Vpbv+XNYb3wntPZRILHXsxSOIuhDHAQF7U9t7d3MUq0hYUID+/QDXHsfAfV1HJ8F3Q6UQUVzyodgApxyY04AAT1XXf9LC/AeO+lpYtn+R9d8k+pLYTFZeFaVmAdBRTmAPeBSuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476948; c=relaxed/simple;
	bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1xGX1J0wrBl4vGVncmEcHOD9HdnNcuL+bqkygyse32a9gTGVR8vpB6wFfIDvb8OMIUrN5JM7LSr+Q2q4xbLvZBZ3RfYdHLufElCr1kw4h7U9nneWK+osfyXnbaRcdcF9367CzPCAd2usNDPWLQLUjiiuDEsP1VLILpsJhPjwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=WaJ1TA29; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="WaJ1TA29"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8187601f85so6374312276.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751476946; x=1752081746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=WaJ1TA29Tz82XkVznEqYNerS0pddA1Rb3Yajbi9mj2RuAzt7iPaY0FZN8dU4b0B1ey
         TQDFtb1KSmqMWvJY50Ed/NYxNxuL8zuW3kBijeMI9RhsjkxfXzNK1FFqDqBk+5LvXn/l
         0nf2O1MjOouuTBMH93s0MclMJGAhMxNokKO7TJubOd+Xj6zdgHMlpo+S6R2FLGtQGPSK
         Y3G0qSvGI/ooX0JfTKB0kW+kjB7MN3QHxTCFmYhMj7zNJeZ3IttBQzSuv0tu8ykHSLkd
         LowgbQpkEUu/Ne3gqLjyoHqk2oK1MBtRpdgboF2g4GHYHwkjycOKQv9XRsv52Qn5BglD
         ovPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476946; x=1752081746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=bgXZvC9EHSS71vlZ6GTKwrzPC/3tAs+ky8pz3jak/NvUX50UgB0eVehPylzkFrtuT8
         j7LrU6apXbTuf8ey0HPBMRVW07qyPziTLPoYVDVo2zDAuTi/Xn5ARVegJsmvjPvClvAE
         G8jbEvYhrP8QL56WzNmyKpUw13gASZhg/vmbta4jbjlfF+ZZPQ/GPXtZE6Gyt2Ao7/9J
         HIghFgYIZKXiZ4yhryAU044BASukNJVVKi+NofJdlum1W8D1hK4mX4bTi2I5vbdWN/TK
         UTIXeDoMLdX/i/rmOWrm9CPUwP6cEXWdAWa51qkNJDJXXzbUCdaUZQpQOdHfGhc+4pED
         DylA==
X-Forwarded-Encrypted: i=1; AJvYcCUzrb4N+KMkwynesVPgeo51wcZj2xxT3HNhUq2MfHqYybsVCEtrCh2bAPQegZOCDET4Hucv7qY7gUdTcmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5o4Z/wztBLWh98D43uQxbm5avj4tqkZox++41Rp963wHwknl
	fSyFG+71MFrMgnuDzcyf3wlHZCjL5GosY0oNYIRMa7X3bdXVHdk3zUFbQp/hlvE9wP5QVREiIc0
	OktKpzMqKYRtJgfx+JsCtCmF448s8bu2Bu55x6UAL
X-Gm-Gg: ASbGncsfNqm9rmXeq046oWm2MTXlfudPwY8g3/2fSVh+cwiqjiNdNCmgVJ7pIFYk7wM
	vR+mZN2h/xZrnIM1+c0WegNa8Q59b7dQx+4Ss6D0LuVt6nbPolE02IpaBX1LtYinwTYOhnNfR5+
	oHd5s54kfAFApBoH+nO0bP5vP3jG1sW9n/25j3m+OBnyYBCpPUTDH7SsqDOWPcEjR5FWHoAfOxC
	ikB
X-Google-Smtp-Source: AGHT+IH+2cHiDRkSexobKNpcDsdKZBCYRCcLg4PJcbDmEq49ClTbY7a3qJRhpGa/9rwzq7pB1ZCDPnILu5cCdmgnzFU=
X-Received: by 2002:a05:690c:7487:b0:712:d70b:45eb with SMTP id
 00721157ae682-7164d539984mr52498477b3.31.1751476946103; Wed, 02 Jul 2025
 10:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com> <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 13:22:15 -0400
X-Gm-Features: Ac12FXzMF1aM5Sb75d0lCCLP5TcPQJxcLdk716xFOwxeZ7EpHXVjogygUeOUfJs
Message-ID: <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anand Moon <linux.amoon@gmail.com>, 
	Da Xue <da@libre.computer>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
...
> If, as the description suggest, the regulator framework somehow ignore
> the timing set in DT, maybe this is what needs to be checked ?

The regulator framework only cares about timing for regulator on.
Regulator off just turns off the regulator and returns without delay.
The code makes incorrect assumptions. Then the kernel resets the board
without having enough time.
I can patch the regulator framework with the same code for regulator
on but that seems very hazardous given how many things might already
depend on the original behavior of returning immediately.

>
> TBH I would suspect the delays before the regulator framework itself.
>
> Those assert/de-assert delays tend to be just copied from boards to
> boards. Maybe some boards need different delays. If those are too short
> for the actual HW, an ON -> OFF -> ON could result in a NOP.

50ms should be sufficient for all boards as many boards don't even
have this functionality. < 30ms is sufficient most of the time.

>
...
>
> --
> Jerome
