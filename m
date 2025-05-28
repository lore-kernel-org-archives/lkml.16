Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A4382
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412355; cv=none; b=UBsoOjKEQZpH7Jo3q8cJzX5+yLOY0zqHyQ3FBNrLZFjELV/6TRPbWFpo2JQGmMRxkVRFdCBMDWiQDNVs1c2HnkRbJgVSeOA/k/mgclM/9QfrbB1qIITxMcEhATNmPoVf+Qdb1LkeHTsgymPhTZBOU5q4E6f73kZ/ieQzGJD2BQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412355; c=relaxed/simple;
	bh=u4GnJWVjLuTGqbXgtkf1x2zfHjnxuyVndV+7heCn/5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9hkbYi+028NnMAZPJcSb5uRLigVVKfMzBqt81tgcsleZTYbk87DHZmiAc2x068s9zHmrC6z9iJUqGmX4H26TS1azeJuL1g/gW5P5qu4hAbR+StH7iGGMa1UMYAyQx9FRfuedouCl44H/nj5/wqP96RMPsepuBaEgsz6mQ90Gjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NIAVSOt1; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NIAVSOt1"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5Y4VX025530
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=fe1SF0gP7B1T3vG5mU/w/LphwhnjbUzeEhTplFhLHQw=;
 b=NIAVSOt1US8wy8tVfB4d//T4g+Ngd4zgAlyOn7Bjl86GRNzVyy/cdz0jn7PPTJONGCCv
 77EGAOXrbfes+dwvKUH05kGB0jONEvPKEQ2f3ZFF2s8pwqQyXu4ndGrfB38cUJ2O/Sjm
 3azPDmNcdC07qkbcLBW4FE85BiLJu1xSzUgc47E3fk0Nk4Z9k70AA1K73JEDAvlWv+tK
 ZQKVPbnf/v90Je0bCFqyjqlJKJipJQSAZscfvU0lXK+Bgthmo6rsgSK7qUxgTn9lQIqJ
 mqKJFdcJSAnpW2aeZHeK7SOUiml/SpF0Jqb2WOC5gfeXZ097aVPamAFXya/6unPdsSi4 mQ== 
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 46uu8pkx65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:56 -0400
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so91045285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410555; x=1749015355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe1SF0gP7B1T3vG5mU/w/LphwhnjbUzeEhTplFhLHQw=;
        b=VoXpQoAEJHd7FWcsgDskKO1Fni8hyzeBEzTsJgD4vZnf3LEDVKhJ6evRdct9w91x6r
         yexLVwfFPkjWMHG+XymwU43JdamCW2YD3vdg24enQAeyHSm9DoJRCT1eUWidNoocMdyU
         S34xseez8GYxdHXJMFrtlxmR6RxzWie7sNOUX8JjUuol5EIdZIY6DjOIFLrOiB7hJyo3
         vGcli0L3W56TWuOps+KExTBnBSeTTrt063LnSsLLiEXg68OkVqRmaiWmTaMFb0ElP0ze
         ZcTZcFirAY6CqUZ02o10DlOaS8HfbXfsWQQKDqqOwqAol+ynJuVrBL2dB8VQ9kzw8RLa
         ulSA==
X-Gm-Message-State: AOJu0Yzfvc4VdmNq/r1FL2og6QhO4GmkBCZLYro5hn4xdIuc6gs5x4GB
	Iyz/YKsYntyiWx3ozMse4XGwhqHLOMFgdjhaXKB5XAtT3MRNNuA15jGFfiM2S1afYlV1XdFTuiz
	oZ4eSlKcpa+jR/1PVywpyEbVSjti2RU9vh5mmf8fAXLLTr2b1KnCmiVc7aKVjuQ==
