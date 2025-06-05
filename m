Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03693C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108148; cv=none; b=BgtJHwY3nZoDvbhULCyGj2lJF1/B7hLkeSR6O53sc2JPbHrYDqs3e0gZ/fXQf8C0GcA4PQ3HMD64v5Ut+1NTN5e1NleJCbzGF9s3Y9u40IK3Pv+ZmrMyps03HtFDjBkAU/ygbBC6/XMO9NMldmeEKrSo/oanqPPNzNU84pCqGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108148; c=relaxed/simple;
	bh=Xj0qVduvkfNNAymLsFpnuTF6iaRVq+LqI26/r4nJg9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhffTD7PtHAJNwq+Ay0WYginGeZVjhnuwgShgwGjlHfeuOMU8ba4rFiLRLtfUfWazNeNp17ZUvp2Bk8KIXpXQbIAjqbQ09yX3z1glpxmtIE4TgZe190/olIAs/l9z+RvUiLESmApzJY9u1GmzFKQnS4XHCc1kJMn9t8dNeWfYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=L253a5sD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="L253a5sD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so6241475ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749108146; x=1749712946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s54XltCVmAUnUhMdyeOTgfgQzhaCaxghrC7kFQQg7IA=;
        b=L253a5sDvI/sfFO5Q9y4610sh8lF1FF+cGAQITsKG0yscwUaaMhfKR9zl9BDD3MSXM
         0mpo59CXItY5a78WB+DXkQW/wm3WRYfF21Qf9fAueeOnHd2a4W51auC9tUhodgVzUxvq
         Gxr3TxXJF1Tm/olQopEqqeRlpZK6tuocvBhQoi9EFMVkUC/h9i29Majh3+z0oiGZpHGO
         rpJdHOBXqUXXKr7kECZxd+Rkdt8HQYlGFuGE4PVSlqudxJORQTKly+J4PNMAFZStrooT
         S+w9CNhzqW6hRsLhORhwJ3oCyNtHwui/Yg71/nb9z0t5+7UnLV4rHQoe4GioZveY3YML
         PX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108146; x=1749712946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s54XltCVmAUnUhMdyeOTgfgQzhaCaxghrC7kFQQg7IA=;
        b=miXgBXVoDq2QhYqRwD1myrFL5MLYKLvHyMAX5ci5PCU1bmh3+c3vTUP4jVUZaFn1hS
         YLaNYeLrV9yDYp+xreqIvR2iqVlmz/8G1bPL4LOarG4Dl5uhhhKREVP9tpPeXKcrviNF
         7Hqjdcde3BjrDBx+u0pt1h4Whs2ZG14Us4UUISpBMDfh3j4zGecYw/WcNvs3P9EcEdpu
         OJRYFpe8Zkrm1rEf1393X3eHOb7RF8/ma4UPUBPyaLEIdWpPSkKix+iDzbjIxFb5MmGV
         keE1yB222+DIn//Z0xmY7NXjYggWGN56TyDRivrM+CfF7IbOMHN2G3/uZ1M8D7hVkVBh
         OP9w==
X-Forwarded-Encrypted: i=1; AJvYcCWFTM0r18MsxbhrhAokIjeWC0l1fVq0IFMO/qDuVKShdRQb37oadbNPnAvzdITxUtpeeGOQC2HIdlFb7Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeR549gaRkNZch8Zc6gRc6/5PQAbGMuCucnp/+GN8qFK/t7crM
	V2X+MW84CGe93nvET/5dEN3ecJqB5hGfn8mPc4q1uFPOo3G/AfYi3W1JWwg9nlNBQA==
X-Gm-Gg: ASbGnctu7ALjYuzJHbYyeiuOt0aMovfYFwH5arOliu9bERhzc+LlJ7GHTZCm1vO9BCJ
	hP4ExP7KwzcoixC9c65v3Ewg+iHJQt9To0VVjyyGecbPIecDe3HNQoeqERePojkqPJDrWfArAid
	QDNzcqESBJV1JWfjOzEw2u4Ie7aoCfplT60nDvE/umZ7RXLXKL4q7vA1jjm7iMPC+wxV4e249va
	iHNYT9K5hbNkZlFzTFGMnodlIxnLW+u6OEXarupJ3ia7nuJOZymNJDHhtG/3l2la45ynx5fhFb2
	WTdP1fecg8XQfoQm9FFVs4iaVLrTVIV5EbgHtviSzm5+fz0kRrSpAK/ZELGccqf3Ljx5+LEeaTf
	zf0XBMgNolfLFdgWLdh/E+c6hMSUX
