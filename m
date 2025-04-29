Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C021DE2D7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915389; cv=none; b=epEsD43aLm1IBkjENqHr3DWj/0vOCK0nqcAVDg/L8pYQwW2rwc5kyrkM/FlEa8uJ7nVUQzyiw2DugVvmzcQwWI+t9h+UbORkDoGS/lB+vGQ4AO0aZeFcyTmJeo80kasXKotECrQAi7MCq+JL266mPd1aVuNzRljbj88x+ui853g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915389; c=relaxed/simple;
	bh=NZvHln3bcfSZ/TQLs4xr3IKvbwiNkKQxP5LZ2Fgfd5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h0PY64RGZmz3gkjfQbJ51ZwyAV3QsWhABPMGQHm4r0LxGYlt5Wt3+cK4PFjTk2ZWzjTQ4xmYZ42FUJjAVo94L/o8tFLd0H8aMkwobAtYuzDrYQafewxs60dNMBr02FhNzNTuX7iKPDjUBntKxWOTeQq/7TwbV7bQNoeyt8Y6Dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fxBV8f+p; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fxBV8f+p"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22d95f0dda4so83674305ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745915387; x=1746520187; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHdRz/EtmBEiEa3gK3w++o5QutFIQ/a6w+5iRyEUy5Y=;
        b=fxBV8f+pfGgJYYFOavC57essN5m3eX35d0hvu+KXKWUUigmrVfNiW+X6N7xZ0+wWpR
         RpJ/UoO7y+68iJ8kk5yIlenijdLG70e8DQHItSqParCTeNcTSG1VyXz38A+Qg2G686Y/
         phJ2IgWLvUq78OVnUGC4dSBGtwOGIeRbzz3QOfY6f1WBFRgGCsOO1GXxc9H51pAvIcdV
         F/BY/YFIVo64dAnq3PxbutA7SVYKE+Cu2gl0Ul5ByueRreFDd1Vu1WRu236RKZ2Lqyy5
         EUFdLFSSkLQcz1GPN429h8NklVkA1VlgqoRP57L8mswjdCj4HgK5rK9gK5sGlyp7BhmK
         Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915387; x=1746520187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHdRz/EtmBEiEa3gK3w++o5QutFIQ/a6w+5iRyEUy5Y=;
        b=keYwpGYMm4/hg8kEVwRkJR9xRnqFVtkPSgLPsUzPqW20r8h7t4CNmPsNVydf4uO9ZX
         qveXTIoBDWNXGozArBUn+lOqC4O7vkefkFrWkLzvdNEJEGFY/ksstnAoCJdZl8sJQ+c+
         VwDxsWX3wu0tt5eIFezT68l3SxVMs3qWrmInG873gcDNDM3SLoXuCG44kG6bQWM+8oUV
         wIAK5oo98iRrFY2f9StBgUZothDdmv/2hodOBQWTife6X0ThCnamg+P/bQ7lDS5keHhd
         IFzp/BuIC8xnXvhM/DSsIHGAsmKvVR6AYfAPejiVXJNBRhbt962a2uTcsoz039xcvlvo
         K/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVQS9vyY5R5sBBR17dGE1jhPp2ntyD28zMI4BTCdw1UyEULyO4lkILdC0BtDcYtSJpEzpNhtZw8ALrGiL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VaE329wolMFyH2dG4ipfwrI+ym6U4BjNO7krUWe6x5H2fNBx
	730USXdE+6Ia+0+txx/wTSRvYQkhTroR7FnASoHWAxkd1qcnddifnII679k8zig4n6ve/qElUE0
	=
X-Gm-Gg: ASbGncuNABZ9TceQEMon1SMWeL6YSe4f/TEU0EKpVyHII9qxhYVQbN7DHE7CSfq8Z6y
	MLYU93Qmc934XBrQmlq+pI/fSbqXmiIQQJhMVqYgJMBW2lN7YQqRxFa8QIiyf10uJUb+gJmCokm
	c0tH0jaQr61dSkSomc+2pIpclhFXPXr48ZNtbjR/svMfsgSHJtRuTm+TMwkwL2k7exwifq4PQEX
	iv/wX/zZ+OiammHBYv4nsFQrbpHCQztPRVuXzC2AfIx8b1IMV4iFmaCpJ8usQSTzPI3voUw0UzH
	iuyFz9+efkBI50cqlWdNDUAYIUdSzeCMrGC35GWj
X-Google-Smtp-Source: AGHT+IHtyasg1PY+dWv82Tx3oLvGNB5rgnrxkjELFD38XpCHt8wN8rT0V6Wq89ygKYgaphfBMh3T1g==
X-Received: by 2002:a17:902:f70f:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22de7022ec2mr33292685ad.46.1745915387470;
        Tue, 29 Apr 2025 01:29:47 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c13sm96762425ad.162.2025.04.29.01.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:29:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:29:34 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Kexin Wei <ys.weikexin@h3c.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] block: remove test of io priority level
Message-ID: <20250429082934.GA3896701@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ever since commit eca2040972b4("scsi: block: ioprio: Clean up interface
definition"), the io priority level is masked and can no longer be larger
than IOPRIO_NR_LEVELS so remove this now useless test.

The actual test of io prio level is done in ioprio_value() where any
invalid input of class/level/hint will result in an invalid class being
passed to the syscall, this is introduced in commit 01584c1e2337("scsi: 
block: Improve ioprio value validity checks").

Reported-by: Kexin Wei <ys.weikexin@h3c.com>
Cc: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
Kexin reported a LTP/ioprio_set03 case failure, where the test would
pass IOPRIO_CLASS_BE with priority level 8 and see if kernel would
return error. Turned out she is using an old kernel header where the
change introduced in commit 01584c1e2337("scsi: block: Improve ioprio
value validity checks") isn't available. During troubleshooting, I find
this priority level test confusing and misleading so I think it should
be removed.

 block/ioprio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/ioprio.c b/block/ioprio.c
index 73301a261429f..60364d3faf800 100644
--- a/block/ioprio.c
+++ b/block/ioprio.c
@@ -46,11 +46,8 @@ int ioprio_check_cap(int ioprio)
 			 */
 			if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_NICE))
 				return -EPERM;
-			fallthrough;
-			/* rt has prio field too */
+			break;
 		case IOPRIO_CLASS_BE:
-			if (level >= IOPRIO_NR_LEVELS)
-				return -EINVAL;
 			break;
 		case IOPRIO_CLASS_IDLE:
 			break;
-- 
2.39.5

