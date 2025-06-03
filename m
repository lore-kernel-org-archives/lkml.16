Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0B19D8AC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988933; cv=none; b=c0QkBHebGh2/mOOmZD0XKAoScnRKonzRDJ//LP+trz5ttTLfbFKrNOphwLuW2Jf6kyTyxWMB/wqXCdJbTQqrQxeJFb58ct8GbQSzMfcIH6pIN7OdmFgBBK4SwXe2VFUkWECAbAEduoelYIM7qebh9Sc5ErUYHqJgM03F5w3hvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988933; c=relaxed/simple;
	bh=g27oyTD6/jrBAqdANGNVmDLwLJKx2ZUNNdLuTW4r2Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+1Eu6xT5U6GfXPTGlJbsVdTNsgdecwHJp1qood8s+Pc54T4U+/9s4rLKmj9CAl2TTfWcsyMQmHRd3tQnUMJPZMRzrMSMdiRhLn8Xb7RfVKKH2AgOM7gWO5R2mgm3zPXYXYSIwfCfAuPQTuRI+50xBw0eoyWxTstRwWLVN0DcWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ILYYPhNM; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ILYYPhNM"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553LApID028416
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 18:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=Lfp69DiYOeQKA1pcsNzgw4KPGHdSjVYUj1VSH3quNCM=;
 b=ILYYPhNMp9nd+ku4UA3Gik0QL3CXW5MM7ZS4qPGtIsMBAg2oyfYY6TvaseOOpfP6IYaq
 GLR1AtGDrP48EQ8LMzaKlvhxk/j+wFbAHWfiEE9NObS0vQCtD6qnRjKKd39ldsSVGDCa
 OxbGy1xKxClLMZSScE4BEgPgpRP22G+TYGc2dvAvZqF+XwxyX/tqQbteda/zrAOr66Lg
 QOMU+4UAHKI4Kpo8t1lQvp6aWBWw37iIbWZUsZvBMdk3/cGHNGhToPTkQHAwGsuFwANm
 2tBDOzS81w2hIlsUIZyEiAp7+33qEZGk0N6ubGbkzcSpVx/4GAPMTnM8X1dUY1Vt4buQ iA== 
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 46ywy0gy20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:15:30 -0400
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a58f455cdbso31354501cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988906; x=1749593706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfp69DiYOeQKA1pcsNzgw4KPGHdSjVYUj1VSH3quNCM=;
        b=cOwtSFtIO8WbHSk5iBC7dkh+YTZdXYqrMjmaCh3t7VnRzST3JdYFbl0D009fZgKK4H
         KJiPs3eye7BRig8UXfRMvd3vDJHVpI3GY/eQ9WNbOvKXVabOrB+cZ3VodFH28FQ2U5N3
         YQFRJdR+24vwHgOocY2/uR/blmhjgvUE43Y2tKxr+ysjVu1NvhX+2rATee3abFzc5YqB
         W7o/Soi8pr0T1mAkH7zC2TK2uMLtb8jG52tIYrm6RUrbep/bX7raCMOZCmcQXaZYu5FO
         6O+JaYqyySx2R1m1I1Pb/HK8wVdXhRQ192cBfa01dtidqakWdtr7vmDG4OfBAhsKcIPH
         vo8w==
X-Forwarded-Encrypted: i=1; AJvYcCVOAFcQw5soZ1v9M+TY3+pPHwtfjFTO/IsWrDQhUHpZFYEMzWbTRp++4kfNGwL8eA5Lz5SUNmFNMui9igk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQfp5DpDPkpu9VCVC8NfLBDBHZ1DlIYRQYf1iQIKibziJDx07
	Qc5p++w3jI5FB1oFIaOTf055LlWEpMaQ7BZK/7pD/NRSnX8qJX+90Ayrxoy2tuKvLNG7tMbTOIt
	0Este0OrhTEMYpUapR5/08mw6MgWb8WiUJbUPppSpeJTq3XyRW3WgBlkIS2X1ZQ==
