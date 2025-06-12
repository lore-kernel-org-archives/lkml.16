Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BC29C33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742755; cv=none; b=K+cqPZaLF/3HNnQU7jmOo/CkszQYStk7RBSCR5Wtt8kv75Z6OY7nrghc8iokYQx/oGvz2A31/2S5p4NebUg9FqMSihZRmKU+5gB0/tLvjTC1CHIbX3URfsEafHVcOw7CRtt2QNEBx+IEavA7jgOElf0977p+2hxNWSV8QQdyPuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742755; c=relaxed/simple;
	bh=bh6e3aZhERXOjQ6Gx4/GsntMfPc/vEUDeUlfzxV4/OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvV4qxbhfKh+7qtEjWDreCtB4Rin3nlmX0yQx40D4wl3sna/iqV/WLLoi5PZyac5/jNqyaMcbsurAXfZR86HNfc48pa+ycpdjEFhMn5kOLl+K8XpqHrEGrv1a8jv8bPk2B2vLZBo4AUjtT3KQ8trs1tkby3C/v0YnGT7M8/H4Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=icgN1GsS; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="icgN1GsS"
Message-ID: <b7137a4a-cb87-4aa5-958f-a83d3239e967@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749742740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mx5FBx1fw+pZ6pjrn+Y9O7dYZ++IH+lPj2ErOykVNzA=;
	b=icgN1GsSf4dXa2aarzDwWLo3Iju3i34wDoXZoI3hiV79iRnI6s4EulvHLkro7SyECmvQ5b
	1LjfW+VJ6oyFp1e/LYzdQV1XsAuXoDs/RkibJylnYHAndNQJaLHFycVSGp5yNd87wm/fsN
	PWE3e17NjdvWnJNa1YgTcb8Zzgi+DfI=
Date: Thu, 12 Jun 2025 11:38:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v6 03/10] net: pcs: Add subsystem
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>, Simon Horman <horms@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, Lei Wei <quic_leiwei@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20250610233134.3588011-1-sean.anderson@linux.dev>
 <20250610233134.3588011-4-sean.anderson@linux.dev>
 <f5b16bd6-01b6-45c0-9668-41ccf90445a3@infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <f5b16bd6-01b6-45c0-9668-41ccf90445a3@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/10/25 20:24, Randy Dunlap wrote:
> Hi,
> 
> 
>> diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
>> new file mode 100644
>> index 000000000000..4b41ba884160
>> --- /dev/null
>> +++ b/Documentation/networking/pcs.rst
>> @@ -0,0 +1,102 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=============
>> +PCS Subsystem
>> +=============
>> +
>> +The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
>> +of PCS devices. These devices contain the upper sublayers of the Ethernet
>> +physical layer, generally handling framing, scrambling, and encoding tasks. PCS
>> +devices may also include PMA (Physical Medium Attachment) components. PCS
>> +devices transfer data between the Link-layer MAC device, and the rest of the
>> +physical layer, typically via a serdes. The output of the serdes may be
>> +connected more-or-less directly to the medium when using fiber-optic or
>> +backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
>> +with a separate PHY (such as over SGMII) which handles the connection to the
>> +medium (such as 1000BASE-T).
>> +
>> +Looking up PCS Devices
>> +----------------------
>> +
>> +There are generally two ways to look up a PCS device. If the PCS device is
>> +internal to a larger device (such as a MAC or switch), and it does not share an
>> +implementation with an existing PCS, then it does not need to be registered with
>> +the PCS subsystem. Instead, you can populate a :c:type:`phylink_pcs`
>> +in your probe function. Otherwise, you must look up the PCS.
>> +
>> +If your device has a :c:type:`fwnode_handle`, you can add a PCS using the
>> +``pcs-handle`` property::
>> +
>> +    ethernet-controller {
>> +        // ...
>> +        pcs-handle = <&pcs>;
>> +        pcs-handle-names = "internal";
>> +    };
>> +
>> +Then, during your probe function, you can get the PCS using :c:func:`pcs_get`::
> 
> It's preferable to use                               PCS using pcs_get()::
> instead of the :c:func: notation to make the .rst file more human-readable.
> They produce the same generated output.

If you find this syntax useful, then you should update
Documentation/doc-guide/{kernel-doc,sphinx}.rst. I did not use it
because it I did not know about it because it is not documented.

--Sean
