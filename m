Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91312A177
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382724; cv=none; b=dKhDmaiUNjNKTO1xOp+EHfkKOAPrmXrU6Jx5MvdOmnfZMOwiN8/MiiPpHY8U3q2m5CPYR8WoE5yzjFSvEheXjGqWP5b0lXWY0Qc/2Yr2BBUz3/k0me4F2dlbnjBldfY6BCeBeZd+09oZ0HRtFSM481yDFbDekUO0cMsPRs7wJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382724; c=relaxed/simple;
	bh=EP9W1OmB+wcjXQYUgIL2fq+FEVkI22zf392uYjNc/Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7JO7INtIvFuUIOojIEQuVe5QUkn0bGNONOhQEYoiAYb1X9970a92CLTFvgRoDFc3gbD04zcFhmdOo4W843kW7VtG6xZtSCZcz759jxd8WxL6SB4PKpZv6owVHFURCBmXUHws3VuoZgxO99vBuPe9jnQFofKziOTUMnlpVQAG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=b3DP1ef0; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="b3DP1ef0"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JLOqdS014414
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=y1DbwL1SG9nqQt6rgisMJIz4Tza+3QMR1zphzABvsLI=;
 b=b3DP1ef0ovPOnRNKCRG6SoL/WKc8apVbD69DjCrOT1sKDWfiKnlKsdrSy15K1J6h9SBb
 rlbQmR2U5e5jWz2wWyc5pIH6UIzQbI8fjaJoAoAtyMTbAj2qvGxTvhnEJYmJ1UbyTCfs
 XaCyPry8N6NaPpHtcDSXR6T8cXLjDC9ys5hidB5oSYU/hGEEqXGmonhRdDPmA/MTVq2G
 hAMmzDck/158YxVKophyvUhtaLp1x+k7SJQrXhe0d56Y2CRuawSGcpw7+4ApGutRxOsh
 tEQrq2iP+qRBf+ute9KIfZ9kwVi8+qwNH4WJLCQOKAnKrCfSeB624CirQhmE9K9YqP/P 0w== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 479p7pqsdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:21 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a44c8e11efso37178641cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382694; x=1750987494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1DbwL1SG9nqQt6rgisMJIz4Tza+3QMR1zphzABvsLI=;
        b=jJG2BBv6ZSmXiASELbTICagVKZOHsbdTnI2WwKvL7aTULgMlmI0bem4thKjL3pgKXX
         2gb3rBEJjNEns1aS+aXEDkJSfNroMYMcpV0V+akR/d3gp8wZDLHjPkVSz/KNsZQBsFeG
         e3GUK5SeDSl4qmjdSHj83oFknnNCKIq3iWzdqJtvuGW8LYo5QabsWj0Vsq6rxIdtWMkT
         8ttqMfPIuxJOtF771L/ufN8dlxSRC+wSgZBU1iOGj+JCLYwyKBc7k4/Q7RQBW4MzsZmK
         /zBy5YfwmSitpDK94h5PHgeQSFNTmZ7zR2B/1w5LVm84fuKjX7Zf/1skvLCwHE5hQHRq
         mawA==
X-Forwarded-Encrypted: i=1; AJvYcCXIe71KXAK87dZRlNESqsnG8bBumLcQ6UlQnqnuIisBNqLzbFPSuft8OTMrxylWrD4NlFF7I9tBmk4ZzCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zFBNFrdIfnjXgNRaAy4pTWsW1ZaDfDucaANISsfpgnMK6QT2
	R/VQy5mJy1Rm5909Mx/0IdR3nITAq75Q7tI2L754Ym78XJOpR1aK2c/9Rzv6e/DtR8GVIi6a3oT
	qS3HfDRVsiz67Rcpnk4zYhLNucayKXt2sLC80K6S2HrAscw2bLtb+60sTplKItA==
X-Gm-Gg: ASbGncvjwnBeRYSjA8+EyU2fyg7ucK933oXsxHVHpDx29HDCGQCNplgJm19PkodOv75
	eHgJ1rGeQ2P2sY072Zs5Q4VjoS8u+N3OayHwBuqdvRdn7Rumyiy/NeVwgqz0U1l5aJasovTHEte
	XJFog/dBevRFx4QvW/oFlKGFfIWp/f5kCsyEuiJ3b/hnIfIJWVPreAF6MvoYLIYpynvA8KyVBdx
	B/OEqq3D6RD27wMe8dsjIbyLh/OBMzLMX7CjHqCc924sHYddiBG9nMbjdzhommSH3589z36iu2b
	7Vu+or0y6/djGHKB9WDJpfZ6rS2HSooyWO8NR4U5QnPM5kG0YTLSKrV7BBhRDavjxzOu
