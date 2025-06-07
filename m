Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4C241CB0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749278427; cv=none; b=N8luixYRJmmVxIvqvZF1vZuv1HngLocGjP8l9q/duQHHHCJHyNuzvOATpw8ReTKPmnl9mpDzQKvN+MrJWM28iduqhaBv2x8TSyiiiJghW+DWVj6Q4Fm149YUeZzAlxsjFLrMjVh6JrDwiEISptGfQQ6oQE2XB3PSIusr42nyRhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749278427; c=relaxed/simple;
	bh=BCiqmyiBck+kr/OASD2ROBkgeX+5AW3Pps9lr6jrizo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjQtsU6qRet3Y/S3LEEWEjlFUai9ltmWgyVSQyiEiXyNlLM4fCpROmEVEYhyVkJzyWfPgZUOJPCk3NrZdxbWmIJTYgpqSb6/EBWTAIG275XU1MqlqkLTrbAVecTaCzh15EkWPX/smk+KB7ul/VQ/qZg9uvUaxlkfiByX5Mok1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UJ23Ly3P; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UJ23Ly3P"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576FwxC008428
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 02:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=NCb2N0Fk92a1P9JTghKE8MY8Out64G9+V7YULXAPf30=;
 b=UJ23Ly3PeQAsrR9GxRQF+LR37pMg61M2pNRwZFHWN2ngpt1OnwDq+m0fnF1OXyjanmOq
 h1MaijbAfqApYu09GD66kyIxBrhGJ9/oFh9b/kExIpb5sHJua9hJAdMrYhQwIyp+gANG
 mTns6/G3b+UGWuGsKmprp2PGpIsWro8+gySO/Oy/Ec1VWVMy5/NfnO+vqi+GD6kEfbbM
 o+WUot4Bd8ArzATXdFsSqn8mwtie2Hk17V5Gr/Up/CVEnrzP1sGIhNPvz4f6+JRZQS/8
 3aw7a7cW68SLJ9jWBpeBOcZ5rb+677ic/l3sT1GnnI2Z96FJW2sRaDVJiGa2NVmHzG4M 3g== 
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 474efj08a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:40:24 -0400
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so3702050b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 23:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749278423; x=1749883223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCb2N0Fk92a1P9JTghKE8MY8Out64G9+V7YULXAPf30=;
        b=vSyTkh6E/2lNbewdk1aPEd2ZjPncbuG74GEWbXshB9ImP8BPM8cUgzLeNcYEOZqELQ
         iEGpN+7CXmw1JLczDK5syVxM9kO8uXFHg6wEQ2PLcpTE9sGsbPVFWbSWNwDUxf2eQgYv
         bErx4nVEZ1I2VEYZJqIy4NLyR1Mh96+o5sjpCtwDL4jd/BpanfNm4ouZF2r3S8T0+PmF
         EpE3bpVryPDQxCZKyLMSCi6gIfeUKDI+lSx3OPuJ81ek7aOffJNcxzCL1EqO2slgJ0TU
         j/7bFKXGBUWQnW5KmIKG6Q8znGG9iDio7DudeoGsqoABYI8fWlsPv1VNDtmJNarbGvaw
         IA9g==
X-Forwarded-Encrypted: i=1; AJvYcCVLPad84v9wDHOpfJ7XcLCu364ZiYRQ63dpqv306sfdgZsW7aboBgWIiyF8VJw2hRcMBRjGBEedaBx+37Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwCYd+Bvbx9tQyMQMmvdXDBwQDElUkW9ZaF0+Vgzh9uHhLY3v
	5icl00MG1J7laVNEXDL+LNksv3TpcuEzi2GOge1Sc57qoHhmBzC04re+oz7MyrESKvXy0FyQcTy
	7Cj2oiqsQGBsTD9+2+CKYtzvcO+TfD/mDiCAIlbA9WbniHW9gzXhI1PCg+7y1SF8sf68OUg==
X-Gm-Gg: ASbGncvMlwXZ/mdJY53weSBtjTki9usQPxlXb9gOm8kWLWigFqJV39+Wmg66VfjxXu6
	UTAJhAzogQvxw/3faPljCQk+jOXGO2heiRhJFB4ezW2Y7QvdJIIWIVQPMy1If6qqhN824c+ipAm
	mjOyNA6GKeGaOT46YIB77hNif24AWjkoIQEjAk1iVYgmTw8nMAoQmF2MaWPrN7yzNrUw2Gn3MTZ
	JXrruQ+9Gv6qSVqufUeNeepkFpEdihChG3qSzzwOHGEqiZm79SjPPmxATzRS64+L2Jr26rKEIHj
	wveX0+A/A5bLuJYdZYUZb2Qc2axT6maH1EKGSOPW2127HvY0m+MSPVPkOFT8fsLZfXlt
X-Received: by 2002:a05:6a00:1885:b0:746:3200:620 with SMTP id d2e1a72fcca58-74827e82607mr7274021b3a.9.1749278423047;
        Fri, 06 Jun 2025 23:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY98CY2YVyggGLeAbDV8ar/PXW0sOfH78h7Uor9zXD3xjSJRiEh9rmijJ2dx5XASHXOijwJw==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d22987fa6emr771839185a.17.1749278411587;
        Fri, 06 Jun 2025 23:40:11 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac95e5sm24461256d6.43.2025.06.06.23.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 23:40:11 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Jun 2025 02:40:03 -0400
Subject: [PATCH v2 4/4] userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK,
 and UFFD_FLAGS_SET
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-uffd-fixes-v2-4-339dafe9a2fe@columbia.edu>
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
In-Reply-To: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749278406; l=1546;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BCiqmyiBck+kr/OASD2ROBkgeX+5AW3Pps9lr6jrizo=;
 b=ejkjZoE1iwXmZVjGzc4EEQx+Dppi+NjcO9zdi6poqefulL2rmdjseAjaKNWamrHSbTvuzD+FU
 fLY2ZocKMooBdDYNZGuFJ7IfSw+VD6eiII8yG3hEK03A2qopBgdanbr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: tqVIK7IBCsQnnDrDB-DwaFE4mp-fomvT
X-Proofpoint-GUID: tqVIK7IBCsQnnDrDB-DwaFE4mp-fomvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NyBTYWx0ZWRfXz+6uoHchrR2P WvRGNs+ho65IdcHjqTUO2qC96SawnHwh2P8o+2XNjpVpR/cB6TDEFw4rI+FPBKULT8sDQbfgP1C KALNZ4ldI/DpW2tRqTJf1VTuZcR66Hyk1lihf6zyhmrCtNCAm6JrVhGMjl8HE26JCxyLH8j/Xj3
 U+f56HoFTsi5VeqS0/2KpADT7zHwjxu3nheQz4LLV6iQBg21tbgUIES8puvE+SIiPXLpkSr1SDY hxZhWil3Gwu8IsLmPO5TD/cEZUDrVeiak+yRO/ga5gNsXqGFEopCN/m1xafKqdr65u6q1d77Uzu Hen0oso8k8CIUprSwTjQTe/gVKo6lFfaw7cHz8U1WOmprDX+1MlcxJWhEo0xiE+Q36XoKJfZN3O A1GwRJc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=10 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=508 bulkscore=10
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070047

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
index 10e8037f5216..ef054b3154b2 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -2118,8 +2118,6 @@ static int new_userfaultfd(int flags)
 
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

