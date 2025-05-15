Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7F1B4242;
	Thu, 15 May 2025 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316132; cv=none; b=AVS5vVegMkSLhS0La+44yRgdeH8UuGKaqUsJdgSHGGY9Drh6L02ceuDYPT3tam2KbshABwk+QTa3S5XphLmlXepFmi2CNLH7xCSWHuhvDFehSeW+QJgMDGRQms0l7LnPZa/bnYVFjfEuiUaKXeVeC3rIy+mpldW2Caq3sA4MQmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316132; c=relaxed/simple;
	bh=hwVlnGZQYkECbvfB4rywfx6b8pemiTmtlgySiUS51ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDqSpNlurfwfPdAfLWNZTr9jrz/axuBNJYyDO3nMHq9nRcQullbwZaU57l5MLn92xADIfvbRvklNArH1LD0KFJeF25+wzZULDnRNj7wkBy07subzKvBaoo6hnUwrmu5iOjI9dGGNgfirGMGmJWrZ6oBySqgeKJ2/DsqAtgFLH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXq+qeeW; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXq+qeeW"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so11500156d6.1;
        Thu, 15 May 2025 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316130; x=1747920930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfI/h6yR5T+QGKNn50rKBkNsg03eRR3EOmEc3H6+img=;
        b=QXq+qeeWKEzFIl+RoO+7yrj84lNFsbctZTFn/NxkDP4HjUBsdSQjFHqwmQn7+ZozF5
         560/HkqxSYfO9QGkwI6oFD9JXkVxoOZQd4fA7NIEBsbDPSPsX8kV7D335ndObIGN+8Xk
         JlmePpx86Hdx5un35sH4I4ZjBk9TOMUOrrTve0FwCVq7ktVNfDJaFPZkbHVwul5EOZxZ
         fciCjc8/7SEr+heg8xRu0HIbVUfFQyrEvbigFXesBh8Vmr0FT1nvwlRXlZhr1/q/nZiY
         ls1mAOGcVr62s8H+1zdD2kWD9ifThPovXvFV170IqyanKOMg5ECeIoL0BqsaT1UMpS+x
         2GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316130; x=1747920930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfI/h6yR5T+QGKNn50rKBkNsg03eRR3EOmEc3H6+img=;
        b=CVwoipJEq0B5mMZqcM11HJ67ZJCB5wPzg7HtMSoxZCMT7pHvrrb3uiStU1fSb7wkWi
         INB+aS/445+FiV6KrOKyu9hM38iLG3P7EfzHjmK9eMqvwzywoZ1KYTPE39KJ1YwSjXM+
         HU5mtqe1JfPC57O3ZPObF+qk0/01kSKqMCArFDJcVe1ij4AFLUcTpiH7zqb7D7qKhkvk
         yiJ+QJhQn2NxxP+qldP0++ayL7ZclGL8ioMwQGA3rU9t2bK1HIl6wbaHm86jD8njFkQM
         KkwbA2u1NF3XFsS2jb6E7iA4nvt0F7IonrQl0Dlpa94im0vfcmNwrOb8y5dt+U0lEaYp
         UtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR3no5uyd0fFT5wPMgcfZ+i7ClwOtBewau2r0bLPL0Z74xfXlWXMzl/GpzHwZPf++ygPuQrLR92+o=@vger.kernel.org, AJvYcCVvs05QF2Ru31yTX8ifuxwxYUQPknwpUpOdpG8GXTkwYjQbA5wK97dtYh+LCuE3cab8wzqzgQIaS9zQWAKm@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTKT7+z9ftKV1RK3AwX47nS1QB04JRKX6yQTBq6USgu0nPvcz
	WArJKEmEKJvuHt6UeIWH8QJGlJ90fOJsl3BPaGWVer+BC4CY1W9M
X-Gm-Gg: ASbGncsFuoCVs8S6Y1kLcg4iexntUNdkMBqKp3ycVoQbw+ThHIVk7iAhTeLUDNJtHUT
	hKzv6bc8G9+6ttM3lC8lp0ysqce5GULxnZMuqQEiWo06JoydlGmVYhuRdUEhd2w5LMNKCT4BywV
	zUHjY7RwBqTi7zAaBUDzV6A1ZXExhM8tzkJQuRL+fW+ppIzQzJVHNnK5F4U9yVreDhkHT3n3uyI
	j9qi4/jpD9uZPDIDqZ6LyuISwPA5GA1ydJ7Mr9Mtu5twP3AJONR7aEzny4TgZKgNWau/AHrAkm6
	2+1202JfN44tiuEMd+oVqVdIunOoJ35cPi99laQ/txgR5V0cUA==
X-Google-Smtp-Source: AGHT+IFhtYFW+nSu82qMrHlJwUBAof/mWqJdiShQs0Id8daZt5/yurPzdh8is1ilm1548tQsdICvuw==
X-Received: by 2002:ad4:5c68:0:b0:6f5:372f:1c5b with SMTP id 6a1803df08f44-6f8a31cba87mr49659226d6.11.1747316129425;
        Thu, 15 May 2025 06:35:29 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:41::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6eb98e5f8sm75823886d6.45.2025.05.15.06.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:29 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 6/6] docs: transhuge: document process level THP controls
Date: Thu, 15 May 2025 14:33:35 +0100
Message-ID: <20250515133519.2779639-7-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250515133519.2779639-1-usamaarif642@gmail.com>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This includes the already existing PR_GET/SET_THP_DISABLE policy,
as well as the newly introduced PR_GET/SET_THP_POLICY.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..cf3092eb239a 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -218,6 +218,46 @@ to "always" or "madvise"), and it'll be automatically shutdown when
 PMD-sized THP is disabled (when both the per-size anon control and the
 top-level control are "never")
 
+process THP controls
+--------------------
+
+Transparent Hugepage behaviour of a process can be modified/obtained by
+using the prctl system call. The following operations are supported:
+
+PR_SET_THP_DISABLE
+	This will set the MMF_DISABLE_THP process flag which will result
+	in no hugepages being faulted in or collapsed by khugepaged,
+	irrespective of global THP controls.
+
+PR_GET_THP_DISABLE
+	This will return the MMF_DISABLE_THP process flag, which will be
+	set if the process has previously been set with PR_SET_THP_DISABLE.
+
+PR_SET_THP_POLICY
+	This is used to change the behaviour of existing and future VMAs.
+	It has support for the following policies:
+
+	PR_THP_POLICY_DEFAULT_HUGE
+		This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag which
+		changes the default of new VMAs to be VM_HUGEPAGE. The call
+		also modifies all existing VMAs that are not VM_NOHUGEPAGE
+		to be VM_HUGEPAGE. The policy is inherited during fork+exec.
+
+	PR_THP_POLICY_DEFAULT_NOHUGE
+		This will set the MMF2_THP_VMA_DEFAULT_NOHUGE process flag which
+		changes the default of new VMAs to be VM_NOHUGEPAGE. The call
+		also modifies all existing VMAs that are not VM_HUGEPAGE
+		to be VM_NOHUGEPAGE. The policy is inherited during fork+exec.
+
+	PR_THP_POLICY_DEFAULT_SYSTEM
+		This will clear both MMF2_THP_VMA_DEFAULT_HUGE and
+		MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
+
+PR_SET_THP_POLICY
+	This will return the current THP policy of the process, i.e.
+	PR_THP_POLICY_DEFAULT_HUGE, PR_THP_POLICY_DEFAULT_NOHUGE or
+	PR_THP_POLICY_DEFAULT_SYSTEM.
+
 Khugepaged controls
 -------------------
 
-- 
2.47.1

