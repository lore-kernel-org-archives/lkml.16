Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059731E0DCB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746079548; cv=none; b=QSEnsxhDuDKoovlWfbaqmcptOV81mbv7s3IWycNfisNoVDfKbDB9PaJLgwug5xo4mcorNQZA3O9yQft14nGEz45zv0suKO4A62USFWBbaBlNaOMLBayLbzeXTlJ2jXn5Do7t+8ITSudbLZKEwQP61inEv/Tu/geuTEek/EOQBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746079548; c=relaxed/simple;
	bh=ebX4kjjeAk/T6UkG9bfRI2zXpD3t4dEBsWz88dQIu5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGzMys05WIsw9Y0OdNkBjcqLLa6OdveDW/xceQsnyuC7nc988Ywyki5Z/yibds9u9spM8pdF7HZT4yglJi8UOc73gMaAPjC0fz0+VfU5b9iHQmq+QM64GSeRsEpLat7Wxb+fsSGjfEQVBOUsuwl4t1lYNDNV27e1p/jBKl3znis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=kKUXQJ0P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="kKUXQJ0P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e033a3a07so6033545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1746079546; x=1746684346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRZmfpO1P74PhJzXliC53uO9aC2D1vNTqm4YKRxWEcA=;
        b=kKUXQJ0P/d9zuDavysszT3D/kh6XpR9itzewaLifwCTrlZLQxWxHAhDL8p/HPBQRqp
         NKCoRH2BKe8P2AlnvGihDtJzuN6pQHhktn+EnaYgCQGgNKSTzZXjTL7Wt29ulOuSDJn3
         ZSl/vjsFxvGhxAjtstmk8yHmge9TFXDtLvBUf6pWRLB3KIgbhWSpzyGwlVEX2h756MqQ
         3voD5+Hea8tLODVL4N1fdZTnnuSK7WVc4abNSc/v9/Wap09yQWWZiNLmWASe9TgJGTcg
         12S314syGaVhaMoNO/wkIw/AlDY7jo31+crFfrX1HftC+klLARjLD47oeK5snLt+cSy7
         rXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746079546; x=1746684346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRZmfpO1P74PhJzXliC53uO9aC2D1vNTqm4YKRxWEcA=;
        b=Ckt8t1AjWLXR5c080EqfTZUpDvz4IkghC6pHXoxm0nrnIcJLjjWDrPwjQV8z1DV4PD
         QGZ3kJrOW/2iezh7VujYIhEYkuWVGJ3N4XcrXIpa2yrPmwqEeWLWcyjtQxXn8NXFjSZz
         I7T4BeZC1O19zVTQgzCBc/41o3/QpwrazCljTQUg6f4/fuOqIVzLjW4bf+SCsb8uBaf8
         6DYEwzoPrxSo07njr0fsqrGPTI60IAZzTzEjNHQE20D1ZjT5OzhCva7cIgVupazbXEsA
         Zy8IbSjiiaOZywr9ScMf/d7YixVsfenyhM6Xa/rgKYNuG8Tv8560GMm9nwZciBYb62Rk
         M/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAKzDN4I0jP7BGMCAYLEV9ollMJM5gH1QjJTnZq+wMFpGkZn2baLBeG4SsoW+k42baQWlgenEhMG1tDrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbFnEtv4su3/Q37GNSphGsLSRIuu6mRk3dne63NagYtxZV3px
	SatFlijJruUkqtfJrYIfQgDct8Z3G+V2+Ae3xb1wS0JDgNLysUHnVDkFfFqBQg==
X-Gm-Gg: ASbGncupYApC5GJmJBfJzpBrTs/UyitMjfEUb7nCY5ECMCL0ybNUwBC83e0B1VdJv6+
	FGT8QcXhWSYXmxecqNArA6SIML36SnMDaMh1m11KRJqSwizfM8CuzaDQS+gzd9BueNGBd11T9Nn
	hWJVbuH3b37+5PhIFwchS95HfOcHaQO1T7dB77Fr6Ava2kp6k/9LWjZKr0G1BYVO4uF2Str2/oO
	qgxGAo2i+LO+7l5szwRqKJr9BSMxb4tnfHTy5XxYCc6bwGIrSb6QW3CCdy5zhgcABmZFy1foMOp
	CtnhdUJLKOMPnm4/g5A2YGLjr2++bj3pVa6KdE0zW01gUY8=
