Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39AC17A2E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793472; cv=none; b=FgVI4QWufyT1TR9eii4C8WASMjvGREyC9TP6RXSJyEAVKY8kFSnkpqQyQ1BIOzos/EHdTNDyRqVrGfCWUnSHnvdbWW9L9YVUcnmdnwnvqOR05kfrFFXndlCcGJW7bsiohr6ezl9p+Wt9XVGBUomzyyc9ZH30wNAb0tpjwLEPdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793472; c=relaxed/simple;
	bh=/unps/Zj+Fo5fjYrblFijTt7uQ/0xgDzX3gU/IlPovE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mQAITR+fgjCe7Rus29X/pFG0/eRt19bgPhk7UCLl1zv3MW6wZTxndHfHw/GTGgs8tmMCrnYpmtlYZZ2synHPz+B/NwvLlIq6nZK5YJL2583+IQiB+sVbcoZvGbu44ZLVnpxC1bfSCIwoiwA+c6uF3i+9MQWEgGCMXvFNQjUaE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=a6EUyojw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="a6EUyojw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade4679fba7so147132166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750793469; x=1751398269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUUktOVf8Mcbc6vJVhkswLwRwVDucF8ZH8DrIAMKlHE=;
        b=a6EUyojw+/uMOt//RbCowJDGdxeuOvCF9SDuEnBEdTMV+smcuvMk0bJh1Nt6bLsKen
         Sry9KPj5ntuYYxKEfR+Tx3mfyJ77BvPCFTeOATibvJs7SlMlSnmPflFpIYsw56q3TAlC
         9kck/I+fEniv6xyfJz5ebwIvwlA2AfL32A8BxkF8bMMANY9B1MhHzxyIYcZmAfKJptG5
         OT7TfQewP6bM/mRtO/juscBtKnAHDdqtTBnc4RBksbu8wMyX7p2qMIzJ3St9XNmcBmqI
         QyIVxFKojwtSr65jue33xs/05UMCNHKbflujMreJR+shW41p1bCek5I6EZeLyuNbVesJ
         l5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793469; x=1751398269;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUUktOVf8Mcbc6vJVhkswLwRwVDucF8ZH8DrIAMKlHE=;
        b=ZN4js0lgZnMhAE78yYbLS9wxtM1SnVAg9qtoyoENGmsOpOHBC1HNHtT7oZOvTsele4
         R/xYRhmYbtZ3hKj0c+xLSoqAOFjfyxTOXG0tyoUVMVe8rk8i36PwIf9LulauJUmCRML/
         leaEjBLZMQR0V6YRHA3QKoVlDrU6lv+bLW3KJvZKQ//2o0fJZhFUUufYqebSctVmR2v9
         Ab5iOd6OQUZy2MPv+xZ+unVkRJCOwj18TeR7fy8NhHmwq0MOos8T0XwB03fubbIhH39f
         vz/ZcUBfLCNfT0JUWOI1gotAaIswen6AlEV3Z0OLw0XBWPtEAKER/ebms3MDV8PfnPxP
         6fFg==
X-Forwarded-Encrypted: i=1; AJvYcCXIEWy7ncZPa7bU7Ho7ZWtyEujBslw9X/MVhNIMtKbkfMa2cuVLQEDw6QY9blQzZtWRXajDjedxFWt0rJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTUokenewuryEEhstxKD4smMZ/L37xUw+DlOpFPNxauuJP13jq
	2BTF4glopW8c74bNkzO72VGgifr4lJG1cEkWcbC4tT7xORUqXbZsCVtAsqnKW8CRyA==
X-Gm-Gg: ASbGncuDwY/Pbn/nE87iVgb0jFr5bi7yKp7e+zm7i/jGa8yVnTjBk0iqVY581BKoqSy
	v0DvUrawyNMHVbtsO7LBDot4KZ6+wvJur/Klmot+28MUY/mS+OnjJ0yBVu2GFw/4Sk9pEs876q+
	/fScGeOnRLkKQOg0oYeGZq0N2ZOjev/vw0mYnJqhSvCFHI58ZzslUP6dGXJgiPVQEXtd+A+pYlY
	5gMfENAeqQQelFW4cI2W9FJp/PiutOFWMnZEONlgT26ST9MsE+YNR0MUyw6wok29NF3ZMHTEsJl
	2P/sd5xbYahF6YrlAQvdY0yhjCt/Ij1hfcFM4qMeuKu2qbC4ABeccByYT1ZanjS9
X-Google-Smtp-Source: AGHT+IGLQgQrFQXmzCZ57AkjARniUBs6D5iqeQVWxWnIx//eINokE70nU4ML3YSxsa95lxOmkG/l4Q==
X-Received: by 2002:a17:906:cada:b0:ae0:ad5c:4185 with SMTP id a640c23a62f3a-ae0bf21d078mr38361966b.57.1750793469403;
        Tue, 24 Jun 2025 12:31:09 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a0aa1ceesm243467366b.70.2025.06.24.12.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:31:09 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <5589e73f-2f18-4c08-8d10-0498555dd6be@jacekk.info>
Date: Tue, 24 Jun 2025 21:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] igc: drop checksum constant cast to u16 in comparisons
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
 drivers/net/ethernet/intel/igc/igc_nvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_nvm.c b/drivers/net/ethernet/intel/igc/igc_nvm.c
index efd121c03967..c4fb35071636 100644
--- a/drivers/net/ethernet/intel/igc/igc_nvm.c
+++ b/drivers/net/ethernet/intel/igc/igc_nvm.c
@@ -123,7 +123,7 @@ s32 igc_validate_nvm_checksum(struct igc_hw *hw)
 		checksum += nvm_data;
 	}
 
-	if (checksum != (u16)NVM_SUM) {
+	if (checksum != NVM_SUM) {
 		hw_dbg("NVM Checksum Invalid\n");
 		ret_val = -IGC_ERR_NVM;
 		goto out;
-- 
2.47.2

