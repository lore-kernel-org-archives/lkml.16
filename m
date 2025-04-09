Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4133595C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218544; cv=none; b=CGKmr6IrtQwW0TBcSGt9vAclKkU6bJHwHeHXI2n/kwyFE3HlMVRwCbOPJrYcR1lNMEAK8vUWhBXdDd1425cyIUrgy+0AaHkjDHA8md1yinwWgMcVWCLWzE6BlHLWlcUUs6jtB7s2MZlXT61scscntIqg0pAhyLdNc5hta4RSqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218544; c=relaxed/simple;
	bh=Mev02kWb7K5qiFud07ATCV2nKnxOjc1jvqk3EpgXYIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZxdyJ7F0wEM/4rZNzAw0RRbiISVT0ys/OfAX5Epg1gdCa5lu0eCnj0TRlxocQlKpidQAaVnlKvG3QT4rIRUK5RF+KciLCJo3D0fue+i/h4eOGU5n71BUPes1GSFSuKJGQX3Od7FgxedS4Yz5Apu1IzSBxynmsjy2p4mr7FaKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJv8J2EK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJv8J2EK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7396f13b750so7166692b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744218542; x=1744823342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mKY8PJec5kYg0iEFAd+4ifcsKowLyA7pbf6teQQhHX8=;
        b=JJv8J2EKzbG2+i0t4EQY5QUWq9xrlF/h3+YfR2GOve93hnR6oA/awbgoB2WVQPX6Tq
         tv3ONiO6xT0CJDnhZDWngzOac1EalA0pb0JA0BONp+Ics3yvK6azhdVJ4MiXHheIqwvn
         XQbfnLjCm23Q3daX6YqTPNVAzdQf53vpwKV5nDCpPL9Sqwe3Ai/vAUfzyqk/W99MQy/w
         Ohaq6S/6MGB1nEMhnXPT5X30qzMZLS8fSGOzgs05mblEvEmBENX1KgH48m2FrGOkex11
         RIzHwF48ph7+HANVJczHh8TsI3ZrYT2cg+QNwzWAl7ccRw4LaQCPaKUyuLOa7Tt4wAkl
         564g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218542; x=1744823342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKY8PJec5kYg0iEFAd+4ifcsKowLyA7pbf6teQQhHX8=;
        b=q4qdEH4YwetsmByV6F3vMARr6/2Mys7UlNS8Z36ZM6ctOxeA4UcWGNR0pdV41TweAZ
         4ye3jUUzL4FRASQaUeKBLIRt+jQc4daNA/gQPO/zCzFsDGc2+0/6QAwbpWAm/wFQo05l
         g4Qx0j7l2hAqLjpu70KMJPJ3+X7HVETpyuWtBAqnOQArsYSeFnpJjOKprod412sIV1wD
         b+yA5TYSKgSKPIV8BNOCtufIbW52pcwL2k1U0YLYU1PXKXc5BzbzQ42TqafTFV/jnMBJ
         RW9LB5Ss42dTaQUHyt0+WlOCW4zfRF02j5A9/aipFLwdTXYhC6NBey3WCIdPmOMnOHMn
         y2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUgqmAIAwULRikGRPTTZ3ngOgpeSWB4IurmoREUOlJJW2iW5Qiz8VSOWLnX/sDddcEpZoH9muF7eL/j23Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcaFxsR4bY7AVAwoKCJxiK+sXMfP0fEp04U+73sPwvQB0k/vn
	fsDAdJvuwPwFbZeZRbiTB8sUnZA0JMdUhQZf6C3MH5iKj3y95QQ2XCUf6J/I5w==
X-Gm-Gg: ASbGncsfEz6SGjDyqzQrT91FZD3H/h3ZWShN8CF6vVeHbZSP60a/aK2AfzC8iB66fTv
	RWDdEzj29NuK5FInrVRv19e8wPxJEhhOspd54ElqCNjNfPndkECak+05sY2CC8rvDPpOVnXHiMQ
	hSaYVH0Tkq0eMhU++peqIuipRpEp9Z5Ck96D6jBD1tiY6odgjmk17fgzPN0uBgYyQJoBcKWBJsF
	fIOPPxYIsCUytmPH0MftYqjC9v6x2WDMSEF9mSTcT1LRLXIgLA9fZffaSqTkk2vLOnQCyDPCZhR
	RU2wmm9GHmMh3SX47Eh+Mc+1QbruGwWZoYEZHSn9eNtkVtvXvqs=
X-Google-Smtp-Source: AGHT+IFE7dJGIlhcT7iaEMxOXwREi/bb0FDuPpSx0oq/yJ3SzisseJeawE8+VL/qnpnlqMEk9OERFg==
X-Received: by 2002:a05:6a00:801:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-73bae529f65mr3688249b3a.15.1744218542059;
        Wed, 09 Apr 2025 10:09:02 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44c31sm1607891b3a.38.2025.04.09.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:09:01 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:38:56 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Manikandan Karunakaran Pillai <mpillai@cadence.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Milind Parab <mparab@cadence.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] Enhance the PCIe controller driver
Message-ID: <5jc754dnrbytkwrhkj5qjmlxpqa4owhbpeimnr5d7k2aqueysn@uuqdauadlwak>
References: <20250327105429.2947013-1-mpillai@cadence.com>
 <CH2PPF4D26F8E1CA951AF03C17D11C7BEB3A2A12@CH2PPF4D26F8E1C.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH2PPF4D26F8E1CA951AF03C17D11C7BEB3A2A12@CH2PPF4D26F8E1C.namprd07.prod.outlook.com>

On Thu, Mar 27, 2025 at 10:59:08AM +0000, Manikandan Karunakaran Pillai wrote:
> Enhances the exiting Cadence PCIe controller drivers to support second
> generation PCIe controller also referred as HPA(High Performance
> Architecture) controllers.
> 
> The patch set enhances the Cadence PCIe driver for the new high
> performance architecture changes. The "compatible" property in DTS
> is added with  more strings to support the new platform architecture
> and the register maps that change with it. The driver read register
> and write register functions take the updated offset stored from the
> platform driver to access the registers. The driver now supports
> the legacy and HPA architecture, with the legacy code being changed 
> minimal. The TI SoC continues to be supported with the changes 
> incorporated. The changes are also in tune with how multiple platforms
> are supported in related drivers.
> 
> Patch 1/7 - DTS related changes for property "compatible"
> Patch 2/7 - Updates the header file with relevant register offsets and
>             bit definitions
> Patch 3/7 - Platform related code changes
> Patch 4/7 - PCIe EP related code changes
> Patch 5/7 - Header file is updated with register offsets and updated
>             read and write register functions
> Patch 6/7 - Support for multiple arch by using registered callbacks
> Patch 7/7 - TIJ72X board is updated to use the new approach

This one line patch summary is not useful. We can look into individual patches.

> 

This series is v2. Please use version in the subject prefix and also include the
changelog section.

> Comments from the earlier patch submission on the same enhancements are
> taken into consideration. The previous submitted patch links is
> https://lore.kernel.org/lkml/CH2PPF4D26F8E1C205166209F012D4F3A81A2A42@CH2PPF4D26F8E1C.namprd07.prod.outlook.com/
> 

This is not how you would add changelog in cover letter. Please read:
Documentation/process/submitting-patches.rst

- Mani

-- 
மணிவண்ணன் சதாசிவம்
