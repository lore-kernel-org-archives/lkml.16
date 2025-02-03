Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95E200BA9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581444; cv=none; b=TRVN8SKi7VCMkIxQriDHAlNVQgApXXfBlEeM/6MA/Nf40eE+X4CWHZWENF9zq5QMPcBz6F8WNS/6HbIN0QoiwvCJC0vSnQppg2hxJOzYoO/grOlOilr6maEEdI435fJM00c8qBXFejkSc3wCA61STmG8eYvjGON9CKomVO8Z2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581444; c=relaxed/simple;
	bh=db6KlM8qXxXyoU+JF0iNNq7fiWQZj3Ljb1eIuFg5Srk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOgpL/Qo/+RESyZORcZ1CSDUuaK6eo/yaKLJTpHIWcKDoBmbJbpCkTfi19+edtfOqlM04/WRrdtQwN+HzlW4lQtA7v+ucdyzp5Wix0DME1FER478iOf/GjTdz9dtM8AlqXeuXqqqQTptbPY0ljjZUimp/80w9xkhfGK072zNDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=UbH9la9H; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="UbH9la9H"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so7297101a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1738581440; x=1739186240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJsT8bvC2Cv39Q1RkjM/NEHGTBUp78qspuyoijzQViY=;
        b=UbH9la9H4wuI+GRn/ZBYsiTylss3IWJU1KNaaN7UmbCBXHukDaR6JD0+D6yX8dX3Mq
         yOP/f/uP6FdYu09OWAW+NVBdZi97mYkXsCD8sD1pllwkVNk+y24M+lnsfCLYtbZSf1rN
         pybIuC9lZX7hWnz8IZaqObi7wJMXT1JQm5nuZaPXz2JIR1Bqi0MVOGZnTQjX6kN4xWRX
         3nOEm1l3qcQQZ7oOjTw79x+T1yUNiA6+cYmNkbxmAubTWtQOLDwMwKVYLBdjxEBoe7lX
         jsjenkzL3t4H2Ib1yQskAgRKkhLN4VCdDKWiVzYu+9Wmvv5FKaSvgDaVa0+NeJoUdC+m
         ZCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581440; x=1739186240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJsT8bvC2Cv39Q1RkjM/NEHGTBUp78qspuyoijzQViY=;
        b=WmuqEIR5xcR6HBgtOWRIkNy8YM+8w/syxMR1RgfAiYt5Eu5uYzbd5+IFshJitceMz3
         S6UQvJjC4YBKY10HplEJrYvRsYNCGonm0y5NkSWntoq124I5mEi4l+uuCb7LlaTXGbcs
         TRyAlSAxPckyJXn+o7mZi+O3Ok90c6XqQ20kSpd1StgRr1HbU658v0uA9++73Va9c2ae
         YF0gPR6DBjyMAYUijAyM3QI4XvdSRe03yYH4PwsZNPJ9xYo5/9ysZ3cKIlXIZ1Cubsia
         RZCAQsEwoOu5Gl/Ta+RIoWzUgef/LKSwrFAyYepYbKalDNTk9fR1mCaMQP6lkMqdmsDl
         qe6Q==
X-Gm-Message-State: AOJu0YyZEYxRW4sPkH8LWR50/c7xli5558FdyNIgfwrTVSlCyjp78QkN
	EXbricriDTGBPfqF6OZihfYWoOHC4TnGFVpxKm12JelDnROMcSBywq8RkFvlvg==
X-Gm-Gg: ASbGncvptCQ4dIQLOTtsABIRNFAr1i6XAgGASA4Y2rP+orO6UDZKJodk0c325n/9L9q
	v7BZBDQASx9GUXnGwnDu5lSmZ/PvK7qm8MyDp82B+qVNcd/1M20ujDISQoA1tMMOt15WVptlQFK
	KpokxBqjGM25gApejBaMUvk/JmH03mQktOhp0vxScRyTBkUAcWy7DHDxZwgDqGt2SNRzVtHYmay
	soEFANWG8iVK+xVXbURpNM/+m91VyrJs2VNy6lc3JiwItnyayX9jZG+02ht5+OAmuUPTPUB+MUo
	w9gKBthGcYrzI/EjseaajtmXF+aCxLM=
