Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9319248898
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793448; cv=none; b=TFOYSPR4NuZ3BNDWsoeBQnARIkNNIakd+74+eVDjUrBPqKbYiRxQcJf35OCwzhu6RtaxLMazGlRhLSFs4iBd28Sau8YwXPhaXQWjtVrEXxI1R85z5KBXdeO3mzH5VWJaYBM3g2ekNQKuKuoRlprtNyMTSnZnK87tSRuffW8/rik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793448; c=relaxed/simple;
	bh=X3F+dLhp/1RYHB0JV2VsEO0q97YdigXYU0mSHzIlmR0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=clrq2aBl7nS6vCYPU+f10Q6Nx2Os3hc/7/hysUNp6t9wtBQa3KY1hqmKJy+/vSJQ2Ow06JhYUlR2xac9ywdwxfMqhKRxII7lNdU6E196WUP719CNg6gRmFSgePHKLepO4MlTvbl/QevaBpqCpXsEX3LGxXMxH3cPxHxpbeJxarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=HEKnNKEx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="HEKnNKEx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so384105a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750793445; x=1751398245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Or7Q25AbhPUIuP5FJogLrAq14LkOMcW8AbOwVQUU4U0=;
        b=HEKnNKExPG8INrU9oN/XkKfL6UpbeYXzQfKL+Xi7TbrwZLU15XbWVUGuQ7oqQeRHA9
         XLuMgiYE0vaueEyaGIIg28pm6E8p8q8TYhcM6amDkAsyZlx3wsP3TRB/T744EKeBQuMr
         lGML4DlORL1Mcbw6Nhcg+1woxRNZIypONuu/QSmScOO5eS1gqyOQX8H5SqwXqQQs4HXl
         gltj18OGhFu5ix/j5BDxJDL/b+BGtaUZ26V5Bh7keOhWwWcekwSdvEqYMHd20m2NiuZg
         YO+v4nWYE/uYbqcscE+UcKGAQqsO8maRh9BLXORYN5fg6McYsg73CVERsgWK8umTKwd6
         Apew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793445; x=1751398245;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Or7Q25AbhPUIuP5FJogLrAq14LkOMcW8AbOwVQUU4U0=;
        b=DhTcRAMEJDyPfyAXsU/Wz6cjUFhLT7MWsbH3cUp1eiShIQGP56ZMoKzhq0yxGMjrAw
         Z/6wJA/GbbCaLiXxHHKfjLIY6MUWRFMlWVP9w60h6U+syJz4inmzmTraGoCyTQgjQWEv
         bJBNVhgTbI1w/vdN0bVKn0JqdFQwLp1g9czVNKpqzTthU0engmaNxXTSlAiwMLad0Bkp
         N4aGlViyH7jolPmMiqOoUtkn2o26FoepE8yhXnyDhJwhtPmDcTSFYozEy4qLgesiPnPo
         ChP/C0NAu8WFhRHOR6ajn2dacpKh/RwirruBoUGfQDGlKYs9ogIA1q4Bks/AYiQYO6nG
         C/QA==
X-Forwarded-Encrypted: i=1; AJvYcCVlB+EwjDJUAXt2srz+14ldA+XOgLDBRIEVlgS2c9BxTOPH1bBoh7imhVGE4JeAYCrKGe2b3tL7WQ4iLao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyEK2ELcu5xmns8TLFRh7FsNrkpUd5QwNskBBo1euoYHyWTtTc
	ZEUwo51/Evj78annFoX2zHzgF0ka0n/G2pTHrtCBQ4DWZegyjqymXlS/WcJzy8GxmA==
X-Gm-Gg: ASbGncv5VN7NaDhpNxktljiekE+LhWfF3MO6LyS/koEtLizxjhd5stPzaAVBRHkT+MI
	dMBr7gx4vRMcxkGZsY3GWyLD7FS+EnfJ/cb3rB5KQIVbc6ISiYfgQ18JqyqgNNZHM5elZSzCQ8r
	PVuApuYW1YMRJ1fBQqwYoBTSRc8HigxGi5ftNb3ekVnsxnHicTH7eABOHEl1P0YclZ0slN1kTOc
	XmH3ti481BLceszvzM2Ifosl9tegGaMY/HE7nJTnULf8kKTmoajTLHqb+44yxO0ADlvkjuPq4E2
	8Q4DunckkbRc1jqvntClUHbVjYTPqfuUxOY6bF4cmnzu52AbRiYgFnMXeEJUBDauRJgrBRfIdVA
	=
X-Google-Smtp-Source: AGHT+IFWrSuPUZPjo4e14unGnQ8k0U6yS6NVsT08IObwRPjCJ/u8xTjt4ObSkbxqTVOZE0pmb+ZVIQ==
X-Received: by 2002:a05:6402:42d3:b0:604:efcc:bf5c with SMTP id 4fb4d7f45d1cf-60c18a0dc03mr4931792a12.1.1750793445164;
        Tue, 24 Jun 2025 12:30:45 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm928625866b.102.2025.06.24.12.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:30:44 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <96d55057-28f3-4f77-b5ac-6f2b6769aeb5@jacekk.info>
Date: Tue, 24 Jun 2025 21:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] igb: drop checksum constant cast to u16 in comparisons
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
 drivers/net/ethernet/intel/igb/e1000_82575.c | 2 +-
 drivers/net/ethernet/intel/igb/e1000_nvm.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/e1000_82575.c b/drivers/net/ethernet/intel/igb/e1000_82575.c
index 64dfc362d1dc..12ad1dc90169 100644
--- a/drivers/net/ethernet/intel/igb/e1000_82575.c
+++ b/drivers/net/ethernet/intel/igb/e1000_82575.c
@@ -2372,7 +2372,7 @@ static s32 igb_validate_nvm_checksum_with_offset(struct e1000_hw *hw,
 		checksum += nvm_data;
 	}
 
-	if (checksum != (u16) NVM_SUM) {
+	if (checksum != NVM_SUM) {
 		hw_dbg("NVM Checksum Invalid\n");
 		ret_val = -E1000_ERR_NVM;
 		goto out;
diff --git a/drivers/net/ethernet/intel/igb/e1000_nvm.c b/drivers/net/ethernet/intel/igb/e1000_nvm.c
index 2dcd64d6dec3..e654310b1161 100644
--- a/drivers/net/ethernet/intel/igb/e1000_nvm.c
+++ b/drivers/net/ethernet/intel/igb/e1000_nvm.c
@@ -636,7 +636,7 @@ s32 igb_validate_nvm_checksum(struct e1000_hw *hw)
 		checksum += nvm_data;
 	}
 
-	if (checksum != (u16) NVM_SUM) {
+	if (checksum != NVM_SUM) {
 		hw_dbg("NVM Checksum Invalid\n");
 		ret_val = -E1000_ERR_NVM;
 		goto out;
-- 
2.47.2

