Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E8170826
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412251; cv=none; b=lQRKuKa0KbQfn6D5caFF0gURuct5JvFm/NhRjWWFtk1g4El9KmlD/lmLeqIJjsDfDp7WzkczIHjxvrdiyjhzBmLhsuTCJjBUZnd97vLDczwqZxGMShTC/KpbTyR0bknhLtoq/WPJ5fuHDM6atZVz6pEd1Mfmin3vdSl7wnTjmG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412251; c=relaxed/simple;
	bh=qbEfMXw4f6hGtzDMopgPNMAN0mELfSEB7aJDCRd37ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6DypDHiH5hGuly38Wj8yQSuD7giBT0G8iZtQ1G/QA9BBJ7Qc9sUbK97VLz11XSULGP0Qp4VOw7tLBh/DGKqGDTziNXdz9UM+TNtHKuvmnNLcKVbTnt5XTte4PqlsXffW4pDj2L4KMpmwIC4sXpE6/S33SvA18wvt8lnexp0Yww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=btw61md1; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="btw61md1"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0UXEw005891
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=sp1HTHNp9i8nJGzJLl+MrKoe11bDNbefLMEa4bQ6yek=;
 b=btw61md1ol/I85WxujwDh8AfHaAF1w0IvdnYi13BQNSJyYhfydso0KdAkAdqVFUzJJxa
 DBxcJTzkFOF1ltYx/7BGhIrY7d4u2noxW56WNcSEn2+aoN0SWtL/shlt3CZWwAuPYvF+
 ICGTA0Jvs/j+b+Uw4qWsbUHMZlQhBfv+hU0r3HoO323uQTCiPUJLAz2B4f7fIPKfJuWY
 q2nprnmbQ/2QtegiEOWHMj8jPn7IHL4xJA7LDFpmPJk94L9UOmRFFdiJqOV7avHhOFqU
 eWi8OIg8q4EVgGz5VAh3oxpl1q74axoZ5zh9w5Dp3b8bWcFoJi9Ib0ngg3ybEVHt4LiG WQ== 
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 46ua0hr37j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:55 -0400
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so1307145185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410554; x=1749015354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp1HTHNp9i8nJGzJLl+MrKoe11bDNbefLMEa4bQ6yek=;
        b=GMuggRvoV+euiQwPPKjcUGiJW7YZKrFF3kY+jcs/3vdMX7t6rcf4fg9t2QeQNlEkeO
         YCy2Cig/MIy2Ywf5JPVcheGmcKul4RTuLlRrXSPXo7wxK8/RQv5aYyIeN23wZOJTggrY
         6KyCFZfvgEk1cRGvYLcozMQgclTEVUetNr37CuLOOqTw17dGQxQIBrocZYPWv4lDuLbe
         gBnVTa0TRKo+2nSUJutpOx0hcO4YuRMVxRa2WWw+VHj44OSGpM9XBeFAqH8GesxJ4dH+
         Iz04WfQqncZ0Vs6+WL3MQE+PmAswrbbahQ8xSBm/ozCQ25RZr7ACNCD/KabMvnv6rjp2
         5iEw==
X-Gm-Message-State: AOJu0YyL/Ash4IkcSCuAcTnmsDcYRnxlgu/IifxjtqugmiRBuk3Q6zci
	ZIFyuAJFl2xa210dJhE/RZ6omSPqLuj+WbJwX7Lk74jufzrlEyMqE5FDh8hbGt+zly05icftgHL
	xVPsJr6pDG8oTK/2u8yxttN7dNZNF2ls2qw0LNym0Bt7u52m/m6OvUswl9xcNIA==
X-Gm-Gg: ASbGncuDyWchEIqX1bivP4ig2G6rPOk3/GerkXx0ZQvTa7VScH6peFJ6iWcbJ3dXGHW
	F4Tmyd4u6sjgoB0eU7SMDDJ7lprYYgUyRCMcHJvu0GT6MlwS8wSa4D0RlB9ZEtrQUdegaf2gwM2
	+krnMCrjEDcCRRT69acEUPIhW8E7zPJPqnMgMCNNpIVAQ6ViOXN7Yo2L+eqc2H0d9UcGvPn6qKq
	KxEjucJ29OnzEE0vvnHL4ULDZ9UwbCpp3OPJzH4yknETMrtBCxjhmb8BVwqYeS+WngI7vICfSbY
	Ub89qwhZztBlqgyX7jzQKqlUhfp3Dy26/0pDfa05pwiSJKapjphc6xKtCQ==