X-Google-Smtp-Source: AGHT+IFSb9SeALJsoI4So+DVFSsvUV5E2zu19q9VYJ8RSpXoNHTulJ37Swykbf9Xy0NoS4rJwP90iw==
X-Received: by 2002:a17:902:c403:b0:224:2524:3047 with SMTP id d9443c01a7336-22df35067f0mr85525845ad.26.1746079546038;
        Wed, 30 Apr 2025 23:05:46 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm132561135ad.180.2025.04.30.23.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 23:05:45 -0700 (PDT)
Message-ID: <f22811ea-c44c-4900-a6c7-11bec12a7e8a@beagleboard.org>
Date: Thu, 1 May 2025 11:35:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Herve Codina <herve.codina@bootlin.com>
Cc: xypron.glpk@gmx.de, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <20250430160944.7740d5e9@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250430160944.7740d5e9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/25 19:39, Herve Codina wrote:

> Hi Ayush,
>
> Thanks for this discussion initiative!
>
>
> On Wed, 30 Apr 2025 17:37:33 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
>
> ...
>
>> 1. __symbols__ based approach [3]
>>
>>
>> This was originally proposed by Andre Davis [3]. It defines an overlay
>> with just special names in `__symbols__`, which is used along with an
>> overlay for the addon-board, which makes use of the node names defined
>> in the connector `__symbols__` overlay. Please take a look at the
>> original patch series since it provides a working example of how it can
>> be used [3].
>>
> The __symbols__ based approach needs 2 overlays to handle the case where
> 2 connectors (A and B) are present an you want to connect a board described
> by a single overlay.
>
> The first overlay applied "adapts" the __symbols__ node for the connector
> where the board is connected (for instance connector A) in order to have
> the symbols used by the overlay describing the board resolved to the
> correct symbols.
>
> I think this open race conditions when the overlay is applied by the kernel
> itself. Indeed, we need to perform 2 steps in an atomic way:
>    1) Adapt symbols
>    2) Applied board overlay
>
> Also, a 3rd step should be added to restore symbols modified to their
> original value after the overlay is applied. This should be done to avoid
> any symbols collision.
>
> An other negative point is that properties in __symbols__ node are not
> described by device-tree bindings.
> How can we ensure interoperability between different base board.
>
> The export-symbols node is a node fully described in the DT and it is
> a sub-node of a connector node. This connector node has compatible string
> and a binding describing its own property and sub-nodes. Among them, the
> export-symbols node is described and can be checks by dt_binding_check.
>
> This implies that whatever the base board, for a given connector type
> (compatible string) the properties inside the export-symbols node have the
> exact same name. Any addon board overlay designed for this connector type
> will apply whatever the system where this connector is soldered.
>
>> It has a few nice benefits such as it works pretty well with existing
>> infrastructure, and does not need much in the way of new functionality.
> With existing infrastructure in the kernel, it leads to memory leaks if you
> add or change a property in an existing node.
>
> In other word, each time you update a symbol in the __symbols__ node, you
> have a memory leak.
>
>> However, for this discussion thread, I want to consolidate the
>> discussion regarding how this approach directly adds the devices to the
>> appropriate nodes, Eg. An SPI device in addon board will be added to the
>> appropriate SPI controller, etc. This means the changes are made to the
>> global tree.
>>
>>
> ...
>
>> Basic Requirements
>>
>> *********************
>>
>>
>> Here are some basic functionality that the chosen approach can do for it
>> to be viable for the connector + addon board setups:
>>
>>
>> 1. Dynamic device addition/removal from userspace
>>
>>
>> A lot of connectors + addon board setups do not have any dynamic
>> discovery addition. This is compounded when talking about treating the
>> whole header in SBCs like PocketBeagle 2 as a connector, since people
>> would want to wire LEDs and stuff to individual pins. So a mechanism
>> using sysfs or configfs is required
> request_firmware() or the firmware upload feature (CONFIG_FW_UPLOAD) could
> also be used if the connector is seen as a specific device and has a driver.
>    https://elixir.bootlin.com/linux/v6.15-rc3/source/Documentation/driver-api/firmware/fw_upload.rst

