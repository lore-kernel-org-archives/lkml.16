Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B0233713
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836138; cv=none; b=PEr/Ft62aRrFgcBfuRmcVe44/8UN1+qqf9Y+v45LYTHFTdFdo+/2/HZEQVaXK0Fc1oByta2POyLSTJZ0JYWNbH/a2VOQoJvpT6Gh9rustEg2zag9sT+QDZm31WOsiA+lNeDpmrdRA7FVZPd1hurDjQMMU5uaejis6JEjusGfBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836138; c=relaxed/simple;
	bh=NquVVOzUvVHc51NXGJbazouN1NI1DYful7g9CbAi9qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2OJ7k6BbPw/WMI4MS6AZFx3RAExYc2PMPw0GrRjtWBEj5xG8oWCSH1ChbftL/L3k+uAbunhF3AbAQpbW1lbWuUf2jFWpoXlZ7hil52CRCHSH4Cyr9Gky8ah7vN3SNv1gnTbh5v9DtaSKVwNxANatFnQSYq8zofsTlA3KyWSnZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=kwwP30NH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="kwwP30NH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b98acaadso24433b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836136; x=1745440936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVKJYjCi6cfX5sAdrJ/2R7IvJcF8PtgZtR8+tQIsnkA=;
        b=kwwP30NHvbolfSbn6ED1xdsSkUu7S1PlCKDYx6kZf9XMKeO+nXQz6Kh1wIKAZ1o7gu
         PTBCXHLvcj02EYD24Zk3czbqj7B68q5WZymSqS+bGHxexeY2RYynLliogT0ZRXcDSJ7C
         CBqsvdw4utFDPpvjqqR8LQi0mFuU4qYQj3+JyKWiJ9cum8/eDHPo9QLSz7bMZWIgEk3d
         3vhRy/hrMDZN+C5yPImNTVhFmDvmDPxVmRRCthcjiNwV03hUtGFNBCBoCfHLsR7XaEdE
         ip1zAI1tdsuJg0ZS+o5ivFLquzSTl0RVhAl3h2pLrkO78wYdkb5Br745M84E2Bv9nZEZ
         37iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836136; x=1745440936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVKJYjCi6cfX5sAdrJ/2R7IvJcF8PtgZtR8+tQIsnkA=;
        b=YkbJL6ROZ0qVBMpMtu8vlPGzqKq/bl6zTCvW94sxbv3dJwsQEZeYEX7cFTJkCpsHVa
         udCFVfyp7w3awJbJ0MChK6aJ90GyGU1HSj1GvdXkVYvoOyKjMDv9zw+GToMWM20H2gup
         x0vt8pW6pnQ1AP2zvA4QAWzPGQXtn/yvsAbuSblGcV1FYv1PJmAD4BvOQEin7YPS9gCQ
         dLGM8mbwhc3atEUuCpbgHB2aSqk/wbaRLXL2LAVeTC5xLkSWHTsaktnpgSDjHLgrTAiw
         gn0aeulkBrjau8OLpCTsLKPuHf4TS8MF3DQhNISzrAuO9qQ+MJnpiz/fSo8glA5hStzn
         ft8g==
X-Forwarded-Encrypted: i=1; AJvYcCW+AG8jxhMzFEt6m55lzQ2LK1swOKq+Nt5QLMtVX5cetOrUe/9APziFkhFkDyyxiKiW8/5mhW2XwEQMoFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqEg1+opbHUfGM7rnSw4/fQtCa4zLYiR0VCgDt7/YBhN+Hmm9
	zIXpQsKW0oxqTax8r5NN1taUEQc3DVfGkzQip2cKfZMc7O4lE8jnMZCK53Cz8w==
X-Gm-Gg: ASbGncvINB2JIFyfHgv20W70JmWepWMPa6dhDM4GHxI27qx4O1JRdxrLSl8Ai6UM9+a
	E+JrTjCF8Oe+uxd4fCsCycKfn+z8BkIO95sxZixbmLXc+DseNAYB8arzDDhOOK87NCEMFQv9LrD
	mrDntVexuujZ2cu6Jauc4x/NC669COd//MYrCiEMh4NJkOM95yohVgCOa0z2IHSmkNNK+kfJKcU
	VpS45ugB0vr12MUrNjEdOt/7HkeoZ2lgjVYUxun0dX52VMOLoagGrhpzkkjI4eJMJfTd2H2xGUN
	VTtfqWmPBIZJkdmXNBAR1GZGnmFmQk//N1FKGCErENS910rqNWluDXFRLDMhvTQ2m+15AdQJhm1
	6nKbG9A==
X-Google-Smtp-Source: AGHT+IHSetnTFl57LONs/SJ5/0CznpYL8ILM+j90Q/9oEZtSLp0hQIylnIjaySAUtnyXjyoLO1PT1w==
X-Received: by 2002:a05:6a00:2e24:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73c267ee1bbmr5002832b3a.22.1744836135750;
        Wed, 16 Apr 2025 13:42:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da87sm10880220b3a.127.2025.04.16.13.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 07/18] staging: gpib: fluke: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:53 +0000
Message-ID: <20250416204204.8009-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 396524901f12..f6a84200e3a1 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -712,7 +712,7 @@ static int fluke_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -748,7 +748,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -775,7 +775,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

