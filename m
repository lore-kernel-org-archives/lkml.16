Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07D155C87
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748585433; cv=none; b=G/90WfCktCviB5SVVKxYte0xPQxuNJ0unyndPJo0bkUL1JxnarV72W/3xlzLPIhVnErRxBXOJmiJTJsPqQahoKmkpfiSKTbBg7FSHdVKYBZ4UhSU9rR8obuutjhC2SFxLi3+avdUlHEkjby1JNjQzZRG+8M3wf159vc72j9+ekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748585433; c=relaxed/simple;
	bh=kUs2T5YD4VPzh82X4eNvqIPGNp05D8KtiSsNdGrCMAQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=LwAXriGlFvlR1smd4hKGM8k7QhG4m4a43ntmalqDl6FJcyW2KvQdU/zjeYicQRlyLCDXJsauVGjNO03qmuAzE37mdRpvY56VjdfCH64I5RhEZVNna9Sar0/pTI6XN4gVx6mc57To2L9Mgv133ssCC+zn3l1FHX3mrGC/uyeU9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=a4prr3zA; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="a4prr3zA"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ad5566ac13cso248464766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1748585427; x=1749190227; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPnX0OvzR23ytpi7s9ONmkqTEzEvGCRrZRa3/595UAs=;
        b=a4prr3zAw8DBixQleUgkcGFsNPt8XHtP7yEBNHIXtu3SWAePD/mDo0v7f91rNC3JPO
         MmlCqysXqcV1eskWB1ymRL7D1Hk6aI5UFYwCBXiWMSxQwRxZApzgZVMrEnx7abdVfVJX
         +CqWNLaCFBC4K1mbqz3P2JvZO/PEcRpIZ6qLA8uEobm1lNvo8rhLiVc4Ayy+c5RYkNZV
         lAey9RjGO+28HLkSd9VMQ0+j5ZUSI1Ik+Nse+IMqA/XezvHrcXyLJSxz2MMqA6hBEwv2
         7MPgfCI9GlCi3T0xfTAVxcrKHtEVjGaJ5V/WxHQUH8txVtiGCj2XinOYPrSGIkiisnvl
         aq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748585427; x=1749190227;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qPnX0OvzR23ytpi7s9ONmkqTEzEvGCRrZRa3/595UAs=;
        b=F+Ug87Bt7B7RccU5VRz9fra6jD2AkcYYINJGNq6e2X9FutGL72nJ26UBxVCL3z6d2q
         WX/WWa7qjB68LNuZLYdYDsFyTOYGCy7hoPACFpdgTR2MXzm3HgL8ZlQOQhOpKMN4lSVv
         B6d3X7v9skcgcqNv2jp1IDLWFHS0lOizHXNghrqBC7nFJ1vwA+cmvz4ZegsB/CoDo6sC
         iTQw3mfZPAXVGqncGFCA8dQqZLxKnDRpW0ndVJTdVz1WtDaG1RZJ8mieNY2BhCEAzoht
         9lHkkOW5ItySP7aU7m/hQTf9TFV9fLFkaxkoFfwYX8vbBIsAuLqVsUksBYiIbIozyIko
         mT7w==
X-Gm-Message-State: AOJu0YwwT4+DfkeM9VGFEHTRTyGHRfaD339Vdqjm1O+yGWvZOcfQQ8qY
	lx3ZhNFWZ97UJzj6H+w5HapnrWapD0yxc9TZ+PI9x7qsk4YdJ9Sq0GOM1i+lEIR2lMHSFzVrOev
	aBETV0yXZf6yUaw==
X-Gm-Gg: ASbGncsClA6rz3v+q7LbeE0sECdT+U3xFmELtmC67b33nLJqOzZmkppcTY1U8IehH+p
	lTiUqCIBoIaUpTay9K1jj6SERMhR9c6o1Eb5SEPJqCvfkDKfYNajuSGbQWma0GxvlrvZy1KrDD6
	w9ncKR7fhAHUTfIcaZDIe9NkU8DlKMkpj4mcN+j25Ot9MTu2dsfgMcx/R3qXGt+VJFyj3mZmc1u
	n2vxoYp1AJ7FC0yiXaivRPYhEq50JS2TvyKfwOp4MWYLqCTRN/YBLWrWXexcLyX/S4I18kVpuQM
	7RF6UkCWhilvQ/ezv4iire3ZxMD4cp7ZppwUuPkOrV52m3w6FQJmMxfto89rhOwcqFY=
X-Google-Smtp-Source: AGHT+IE9BHe3729nFyXb52ZLAq6vhwVaVkHCTkRZTZcfPIOAIujzSadVtHgYMWQ0z2UsxSEDtliwQg==
X-Received: by 2002:a17:907:3d02:b0:ad8:9c30:b66 with SMTP id a640c23a62f3a-adb36b31a52mr78534266b.18.1748585427169;
        Thu, 29 May 2025 23:10:27 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb325c830bsm100375666b.0.2025.05.29.23.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 23:10:26 -0700 (PDT)
Message-ID: <379179de-2d0f-4a0a-9534-46b10d254e40@monstr.eu>
Date: Fri, 30 May 2025 08:10:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arch/microblaze patches for 6.16-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

please pull this one simple patch to your tree. There is nothing else pending as 
of today.

Thanks,
Michal

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v6.16

for you to fetch changes up to 52b70e5b605c38996b74788a140702e69f34d2e1:

   microblaze: Use of_property_present() for non-boolean properties (2025-02-03 
11:29:42 +0100)

----------------------------------------------------------------
Microblaze patches for 6.16-rc1

- Small OF update

----------------------------------------------------------------
Rob Herring (Arm) (1):
       microblaze: Use of_property_present() for non-boolean properties

  arch/microblaze/kernel/timer.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
