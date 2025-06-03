Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C31DF75D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748990223; cv=none; b=QkVd7dGChpqFYYAiXIGUCnGD/RrHmzQXzn1cVuEFaSkBPNPpPpex/1bxREUxSU8LSXDsEpEX2OekIK3doXiLtZ4/CF99KsrIQOljCZ29xyHYI7AZusk3cu5OaYZwTB7gdLe8otTU1z/nCTckkNXC3GvjCwW60K8F3TMfyq/dj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748990223; c=relaxed/simple;
	bh=6173djIpHY67AhiXkmcV2Ll4/Vt187imCK1efPD/7Ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krBWqTTIq4l94u1tCNk/PxeVzxF3NrxNlBVkbqhO+JzcEHt7ZFWtVL/NAlZW1f2I26PohnyxM68i2HSUEoyVBqa3dGaAhbEvv+KfTYxzgOxYfyjyPkSrJZfoPmc1dSRFQ/i2Vsy6VzX74Ozi271gBHhm5TBedRrwxth2rPZARY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hpRQPKI/; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hpRQPKI/"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553LAWHt016937
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 18:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=e3pRUkgAh0M+NosxUGiJVwkSepJnz0HXGJMPqHgMtIg=;
 b=hpRQPKI/stzykwj0Xw1FNjj6jqkUtRpSx0IsC9REneCnCMqLkZV+uzxWU70WWvD2oZM+
 cW/5JPBhw9omfekfmKxXMZE/Zk5cG6h2nah119uxbsZABTAMvV/3whUd7Qriobuc/C5V
 5ApFr0yCjIhJ/pmSKKSfQbiTAYkFxpO+Ag+nMGRxy2gAyxXLWWWVhziM0v5/E9vA7WRl
 BavMqEQ1oJt3WWLQ3sDhhO22aetov0m31E7ajdvDix/N5RDGVmt0vUr+q32tcB1acI78
 hpzgejCSbEH04DcCTiXu8x2jzqJ+G70svatGKRp2W6cARY1ZK/tjiseDbg8VoNbnv4tj 7w== 
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 471etgv2rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:15:23 -0400
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a448c036bfso85266551cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988905; x=1749593705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3pRUkgAh0M+NosxUGiJVwkSepJnz0HXGJMPqHgMtIg=;
        b=h+569AnxMdJyYfB/y+TAbS7RIysZ1TnKYkkT8/m21Q4mtCyILtG+9DmkoBULVvcNPG
         X/g17aUCl5f7sc8QyG+vaKm3YWPXnxGgcTFGsv5uiamKBp6s2VxZjQEvmwWqZ2v/VRyu
         9FuLqbKZcS1PWTtYXoQzGXbITHVnSoZ57DFMNAMpw1lZTn7FAvSxQuKz46i4wjP3QmW5
         SU9t8kGHFZ4lGLKUFK2NJJV5C/QG1fI2VzP/ve8crzE7H9uOW+PVNyruWnLbbiT1b8QX
         akV/TLqOeoKEE3asyXYX9eL0CZQ+cnRDyqMKTNXtetn1DUpGL+0VVtAyrfZSTGJHSznG
         9/sw==
X-Forwarded-Encrypted: i=1; AJvYcCV92IiUISEEY2uNCOdi+uvSSq+0MAU5JnohzfPYJvRtUyhxiQgaWrAuDezLYO/X61xR2BKKmw3eHlprIXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFHW1uezFb2Uptc5AyIIz6AxW7ok3rGQjuCOzEeeAkGtdUFJT
	8GNtGmG1SJw8tzC5lwZyqdnrRYJjkOTc1Q5gu6y2Re22ajfhV860GKPVlsTXOx3R9SYDyFexeD3
	J2mkSDPJV/FD0QQqUlIuvy93xmu6kLzDsJK103wUjZkh+/Jafoursk0jypyxtbg==
X-Gm-Gg: ASbGnctjX8o3+7isNGva66bl+Fh56deu8R3pdRxU5nkAYPDFzl2/KTGdfLaLqdSwItB
	gILzmzXTaaf3pQ096+b6g15pybMzZ0R4UIU9Jf+/SIdBxuhQ6PJpXXcsvSiRmvsh8xBi5/fP6CR
	CqyDfCKub6TvV5oLsSEYNAQgWHSdwWFUXeMan61lHS2pqvjUSqd7RvtGXjmVh3tduyJSEteGaGg
	piiviFXM4Zzi3tv7ejFnsEb+w2WtBeNVnfD8bLEy8OkrWP290ANz3WfyIrzwtfjJvXc0i4pitSr
	7B5VKlGoLlndtvcBva7UQEe9x5e9dWKeJaBjKGTePz0pGADi46pHaEuiWQ==
