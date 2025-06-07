Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A71CF7AF
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749280165; cv=none; b=KkRqcjqJkLBZik12d+q3YOu8vwDZsmwMksETmbz1c9WTo5f2VQ6T61HeGAMlp+FaNHqy88Nk8mEdMWhGfEjnboYCwluKDrOttwWrTTqlZrNdmBiRAQrO8razJ+7w+kV/9yHqHgFQGrmnMCvkmAiOV25GlM1WbAbdmrnqN+BaszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749280165; c=relaxed/simple;
	bh=mhLto2qWPPXbTI4doOngzdXYLr3HbKBvzuotTiFjvmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cR6n5ZZ5y6pAP6lLqHy1gyVY6xvgDlRdgdtmmApizIJznCX+Ry1lYNn6Xxgr8D7tiUzEDuq1N23LkSHq0M1/U8br46WweguzcqHi2kRmJh9Rvpwkvo/j9S747Jm4OJNVhFVzmLrymoJ/2qyuon9IDkO6tymClw0bgjRNxcTZ9Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DvzOTVF+; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DvzOTVF+"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576GUbV005868
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 03:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps01;
 bh=z/krpcC5+Q8k+YXt8s+yCpztxjJjdN6J7MqhMLLd7Ic=;
 b=DvzOTVF+x70NlsJlBRdHh/QIJv8huEMULJpHKYe2rRiT3Avf5qSjXH7swZc153GqwnYx
 MWo6DqD0/L7XbsIedV/EKwh+3g6Gk8jcqySTPapkR7UvLqh5bQ1JSEeYBgF+GnU3cQ6o
 mJQxj6+EGeRZcKHLJd5ZoLCqda13vvoaSP8MLHT0Dbzz8ixK5Vi9+2noWzOQJXPwQbA0
 fQZ2/M8ai9u/cWUFIFd9lHvzkc6rR0VYsJEuubM0pCiLu06Ywi101RIlun0CxjPlJ3kl
 GENI5tMBXROsa9wLdShPcG74zFT7XWLTAjp6Gqx7MseojQlhIDMaRpBUHLjiXl7uo80n fg== 
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 474fq104mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 03:09:23 -0400
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a582e95cf0so25460431cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 00:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749280162; x=1749884962;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/krpcC5+Q8k+YXt8s+yCpztxjJjdN6J7MqhMLLd7Ic=;
        b=boI+1SukQlzX/f7WoSukx7lpn7tmrRpyNn/RV6wmFaG9FvVN5E4bS3Lml1jXEXoAfP
         wtEQZ3u3fOD1/UTIi1HPlkT1DZXDGj02Xvy3QuhBRXE3xqPo/FEeTdta7RZDC4DWEAqn
         5u01H3KXJFRpT6BwBzyZnhCORErjFNHQJv8/wgzppw85VLLOfYS2BqFblXENRYAxJk3h
         vklC3l4L07iIuWs0z9C0W9Q0cXemdgfKk2yaPZxcVDrBfZXNzlYdK7GYXRaKgVbAzfXt
         s7+yLV411bXAogDaxkq+dftiTcphEuRiKHjj4Cdm6PqhZ4L3JvvUI3Su8ZmNN/jTPJHc
         +sTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEUjj2F1kBfQj/cuRAe45i1JF2+BU4sbl2ujiOGHH0BIP7e97Cx9yV0f+JnnJsjbittVhdb/Dy7dxDFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58jA7rhzdrdzcSkLJQjOrLm0qf6B00900NM0wLXgxrWNYuJxv
	56RmcWgfu36iJr9qV9bacIYeMo+y5c2HFgx9er1iMcRa3mfda+Y5sPzWBpqrfg/vs9b65bjGGdc
	7LoXX5QzG7FYHurOb7uCNWVRYKr1XBgS5udp7kdYOu+Cb7j19rEcUIRyJfpV9NQ==
X-Gm-Gg: ASbGnctAZ0z5qPLAWhH0rIwQz2l6eAWKfmVN1x1vSSH70tnR6w7i2jdiBj2m2CT8X4S
	m5lLkLcdQWSLEobFOW89DInjjLS1ed+sTHNyO01FszMqr0C/fZqkdGmPcpaQSSRlM/JJ9rUN6ky
	/OJMjacQdVwpOSkrxTCL3Am8hs5PtD89Dt1ja8IScqt0uxB3r/CjUQyFU/9iHU44am+fjiNZOVD
	quI2nIQGxDlfCZrXXTi0v1ToXRZBcLck5R/bfLsuktq48rZTqatdr0+8cluWZPQnadSysBPJfLp
	jdbFCAB57k42j4eKScqq9urBi9ytT4ULkVnsGbCbuW35rJYAXM7g7amgyfstomOK+Lls
