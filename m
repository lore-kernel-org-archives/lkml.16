Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E48221D92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748990151; cv=none; b=XIrfOqXlWXP+opCfJH5VXW7jyUC0bDjb7hD83Fiu7u0FuRrqVXDQ2Qlzu3/V1mE+IWmq//ahBiZhaJSVHaVu+E26NWKPApZ7II3zFNQLIgjJqN8X0te5TmLb3AFZqWkOAtL/+mXE/KKjdKyss/wlerquE6B95XmMPBIlwbq7NWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748990151; c=relaxed/simple;
	bh=37Yhqy8AU4wbTPIPEN/cYvBNg1+kOJHWPvbBST22r2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrWHucus1PM2D67E+zqYPAO59EptEbh+4us+XqEFafyVzJKTJlmfrcXkPsERHL8JPDLLOth5RwjZ7nDrs45uIaBIGXRjHK+3HcVUtl/c3L+yjtGMNIv2nYlahyXMU8dRDn37p8VQUYV1Sh8Sp/X8mY+uqNB9f1d0h9Byedm8RjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Jv+6vYCt; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Jv+6vYCt"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553LAsxx025645
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 18:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=bg24Q9e8jtah/xAc16ck8SlLx6Biq7CXknAdWAqxD5E=;
 b=Jv+6vYCtH1vIb9muE4Lvzej/sas2AFv3Cdwkj/GjTqqJjHlkyONBXnQDUHbzoawoaRxI
 6RCo9rJ0YkpD9LVB2u8VMUiAUsaS8nu25GMCtMtpUirPXMHzd4PKLVPxZ0JG1DrApnvw
 ypYLxFs5rCwMnM+s2LSJGVnUvcO4ybERM9j6S7A3SM6ieRzJfxcbOdmLbMfipo3dLzBa
 VtHfI1kGHi++3OIEbX3DxU/+Ugh6+lT+/PVgVWKSdC+V+4vZVm2x7o+lCnaS6JiqVv0+
 thlRq3LN2FQU6WojkTIrgpII0vrqMYivQiyaNPEplaWZpBHdDpfhh9MGgQtw9rZPbArt KA== 
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 46yv20rxpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:15:24 -0400
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a42d650185so73634071cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988905; x=1749593705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bg24Q9e8jtah/xAc16ck8SlLx6Biq7CXknAdWAqxD5E=;
        b=K+lZllKXH2pzYsp/yJBFlaDuPAEkpz+4YEhx839E4QuFhBJctyX959+B4RyU1sRr5A
         xPrV0fh2rO6KRqPIyBLqxowf0U440U+WY7QPiKE5emhfcGagyhhGHvDdOJe6eJ+cTCdY
         lOulDmoh3QySMJBv5BDXQQhuouRU3zq8OyXb9nGLGLXCrDJD7y4XQVDDMPl1EAsoN4cq
         S+gyaY8sjX/mHf20LBr7n+ZI36nNM4dJ7T/R2BA9CkPh/ipEdVHugV5/4ey4armoGp1a
         VD27kvOzxXPJRW4mjgQw7tcvCZT7ojudCcZ8SxD6noEZ7c6bIfc/LXUyTodwAmuSRbt/
         HqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR1ZsATXrYhSYFahEqKo4hOcHYyuaLR4GbCfRz0CJyZ31GKcIHzun1EOpjwvPt8+Y/OQQRq8Z5hSrx8O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWQoBZmDHDuqewKw9W9b0XNTUgEJ6THoEzvSP38spfbVjy4xa
	Yv7vlKEBqxzijJqBAl6pQcbPuKFHqoZShMRlN7Dgrhe8lDU3p8yuArQOla9VStKh6wr8wrRtg5j
	vaEUJyJoNnhao+vqgmDTaFXUgFhCMI+Rbprq2eZQDkOu7DNHB1Zd9eLsfY3S6Cw==