X-Received: by 2002:a05:622a:1e1a:b0:4a4:33b4:1b27 with SMTP id d75a77b69052e-4a5a5779217mr10447711cf.20.1748988905428;
        Tue, 03 Jun 2025 15:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEikFmrJJ/dqAk5juLthWKuprt/L7CUTwYwNjyF38/d/IpLrhGAlBMbPlvV4jfR+m7idIKeKw==
X-Received: by 2002:a05:622a:1e1a:b0:4a4:33b4:1b27 with SMTP id d75a77b69052e-4a5a5779217mr10447331cf.20.1748988904980;
        Tue, 03 Jun 2025 15:15:04 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-95.net.columbia.edu. [128.59.176.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a5919064dbsm33085741cf.53.2025.06.03.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:15:04 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Jun 2025 18:14:21 -0400
Subject: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
In-Reply-To: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Pavel Emelyanov <xemul@parallels.com>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748988902; l=1931;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=6173djIpHY67AhiXkmcV2Ll4/Vt187imCK1efPD/7Ig=;
 b=8T6QODEVbi/mmjgbGFVZw/+kv6elEEqujUq9MRPiKoJoVsE166mOElZRzmD6ONQRXFEo8XnjJ
 botepy2REz7D8IxaMBLxBbHhlpvV1GgeUlQ3cMmpb5UsMDK0c3QU9g4
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: eUMS04JadEkQuW7VMoCTIq3FFnPXZLU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE5MyBTYWx0ZWRfX9p7cN/dEBvR5 v+5rlJDo+Vf3Q8dve+Zsjtq2zN/itMHkQqz923odLbSOzp7Y6QrEHNgIAuycNLNHTMtYtXojE3K LM9dHdiwZcg8WQXIcTyjiv/8DYnAKSDVfevFOzRBYRfyZIToRR/u2B3BObOqvxL0hYw2/uXCUjt
 tGndvxqlefGk5WbVTsVCVe48z070zjwitw76U/H+bH2J0el35vGgPJJ7W06TYq6CGe3y+hRhGCD dLcXR2cKj6rfRz8GSeNNmq+2C7LV4N3kZwZN+X5cE/604RFmWcJhTIQvQzrBBL5kyn3QRUx3FMX DtZ6OVdnjZtySQkyWpOj27DOR7fgEtbE6lVHJ0oK+dcDerxTMg4INhwXkRi1+fZ8bHLw3mBKoUk ai6D44ra
X-Proofpoint-ORIG-GUID: eUMS04JadEkQuW7VMoCTIq3FFnPXZLU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=10 phishscore=0
 bulkscore=10 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=728 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030193

Currently, a VMA registered with a uffd can be unregistered through a
different uffd asssociated with the same mm_struct.

Change this behavior to be stricter by requiring VMAs to be unregistered
through the same uffd they were registered with.

While at it, correct the comment for the no userfaultfd case. This seems
to be a copy-paste artifact from the analagous userfaultfd_register()
check.

Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory externalization")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/userfaultfd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 22f4bf956ba1..9289e30b24c4 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1477,6 +1477,16 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
 			goto out_unlock;
 
+		/*
+		 * Check that this vma isn't already owned by a different
+		 * userfaultfd. This provides for more strict behavior by
+		 * preventing a VMA registered with a userfaultfd from being
+		 * unregistered through a different userfaultfd.
+		 */
+		if (cur->vm_userfaultfd_ctx.ctx &&
+		    cur->vm_userfaultfd_ctx.ctx != ctx)
+			goto out_unlock;
+
 		found = true;
 	} for_each_vma_range(vmi, cur, end);
 	BUG_ON(!found);
@@ -1491,10 +1501,11 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		cond_resched();
 
 		BUG_ON(!vma_can_userfault(vma, vma->vm_flags, wp_async));
+		BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
+		       vma->vm_userfaultfd_ctx.ctx != ctx);
 
 		/*
-		 * Nothing to do: this vma is already registered into this
-		 * userfaultfd and with the right tracking mode too.
+		 * Nothing to do: this vma is not registered with userfaultfd.
 		 */
 		if (!vma->vm_userfaultfd_ctx.ctx)
 			goto skip;

-- 
2.39.5

