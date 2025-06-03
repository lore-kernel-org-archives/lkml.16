Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D21A00F0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988929; cv=none; b=O7JyoTrGLIe85pu6LgH09Vi7LqopIyRbbP6nyhCveECgi/jHd1RH8daDlK4lA4yL3GeN0EO+AldH/ENnSWgkFsabFUYEoBlsqiB9fFjMJ1gq5Ut9TfrYvvk9KQ7M6S/Z7Y7k9GR0ET4IYBZ8wjWLpbk5C6SJ/kVsijgGVZK47yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988929; c=relaxed/simple;
	bh=Mhu5UgsGKVBtr694zPgKzOcZMIqd8uhkAolGEdGjAxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nrHov+/ErjhDtGbc7rnixb1fo85aKpgqrQkjlrexE7N/cOxR6Sz8o2v7V0IaSuYWy1CAIo7GfM9m+dNg4weOE+zBY6vZMMEwO1niu2rQARGzXJC2xyfr6T1zPIbJQXNpxvkL6zW6K1cheUmrWmoSFWpP/eHMuePlJr0EwP9UW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=u4dmPpXI; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="u4dmPpXI"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553L6OgD016387
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 18:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps01;
 bh=pR5/XontXtxtAuJG6F7B70YU8ZyR64gw9geu5D2VmVw=;
 b=u4dmPpXIIMS133fFgojn5PBhvFIVLpvbaURdXnQd6TGtBsW8Vx9r4H2Y8307ukB8ehF7
 OAzWB3LLvxfrKVjw6XQRK7NjkeG6ucOFIQhgIcjUTIPy7AzxjpfBmo85VmEFBp01XOR6
 zM5eE3KlQx0lISUODrN4pg3JiDK6EHmujL1TdgSWHVqHOT7s9+CGYhOoEugpb+4BxHBs
 ko89rPM0+gxL89jDS+R2/9uw5QWN/PNvlMAxMeRDoyUVj45bfoeyKsZ9ELcCl+9cHIeN
 cp6A9AgQR8bltwiCVN7HgPpJ3OI6mZp/o6cT1DGMxL0zMiNs2fiox3XSVl6TbsgLPFyh yw== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 46yxqt8vdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:15:26 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a44e392584so87567291cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988904; x=1749593704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pR5/XontXtxtAuJG6F7B70YU8ZyR64gw9geu5D2VmVw=;
        b=BFHjChvJJC888fOCv2R19+YTdUcvrP9bU/gCubJhe4vXyrwpFbfRhLXuN7+KX3uj0S
         D5cRqXt+RFLfp64HyCM24eR550MzZbE599JkyswcnCw7gQ5tNZw1Zm91rl/Qe1x7tWni
         A572SwHuJ8aFQxFq1CP2fxmQ8Ahd+UEKCeuSM95Uc4N7nchxr40S/2kH8HVrVI1PMJRm
         qRG68syMKbFPa/9/yEgRtpFfe+KVvq1EKPjMU1Zx90dXDdD18rz+sK84LUz/3bgQ954Q
         8MNPyuh+uWkC1MOcGWTaDW3GopkuXsZAjL9tr69gfEHJ9vZ8+XpsgryR5ajPBLC+oOmb
         uQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCVopa//L/6CC+nQukBt+NknxSWl0vpqGWBOHzJ6ckyb4mT2p37yNfxFlMej1LBcmPBEJGF28lxChkRGdHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iJ5intPs9Q7STlK959OQQQgrFQdhme/ENNac0+O5nLCrkhAY
	zx/ilMqca+g/D7ZdyeqUkOmucW6k0YnFQdQ7VDlzum5sqdrlXWd9aZXyzHyGH9lug5rEW4TFYvK
	vx6gQQmM1cVf40A1HOm5Tj1iVFnUbNb+yvWOYfeyOsHuJ4V5s51JkJSKt3p5Ykg==
