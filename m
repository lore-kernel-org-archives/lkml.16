Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554619D08F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849974; cv=none; b=TEnVqu3VmHugDvAtDSuD01g2LLDF1z63qg6xmddf1bYbCng2Sd0UeAR9/kBByVvRW3AJybAdJgQWpbcJ4B/rdclTDzWREDABFyAEAAcOb9cXPDZ4AU/kror/E98fGDFXK4KkQrGStWbWGh7zCXDLLMamtaAph9BoxzjeJ1Qz4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849974; c=relaxed/simple;
	bh=9qC6SADjVBvrGdZqgD61dD4ij9DtU63SWTFy4hBsTVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH34aLCLtLbraqnakqE3jDM0cIYwMrxEPKkfQ0jnzohOLSWKhp//ufcAPkooKldLVb+2+QzvmBQflPJ8VuIBk1LQq58Tp0H3QFuGC+YAMycN+v+PaQYfxs8iQBGa9JQlwGw6Y2K9zUi1NhrazGW6WARtNGmpbk0181iAs/gq8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=EwXy6fRM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="EwXy6fRM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso216834b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849972; x=1745454772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=EwXy6fRMh62avihKCO4W3+4YpZ8NSEYfPwkrB7A5ktvTtZustKNDTQJ43Ufs3wJIEF
         986PnsFH0TmDpqG1Qav1jH+UqsCiTbhclfxL4iLlyfoal7NA3MwWmpwRwmGH4cWqB0g9
         V+X3gyXryPYmt+wHE5mr3wSXW9FbHbqYEOpmE2Rd9L9RrgVCnwmf7jX/knNHCx2CGIRE
         7BJGdSctm2/Ik2PTww3k8eJahjI18sa9KQEpCsyz3vLEeyPiG+aJ0WzNLAReO1zFrMsF
         mj09kEmTzr4BImS4eTcc+5XmcVTycyBBxR7JetWuMx+7E0D/mllc+4CP+Z9rypZwESpi
         jGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849972; x=1745454772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=ccZ9MXAAobIOJjvL8CNSgX0UQ/DEJ7XnxytyCG02DZgAenbZwedvRXQlaQ12lAamDV
         lWr9fuoC/MUiQNkWVwPRGz613bfv+gd1VLXLlI9JJYK1hDWYTZAbuEXQzX4dyRvXDD15
         1pioKR6xn7c5oE1BCpVLbRfyT8Kk66HUnUZ/FJM+thcAh7K6rDBl+XkXAyjjOTO88WOP
         v2L6WqhkZKy3PmSQS/emYCXQWIF+ZswGNKkzYG+Xp+OJfgzaBlxmQvdE4GGJhkztQJrY
         jYGTs2Sxy0n1ipwfehOJCrNaVR18MS/hGlqiIauJ7sNKXCz0bt5aSTigcqws7m4CjCU8
         I8zA==
X-Forwarded-Encrypted: i=1; AJvYcCVmlqBfstN++bGThhXiFaopfOPO5/bAXwk27HvZr9priEXGnkdU7DKAy0QnYIvCBs27xNLQlVI2TTf3dho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNWaYXG2VJNpFmhU0+6N72SQ9yQoZ+Zuykr5gAO0JNoZuseIG
	SdJlvgKInCueUYAiQ7+F1zPz3CaUVCaNWtxRSSV5+q+UMWasBR4o1q+7JjzEow==
X-Gm-Gg: ASbGncvYEwTNpR3ln22la3DkO7AppGmzo74ti7nGvI9kFPKpF4vj9RbioPnuDDttBAg
	d/HsCKcfFcDbHTbF9p+nrDxfJYo7j5StVDTixuJlUF9nB2C+sukbqnCMzKU+zdSeNN+nqQehy0S
	86NUXI81SNrhMg0vEwStgy0flCukztlCX8jR/DhH8QHEtsTbhLbcOASYQ2djuMpIOMtRvgy3LqN
	FXHYDbN27QtlyMQTVQSzku9MVmIalzfsFDSXvJrpnBnTDNjQbOaFXtdHFn6BeoFYfQDZCXoFR7G
	u658iWsQJYDBGFvZgzoCPWiqFRQ4d34digPkxhscLg+aYX/jYrQJB+4qZFF48PtSKKTxqVl2J8z
	4T0NZrg==
X-Google-Smtp-Source: AGHT+IHj2i15EYTCpVnq8XJ+QWcgY36lBAVDCzPpKYIxC0Qq4MKiJiwczINEofcKe1ulTXvKThGFfw==
X-Received: by 2002:a05:6a00:710d:b0:73c:3116:cf10 with SMTP id d2e1a72fcca58-73c3116d5f5mr2140061b3a.23.1744849972222;
        Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c4e69sm11430781b3a.53.2025.04.16.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Thu, 17 Apr 2025 00:32:31 +0000
Message-ID: <20250417003246.84445-4-matchstick@neverthere.org>
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
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7076e9f57d69..9e41fe611264 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1434,7 +1434,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

