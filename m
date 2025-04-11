Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047952BD5A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413263; cv=none; b=sL8l5+ypQIDsAbzM6VUEWucISFiuYj3w2hZued7SeaX22RdeCHbT2JYnJp/SGqd3vDL2lmRgIASCpK8YKu7XCOQ0X0B7CqXKrwzzIwmYr3mEoV9NVAbsEEIa3S5+nZNhYPiV2Qasab8MATcwGdZ6V6a6X58cam3SOZt6nAsQZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413263; c=relaxed/simple;
	bh=5+IYzvxdGiVJBQrU6OvpI8zkSDj8uS4VrXAb+7K70s4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EwPHxRv/ajORAcEzYODXBMNldNbtXH2eNDEf9Q0I9xCeOqef11S6DjtjCz5qmxw4acbyJu9Ed607BFFABwAD+Sgs/PwHpqvgh0/ZiVSkQ4Hp3qB5ZCDfPKSKJ9IjcLB89GVI4Z3cevp1hw7okkPDyQmUzVRyfvx0jwd4zG/A+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=hAJKhcMS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="hAJKhcMS"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25d2b2354so405777966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1744413259; x=1745018059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7gZ2a4kNRAu7jwQR+r8fyDCj7+uKKM15SUMg3PT2KM=;
        b=hAJKhcMSpno0bnTzg0oOR85rz8Lo1KK1HWvajM20l00m+olMNBlOVchTVMEmTEcdEv
         w4lD022cZurW4RBK9m0E33cg8lf9UE/qZDq9zObzs1HciU2qXzuD0Vw5M+YuALbhJ3Ec
         H/Im/ArWpMlck5FPZ+BSddiLr7wN6PradrEBmYrK9wDZAkIhfEdOQ+CRy69NIMXj2ugA
         YL4AVMtvTxwbWw24nDVv/ng+6Vucu5/HF33lhtUztkErXxtBRoqXsJkFQXqZJzJOQssR
         906bOOfKMjrUB2uRWvCHCqbpjtMAg/hC4j1Ayn1o6FZtx4JQNxy0UzCzxuEKbYxQQepp
         vrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744413259; x=1745018059;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7gZ2a4kNRAu7jwQR+r8fyDCj7+uKKM15SUMg3PT2KM=;
        b=pzGoqFX5rteTIPlQ1Fk5x80yntEmNB/Gsk6UC/f51AUlTcYMHUTKnJQSq8zfV8ClQB
         lftBRNwFEI3h97FSBbLiahoqOoFweheXPuZ+rXL0V6LCsDOU/Efp6QAmyMH0P7LEZMds
         aHtIYRFN03m3kfeCChDLsGqWfF9edxVw9jVPC17n2mwu+MsHm/Z7OwETA9gY5Y9jMYBd
         vBsVjJveNG1od+3Oo9nUDdhdH2OCLMv07/Nrv3OO4XypvPOdbqDTjPTPowCdkAwxkbz0
         LTuhJQB4nT9f7aSNIvi1dkJth0qRfPChF8KQkt1YtwfeeAMxQ3jmlpLu5GBZou5etaml
         b6ug==
X-Forwarded-Encrypted: i=1; AJvYcCU35wghLBr6PYIMm6pYyKvqLkhdzSdGquRT+fjiKhQ0XP716iR0bs7ZvoklDyRt7STP87YoD/52XUYtNS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzXh7SoNtCgCcCbvlH87yWW/GMvb6ZKqNl2Oh6jheCOfvQXzK
	6x4ZwLWcgA/uc6Mtvx9neL/jflfY0F4gzcg2fVgLdZ+GSIAEG2Wy+e2uXYH8DQ==
X-Gm-Gg: ASbGncsKnnjj+c/g3Kqp3FIjBJxL+euHeEagZTlF+V6hnDPtx1th9ZwSU2dhIPh1BlL
	yeJsdFAKtVPfQtU1GUgPRepCLCkQk+fM/D/zfpMaGknaCN/5tOVZ61rSskmLYaoCIFu0KVsq+3+
	X0CM5Zn4n6p/zV9+VJixCRVE37epQxo7o89DhX6RYsOA6Eshha9TO+aBNfVZK4dyMwfZiM9/iIk
	B4XZZsBbTcaicuZHMpCYAP383f11Abgzpnvkp3R6mP3DCWxe6bMLmB2J1SkmdNbwwVEr1Es0t9u
	A4Pnhcd07bBp2DtZF3w7hiLldjODJ/2jaFWfbJIfFU/HWNcFmw==
X-Google-Smtp-Source: AGHT+IEvy6kgULlZZh+g/Jo9ZEWmTjrbZlUGLIqKPnfHXoHdBf0RzSc9G7gT62xhdLc+tXmoYTQ/WQ==
X-Received: by 2002:a17:906:f58d:b0:aca:a1de:5e62 with SMTP id a640c23a62f3a-acad359505amr320916466b.42.1744413259061;
        Fri, 11 Apr 2025 16:14:19 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4104sm513940666b.99.2025.04.11.16.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:14:18 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <1c4b00b6-f6e3-4b04-a129-24452df60903@jacekk.info>
Date: Sat, 12 Apr 2025 01:14:17 +0200
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
Content-Language: en-US
In-Reply-To: <ca5e7925-1d75-5168-2c54-1f4fa9ef523e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> I'll experiment a little more and get back to you.>> Specifically I'll try to dump the NVM contents before
>> and after running e1000e_update_nvm_checksum and after
>> a reboot.

I finally had a moment to take a look at the issue again.

This change also makes everything work on my system:


diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/ethernet/intel/e1000e/ich8lan.c
index 364378133526..4538059091e6 100644
--- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
+++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
@@ -4266,7 +4266,7 @@ static s32 e1000_validate_nvm_checksum_ich8lan(struct e1000_hw *hw)
         if (!(data & valid_csum_mask)) {
                 e_dbg("NVM Checksum valid bit not set\n");
  
-               if (hw->mac.type < e1000_pch_tgp) {
+               if (hw->mac.type <= e1000_pch_tgp) {
                         data |= valid_csum_mask;
                         ret_val = e1000_write_nvm(hw, word, 1, &data);
                         if (ret_val)


(the modification is not persisted - it is lost even after rmmod/insmod).

The diff between "before" and "after" NVM rewrite looks like this
(MAC address masked):

< 0x0000:               XX XX XX XX XX XX 00 08 ff ff 84 00 01 00 70 00
---
> 0x0000:               XX XX XX XX XX XX 01 08 ff ff 84 00 01 00 70 00 
10c10
< 0x0070:               ff ff ff ff ff ff ff ff ff ff 00 02 ff ff fe 36
---
> 0x0070:               ff ff ff ff ff ff ff ff ff ff 00 02 ff ff fd 34



Reading https://bugzilla.kernel.org/show_bug.cgi?id=213667 the issue
started with yet another Dell system, Precision 7760, locking itself
up with such modification.

The "fix" (4051f68318: e1000e: Do not take care about recovery NVM checksum)
fixed some problems (i.e. Precision 7760) and "broke" some configurations
(i.e. mine Latitude 5420).

The condition itself was changed once already (ffd24fa2fc: e1000e: Correct
NVM checksum verification flow).


> If this approach is acceptable to you, I will prepare a patch with
> the proposed fix and send it to you next week for testing on your system.

What solution do you have in mind?

The only one I can think of is to ignore the checksum completely if the
valid_csum_mask condition is not met on e1000_pch_tgp.

-- 
Best regards,
   Jacek Kowalski
