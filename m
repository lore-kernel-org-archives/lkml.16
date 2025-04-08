Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727525A353
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151130; cv=none; b=heIo8ndPsiMrpTEiV6uJS/AbY6/NfeAm57A292QniSXZ7VdWoD8gnzBkUR4oGucQiWzfZHXKaVO/MUkvnpJFnJvWFM8Fvs6kFP7HRxTUARLHJvgZFM1emHgAw+ezFgq5lIFL4GZrmEiZtEOdukYqFOgq4ZqTi0SNxDgIt20Ghl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151130; c=relaxed/simple;
	bh=/JUAqAmra1E7oPDlGlfnYHBsae3aHwZcq3xJ5pyOY0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNRLPDXR/sM9FvpTr9eldWGc19tR/rTqellXRqUI2MOrEVg6BpgQ1JcgS0JRVFWpGDnbDc4uUg8LxZU2F5gb6fg9k3LU9OLAv97KZcpMpJXIHKByKIN56WJgKWgy0DbOb8kTAsGqN+L9W95G9PYE++HnGxjX4czrIwbC/GP2iSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BuXJd2Yk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BuXJd2Yk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b98acaadso6073870b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151128; x=1744755928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy+kPEqBIyOomigqq8ELaZaIXgSLvhQ1H1rYxS1Gxp4=;
        b=BuXJd2YkqGapW3iLLHecPVLJHsckENcrLOQmJWOwYClYfguqsiABG7df1mDcu9ErsH
         2x2/2EJoH2CaW1HphZEvVQsofROnOZzT3iz3EJ2P7J6BSOYCywJBkylSX3aaQVmli2r9
         Wkk9RDGC2JVR4YFbV1e+IUYEVdUziVmveGvGjf76rMNANxnl9jQSEcfzrQMtnlC8Tunv
         CdJQ4NLGtkuHRYqQO6dM7yoRFbplH4dnfeucB1T+HBiXwiOoJo2rvDKxGeW04WJGWQOM
         ggs8l7KKjv8Bg9XKzCoW0DpXqxXnWerXogXo0SV8JYNlzWhVqLhbMIkJ9lJk5wyYhsZR
         /4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151128; x=1744755928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy+kPEqBIyOomigqq8ELaZaIXgSLvhQ1H1rYxS1Gxp4=;
        b=rGa100cfQyzUGwjzBUdzfRFpZBxrlBVCguWpoymYiwrb+kRVeU8qc3QxRDt6Dgw9bs
         m6f6zYomRDh69VdN0lVuSEhWN01qDaywpQLAvw3z7wO202kF0MV85g+LeECxRMgLfnn6
         gLK5GsTmQXMMJU6hfSYd8gSxkT/2kZjZVlC21vGKhUQ9Nixe33elRc3iYyKh4SOZFLzo
         65f65Soazh2z3uYte+r3QG9SMWFgfdTIP+QzHXzcWFHPZQxROq9szD2hRW0kODa92yyx
         kGE4FR3/CG3nvYL2qCgBLwszdhWf4+50x2T/5fDySqygwBSfrAUNa/tFE7yT9Hev+BQz
         Tywg==
X-Forwarded-Encrypted: i=1; AJvYcCVAsyVA9EJ+6YmNShhhf1Zar+y0vVCi96eBYBD/xFjoV5Ic7VW6/D/WmWxhMF41FV21k2M63P/LxN2cDs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8TdO/6V8yTVMxqQeQkS/ldpC/7eA+7Abym940s5jMXaFYNhR
	XIob5Xrvo3e9cCo4y8ECL5uK9BQeobNtm7aDrOOkpAqdgGFl8sM3VKYwATHL7g==
X-Gm-Gg: ASbGncsO7a8tjhjHZPDVamzcciTFRVOkkcHgemuR+/nN191m8O/fdxwtVM9/Ndjwemu
	P/a4IwpNShOXJ2nGrU8bzzkevH5CLzaNG5ojzSgdzbctx778TJJU88N9jBuHHDQm/9Xq86U1WS8
	VYw9OPtjSyD5vnMXrZdbbPGrKw0z8e/gST79RU0EGitESMn/oXFwREeN5nKvQ4EBZccGV013DwT
	vnWuBBx1vpxt7SVBO7TG544fOu3IcFKEWHAjXOFlMr7jBDPPt1BIzJLzOpK/sZ5Cvxq7HQ0072d
	wVHUr6lDizL/B8PJXGfbOjOMJ/gLXIpN9JQtvaZK7VdksDsyif1NKjdCCMDCEEs3OjpSAPKeSJy
	4lA+B6yhLjA==
X-Google-Smtp-Source: AGHT+IGYcDiGfn//VUp80eK8CC0HS5yxbKQ4gMtbUnVfAKbMWSzcyk8g2p+esNPfkcUEnZ/yPM4+eQ==
X-Received: by 2002:a05:6a21:350d:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-20159195c99mr930918637.13.1744151128164;
        Tue, 08 Apr 2025 15:25:28 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfbc9sm9615527a12.9.2025.04.08.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/18] staging: gpib: pc2: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:02 +0000
Message-ID: <20250408222504.186992-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 5ff1d52c14e3..b0b19e2d4782 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -518,7 +518,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -546,7 +546,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -574,7 +574,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -602,7 +602,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