X-Gm-Gg: ASbGncsDQrCOmosWdOMPcxn5TUxHDm+TNjK2jKU1+0yKQVxBnEpNxJu5wjPme+dw/43
	oWDzkeG5zeHs7dhGwqD87iWj5H9BTwf1IV3n4Vp5P/pfWHxteBa10tOaDR87DbtBVDWV36It4JH
	OuAKGg04e3XNl4GCvZGsozuVpunZAmmBG8xv9MJtHLvBLwGGxZKeB0EBSCclsyLf26urBb61QWa
	zrCLJn97CDV4JzXhj7rLF/624Ku4lIlbLMsV4dROIAAjHNkwiFRspyxOdKWw7yzm2A01CtdRNda
	vySbSiUT3zrG6pIqk4wKF04hWYIuTvH1ebxWhS3jidHStar4NrRu7d9hy7Xd+KvVLeVb
X-Received: by 2002:a05:622a:5c9a:b0:4a4:3414:3f79 with SMTP id d75a77b69052e-4a5a5759bbemr12581151cf.13.1748988904798;
        Tue, 03 Jun 2025 15:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEzoQH0sZBSRBHSaxiM1Ih0R6jzNTzEVjvBDvtQBBl6VqSZjQ1HlVesCPRbevn0B99owMG5Q==
X-Received: by 2002:a05:622a:5c9a:b0:4a4:3414:3f79 with SMTP id d75a77b69052e-4a5a5759bbemr12580311cf.13.1748988904139;
        Tue, 03 Jun 2025 15:15:04 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-95.net.columbia.edu. [128.59.176.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a5919064dbsm33085741cf.53.2025.06.03.15.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:15:03 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Jun 2025 18:14:20 -0400
Subject: [PATCH 1/3] userfaultfd: correctly prevent registering
 VM_DROPPABLE regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-uffd-fixes-v1-1-9c638c73f047@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748988902; l=1136;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=37Yhqy8AU4wbTPIPEN/cYvBNg1+kOJHWPvbBST22r2A=;
 b=1POmKOKsf0VyIS7OUyi5fS+1vuMjG1lwHk/1r/s7Bsd3ipsKiWh0nDa3vFHMa3L6VFfXSZnr0
 W8emj/MDZjPArf1SvuAY/CYJ6S30Ab1/x0gnYzXMV5ycQo2rlyY4eDt
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE5MyBTYWx0ZWRfX+/nh6XgI1JXS B8npfu+k9SXm+4XIXnan6VgD1uCS1+2rxsajpBZomS5+FSV10aVkDmQksBAFmslAmpiyUrAbCUU NHdxwrSmOVrS4ZwSMv+t4K+qKJk/EbVk6Kh/ALntJPCfjGzuWpvWS1eK9TGUK/Ak8x2Tfgo56wW
 tIQeDljp/NqqEDSJxa9B/0fU3qHUWcbvVG+mPkmR2YlogdC/W/+FE5/cuKDmvd0UYGQjM6OtFUY f59vdGdS9Yrb54sqpKOqHcSbw/2VB8bxawFCpQmaaC3nwH67qr8PKwio/0zoUF4mhItwUuXkKou BvcUa7REwb2zLp6+ZsH+QV95UBUUYsFrdQ+GKWD3FVBxcdOs24me4UYelO9+VebIx1VlWSwdG5J xpD23DMT
X-Proofpoint-GUID: VRedU-eOvAI-Rv2UJfYFKfRTv-tRGbk0
X-Proofpoint-ORIG-GUID: VRedU-eOvAI-Rv2UJfYFKfRTv-tRGbk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=908
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=10 spamscore=0
 bulkscore=10 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030193

vma_can_userfault() masks off non-userfaultfd VM flags from vm_flags.
The vm_flags & VM_DROPPABLE test will then always be false, incorrectly
allowing VM_DROPPABLE regions to be registered with userfaultfd.

Additionally, vm_flags is not guaranteed to correspond to the actual
VMA's flags. Fix this test by checking the VMA's flags directly.

Link: https://lore.kernel.org/linux-mm/5a875a3a-2243-4eab-856f-bc53ccfec3ea@redhat.com/
Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/userfaultfd_k.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 75342022d144..f3b3d2c9dd5e 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -218,7 +218,7 @@ static inline bool vma_can_userfault(struct vm_area_struct *vma,
 {
 	vm_flags &= __VM_UFFD_FLAGS;
 
-	if (vm_flags & VM_DROPPABLE)
+	if (vma->vm_flags & VM_DROPPABLE)
 		return false;
 
 	if ((vm_flags & VM_UFFD_MINOR) &&

-- 
2.39.5

