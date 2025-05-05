Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8D219FC;
	Mon,  5 May 2025 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746414776; cv=none; b=FRWnJB5KBRstUtjqpC8jPvSo/RE0MMtclQG0md5GxN/cXvSSz4ifDA7VwLFf/uDJAqy3R06rJb2vxV/9jreqC0+HuciUpBttTYueJkd0PYp+glNND1TYE93ad3WPnMflPIp8JM0lKfp8gcSY+CsLbIHSolfQVcCs7SRKQAdbYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746414776; c=relaxed/simple;
	bh=sIOLIvnuhbx0x5mI+qGYBj4UWxJSZ/LvcsLkVTl3CAc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fhHB6bV1kPVyAwrKP2+Y73mdlDoSe594TaI7y9QkEBZAMVVYuUv2NzKbGteji4hyXFC+ZVyzrngDllOil7dwzVYoFR12fdTxmyFiR/j3CZrNwRHAzEookMVKnQWcbxZ0EZ0nRSWdM96ouNdknVRvPQHC3mNnSDWSAtPgnRHqD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bni77eoQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bni77eoQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so3467598a91.1;
        Sun, 04 May 2025 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746414773; x=1747019573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TlgSStpSYXQ2a9TUV+lZAcOUuuATCiZr4BxvCgwoP5Y=;
        b=Bni77eoQlwkCjR6nPhsmL72oGQLiXdTvJQxeR2sVTtQuRMgtY/qB5jGw5wNBEm7Tp+
         OliRMFHNpzNUmC+Z/EJbz229c8yvl2vuGekOc105miJckZkTF+2BMo01QCnwpQgD/QcO
         KWnZAtwAMsr1mo93E5UeAaid8EAcQjTHnDQ9iEu4Qz5hDyEGvZGYpQ/12kWjTvo1Iw0o
         YaSgP/SHxqazbsiKSn4R1qlBMZV8CPh6E9SvbyNQklAEo8Uc/ohsbGu3Ak8ssxdyqncQ
         Yruvwz9pZ9F++3IX5fJRbqEWWln/IRE9IMMF5NlcY4YHbGyIiyIx6w96PXmHlRGs4gac
         3iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746414773; x=1747019573;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlgSStpSYXQ2a9TUV+lZAcOUuuATCiZr4BxvCgwoP5Y=;
        b=YQir3ApTh+9DR4nLqiHDjQME+1/Mz50MeuGnyOf7b1lld5hao6HeBprE9Qi5Tywjzr
         1ROHvpYKTDjCiFuJLntdVDS937O4GD4cauFsAMWEtwvgpWv8BWzct1E3p1Pod3/RTAd1
         Xl9Hatk3Sqf7E0z5bMR6PLiu+7zh7tVDwzaKnPLFr7XLAaKxVGR/7a+abUDFTOowJ3NC
         mzppq6+V3eo7GZjVC/5x6vxXnSJljhEpMWKUKv3UDbvl955woetLCVltyAbZBc9wm8Ka
         f+sGKpCkOs/ZsKcF/UXyZeM5a2BaGG1v23+TlndW/wTHBdRtz1OXjxqCQAOV+OYmVXkH
         YBJA==
X-Forwarded-Encrypted: i=1; AJvYcCVDV4SI+GvoWy4jUx1/Xr1hW2J0RwRf95j5XwKAv7pDAEdMOJyADQ5BdCf7vSpvlYSxGCXQ33TOAB+HLuy+@vger.kernel.org, AJvYcCVNVjtRX9zyewCTUVaG/1/BuvOzrCgczV8X3jP1V0i542g1QiefjrRIA3AGoZItGtV9B7l7l/ejXj4=@vger.kernel.org, AJvYcCVQFpF62Iq67XaDS2SSkAnmc2rRnzw8+0U/15Z4FbJA3WDUCp/87hNP2cNScyb7AIT3E5wb9Vaa2Y5siI0h5Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaHSJ5nYqHczbNCBT2cN/ZYe4fIoF2nrgwn1+5vbtcZLIEf7b
	F6Zr24XAuuwlEJMBlSph1/Hv47jxyx28wJzf1nvJNl/+Vh98fdn3
