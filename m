Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C684B1E52;
	Thu, 15 May 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316125; cv=none; b=oVev8sw4Q8E01Dex44PXj2estDEdS/UKtluFuc5C5LZUrDQfF/GXUBEd2O++Jzcte/3FSUFUjd65cLWOEW82kQBqTZ6qaHQqK45dBr/HCsQsVooJAIXEmIPRgnJnSm8j2ftiG0FUENdQ/tLVWMYpeclZ6/6oUqUA+chKazJ4G0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316125; c=relaxed/simple;
	bh=N6hUe1JahVV3NodwigUCoPGFJb+vT+7cGyun41pvr78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8iDmuMqAcPmf3QokJcyygvLZ6sRQJL/CrdoiiWwfcHW4H0lWaAqeL6OMurt63GW3o9txfruVCiPqRquN3H9ch06LFcr53YQbV1BtnrvCdVnvbQ4m4gdn1OvwznpPQEATsYmFjPecdpER6gvf7131nwcvdPhD0973YnVc9K0Pfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj9Xjb7D; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj9Xjb7D"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7cadc92771dso89082885a.1;
        Thu, 15 May 2025 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316122; x=1747920922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVK7+XeCrE0vaAK5daWU0mfxJLR/TlZDvlGnpbE/bhg=;
        b=nj9Xjb7DRAbYmaxeodZntyXM8QaHUBWndS3zkEIK9Y5vKmfG8RWIYN7dAM3r7vQ5w4
         K8fLywKuc+NLYDyG33UHJBnrI73oCrysH90bN6P58AcVWBXIw9GiPJpXIdCQb2ZumIu5
         A3c5c47u0eHIJDIbtUyCBmZ9LcCEeQfymUEGbPL+TLVP5WrMGk5GekUGnS6uRauSW+mt
         t/5vHF9PBq/bUCjGwk1NsXEd/9tA1vs5tY+Bbk+mUdGAA0trZTcZL1Y/dqry/Ao1mJp5
         sVYMdx6SCB5BLmDyhHeJHCq/e3d3GpKyPi/UCZM24GEzJgddK2TbOSH5fqWONKG9hG1x
         xcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316122; x=1747920922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVK7+XeCrE0vaAK5daWU0mfxJLR/TlZDvlGnpbE/bhg=;
        b=QIYUcUa5QiUK5w/35q26tDSY/WXWflsVabTkrbZPUXQy/rp/AGlZH6gF8DNVDEuFr5
         foczmSq6zuo8o61aQsYWcRW2Xt06m76/QofW+KaIAZQ36aP2nZiT1WxJG9xBAVQEQeJl
         xgWBdCksymrjVAEzw3OEJmUJme0h6BdpN8nFRPdPdDi+CE5ZOA+NKrMdUXSg6HRsmtqk
         YEhXebITjdPl0+iftWWSs0H9H9mgMtU7PV2/EjTo9EF8kUbLOZX+6P+1zMgubxTRtoEw
         TrJcXJeUEPoDRewQ2mXSZlJrm3DhFg0LQSt/CyPTN0Fc99ztFoWMKzrfbNiOxhUtqaXq
         sdjg==
X-Forwarded-Encrypted: i=1; AJvYcCW0/aS/vmOKRJuK68HchFAjBaqZQ1sIVioLS/BTm83fFCt6LEIgJRFHf272EJkx/GjK08+2jMCGBovfk2g0@vger.kernel.org, AJvYcCWVE/eW/QozxKJybaF0wdwVDpHmqws275bmBXLoWeDenvQvHBKBGq4YXU9meZ/BdqXueaFor76JLW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8SKCvRg5frlsxgjXfDV6McWniK4MgN6AD7RNUVoSp+oa6Rgz
	ckZdx1UeM/Cs861fijX3wnqJPDSJJPE+TKMe+2to3YMRqhBwPzj3
X-Gm-Gg: ASbGnctbT+cxu5x4fdY5fCBOUd5Zwp2ockWaf+t7hvDa0sWNkH0VTnPMxy/ewJ0XRyF
	xQmxw4jDF7qYrQrwdcYfUk7+hCBtlYmbeLyEA3q88swI2ICPPrV9fQInLQofY3o2hO/DeVt4EgI
	bzYNvuAEy7fAa5iqpe0W9imfXk1Jm80jEJsEsuZhIn404JnDQt+ljC25negss49MylANzMqFp7o
	0DsXNaILPse/MsJEomF1O0FU0EqcuINrV4qzN4ythVrMY1j19Ato3sS1SpHRcEWO44kl8hFioFh
	PuljkpQHCh8Ng9Q5m/csw1yeULd75fl3HY20EFx3WR03jTWN
X-Google-Smtp-Source: AGHT+IE3uLRPVmAMx8aqjehSeTosSaDm95ed9rhjS7Cdm74U2OOvVDir0FUQPoeM6h3tWC5rx1PFLw==
X-Received: by 2002:a05:620a:414f:b0:7cc:fd84:cf8a with SMTP id af79cd13be357-7cd287133a3mr951646585a.0.1747316122447;
        Thu, 15 May 2025 06:35:22 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:6::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f64230sm985676585a.28.2025.05.15.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:22 -0700 (PDT)
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
Subject: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
Date: Thu, 15 May 2025 14:33:29 +0100
Message-ID: <20250515133519.2779639-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to change the THP policy of a process, according to the value
set in arg2, all of which will be inherited during fork+exec:
- PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
  process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
  call also modifies all existing VMAs that are not VM_NOHUGEPAGE
  to be VM_HUGEPAGE.
  This allows systems where the global policy is set to "madvise"
  to effectively have THPs always for the process. In an environment
  where different types of workloads are stacked on the same machine
  whose global policy is set to "madvise", this will allow workloads
  that benefit from always having hugepages to do so, without regressing
  those that don't.
- PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
  process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
  The call also modifies all existing VMAs that are not VM_HUGEPAGE
  to be VM_NOHUGEPAGE.
  This allows systems where the global policy is set to "always"
  to effectively have THPs on madvise only for the process. In an
  environment where different types of workloads are stacked on the
  same machine whose global policy is set to "always", this will allow
  workloads that benefit from having hugepages on an madvise basis only
  to do so, without regressing those that benefit from having hugepages
  always.
- PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
  and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.

These patches are required in rolling out hugepages in hyperscaler
configurations for workloads that benefit from them, where workloads are
stacked anda single THP global policy is likely to be used across the entire
fleet, and prctl will help override it.

v1->v2:
- change from modifying the THP decision making for the process, to modifying
  VMA flags only. This prevents further complicating the logic used to
  determine THP order (Thanks David!)
- change from using a prctl per policy change to just using PR_SET_THP_POLICY
  and arg2 to set the policy. (Zi Yan)
- Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
- Add selftests and documentation.

Usama Arif (6):
  prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
  prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
  prctl: introduce PR_THP_POLICY_SYSTEM for the process
  selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
  selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
  docs: transhuge: document process level THP controls

 Documentation/admin-guide/mm/transhuge.rst    |  40 +++
 include/linux/huge_mm.h                       |   4 +
 include/linux/mm_types.h                      |  14 +
 include/uapi/linux/prctl.h                    |   6 +
 kernel/fork.c                                 |   1 +
 kernel/sys.c                                  |  35 +++
 mm/huge_memory.c                              |  56 ++++
 mm/vma.c                                      |   2 +
 tools/include/uapi/linux/prctl.h              |   6 +
 .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
 tools/testing/selftests/prctl/Makefile        |   2 +-
 tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
 12 files changed, 457 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/prctl/thp_policy.c

-- 
2.47.1