Yup, my current plan is to use request_firmware. If it is good enough 
security wise for remoteproc, it should be fine here as well.


>
>>
>> 2. Dynamic device addition/removal by driver using EEPROM or something else
>>
>>
>> Some setups (MikroBUS boards with 1-wire EEPROM, Beagle capes) have
>> EEPROMs that contain board information which can be used to detect which
>> overlay should be applied.
>>
>>
>> Main Discussion
>>
>> *****************
>>
>> The main topic I wish to discuss if global devicetree overlays are okay
>> for addon-board setups. Let me outline some reasons for I prefer the
>> local devicetree overlays approach:
>>
>>
>> 1. Addon board removal on multiple connector setups
>>
>>
>> Say connector A added an I2C device to the controller, then connector B
>> added an I2C device to the same controller. I am not sure how well
>> removing overlays out-of-order works.
>>
>>
>> 2. Who owns the device
>>
>>
>> Say there are 2 connectors A and B. Both connectors share an I2C
>> controller. Let both connectors have the same device attached. In case
>> of `__symbols__` based approach, both connectors would technically be
>> successful in applying the overlays, rather than one of the overlays
>> failing.
>>
>>
>> 3. How to register the newly added devices
>>
>>
>> I am a bit unsure about this one since I will have to check if the
>> kernel tries to register new devices automatically after applying the
>> overlay. For local setups, I was using `devm_of_platform_populate` on
>> the connector device.
> It depends on the bus the device is added.
> when an overlay is applied by the kernel, OF_RECONFIG_* events are
> triggered. Some buses handle them:
>
> 	$ git grep OF_RECONFIG_CHANGE
> 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
> 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMOVE on device going from enabled to
> 	drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_ADD on device going from disabled to
> 	drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
> 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
> 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
> 	include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,
>
>>
>> 4. Security
>>
>>
>> I think local modification is more secure than global tree modification.
>> A completely local solution should be as secure from devicetree
>> perspective as USB. But I am not an expert.
>>
>>
>> Drawbacks of local setups
>>
>> ***************************
>>
>>
>> 1. Needs a lot of surrounding work.
>>
>>
>> I2C bus extension is needed for I2C devices to work, something similar
>> for SPI. At least ADC, PWM and GPIO should be covered with just nexus nodes.
> I wouldn't say 'a lot'.
> I already did the work for I2C bus extension [0] and the implementation was
> not so complex.
>
> [0] https://lore.kernel.org/all/20250401081041.114333-1-herve.codina@bootlin.com/

Well, when I say a lot of work, I don't mean codewise. That will be 
pretty simple actually. The problem I foresee is convincing everything 
in different subsystems. Basically, a lot of discussions.

Still, I do think figuring these things out now would be best in the 
long run. After all, while I cannot say for everyone else, I want to use 
this setup for at least MikroBUS, Grove, PocketBeagle 2 connector, 
BeagleBone Black connector, and RPI (for BeagleY-AI) connector.

>>
>> Closing Thoughts
>>
>> ******************
>>
>>
>> I would really like to reach consensus regarding weather the addon-board
>> overlays should be global or local. This will help to give a direction
>> regarding what should be improved, and hopefully make future development
>> move faster. Once a bit of consensus has been reached, we can discuss
>> specific implementations.
>>
>
> Again, thanks again for initiating this discussion.
> Hope this will help to move forward on this topic!
>
> Best regards,
> Hervé


Ayush Singh