X-Gm-Gg: ASbGncu46bAWl2zxczwgotXLSDQH8kpBWK5ompFuyOBzA4HEPDHZHvm8e1Rmx5R9FRs
	CJA9F+jp/SSWo7hRlvXkhwCTJ0e5eoFdBXeQDQJBU/ODxZjdCkyZ7IqZpWVZtO0tSgLscRdyMPy
	07jB2FOABiYaqApaIkfA2krHJUwCx36/gkxeuCTlKEgS6GNlOpl8ABAFtYylScZKpcyLolgWPif
	a2pPzjW2O2eUH1311ej12JLsVks6o1JEDm9s5Xh13WzGNFQMUT3O4eU8YtOhR+xchmyCrZ/Z208
	vhs7sbqYINj8kE0Dd4HaDsVDMnJ2X0O+CJt4lNz4/Vu4Natj
X-Google-Smtp-Source: AGHT+IEIGQK5pJPC9ad+ktF++Wil1ARW/ydqEqUl7LMXOEO9CEBc8/2iFt8F3CH+dqvY45W3k63u+g==
X-Received: by 2002:a17:90b:4c51:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-30a5ae52d16mr10505882a91.19.1746414773098;
        Sun, 04 May 2025 20:12:53 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4762672bsm7527392a91.32.2025.05.04.20.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 20:12:52 -0700 (PDT)
