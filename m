Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF421D5BF;
	Mon, 19 May 2025 22:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694033; cv=none; b=P0i8bmXoiX0E7e4PluWoHdaaL1GoJLoddLxTCTXhScdaJPYG9GTiTpaqz9MIoZL+z4Nr3h4HYeHyQunSEFUy+R24QGOICeZn35ljn3ojnWVSV31eR9Sam4kKHMWL7fUbJdNha96D3P4GU2Dhii3PGg521pw/KhYLkMxQPUb1LMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694033; c=relaxed/simple;
	bh=7DHUAtdxYHed9//cev2Od5qBR1CObbVspUagy5uPlCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9PM0PyJ9m3c3PRZ4ophcJ3c5iKYoEgTtqWY985bQP10q30Lg10rxTnyl/F5HEF7/hRjjXUGqpfp2mh9Pvz4k1wF+IZ8GfrZk3b6BLdmGCBoqXX9mdb6qEsxjrjbdJPH+dtIGCAMbRRRRp9hGttTJfNorBVL5nF7hIlgD/SYff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS/WdA7T; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS/WdA7T"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso53975666d6.3;
        Mon, 19 May 2025 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694030; x=1748298830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6GYjk8Dr4mM5akd3epW+BXD17ctmGGIEMIRcpD2XKI=;
        b=OS/WdA7T0h3w3Fhegdt5v3HUNKSFnd21UmfpgQfLR2/vvifSLcVdr6nqSvFitMeIHq
         H33LgNxowZuZ1mdXcxPhTzSEmWlU0K0mjgW5ZPubkSUF44EG9nw0mcc5opQeJeIcvpqe
         UmLoGQFRp1n0A242qVFv6tXA68fZ0Yk8D7Dz4DubvrBJDQdGu6RubyDz0qk4jnvoM0zq
         L6BrtbWKlSwokpkbXwmrh6rs3FRS6FJuVcutjlXx+44i8eOaONqXWnRHysNA3uIa5tZU
         5sKf8Rmed21hKylQ8K8SgXaZ+LoOJWrEVweebArdV4y5giNkHqzyJejAEIrYesZS3qUQ
         KN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694030; x=1748298830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6GYjk8Dr4mM5akd3epW+BXD17ctmGGIEMIRcpD2XKI=;
        b=QkgBgKufiDMuF2wX/sDxeO/dbgX1Rd+aj/SwPtqDWlNFxPQWgQdo/3vYoFmcDa0i6u
         a98BmnOOz5w1baG0YNKKHN1GvaldSuUuXuBe+KHjkIuW7H1pYbPfBp62pJBvTq1w9Hz+
         aAY1qvyWmKOM2E9AKf1LFfRnSqIkLd5mMNxqb5XeSk/kh6+XApS0B7OK+9PjISFMO7um
         mVfCO1+cgbSMeBNEFtm8X3dzSKJa6jxyLCLB+szTGfr71/bJLrk8QMeiXoc//Sd4UAtj
         6roEdEeAoC6KJdJLVIiMuS04Sz7SArr3+wpVz6qOwrLIVuB2+FnWWED6i1hUTSw62Eac
         HiIg==
X-Forwarded-Encrypted: i=1; AJvYcCU/bx06Bhx0a5T6Dggl9/3+CFWMMffgFCiaTiyd781e5F0HxsbUK5FIXDHIalIozR50/Xxpxuok7JqUAxOf@vger.kernel.org, AJvYcCUR8tpJHckHhDIqjp0t/0WntFZth7ybbQeEtcalAbxyIwe/XEPSVKRRDo64LQURU0dHREhDVxr0fis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5N9mfXpDvXbLlQjWMKK3ZaDv/zEYZlMluv8Tv96YiO/2DP7KX
	1tBBH0X7HO3DNj/cMKtNmkQaHS+a9h+iS8IIL1i6tE9k7uXfetarNkBB