X-Google-Smtp-Source: AGHT+IH5WRoI4pnF2qqVJhtPMNzaBUhdizGqFDdzVCuRA3ioLA1dXPfpbm5LjsDdotvaN8DkWpUMNA==
X-Received: by 2002:a05:6402:3208:b0:5dc:af64:d775 with SMTP id 4fb4d7f45d1cf-5dcaf64da72mr2466261a12.31.1738581439715;
        Mon, 03 Feb 2025 03:17:19 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724aa174sm7303887a12.63.2025.02.03.03.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:17:19 -0800 (PST)
Message-ID: <b211188e-6c31-49fd-96be-137d3fc3f7bb@monstr.eu>
Date: Mon, 3 Feb 2025 12:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] microblaze: remove unnecessary system.dts
To: Masahiro Yamada <masahiroy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250114181359.4192564-1-masahiroy@kernel.org>
 <20250114181359.4192564-4-masahiroy@kernel.org>
 <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
 <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/1/25 04:42, Masahiro Yamada wrote:
> On Sat, Feb 1, 2025 at 7:25 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Jan 14, 2025 at 12:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>
>>> The default image linux.bin does not contain any DTB, but a separate
>>> system.dtb is compiled.
>>>
>>> Michal Simek clearly explained "system.dtb is really old dtb more for
>>> demonstration purpose and nothing else and likely it is not working on
>>> any existing board." [1]
>>>
>>> The system.dts is not necessary even for demonstration purposes. There
>>> is no need to compile out-of-tree *.dts under arch/microblaze/boot/dts/
>>> unless it is embedded into the kernel. Users can directly use dtc.
>>>
>>> [1]: https://lore.kernel.org/all/d2bdfbfd-3721-407f-991e-566d48392add@amd.com/
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>> ---
>>>
>>>   arch/microblaze/boot/dts/Makefile   |   3 +-
>>>   arch/microblaze/boot/dts/system.dts | 353 ----------------------------
>>>   2 files changed, 1 insertion(+), 355 deletions(-)
>>>   delete mode 100644 arch/microblaze/boot/dts/system.dts
>>>
>>> diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts/Makefile
>>> index 932dc7550a1b..fa0a6c0854ca 100644
>>> --- a/arch/microblaze/boot/dts/Makefile
>>> +++ b/arch/microblaze/boot/dts/Makefile
>>> @@ -1,8 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>   #
>>>
>>> -dtb-y := system.dtb
>>> -
>>>   ifneq ($(DTB),)
>>>   obj-y += linked_dtb.o
>>>
>>> @@ -11,6 +9,7 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
>>>
>>>   # Generate system.dtb from $(DTB).dtb
>>>   ifneq ($(DTB),system)
>>
>> Can't this be dropped as setting DTB=system.dtb should work if there's
>> not an in-tree system.dts anymore.
> 
> I believe this ifneq is necessary, just in case
> a user adds system.dtb to arch/microblaze/boot/dts/.
> 
> 'system.dtb' is a special name because
> arch/microblaze/boot/dts/linked_dtb.S wraps it.
> 
> So, $(DTB) is copied to system.dtb, and then
> it is wrapped by linked_dtb.S.
> 
> If $(DTB) is already 'system',
> we cannot copy system.dtb to itself.
> 
> 
> See the definition of cmd_copy in scripts/Makefile.lib
> 
> cmd_copy = cat $< > $@
> 
> 
> "cat system.dtb > system.dtb"
> would create an empty system.dtb
> 

I have played with this and pretty much this patch is blocking 
simpleImage.system build target.

I have no issue with patches 1-3 and I would keep system.dts as empty and keep 
it in the tree because users (including me) just rewrite system.dts with proper 
DTS and call make simpleImage.system.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

