Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0D2BE7AF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414580; cv=none; b=ltfaIuwgYeCUJO56jA93ZxokzudL9RH8Wy6Sgc6K+Obxdkn+s3ITHlUuXAR6ACYXUflLpozPsys/lmOS++Sc6ld6PdhgkjXAq0WBufRHwE0RQhfxxlCAkbC9O3D42KHJg6iMTm0W00F+srsbLEESOa6wWu7rkdl+iA3YkMWOTpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414580; c=relaxed/simple;
	bh=7+e3NUoylOVeaFENINgghFZuMVpxis8hq2VGdR0NQq0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LUldGJXKFWg2DImsPVcrFBBNhwNmzwAcYSmGFI9avt5MThss220bVAZ3FORrrZPLlajUK/eFEuc7ZRqDTJDsXLqaCglo2qZ3F2R+wz/8Q7g0IpqEKJU7NR2I+ea7mCoKLF1hU5WoQzGIHCTbgbM6oDM7KM8Y2Xmj7Ji+zrqCXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=beIIIqJm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="beIIIqJm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso4647149a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1744414576; x=1745019376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwMv8tPiMF0dVPflBOXsWhbXdPTG3gvkPVzHF2vJkxM=;
        b=beIIIqJmGk95RRYmYb9PkD9JzKH11ZcOlwIe57quB6pMNTHcdTCZkEpd7LcU57RoBE
         D+FsgXIt8KACX5DOigjYRm95O0LYDOkIMgF45+LfYE2z0aepQoyuOpeeqSLWYAX/tfU1
         XEvlWRl4vavSoX7LGAU9W7YBvNYc+4GZWTe5wTk79JKYjA0/oLJLnrEFLO/qw35qK2rv
         uN3nTVhozHsjpwh13zNN3PdfywWE1FOAFcR4EsOvyaMMQAryzTlvYGhzfra6McMu6lUv
         KiKLpkewXrcKKl5MTEu6fYT8IXX/29Q3jdFMgssKrhGH0cSmtx2RXPurOur09h17VqHa
         tmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414576; x=1745019376;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwMv8tPiMF0dVPflBOXsWhbXdPTG3gvkPVzHF2vJkxM=;
        b=jddTSpf2YxAWiJbYd1IFiJN0MzFo8b+Z1obONbTGhXF41MiyHlwTE6BTwkPi+yRhTg
         TB9sTERm/xLYKk1DUpzpAEUGEgp0qL9lQSpHZrtTuHNuKvDt223EEEQg+U99wiwAl0h9
         N+/zV8A6yuGq14FjdGcU7QspwBEOQ8HnBAaXNwQhhXArhimatNib7zEyd/UKw5FhVN8G
         rGZz1+8Q7QKpg0I4js1HmDmLfA1LfjTuPtT8xxy5HJ+4pg1eG/6/VH72VaS61OqoAPX7
         G4+AI5r8eQ13TaAwwC8zAQ5oM9yfcLVG7F7qDr/ejLcHP4Fal3VzMCB6vJycLb79ECFK
         kZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWH8TQKs0cSmtHS1TGC1erVgi4IyB+zu743D8qgoIVH+pVlu3yayOw8OPE/xQ6Mj6NP44sjcKsN4b7C/Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWS7Cpa2+909Ngd+hP2eH2CQgq33wzi6gwenAjlugMGnvmrvws
	oVqc5oGhAA4m0j4FCFgaugVB34LCygDac4TqU5v4MqV7MAxhmtlMLyvWfrxK0Q==
X-Gm-Gg: ASbGnctATyMV98Mp3HJNpyC4YovclnII/E8zkruB94y87ELLhOijARCF/qg8l5zZETz
	+wpxx7St2TfwdwzTdM7TBNyLlTiP9zauIp+7NFtBpIHBsJC12K4hivWdF/BklryuKSz+AOb0Opy
	7CVqRnaLgYm2bxTQNB59tpsS8HHdlexXI8ZFFswLgBVrI5nT2WHGhhuIBHpir/aD7e+xzvhS+lM
	wNCCEQxmR3hxKWMqswRXMc6+8Vr3Gxu+SdmUUW78YeYb1nZjBny/ht/XAU46KIiJPadO8GtWWQg
	dJsrXdmXst1Ru9zsduhVAX7YF60By+wmJfT9+UE=
X-Google-Smtp-Source: AGHT+IG65JtJTlWzVWTcHoqcK5/jFXj4u4V5EKxD/X2oPq8vmVDR5pde+amvYWacjgOlLdGpJdb14Q==
X-Received: by 2002:a05:6402:358f:b0:5e8:bf2a:7e8c with SMTP id 4fb4d7f45d1cf-5f36f650ad8mr3873062a12.11.1744414576095;
        Fri, 11 Apr 2025 16:36:16 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36e0ce3fesm1551899a12.0.2025.04.11.16.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:36:15 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <7c986a61-7214-495b-aed3-ca9f15ac9b7d@jacekk.info>
Date: Sat, 12 Apr 2025 01:36:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: add option not to verify NVM
 checksum
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c0435964-44ad-4b03-b246-6db909e419df@jacekk.info>
 <9ad46cc5-0d49-8f51-52ff-05eb7691ef61@intel.com>
 <a6d71bdc-3c40-49a1-94e5-369029693d06@jacekk.info>
 <ca5e7925-1d75-5168-2c54-1f4fa9ef523e@intel.com>
 <1c4b00b6-f6e3-4b04-a129-24452df60903@jacekk.info>
Content-Language: en-US
In-Reply-To: <1c4b00b6-f6e3-4b04-a129-24452df60903@jacekk.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> If this approach is acceptable to you, I will prepare a patch with
>> the proposed fix and send it to you next week for testing on your system.
> 
> What solution do you have in mind?
> 
> The only one I can think of is to ignore the checksum completely if the
> valid_csum_mask condition is not met on e1000_pch_tgp.

Would you be OK with the following modification:

diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/ethernet/intel/e1000e/ich8lan.c
index 364378133526..df4e7d781cb1 100644
--- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
+++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
@@ -4274,6 +4274,8 @@ static s32 e1000_validate_nvm_checksum_ich8lan(struct e1000_hw *hw)
                         ret_val = e1000e_update_nvm_checksum(hw);
                         if (ret_val)
                                 return ret_val;
+               } else if (hw->mac.type == e1000_pch_tgp) {
+                       return 0;
                 }
         }
  

?

-- 
Best regards,
   Jacek Kowalski