X-Gm-Gg: ASbGnct6X6IM7FqtwHaKyEWE/pCzAbCF185VYAS0ifDsrVHZdbl3vptPcZZ/d2BA0IR
	GqDnus/ZbIKBf3sABHG8erwKG0ylljiVbrMwuqyQDk2VKIwis1+FnHy5bl4VN9QwISBePHFLDF7
	SK+UpbuVw8aXjKZuznR/nV03AnNJ2C6UAbdM2PrNTIO2oYmRsI50UjY5UVfp8Se41VakwNXyr4B
	QM8DXyuoPZBv1O7WkeJsBZcJx3fPuZjRq1+sMJazApB2i089i7JGGCsQpI8qSKsO162lQpUDxur
	HishFw/z9MojGyazi15vgwTYfaweHsxOTBQxNmGTodv3MgcX
X-Google-Smtp-Source: AGHT+IGig5bxPGk+qAd4HDl5M5Hmea1b5/tyBwQX9Q6xIpmS8HDGuKJHgByhih/F1gdkpGOen/gW7w==
X-Received: by 2002:a05:6214:2302:b0:6f8:a667:2959 with SMTP id 6a1803df08f44-6f8b08e5416mr251126186d6.36.1747694030472;
        Mon, 19 May 2025 15:33:50 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:4::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097b69csm62531546d6.103.2025.05.19.15.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:50 -0700 (PDT)
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
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 4/7] prctl: introduce PR_THP_POLICY_SYSTEM for the process
Date: Mon, 19 May 2025 23:29:56 +0100
Message-ID: <20250519223307.3601786-5-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is set via the new PR_SET_THP_POLICY prctl.
This will clear VM_HUGEPAGE and VM_NOHUGEPAGE in mm->def_flags
to reset VMA hugepage policy to system specific.
(except in the case of s390 where pgstes are switched
on for userspace process, in which case it will only
clear VM_HUGEPAGE).

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/uapi/linux/prctl.h                      |  1 +
 kernel/sys.c                                    | 17 +++++++++++++++++
 tools/include/uapi/linux/prctl.h                |  1 +
 .../trace/beauty/include/uapi/linux/prctl.h     |  1 +
 4 files changed, 20 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 33a6ef6a5a72..508d78bc3364 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -368,5 +368,6 @@ struct prctl_mm_map {
 #define PR_GET_THP_POLICY		79
 #define PR_DEFAULT_MADV_HUGEPAGE	0
 #define PR_DEFAULT_MADV_NOHUGEPAGE	1
+#define PR_THP_POLICY_SYSTEM		2
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 6bb28b3666f7..cffb60632d97 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2668,6 +2668,8 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			error = PR_DEFAULT_MADV_HUGEPAGE;
 		else if (mm->def_flags & VM_NOHUGEPAGE)
 			error = PR_DEFAULT_MADV_NOHUGEPAGE;
+		else
+			error = PR_THP_POLICY_SYSTEM;
 		mmap_write_unlock(mm);
 		break;
 	case PR_SET_THP_POLICY:
@@ -2688,6 +2690,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			if (!error)
 				process_default_madv_hugepage(mm, MADV_NOHUGEPAGE);
 			break;
+		case PR_THP_POLICY_SYSTEM:
+#ifdef CONFIG_S390
+			/*
+			 * When s390 switches on pgstes for its userspace
+			 * process (for kvm), it sets VM_NOHUGEPAGE.
+			 * Do not clear it with system policy.
+			 */
+			if (mm_has_pgste(mm))
+				mm->def_flags &= ~VM_HUGEPAGE;
+			else
+				mm->def_flags &= ~(VM_HUGEPAGE | VM_NOHUGEPAGE);
+#else
+			mm->def_flags &= ~(VM_HUGEPAGE | VM_NOHUGEPAGE);
+#endif
+			break;
 		default:
 			error = -EINVAL;
 			break;
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

