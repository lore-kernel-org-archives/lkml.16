Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF602E62AD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793388; cv=none; b=XlAafN+abtgVskM2a8LNx+1ko1294iYspkp28aavQIEnYsVYKH2YOcYjtkcOYG966djRp7zR3zFL1DGOdTxEkIIGNVMhTDZeQeJyo3OOoRglBW0FDvtJDVaKXHINvvCXKEyp68zKp6cV7HHkFVBo7IzrChhYUiPhnsIYbpbrIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793388; c=relaxed/simple;
	bh=JQphqSpJyr1qy+KMoH2QoJmAbI8VxamSwuQ/cgKV2UI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:Content-Type; b=BZDTfRBuprzDk+tVDueYNPvyLag7s0b5GTItWBdb3nDjq4/LvtrsC+ilf0dZ1TY6KmkgaoFQrOG0RrR+cRWim5vtvYpqkXMFz1jzIB7Gp/X9WOgS5+UILY+WZ0o7cY7yjyE0z2FUWMF2vqzsg7iHGp4NGjnhfXwJGRYD2jRbRJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=JZ2ZlZFZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="JZ2ZlZFZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so11301753a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750793384; x=1751398184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws0aKIOxs3tVl5HqThHJotfuM+musWr8w3Tsu+UY7Fk=;
        b=JZ2ZlZFZWHL2ySNvreach2rHQIY33cvUe7Q/qAf6LJPvynFkX4P6SrcB7a1bYWaK/o
         jKP3LiMXjGbq8g4kZ6OSxIUZszc+lJmOa5+0cbyK6EFxfZeVCW4vTJL/de3jZ9KOUVnQ
         UCrBHtXvvGlVfyjbcJW/H8r3kb+yNxxaGJ7WYF67b8jx6Q19EYp4fXnrNLeydD6JasWS
         3prwh40915ohIYJ1gVTl3NRdik2I+n3d89k0ULPrMyxCd5sBOf/Nf/QtnNxmpsd2TyJV
         zhRBzHEbyFJ6awr1r4vwnnoIfPr/9c5nU65EWyBP6I6DmUVwdMOcFlCAygdHONMIctYZ
         uWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793384; x=1751398184;
        h=content-transfer-encoding:content-language:cc:to:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ws0aKIOxs3tVl5HqThHJotfuM+musWr8w3Tsu+UY7Fk=;
        b=Ny/XsKlIMA3nmGjQqTYELxyvD9JG73pRsym4ZD31H4Ue9+uoRDDJfQK+hcR/CJnFwn
         8cBEAvmV+soB/lk5GBrPnb/2n+C3q6vfA9qqFl70u4NsdNF19Jsmn+lXYuDGpVbfP77u
         al38MNWVxiruj/Pi0owDx0RkfGStutqqqb9qxeG6LwSUdSt5ITl8+xVitVdmXNWQQ8WL
         OuobYToWZm144gtmVpCrNh0WNWh5ViB3F/Z8uBsQU30uvS2kfkDA61ZkALJxsRrBpOfk
         Je+1pJBCTgSah1WgKHlf+4jcNN+5dFe7qhyjEI+7xrD/RDdrkp4ZgFJgLhFAQa+EGlHu
         MTmw==
X-Forwarded-Encrypted: i=1; AJvYcCVOrmt9+7ypxJG09SnyvgQpXQOE+w3ENHxoj4KpNLdY8dyrv7xm1x4DBReX/D87Ll5wjDnhp9EpRhwXuHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdJalzRV8OczQtPaCham0Sp9i7s7UQyE2ve8qaG+wxnUPGolX
	SYTNuAffu7Q0ziSihDwvzVjiz0DAzdI82XQDHrZqFEhe3bkRUIxdQrXv447i1gRqtw==
X-Gm-Gg: ASbGncvXZen+oPtK8rBWCYSs+6EWkkhFERSQyKahzSm+f2SW7CqghtM/8CrPX8FRXE/
	fby2tzpVnJEyPqPob0mFmOk/0cP2uc68XGwD6EI4fsaMMiYGVS4Gs/UnOCl7oMBG74WNZs70MiW
	Z2hMzHI8BJfmlZd0ZtnkUr/lazG1uBCIhW78Rdqyj/TkGqzk1/obQ/rKtJgiyD/4XmEdXWrK2ZB
	y/9YIpSKrd5yUJ0Y+/JvtGJqIzBjJ9dZGyAsVq0tIc6pT5gNdtNm0c0JkNEJJXc0p62ntEOBfv1
	4vY7RgFhbFrg5Bm9gCODGwegY+hs1QYgurhgWQb3dpXNm98h/yyGyrCVxVD0BL4E
X-Google-Smtp-Source: AGHT+IGeqgsx8L6sy3o3oaeB07CiiQupvJ4nu0wpwMNqtSXLbb2/E/jMAzuWpZLEd5MscyMgYpvVfQ==
X-Received: by 2002:a17:907:868e:b0:ae0:a648:54bb with SMTP id a640c23a62f3a-ae0bed82df3mr51970566b.31.1750793384497;
        Tue, 24 Jun 2025 12:29:44 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7fbd9sm916114166b.33.2025.06.24.12.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:29:44 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <46b2b70d-bf53-4b0a-a9f3-dfd8493295b9@jacekk.info>
Date: Tue, 24 Jun 2025 21:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] e1000: drop checksum constant cast to u16 in comparisons
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Suggested-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/intel/e1000/e1000_ethtool.c | 2 +-
 drivers/net/ethernet/intel/e1000/e1000_hw.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
index d06d29c6c037..d152026a027b 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
@@ -806,7 +806,7 @@ static int e1000_eeprom_test(struct e1000_adapter *adapter, u64 *data)
 	}
 
 	/* If Checksum is not Correct return error else test passed */
-	if ((checksum != (u16)EEPROM_SUM) && !(*data))
+	if ((checksum != EEPROM_SUM) && !(*data))
 		*data = 2;
 
 	return *data;
diff --git a/drivers/net/ethernet/intel/e1000/e1000_hw.c b/drivers/net/ethernet/intel/e1000/e1000_hw.c
index f9328f2e669f..b5a31e8d84f4 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_hw.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_hw.c
@@ -3970,7 +3970,7 @@ s32 e1000_validate_eeprom_checksum(struct e1000_hw *hw)
 		return E1000_SUCCESS;
 
 #endif
-	if (checksum == (u16)EEPROM_SUM)
+	if (checksum == EEPROM_SUM)
 		return E1000_SUCCESS;
 	else {
 		e_dbg("EEPROM Checksum Invalid\n");
-- 
2.47.2

