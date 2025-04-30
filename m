Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C21DB92C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051268; cv=none; b=kPLfiuHJopg5Gcm35MR5xNqMXIQzRoxwTnUHCXtvMqNfNF00eGijYrRA4Ephlzjo/X7N4++o67pd4fUQOVmcm42T8bfRF9u1l1irzjz989UhNQhvgHUOMSFBV5PYXwWFdY/WHwfirOcG8X5szWcWFzaYnvMmpa3fFSbEGrDof5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051268; c=relaxed/simple;
	bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRxtGQvqdsjyQivS5hIH4zeu0KWd3zGnFRMSvQrT4h1q7UibzuMQY6trqz/UefvsZbYWtV5YBR8555d33v0dwJyw7fSiUfQFawdCzb9K9G4kG9Od8aH8E7fmGT1xrk+uzI2vpIoLiKUgC9nq3gIiZm3G/83dqWj+WpzN/IBb1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4fn8nvr9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4fn8nvr9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so16631821fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746051264; x=1746656064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
        b=4fn8nvr9x+3k1U/zHznXCY8BeZx9Iv1CFiM/j+MIN7LwljExhjWvoKTZF4d06i5rtn
         4ULpfk1QcAY2nGC3iZleLiUnUVB5bTCyzam2J5ftNgRCfe3clUYx7fgmA22G55RebHPe
         xP8MC5st85GGNwoTJlNUkmRSoWXoyMkkogFwfKQythFuPqL0I6u31/vVOQEAr7Cys4aK
         hfWCzm5/mcL+swWusLwxzfRFpGV2E+U894yqReHlIrTGcjo8lnYYUCj8qe5rSQ4VhPGi
         QMMn9OwosKFv5QEQXZ2kBRkrJXpOhB8TLqtxEJQ2smcFPMtj/Br5wdnTQjDVLMYJuSjE
         lDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746051264; x=1746656064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
        b=Y0EqRv7/uXRpvzGTrGxBKuFYsrFCcUXBV4H9bbdmo5GBuwErR0sLIZZ9b6uzdxKcCy
         HCFS6KFoVT/3cpnzZ6xVgC3K7f6nXeZneV68J9jetZH2XwRzUse3qhXvc4DGjWwtTAIS
         7rUp1kzr+MrXQmcTTl1Km8tYOGxhszA18mpavhmBrqL4b3/FcY10ZYNdig0fvG1/tTEz
         9b1w3iVgbimC1VWxpWHvjjP2lslwKPXdIBOnUS4PQGZN2H7PTvzzynQweWG4Sf8kBY52
         G0ayFlmfkTISHMgzY4ecrq0IZlFabtNEJWseZaE1nZK8iYgOvPJ7bDlBq3e960I1/nmS
         l8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE2y6Id8Kk1CbuRgNtEIAGMmR4R4Nu771URSgqwWRQAzYxjXPKgvGnmQAHcD/ytkuDwMGqyh36rEGQTGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbxLdsWsQr6UFkTn5AqqekLxeHGIyEUTU4fYxrbkgIZvuLCCN
	0j4cQO81WikGgAz6vSzrjgjEzR4qQqR14Iak0+G2fQcFbc2SYYAErW/QWUn0HeHmJekrdhV/0y/
	7raFHPXx1I1hG0HQmNTRXtasCYnkikSHvl2s=
X-Gm-Gg: ASbGncv9rXmmoYxZCbCwo2lUFhpc5X+mmlyUIJSirSbadIpFbIsx4D36MCZ+f2Zg029
	yUQWqndMifGE3g3JTkrJnBEvvJRZ9yrofj6ISNFj/50FW8VjF6KocI65pwEiMhMJe35XAq2V7ky
	pOG3nuZMkQbMx5L06mYDaM8axN12KZ3v+a5xmwCzhH/WL0niSf64o=
X-Google-Smtp-Source: AGHT+IGcNh9yw9nc4Yx/ffRiXl092nCHuoLn11PQbii50lPqD4q9Py5oNhPVn6IHL0f3qmlN9GjqYP02rpgrtGeBNnk=
X-Received: by 2002:a2e:a542:0:b0:30d:6270:a3b4 with SMTP id
 38308e7fff4ca-31fbcf4c9ddmr379181fa.15.1746051263441; Wed, 30 Apr 2025
 15:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430032734.2079290-1-suhui@nfschina.com> <20250430032734.2079290-3-suhui@nfschina.com>
In-Reply-To: <20250430032734.2079290-3-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 30 Apr 2025 15:14:10 -0700
X-Gm-Features: ATxdqUERc6GpuG98Jh6BtDrV4nw-tcK2ntbbVRGaQhHKl6XNSl4xdHGIuhRzOR8
Message-ID: <CANDhNCqgQ_c3_fsUcUcuUoiUrHRh267PiCSvb_XXU5O2rP8R5Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] alarmtimer: remove dead return value in clock2alarm()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:27=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> 'clockid' only can be ALARM_REALTIME and ALARM_BOOTTIME. It's impossible
> to return -1 and callers never check the value of -1.
>
> Only alarm_clock_get_timespec(), alarm_clock_get_ktime(),
> alarm_timer_create() and alarm_timer_nsleep() call clock2alarm(). These
> callers using clockid_to_kclock() to get 'struct k_clock', this ensures
> clock2alarm() never returns -1.
>
> Remove the impossible -1 return value, and add a warn to be aware of any
> misuse of this function.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Acked-by: John Stultz <jstultz@google.com>