X-Received: by 2002:a05:622a:134b:b0:4a4:2ffb:5482 with SMTP id d75a77b69052e-4a77a2cc1a2mr18298001cf.38.1750382694500;
        Thu, 19 Jun 2025 18:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdvZEXi3Vbfe/ihSwyAC6bOFZTIRmYu8oCTMk4/J2B2hDJEgqywAAZZz5rCDXLHlNnuSS/tA==
X-Received: by 2002:a05:622a:134b:b0:4a4:2ffb:5482 with SMTP id d75a77b69052e-4a77a2cc1a2mr18297771cf.38.1750382694086;
        Thu, 19 Jun 2025 18:24:54 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79c12sm3794321cf.53.2025.06.19.18.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 18:24:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 19 Jun 2025 21:24:26 -0400
Subject: [PATCH v3 4/4] userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK,
 and UFFD_FLAGS_SET
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-uffd-fixes-v3-4-a7274d3bd5e4@columbia.edu>
References: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
In-Reply-To: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750382688; l=1546;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=EP9W1OmB+wcjXQYUgIL2fq+FEVkI22zf392uYjNc/Kw=;
 b=4m0MC8lpRu7JrFBUgKxSFn0CjaKQkdAzLnQAQrVX3RoGclBRGauwzPiHVkIISeEUPOieusAn7
 OZo32XipF0HBu7kDSe/Y3EbDpYR9WkGa6j1Q0UCU0Gc17bcAwqbVtH6
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwOSBTYWx0ZWRfX4YYkCVux9QIt ZrlmPAudgr3SHGZhm4ELG4X+g7PXr7Fz+NHWtZfXg6tNOUZTFEs4M2QO5RfMhqNgHonbWsNPaM/ /jhlCqLMkEx25XMGg/EdY5dQ3obtnK/cNTktmotOHaZZnEFFhacdegd/1L04l2oHL3dxhI1JgI/
 eY1Fhp+/eo4Qh1+1tM4cjh4Ecl1G5ZZjMSA6PKslvRXptGcDv1hzhuAIVJCj1LvSDT//DWol1eX 5RbvLCsb/wiSSvVFBvsapqJhNWi/WCs1Mtb+xxPaNlh0MWoji2l3xrfs2lCkdSKzyKefa5gYTPH Q+0MFdwySX+0gPQtbf5NmFpObqqj4MrhJq2b7sF035QWjR3CM/5a/j5HhJKz5ovt5WsvkfcsAPM FmgvQxZe
X-Proofpoint-GUID: sxBSniOmz1Gpu_Lhm5uBuVYH5AF8GWJS
X-Proofpoint-ORIG-GUID: sxBSniOmz1Gpu_Lhm5uBuVYH5AF8GWJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=10
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=10
 clxscore=1015 mlxlogscore=523 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2505160000 definitions=main-2506200009

UFFD_CLOEXEC, UFFD_NONBLOCK, and UFFD_FLAGS_SET have been unused since they
were added in commit 932b18e0aec6 ("userfaultfd: linux/userfaultfd_k.h").
Remove them and the associated BUILD_BUG_ON() checks.

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/userfaultfd.c              | 2 --
 include/linux/userfaultfd_k.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 771e81ea4ef6..a2928b0aec6f 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -2114,8 +2114,6 @@ static int new_userfaultfd(int flags)
 
 	/* Check the UFFD_* constants for consistency.  */
 	BUILD_BUG_ON(UFFD_USER_MODE_ONLY & UFFD_SHARED_FCNTL_FLAGS);
-	BUILD_BUG_ON(UFFD_CLOEXEC != O_CLOEXEC);
-	BUILD_BUG_ON(UFFD_NONBLOCK != O_NONBLOCK);
 
 	if (flags & ~(UFFD_SHARED_FCNTL_FLAGS | UFFD_USER_MODE_ONLY))
 		return -EINVAL;
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index f3b3d2c9dd5e..ccad58602846 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -30,11 +30,7 @@
  * from userfaultfd, in order to leave a free define-space for
  * shared O_* flags.
  */
-#define UFFD_CLOEXEC O_CLOEXEC
-#define UFFD_NONBLOCK O_NONBLOCK
-
 #define UFFD_SHARED_FCNTL_FLAGS (O_CLOEXEC | O_NONBLOCK)
-#define UFFD_FLAGS_SET (EFD_SHARED_FCNTL_FLAGS)
 
 /*
  * Start with fault_pending_wqh and fault_wqh so they're more likely

-- 
2.39.5