X-Google-Smtp-Source: AGHT+IEMFsbXk3xlc/MF5m2uNRIJnfOrj26FN6ViAOD1Cg37fuHX6PMNjT8Lo6xr/L/UWQSLX0uz5A==
X-Received: by 2002:a17:902:ec8d:b0:235:779:edf0 with SMTP id d9443c01a7336-235e1200772mr82405135ad.50.1749108145681;
        Thu, 05 Jun 2025 00:22:25 -0700 (PDT)
Received: from ?IPV6:2401:4900:8899:bab8:9a99:8bde:e080:9339? ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14ad4sm113848685ad.234.2025.06.05.00.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:22:24 -0700 (PDT)
Message-ID: <46bb7e4f-1e65-4510-a27f-19ae87c4c272@beagleboard.org>
Date: Thu, 5 Jun 2025 12:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Andrew Davis <afd@ti.com>, xypron.glpk@gmx.de,
 Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Robert Nelson <robertcnelson@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <967bc855-76f3-4598-853c-d65ce142995d@ti.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <967bc855-76f3-4598-853c-d65ce142995d@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/5/25 00:33, Andrew Davis wrote:

> On 4/30/25 7:07 AM, Ayush Singh wrote:
>> Hello everyone,
>>
>>
>> This mailing thread is dedicated to discussing what approach should 
>> be taken regarding overlays for addon board + connector setups. It is 
>> loosely a continuation of [0], so feel free to go through it.
>>
>>
>> Introduction
>> *************
>>
>> To provide a background, the goal is to have a common way to support 
>> setups involving addon board + connector. Some examples are as follows:
>>
>> - MikroBUS [1]
>>
>> - PocketBeagle 2 [2]: After discussion in [0], it seems that even 
>> board headers should be treated as a addon board + connector problem.
>>
>>
>> There are 2 main approaches currently floating around. They serve as 
>> examples of Global and Local approaches. However, the main discussion 
>> topic is global vs local rather than the specific approaches.
>>
>
> This is far too reductive, local vs global is only a minor detail as part
> of a couple proposed solutions to a much larger topic. There are much 
> more
> fundamental issues around add-on boards to be worked out before we get to
> this level of detail.


Well, I am not sure that is quite true. The problem is that it seems to 
be a major blocker for things like sysfs and configfs devicetree overlay 
patches. And if we go with the global route, well, we are pretty much 
re-implementing those patches. Maybe we can add some way to check that 
only i2c-connecotr, spi-connector etc parent nodes for a add-board 
connector are modified, but well, not sure if that is enough.


