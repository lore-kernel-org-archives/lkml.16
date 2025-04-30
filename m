Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBC2550B3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014872; cv=none; b=U4M4eXMnr1FsKfsmtxmngeDAu8xemfEFOvg4I3GFdAcSvUvVn3TvXXuEKti5UCJtHaDA15oZNW4mmBZODgRskD9/iLuZ+KKrdScfvFcJTMrSA9Goax5JEMLsHEyFywZUmxLfViAQjRYdrKtQAlC0qiDZuHLyARySq0WfJOuCO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014872; c=relaxed/simple;
	bh=d6I+bZCKSKv8vKALt43bmwyGtXI93URckbCg0nFuuFs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fgHuY7R02bfivVwemC6Aiy2gZYrqzCHQB18Mmf37k8HKkIiZi8ObDKFcFrA/nq9ozzMXQdyPk3kgh9YVl/wTPsxx9pBa1EoUCnrCADXq9pR7Lr5s3+1/80RVjCvMT5QrahHADK+1R0oxKiiq4HI3H5sq/BLEG/ohCjGteb+Eat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=1D2yIcsp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="1D2yIcsp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223f4c06e9fso8238395ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1746014870; x=1746619670; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkUw/hLNBJeQ1pMrFmWnr5vSnFNE+RWvw+N/vq84oP0=;
        b=1D2yIcspM9v6Roq06HCCzrfwJtnup52ViakfcDwUt/5iCTrdVF7VuYe15jYFY1TK04
         jjgYQyK4manVh9SGuGSAXMcELdl8B52i+Ctb8Vg0hMwS70xnx8D6dtV8BctDxnarBCTE
         mQGC4+FoqibehQF8mkCQZxzg2FoijddqNQEj9rFddvofOF71mkA0OHe156CaI+L6HL0s
         6aWpll2DHd05zc6nW0wUEN+oOHomQzk313AJVmAc9Qqw0rs69zoVmXn8C8oQ4jdSwZTP
         wcLk5JDUV/2vZPSE7FrCwiuFyq3+NWQ8WbRaxJ76WiQOSttOPQRqY4BMgXdkvwiXpR9Z
         M79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014870; x=1746619670;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkUw/hLNBJeQ1pMrFmWnr5vSnFNE+RWvw+N/vq84oP0=;
        b=qgcn9k8V+ldC4KDJp+m8vUAyrGyrP2cYlQxWhYfoihtclvjFWX1dp/D7NyNccLdKIm
         qp0faR9eiWgXXSo7d2ozPCJPeZVd+EdMFE/7FPuh3lHPe4ZwjWhGiD0co3pnDGlDzKvB
         Yi7ZpfualswqgcIAx52FA1+bzXqgdH8KMkmX9Mxe623Gge4yMOebQoym3RQrMo/GcNz9
         7xw8sc7/QM6lLpqqYZXt1R21Hz+5rxiuBeRqVMt3ybzgsOCwnD1hynB+3H48Sw/wplfe
         T76yWGMgZ8L18qFsC1QUNlIAM7g2NRmDUHvtVTUn7kJrKZab4/0v7n3RPe/kWBQ88GDl
         Il0w==
X-Forwarded-Encrypted: i=1; AJvYcCUNAacOzM0ImpVdgCm9WmKhnEVO/gQt9bHTBL83bHTarqa0D3D6odztblWAIHR1q8UyAhAbMcrbOq94Yas=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7OvYuzcvBHVPKNNRIKOyXhghbNNfgua6EytOkzUl/MupuBxk
	/ZigW6EcZY3MsxzXiPOxhw4tQdELaBK8VVg8g7GF/iVBGgcRMB2NPAgq5SlWJA==
X-Gm-Gg: ASbGncvMdZpczsfPrBSJH6ZdA65sNNcypyl2CnEyBbFQoTcFezasnAYlCwryo6htpce
	fKV0MtMH7wefnf53XDjoqEsCpy95VBemrT7RPvaERv5C0hGaDAAuPdWkWOIun/T4OAr+A58P0cn
	gwf8ejswgB/sn1tDtlceBS9Kl33fg5lbpK3rWcXUviU7k8UwFG+oCVMbg3IRQrjlfUk1Qkp3KQr
	2WQ0fGzCKVDB3RknYs6fNpjbqEpOJ0RhQ2e7t7H4bC1XaBuLdsH9j3EJhRIcMNwaAai+kEAoBYW
	oYB8haYe1PMyPagB6ffW48w2u5YLe7WcPzVTQ+XJox6cZNk=
X-Google-Smtp-Source: AGHT+IHhb8NFe8lUAsoDgFv5UN8RsQHrujabcEFLMT4WjBW7XdlPw/0o6X/SBcXZaqyOpBFFqPzTCw==
X-Received: by 2002:a17:902:ce82:b0:21f:58fd:d215 with SMTP id d9443c01a7336-22df4787428mr35026165ad.11.1746014869771;
        Wed, 30 Apr 2025 05:07:49 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe614sm119994375ad.98.2025.04.30.05.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:07:49 -0700 (PDT)
