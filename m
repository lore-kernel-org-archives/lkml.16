Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403D20CCFF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849989; cv=none; b=RqkBV3v8zS9UVK00IoP7Crlr0b2BMVqGrMRZxHv77K2FuvhCKXHpTf9upw9zIrKBCTXNmFJICKQrWl6IjFHyKKg3Gi7ttNpqCucdnbyFMi5RcP44Pxkk+HRP7LukyPkUaG379QFyfX2ePdUD2tfW6bV9jXeL/gO7sLYCtVU38bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849989; c=relaxed/simple;
	bh=r9FE5GpaFdBdPdJ/Zrxc1eYMAW56Ux07mT3KRwmjw48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5I75gsTbQx72CSQ+Gw10m8mtk2DiCO7pWcWqoeED4jx5c5+z5rvXkywEE/WGQA9VoxOWhreKAymaOeztaZYJRLLLH3tZAvTe4xGjFu9GCrqra+NTs/x5yoDUKN/0ZaJvGamLLdrfgFff+8HoNwU5/63Xpxz/x5UvW6z0VPNYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=TLLEa4NW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="TLLEa4NW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso3488155ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849987; x=1745454787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=TLLEa4NWkpXDNUEzHB7wT0KPLcdn+LnaVGXKhTDPxYdrh++52Y0PNyxMo7esHiCddg
         leVwI9Ionzf20gbP2PlXAhCFZ4V1Vo2tFn1AVEdwKk3zFnRpzfw/r5JGRh33cBs50z0t
         3L/OXNq7vcvW6+gOBjd7qS7U3Puk2YFpHDmoKZQ3AiakxscYuHWd7Qe4nvg0D2h1Q/8e
         rZKmN9V6m7HHS4If2Dr6+zmPSXEH7D+arq00d76YXzqfZTL1kgR8Kq+4F/hYfafP1WdB
         NfjagXnFgUavhWGN1UnVUtvZuRoxDFpXeU8UCEuVjTLRHO5A/QJVMuA4imEIfpxFwcXD
         7phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849987; x=1745454787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=HUrw3u4o75dltMDr9Ozqg/9/OjjThLy+2kf4xmEZ2Xdsb2vrqYByJOBhOG0FufpQ7s
         Y1e7tUyJkeRKOz2+hLeXn60HLarF9XeJzvsCo2zkfdQkEF6lLMs31sSzu5notAQW06qW
         ftowdYpIO0mH6+FjQp5LXTeF947VAKSYR/934GFBDon4x9KOUJF9gs4b2YtoaBg1ff1x
         k17wJaHF0DuEWD7zFTh29xdR32DCd5PywxOaS55MRxT4cuSKeC6zYzALx3nLN0hrehhn
         F7OkmNXnnXd5+3Irp4eKoyZL/Q3/ObkccqzlcpIx3c75RjxcWm+VTchUzw5b8uwsaw+X
         zTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUgkorK8FpGBRAOeEy71fNpU5/0xkQfnFJJty60lBJJw96oJIErvo9iU6QU02EqYUyQh04QE7YztmJapqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+LfujudNiZESZCxhThp6jGXGN0hutEnfv2pUXSHL8Fkfgk3C
	Vm7neTgOrrCFofzofafguNB7CBCatgZDL+mei/Q8KR7B94YRS61Bggn4PFi5Rw==
X-Gm-Gg: ASbGncvEHcR4Zx0o5PJxnaxhKLGWJg/wCVN5mFJ9yqkRr8TN1Kniuw3vaGqW8OUzmRd
	ryRsbmBhtrpmOiVLmyXjlKBcKLRVJtUDhme0TkAnRkmf71rddIqSOH8gDfC3RO9YYcKvs483jYo
	GbwT3q3IJG6Q7W0Ij+vNPuQqDCa8OdpXrQF98jAQoRZdoNjcBJ4pBCdztP3tEofZMICPtK5KoWL
	rUWm0S05s2yJrZAidHGZYlwGA3YaUngXp1EQl/PVEE5EZz7iWwGcH5Dh+REzDxuOsfW9V0xjFQj
	nZEYeFVtAYaqEIr1hnD0VmEk/qCzVzfMMiRrTseMtn6YoHybFmxSDLpm6enlLqasRwKpczlZwzA
	f45n/Ww==
X-Google-Smtp-Source: AGHT+IF22f9NKWSjaengdB/H/u7QwubeplY3S/KRzPgdZlcz0HAybXmkX0hNLsh3Kbn2Y+8KnSHX3Q==
X-Received: by 2002:a17:903:2c9:b0:224:194c:6942 with SMTP id d9443c01a7336-22c35973f06mr69024895ad.34.1744849987568;
        Wed, 16 Apr 2025 17:33:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e83sm20768425ad.35.2025.04.16.17.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 16/18] staging: gpib: pc2: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:44 +0000
Message-ID: <20250417003246.84445-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
index ee4ea1f32dfc..ae265e2eb46a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -519,7 +519,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -547,7 +547,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -575,7 +575,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -603,7 +603,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

