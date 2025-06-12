Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76949537F8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767708; cv=none; b=lajUqTqepXLp4lFAivI/QWSUC2lRUwOk/i01YG5nueXxysGI/gWlXmih3hOxWbk+2TmMo1uP5xaipZ0mtxEClV0lskBzxWuh9P6FCWCfiE/aG5IZaoYB1s/cvVgbaE9TjttDtIXf205RIYM8x3GnEwnx8tl+9cC29XB1jUCAkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767708; c=relaxed/simple;
	bh=QA2tFYqN2RlJKEYGmIpVctDIKIpy36En/K5HHqEQ9c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPeS4FomZNqots1gq6gTBCOeHnRob3q0Wc9hvQrOJl4DgSnZDqe50qy1WC9YQWuyBBSeO0wHlL5XeAlFuMTSw91UTyYyA2kpF7hXIuJCAve0SPDLR4hkOdZ2zh6Un6uFpt3MgzrV2zLNAhFOlTYcahUDiNhyXbVuzi4rDRpmBpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x6sSDVgx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x6sSDVgx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533303070cso1338292e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749767704; x=1750372504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA2tFYqN2RlJKEYGmIpVctDIKIpy36En/K5HHqEQ9c4=;
        b=x6sSDVgxEKu9+/jNIUGNkkSa6u5Fw/fmnn58DJpu60m1P9yGIwciRzBLqitV9j/asV
         Nlkvv8fIsEQNlCLCSixipf3M08vVJPkHqzFtsKo4k8SaJuXaNkCeRQttZnrr9SJH3lCH
         okEPAQRrzgEFYQQcE6QWf9bPKQMTRMVRnjKBE1kDF+0P18ZC9vtiNjUsPiUSU/41nKaU
         gHfNepT4/cvse7RtkqaLgxUPF8MuuptH/aGMr+VXKT++wP8FAnAszteBiw+0c+QMokLz
         m7uU0yNDgP8o8Wb2VSp34QQGIyV7BC3x07hd9+ZZOtEQHy5IrSVSJXlsls7qPd6milKR
         tR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767704; x=1750372504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA2tFYqN2RlJKEYGmIpVctDIKIpy36En/K5HHqEQ9c4=;
        b=XeAJ22Ycz3WhUzfM0ZP5HenL+LwvJQcxm4UFa98eXXIQNOM1KJk2vngAHW/YF7tOF9
         I0t7PYyTcYio/YCl1BM9RnDEUcWIczq/2MAujMbmCCiLqLRHOcVFtCgMNsDn4/kUrkQ3
         lc3yj7CgCHXA2X+lNt9IZIdZlWMBFoqNbbB/1G4COAU/abw09Q6bl3rB1HiX/wF38STA
         nzazFmp+FmYO1f34FslXTkHXKWZpipWhHHfeTdgqpr4VVmrQuMU2VHNOAuSgcF7dV1h9
         cyE7mfDgCJxoss72Gaq6IRtTOPuRo13NMAoneAYQyif5G98QV7+O7o7QCWrXhI6dzV3x
         b3jA==
X-Gm-Message-State: AOJu0Yw4CnrEe1C50sSYZZ928vwM+RNtYl26nlhNb0z0AXHsTSpWwIu7
	7nah2ivt/P/o5pqHdgZCFBGrynnAKc9VsrTYnEdvHhwX5Xpbv/dZ8VZbSW6KOsir/v1mLFFqUBq
	GTGb4LB05ZGiMe5aSgLWIzvAXGOsk8gkmiU8wquE=
X-Gm-Gg: ASbGncuTxhdrWZ5uZ8zDwVmbQGtCNFKWoJJYYObRyFZ2jhSgmPIptv8FZJmI8PVwLdf
	CvJgZHtInPPU70Ncgdu9BCm0pToGbe9tOzT/6vCPlMD9xS7IY2sDMFUjdaQqUL4j94HEfvber5c
	Rp330MkyXZUGT7/dpypLzc+Zr61mFmqwAuaJqWyOM2WscKeoCUiXne7YskFmpZTvp2IvIWMYAx
X-Google-Smtp-Source: AGHT+IFDTJC/Vdt2wLIjM69G0c0CvJ2GlOg6VdkTRaJzAf9o9CG2KNlttV9DkWauNgtO6mb1ZL3ESwCTBOwtfSJnIJ4=
X-Received: by 2002:a05:6512:b1f:b0:553:a30b:ee04 with SMTP id
 2adb3069b0e04-553af907766mr218487e87.14.1749767704397; Thu, 12 Jun 2025
 15:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083025.652611452@linutronix.de>
In-Reply-To: <20250519083025.652611452@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 15:34:52 -0700
X-Gm-Features: AX0GCFu6c6tQwPqQEiNiejJsors8-caVPvvKXKm_2z8brWLY2l8YznTJmGjnNoM
Message-ID: <CANDhNCqWeX2TX4Yne-g55Rpat4xj1QHo5xvuTMt_7R3B78kvFA@mail.gmail.com>
Subject: Re: [patch V2 01/26] timekeeping: Remove hardcoded access to tk_core
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> This was overlooked in the initial conversion. Use the provided pointer t=
o
> access the shadow timekeeper.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
