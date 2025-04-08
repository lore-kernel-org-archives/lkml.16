Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC37B256C8D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151118; cv=none; b=Ztmlh5VmTlL+k07jVrkCzsMjmNiepiTVPGjPZZJSc5YWaN1fX6b8cyKE3hltm5M+zpS8BmFqeZkZC4qkiixP+S5GBNniTWkMTosBUIKOZaVGKDLXCAYNU5vIj4grTueVH2eI/0O77LaVVoGNRVgefVYhFAvwXDpRGri6bn7yiyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151118; c=relaxed/simple;
	bh=fjSwQt/2PS0/uHpddp/9VfHp8MHyRBleAOyBrzxHfS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8eOK0bOnmlU5z5IO9UWNBrG4Sn4MnfhSpy2eTo74BxjdlkfJQVttqU9qD9w25HWo2JhMCBvuecbw+zqorijS82goBPh+qTbIiyyYR4LR6AA5kXwQW9VLlrPC/QYPgw+neKDV9ysXWtPtX8D1g0FG1a4jYiRWDm7sZRbYOjT6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=QPeAOV/1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="QPeAOV/1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5413158b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151115; x=1744755915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89A+ZPD0F+3yWuCAaFy/tofDasEkWjCiUmF02vN16R4=;
        b=QPeAOV/1hSflQF8S/M0C228T5waNFCeh4280IakAUdMUZQABWhmWPHM3kpidpXjzfW
         ZiT6c27IJmbe4/x9pkEITebp4Y/c4VN3uF4SZo4ZEUfL39jotKE+dk65gJiVAfdPsrTA
         YlUOSjiXpx7HzTTCYh/kpqrWH/OpcH2xmvTDtIcKBaJ5btqu5pTsDz3uHqGN8zkSNeQx
         DQQ0zSzElwl5z+lztYF/yHTIXv2sRkN9rqX8ZU2ouUEdP/gsuCvL7pwzeYBG3lUUIaEx
         20EJemBO1NI7bzYbgpN5c5xQjeM8hZr04YFle/Sf1dK67Kpk4QPlRxSu4Zm9ivMSIIAW
         AwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151115; x=1744755915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89A+ZPD0F+3yWuCAaFy/tofDasEkWjCiUmF02vN16R4=;
        b=gru1xqHNLNC/CqsMGHSK5BoFKh/Iud9TXyZxCH9tAI0uz8h4FzyH0p2snIxHiaH4lt
         vKLb6/JbDFtmztvoQcbktRO6n8pxkapsh4qKinXp/Vo+8klaubNNaeRoC2onMvhugzAH
         peEXyfAtQlrgATmKZcTwkeI981hk/mpPPZUMWUHVMHIJSFOiTMhS6uBoHyNRDlSGD2L0
         9Zq1yKEFeosU2tdkMhXsSdKFayZKeN49yxlvrHQ6Kkr3egPksMYImsqOrQmX8U81p8H1
         Hj7fil1LAhZYjdgkMH6AS+cBzKPZrEQDyjfBXk1WHG/tsSQlWI/f8uelDa/Ekg4SLJ0T
         zalg==
X-Forwarded-Encrypted: i=1; AJvYcCXKjMZrDdLQoaPPJrAAGmJMz976zJ8IQ8+HHIonYmcNWiy34QxO7+TKXBtGPy4XS+tQ7hkkmZ3M+5Xh8CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nYcJTQx9mol4AyEKxvhPXGHGG9vhIbD4NaNidHPkJySQhp57
	nRj9F5OGN8NN9hmWrSEtWK68v14eJCcDpkyUMSN0ARDb4d7wzS6ktPElvvj7vg==
X-Gm-Gg: ASbGnctfqMFwyD70swaghACgtm6EPKNCATxmQuvxPVSUch9kHMWG7ds4WpdBBrwy7xO
	h72pGXrKfIXkqhon7lbJcjC7fpS7ZD+gaZ+QWI0Y4GP7UmoFxX5kX5wiH1XfKeTZ25F9ao28HCl
	V6HeDIP3NONTu9jqxLtmFDseZvMeyMu5GJyTGg8QMHESNEc5W9WZXqqWRfEIDJc5f3QkemjVFOM
	CgfjPN3S8egxwrQGB7NWRiJfuJVlCmGU5tIVK82PIlHtF8IWof2SOvauOEY1EkCXOcY3uhqMtTF
	cslxBRS1wmHS9bwidHS/ZdZxi9o5xf9bI1D6DmQVE+Z+NmQwYOXTTpXJcmjS7fWc//UeMTRcep2
	XGuXnNIfryg==
X-Google-Smtp-Source: AGHT+IG5juhMHsu1LskHss9Nad7vpK7FAPNQDk6C1pXafcAf9b9xsbrt4eBAxXA/2nIyF2WtAbUalA==
X-Received: by 2002:a05:6a20:e306:b0:1f5:8678:1832 with SMTP id adf61e73a8af0-20159195629mr923643637.11.1744151115097;
        Tue, 08 Apr 2025 15:25:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b9608sm11165505b3a.154.2025.04.08.15.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/18] staging: gpib: cec: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:51 +0000
Message-ID: <20250408222504.186992-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index a822fa428cd0..dfc718de1532 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0

