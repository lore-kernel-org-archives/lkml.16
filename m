Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08A20E002
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694293; cv=none; b=q/5fZ8gllkyNMb+XDZcUyvZWTSNRoXBMegqrkSVgJwHiWmd8W3YZaSItpPHpgf1OLWoQ+f4UKnl1qjyXmQSmHGiDCqgo75rDstCyGKVYOenN3+g2aHAmprIPVAwoShQNttqYUCa+J4eJcT4yU3/YE7Ioi7Z8Ld/TTwtxD9UiFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694293; c=relaxed/simple;
	bh=dTJ7o7lwO1w/Ico/bJN6spnwHd8zplEFB//q51c4kDc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:Content-Type; b=bRZ8D7b8CXgDu4Uuy19oQoKYigMLT45ee4ocK1bTVuWmxuyTdSTNqCFGgj9NtdbvpGgKL//3t2tiLzOtZM0PRgkc8t+5uRZzs7xZ+sXPoibTE3wmzjBXbgMMqVjkqprBMxVoQvxHPzk+yLjKTGeV0wQbO68Uo+veNsL+p2068YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=wYXlvtkh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="wYXlvtkh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so7916175a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750694289; x=1751299089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THMPC/stGELIuIM3zh7ri4wYgq1jRpgRTNCcMv21/aw=;
        b=wYXlvtkhjrk6Pb1JfldCdf+RcGBxBguVDh+FTJXmtpopodBf8dsr5MTcVYu75PPtbl
         SoeQM1Wo+HFtDd/PLfyv29tXfPdeLr6uhhMCbKDjq0CjzyGaSgxInnMDSQgppUrlU9CZ
         IzuocJ1dOnLWbQmg9TA/s2g9bIOA8EYSCvwfZL7XIwpPp5J77ccns5iWg1nCT/8hwxV0
         RVXhpYT9lTXHgyNRTVazAzXJjlIj2D0LpJFaHp6+2z7tEjFHErCAfeCBFDNvk/tsLFlD
         sQ9iwK0sjQx2wZAGN0v9cbb4cJ1pQrNoUs5kLvVbvi9PDBULRZ6v+m3/mFexdEApizkP
         aZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694289; x=1751299089;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THMPC/stGELIuIM3zh7ri4wYgq1jRpgRTNCcMv21/aw=;
        b=JdPdAfGu2x3yXT8bHvQFY/AiHpteZ9vJvgmFXMU59QrW/1eGdhjoEOgAFoftqvKZ97
         CH2/4qw+WojMS3HN64zFcIEwja8chOj907aFdZ8eD8Vbb00miX48oWb1tt9V4YUjZ/q/
         xbXfQnvis8/VREYQDGobhiGjB3MDFIDaOBqg591NKDc55JSsWf8B8dpDCF5bJsodCQUV
         5gyUD1mqFxkR4E5aQhJjRTFGd2Czv5xr/Ix/YSEZ6Zq+Du2p6GjQSb2EA/MFQq0KEKuh
         vZ3QdXDUTPx3hMl8AuQm59bGZCnb/me3AZbaRvUoPuzm2/nmLJrx0ZAeIhIBlDlY0U1b
         JOaA==
X-Forwarded-Encrypted: i=1; AJvYcCWYUjxfrhEs2ANbIuEQP//lBAuyNJwOlmfvhT1aw4Q+rJwS9Xr7SIQc+7agrVM9FQMRBRPryYsQqJSuRlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg3YwFY033OAhulDAUw+nzvHOidSPjT1yncgGaKvf2xsmk+1yQ
	PY4NMRxh+3ibr/CZQhIT4wlpi9HkeGKb8oJWBINc43pHtAJoq6pTuqfWNmQzPFzJTA==
X-Gm-Gg: ASbGncv4oESEUsUt+b3IN3PwlFK3H8IX0sasv2ldMCHM7xWNK3RXeguaS5CUKG3M42u
	loQGsCMX06aUzCjg1jspBhBGv2SKPtCi68intmzCRVTrQj7Ct8j6z9XgbA2yPnqiy81fZlcZheO
	ySLgN/0WvuWauGgogST9sjYv6knWi0pDUEH1w40PHUng1kCsHnGWqjcPrNoisfsyPNVnjffu56j
	8VaIe6+8EigwZQs57gDpN6PCkBOXzkL40ncLpdXG4tU7713HpvFlkR0ErEcXxn4KjUu9Cjkxl2G
	ZuemuCGmAANssnLQ43MOLkMg2+3mYUApG8RWAa63L+W2oJ42Yq3just2Hdpn0Cdx
X-Google-Smtp-Source: AGHT+IFS1S4nhEd7PY/HQFvRpwpefcPz4PA7zagt7CZWM4PTwwR7omhizl3rqwwz9enGP1MYSe3wjg==
X-Received: by 2002:a05:6402:d09:b0:605:2990:a9e7 with SMTP id 4fb4d7f45d1cf-60a1ccb50cemr12831827a12.13.1750694288741;
        Mon, 23 Jun 2025 08:58:08 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cba458sm6315762a12.59.2025.06.23.08.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:58:08 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
Date: Mon, 23 Jun 2025 17:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] e1000e: disregard NVM checksum on tgp when valid
 checksum mask is not set
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As described by Vitaly Lifshits:

> Starting from Tiger Lake, LAN NVM is locked for writes by SW, so the
> driver cannot perform checksum validation and correction. This means
> that all NVM images must leave the factory with correct checksum and
> checksum valid bit set. Since Tiger Lake devices were the first to have
> this lock, some systems in the field did not meet this requirement.
> Therefore, for these transitional devices we skip checksum update and
> verification, if the valid bit is not set.

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Vitaly Lifshits <vitaly.lifshits@intel.com>
Fixes: 4051f68318ca9 ("e1000e: Do not take care about recovery NVM checksum")
Cc: stable@vger.kernel.org
---
v1 -> v2: updated patch description
 drivers/net/ethernet/intel/e1000e/ich8lan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/ethernet/intel/e1000e/ich8lan.c
index 364378133526..df4e7d781cb1 100644
--- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
+++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
@@ -4274,6 +4274,8 @@ static s32 e1000_validate_nvm_checksum_ich8lan(struct e1000_hw *hw)
 			ret_val = e1000e_update_nvm_checksum(hw);
 			if (ret_val)
 				return ret_val;
+		} else if (hw->mac.type == e1000_pch_tgp) {
+			return 0;
 		}
 	}
 
-- 
2.47.2
