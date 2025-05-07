Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EBA1917FB;
	Wed,  7 May 2025 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636168; cv=none; b=hTjXHL52yq+CSmY1UDa7yfir0vx1qg2tpbk2Uur+LBzH9aHgLYk6xWHRI2Kn+xEnS7PGSKQhetN52fPma3WHVRNbJgPdl78EpCm5mrqGCm0bKSUFPoZAijItltaxRi++Brr2rNRRvibKKCyEIaSJK0SPPykulGuWPrH9ilOYiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636168; c=relaxed/simple;
	bh=GmqF0ZJgeQ9wyOYD0SQ2yXd+3NM8zKWnJXpW3wgTe6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Biz+WBPZlzX/7d7J+yO6jZWj3YP863o7FF7IyZPvIEp4w29VrgUM+Lo6tWD7pR1Hbtxsdt4J7amkIhl/eUlMTv/UsZAAYJyWbC1Foe76B4Mr2R12HcafO1RCpu+LLNMEkMFQcCZm/9rEEzk/WH1AcdO8Zc9avD3bYH5wGQpvcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLE2837F; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLE2837F"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so128577b3a.2;
        Wed, 07 May 2025 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746636166; x=1747240966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrpAv5wRm5tVkVdVuPsn72RSEtYGripQsP5MpQKGhfk=;
        b=QLE2837F05EnFqzcMIEe4W0awmV58aZUIWbjn0RALdRvxGqjIsZUaV2somrK2NeZWB
         8ezf5iJYBrJtELFkSDYcgj/+qvQf+SVegqmX5lGQVHMcIZKmf1Y4s0Gt1z9nhFHhRK1n
         tkiAq8UicHHUSKmkJXhrVAAvgDyIhFcampm/r3Irf5iWdgmfTeqlZevjiYsPFEJjAjpU
         OHjU4SA0HtG5M2yv4DLx3Sqzek8xcHgxGCDq/bYM8zglj0c2zCmq8GddpJs8uhs4eZJK
         o0qhRGOiTu4VRNSFPqjyAwETD/MqbObexa4WViqcGV6r67Yxneb22mJ5GnZSYwy1LlwO
         HVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636166; x=1747240966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrpAv5wRm5tVkVdVuPsn72RSEtYGripQsP5MpQKGhfk=;
        b=Fxe2/cLR8kwVxZ+NxVGjiDGsCwLzUVYK2Vch8Y3hOnHMo8nruGodTFGRuKlMsdcFhs
         czgpGoPEJp+rys6PStAyxahA3OCDlCLm8yMFdJ6nB+ypaiHwopk5uwYOH+7qYhJfQok9
         iaU0oR/2+LuqNwGng6h8otBVgu08pvszOyrddN638EDwQC09yTlbeah/8a64qvgQNd68
         6sAhEV8UQNEgY1MSS/lQLbAu01NiQa/qEAFDxnOcdmWQgK7HnhkeYVtBDkPzF2WtfV7W
         dfi/oAKL2ERXRRVaK5TEqTJG12Nq6S3xjITC01/SYKQcGW0IYJs7PJOMAi+51rqVNf4w
         oLbA==
X-Forwarded-Encrypted: i=1; AJvYcCVngyCpFWdC04dksZpeXM3yNBmb1EtCYMh1pVOXLqnOaw6MGnYVOWfEbb/brTEoDAeHcZK2pvLpisiakR2j@vger.kernel.org, AJvYcCVqaljU537LUESNlFqG+um6wx5I6ANXiea46Dt3gaDciCqbyLmpzSx/2EgcbvXgUI1PDa1mgEzeissy@vger.kernel.org, AJvYcCXfKgAJlPz5J5DC+IsZ5x9Cp+1sA6afEbJqVhzEftwUEsfw+2FEA50k58tLVjqIBGy8MeMlDeUX7cVm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qCXCgjtuxjjUsCqyePedyMPin7RExsbYGG++IPzmW7lUGCBp
	nCRUH+wX9D2zoekFSd1JHBQ6g7/abtxLFQf1voUc6JbBG9zdCD2x
X-Gm-Gg: ASbGncuWWVIksRIJbflVsd5OTh4pxckBACg3ntj3EsaSFOT88B6dI11vqT0E1LQMKXj
	5yA1HdS8GJ8H8P999WtdTP2rgioOe0RE6WnMyPRcEzpQuQX6qOxOyw4ipyCsWvMiWcCxUgpMeuQ
	vMt4s86RtcPEThPsTlnM3gsRyCmMtknkV1EM39tq71wmGrdH8YjuwAr4nzs3WrPkbiW69VqDUZZ
	UAjDCIAcXHzExwOKou4Mw3KhqcXvTI3OjIHyi/Vj1D8nIzE5r4ebHNNAsojEDaivkWu9Veq7jpb
	x7gJN+Zq1R3KtdOjyOTr4nD/mTb2xJbIHIr7QEbiijTb7A7KnnbytJolxxyhv8rp
X-Google-Smtp-Source: AGHT+IGJIkVx5zZt6zXCROkjsSU2I7/c8Y4B6zDviETofWcquGoGsY4tXjVou0oNL4hYBjlYRPpCgQ==
X-Received: by 2002:a05:6a00:8d96:b0:73f:ebb:6cb2 with SMTP id d2e1a72fcca58-740a9966d64mr34295b3a.3.1746636165785;
        Wed, 07 May 2025 09:42:45 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1c1sm11528004b3a.6.2025.05.07.09.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:42:45 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	pavel@ucw.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Wed,  7 May 2025 23:42:19 +0700
Message-Id: <20250507164219.10083-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
References: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Apr 2025 Andy Shevchenko wrote:

> On Tue, Apr 29, 2025 at 8:02 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > >
> > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > >   and update the title and $id to match new path.
> > > > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > > > >
> > > > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > > > Thanks, no.
> > > > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > >
> > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > > > but...
> > > > >
> > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > >
> > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > It is not just an internal wiring detail.
> > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > required for proper operation — it cannot be treated as 12 completely
> > > > independent LEDs.
> > >
> > > Scanning is really a detail.
> > >
> > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > >
> > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > ... placed randomly all around the device, then it goes LED subsystem.
> >
> > The LP5812 is used for LED status indication in devices like smart speakers,
> > wearables, and routers, not as a structured rectangular display.
> >
> > Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?
> 
> I have mixed feelings about all this. As per hardware organisation it
> sounds more like a matrix (for example. keyboard), where all entities
> are accessed on a scanline, but at the same time each of the entities
> may have orthogonal functions to each other. Have you checked with DRM
> for the sake of completeness?
> Personally I lean more to the something special, which doesn't fit
> existing subsystems. Auxdisplay subsystem more or less about special
> alphanumeric displays (with the exception of some FB kinda devices,
> that were even discussed to have drivers be removed). Also maybe FB
> might have something suitable, but in any case it looks quite
> non-standard...

I understand your mixed feelings about where the LP5812 fits within
the existing subsystems.

While the LP5812 uses a matrix-based structure for controlling LEDs,
it is not intended for displaying structured text or graphics. Instead,
it controls up to 4 RGB LEDs for status indication, where each RGB LED
consists of 3 individual color LEDs: red, green, and blue. Based on this,
I think it aligns more closely with the LED subsystem rather than DRM or FB.

Best regards,
Nam Tran