X-Received: by 2002:a05:622a:4a8f:b0:4a3:be83:d6b0 with SMTP id d75a77b69052e-4a5b9a052dfmr119047751cf.5.1749280162140;
        Sat, 07 Jun 2025 00:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYVW7VoORAiaelziMMTIvFym2LcQn3e6X1vw+8iYUJxJbzbv/EROMD5hvUwruYlFDCX6whCw==
X-Received: by 2002:a05:622a:4a8f:b0:4a3:be83:d6b0 with SMTP id d75a77b69052e-4a5b9a052dfmr119047411cf.5.1749280161721;
        Sat, 07 Jun 2025 00:09:21 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619852c15sm27010011cf.51.2025.06.07.00.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 00:09:21 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Jun 2025 03:09:19 -0400
Subject: [PATCH] mm/debug: Use BUILD_BUG_ON_INVALID() for VIRTUAL_BUG_ON()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-virtual_bug_on_invalid-v1-1-b792ac2b0920@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAJ7lQ2gC/x3MTQqAIBBA4avErBNUyn6uEiGaUw2EhZYE0d2Tl
 t/ivQciBsIIffFAwESRdp8hygKm1fgFGblskFzWXPGGJQrnZTZtr0XvXpNPZiPHWuFkZWWjBO8
 gx0fAme5/PIzv+wGm2ZVEaAAAAA==
X-Change-ID: 20250607-virtual_bug_on_invalid-81d24b276109
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749280160; l=953;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=mhLto2qWPPXbTI4doOngzdXYLr3HbKBvzuotTiFjvmQ=;
 b=j6xJXhKdQFfB0/D/hkNsTvlbP86SnSCmk9xHT/sp56nQo6cFCo5wu57DaFCoUQ5A33nnd4fHl
 O1Eg+O+uFWSBrIIfM7VRJh9AeDXSw/u1lsqrnsBHxCoto9WHPXmJq5p
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: x2gWDG2ciYZsqKEDTWPN_8Opi99aeoJL
X-Proofpoint-GUID: x2gWDG2ciYZsqKEDTWPN_8Opi99aeoJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1MCBTYWx0ZWRfXzy5X5Wa23HJK KjKU6nERL7+bI9BTnn3lOYuAH3T2PMIFhIlCk2Rqyaj3JdcqTQ6ORKRAehO3dYLaYlgG7rFafau xYWg4cwtYvYedpwwdFOUkX34w03AEi/F5qTrkko/TJ2clY/6lI3er6fHtqcxMO0MQp/F+LcuaX3
 y82146yGVInkuxu1yPYULCtqws1k26W2hbwSm78rnHesJCZoEbYP5z+ZMFu+6lvWKTdOx8HIwCV WnWhKck0MbMQgmESwukRd7c4fIHXtfLE3c/ZySRkWplKmXSgUAtHOlVPD/WDsmDBBE/AQAoxZju YSthfRFobiS23EzzbRipCuJXqPTgeOAEiQC6aC6WsE5ndfhHeCzziJtAvCuX8wUUCxBd8Zi82M0 M3hYn0wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=10
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=728 impostorscore=0 clxscore=1015
 lowpriorityscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070050

This allows the compiler to validate the condition even with
CONFIG_DEBUG_VIRTUAL disabled, and aligns VIRTUAL_BUG_ON() with the
other macros in mmdebug.h.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mmdebug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
index a0a3894900ed..012aef40e7a9 100644
--- a/include/linux/mmdebug.h
+++ b/include/linux/mmdebug.h
@@ -129,7 +129,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 #ifdef CONFIG_DEBUG_VIRTUAL
 #define VIRTUAL_BUG_ON(cond) BUG_ON(cond)
 #else
-#define VIRTUAL_BUG_ON(cond) do { } while (0)
+#define VIRTUAL_BUG_ON(cond) BUILD_BUG_ON_INVALID(cond)
 #endif
 
 #ifdef CONFIG_DEBUG_VM_PGFLAGS

---
base-commit: efe99fabeb11b030c89a7dc5a5e7a7558d0dc7ec
change-id: 20250607-virtual_bug_on_invalid-81d24b276109

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

