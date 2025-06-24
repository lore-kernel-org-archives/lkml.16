Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832A2E7631
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793418; cv=none; b=RZrCP3639xhVdP5MB4Qkv/faqG2nY4nkXQBVuqeU9rZWE6ZFbHb8mhDSMOcf3OcS2m/7sVXhXoX+ybMBPpypBEpHGVl0lGFQNTY1QBcQFESqF7liYWAVt0RYBNB5Zj77SthcQfOUnniBeecGCk1ryWgzzi6HyxrTjnHHCHiwZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793418; c=relaxed/simple;
	bh=95kehBe6R8bMjrNG+/GmoU/BYyhXXB9zEn8fo8sl8ZI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qjjSeQKFJ830349aZCWRVbmFEASNWdV3xHteQ+yodYnsaXAgY+Fsjib3pXF/l+/K2N6P1Ds1uIPWpeSkcArwrxeYF6/MMKMN87pB0OpyiG4xUkGrP7ur3DBtz6G0VzXmhtA+AGcpz2Y+j+Vtt+hnnJq2lct3UGamqUW5uTkF6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=WwWGq90+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="WwWGq90+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso1629589a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750793415; x=1751398215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DMpQ9unMD0vkQzXMI0Rh2M7VMEt4C5NAu9LffZ9WmFQ=;
        b=WwWGq90+NSP3pMUXWJTHWFBjb9IxxAz9wfcjmlwmX+PN0gUzGfjuVwzRv9cL0IWx9g
         MypweQy2BgApDjzcxRKA0f3DP137QcuiKxUWO7RoPoj2V4JRJUL80+erUWDytYnN2ZEe
         EX2roreARQ9ECqljy+IdEQHVJTV06M6+f3vF2xtOkUXUG5UwcL6UcBpBBmGPBpJllvfa
         YKXfnueHEUe2cKiY7RNRzWSnKrdS/JuewkkUYZudpURCZqMsEzOXs5NrmTh6jE2D4tYD
         j5eoklTgiED1xWlW2YnnUYp7Z+5f7GJ87mI0ml+j7F+5Q4jyc/vskeQGVh5TMBrY1p2H
         nboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793415; x=1751398215;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMpQ9unMD0vkQzXMI0Rh2M7VMEt4C5NAu9LffZ9WmFQ=;
        b=B5ITivj1QJIcwXNUzsv+6z1moB7yPQ2uo79iajW4+x9K1/RAt95k5HTw4S5BfA3LGe
         6hTJ46MYCHRs5tWHIOR70Tiyc0zp15Ecuu/nHSbEd8W99J8p0jgQ7TzZO6gWQsFGbAsg
         zTz3qzXA7TtOlOxDpEiqo4B2/TJtv0ZR5lK8S0hMRuR9kYf9yzKHNCkPyqfO5KKCFJpe
         9zobEOETq+5Mjn7+a9hQJ8nyQjJsfdx15p9jbGb2tQAPSulcTbU2j8G3S/yfTehTj98r
         ksNbWxaqsbHviQo/cXkf+a5VhhrXpE31wsxxqeVK5UQvDx4RpnD+TBi+cFcUd4X1EJ2g
         P+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGMYUTkCcGGvhygtVq05ZTwOja1DHRfJ5t+idBCFtDU5dHzojWnDqfMWq9Vu91Ro/3iyCr1OLIN2mZQik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFEYdU6Lk6NQbpJXMp0t0hg1bpf8tthNuPuHkExyHeLqHZaH4D
	hbk2f+FA9wXyMw9P1gqAmYAAiXn0B0zpV4rz5uGFn4SdJzliM+UB/UBFVctqDfE9IQ==
X-Gm-Gg: ASbGncus73nuhpw06meVmAHvr3I/+UDJ83jLHaDtyi0QzZJFhlQ+YUzbUN1wZEjjK61
	wCBJ0AW7ncF+WVVaF+tSgGVXgzMGifp0+ug8HrYNwUFC9bpVpvQYURYyhDqbx8iOom/pfnqMNtG
	S7S7g4WQ5lX8pbqP2UzjPwvzkWQG+qdKksZFW70Fg7HA5FgeDsumsXaMTb+YEJWhWtt7lsPxwxb
	2HrKzbLp9dxUkIqKGtUWylu+XsEzm6lExlGOyVeD/8ABKRlDIuUJdJEmTvs3RRLPW9BiGJlkQhn
	C8qeI6yZWl9t2Uc5aGgUr2c4Q3k0gZ2YeiBt2rbN3vHMUL0ETutUc6qGWrmxx/7M
X-Google-Smtp-Source: AGHT+IFezbP2szbIE/wQs/O6ve43dXVC5PTJwpz2lY37bdKGvUZx8jqZCzVi52lj1/qGG/hdQGvRXg==
X-Received: by 2002:a05:6402:3482:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-60c4dcd1340mr327a12.19.1750793414839;
        Tue, 24 Jun 2025 12:30:14 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f46820asm1455544a12.47.2025.06.24.12.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:30:14 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <9aaa80eb-91bd-4b44-814a-65f740f00d5a@jacekk.info>
Date: Tue, 24 Jun 2025 21:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] e1000e: drop checksum constant cast to u16 in comparisons
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <46b2b70d-bf53-4b0a-a9f3-dfd8493295b9@jacekk.info>
Content-Language: en-US
In-Reply-To: <46b2b70d-bf53-4b0a-a9f3-dfd8493295b9@jacekk.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Suggested-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/intel/e1000e/ethtool.c | 2 +-
 drivers/net/ethernet/intel/e1000e/nvm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/ethtool.c b/drivers/net/ethernet/intel/e1000e/ethtool.c
index 9364bc2b4eb1..80435577dc0d 100644
--- a/drivers/net/ethernet/intel/e1000e/ethtool.c
+++ b/drivers/net/ethernet/intel/e1000e/ethtool.c
@@ -959,7 +959,7 @@ static int e1000_eeprom_test(struct e1000_adapter *adapter, u64 *data)
 	}
 
 	/* If Checksum is not Correct return error else test passed */
-	if ((checksum != (u16)NVM_SUM) && !(*data))
+	if ((checksum != NVM_SUM) && !(*data))
 		*data = 2;
 
 	return *data;
diff --git a/drivers/net/ethernet/intel/e1000e/nvm.c b/drivers/net/ethernet/intel/e1000e/nvm.c
index 56f2434bd00a..d1bc69984d71 100644
--- a/drivers/net/ethernet/intel/e1000e/nvm.c
+++ b/drivers/net/ethernet/intel/e1000e/nvm.c
@@ -563,7 +563,7 @@ s32 e1000e_validate_nvm_checksum_generic(struct e1000_hw *hw)
 		return 0;
 	}
 
-	if (checksum != (u16)NVM_SUM) {
+	if (checksum != NVM_SUM) {
 		e_dbg("NVM Checksum Invalid\n");
 		return -E1000_ERR_NVM;
 	}
-- 
2.47.2

