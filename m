Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249A2135CD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881398; cv=none; b=tHYX4Lwf7T/UKACEHHgPhRvGZKszW4Aef26qE05ud6MUaH9R1+6yTBh6SOO9Mm0CerofkKFbxDc6nmc+gIWwlau2fFZjE564mNLgXxzMsSf+Wx9dT1X/CpO00GwjccardVD1W0HviJm2FBWobiqww8lkufsMj4A+5R9vK7GiFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881398; c=relaxed/simple;
	bh=ifZB0XxQ0LBxb5yPwSPFoOBaXqiiKtifiTmyWdrRR54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMbjP7Om/s/wHbLOvDjmizb3q5UrRmk4qEH+M48dTzy7jQC10zCo4bEecHgD8t8lF8z0tAAGxYuPwqbl1YOKwNyBLnEzr+mq1ztTsUQqfmXNts+u6L2F2x3ypV5dfeFzWIDZ18iffG27fTEXxj4HKLhE9K4qVnOzjiTD3HdMhNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eTso/PJY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eTso/PJY"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso54652211fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745881394; x=1746486194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2baWr1r86mfMgf+6fAn39he6bRXAkhTm3Zmck7aQZ0=;
        b=eTso/PJYefkQggqtI3iDfqqTtBq4z91iMwT+fzdyFHpL5kHCHveWiQLynJJX6AdZ6Z
         Dm1+rlLPd8kTNvnq+AnCJAQlNyXQ+H5iHBlqhKSSkyHCdmi6NC8iTsyssG1IQAiZShHk
         9TyEsCfgozsop0waKxIPYnSnkcovto/Q5oLTCQfD/vl4vHRDHS7XLeDVkL3DHUgk5EgS
         zbiDGcSvPIjZJ+nW7RrkTSO1IG8uLOI7oD0Kzomv3G2EhRUI/u+2SD3idLhNQpDWgEbX
         Zc6LN5hvUvwb544U5KFp3pKcCNcaBKs4ONC0NvQ3dROjKWYwOnMbqIz22bkyykZuic5A
         ownA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881394; x=1746486194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2baWr1r86mfMgf+6fAn39he6bRXAkhTm3Zmck7aQZ0=;
        b=nt+Ff6hKwGIupAS/nsWutl/fCHWfC4tWS6oX3f/C+PgiD4ZgUIXYZaEtJNLT29Tuxu
         tU2mXqAUU2KhmHpgUOJ60se9+MXLOEZtctYmfD/ToM452IC1VtZuawvXV2i8pzKD9Fb+
         JJSe72mnD7Cra28GAZo4Q6HnPog+jrh3wqj904uy9i+JeYZVVm5IC4fJkMC8gIVqVwl5
         won8dq2AIvQm7FAqvEZ4zd6XRG0lcmPn9t80ZmRKScXoUmI1sT32WMD1t7YitjreC8wc
         ntB5cMARaPrOx394WE7vFKwvF/DfUHSdvNz5xwHNHbVMVlNSF5zSgZqR9H+mk9LHViwt
         cFOw==
X-Forwarded-Encrypted: i=1; AJvYcCVB0QozQQBO9Go6Wqs32Fp4OfjndBcNF5nIsOQf61pg0esi8J5yrVValohsa3qEQFcXhlT5A6qITUGJfSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtz3HYB8bAxqMu5b9G1ilKQSqyP3emZtt9JS+BIZls3vwULYDn
	Sx/fMgEHRl6H8a95mg+NJJtIy1P72ZCnhd+kojWTdctNbZx7fw1JzCn48bVAAmc7kxxIoz+MB22
	RIvaVvlYToyC24hywsUExXFEEQVNypUIgaQE=
X-Gm-Gg: ASbGncuakhtdaKqfZVzO1EVwjhfT4rQZlMqyjFQ+0di96he4SEWfBooLED6a3jZem/E
	fRtCJAUyL8CDJFUuMX6K4GJDDe77E31O+b0AvGwn8jKc0eLDvO2W47cTrg+4o52ZOwaEW9Sycuz
	k27P9cYpEDHm1avYMwDCdAu0eCruBuxqBpskDAsgNyhdbcAV9NuUM=
X-Google-Smtp-Source: AGHT+IHwFApzT/UzmA3YCn8cEHBS4b5lVrF686awyhHQQ2UfU2Ve8s3/TLvH71R1vJnrvKRkk0vG0VC+612VtmSi+Ho=
X-Received: by 2002:a2e:ab0b:0:b0:30b:eb0a:ed63 with SMTP id
 38308e7fff4ca-31d46be2ab5mr2685801fa.18.1745881394150; Mon, 28 Apr 2025
 16:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427113529.1473800-1-suhui@nfschina.com> <20250427113529.1473800-3-suhui@nfschina.com>
In-Reply-To: <20250427113529.1473800-3-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 28 Apr 2025 16:03:01 -0700
X-Gm-Features: ATxdqUFSTPwOWBywb-mVi7Ms1oTyduGxGimkPSsi2gzPVL1nqYUQBZLjNOwIpYo
Message-ID: <CANDhNCpBpwVd2vHf8PVxxcyaxEZqof92tgF3QxYXp3c+WAwLDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] alarmtimer: remove dead return value in clock2alarm()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 4:35=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> 'clockid' only can be ALARM_REALTIME and ALARM_BOOTTIME. It's impossible
> to return -1 and callers never check the value of -1.
>
> Only alarm_clock_get_timespec(), alarm_clock_get_ktime(),
> alarm_timer_create() and alarm_timer_nsleep() call clock2alarm(). These
> callers using clockid_to_kclock() to get 'struct k_clock', this ensures
> clock2alarm() never returns -1.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - No Change.
>  kernel/time/alarmtimer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
> index 0ddccdff119a..e5450a77ada9 100644
> --- a/kernel/time/alarmtimer.c
> +++ b/kernel/time/alarmtimer.c
> @@ -515,9 +515,9 @@ static enum alarmtimer_type clock2alarm(clockid_t clo=
ckid)
>  {
>         if (clockid =3D=3D CLOCK_REALTIME_ALARM)
>                 return ALARM_REALTIME;
> -       if (clockid =3D=3D CLOCK_BOOTTIME_ALARM)
> -               return ALARM_BOOTTIME;
> -       return -1;
> +
> +       /* CLOCK_BOOTTIME_ALARM case */
> +       return ALARM_BOOTTIME;

So, I think your change is a good one, as the error case of -1 is never che=
cked.
But it might be worth adding a WARN_ON_ONCE() if the clockid isn't
CLOCK_REALTIME_ALARM or CLOCK_BOOTTIME_ALARM, just so there aren't any
surprises if someone misuses the function.

thanks
-john
