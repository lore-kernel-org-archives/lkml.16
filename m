Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CF280CC8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650066; cv=none; b=Z/EH8WhXDA/kxltgWZ7gBBJdgj2XHN/3Cywx1n8ebMYZ/7GtaSjj5Na4VBNvaKuUMb5XvH0z3vL84Ufp1/O3IIQZxEqrqlP1M8dl9xGlx4Irxju6heLVd0xVxd2wJEWEdPA2KQhmPPh9WWHgnMmiMIag2SBEpyYL09F6TpyqY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650066; c=relaxed/simple;
	bh=G/kIycwYqirYck+M921BNMVSw5v6vlV/Q/P4Z1DKwTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOLbKs/FeJmhzJXagi1aeJHrzhzjh5Ma99hqXIDrwZa+7fmkYawfLcQpiv/JvdiUr8IhTtZEdpJlVB6waFaLjZeHPjTgyV/TqfKdtUrxmCwc+7Q4HcPJwu9hiyOSUwlrDZSJnav2v/Tn2ER3TJnzsduYoo4rIhty+A4xrYBtmkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNtmNe8f; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNtmNe8f"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74800b81f1bso5247009b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650064; x=1750254864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGvMW86VXWpD8TUWzcsdQ8UFCbH8qUwhnEOVQjKuKho=;
        b=cNtmNe8f5uqx+YhF/A8a/V6S88hFxJux8rZi2Av8zfgYvyv8UbZPLFrfKbXRJG6j3q
         440HVh9hpOwBq+6tC4D4qoaXuZLaeK32WJRtlAu7HvgfBjw0kbCiMRWSEaosbKxgMW3u
         MlS496dJnm0/fzDUALxAIiZexpl+tNWh9ALZy5mAorhusyfs/44OF8D4HtW1w8YZy3EK
         DgZgdk32DwmvLoOz4vlvmG0QhXrxfavhSNZIpQF3aND7A3sx0dFQVbT+eAC13D1PBSpt
         ELDyLOuykswHmvi9sCZXLgJXZzNN3948FXdsGNXiPql0gO6aqJFgFCH8k6FcjeRPMQE0
         ap6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650064; x=1750254864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGvMW86VXWpD8TUWzcsdQ8UFCbH8qUwhnEOVQjKuKho=;
        b=XbW5c2SXsMsxtdvqEW5yCHvv0Abstwfe590jpRWeeXEW0sza9crvg85flI3/9xPIXv
         G2mXRrLvC5MefUsQeM/s3vGYN9qMSejzXLALjMBCvDdleFXJLfxZveooVfXMtYs1bD19
         s/cC39qHLFIXtrYx+tF/jiPesqp8piBZGBDURsL2gByNQLnNJu+Ayc3NxrIh1xQNCqUV
         qoO01qCpXa6LX3khJ5m220B9l/dUVRda4RwWPwqUXI4Olc+N6P1iy9bayMl9td7jcTT4
         PW/zzQNRO92qGWrUd55+/xEqNHDAlOeE4FfIeLiaL0pWgei7s3lKcP+EZzLoHhUjHIYA
         cobg==
X-Gm-Message-State: AOJu0YzCA0okX4DjygATzNOer5WSoMkPIy/bNoYN+HaP0DCjhtiD7VrQ
	a6Iugw2VEk8aYzUYt/8oYhOyTUdpJ8dB6N9wUVnL3NuhrIG3JvA8EGmQuTA4WYrcFSc=
X-Gm-Gg: ASbGncvsIQwzf322qUCQtEUAUNPDGRKoKdD11yqo7i77G1rAZSVg/BAbehjn6c9YBnx
	8uAb7Qjb0YcI6d44zE+mMBRLcyo2huUKYtF5ACt+Y8/16a6wSgabK3HVIe+gcyIFrIh1iCg3S5H
	K4QSL82TQCeNy2PCHR4+gmtrAAKTnn0D4n6/P7Q/sSMkRv0CcWwl1WMdvtbc8O1xLyeTwNwMKpa
	fiTuZDUw9YZKlGot7Ki0Qolgz9E6Qds7qE+fahvL8Vk333hKHtLjrqACVIVLG52vweEycZvKovi
	CVf/0kEw3gqxGVrX/I/V9CUlrlzIZfIt+JaEIK5CTaUqoUd/vnAmNcBvy1p4zlvqP284Kz6MM4d
	owuzPjZainzsx5ru+xFjuKCQcBQ45hcAo6ywU0JYP90xd5IqMjIQX
X-Google-Smtp-Source: AGHT+IEoIe8+uPE93FTiWY4Vne5yYKjsFQAwkptqiFFPAaiUg35KFIgOU2MU9h32qh8PfN8GKiIsZQ==
X-Received: by 2002:a05:6a20:e608:b0:21f:545e:84f0 with SMTP id adf61e73a8af0-21f89145850mr4534414637.40.1749650063967;
        Wed, 11 Jun 2025 06:54:23 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-84-3.dynamic-ip.hinet.net. [36.225.84.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea3cdsm9247523b3a.159.2025.06.11.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:23 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 0/4] sched_ext: Standardize preprocessor comment markers
Date: Wed, 11 Jun 2025 21:54:00 +0800
Message-ID: <20250611135404.13851-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series standardizes `#if/#else/#endif` comment markers in the
`sched/ext*.{c,h}` files for consistency and readability.

It follows the direction of Ingo Molnar's recent cleanup
("[PATCH 00/43] sched: Use the SMP scheduler on UP too"), which reduced
`CONFIG_SMP` complexity and removed many `#ifdef` blocks across the scheduler.

No functional change.

Thanks.

-chengyang

---
Cheng-Yang Chou (4):
  sched_ext: Clean up and standardize #if/#else/#endif markers in
    sched/ext.c
  sched_ext: Clean up and standardize #if/#else/#endif markers in
    sched/ext.h
  sched_ext: Clean up and standardize #if/#else/#endif markers in
    sched/ext_idle.c
  sched_ext: Clean up and standardize #if/#else/#endif markers in
    sched/ext_idle.h

 kernel/sched/ext.c      | 26 +-------------------------
 kernel/sched/ext.h      |  2 +-
 kernel/sched/ext_idle.c | 25 +------------------------
 kernel/sched/ext_idle.h | 10 ----------
 4 files changed, 3 insertions(+), 60 deletions(-)

-- 
2.43.0