Message-ID: <2b9baf30-53ae-4653-8043-afbc2e396107@gmail.com>
Date: Mon, 5 May 2025 10:12:47 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] nova-core: docs: Document vbios layout
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-4-joelagnelf@nvidia.com> <aBgp5ZTIArRukRk8@archie.me>
Content-Language: en-US
In-Reply-To: <aBgp5ZTIArRukRk8@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/5/25 10:00, Bagas Sanjaya wrote:
> On Sat, May 03, 2025 at 12:07:55AM -0400, Joel Fernandes wrote:
>> +Here is a block diagram of the VBIOS layout::
>> +
>> + ┌────────────────────────────────────────────────────────────────────────┐
>> + │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
>> + ├────────────────────────────────────────────────────────────────────────┤
>> + │ ┌───────────────────────────────────────────────┐                      │
>> + │ │ PciAt Image (Type 0x00)                       │                      │
>> + │ ├───────────────────────────────────────────────┤                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ ROM Header        │                         │                      │
>> + │ │ │ (Signature 0xAA55)│                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │ rom header's pci_data_struct_offset │                      │
>> + │ │         │ points to the PCIR structure        │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ PCIR Structure    │                         │                      │
>> + │ │ │ (Signature "PCIR")│                         │                      │
>> + │ │ │ last_image: 0x80  │                         │                      │
>> + │ │ │ image_len: size   │                         │                      │
>> + │ │ │ in 512-byte units │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │                                     │                      │
>> + │ │         │ NPDE immediately follows PCIR       │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ NPDE Structure    │                         │                      │
>> + │ │ │ (Signature "NPDE")│                         │                      │
>> + │ │ │ last_image: 0x00  │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │                                               │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ BIT Header        │ (Signature scanning     │                      │
>> + │ │ │ (Signature "BIT") │  provides the location  │                      │
>> + │ │ └───────────────────┘  of the BIT table)      │                      │
>> + │ │         │ header is                           │                      │
>> + │ │         | followed by a table of tokens       │                      │
>> + │ │         V one of which is for falcon data.    │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ BIT Tokens        │                         │                      │
>> + │ | |  ______________   |                         |                      |
>> + │ │ │ │ Falcon Data │   │                         │                      │
>> + │ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
>> + │ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
>> + │ │ └───────────────────┘                         │  V                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ EFI Image (Type 0x03)                         │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ | Contains the UEFI GOP driver (Graphics Output)|  |                   |
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │ │ Image data        │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ First FwSec Image (Type 0xE0)                 │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │ │ Image data        │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ └───────────────────────────────────────────────┘  │                   │
>> + │              (no gap between images)               │                   │
>> + │ ┌───────────────────────────────────────────────┐  │                   │
>> + │ │ Second FwSec Image (Type 0xE0)                │  │                   │
>> + │ ├───────────────────────────────────────────────┤  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ ROM Header        │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ PCIR Structure    │                         │  │                   │
>> + │ │ +───────────────────+                         │  │                   │
>> + │ │ │ NPDE Structure    │                         │  │                   │
>> + │ │ └───────────────────┘                         │  │                   │
>> + │ │                                               │  │                   │
>> + │ │ ┌───────────────────┐                         │  │                   │
>> + │ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
>> + │ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
>> + │ │ │ │ Entry 0x85  │   │                         │                      │
>> + │ │ │ │ FWSEC_PROD  │   │                         │                      │
>> + │ │ │ └─────────────┘   │                         │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │                                     │                      │
>> + │ │         │ points to                           │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌───────────────────┐                         │                      │
>> + │ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
>> + │ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
>> + │ │ └───────────────────┘                         │                      │
>> + │ │         │   immediately followed  by...       │                      │
>> + │ │         V                                     │                      │
>> + │ │ ┌────────────────────────────┐                │                      │
>> + │ │ │ Signatures + FWSEC Ucode   │                │                      │
>> + │ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
>> + │ │ └────────────────────────────┘                │                      │
>> + │ └───────────────────────────────────────────────┘______________________│
> 
> Diagram borders look messy in htmldocs output (due to Unicode characters
> ─ and │), so I use ASCII dash and vertical bar instead:
> 
> ---- >8 ----
> diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
> index dd6ac891e5f1d0..c68ef0e7b70124 100644
> --- a/Documentation/gpu/nova/core/vbios.rst
> +++ b/Documentation/gpu/nova/core/vbios.rst
> @@ -56,112 +56,113 @@ The VBIOS layout is roughly a series of concatenated images as follows:
>   
>   Here is a block diagram of the VBIOS layout::
>   
> - ┌────────────────────────────────────────────────────────────────────────┐
> - │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
> - ├────────────────────────────────────────────────────────────────────────┤
> - │ ┌───────────────────────────────────────────────┐                      │
> - │ │ PciAt Image (Type 0x00)                       │                      │
> - │ ├───────────────────────────────────────────────┤                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ ROM Header        │                         │                      │
> - │ │ │ (Signature 0xAA55)│                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │ rom header's pci_data_struct_offset │                      │
> - │ │         │ points to the PCIR structure        │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ PCIR Structure    │                         │                      │
> - │ │ │ (Signature "PCIR")│                         │                      │
> - │ │ │ last_image: 0x80  │                         │                      │
> - │ │ │ image_len: size   │                         │                      │
> - │ │ │ in 512-byte units │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │                                     │                      │
> - │ │         │ NPDE immediately follows PCIR       │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ NPDE Structure    │                         │                      │
> - │ │ │ (Signature "NPDE")│                         │                      │
> - │ │ │ last_image: 0x00  │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │                                               │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ BIT Header        │ (Signature scanning     │                      │
> - │ │ │ (Signature "BIT") │  provides the location  │                      │
> - │ │ └───────────────────┘  of the BIT table)      │                      │
> - │ │         │ header is                           │                      │
> - │ │         | followed by a table of tokens       │                      │
> - │ │         V one of which is for falcon data.    │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ BIT Tokens        │                         │                      │
> - │ | |  ______________   |                         |                      |
> - │ │ │ │ Falcon Data │   │                         │                      │
> - │ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
> - │ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
> - │ │ └───────────────────┘                         │  V                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ EFI Image (Type 0x03)                         │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ | Contains the UEFI GOP driver (Graphics Output)|  |                   |
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │ │ Image data        │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ First FwSec Image (Type 0xE0)                 │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │ │ Image data        │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ └───────────────────────────────────────────────┘  │                   │
> - │              (no gap between images)               │                   │
> - │ ┌───────────────────────────────────────────────┐  │                   │
> - │ │ Second FwSec Image (Type 0xE0)                │  │                   │
> - │ ├───────────────────────────────────────────────┤  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ ROM Header        │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ PCIR Structure    │                         │  │                   │
> - │ │ +───────────────────+                         │  │                   │
> - │ │ │ NPDE Structure    │                         │  │                   │
> - │ │ └───────────────────┘                         │  │                   │
> - │ │                                               │  │                   │
> - │ │ ┌───────────────────┐                         │  │                   │
> - │ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
> - │ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
> - │ │ │ │ Entry 0x85  │   │                         │                      │
> - │ │ │ │ FWSEC_PROD  │   │                         │                      │
> - │ │ │ └─────────────┘   │                         │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │                                     │                      │
> - │ │         │ points to                           │                      │
> - │ │         V                                     │                      │
> - │ │ ┌───────────────────┐                         │                      │
> - │ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
> - │ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
> - │ │ └───────────────────┘                         │                      │
> - │ │         │   immediately followed  by...       │                      │
> - │ │         V                                     │                      │
> - │ │ ┌────────────────────────────┐                │                      │
> - │ │ │ Signatures + FWSEC Ucode   │                │                      │
> - │ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
> - │ │ └────────────────────────────┘                │                      │
> - │ └───────────────────────────────────────────────┘______________________│
> + ┌------------------------------------------------------------------------┐
> + | VBIOS (Starting at ROM_OFFSET: 0x300000)                               |
> + ├------------------------------------------------------------------------┤
> + | ┌-----------------------------------------------┐                      |
> + | | PciAt Image (Type 0x00)                       |                      |
> + | ├-----------------------------------------------┤                      |
> + | | ┌-------------------┐                         |                      |
> + | | | ROM Header        |                         |                      |
> + | | | (Signature 0xAA55)|                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         | rom header's pci_data_struct_offset |                      |
> + | |         | points to the PCIR structure        |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | PCIR Structure    |                         |                      |
> + | | | (Signature "PCIR")|                         |                      |
> + | | | last_image: 0x80  |                         |                      |
> + | | | image_len: size   |                         |                      |
> + | | | in 512-byte units |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         |                                     |                      |
> + | |         | NPDE immediately follows PCIR       |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | NPDE Structure    |                         |                      |
> + | | | (Signature "NPDE")|                         |                      |
> + | | | last_image: 0x00  |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |                                               |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | BIT Header        | (Signature scanning     |                      |
> + | | | (Signature "BIT") |  provides the location  |                      |
> + | | └-------------------┘  of the BIT table)      |                      |
> + | |         | header is                           |                      |
> + | |         | followed by a table of tokens       |                      |
> + | |         V one of which is for falcon data.    |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | BIT Tokens        |                         |                      |
> + | | | ┌-------------┐   |                         |                      |
> + | | | | Falcon Data |   |                         |                      |
> + | | | | Token (0x70)|---+------------>------------┼--+                   |
> + | | | └-------------┘   |  falcon_data_ptr()      |  |                   |
> + | | └-------------------┘                         |  V                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | EFI Image (Type 0x03)                         |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | Contains the UEFI GOP driver (Graphics Output)|  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | | | Image data        |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | First FwSec Image (Type 0xE0)                 |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | | | Image data        |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | └-----------------------------------------------┘  |                   |
> + |              (no gap between images)               |                   |
> + | ┌-----------------------------------------------┐  |                   |
> + | | Second FwSec Image (Type 0xE0)                |  |                   |
> + | ├-----------------------------------------------┤  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | ROM Header        |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | PCIR Structure    |                         |  |                   |
> + | | +-------------------+                         |  |                   |
> + | | | NPDE Structure    |                         |  |                   |
> + | | └-------------------┘                         |  |                   |
> + | |                                               |  |                   |
> + | | ┌-------------------┐                         |  |                   |
> + | | | PMU Lookup Table  | <- falcon_data_offset   |<-┘                   |
> + | | | ┌-------------┐   |    pmu_lookup_table     |                      |
> + | | | | Entry 0x85  |   |                         |                      |
> + | | | | FWSEC_PROD  |   |                         |                      |
> + | | | └-------------┘   |                         |                      |
> + | | └-------------------┘                         |                      |
> + | |         |                                     |                      |
> + | |         | points to                           |                      |
> + | |         V                                     |                      |
> + | | ┌-------------------┐                         |                      |
> + | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                      |
> + | | | (FWSEC Firmware)  |    fwsec_header()       |                      |
> + | | └-------------------┘                         |                      |
> + | |         |   immediately followed  by...       |                      |
> + | |         V                                     |                      |
> + | | ┌----------------------------┐                |                      |
> + | | | Signatures + FWSEC Ucode   |                |                      |
> + | | | fwsec_sigs(), fwsec_ucode()|                |                      |
> + | | └----------------------------┘                |                      |
> + | └-----------------------------------------------┘                      |
> + └------------------------------------------------------------------------┘
>   

Addendum: I'm using Roboto Mono on my htmldocs build (using custom style 
sheet). The diagram looks fine with default Alabaster font stack 
(Consolas). If you disagree you can ignore above diff.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
