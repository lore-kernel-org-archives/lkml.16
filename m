Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C8D218E99
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997698; cv=none; b=QfpM6Btf+MaHumvbLU50NPXpNEmmziFwPCcG143YTP79ZCmp4FrupaSOxPK1Z2tKXYqUKZMFHxEbt7d8vX81j/L/xafA3QR4/gKSC9kHhNs+9HaBOnb2/PXc2N6PMqI8kbFpFHqA22jBTemWyh2t5+VGxrToSQlI8ACAovgdJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997698; c=relaxed/simple;
	bh=ne10/qVG/Z9dVxxIfZAEEkiO2+1PiOiZ0CHlV/sFviQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFEf9ZRoGB3G7j/DqfQ5g19WKGFxHxUE6rksWjeeZWHKdvkl4d7J1s8zpeo2af9j6amNiD69mWlkeGt0I53BTBuLY+6VwmPpCPCjny1vlCJBtVdfNP3aVuvNk8DXJxl9pkSXMZhDi9ftEW2re7KO5028T6gprRUcgw1k2DYcHXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEYVFm8L; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEYVFm8L"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c1389so1427814f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997695; x=1745602495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH4AbpkU43gIjXkLIyvvHStxjo8ZlrUkUdGQZryYFo4=;
        b=fEYVFm8LWsjaCtfA0AID5wPUQOZJBZxCSdVGxUkivcnuB93DWdeAwQFGgF1K4KOFgq
         YMWch39fNFLT+6v0OtKyHSbHQcLNlU1JGOzCtqCOBObFvkhh9llDa4bEjohRIXichlNF
         FbO4q/QEyzslQIVNlcOgq9DCOIRm5haZafpWlRL33prPQC3jFao9wfNnkrEqKE9K9m1k
         nryZkqPj/WgZRhjeuIXBmgB97l3Cbdl8pMPl2cYC65vZgL3ABXrrej3bJeocukUdf0r2
         fieSSTZ5NthHtmh46yO/gv4IEdpgbJ3vNe8IWIHwqq7LKqj92+AgHUAoc+CVvRErJea6
         4FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997695; x=1745602495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH4AbpkU43gIjXkLIyvvHStxjo8ZlrUkUdGQZryYFo4=;
        b=ZL1kIK3fhsvY0o0ByLlCJ1tie6Ou4gWpEx+psXpTDmDcEO2jG5LDbMiVjxZATbj+Ar
         0b6VoMxRH9+pGKSnE//SgN2klos9TXBqXp5PmjnLu5fNDpqa7HkLelMcIUpBYBmRM6Z2
         XLQ3I1Ub37oBUuqWfuo1JDDX8bcof48nFCoq+GL1eVp+uLVXC0ZTm7rAdOdhX6rjGgzF
         nMpauJGgiLn6X7AxQcAl+qYftnHSQAunf7Dup4LVggn/gPJ5U9Q+N8SU7gzHYaFiu3IP
         m+2un0zquKwAmAs/vr/2s8Gt2ctUdUHF08EpCAegEfszjM7pIYrThVC9q8pZwXCf7Hly
         WuEw==
X-Forwarded-Encrypted: i=1; AJvYcCWZISi4emE8RJ6PbW3Mh1+VNOg7+/dE5/yvBMC2ctnHNuow3pXHrY0nQyo84ZR3jPgAe1UacRmZN1F2Kgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpC88ogClhS/HDVucZod3dEjS2qM06RYUgVRvE8C3ZZki8seH
	SCNgBQH6GrdazLC9sm1k5WDXEATz7HD+8LjBNjLOKag6PjP7m/WZ
X-Gm-Gg: ASbGncuqcgURljk4Ma0DLkUAqV89V9qxBeGXuscesTLozq/JLh8ofvbWU4EnCgVVcpJ
	2UvbdGmccUzffYW2BZOlsEzKHalu6PBdrl+MwKdZ/Z11mVnqxasA9OuHMsloaVy70tpUGrVzVPZ
	AvdHrUsHKaOi1lfzv3dkWE87hRQKPyYA3eQheAYoX7IeZyaUYbaHBJAvdeSEg66JQ47Ze+gZZUi
	pSJK3aG2rC9hEvSCoc57MmB2P6VEB2kYEqFdHfc+4ORSynJnmfq3h2IsPSd59cVCcf0ziAKsUU4
	i5EXegePmT+QO5kClKk2Ri2SRovV2LIchdDTN/6thEKkz1DDUv5LpKnerwQnBchbHLZRS3dUZOA
	s
X-Google-Smtp-Source: AGHT+IFWsUvUtyMLZ3LB2ut72tqx28ZgElhVa3rTsibeeD19gUL6aJHQ82dILW9NhfhpOYx7hKvcPw==
X-Received: by 2002:a5d:648c:0:b0:39e:cbca:7156 with SMTP id ffacd0b85a97d-39efba2ab70mr3007336f8f.1.1744997695212;
        Fri, 18 Apr 2025 10:34:55 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:54 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/8] staging: gpib: Fix request_system_control in gpio
Date: Fri, 18 Apr 2025 19:34:27 +0200
Message-ID: <20250418173434.2892-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The implementation of the bb_request_system_control function
confused setting controller-in-charge with becoming system-controller.

Remove setting controller-in-charge and add initialization of the
control lines for the system-controller role.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 9670522fe36e..29aab72c1f0f 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -889,9 +889,13 @@ static int bb_request_system_control(struct gpib_board *board, int request_contr
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
-	// drive DAV & EOI false, enable NRFD & NDAC irqs
-	SET_DIR_WRITE(board->private_data);
+	gpiod_direction_output(REN, 1); /* user space must enable REN if needed */
+	gpiod_direction_output(IFC, 1); /* user space must toggle IFC if needed */
+	if (sn7516x)
+		gpiod_direction_output(DC, 0); /* enable ATN as output on SN75161/2 */
+
+	gpiod_direction_input(SRQ);
+
 	return 0;
 }
 
-- 
2.49.0

