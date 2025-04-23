Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34E1F875A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399624; cv=none; b=ISSh0AiZ1ws2iVdrlxcasrRo3kftM3mvWRC0dIMRGUOVgdoQ49eGlP9o0EUj/p/r256WZV3quGtcPxShWTHQ3qxoozv9hoFAae4MoX+LyI4Raxuekj8LyfQlZqn01GfwAS4DOnJk31EbRQKerDiPH5bnKLHm5s+bcPOhgMCHsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399624; c=relaxed/simple;
	bh=YsunVWLJv9qgaPhrr/QKtBvOSrEpfPc1uNDsP5UJSIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9wR7+yGJowL+fXhBb9Pi56TPQrA/lYhuhIXBD7rWr8wg90QdFAY2srm80ho83eQvyjBtY6oYkDfJlljkj+hfHGOVm6ceZ39lLLcz9EsPnFcXbNe8t16sE68iaJdRebo6AH/86qb2Hf0+xaOv8TfLO21A/bty1aZxy5rl/XmiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LgwuElfp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LgwuElfp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb415dd8faso911357366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745399619; x=1746004419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6D3Kj5y6LQM0GkGMDpCZ97hnqQlmKF4F8r2fuWuGeQs=;
        b=LgwuElfp8wzS7W14L9O7VBv97Lsmo3ABW7szEcs2g6ppaJKVy+TAtwfzV/Qzu3T09n
         vNJtvgmkEYFl3X7DQndb5uAGQPZnDgu92Jrf7hkVKttEmJoKjWLJX91QiW1tn55swbG3
         80i+CDQo7HK9nF4/Ud3iFg2XOKzmkwkmoNd4JpyGKU8zEhU3zEONcZUI3GWOY+GHiK7H
         jL+61IRB53OykLOg9KmKH6nThN2hIRSqFuWQVzgUpddaBKoa8rpUmna6AEgIqvTbqACJ
         wI9VIZiZ3wbP9jyAngf1XdjqZ5uoEx/zYTrAFNFd4rcXiZxiK7cbxVjQDFe4lQRzlb9r
         8A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399619; x=1746004419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D3Kj5y6LQM0GkGMDpCZ97hnqQlmKF4F8r2fuWuGeQs=;
        b=TpH6uIQI/FGmqYu6EE9t85xm0gjF8QCnQJsoSq30pdRoSkEHavt5tE2QQVET8UdctW
         E01v2a7f+G7Lz/CZ9kUBoX6AjM0ATj0pyT8+cLuJYcPcOO+ZlIAHM748Ns6n5NWeuG/h
         ut7PKLvnQ13ioBvY01citJNO7LltjlDKXrokoDznO8RLhVU71n5t+w3F2PJyFAFQyhXL
         Sp3qzPgt9gCeBtMPSWXgsqrEXkX3bZad6A/O1FHaFVUiJWmIXzXFyzRQ1+kq9bnlcYro
         BzmmcHM9SS3wd0G0Xp56JmheWCMILxIaCBzYBzoQPwgqpDvVvJEkB9m6j3e37iq9BF4P
         XT3w==
X-Forwarded-Encrypted: i=1; AJvYcCU6N5Wq/U73D+otfnRoxw0dv0eoJrHONH6sm7A8mezfXrzzQpmTdQdvaQ/SIE4eigrwtQlWRlCggQFP7V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZINPAsfTFJhYVmkHMSkrhBh4J8P+WMrr8I6dC+dp1Agnid1Z
	fjFmaqSnukHhlxM3xkOHG9qtoBZCeSRNLJg2K21U10t3TD8dFY7SxmikiTO5Iyc=
X-Gm-Gg: ASbGnct0VAzlWlC0QueQ6Csvn0I2Eze7SmiWXx7qhmyvoXDI41Z8nS08ZwjXXLXHbFN
	HzPwyCwcqpeJU3yH+uBaaEfsW5watsDuYp0xLMc+Qssq4KDiG3MY6L26AfDAYAOvUUrJVPEp3AR
	Bmo4dGVrMiAk8Vc2CRog2X9h1CtMCKva2iRzoOHgt/985XiPsaHqjU4Fy2tuPNLs9oDmOzZJmC+
	vY6dexhqVCIuQLanSbN00MFdq+ncH5ZBRu4S3BUYaNO6G0On0ZOM4HRanPMHix+kVIrALWS5Ol1
	tqIEFUEpfT5aK3qgMA3VDFxPTnCi4mE8TDMIaX5wh8AAZdRmZ8NYqk+V2Hh8cc7AY8bcM2tfK0Q
	879FAnPgO
X-Google-Smtp-Source: AGHT+IFzxFQiGoaAPQvdB7be6/KuqryShsyFvmGaT1Th41MerZiCt57msNGvadM1uAaSSZVi3+rZ7Q==
X-Received: by 2002:a17:907:c807:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acb74b2c9a7mr1856705066b.17.1745399619029;
        Wed, 23 Apr 2025 02:13:39 -0700 (PDT)
Received: from [192.168.1.100] (79-100-236-126.ip.btc-net.bg. [79.100.236.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47763sm780902166b.141.2025.04.23.02.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:13:38 -0700 (PDT)
Message-ID: <24a6236b-3e4f-4174-914a-373ddcc90fb0@suse.com>
Date: Wed, 23 Apr 2025 12:13:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 10/11] arm64: dts: broadcom: bcm2712: Add PCIe DT
 nodes
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stanimir Varbanov
 <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-11-svarbanov@suse.de>
 <20250128215254.1902647-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Stanimir Varbanov <stanimir.varbanov@suse.com>
In-Reply-To: <20250128215254.1902647-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/25 11:52 PM, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Mon, 20 Jan 2025 15:01:18 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
>> Add PCIe devicetree nodes, plus needed reset and mip MSI-X
>> controllers.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!

Florian, this somehow missed v6.15?

> --
> Florian