X-Gm-Gg: ASbGnctw2vFcZvMTB9BsW2JLMVW3Pil2C+vmgNj4I8U2rRGsphCded/syPrRAFWTpp/
	ZUJK1cO0yLJqq5E9dkaWbzY5UNrqhZo2y36SAg5VOGjM+XzZuzNoK7LImMvilBpuY6Kk/VpDl+T
	z8H1/ZE+B89ghYHGfKtiotrCwt82CUK8qCGma5QcFsguvvSdhbAYm2+W1yQGNpmuO9VwxKmX7Pz
	4dBH5twBOSd+9uAwU3YJjrrl4krS5PQwT6Ho9sLbPu4Lba0EP/U0Fw+2luGgjvChoO6IAjfco2v
	MZNxJkRRV2KURXXZ3nsvOk1p35kKfDp2sXs7XIVoDW9ggiL23+qw6zVIUA==
X-Received: by 2002:a05:620a:2601:b0:7c9:65cb:6214 with SMTP id af79cd13be357-7cf06d5bd10mr469357185a.17.1748410555529;
        Tue, 27 May 2025 22:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF61pX8i34SIykQlgLDQcjKk6sMZRhh/Gcw6X2tklDh3wPlD4onZOxTChntHVEvJ2DiXPhjrw==
X-Received: by 2002:a05:620a:2601:b0:7c9:65cb:6214 with SMTP id af79cd13be357-7cf06d5bd10mr469355185a.17.1748410555126;
        Tue, 27 May 2025 22:35:55 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb82001f9sm32382585a.9.2025.05.27.22.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:35:54 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 28 May 2025 01:35:37 -0400
Subject: [PATCH 2/2] mm: Remove tlb_flush_reason::NR_TLB_FLUSH_REASONS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-tlb-trace-fix-v1-2-2e94c58f450d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748410551; l=595;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=u4GnJWVjLuTGqbXgtkf1x2zfHjnxuyVndV+7heCn/5s=;
 b=/anNJxI6PBsPAb9nL8K3TkHBwTCNxPLHsxU3pP17HIP1qu0oXl7UIZoQn7VyX7NeJ/QtOr3oF
 /8zzLs/hG/8CmZIF6I/PcKL0dy4c9Ybfey2WxI3CEETNVmDEjA0IC3A
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: tpLvrnUghPw6fUcReex-8uEwjmje187q
X-Proofpoint-ORIG-GUID: tpLvrnUghPw6fUcReex-8uEwjmje187q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0OCBTYWx0ZWRfXy3QWy4HLclNb le+6ojGNAhVIuSvlimpbWIf6C7BmxlRODZI0qhH8TMKfGtFVMyX5dau8QSAOS9ydn+5IcSWxgvw Spxa3hp8NO8es0oHb7WuwrJE3hDdn9N1suTr8mAXcf7c8NgauXfrd5pbBwWwVYVzLP1/7b38nk5
 Nst+dab00XDybEPG6krEeJVObYvKVz9VqSXF/LB5nYF7NcYFNQ7cSINF2/nF+d5JFJ1bQfmJv5z s/VaAoveQqeMX98SFMtEZPlzx8Xz203RFtpwWNC3ggEkJNPvfB53FUbS8hjt7Mv+4Ir6MtEiU19 rOeNwxuyFHtPuLo21oMHYJlzSEOS2+1PI/Hzt2hrFfgPZqhQMgU9PqSR+2nTqcLj3lMAl7iYhIH 4UWkbbEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=732 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=10 impostorscore=0 lowpriorityscore=10 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280048

This has been unused since it was added 11 years ago in commit
d17d8f9dedb9 ("x86/mm: Add tracepoints for TLB flushes").

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3e934dc6057c..8b91362fcf8e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1539,7 +1539,6 @@ enum tlb_flush_reason {
 	TLB_LOCAL_MM_SHOOTDOWN,
 	TLB_REMOTE_SEND_IPI,
 	TLB_REMOTE_WRONG_CPU,
-	NR_TLB_FLUSH_REASONS,
 };
 
 /**

-- 
2.39.5