X-Gm-Gg: ASbGncuVuxSG//WRHy6ncQDfmIm8XAuHKTdvJDhQqe1khEtvkr+i83xZw94YdyMoB3l
	KP2opQ5op1ewFizXzIRqQtu1tygl4DADsvbxogdmB28Ev6Fqhk7uKh7AY/EEG2oHdBL4Zs5eLdq
	xPJzZKraoonRpRj9jFY0WU3Bz2DddjKHsiD+WULZIl2u8rNua+h1xTtDn2C5LUSj6aGVXb/gMmq
	Z/LFmX3MVEz6f9a69+uO0MJIG34HlTrRRIjCh9QeFbIUBRXgFwOIcgxKK3JehwSm8hVVvKAlATn
	O87XujmuWzgy4p6GtHayHJbbhQCzeRaWnq8mn/yNGA8tJqFrhRE5ye5VcQ==
X-Received: by 2002:a05:622a:4184:b0:494:993d:ec30 with SMTP id d75a77b69052e-4a5a57f0bcdmr10800291cf.16.1748988903724;
        Tue, 03 Jun 2025 15:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxNXrwYeZso4epO+Rxc5EeKdK7iBln5yFli1M2Ii71UtbPVNvQj17eNdr9KOBrhoWgtfOe+A==
X-Received: by 2002:a05:622a:4184:b0:494:993d:ec30 with SMTP id d75a77b69052e-4a5a57f0bcdmr10799791cf.16.1748988903278;
        Tue, 03 Jun 2025 15:15:03 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-95.net.columbia.edu. [128.59.176.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a5919064dbsm33085741cf.53.2025.06.03.15.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:15:02 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/3] mm: userfaultfd: assorted fixes and cleanups
Date: Tue, 03 Jun 2025 18:14:19 -0400
Message-Id: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALtzP2gC/x2LQQqAIBAAvyJ7TnA1O/SV6FC51l4slCIQ/97Sc
 ZiZCoUyU4FRVcj0cOEzCWCnYDuWtJPmIAzWWG+8Q33HGHTkl4rG3jqHK3oaHMhwZfqF9NPc2gc
 VvqtFXAAAAA==
X-Change-ID: 20250531-uffd-fixes-142331b15e63
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748988902; l=861;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Mhu5UgsGKVBtr694zPgKzOcZMIqd8uhkAolGEdGjAxM=;
 b=4q8yWH3RUQtdW6CPPg1ymoUjwCjvIh7v83CMiLiZGVa2qENAAcH/07MkUGP97IU1TtObvFyjV
 YN5DzKGNRbWCpE2mOJNC05z6Ya0oPs1o89uhFUs+wuVkFsiZHUJCoyT
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: t9uCSLIdRRJZyS3R3zzLAK9tfgGSpkDE
X-Proofpoint-ORIG-GUID: t9uCSLIdRRJZyS3R3zzLAK9tfgGSpkDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE5MyBTYWx0ZWRfX6kESaGLNa61h LtnftGW3Sn0YesKg2w86+om/qhnrkbBaly43XPxvx3pyswiMeU/ac+lYJXzZcQa79vAmL7uKQjr 7Qiw1XOhwiCqx2MWH1BgJdZOzYod2BUIC1ZBPIZ+jjrL/f9CF5Lq2T6Z51Yu08xYjz3ZC0gNSgK
 Ii5od1Mq+Gntcb71oxB52debYLzGx//wFJSHLV7UjgO0BqcFxdHTkgturU8avh8K53XsOO4JuEV 1z+1d9nxJvjpqfMb8DjR0+s71BAvBfNyc46lXSu4HghSMoJVJqMVGBisDCA7lvbf4pSycg61H3C 8B8tJcFfKtrPdtO93VuwCBk3KoPW5Ms8XSNjLVWXFCOlVs2dd+6K0S/opQhMQAYd9pEFaKmjM37 FPVJdv9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=10 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=439
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030193

Two fixes and one cleanup for userfaultfd.

The second patch is a more of an RFC, as it changes previously allowed
user behavior. However, being able to unregister memory through a uffd
different from the uffd it was originally registered with seems odd enough
that I'd argue it's a bug :)

---
Tal Zussman (3):
      userfaultfd: correctly prevent registering VM_DROPPABLE regions
      userfaultfd: prevent unregistering VMAs through a different userfaultfd
      userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK, and UFFD_FLAGS_SET

 fs/userfaultfd.c              | 17 +++++++++++++----
 include/linux/userfaultfd_k.h |  6 +-----
 2 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
change-id: 20250531-uffd-fixes-142331b15e63

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

