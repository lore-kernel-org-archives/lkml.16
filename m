Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835C39ACF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125283; cv=none; b=NC/9MzmEthE+iRLUTaSCZbQ5MtkVYIUt48Y4/qU0WmLKiEC0FoEcLrbqoF+L9XMdH2sBeuExNAXkVSMLIUs3IAKTUfYA0iV2smQc5p/p8eSb9AF3yR0ifIpBvwreA7xMHxhr7vOcc7Z64GvjvzP3/UOvgIRQ7yjnJsra79rUMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125283; c=relaxed/simple;
	bh=SPSH2WSE+XljXvfZIgoqUM5llE/o4vKzaxbeTFlVrks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=GSJ/NHmxxWRH4Wf7gD2ZDUiL5bmfmZFXCz9jiCRzwrK2P2lKNxeKYpeLJBY8MppddxHDZIUtOMiid6d42nrwOkAHE5lvgex8MjL3Eqct1W3N+xUvLDLCAFtdoyvxq8X004YPeLu/CyXqN2ealBSRWpgFxTTtYMWcibIa9t+6UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=LrDSWY1f; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="LrDSWY1f"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3d57143ee39so45014275ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125280; x=1744730080;
        h=content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/O97uOoVzQU5zZ/kGe0w5BAxKzZ3HHF/MfBYDQo+ew=;
        b=HQFLeBknIhmRs+XomvA9T5Wil8QCSMrDyrAkF5d05x3FFyWpp0rdQx4T30sIari1kO
         Qu70AZ5VrFi4Yq6khgWE/SsivxAx+IXRHOsm+L35ARmHMGlT4TJOABHc/xDp3cZB1fp/
         KfTJGCy5b3tRNzcTXxBUPD031F4R/e8IcDA4yC/xKQwjPuwrWE9D0naJUqdCM5OHQY95
         E9ARGImRHUSgBz+aV/yeI66Av2bjeWDQQh0+k80nmol8A/I2RJpRDDdVDzoi3qnafPUX
         pfFoci4I014dfL34CpFh9zFPHGgmyJzpH5YpshlzSpxLZVJoTuTn7TO+y0tHVGweL9I0
         nCtA==
X-Forwarded-Encrypted: i=1; AJvYcCUHFJXqmqztrbb36Oxis9fvGyyn8JhnPiFu6NjDbdCNSF77Wd7V0CQ5dxqkNIHnFRtiW3Gnr6cTDtqs+SY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GsNZyt3zRampXFhBTPEmmy34Nplp3K3Iv5iQHXv0vqT1fAt7
	reGh77pga8oubaoMfS9HLtevwPYnTZ27yclPM8XLU5tY4e7e9n0wOeGA6dIygoq6vi0WhCGrJR3
	+cYGJrI4rexG3+AV0F9VEaRrDSdhP+Q==
X-Gm-Gg: ASbGncu7pxj1WBBsJxOm4gg5uu5dszWWL501H7LDzfeYjoYZNx8U/cNeOL/pFGa4xjD
	RF8sKDULM2U0pZN68czE0W/8Sd8msiFVrSLfiyIedIzUhUD2Bc+Tr8HatYx+2tGouKm9QuxJYWy
	roTsgHu6ITRQCnna1tvfnkgsVisLSqZsoiyUxbHaWX5QNnidpofybUM+wXghSJeawyqORCjNqTN
	KWP4eatF+xsf/KvxoXL27HJYz+xLg6lJjqJ3GD3sLE18DrJyfmXEyvPXIgVRg0VHHKIpaUmA2JF
	NXhFRuyK3xHE9rkoUOifTsqN3/Q=
X-Google-Smtp-Source: AGHT+IHRBTG6+uqcyAAc/HKIV+mc/d+bQv8wck3AXmAPQOGb3TE7JsAnfu9/DW9a3DfSEJWosmHZ7CG1JJKH
X-Received: by 2002:a05:6e02:348f:b0:3d5:df21:8481 with SMTP id e9e14a558f8ab-3d6e3e66be1mr184350015ab.0.1744125280423;
        Tue, 08 Apr 2025 08:14:40 -0700 (PDT)
Received: from smtp.aristanetworks.com ([74.123.28.25])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4f4f43bb938sm120574173.3.2025.04.08.08.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:14:40 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1744125279;
	bh=R/O97uOoVzQU5zZ/kGe0w5BAxKzZ3HHF/MfBYDQo+ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrDSWY1faZQQFl9QwD7/kcPM83WYFdTHMX5npzlW1T1CrRpVsZKaNI6dYqh9dIkuc
	 si5P4JoOCqnH5/O+d4FV6NbxTUaZ7GVJijv9lzdewWh5qRutHupZZAT4mCbRY4gTUm
	 EHsaNZ4A9FA1DG4VVOhFkiDXlqJkBvh/9TY61WNOhhuwZ1ueWHNZSJxmCBokFEBr5c
	 W+jRD7fHdR/GT1UqTvM7UAtO/dvZZs+rNI/1H46tQjDV+f470+xFjoEqZjbXhSdMGQ
	 UO88GEFnoKEATLyKVKrsnR/JVwEtsaj/OGnjOVYkvIDAnkF8zLOsxPzgv90IKl8qd0
	 cIXrdxGhPM3pg==
Received: from mpazdan-home-zvfkk.localdomain (abran-ibgpevpn-us285.sjc.aristanetworks.com [10.244.168.54])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 9F23B10023B;
	Tue,  8 Apr 2025 15:14:39 +0000 (UTC)
Received: by mpazdan-home-zvfkk.localdomain (Postfix, from userid 91835)
	id 9864340B19; Tue,  8 Apr 2025 15:14:39 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Marek Pazdan <mpazdan@arista.com>
To: andrew@lunn.ch
Cc: aleksander.lobakin@intel.com,
	almasrymina@google.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	daniel.zahka@gmail.com,
	davem@davemloft.net,
	ecree.xilinx@gmail.com,
	edumazet@google.com,
	gal@nvidia.com,
	horms@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	jianbol@nvidia.com,
	kory.maincent@bootlin.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	mpazdan@arista.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	przemyslaw.kitszel@intel.com,
	willemb@google.com
Subject: Re: [Intel-wired-lan] [PATCH 2/2] ice: add qsfp transceiver reset and presence pin control
Date: Tue,  8 Apr 2025 14:22:43 +0000
Message-ID: <20250408151439.29489-1-mpazdan@arista.com>
In-Reply-To: <6ad4b88c-4d08-4a77-baac-fdc0e2564d5b@lunn.ch>
References: <6ad4b88c-4d08-4a77-baac-fdc0e2564d5b@lunn.ch>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 7 Apr 2025 22:30:54 +0200 Andrew Lunn wrote:

> As the name get/set-phy-tunable suggests, these are for PHY
> properties, like downshift, fast link down, energy detected power
> down.
> 
> What PHY are you using here?

Thanks for review.
It's PHY E810-C in this case. According to spreadsheet: E810_Datasheet_Rev2.4.pdf
(Chapter 17.3.3 E810 SDP[0:7] (GPIO) Connection), it's SDP0 and SDP2 GPIOs 
are being connected to QSFP Reset and Presence pins correspondingly.
I assume you may suggest this use case is not directly PHY related. In first approach
I tried to use reset operation which has following flag in enum ethtool_reset_flags:
ETH_RESET_PHY           = 1 << 6,       /* Transceiver/PHY */
but this doesn't allow for reset asserting and later deasserting so I took 'get/set-phy-tunable'.
