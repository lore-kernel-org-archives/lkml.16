Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D640224B0F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177674; cv=none; b=h+0Q3VU1PErXcqNzgTx40gsnavhoYuz31cWpoYjQKObCRRAM3fgCvt2g5UUvKxVf4GTXYrGWRp1vFSFm5derGrgozNnyGZqCXsGg5q2aZI0vITY7u1j7LUU4lNjMuCDVSm9+PjPTKcCfpDEKk8ks7E4+sm/j++I11uGq47Xh+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177674; c=relaxed/simple;
	bh=P0QsJ2rPVBEP2nxFeZDSTZmOmhyD2ZaBdrga+hkL488=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHNCt+zj3p4Mxv06f1YiO40Ytp6DQxjTKxVi9ToLdN8n1HVyqI8V7wPhO0KwerKGK458Ma7OsohNadYRV3Nw8K69p7ThIuz8F1iFat6Aum3I/IvVrBlIq84zL8SiBG1WaUpsZkGU21TCAB0hO+GEr955h5jVGH1ENB+dsJEatPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=DXRTm3Xr; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="DXRTm3Xr"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e731a56e111so1534963276.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177671; x=1746782471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2A+cF1ypGsLN1/QniCjcaG5RIGOv1oGIJo5HtlBBUQI=;
        b=DXRTm3XrIah2jYMTmm7ttj+bpAYAbUuEm2OSNweoRFJtr6mS5uX7TCjswgYKsDg5Vi
         GjYYdmFzoTQn+JmQL8gpVYnvWEUoZysCPCMEQERP+3FGPK8/am6QPIW203AOdI+7eNur
         ZRLhPAJYT6OFcdCuhmC1npg0GlD8AP9IjliqvqcmCIMiurTuad5zaz/VUbezYoQnMMC5
         1DpBW+jQ4mtZzYupJBMmAklFtzN9kcOc43sPB4PKhLoXc4VgK3ORIb0QbnF7GYCtW8k+
         HLrbPwxZiM74ivEtVp+HIzkWqO5NA492645P5wJwQEyb9vjS70OXW44twEzuafcB5MpO
         GCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177671; x=1746782471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A+cF1ypGsLN1/QniCjcaG5RIGOv1oGIJo5HtlBBUQI=;
        b=wQSYHnlRUEhMAmtqoH76u2nkBpNH2Ca5vG+vE+te39GzKk8/iqZuFr4VGWpiNA7LIh
         3vnVYer8dXS0cchuR/Kt9NG/BR6+8kXs/lgyrQQ70KPa4kqVs3abbhMeWY2l8oYvVsPh
         QWa68oPYxGpeEHKBuF/Mup4s8ZHfSNpW6MqESnCIiS6v1lhYrXx5hDoWSM5NdHrwbJHO
         LRq23tX6z0tjFWHoBq19F0dFPvNzCr5WyHcNtxnAthJveqJzpmaFRdZhH3wmowW3KmNY
         H8rxhID+ywazEcGe+bVw5fft4+hYb4FWSD6Mh060N3VO6bHCIuP76HbJb2zkn7G3lJI1
         IWfw==
X-Gm-Message-State: AOJu0YwIXzEer9Q9awG4R1Q2xM4a4fbXZ0j6WZJy17/Fmpf7bJZu83Mq
	C7NPDdLRjYtkejTNHFsopaObVV6rhiDBIW2r5dp+dpDrQH5/qtWHhpgXd6QRZ8lAY92Fa2HCx3U
	t1mA=
X-Gm-Gg: ASbGnct4fh1XT4L0haZtWvXedN5hnP0osicQMdLh+af3DWuc0eWDwpyZbZDPnz/JiMT
	hKGWzO5vTf2E/EEc6Efqfk2HpGIR+1CUn7f12OWHYKBM+9gHSvNkkpcEKSkHfb50EIpTM0ELNCO
	onwop884INKykT2YzAAnEcXjttGdwC5Xbx8eky3WdbUNkpbMO+ARhHHNoAorJ7cSKA5734oCVU1
	0j8pnQEnZ/3UuJRxiZSzPJ12BTqPfn2N/zIPYAH+Hg9Tzzk4SKnD+3mfOnLYxfuTPztyt/CDKGt
	1DOYn4PIoDxQqVcqO2a3iZQHEn7b6V3PXPehUSLhcA==
X-Google-Smtp-Source: AGHT+IES/Q0SMdE8NP/DkStYtsSPsdbbvB4SZ0B+blj2b434IG8B0bEw+BlpUrAg4H/4nmm8w7JUpw==
X-Received: by 2002:a05:6902:200f:b0:e72:d424:8e35 with SMTP id 3f1490d57ef6-e75656272afmr2925615276.38.1746177671207;
        Fri, 02 May 2025 02:21:11 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:10 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Fri,  2 May 2025 02:21:05 -0700
Message-ID: <20250502092108.3224341-1-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
allows registers x4-x17 to be used for the message payload. This patch
set prevents the host from using a lower FF-A version than what has
already been negotiated with the hypervisor. This is necessary because
the hypervisor does not have the necessary compatibility paths to
translate from the hypervisor FF-A version to a previous version.

Support for FF-A 1.2 in the hypervisor is added as a precursor to the
addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
of this change has to do with the upgrade to SMCCC 1.2 required by
FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
the list of unsupported functions.

Tested by booting Android under QEMU and loading Trusty as the guest
VM and observing the SEND_DIRECT2 ABI being used successfully during
guest boot.

(This is my second attempt at sending out these patches; sorry about
my broken first try and the resulting duplicate messages.)

Thanks,
Per Larsen

Per Larsen (3):
  KVM: arm64: Restrict FF-A host version renegotiation
  KVM: arm64: Bump the supported version of FF-A to 1.2
  KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 235 ++++++++++++++++++++++++++++---
 include/linux/arm_ffa.h          |   2 +
 3 files changed, 221 insertions(+), 17 deletions(-)

--
2.49.0

