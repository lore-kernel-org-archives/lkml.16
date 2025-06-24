Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4E223DE1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792078; cv=none; b=MbjOfRInIDxUqJPjVIjRwn8dUT0T3UhrKQTHUxKMQu+ybZrZ1Qq/oibPcQz+ZDKr/EoqjZJkoIvpRXiOjYD9TPlHrRHUhL81g8IsX2D3UgsS5J9UE3MUwKkKCOHxHOR8iATMTRsT5l8ptnCvGFSMnqAAdezR4p/sqj5GNr6SEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792078; c=relaxed/simple;
	bh=sxIRZ7U7XYll/So+u7OsleqjjWxUynavdKFiDTxCkKU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:Content-Type; b=kkHkTIn9w1BMChzgLke5tqszPf6x+rrtwaJFX+jJiADTnxpyvMngL+Wa3AxpEmSaA2hgaUMpMo6D8p2P3VOXPRsZPx37UHGGTpokKJOA6x4h5cbnoEetQj9Gw8r6ZABz9cYkJZs+xys86zrCryfK23K0qEcvmtQsygc46Ipv+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=kquHlrsy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="kquHlrsy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso620577a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750792074; x=1751396874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJQJ0Vu8gTyCcrO4fPQFn2fQBjqLwI2YwZex6LvwDks=;
        b=kquHlrsyZNigQeEcwCrzO0nX88AcfO9ed6AGqBtxnCtCaQdu9XbkrUbXTzJOH+YTOS
         rvmXRTYESsAVyhKA9eUAZN8mL1DeVAMo2UH55Npb2UZxCH+QRsPd7Gmvbj4DtWuP3EzC
         VPhyYYIJNVqemC7PYEGAd+jxhvBnYoEPRxE7rrI1ffTXIrJ4rdD9wnCseCLnOLe+EIai
         6HdRDcR4DWLg3GQGApNGm0WpWj6Vqxwy0IqIFYZ2YF8hw4QzLXVEKf5dTZdMK87jFO/a
         w5tQg0O19hr01r0DjnVHg2sNXleGpX89WwEdbbK3kDZd6XBao+64D6ekDhVKoIHMpxZH
         afgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792074; x=1751396874;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJQJ0Vu8gTyCcrO4fPQFn2fQBjqLwI2YwZex6LvwDks=;
        b=QcYzSmVAax+W3rcIYqpQEaCtR6DhYnKLvoDC0zg8Rr98LiRhr/BYHwFfkYfi4secMg
         28rmpGLy/oI1fHchth6+JX/XR/QPZYbRea/ALrgYrMLxWqSRZw/nICIuiBJpuEs3oEMd
         /osgo4fRam23AWwhFRkGhRzpuGjxw2ZSWfmIdtC9wqjfW6XqBTk3hb6rZjj6r3sPzw0X
         vs/tZ+bNyJvnrLR6Nogk/S0hO7IQIlDUQJQ6qSzy4UYT6zt9O25iI1FWh6c57+6YwRlC
         GWwxT91f5ZEZb/LKwig93vm6mFtyNQ7U+Btp7zZr5S3voIaUOYN7POLa2eW2PXcem25f
         uzzA==
X-Forwarded-Encrypted: i=1; AJvYcCXeRqR4ivuPDTyaH+5uX15JSAFSq//i1y/fNk6hFXyJvtQXkMxKEtY2Xex1lPCxYTuYtTsY0NjKj9SsiCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4TLM+mbsWAX3mHWYirZFE/o25S3LkZuotmdPICC+vZqEygKW
	l83dR8MNfv10tCjFjmgSpkWHgOFB+22IpNEem94s6sTCgGjN/3xVVEz2DiolpyIj1A==
X-Gm-Gg: ASbGnctfsm/FYYA1Asw/foc8U3L+5xfk3sRvdm9RU4lxTMje3w1s6+wRAjaMu1toWh0
	4LASdZV41Nh2tfcOJVx5THmvkPFlXp23g29D9QdiZwHnuqamCrvgg2pTqbgmXuS6h+zs7GqoL5z
	hU+cqR6tVmlbqCsXgvNkny8hh4pGXrnLgMgxXZ4KJI6UDoBb4PNNrnY7ULmIMRdgrud+Q94ajH8
	IzgGyqCLIa93kW22+Su4d91rFWMzvvRrGTAwlaVUs3Q0ogdRs6e73NqfDPMKUJxfXfcgcBm4LiN
	b+CYv26tCrO/suPsduXJq4BJJGARollAguVrnBXkmR6CIKQ4/qVx3um+Pz2HMIVzxgW2p7P+imI
	=
X-Google-Smtp-Source: AGHT+IGdso6nJiUlE/UjdgGSmYH2YhJqVjspC86fwFUyasVpFQXUKxKTYUHp5V8lCpYT3UTfmnZPNA==
X-Received: by 2002:a17:906:33d0:b0:ae0:66e8:9ddb with SMTP id a640c23a62f3a-ae0be86cb38mr41522566b.19.1750792073935;
        Tue, 24 Jun 2025 12:07:53 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b7f473b0sm63844466b.6.2025.06.24.12.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:07:53 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <91030e0c-f55b-4b50-8265-2341dd515198@jacekk.info>
Date: Tue, 24 Jun 2025 21:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] e1000e: disregard NVM checksum on tgp when valid
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
v2 -> v3: no changes
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