>
>>
>> 1. __symbols__ based approach [3]
>>
>>
>> This was originally proposed by Andre Davis [3]. It defines an 
>> overlay with just special names in `__symbols__`, which is used along 
>> with an overlay for the addon-board, which makes use of the node 
>> names defined in the connector `__symbols__` overlay. Please take a 
>> look at the original patch series since it provides a working example 
>> of how it can be used [3].
>>
>>
>> It has a few nice benefits such as it works pretty well with existing 
>> infrastructure, and does not need much in the way of new 
>> functionality. However, for this discussion thread, I want to 
>> consolidate the discussion regarding how this approach directly adds 
>> the devices to the appropriate nodes, Eg. An SPI device in addon 
>> board will be added to the appropriate SPI controller, etc. This 
>> means the changes are made to the global tree.
>>
>
> This is how devices are already added, if you add a SPI device you
> put it under the SPI controller. There is no "global tree", there
> is just one device tree to represent the device, and it has a well
> established ways of hierarchically representing devices.
>
>>
>> 2. export-symbols based approach [4]
>>
>>
>> This approach was originally proposed by Herve Codina [5]. It defines 
>> a special node (local to the connector) say `export-symbols`. This 
>> node takes precedence over global `__symbols__`, and thus is used to 
>> define standard names for nodes used in addon board overlay. Please 
>> look at [4] to get a more in-depth explanation.
>>
>>
>> The main difference here is that all the addon board overlay changes 
>> are isolated to the connector node in the devicetree. Eg: an I2C 
>> device in addon board will be added to the connector node (as defined 
>> in i2c bus extension patch series [6]). This means the changes are 
>> made to the connector node and not the global tree.
>>
>>
>> This approach needs extra plumbing (like i2c bus extension [6], 
>> something similar for SPI, etc) to make the whole approach work. Only 
>> GPIO and PWM with Nexus node can use this approach right now.
>>
>
> This is the more fundamental issue: do you want to work within the 
> existing
> device tree framework, or do you want to make something new. 
> `export-symbols`
> is only the tip of the iceberg of new things that will be needed.
>
> This "extra plumbing" is bus extensions in DT for every wired bus type.
> Countless new Nexus nodes, connector definitions, pinmuxing, and bindings
> for the same. And then changes to DT overlay tooling including all the
> infrastructure that uses overlays in many external projects, which 
> IMHO is
> the largest issue here.
>
> My core point here is this, imagine you take a BeagleBone and plug in
> a cape. This statically combined device in your hand can be completely
> described using existing DT today. For any solution we come up with for
> doing this dynamically, the resulting DT should look the same as if
> it was done for the combined device by hand ahead of time. The combined
> Beagle+cape device is exactly the same device no matter what time you
> plug in the cape. So why should the DT that describes this combined
> device be different in the two cases?
>
>>
>> Basic Requirements
>>
>> *********************
>>
>>
>> Here are some basic functionality that the chosen approach can do for 
>> it to be viable for the connector + addon board setups:
>>
>>
>> 1. Dynamic device addition/removal from userspace
>>
>
> I'm going to suggest we ignore the removal part. Not because it is too
> difficult to solve, but because it is impossible to solve.
>
> A huge amount of drivers and devices do not actually allow for removal.
>
> The reason is because there is no need, hot-pluggable busses are the
> exception, not the rule. The rare cases like USB are built to handle
> this both in hardware and software. None of the connectors we have
> talked about are actually hot-pluggable! I2C, SPI, etc.. none of
> these are hot-pluggable. Even if you get away with yanking the cape
> off a BeagleBone while it is running once or twice, it is violating
> the electrical specifications and you will eventually break something.
>
> If we don't focus on the (non-valid) removal part, so many other parts
> solutions become viable again. Right now we have no good way to even
> *add* an add-on board, even statically, so let's not let "perfect" be
> the enemy of good..


Not quite, removal is a very important part of the equation, specially 
for mikroBUS. mikroBUS iteself is not exactly hot-pluggable, but Beagle 
has a usecase of mikroBUS over greybus (over 6lowpan). Since the node 
can be removed, you now have a setup where mikroBUS becomes removable.


>
>>
>> A lot of connectors + addon board setups do not have any dynamic 
>> discovery addition. This is compounded when talking about treating 
>> the whole header in SBCs like PocketBeagle 2 as a connector, since 
>> people would want to wire LEDs and stuff to individual pins. So a 
>> mechanism using sysfs or configfs is required
>>
>>
>> 2. Dynamic device addition/removal by driver using EEPROM or 
>> something else
>>
>>
>> Some setups (MikroBUS boards with 1-wire EEPROM, Beagle capes) have 
>> EEPROMs that contain board information which can be used to detect 
>> which overlay should be applied.
>>
>>
>> Main Discussion
>>
>> *****************
>>
>> The main topic I wish to discuss if global devicetree overlays are 
>> okay for addon-board setups. Let me outline some reasons for I prefer 
>> the local devicetree overlays approach:
>>
>>
>> 1. Addon board removal on multiple connector setups
>>
>>
>> Say connector A added an I2C device to the controller, then connector 
>> B added an I2C device to the same controller. I am not sure how well 
>> removing overlays out-of-order works.
>>
>
> I don't follow here. Multiple of the same I2C device are still 
> identifiable
> even on the same controller. Their IDs give them away, and even if 
> not, this
> would be trivially solved with a little bit of meta-data tracking in the
> driver model layer.


By ids do you mean I2C address or the driver id?

What I was mentioning here is as follows:


add-board:

```

&CONNECTOR_I2C {

     sensor: sensor@12 {

         ...

     };

};

```


We apply the same addon board overlay to connector A and connector B. 
And CONNECTOR_I2C is same for both connectors.


This will resolve to:


```

&CONNECTOR_I2C {

     ...

     sensor: sensor@12 {

         ...

     };

};

```


