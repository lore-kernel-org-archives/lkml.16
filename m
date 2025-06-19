Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5922F765
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344603; cv=none; b=X4/YgeTdQQhNkkEKFA5r8DkMHwvZrrpHNX1hf99gOPFjTJWOYMgFnehq29J3btfj/vCzTjwcHmXcmXnyCN8JYv7oTBlGc2PQ4ubqXFT+psgmzpAJlLAgXgjlu/koFw09Y9HpMCqIKy1lRRnuulnenyjLsSYrI628a09//LZ1WLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344603; c=relaxed/simple;
	bh=RmY0Xevw8TVnFstaNyUj2eJowpNdXKcRW6wC6tdkF2E=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=cjhUutcG9Hbnbtt/jQ/RHEsIXtBQqkILr0SZsrtLpUTzEtjHteZ0GMDZebmil5ssqhJCkWb1UUp3pezwVbhesz5nGH2h9U9V6XrhRxMNgWBfaQM9VizFKU9jJ2RhvxdDbwjGzDSrmEaHJVSWpsWTs/U1dwvpxlVg52ZOsW2DBi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=K3psz1id; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K3psz1id"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso593353b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750344600; x=1750949400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=K3psz1idNX3kspWDOGvB0I4HG5Gwymsle511CdV00wSCotC7O3aDGY1n8D0h4A9DPk
         qTO76Hq1nFwh4Y7Dyy+nRrGDsZV/jn1xEjZgWAVMF59USMspyyh2bu3re7ynLBpNWdQD
         SUM8aeOWLmKDUefA9NMiTIWpsHPUrtS+SSnLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344600; x=1750949400;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=f0LO4EEermi9bK+MBA0liQW9nRsSHhB6lE5WAgu4sP16Dk5Md/KBoKXctyq4Jx4VkZ
         XRTGYYzo6m7BhWdhW0E5rDmvNBHicZXjfbAapjLxs0H2k7UZvrCdHFHlbcXCfgV71pMO
         u2Mc1Yr/PWGVDP2YSnePLsjoMyfUrXv2uZKga5kaBveyynuZny13XBPAw/YWTC8C/edV
         /A86Mq2ni+E4rC6JD7gZTGA4EobtWBYZsEBzDNKw1jvLA7PscxAx8l9QnD7qqZVDjC/D
         nTNJ9m8n5fs/DUq7SqJ26WUeT3429FYjyMZFC/QDU3Q8cCl0w8/hIKAmQMOlNEX8UASg
         fmwg==
X-Forwarded-Encrypted: i=1; AJvYcCVRbMtJM/gXnEZmH+/dr3RVWi9t00xn/INaZr0wNB2vpMlTTdJT3ti6O3o71gb5QAvj3bOx/2c5yTaeflk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi3GXLuovQrxN8xG2nKRK+6WBWVvp/hCmt6wvN7e/6uVdwQo0V
	vzuNiWUMNqh+CkxiBeAZ72Vr/Up1Ms03YDMfv3U65TRV1DjkLCdcJkTch478LN3kcA==
X-Gm-Gg: ASbGncuTQifusC2fCCtRginnPle/AUz6vbigOvuIeNTQkDW898hGtUVL0Iv31hx91q5
	b85ixR/YXCpQsdceiqbmsDzwT1zv7CoDVATTCltA8vdGYCeWPg6mP+H6C5QtEEM6DsuV0bfWfVc
	eLcph/STMxCbo/lVaAZpX3l06gwAjKTC1aJEH2MSaSuW8LnnubtBlMAhzcKjoKoeMBvteiKcmvz
	K17XblvCaRk+qfPw1qZckSU68jtObA+Avb2lBrdygixUFwlxGU3ylrFA9p9xgp0OnubbB9jYEtF
	Q9lU2TCP5CK01b98/tHZWBjfYyrWJklKpNO5T0yGK8KPtAXn0wxOTxJWwX2FL0iOeMo3bBGeGia
	eDIgcO3aUgV4PuT385tlL1pPmCnPGJtt6ZlI=
X-Google-Smtp-Source: AGHT+IE0IABp03aQi/MMdsx50TsZhfjlS77ZjBf2ZnkWRLyJkwYN80FXKFOnWqqtHBqMUe2X9qwO7Q==
X-Received: by 2002:a05:6a00:228b:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-748fb7cc2d2mr4770370b3a.24.1750344599760;
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
Received: from [10.229.43.247] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b569sm84792b3a.20.2025.06.19.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Colin Ian King <colin.i.king@gmail.com>, Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 19 Jun 2025 16:49:53 +0200
Message-ID: <19788aaee68.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250619082554.1834654-1-colin.i.king@gmail.com>
References: <20250619082554.1834654-1-colin.i.king@gmail.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [PATCH][next] wifi: brcmfmac: Make read-only array cfg_offset static const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 19, 2025 10:26:15 AM Colin Ian King <colin.i.king@gmail.com> wrote:

> Don't populate the read-only array cfg_offset on the stack at run time,
> instead make it static const.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> .../broadcom/brcm80211/brcmfmac/pcie.c        | 24 ++++++++++---------
> 1 file changed, 13 insertions(+), 11 deletions(-)