X-Gm-Gg: ASbGncushgnf0FgLhkkhS08k1UKIA/qFSMnAx3M69kM7gLOUFy+cuZAou8UhOsnp+7J
	iaG1P+UIul69v0vTK7XKTbzwpj73C073EGYEAnbJnib34Up/zFCBo0HLMex77hyqwS71FgWwC+V
	gu3Eh1wTxmkS2Yek4yHwZFDQBrbq6zLmbxwU6oGDgBPyjJeR3mQG/7a5Qc1MvOWSGMAM0LMtUbY
	8H+XUJdVt7+oqQj1kN1KN/PxBFwzvc+iBBEMLO8F5ZiO/Qy8x5GFdDIJfbShoy+8x5UTYLmKs6N
	vzMmPBZnPgb8QrPhRN7qEYG1DmPBYUZ419ugMs8It+54Jl/ROYSx31HZAw==
X-Received: by 2002:a05:622a:4819:b0:494:b914:d140 with SMTP id d75a77b69052e-4a5a57f0ef2mr8844671cf.43.1748988906186;
        Tue, 03 Jun 2025 15:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3r+PJxJ7QkVzaMR5o9MP2GSalSCVTrXWtLu6GU0AT2AKuvSzgDe0WZeGkRGDRbidaKgnbkQ==
X-Received: by 2002:a05:622a:4819:b0:494:b914:d140 with SMTP id d75a77b69052e-4a5a57f0ef2mr8844291cf.43.1748988905724;
        Tue, 03 Jun 2025 15:15:05 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-95.net.columbia.edu. [128.59.176.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a5919064dbsm33085741cf.53.2025.06.03.15.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:15:05 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Jun 2025 18:14:22 -0400
Subject: [PATCH 3/3] userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK, and
 UFFD_FLAGS_SET
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-uffd-fixes-v1-3-9c638c73f047@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748988902; l=1458;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=g27oyTD6/jrBAqdANGNVmDLwLJKx2ZUNNdLuTW4r2Xc=;
 b=/XIMrYtbF5Y68qcMiwHj35HHywny0Un8ee+I0CUXo50KzxtW2KYaTD4j2taaBviXzq47kEjjp
 v0QqS3mP22GAE07Teo5dLuKCi931LxkSWAeIzPAUiVFzfkda3ZYvYQR
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE5MyBTYWx0ZWRfX9vEyWNg3F9Bf nv6IvZLbZ8/Prt7T7c/BD0wmkqHoxbC5AywVBO80zDp0ST06xgXJf3UrDYZR5aVMfUi3hY/+L93 5HFIbgWgap2yGuaOyk7EzRHZE90CkdmHlrhfMlAe9EdEB61Os9P5arvzUY3QYXPyD35G5SNHEx8
 4RtOSa9H4UotbJufh9nj1+UNWmQazCBay5onBJPtbwDY4ftO8u84KmixHlnyt83N0xnd5lobhjA lz3HGMhFSIB8s4VH/mgEZeHr1l8mjXaKh2WWA75KEsx30qu+HgmjG8SRg847Z3gdTOXkolAoyZp gp9PwTihEzyJL40FpJ/Ex6MvweMFg5WUJXahmsv9VBuYtJtw070RRepaGlsj9veDNghCVfJFZBu gbpHikri
X-Proofpoint-GUID: fbQ9TsYKOfCCcrbZ6nKiJDQypkjOsBQ6
X-Proofpoint-ORIG-GUID: fbQ9TsYKOfCCcrbZ6nKiJDQypkjOsBQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=10 suspectscore=0 mlxlogscore=468 clxscore=1015 spamscore=0
 mlxscore=0 lowpriorityscore=10 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030193

UFFD_CLOEXEC, UFFD_NONBLOCK, and UFFD_FLAGS_SET have been unused since they
were added in commit 932b18e0aec6 ("userfaultfd: linux/userfaultfd_k.h").
Remove them and the associated BUILD_BUG_ON() checks.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/userfaultfd.c              | 2 --
 include/linux/userfaultfd_k.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 9289e30b24c4..00c6662ed9a5 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -2121,8 +2121,6 @@ static int new_userfaultfd(int flags)
 
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

