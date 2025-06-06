Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773D2045B1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241659; cv=none; b=TvzOjhSy2HWPfQ/ikBH7z+htHsVSiMz0cfw+KCxWIsjij2A7A3bTzfz53RJ/2NAOTOo23+QYw9sSHqWsI0Rv4iqajnHDrU4iBYmKPIRWjbfqoryyh3ihZocF0ZY/HfKQBRc9fd3CR8JGkQCBprlSJngWjf0xfjWtnm7T2DwZvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241659; c=relaxed/simple;
	bh=Kx3XQZvl8VfR+h4RVQp8H/VfkrAYCingflhIoS+B/Js=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sqmXxrJVNdMekoVuLxcsftQ45+oPBO/xlg1+b7TaVif0To9br47MJsapRF5/yMXCnHd0XpwENb7oPbwwNmNosMXcCwa/dk1IvGzW4489wmIJn+5e+eDgzUHaaw7uss7Iu/mEsK4zZGtu5Xymu0BB3fIROtIJ2bJ5q99Q7rQ2wKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxGqh7Pw; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxGqh7Pw"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2186953a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749241656; x=1749846456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPgY1nx6H+W62cgXA349go+Izuxgt6k+LGGsLohDlv4=;
        b=fxGqh7PwsRFHkROj/arvZqSIcGa3zU9CkQkTVCEYzbu9SOEhHJxJjD5/2sgULrmiez
         ddi2iuu42825SiPXEgBuleqXSL9YBO8qvXcikC3fiLgsL3WWC8K208f7xtl5ZfAGR4Au
         B47BpeIP0axMMnrPSFRb9lA7AV/jqLncikdpjQ/vK0Midw1u9H9YG1ADstZNvyU+qPgG
         HN0vcCuWowXau1F78axORDOOJ1RJ/E7UnT80v0lqMmEWaD79mCLPdVhzKF8psC5S2mxv
         qpQe1DHK6ge5KY5L4Ts066Nrm9IyVNlwV/2FnXFEy+TznMbIJuTfDT0KVsqdw4q3wnig
         ur2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749241656; x=1749846456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPgY1nx6H+W62cgXA349go+Izuxgt6k+LGGsLohDlv4=;
        b=DI8Ano+TYzI+sriUSpWt0jNIsDwe41dpwbLNgotMus6YiJnM8W3NeQbFNm3xQl8ORR
         lGhVLeIB15pqrP2ZDsnqafAAAnjPoOvIDf8bpftc1QSfxZl2t19xLY1uq9JVg7Hl/VFk
         9wajeWmJ0QYI0eicBlJtsY76DBi8/D/eQ7PyVokArD3DvOa1G4IUa6SXG+6mVN/HHafN
         TLg3Gi52A4NV7ajM2axo0+wwtaEhAFTrZnHsAWpFPrtClUfcroU48QXC0+xfFP05HFVH
         8gw2z1Vgv+PhE2Gh7sMfit9UaR4cjERObbagKEsCEDicypC28oBY6GQFaE0gsVqY9ICX
         SHig==
X-Forwarded-Encrypted: i=1; AJvYcCXzKSoZdCIkhN7KwlsSfcG2Y7Xe/+kwzeBBvzE1/XbLhRAdHL0aeVXu5zwYWRS2Bdwzo1/jfl0R93NpZPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsTLLVV80aYrmNE87ckWKsEauRv0NSIjn7AdqYICXdX7hd9yso
	lFZy1tbjf1M40TcUrl6pKj94Suyc1XXRKRjngokHBTcXcCwxEPHW15Vy
X-Gm-Gg: ASbGnctEnLmXn86XcR9CehYUSseo/Jtmx0nLKIx1GZF6P88HuieY3JLcMRK6qrThp7c
	VgRHjcpfFAWkvobVLIc+o0HGmeRhyEvqi0n0pLI+e+giPsJ1EDf/25DA+TGQ+JI3s1RnVCpwswJ
	x5fcLF1eFoJkdv4pgKBYjJt2x08UEursHM2JXB7bLpa9gRfU0MdXE56rN54JcAWDlscJzq2+MWN
	XlQSZWioM4T7XxnsW1GtC4U1E2UJqLLgMHfVpl8hNzY+Jyln0HR/t4dHNIMA5wip74RyW0Y9BOB
	+ufzNWpYjcfSlIiXtcyHbpi+1fAmaSFiKTiUgMREY91zcxtYBmA=
X-Google-Smtp-Source: AGHT+IFS1RV2ewhBThP6gINCUGusEx36LRy7+RSDGs7aL1nZcYsVpswGWBi/CP0UOK9IsnBM3gNj6w==
X-Received: by 2002:a17:90b:38c6:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-31347681535mr7359618a91.27.1749241655961;
        Fri, 06 Jun 2025 13:27:35 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70c5asm1573130a12.30.2025.06.06.13.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:27:35 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] smp: Improve on cpumasks handling
Date: Fri,  6 Jun 2025 16:27:27 -0400
Message-ID: <20250606202732.426551-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch smp_call_function_*() to use more suitable cpumask API.

Yury Norov [NVIDIA] (4):
  smp: Improve locality in smp_call_function_any()
  smp: Use cpumask_any_but() in smp_call_function_many_cond()
  smp: Don't wait for remote work done if not needed in
    smp_call_function_many_cond()
  smp: Defer check for local execution in smp_call_function_many_cond()

 kernel/smp.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

-- 
2.43.0

