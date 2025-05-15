Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C60614F104;
	Thu, 15 May 2025 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316129; cv=none; b=MbTwwq3GUpv18azkwj7xTpwtKk73CHhPi/m0dhch9qKSCCSmiwSo8L0MAkBe0DaYmUr/CntSx3XFuC2hjC2yKuyA8xzTO4Kld5xqJ1+CvEmq5XqS/59JCjgtRLmJ2+gOv5p2351Qh6vxjkUxKeNjGhyMYaYxZ7MMcCRPlpyhvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316129; c=relaxed/simple;
	bh=4hEOlPMN9TGQyacEpK18ok9RPnqMx1M1Y7xAEg3A3uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZuMXzErK5QyopRj9DV78PlT3SoHD7adJl+oiarF/12I48e73r0StfiXpZWzNPqMRjTGRkge57WR3BRd1d2LcSWF+2y3fztiluF8hxqBNG+MUst4t+VOJWy1oqYTF/8Rb8x2XFcPa3dR2V0neqrcK3I+vBwxwLYTvpzK1gtr4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbb5w2b0; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbb5w2b0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4775ccf3e56so23805261cf.0;
        Thu, 15 May 2025 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316126; x=1747920926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B5pkHdPuqQZDbYfrz3XLKt1s6mapVj+8upRwrTiCEE=;
        b=hbb5w2b0RWeF5ZjZoGx158IKHOEzoXa03rBeKIf0dzNdyDxczRsvnVGVnqxLpf/YeF
         8StoE3OkQOrzipSviiRZoOjuuWTsHYta/4WKtDlLb76HsBxD63x6LC1iM2BLHGxSov+y
         H5sBfxRdF5ESFX+fQdtCoMsZkmIWIkcA21FrGi48k/z4/6Sk3TR6eWBAyiZLO4V/IIMs
         H66nP/DT1kXY7onwK8YXWRA5LeZboRUJkgv8F0Pa6Q0u7YSUTxHqBuQTY+A1DRrlu39N
         /RjcQZ8nY3vNN2InODfaOJU6BC3lVONjWIBqzhJ17wKXEEJzfE39Wl1CxpHwoA6zq7xt
         JA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316126; x=1747920926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B5pkHdPuqQZDbYfrz3XLKt1s6mapVj+8upRwrTiCEE=;
        b=mcFsud1OoxDW85U+7UmnNAtmVyXttUFgEOkM1xkVCJG9p2n+SLuTaGS6wGENq4cibp
         RlJF0WbbdYnSKdxKcjqW9Xr8gf0C+tC280sNIIF9KTjbUFVKwgqBoeBxae4YKLOQPHnO
         HWO9Q8NJV7ple80y/jNsh7MAfb8yqcUKYOJs85QYuPKWlMiUWIriO3TwCIJT8mSzZNKB
         VZnJETlifmaGPeIujI6BkyYnjyk7ieBcCYcW7C2nvTEgSSOfWs/RcwA7cK3Y9L5jjTZs
         TOTfTPurQY5PghlwMZOFchyeU/wFMDA+8BwbDQ0+qNgyDRQsby4UmXMwh3+zD3ffj+6L
         9Gvg==
X-Forwarded-Encrypted: i=1; AJvYcCVU+X9ToJ9HxejjRdWRQm+DmB8F1H//MVmuaRJqh4I9VNs08ZXPtiRFMEOTzcCdSs4R+CDENms/GWw=@vger.kernel.org, AJvYcCXQ8URk8RHFo4BucT0e4AktsX9GzwZvviVZ6wTloW2tKJeFoHNAMg6ZUWG9C7GTh2qFRwEDuIBx1RfwlatB@vger.kernel.org
X-Gm-Message-State: AOJu0YybJm5MeXgjxk92/FAwKEhdyw2q6ZMpXJZGHCaA9E+lkSYME/6m
	scPcjlo4p747mrlb28XsibaUekX08NWMj7W+FcBCgYxvOqmgoqdI
X-Gm-Gg: ASbGnctaOEc1XmS2EFOxK6DPOakzPMKq9Dy7xVWBgkdXPNV3bVGWbIdsZWabQzWu2IL
	K0bpXhqqBz7JhXH41/96MMx1vDowsHTKNAG8Cgw2O0toUKUos5MGP8dhhX2a9fVcF2wygk0Ft/u
	xWUCp43jCP5D+lnGl2Ey/t7QvyO9E2reO/YmTX0jyzbLNcxGsU9fQlTpR09TOr4d4XC22AAapqY
	HaQyE4VahDN4abVjMkpUNj14rIZ/1AVlx+XNAfR8ZVk4iy9ZZzG4LeS1vq/CY4mFAjFzLMtWOPe
	//t5prceOCg8UoWjIPjbejLeaZclneHrITvBNR6SHKMdvRTa
X-Google-Smtp-Source: AGHT+IF0cUWwrVvIqOdNp54cd0CJe0sje3pw33UgRF8p5fdCzNA/tB3SELgqsN+q8TFL5kTOchOR1w==
X-Received: by 2002:a05:622a:1f0a:b0:494:9e33:6fa with SMTP id d75a77b69052e-494a0e5d5f2mr68876541cf.23.1747316126166;
        Thu, 15 May 2025 06:35:26 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494524b7184sm91065811cf.33.2025.05.15.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:25 -0700 (PDT)
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
Subject: [PATCH 3/6] prctl: introduce PR_THP_POLICY_SYSTEM for the process
Date: Thu, 15 May 2025 14:33:32 +0100
Message-ID: <20250515133519.2779639-4-usamaarif642@gmail.com>
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

This is set via the new PR_SET_THP_POLICY prctl.
This will clear both the MMF2_THP_VMA_DEFAULT_NOHUGE and
MMF2_THP_VMA_DEFAULT_HUGE process flags which will make
the VMA behaviour of the process the same as system.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/uapi/linux/prctl.h                         | 1 +
 kernel/sys.c                                       | 6 ++++++
 tools/include/uapi/linux/prctl.h                   | 1 +
 tools/perf/trace/beauty/include/uapi/linux/prctl.h | 1 +
 4 files changed, 9 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index d25458f4db9e..340d5ff769a9 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -368,5 +368,6 @@ struct prctl_mm_map {
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
 #define PR_THP_POLICY_DEFAULT_NOHUGE	1
+#define PR_THP_POLICY_SYSTEM		2
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index d91203e6dd0d..d556cdea97c4 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2665,6 +2665,8 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			error = PR_THP_POLICY_DEFAULT_HUGE;
 		else if (!!test_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2))
 			error = PR_THP_POLICY_DEFAULT_NOHUGE;
+		else
+			error = PR_THP_POLICY_SYSTEM;
 		break;
 	case PR_SET_THP_POLICY:
 		if (arg3 || arg4 || arg5)
@@ -2682,6 +2684,10 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			set_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
 			process_vmas_thp_default_nohuge(me->mm);
 			break;
+		case PR_THP_POLICY_SYSTEM:
+			clear_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
+			clear_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index e03d0ed890c5..cc209c9a8afb 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -332,5 +332,6 @@ struct prctl_mm_map {
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
 #define PR_THP_POLICY_DEFAULT_NOHUGE	1
+#define PR_THP_POLICY_SYSTEM		2
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index d25458f4db9e..340d5ff769a9 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -368,5 +368,6 @@ struct prctl_mm_map {
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
 #define PR_THP_POLICY_DEFAULT_NOHUGE	1
+#define PR_THP_POLICY_SYSTEM		2
 
 #endif /* _LINUX_PRCTL_H */
-- 
2.47.1