Message-ID: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
Date: Wed, 30 Apr 2025 17:37:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xypron.glpk@gmx.de, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
From: Ayush Singh <ayush@beagleboard.org>
Subject: [Discussion] Global vs Local devicetree overlays for addon board +
 connector setups
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,


This mailing thread is dedicated to discussing what approach should be 
taken regarding overlays for addon board + connector setups. It is 
loosely a continuation of [0], so feel free to go through it.


Introduction
*************

To provide a background, the goal is to have a common way to support 
setups involving addon board + connector. Some examples are as follows:

- MikroBUS [1]

- PocketBeagle 2 [2]: After discussion in [0], it seems that even board 
headers should be treated as a addon board + connector problem.


There are 2 main approaches currently floating around. They serve as 
examples of Global and Local approaches. However, the main discussion 
topic is global vs local rather than the specific approaches.


1. __symbols__ based approach [3]


This was originally proposed by Andre Davis [3]. It defines an overlay 
with just special names in `__symbols__`, which is used along with an 
overlay for the addon-board, which makes use of the node names defined 
in the connector `__symbols__` overlay. Please take a look at the 
original patch series since it provides a working example of how it can 
be used [3].


It has a few nice benefits such as it works pretty well with existing 
infrastructure, and does not need much in the way of new functionality. 
However, for this discussion thread, I want to consolidate the 
discussion regarding how this approach directly adds the devices to the 
appropriate nodes, Eg. An SPI device in addon board will be added to the 
appropriate SPI controller, etc. This means the changes are made to the 
global tree.


2. export-symbols based approach [4]


This approach was originally proposed by Herve Codina [5]. It defines a 
special node (local to the connector) say `export-symbols`. This node 
takes precedence over global `__symbols__`, and thus is used to define 
standard names for nodes used in addon board overlay. Please look at [4] 
to get a more in-depth explanation.


The main difference here is that all the addon board overlay changes are 
isolated to the connector node in the devicetree. Eg: an I2C device in 
addon board will be added to the connector node (as defined in i2c bus 
extension patch series [6]). This means the changes are made to the 
connector node and not the global tree.


This approach needs extra plumbing (like i2c bus extension [6], 
something similar for SPI, etc) to make the whole approach work. Only 
GPIO and PWM with Nexus node can use this approach right now.


Basic Requirements

*********************


Here are some basic functionality that the chosen approach can do for it 
to be viable for the connector + addon board setups:


1. Dynamic device addition/removal from userspace


A lot of connectors + addon board setups do not have any dynamic 
discovery addition. This is compounded when talking about treating the 
whole header in SBCs like PocketBeagle 2 as a connector, since people 
would want to wire LEDs and stuff to individual pins. So a mechanism 
using sysfs or configfs is required


2. Dynamic device addition/removal by driver using EEPROM or something else


Some setups (MikroBUS boards with 1-wire EEPROM, Beagle capes) have 
EEPROMs that contain board information which can be used to detect which 
overlay should be applied.


Main Discussion

*****************

The main topic I wish to discuss if global devicetree overlays are okay 
for addon-board setups. Let me outline some reasons for I prefer the 
local devicetree overlays approach:


1. Addon board removal on multiple connector setups


Say connector A added an I2C device to the controller, then connector B 
added an I2C device to the same controller. I am not sure how well 
removing overlays out-of-order works.


2. Who owns the device


Say there are 2 connectors A and B. Both connectors share an I2C 
controller. Let both connectors have the same device attached. In case 
of `__symbols__` based approach, both connectors would technically be 
successful in applying the overlays, rather than one of the overlays 
failing.


3. How to register the newly added devices


I am a bit unsure about this one since I will have to check if the 
kernel tries to register new devices automatically after applying the 
overlay. For local setups, I was using `devm_of_platform_populate` on 
the connector device.


4. Security


I think local modification is more secure than global tree modification. 
A completely local solution should be as secure from devicetree 
perspective as USB. But I am not an expert.


Drawbacks of local setups

***************************


1. Needs a lot of surrounding work.


I2C bus extension is needed for I2C devices to work, something similar 
for SPI. At least ADC, PWM and GPIO should be covered with just nexus nodes.


Closing Thoughts

******************


I would really like to reach consensus regarding weather the addon-board 
overlays should be global or local. This will help to give a direction 
regarding what should be improved, and hopefully make future development 
move faster. Once a bit of consensus has been reached, we can discuss 
specific implementations.


[0]: 
https://lore.kernel.org/linux-devicetree/d42100cb-eaa0-487f-aaaa-6d8f87bc0705@beagleboard.org/T/#m09b2ebe28b6202b2a926970150caf718eff6d9ac

[1]: https://www.mikroe.com/mikrobus

[2]: https://www.beagleboard.org/boards/pocketbeagle-2

[3]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/

[4]: 
https://lore.kernel.org/devicetree-spec/dbe566ea-447f-4f91-a0b2-f464374955f4@beagleboard.org/T/#m591e737b48ebe96aafa39d87652e07eef99dff90

[5]: 
https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

[6]: 
https://lore.kernel.org/devicetree-spec/20250401081041.114333-1-herve.codina@bootlin.com/T/#t



Best Regards,

Ayush Singh

