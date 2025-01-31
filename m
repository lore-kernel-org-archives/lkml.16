Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9BC1E9918
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341411; cv=none; b=SM4ri2g0Yy2N2UUOj10D5c+g+lZvanQELcP1Oyx5tmlMIzClSz3yJUBSr9BMWTzU2ad88ItsBlsZtVGCs428qeNJhubPq8wK/ZtVEZeLRAgdG6SjYih1PRuF0QkrutPvDtAjNoCxWbjwUajxBox48wW8KGB/w7iptfZwITKe1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341411; c=relaxed/simple;
	bh=p0VPgA+jkv871ikjZhyvSRtdccIWBvWj2uD+8piZL4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVJa8myqcUPuY7PckkIIAq+X9mjJzkjbHEMVbXjG+ueHBfSviLh6aYeWS4s2CX0q+KJM8V+N76kxZkJO/PryoIyjPg3yooiEkrWjIrYMyeEcvZ8xUW76XkxzZ8ZMTeRDnOUapsuRN/yOqpXuPVWEFi4H2OvvSl30646bmT2gLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pb4H5z1+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pb4H5z1+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1043581f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341408; x=1738946208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=Pb4H5z1+Uu1LC8ZqRqt/P5NWQsurbhn7JcySfZX6An198Q2IsO9PhH23acJmjw4Zau
         W3XZrvsjczpr5olBdeyCdVUhkLlOptsiwxF3BDl1ZS29KcVUN4cK630K+cruTKbbrYp3
         c7vd+tLuv+7N0shWqkB2n2p1pXoAf+c2yvvAaTB2RuTubC9S2qQnjVu4sGPkdkiCjhzf
         Cuf2uqhlD6HkMi9W6WwaXphSti3XL28YMPgpngbvjfLb5ONeuen7Fimgfb6g+3FPOmYN
         h4dS+RYMZC1rljFPJfTDqC9RxtQVLHOf0rS5xtPUK/+ca5NGziTU5rkxJNBglDZ9hm88
         4sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341408; x=1738946208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=aEOJPaQswZY9a/MwxCX+vj325A8KeNIK5FljVqGVpFEMYDAeI/+2xegBBvBFyzhlxD
         83nNtCq9BWAotYbLsUkLp3k7UHwJBFEo1ho66Sddm3sO2m6dZDf0WCQ71fsxOsHFX9z6
         ySHDvbJhwWYLZniynUntwBNEvthGkeJJlfFL++nnFR9kj1hdFyqz+cGfwo06pj0dLr6+
         rDmNqUfhhLKfdNMkVPFshBbvx4F458/PS7kL2A7aPGJ5Zjt451tVRH8drlr3ZWSfJ+nI
         bGgx3Fu8XmTyz5IE7vY4179plq0pLtKimcL5vS8MISMmNvMdrdeUUq2dDVkvchr3ZG9y
         JfXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSDb1kVk1MoqSGp+WsGOyUoqyp7b+4csTJILNUG8SBGj8kMdd4rn7WuZgF1BkGGyAnemKFOEh7eR528Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWljN3hRPbxzgqFHnLWrC6E6dMffL4BzUTMR8MDl/Mq7zBZFP
	tgfoX9iNEgpStZ0STHbcaXri8R/w1Z1RoaiocVnxGAEOv8ucy6zvVmcUvlHAGos=
X-Gm-Gg: ASbGncsf4sY1JtkcuI77TRJ0IQUQ8gSCgqIMKlzRoVy8O3IVNp4txrHMtgHR8cAmI/W
	4tLNhPXVM9gj3nUr8ZuMP/phdG9GBBJONC5GBYyoOY8aDi1A0eBb98WpPFF3+gxK+8fDbcTMt3t
	jWV+1CJskCKuB5MKI1yGdaIsxM10dURFOvjf4NKBZQWf6iIjPDFm2t/CH1kIsxfsoPCc6zrQCTP
	C4/xv4HRWZpMN0JkUp/YFgW+FxV5p0nDm9/+vP6e78G7qUZJtxH89CfSLR8sSEZRMFfb8DI/3Q1
	c36zaimMkdGfJ5I=
X-Google-Smtp-Source: AGHT+IF5Phsc9N8X46dajNfJWnr4UVEjpzVbx4Mq2WI4DCkq1bHDvZhiQxOuFhDTImar5RTr5xSPFA==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id ffacd0b85a97d-38c51952173mr9891268f8f.20.1738341407991;
        Fri, 31 Jan 2025 08:36:47 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:36:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] coresight: Alloc trace ID after building the path
Date: Fri, 31 Jan 2025 16:36:12 +0000
Message-Id: <20250131163617.1730505-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proof of concept to support CTCU device. Applies to Jie's patchset in
the parent email. I think this would be a good simplification, it
removes some code and makes things a bit clearer, and works for both the
old and new CTCU requirements. It will require merging into the parent
patchset somehow as it undoes some of those changes.

James Clark (3):
  coresight: Don't save handle in path
  coresight: Export coresight_get_sink()
  coresight: Alloc trace ID after building the path

 drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  84 ++------------
 .../coresight/coresight-etm3x-sysfs.c         |   3 +-
 .../coresight/coresight-etm4x-core.c          |  83 ++------------
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
 drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
 include/linux/coresight.h                     |  25 +++-
 22 files changed, 159 insertions(+), 258 deletions(-)

-- 
2.34.1

