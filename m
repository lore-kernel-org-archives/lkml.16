Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686F919DF61;
	Sat, 10 May 2025 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863312; cv=none; b=jYHaLRWvKUIWcMk1119TizuKhSy44IRIhCo4LpNRUUy/UKegLGgHrDDEIrwZSrDguoye6st0PEFRKwVcMIedfnRWlkrnNTyw+WrTAuSva+U6O48BuuCkAgENvTUYBJCkK0ymFsxJNMr1mz19CWAFTbgl/sw9QIUUuee8zyQQHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863312; c=relaxed/simple;
	bh=vWrA/aLxnv+Gt1yqg93gXQ4yKlfAm21eIGBwFQ2wlNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeOpla+6IGSjtJWYmKNXDYHgw3cQ+8bIKtHq5ywmRI066d+ipCFNhMceHItR8DvjFNGbmceVw3MT2jcLvGfTroHEZsY5dsB8hUZPGC34TawbdRxO/iMDBJjxtsC0X4uSn4tbJ7Ua+UkotWNp6hgGiCqI8dMKqE5MWAQcOgdsgBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBCBRg2n; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBCBRg2n"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7396f13b750so3163904b3a.1;
        Sat, 10 May 2025 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746863309; x=1747468109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2i541JactdL/Fn0WUUK9pFnqlbvY//X527+EunCRdg=;
        b=iBCBRg2nQcb49UYq+xC0binMQmscuiBsHeZ0Q/xNYpa9fJXY6WZ0cK2QWf7eFWj8yS
         2Sk12+j4DrE9KsVp7vV78xzhejbtdaRynp0YpKY4YMbS0RMR0q/113LDQGgvEG6chLyD
         FEkWkQDOZbvgiQnMF0Bbc+MkM9zyTE4FQ6LhEP8kQCX/nOx2P7+eTnsKPuWdnQswukoC
         Rbx4e9n8ITCt86e40JI5UWYg3u/DLo78+zBtVRu+tLj0wJAT7GYhmbkQ5F0mm7thbKqY
         Nm6pjvbCmCTMuqNlypkPfSzwBTJjGNWJSuQ5XTAnIoewc645VPz9v+1QK/yicQvI1Fk+
         PP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746863309; x=1747468109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2i541JactdL/Fn0WUUK9pFnqlbvY//X527+EunCRdg=;
        b=knaPhYAc8BZ23a9plOuDAO0inBFeaA2tqRIbqYq9dgKyacbj0X2QgjozOxs9ThtAm+
         RMNyL2omIpIHJNUo9D20lpA7iBGqU04g00FLERudXBHvEBhUNJ91tOCikmdId91BrM1M
         cfMBZFdhu/gZIXkzxynJua68iHTtB0zEkAJPe106EgbVhOr0mp7gxucUgvG2skSykzf/
         gp/SrKjcUyN37VHZ8aujNxCieVNlDQrm8o+ObeiRcLSKZlCvAb/CpeeFqVSf6TUY0sDp
         IEReewzmsBgsm8+cVNzp7u6w7+Vvf7KPQkexFEUOgqs8sEzlOYWBFISa7FcQKJe6R8oU
         HlzA==
X-Forwarded-Encrypted: i=1; AJvYcCVdwyIZAEsXu/WORfmDFfGjNpp1hMYuAYJoGf6Q8p+ENx/WKmmK6QUXbxBWMO95KyT3Kjy2+ETByeAMfQf6@vger.kernel.org, AJvYcCVyJ1uQKtc3cyD4zj53ypQxSRhcNGXdn2Tf7IarI0vo3tIyfhbSKDg9QkbtcD4AGGpXhFBOkC8qlFQ0@vger.kernel.org, AJvYcCXfrb5rsctza3j0Y0InJqU4pGETJdu8nEX+EBB8Q7RYtpAy/YFMlXWUX4XtdRfScbjDsu3q0VLUcCdr@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVbKcdwe1yqWi2GDNiaJ2iKSUT+OtxIINj6fCQ9xR2n8g4FhT
	VwhjhvVdS0dMxqTYpDhBLwmVC277buOBRAKz9fjkKPtUaCCzQgm1