X-Received: by 2002:a05:620a:244f:b0:7ca:e971:8335 with SMTP id af79cd13be357-7ceecbad616mr2593459285a.8.1748410554417;
        Tue, 27 May 2025 22:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnrArbZ+R14YYj/3nPVnHDO2U1t2oUn6i4bFafxorEqiTIqpaF+odMlSpR7iXP+Y7Sko8Saw==
X-Received: by 2002:a05:620a:244f:b0:7ca:e971:8335 with SMTP id af79cd13be357-7ceecbad616mr2593456585a.8.1748410553995;
        Tue, 27 May 2025 22:35:53 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb82001f9sm32382585a.9.2025.05.27.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:35:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 28 May 2025 01:35:36 -0400
Subject: [PATCH 1/2] x86/tlb/trace: Export the TLB_REMOTE_WRONG_CPU enum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-tlb-trace-fix-v1-1-2e94c58f450d@columbia.edu>
References: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu>
In-Reply-To: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ingo Molnar <mingo@kernel.org>, Rik van Riel <riel@surriel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748410551; l=1136;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=qbEfMXw4f6hGtzDMopgPNMAN0mELfSEB7aJDCRd37ag=;
 b=6Xi1Q38KxIyNKkntpq8m0aT6OIo29lk+yXPpyL+z33nU+BFY2ulYAOgkmSfSJDsSawfNu9XTW
 ORAeuLDxnDZASLxFoqIz9hQMiJZeYg1HZUz5uCtuhTZIDZ1dFtKH4Zu
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: G-jgWj4r05eTbRYFdQ47uayihfezaEiR
X-Proofpoint-ORIG-GUID: G-jgWj4r05eTbRYFdQ47uayihfezaEiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0OCBTYWx0ZWRfX8wi5u4ONG0Oi xJbF2eh/rN2hy4bAOSRPKgDr4IA7qtAWRd0d8PJcLsSXFQ2r6Hhl4Iaw6T4IY3hYmoqps1g52mn wqjz9o1XnIzXocnExGbZEXsyWFzSRynhvc+tplPWOMXOTq8qmPHeCji66Vzx7JCJ5j9suc4upwS
 EYeRneKpP5zo5kfn7UYjIklCNg649GniPBvK7E1IzsvO1qV4fbH/csC2CZx0x37fA97XuX+98pj wWSb4QBhF1HbbRxDCZFzy8opME5MTi0A97l5SLHIUnyTiLUDWwx0AVeWwBn/6AajALZAdGQbo8u cM6z4cAt3lpeCkwR6I1vxDfpUyK7sX9yzjMK0Saye+lpGYe5slvoaD4vEGXOJ3r+858tnR0Yght jA/mFUEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=893 phishscore=0 lowpriorityscore=10
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 bulkscore=10
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505280048

When the TLB_REMOTE_WRONG_CPU enum was introduced for the tlb_flush
tracepoint, the enum was not exported to userspace. Add it to the
appropriate macro definition to enable parsing by userspace tools, as
per [0].

[0] Link: https://lore.kernel.org/all/20150403013802.220157513@goodmis.org

Fixes: 2815a56e4b72 ("x86/mm/tlb: Add tracepoint for TLB flush IPI to stale CPU")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/trace/events/tlb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
index b4d8e7dc38f8..725a75720a23 100644
--- a/include/trace/events/tlb.h
+++ b/include/trace/events/tlb.h
@@ -13,7 +13,8 @@
 	EM(  TLB_REMOTE_SHOOTDOWN,	"remote shootdown" )		\
 	EM(  TLB_LOCAL_SHOOTDOWN,	"local shootdown" )		\
 	EM(  TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" )		\
-	EMe( TLB_REMOTE_SEND_IPI,	"remote ipi send" )
+	EM(  TLB_REMOTE_SEND_IPI,	"remote ipi send" )		\
+	EMe( TLB_REMOTE_WRONG_CPU,	"remote wrong CPU" )
 
 /*
  * First define the enums in TLB_FLUSH_REASON to be exported to userspace

-- 
2.39.5

