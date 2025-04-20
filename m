Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFE258A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745186889; cv=none; b=HgErPW19hA1x+IKNvn+Dc5EAdzBFBwOLTWWi5NRUOYDib6VbUJJ5qT98rEv0tRMDc+Mgabf8G3aSHMoZuqhdVQ05JsF3mHACsTrce6lDzhAEVGSRvMomzeaqjjAce5dRTcSanOwquFsXSgYILVs0bbcbxw+JZ42dkm/G1aenFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745186889; c=relaxed/simple;
	bh=+sb5oTVSdT0gDhyCu+zVxnnU+ikal/bJQSljR2AqB1o=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=nlWzYrvplUfrItfZnE0G74GyqAKjCMtC+20D6Nv6pbUICy1Nrct3ftTB6GywATF6YLiCTitr0gaYT5JUXaizUljqsse0TcG96/j9w3Ok9l2nHcMfAwIEl2rpV/jCLz/MJgxyAzTSwuUv5ievKjdmp6B+01n/Ms14UyKYTHX0KNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RSDrlBJm; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RSDrlBJm"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e900a7ce55so56538826d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745186887; x=1745791687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaB/eqUW804vNfwdwluESS+94szfSPe5TqG84IKsMD8=;
        b=RSDrlBJm1Ybv48p1TV9oX6k4+qNIfQdDYUS8e8/7Ib4GLN0/BZag11YMYOwT/cIr4R
         Dj8CQ88L6vQ93A9Mh1xH7td/5TtWLGCf3z5Q1gYXsCD1LIg8UlOZ8NmoraAiuii0CUB7
         iRybaW/A+08OugL2/jE3qxxR3ubZyk2nElv7RZelpOBlJRH/vavDdmHCDHK21UE1664/
         vV90bkKlRKVA+a29iok/569vk6OmKTEpZExBLWlVd3d37ljqAwWu4iywu07oK8B19QeV
         +aKeiMrF4pUI9DG3K/2bHZ4JJrH69JIf382wd/zGpyzAOjeJrh15N7Bpb4kqL+VoJX1i
         E0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745186887; x=1745791687;
        h=content-transfer-encoding:in-reply-to:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaB/eqUW804vNfwdwluESS+94szfSPe5TqG84IKsMD8=;
        b=mstXdR0s4hapDddqI4IwRDmgFSfR9NVHWuotpK9vY/oCVmssrFHmxkPsQBYvsr/lCe
         RZiNdQVr75nVkGW94xDC9zrVBuudUwLR+/t+gHTvEdr83T7NE/shy5givgo9xVyHH/SZ
         G3pboRZ93KQGtqSAnOtbu/xOaHWYD4ZpaR1s3julk9443xXLRugqBS5/eeKq+URxzOJb
         T5yduaGHfwBlxfVOmLTAzOTAjBp9IvpBI7S1zv6HOVzi9dDQVG/F+2WR3H1Br+2gpabT
         6hcU6DRFEgvFn8ecwS1Q5wgrLGfMDl/cQiop8TAfzQzGzvtHOZd1oprDQHMCWxEjVWiE
         YxPA==
X-Gm-Message-State: AOJu0YzgXTzfu0WzEVbkNMJWnX33xl2l9hwo7QDkyryWXqY95aV0CmQJ
	xCS+7mKz6RjGWkYowCBF4AG+pvLDryxOh3qQhB2oF4UFOIaQLnIvMQyDie+I
X-Gm-Gg: ASbGncujM90Y2LyrNO7Zvzs1CY8aBbg5YgVNKjbqSSvx9/AG2BhUZkDoMdaU8jZEHbL
	CVaMRBBULSlV37w/r39s0qeXgSw7KiMaYbo5XT+Y3LRaKxLUSBJ4Nr+7D1mwH0H2+0nfistq5qe
	gZZmJCaY+g2Z4BRkhhLIsDE9FO/mP4N4qCAA93stzy7PNp7ykrZn4Yoi2m4TvP2R24RQqRi9aoy
	BalxgaCObYcVAh1ONCtkk2NpJE7EWk/6SbsMfUvPp2rWtwfA+ddJNnK7sAqPrs8UNo7yZzJGQ5Y
	4nsBvqB3JSqYCFWmjxOxuBpxZe0/dxrhuuu2tPPE7mLSPxTLRB+Sr6pzcbFiVg==
X-Google-Smtp-Source: AGHT+IF3vMvJUmsrXrSy/XwwW9grimvZso9VLuMDXX78jhWw8drjGKmdzBYB4D9Ux9UHrDqtRjcW3Q==
X-Received: by 2002:a05:6214:1c8e:b0:6e0:f451:2e22 with SMTP id 6a1803df08f44-6f2c4675096mr198386146d6.38.1745186886978;
        Sun, 20 Apr 2025 15:08:06 -0700 (PDT)
Received: from [192.168.1.10] ([176.25.125.185])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6f2c2c217casm36146836d6.99.2025.04.20.15.08.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 15:08:06 -0700 (PDT)
Message-ID: <3244e56e-8f52-44c3-b41f-5a5c0b6e413a@googlemail.com>
Date: Sun, 20 Apr 2025 23:08:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Fwd: Re: Linux kernel 6.15-rc3 released
Content-Language: en-GB
References: <185f1842-8d4b-4091-b102-468f87c8e1ef@googlemail.com>
To: LKML <linux-kernel@vger.kernel.org>
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <185f1842-8d4b-4091-b102-468f87c8e1ef@googlemail.com>
X-Forwarded-Message-Id: <185f1842-8d4b-4091-b102-468f87c8e1ef@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Sorry, I simply clicked reply (and added Linus as a recipient) but didn't notice that the reply was not being sent to
LKML. Doh!

-------- Forwarded Message --------
Subject: Re: Linux kernel 6.15-rc3 released
Date: Sun, 20 Apr 2025 22:59:43 +0100
From: Chris Clayton <chris2553@googlemail.com>
To: Linux Kernel Distribution System <kdist@linux.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>



On 20/04/2025 22:34, Linux Kernel Distribution System wrote:
> Linux kernel version 6.15-rc3 is now available:
> 
> Full source:    https://git.kernel.org/torvalds/t/linux-6.15-rc3.tar.gz
> Patch:          https://git.kernel.org/torvalds/p/v6.15-rc3/v6.14
> 
> You can view the summary of the changes at the following URL:
> https://git.kernel.org/torvalds/ds/v6.15-rc3/v6.15-rc2
> 

I'm getting a build failure here with gcc14 (20250419 snapshot). The error output is:

  CC      drivers/block/pktcdvd.o
drivers/acpi/tables.c:399:1: error: 'nonstring' attribute ignored on objects of type 'const char[][4]' [-Werror=attributes]
  399 | static const char table_sigs[][ACPI_NAMESEG_SIZE] __initconst __nonstring = {
      | ^~~~~~
  CC      drivers/char/mem.o
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:203: drivers/acpi/tables.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Let me know if you would like me to test any proposed fix. You'll need to cc me because I am not subscribed.

Chris

