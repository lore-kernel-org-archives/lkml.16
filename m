Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5CF27713
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911733; cv=none; b=J84RFl84QiEkHmIgBJidjLZQHWnl+7kFd2uMmLRIHEEacsByq8U/to2duk58JFO1KBq1O69kVP8dKPBaTuLLVffz8t6BdEmkk7usVUiFQ7Q51m33khUdwOA7KqM6MzBW5FURj8O3driZY1gvqil4tgLKv+jvlrQdfQogyb2b0cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911733; c=relaxed/simple;
	bh=D8ChxclC0OryM1PIeIikl1ZBiXQj8Htj1KJRs3ZTtGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAd4UFdYB+x/kTlQlgbOPKKn5V3Hk3XKUpx0gYOZDJRbrUua4ABUm3vRwbA18jUb3YuA9N/V/UP9lbNBnLb9ghjUOIMlQ9JZGFwGeLdIB7k7dtn64iqL5wCA4DQvFkmNHhDtU1+szddFmeJGsDcHp3LpKpyIiet/tJ8Mo7Z82A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWEFfoWz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWEFfoWz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so615198b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750911731; x=1751516531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QsRX74URtN50YlmM2nO+stjiGb2iTvHpEbZ/qJ9EI9o=;
        b=CWEFfoWzh1B6hSXd0KoxEdmp9gEzzipE5LxCscNxULtz5ZsHBn0axe3Ty10Wgjikkw
         JChaEIrkZAZJVa59cgMoie4G/9371QfSbGgCRxNMEtbFkljhWqkFv7/Vw/2FfNZ+7zR+
         fcs7StXfJ5kD6r+fJFkuW7S+VhlMYJwmPFsNquMx2SnyV8ipCH1DLJ2fRpwCJlxX3zDr
         ybyMr3gReRkhBY8SIzBL0gSwytpepVFApCaPFrG1Zh9gABTgnwnPm34FttTtq+LO4XZU
         /MJcOrx4tXL9vslAWDqei3YKgFieZ+m2Dfhr8QwQbZKC+KMEKXLIxhnc0fli3DmF+w5y
         6usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750911731; x=1751516531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsRX74URtN50YlmM2nO+stjiGb2iTvHpEbZ/qJ9EI9o=;
        b=woExJrh8bKTxuehRZVqJYgQ7l3ke6KB6+2W40q4MRZ81GCJkvev7gi9q3NESEqQPWN
         27Wi0lbhX1t4REQGNKN8X5wqSlqDFgCW8tB+vB02lsxTBVHVhTjvftmzaZGAdRNs/ByL
         mW+/M3Au/8xObsVXoYCRiIV7ILk0b/4ayHlgccc3l9Vz77cr+ggJ18POWKZPQja0hPlJ
         MH+whc2TKrDtTOLSVl/yINYjJbbJNcww686vCQTp84//aGx8fJRIKT3y8jurAC8SOUyZ
         pxouXYdPMvNE27GsWDBp32W3ihN2xYEkjJaL4fRMsQikig2Coik1cVohPH9Bu+dNbvoN
         KKxQ==
X-Gm-Message-State: AOJu0YwjB+yYl+S5C7KATpwB28fG+mvc0hZEeiGJppiBJgF41Nf3dR7D
	aR96uid9LuupKrBQeohUM7EQhvRt1osOuZ0DNTWigFeIkeGfP+wU8LTK
X-Gm-Gg: ASbGnctuvfzYIWl31dl+KoZL3GBIdLNhnYJo7d4c9AB/IPD7KLQXWRmYthc76WmK/u6
	R5GLtegE0txFIMGKXdJHGrcNs82WcMexAp0Aa/cbHStgz4+0RFRw89/9B4ATGa6kNHp/CBJ78qL
	OFvp95BsDe6MY6yiLmbDq96Tn5esyUg1bDrV8y2+PxJpPqIbSwGdXPWCiC15hOLt6w06T0pdw7f
	5vVEdH7YJDKPLlhzOL8jLZRdG5SAaoPvi1rVrH2Dnnlk9iOWlGuZvrHQntjBU5H+SxqQgwwXSUp
	TR2Zm4SvVyWgxb5qX/Eomjom+Quy/Que7ImVoUqtWTfcGUgFS9tBPDEoShtCOCs6VbK8Z4I+
X-Google-Smtp-Source: AGHT+IFpUDfUnAX2UgOaYtx5HzKaH5jUInr4mRBaQC2SBRW2eEATOYyrepRrwBSGs68CpIz33VaPtg==
X-Received: by 2002:a05:6a20:c704:b0:216:1476:f5c with SMTP id adf61e73a8af0-2207f26b128mr8407327637.25.1750911731261;
        Wed, 25 Jun 2025 21:22:11 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c4473133sm603181a12.59.2025.06.25.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 21:22:10 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 89F9B420A9A6; Thu, 26 Jun 2025 11:22:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] i3c: Fix i3c_device_do_priv_xfers() return value list
Date: Thu, 26 Jun 2025 11:22:01 +0700
Message-ID: <20250626042201.44594-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=bagasdotme@gmail.com; h=from:subject; bh=D8ChxclC0OryM1PIeIikl1ZBiXQj8Htj1KJRs3ZTtGg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkxJ77vup0eNP9aXJ2wbvTbI7Pq4mce+bXyxuuvFULlk qf/rEzT6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBE2OQZGf7/e7Mstn7yZstE B8UO/o4vU9JDbs1W/dZQYrpuTkB1dBPDP9W3be5XLnuFbXlwfuef1XsOyLfpSOYW/z+68mee8qH P2twA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
value list:

Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]

Format the list as bullet list to fix the warning.

Fixes: 0d2596508201 ("i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/i3c/device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e4875691467..205fa5066387c8 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,11 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return: * 0 in case of success, a negative error core otherwise.
+ *	   * -EAGAIN: controller lost address arbitration. Target
+ *	     (IBI, HJ or controller role request) win the bus. Client
+ *	     driver needs to resend the 'xfers' some time later.
+ *	     See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
-- 
An old man doll... just what I always wanted! - Clara