There will be no errors but the sensor would be registered only once.


In case of a local system, 2 sensor nodes will be present in the global 
devicetree, and one of the sensors will fail during registration.



>
>>
>> 2. Who owns the device
>>
>>
>> Say there are 2 connectors A and B. Both connectors share an I2C 
>> controller. Let both connectors have the same device attached. In 
>> case of `__symbols__` based approach, both connectors would 
>> technically be successful in applying the overlays, rather than one 
>> of the overlays failing.
>>
>
> How does the connector solution help here? Seems the `__symbols__` way 
> would make
> it easier to detect as both devices would need added to the same 
> controller node,
> which would be the point to detect such conflicts. Were each connector 
> would have
> no way to communicate that the resource is double-booked.


You can see the current devicetree at `/sys/firmware/devicetree`, so 
there is that.


Also, when applying devicetree overlay, if the node already exists, the 
properties are over written. The overlay application will not fail. And 
in many cases, the property changes will not even be handled by the 
sensor/device driver.

Also, things like `/delete-node/` and stuff do not work in overlays.


>
>>
>> 3. How to register the newly added devices
>>
>>
>> I am a bit unsure about this one since I will have to check if the 
>> kernel tries to register new devices automatically after applying the 
>> overlay. For local setups, I was using `devm_of_platform_populate` on 
>> the connector device.
>>
>
> Easy to solve for either method, we can always re-run the device 
> registration loop
> after applying an overlay if it doesn't already.
>
>>
>> 4. Security
>>
>>
>> I think local modification is more secure than global tree 
>> modification. A completely local solution should be as secure from 
>> devicetree perspective as USB. But I am not an expert.
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
>> I2C bus extension is needed for I2C devices to work, something 
>> similar for SPI. At least ADC, PWM and GPIO should be covered with 
>> just nexus nodes.
>>
>>
>> Closing Thoughts
>>
>> ******************
>>
>>
>> I would really like to reach consensus regarding weather the 
>> addon-board overlays should be global or local. This will help to 
>> give a direction regarding what should be improved, and hopefully 
>> make future development move faster. Once a bit of consensus has been 
>> reached, we can discuss specific implementations.
>>
>
>
> There is one big benefit of evil vendor trees: you can test things out 
> like
> this before sending things upstream. You are working with the Beagle 
> folks,
> and that has to be the most perfect testing ground for add-on board 
> overlay
> solutions.
>
> So I would suggest you take the solution you like the most and 
> implement it
> in the Beagle ecosystem. Try it out and find the pros and cons first 
> hand,
> see if it can even work in the first place.
>
> Asking everyone to all reach a consensus on the "right" solution by
> talking it out is not going to happen here. This has been an open issue
> for way too long for it to be that easy :)
>
> Andrew


Well, I wanted to try an upstream first approach, specially since 
everyone else has given up on upstream. The current situation is quite 
messy. mikroBUS in the wild uses modified greybus manifest. In fact, 
there are official guides that show the greybus manifest approach. But, 
those patches were rejected last year, with the suggestion that upstream 
wants devicetree to be used for this purpose. Btw, manifest was already 
in use for 4 years at that point with greybus manifest for 100s of 
addon-boards.


So I was hesitant to have a 2nd out of tree approach for the same. But 
at this point, it does seem more productive to just go the vendor tree 
route for now and try again in a few years.


>
>>
>> [0]: 
>> https://lore.kernel.org/linux-devicetree/d42100cb-eaa0-487f-aaaa-6d8f87bc0705@beagleboard.org/T/#m09b2ebe28b6202b2a926970150caf718eff6d9ac
>>
>> [1]: https://www.mikroe.com/mikrobus
>>
>> [2]: https://www.beagleboard.org/boards/pocketbeagle-2
>>
>> [3]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
>>
>> [4]: 
>> https://lore.kernel.org/devicetree-spec/dbe566ea-447f-4f91-a0b2-f464374955f4@beagleboard.org/T/#m591e737b48ebe96aafa39d87652e07eef99dff90
>>
>> [5]: 
>> https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
>>
>> [6]: 
>> https://lore.kernel.org/devicetree-spec/20250401081041.114333-1-herve.codina@bootlin.com/T/#t
>>
>>
>>
>> Best Regards,
>>
>> Ayush Singh
>>

Best Regards,

Ayush Singh