X-Gm-Gg: ASbGncvR8Uy2/mLEqsKRMs/xRbcoIqV249yIX+WL0qdONKIqLNcdoOMpjFTMaCm85PH
	haBcRVsyuhYZQ82oNgcS+AT3bhIe5ilmeI3ke2v8E9VUWIzZCVUqm/bVb1t3YRi6wm2aags+0/K
	eBeTAinEYoOGTtgpFcbSDSC9RjYHCc82ccL9czk9ul/Nie//Y5pBZFHSf/svPuxfEGNpT1UtKmc
	1ZKqDNLeRni6pVuBk2YC4nhRejIE4eeGJ+nYW6vzhTzfDwlD49kJSRjV8EaNv38VY1UOUqCSRy8
	C7Vn2CVkuS0WlxCP5IdzNYabjB8W6PaD3+/vpZXW0FxkbpGqC5LBtzR06R8Amj+y3Q==
X-Google-Smtp-Source: AGHT+IECkuXLke0wLP6OjjKu1jeRoUh4dn5bHDx4utT68jzSDAJKgBulXvY4StbjFDz8y/Tlrjm0sw==
X-Received: by 2002:a05:6a00:2d08:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-7423bbf68e9mr9400091b3a.7.1746863309456;
        Sat, 10 May 2025 00:48:29 -0700 (PDT)
Received: from localhost.localdomain ([14.181.130.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a1088csm2752610b3a.113.2025.05.10.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 00:48:28 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: andy@kernel.org,
	geert@linux-m68k.org,
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
Date: Sat, 10 May 2025 14:48:02 +0700
Message-Id: <20250510074802.8400-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508150140.GS3865826@google.com>
References: <20250508150140.GS3865826@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 8 May 2025 Lee Jones wrote:

> On Thu, 08 May 2025, Andy Shevchenko wrote:
> > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> > 
> > ...
> > 
> > > > > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> > > >
> > > > This is fine.
> > > >
> > > > Just be aware, before you submit to LEDs again, that you need to use
> > > > what is available in the LEDs subsystem to it's fullest, before
> > > > hand-rolling all of your own APIs.  The first submission didn't use a
> > > > single LED API.  This, as before, would be a big NACK also.
> > >
> > > Thanks for the clarification.
> > >
> > > Just to confirm — the current version of the driver is customized to allow
> > > user space to directly manipulate LP5812 registers and to support the
> > > device’s full feature set. Because of this, it doesn’t follow the standard
> > > LED interfaces.
> > 
> > But why? What's wrong with the LED ABI? (see also below question
> > before answering to this one)
> > 
> > > Given that, would it be acceptable to submit this driver under the misc subsystem instead?
> > 
> > But these are LEDs in the hardware and you can access them as 4
> > individual LEDs, right?
> 
> Right.  Please work with the API you are offered in the first instance.
> My first assumption is always that this driver isn't as special as you
> think it might be.

In direct mode, we can access them as individual LEDS. User doesn't need
to select LEDs. In this mode, it is a simple LED driver.

However, user must select LEDs in scan mode. The hardware uses 4 pin to
display 12 LEDs (or 4 RGB LEDs). Ordering of LED selection also impact
to display capacibility. That why, I need to support another interface
for user to controll hardware's registers.

In mix mode, we can control an individual LED and up to 6 scan LEDs.
However, user must select the order of single LED and which LEDs will be
use for scan function.

The main point is user must have capacibility in write information to
hardware's registers to select LEDs in scan mode and mix mode.
 
Besides system modes (direct mode, scan mode, mix mode), each LED has
manual mode and autonomous mode.
 
A example steps to display a LED in manual mode
# Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
# Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
# Enable led_A0
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
# Enable manual mode
echo manual > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Set Dot Current
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_dc
# Set Manual PWM
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/manual_pwm
 
However in autonomous mode, the steps are complicated
# Set drive mode is Scan mode with 4 scan. Scan order 0 is out_0,
# Scan order 1 is out_1, Scan order 2 is out_2, and Scan order 3 is out_3
echo tcmscan:4:0:1:2:3 > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/dev_config
# Enable led_A0
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/activate
# Enable autonomous mode
echo autonomous > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Config autonomous animation mode: (only use AEU1, start pause time: 3.04s,
# stop pause time: 3.04s, playback time: infinite time)
echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/mode
# Config AEU1 playback times
echo 1 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/playback_time
# Config PWM
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm1
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm2
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm3
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm4
echo 100 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/pwm5
# Config slope time
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t1
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t2
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t3
echo 5 > /sys/bus/i2c/drivers/lp5812/1-001b/led_A0/AEU1/slope_time_t4
# Start autonomous
echo start > /sys/bus/i2c/drivers/lp5812/1-001b/lp5812_chip_setup/device_command
 
I think setting PWM also same as brightness_set API. However, there are
many PWM config for a LED and it is one of other config to make autonomous mode work.
Therefore, standard led API can use in some use cases only.

Please see the link below for a better visualization of how to configure the LP5812.
https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/

Best regards,
Nam Tran
