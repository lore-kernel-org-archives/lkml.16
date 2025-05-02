Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15419FA92
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746163497; cv=none; b=Ow085jHY7K8D+T4aCuW3pyZVqR7Hkd1IrfhVa33+Rp7F4iwxarIDrs/RhpjBzeobsnCM/Ub1RxHZUCUVTsLfXy9VrpVCHc5DsJ3yZnipvKXkrURvVsVC1F3cyHQhvgrplofCLnrJ3LCsbvRgV0u16TmSw41FQ8/x+POipqQjyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746163497; c=relaxed/simple;
	bh=JWEPL1EE/CpYX9MgOwqslYQfNEn0bilVYHt55+rnc/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLE+YaZk/3iSUXnttkVS97Cozx5qaVwvylN3B2sBBqQ84sfBIQZdiqgXUmsqfjBeNmtBHkcjr4UGEAcoSlOjuG2d4OETelKISQo4ozGdwcF/yzmcdzxU044pFwyUU+9XBnQEYmDKK9Fr6XpcLXib43gUUnPmAl5u7fjZPqr/3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv7oMd5a; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv7oMd5a"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso1968820e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 22:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746163494; x=1746768294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3ZrzTbZzGv85Pi6dndpBJYvMy8n/ymcE4coQYSTCA4=;
        b=Kv7oMd5akTo2/7W/adXrhD49L9Arzef4A3RJ4XG2ssF9gYwZo3ymlMI6MIMMNecvet
         vn4RkBcC4x7cS8pGw8LFPVhK1xENzYNeob1oRICUMo4/tP4cwkwvfSwozLx2N9i25QaL
         FqW4GhytP9pQs61APWFkLWsv8udriBt61M1PeHSiQB1SgKM6BsFv9UtBG3L2B9Z9wIOA
         LgwhaBqkI1aPeCIYeKobn+zZjX6ieZU+tOurcnPSS9mxAaz1aMJ7o8jkK/3BSNfT547u
         SZ9ipkmObZthbAshliXlo5wy+5dEN+7ZSomm38swhoJnQGCyJ20PXy4xo2JLZN9IoXAS
         P+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746163494; x=1746768294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3ZrzTbZzGv85Pi6dndpBJYvMy8n/ymcE4coQYSTCA4=;
        b=EYzjjtzByXOqLAK3Agm8GrsCT8Yvm7VuZ7WeXKVu0Vap58QTevtzIwG3hgyiAcyhlq
         NPRf9sYRvS9ebMG7w70v3coX76Jikhy0joZP0Qg3I/FjEMSqiDJbRnjOS2BX9SiiQHz1
         fSK+36dPVqx9e50zpJPFuRaYWsmxmxI1JkAw5eSthB4JW1MBt4MFs5xfYYJiWICCdoJz
         zd4VUwLbVNF/nSK81mzkGnJCKwcOlp/p6qveMFoK5b3QEkEUhPcbquS98DosedNW9WeV
         iCw+Xhu+ntG16q6Aeb9C3IWSZ47X5w4ESjBi75VQnPM/zk6VpCjZ7/JAziAEbZDo3quj
         zViw==
X-Gm-Message-State: AOJu0Yy2Z/88ibCFEr3fb9mtko9oJAUi+0pd70G7tpp5lO3uoUL5wgju
	LupSF00dgXfW3Xdnf/4c3Ku/RMnOoPF9866Pf8M1IvmlhkbvCcIh
X-Gm-Gg: ASbGncthXl0CCsPLk9FngQZgeS/yMeWZ4938cFks41KbufHxXAvwx4nLTcwdHxajO+u
	9TmEDnaO6SGFN/Czs5WqEdI5ByRFpsdjAYuhEC2LhelLUm2YMf2a8du5emHZGLT3jXznr2Mtymf
	RLBPLtkaOyekKWOHXmxgfAOWc0fAQP0NGZ1XdCufKiQ7HueoNilKoGDrllOA2eCDembNTvmY+J0
	reNH4ntcQlbgD4eh+xNHdcYui+NDmJhNasmdISKtZDmprR8ZeaaFLt4lB+3wWjd4zdAnGyOs/Hy
	lc8o0I7w17Sve39TKPhMIBI9ULVOWWj6+yW6hSudcdP8vJK5Fge9CoJ4G3QXfrzH/T/hxfEvRk3
	rNcdCC2U0m2jd+kmOi1e/7g==
X-Google-Smtp-Source: AGHT+IF08T8aFBQR7GQCDh1JQ8RzCZpGXa5rbE8n0mVFXadUPyx2dCjPHtoc/wTXKoS1kie91osF3w==
X-Received: by 2002:a05:6512:e98:b0:549:8f15:db36 with SMTP id 2adb3069b0e04-54eac244ef1mr342702e87.51.1746163493930;
        Thu, 01 May 2025 22:24:53 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c55a0sm265917e87.86.2025.05.01.22.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 22:24:53 -0700 (PDT)
Message-ID: <52221c62-689c-44d2-b65d-07a5301090b3@gmail.com>
Date: Fri, 2 May 2025 08:24:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
To: Esben Haabendal <esben@geanix.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Esben,

Oh, it has been a while since I've heard anything from these PMICs :)

On 01/05/2025 17:48, Esben Haabendal wrote:
> With the introduction of the rohm,reset-snvs-powered DT binding [2], the
> PMIC settings were only changed when the new property was not found.
> 
> As mentioned in [1] the default for BD71387 and BD71847 is to switch to
> SNVS power state on watchdog reset.

I suppose you mean READY, not SNVS? Commit seems to state:
"By default only wathcdog reset changes state from poweroff to ready."

> So even with rohm,reset-snvs-powered added to DT, a watchdog reset causes
> transitions through READY instead of SNVS.

The original idea of the rohm,reset-snvs-powered was not to configure 
the SNVS to be the target. The driver was mostly built to assume that 
the PMIC has been configured by earlier stages like uboot, and configs 
in the driver were mostly introduced to make power rail enable states 
controllable by the software - without risking the rails to be left off. 
Thus, AFAIR, the values set by boot (or other power manager MCUs) 
haven't been overwritten is the "rohm,reset-snvs-powered" has been found.

Configuring for example the hardware watchdog related stuff at Linux 
driver boot is somewhat late, since watchdog should probably be running 
already - and hangs might happen prior the driver probe.

> And with the default reboot
> method in mxc_restart() is to cause a watchdog reset, we ended up powering
> off the SNVS domains, and thus losing SNVS state such as SNVS RTC and
> LPGPR, on reboots.
> 
> With this change, the rohm,reset-snvs-powered property results in the PMIC
> configuration being modified so POWEROFF transitions to SNVS for all reset
> types, including watchdog reset.

As far as I can say, this change is, in principle, fine. The 
"rohm,reset-snvs-powered" shouldn't be populated in the device-tree, if 
SNVS is not meant to be used. My only worry is that the BD71837, 47 and 
50 have been on the field since 2018 - and I am not at all sure all the 
device-trees are sane... And if we configure the reset to use SNVS 
state, then the software controlled regulators will not turn ON after 
the reset. Fail to mark them in the device-tree and the device will be 
dead until battery is drained or removed.

Is there a way for you to set the "target state" at boot SW? I think 
that should work as the Linux driver won't touch the target state if 
rohm,reset-snvs-powered is set(?)

This is not NACK to the change, this is asking if we had a safer way, 
both for other users and also for you (since I still think these configs 
should be done prior Linux driver probe)...

Yours,
	-- Matti
