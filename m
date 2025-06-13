Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FA2F433F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749787527; cv=none; b=be5RPacdXoQwH/aICVo4Z9Ng6gAfcMxtgZdQY4TgHiURixrDSEWnBGAHKtxXyjdJBesseyMxHjRgxjWFnHORCG/6v7s1iWqBTX5cPMJ3RPbpETronWNhtlyD8Yp8sIsldsoql3/UvPjQBov0U/xwGytcE53lwMXNS8MPq3GGWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749787527; c=relaxed/simple;
	bh=RS1QN8dDZg9GoFTP2NyqdcsEWn+y1hIeX3VX3C8oJHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrBAXBiIwyywqDIfsREfeATKgyv++ieDu93Mj2Mk4MHhiaRgMQAuUkmXI0FkvBu2IlKg08pg7zs/83cEThKdUyB4r5N2prAP0IvMl+b+C6Jh2vkZ0uyJzGt+etrzI49D6ZPHoDw6lwYkyaXuQOKLkQq4uEQuUce5cui57Jzlu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o9EJL1b/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o9EJL1b/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5533a86a134so1488529e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749787524; x=1750392324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS1QN8dDZg9GoFTP2NyqdcsEWn+y1hIeX3VX3C8oJHQ=;
        b=o9EJL1b/+MKRjZWxTj3VqZU36v0t/66/NFDhp5FVv4zEEYGX/lCCQiekueABSx7aPE
         IvKu1GI6oWW6OU/tP9b2CUiWqCoYSavSKUKHexa7qz7v3weCjJiq1x7zaKbnKrMp97eK
         fgiX6vy8r6TaGzSm+F05GBTR6F+P+2Of96Whb5eP5KlVoSSWiTlBw2CEo7ccWc08jMpZ
         e192637qlOSHLGbFPMisPGMFU5hYZAg+MEBLNP0XjjvrRvIFnZc0I9PsRkCHrLWCwSrF
         bO/bvq5Pfl8lYUguGm2zwZp7qt66bWCpTDWK5TdWrxmBycJOCkmDmdVSlkn1qO7uO6p3
         84qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749787524; x=1750392324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RS1QN8dDZg9GoFTP2NyqdcsEWn+y1hIeX3VX3C8oJHQ=;
        b=u6KUAKsD0AOPJjdKeGgbKvr/CNakcMuWYCXVlqu9OCXDuLRtHNFlo5FX7zh5t0+bBu
         TlhjPiP5ZNMrRHD2TBNrdo+g8/r+2WLRwSKsRSad2I8kLIbQaz4rfblDzkmwTzYkvmnm
         AecGyw5VBQ+zpXc/Ve2mYvDxY3VCtJLYjxUx7xSQhqi0urc8k/l8ObUXpFIsvGet+/+I
         hU/1kSKR9XouGVCkM19kxb1X92ZWQv1zSXV2MSDCCNp6YXHVLZLw6pMHomlb+/kuO3jR
         itjNBRfvC+tWoU1EXRqawIQQLYXqX4aDBIlZFTdCeyPigW/yuKMR6WS4s7GG/fXR+jJO
         O1Zg==
X-Gm-Message-State: AOJu0YyYP1pJo7m6bFG7H74PYLG5BsFouOYv0Y4Y+xW6X+MNqb5S0Lld
	d87z+dD6MgRYsNgiuoArhZ6Bq/p6x3JXgVHqPwqu6k5hehQpRsE7uhc4ju7BrxmzBPHQZM32h/Y
	DmnEjed1AS+BlawNxe3PIs/ytjnDn6JfUk7m1OTLgTi/zR3jNYgEXbTk=
X-Gm-Gg: ASbGnctjW6z+IEpi59WVLe12SOk3ExrBQH37y4hpN/QQnTRLmr6ZbWQTQQqsgcdPACQ
	XIEShSV+VhUVsxwheVp4VmWckXjqAeg9xW+A46RqfCrmbWs89XuFo2VqFARuEv9l3Ev5rHevjwD
	J0Ek4cQ4P1EUsYyAvOMg9wSclC5o15qixvzX+K5FEzSBKVqch+IPs/MMBpr5i7/99dgi9FA7aJ
X-Google-Smtp-Source: AGHT+IG767EyeS4WvZ+kyHjZGSNrzbYgSsrpRpXfIEvuAxnBT8xJcNKmtdcC3AtcrJUKKBI3A1Ac7JF9k+yDC2okg54=
X-Received: by 2002:a05:6512:1287:b0:553:2420:7c41 with SMTP id
 2adb3069b0e04-553af98fd52mr299889e87.26.1749787523877; Thu, 12 Jun 2025
 21:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.287145536@linutronix.de>
In-Reply-To: <20250519083026.287145536@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 21:05:11 -0700
X-Gm-Features: AX0GCFsZSBvcbuXa8-uyXGwLeDdlB8p9k4M9RUR7qJL5VHafbWQ8hbPnOEsH2SE
Message-ID: <CANDhNCoYJUWReC-vUgSYo+3ie1rvCefoKEfr7CBXW93nTT1EOw@mail.gmail.com>
Subject: Re: [patch V2 11/26] timekeeping: Add clock_valid flag to timekeeper
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
> From: Thomas Gleixner <tglx@linutronix.de>
>
> In preparation for supporting independent auxiliary timekeepers, add a
> clock valid field and set it to true for the system timekeeper.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
