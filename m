Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381731DB128;
	Mon,  5 May 2025 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429903; cv=none; b=mExt2D+Ph1uNz7zGsJREu5H3rqfcFY+JGmY+qpx+ORmTOmiPfizA/1suAFc6LEbuTs5uyoFzsOYy77MAgHHLBC9MneMIqsa2zEqVM4tsMMBE4eDcrquqT+ULlb5MFvPUJBXfnNijtBtdH0MMmUfjmMaRngsn9tyHTtyW596sJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429903; c=relaxed/simple;
	bh=WX9ZAN+ePQEnywGTWo3okIi3omEMWty7ws1C1C7frjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1/Zs+4EhZMhB5GJZX9J9akSMzRu6UaDZGghVx8NoR7OFhoZbBCWZVfjUO1/nD6VKb35N3mO01/CyFGujqONGAh4b7piEz/vuQtng5inQcNBO3OjNR6FSilycG/v51PeI0ZGOUoNv6hGYilqx617iZPEmVHL59r2BZjyBunh/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOYfu2VO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOYfu2VO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so2685731a12.1;
        Mon, 05 May 2025 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746429901; x=1747034701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb5qvTnPUM1Ol9JNA2tWO/vRefXXoUSqF58bo/+ZxNQ=;
        b=hOYfu2VOwhyLU8k4Qhve95sWUnvIS4W5o2CIyT2se7zvohDNTdBtEW4b3ZkGj5nhKd
         uEmZx35ebu7GVVaa96X5X/fK2aPtdPPSyuQTu0EpOGyXRi/v+zuTPuJKQ/ACx+SPq/ya
         q3KK9FETlXSZVCwo7dNhtGiusH5eqWGAxrmPGHJ12dbKCyaA00UhIfDQuzSsv1SMFmgg
         Pq9BWtGre2Ru60qeWbtE/BOAA2b30J9hSJGIBPDGW+/scUJovxbdEgbCI59rx6XmyDTr
         Sm1x8VB/Mh/wZJLEyg1D8refvP3o4Uqryz9WJM+n7RHInQjIm3L6MH7VbiYLjpcEbp8D
         ZtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429901; x=1747034701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb5qvTnPUM1Ol9JNA2tWO/vRefXXoUSqF58bo/+ZxNQ=;
        b=JV/Foz82NZmzlQ9M5Po6xhjIoDKs4TPHji+5+7dc5VRK6SU9BNg7g3PdfeKaEjtReE
         YaSL2smtA4yER/vX7gtvOFl06Gi/u0h6N8ZrXCRdME9Lo4XfdNowXlgoqU5tvCC7alY3
         2WPIxYdzX4/SS+t8OQ59/bfk+rS97CQguE0y4Rar5iWy6we0eUqs9AGxQVC/97vd59zS
         o+8uiT0ajd462vnrY8I89KQogY4Je7byGh1Ab/04koPD3ZqW66YA10INB8pLJHiq1Mmq
         SB4RHqyVqtPKlFFPoVwSMqE5RyyXfTMb47uycTwsoF7wtnu71kibGGQYybc19CtS0Mly
         DGWg==
X-Forwarded-Encrypted: i=1; AJvYcCUahUJXAu/idfI/ZlgjD0xi+4wObXqHGZ4MAcv5m0bfHaRQaZccM38Px+KNadXnjkqyadWmdwmPhcuf@vger.kernel.org, AJvYcCUeFJQZp9WF9C34NU/Gn12VSR4fPMwzPCCrKRlJJTYGXmsAIv9tYIg/NG1FS33s5RedTn45aVOQmWYo@vger.kernel.org, AJvYcCVEKMTJG3fnx/0IusL63TtJeXCu+gdih41WRZSj0OU+SiZiu1e3btDHGC5b73RHysDukcY0XXdIv04dMHkj@vger.kernel.org
X-Gm-Message-State: AOJu0YzcKskUMTJnysmvZBomlBH0i2TquJEBNU6ejdIpcTaS2sjRqBP/
	6BulKrGtCqAkjuQxyS8zRoX+1UBTWiYiVXiNBQ+Cs9qZ0nl5S8iD
X-Gm-Gg: ASbGnctZ0Z7tmaf1/+TFDxVSH4ps7IjCMHKW3kbobP64sLU87T0/kosJNAcMyy9E8T5
	mRVUxOzC8+JpIRCJpQcaNH5Em3j29Abgr6Tec1POTXK432B9su41rtrO9Zqul/4R76X9KaUGwYo
	EMnqi9I+70T+Dvh7SsZ3SQFVwxM7jrvB7j7POSI+R7MAd7RIIoGzftICKC3rs/nE1JXniEqfGr2
	8YkqQjRexaimq5PPc0kRv9H32CtdaoE12k8Os3ZLsSyMeFV+9urHshYZwe+oFgdDyhvx+8gEK/y
	wngsobpVFfHEs5HJcVSSfk6y1GDmhkXwnmlFQcchN5VBPJHjEY2tPQ==
X-Google-Smtp-Source: AGHT+IGVG1kAkM03dHDBqgAZ17yvSfG8Lf8Gc6OKwsCxPxmUgPj69TVFM70BIdzaECoV/A7XImgaQw==
X-Received: by 2002:a17:90b:4c84:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30a6197c311mr10473328a91.9.1746429901311;
        Mon, 05 May 2025 00:25:01 -0700 (PDT)
Received: from localhost.localdomain ([27.67.185.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa58sm48014325ad.242.2025.05.05.00.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:25:00 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@ucw.cz
Cc: andy@kernel.org,
	geert@linux-m68k.org,
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
Date: Mon,  5 May 2025 14:24:33 +0700
Message-Id: <20250505072433.8193-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aBHN+395kaIdbBEm@duo.ucw.cz>
References: <aBHN+395kaIdbBEm@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 Pavel Machek wrote:

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
> 
> Well, IIRC it also supports automated animations, and that does not
> make sense on LED indicators. So... what device do _you_ have and how
> exactly is it used there?

We’re using the LP5812 in a battery-powered smart speaker as a status indicator
with visually enhanced lighting — for example, breathing effects during standby
and fading effects during voice processing.

While the LP5812 supports autonomous animations, they’re used here to offload
real-time brightness control from the main controller. Each LED’s animation engine
enables smooth transitions like fade-in/fade-out and breathing effects.
These patterns are configured once and run autonomously, saving MCU load and power,
while still serving traditional indicator roles.

Best regards,
Nam Tran
