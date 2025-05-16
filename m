Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46E3C26;
	Sat, 17 May 2025 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440055; cv=none; b=Y11YqMEEse7zDpc47q9PRxbDG8p/cmSaSgGqdCgCG3g0nj6O0vW6rSOJZYEjoR0aD9ltonbjLY4Q0SZS0i/mRAR+kJpaAx0gAp62FLn0S13q8ADVybErtfCrNe9SnCndoFwsEboMp+O60CB/9uRCAMZtZ8rROgWlyWA8b/P7YY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440055; c=relaxed/simple;
	bh=KjcJjtelOwQL5UBmL+8NLtma/yUYClrcyHGdIfTMHF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UE8V2TH7vRRMJnBcwuCDQ1yUmqrwo1SzxwrBUCc9pl4EH+Rx+oix4dBPipSzaerA+LXi/MYJGA8Fek1xO8WDur3D1Y7DeZ0YlNspRsDIcnbWo9JFsQ+UwIfGW0OYdL4jO4tIcxlwUh/x8/Dq/DiOXpXtkykBbOlQD9xms0jEkok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOOwxmqm; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOOwxmqm"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4dfa0f6127dso710852137.1;
        Fri, 16 May 2025 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747440053; x=1748044853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8AywrBQhhtb4QmqPICmPCLx2PfD8ufTv2fjGFxU3B8=;
        b=aOOwxmqmWb71ZyZt2iA+v4RKKp1q1PnD0RRFWnghtHFvLXhqwb1ZkQeeNXq2hz3B90
         yl2++Y1CsbZNgU36KRjetf7Rhecr51tMbu1EhA0Vi1Re7TJz+wXct/vjP8bFU+UYJzb3
         bWF4ySNtNanC5XFkilA5w2FUj8O1F8cDUw9dKXPmMLKkATFkiSTeIjHIzecWWaFQ38zP
         G4VhoaaEJFRxL26ev2Jgd5lBf9e9Vzdjv5e8k/cTL4o8qL7w6xKbPkPzeXy7Rohm8+zJ
         3pliLBjQFF4Ipnh3oA03utToweDGRareVl1vdc8RAaexdO66eqwWrertkK06r47qHkVk
         dKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440053; x=1748044853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8AywrBQhhtb4QmqPICmPCLx2PfD8ufTv2fjGFxU3B8=;
        b=eGkTpteRqRnuU9epPd3JefdnMsf8jfIV/3fDi0ZZbi+VG2t5iVoIwGTogaRP+me5Ou
         0aHr3/JAteoxp0OsvjT5PpkTqibZA4ngn4eECnMeHoMJLiY08E/dDp0CaEnw+kAxeskZ
         ZkcHsD47Pwpxc0F65HAMPNPmzkECPrfgAYyivs1q7IlKJfNjqOiiip7Y1H14TW6Lq56b
         XolokFJDEBpcFrc4U6s5pfX+7Be0cdOOwOKtSywM7uRC0pXJBuBSoj0zoappPt/b/e9R
         o87l0taKMhnxVNPZhYosap9iN4gBJbtxc7//qiD5QRrxMrbdLNwMi9+EUF6OYcjg5oZi
         N8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpyy2azombIu7DVX/yn4gTEgRxmU1ZwFZVsNmik89AGYqbviBw7lt93P/sW3eS2NNL2OeF53dp3wyrsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO78FI6stPe5Qc7slLzc3hvvN0KSfHuNez5F40y+o8VUhD+vfe
	L1wc07HBkb0eFGMA90lFM+0zik6dHEsXL2MSChocuHQeRRmw5h0Q9Oku
X-Gm-Gg: ASbGncuW1CynI74gv4kX8iMxHie5u5cZck4jYbxffSlqO9gMIWvIIhBy1VXXoU0tmIQ
	8BX+jlnONupXauC9Nxb+WQ6/k/0v0YzJGoWWyq17ZPVUaEUDUo67wU1a9ulrZWxfqySa9hw5V/E
	gdjrNtTDTCxHlVx0p9pB4pTEsprQ/tjv9UzgiEuJRXWcDHi+ZRm/ixEsB6W7uN5Io/sTmj9vycV
	y1umby2frDQ9yiUwLUOnhqOfvCRfd+oXzKpK6jBM7cpMfJOmvTsi5bRiybmPT+AQ1fi0eFx5tf+
	d8pjvFQqWs1uvlCikM6caOC4/8cJwXwoyl+cvjy8iOKdD3Gl0UnjOjsw44J7kl+Fe5vkesLBblz
	AEV0pRdH4UIvRlFgxvIocZg6U79Av
X-Google-Smtp-Source: AGHT+IHY2CrtzFGHfrsgfnT+H0O5Zg/eWuENBU6A4XIJwZGfHVtLF0WJqip8G5UINcll73oHJ2mVBg==
X-Received: by 2002:a05:6102:508a:b0:4de:1ab2:ac67 with SMTP id ada2fe7eead31-4e049d329cbmr5464348137.2.1747440052548;
        Fri, 16 May 2025 17:00:52 -0700 (PDT)
Received: from Ubuntu.. (syn-097-097-020-058.res.spectrum.com. [97.97.20.58])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa687ed41sm2659765137.25.2025.05.16.17.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 17:00:52 -0700 (PDT)
From: Jonathan Velez <jonvelez12345@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Velez <jonvelez12345@gmail.com>
Subject: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in dwc3_request struct
Date: Fri, 16 May 2025 23:54:47 +0000
Message-ID: <20250516235447.17466-1-jonvelez12345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f11570c8ffd0..bb140dde07d6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -942,6 +942,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to the scatter-gather list for transfers
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.43.0

