Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E81DE4F6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867800; cv=none; b=SVb0S7mXQawwHkEF90Qs2gS2lv41tQJhIx0vGe+t1iQLL5dJQ+bl4V/meP9QdUnYUF2C/m366o9Moc8D6CtzRlV+gSih8h5EtaZb+3I3QR8Sn4NDSHCNpFeUj25cKrxKmI8XxP28gWsu/aiUV2tJY5r2L+EQTtHBF8PKonfmqpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867800; c=relaxed/simple;
	bh=8IRUAWuyG9XC3pN0aPIS/KTtqadjkSf+Hpg2rRtqp40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlPJUFfcWxju9fF4tdgMaQae74aWzzTaMIxTB+m6m0qKAuvvAwJiaXyggh6y8Gor9AVPVOTh9f0ExWdhNZZICP7GGEEW+ERdHSiFi7G6wzLjAYt3epANAHcVhfZhcQGRCxJcYmbsoLP+LlRxotSdHiLttQXr+z+wcRSDoX8O4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gppObXx0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gppObXx0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499c5d9691so473810e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744867796; x=1745472596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tbq98NwkRxfOjYm7weOTRHKupXkAEHniDZUVgeT5NY=;
        b=gppObXx0daXauwXNinllK3Gn5/8vH1/XDhdrvtczv3r5m85tD/P4XNDAG8qKqqzI7v
         SgBkJaM0n5jWXojlSPGtEJqjMjwFSI2ol4261qFU+0nDK2QjM3t+VtNZra/NvHUSv71I
         yUH3QytrnFSb8ht2kdViEA2pEoO3/DrfJ1WiDST8DfCRfDiikGVCQIbhQkCs5jGTfbhz
         UA4ksWjT4kYLVS6MN1QbtQKzLIJ5o+ZjWBplpaffynqDccHD/cV5VENt+hAOhjXkJSbz
         G94oMUc59HPkeKZXatG7eApGmJwseHPUNEREA6LpbTyqXumRFUkeIPGCH4iMxa6pUo4w
         n0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744867796; x=1745472596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tbq98NwkRxfOjYm7weOTRHKupXkAEHniDZUVgeT5NY=;
        b=nrPZTHsYAdlloKFhNjsk/lObZfEM3h4viHyqrsXb3slszCHGUth9TFcgNoqS8kPR4A
         +9gql+LqTma416RlPPX18U/A50mSawjrHT5YGbQFjs4BZAaqGhdQ6aooAvAQMTQlc8Xw
         gtsRRt49HjTtwQbi1fsT31qKhaIQQSefdrk4UV6LZz0FeVHuBQ/D4Q3NjQfMfhOGpwbA
         Skp1cJx5wKYPzkeFZhfO4oLdHumBQOor3qyo0k4IkqzdGVGZXru0gK5HSQ6o81xf+lBb
         oUd9f9BAapyKhHAPM56tznCkzLrwuaixVccNX5kGDXOB0j0vCBMuJ6ZrHBdNbnMEyKfQ
         2o1A==
X-Forwarded-Encrypted: i=1; AJvYcCXHWHU6eo1dYwxyv99BaTtrxtQB68JxQtD0YmaTxPOOi6WsDemVdMlnuMCtghpX4+nhWV4B9OP2lFCkEkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/r90TsjYhmHy1Rj/u4JB95z6C0iBNPOcr4wg++0cj56L5aod2
	gauf6cz+dKnLgu/9NmXNZ4lgEijAYn3MBRE3Oje95bjIPF6YxtNzjwKsC/MvKE5ytzxGXtv3J8b
	v8SR58BeFEQRm5itaKP8NUABITZcV2gxt1XU=
X-Gm-Gg: ASbGnctzWFME76kkMeb8utxy+wflQDyutTPS3g6QfDZUZXlgDL3aMBEl8H6A5K+0juT
	PSsOK5AVP8V30qDtuunVaY7QVkydIir3Z/XwigRnyMy3wsNLFF47s09WHBlCm+EcombyHVbxtlZ
	lo9AvCE3S883IU5mHKVlf8hLEhk+16o3Qn/hgOXGb1GXonDsVsEfZyOl1PNhyjug==
X-Google-Smtp-Source: AGHT+IFJsMYdvqU27gQJon+URzkUuZBB06ki2I46tRCTIgHeKrXMiYT2i6HfyxRplJ+POPGp9j0hKgQgUp4Pj9Dsnbw=
X-Received: by 2002:a05:6512:ac5:b0:549:903a:1b3 with SMTP id
 2adb3069b0e04-54d64aea494mr1431419e87.42.1744867796065; Wed, 16 Apr 2025
 22:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320200306.1712599-1-jstultz@google.com> <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx> <Z-Vx8kV4M3khPknC@localhost> <Z-qsg6iDGlcIJulJ@localhost>
 <87o6xgwftc.ffs@tglx> <Z-vL3cVZuQ8XQXhG@localhost> <87iknnwxa4.ffs@tglx>
 <Z-5HlSUEh1xgCi4f@localhost> <877c41wkis.ffs@tglx> <87h632wals.ffs@tglx>
In-Reply-To: <87h632wals.ffs@tglx>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 22:29:43 -0700
X-Gm-Features: ATxdqUFRIk__GaYDInAsvbeQ0YVaEScg1GGtg38lyC7CTsJPCjHDcqn17UbtfGY
Message-ID: <CANDhNCpAVo7FsmGhTVRMkazUT18dZG42M82O3QPQE8XobsWOaw@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Prevent coarse clocks going backwards
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miroslav Lichvar <mlichvar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Lei Chen <lei.chen@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 2:40=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Lei Chen raised an issue with CLOCK_MONOTONIC_COARSE seeing time
> inconsistencies. Lei tracked down that this was being caused by the
> adjustment
>
>     tk->tkr_mono.xtime_nsec -=3D offset;
>
> which is made to compensate for the unaccumulated cycles in offset when t=
he
> multiplicator is adjusted forward, so that the non-_COARSE clockids don't
> see inconsistencies.
>
> However, the _COARSE clockid getter functions use the adjusted xtime_nsec
> value directly and do not compensate the negative offset via the
> clocksource delta multiplied with the new multiplicator. In that case the
> caller can observe time going backwards in consecutive calls.
>

Hey Thomas!
  Thanks so much for reviving this version of the fix and my apologies
for apparently taking us down the wrong path with the earlier
solution.

Looking over the patch, it seems ok to me, but in a test run with it,
I've seen an error with CLOCK_REALTIME_COARSE during the
clocksource-switch test  (as well as some seemingly unrelated test
errors, which I need to investigate) so I'm looking at the zeroing
done in timekeeping_forward_now and will try to look more into this
tomorrow.

thanks
-john
