Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA2022424D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801210; cv=none; b=lVM1HS9+BbXeU8THOTKQ5o9D5fXLCrflEGeLol+/uA+kVa7UIW1LeXwGEpmHkJWFKefk0mwogpyq9VWqQ6AMTUR9/+5x52ukwWYVqn/MYxHAAcjX3ColEqdX4gwZPdv0Tgw5QHHyrmNmhtBJNlO38Gr4wEVpgicBU7QVSOUs4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801210; c=relaxed/simple;
	bh=FFvBCknd8IuGRR/pjTvYSyuDF4+NszF59ge0pjk8rhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzIyio0viyy5mx9iPCgAJa7Np45lLEGZHAjYE0XKH0sMD4dvS2VLdUHZ++ObIzrqfbT5a8HKrGfDXZrVFNFc2ER7fsck/i+XRJNtE+jPAAvnYXqhhNIgxkxclCO2iV7/pzqbZwompTXu6Xlg1dS2XmAoAs+tPJ9tj8B42AGHwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MF8VjHEg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MF8VjHEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VL9vZro0BdFwyk98zVNm2YYJ6CabP26FrlBnQZyFPJw=;
	b=MF8VjHEgyES1UTUSqoku4vgaE+5u9wKOZiJelhpFZ01K+Hr9/DZF+1ZCmQikBrI+w/WGuB
	Sn12+RMALT9T7QzJ0PAbQCDt+IfBVKpG3z4uvEtjtUy643tq0dNcN37vteas665s66T6NI
	UbVWgfn+z54QppdMCf5p5dO6hFUQz5k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-31BbSJBlORGr0OY5FguBnA-1; Fri, 09 May 2025 10:33:26 -0400
X-MC-Unique: 31BbSJBlORGr0OY5FguBnA-1
X-Mimecast-MFC-AGG-ID: 31BbSJBlORGr0OY5FguBnA_1746801205
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf446681cso11315245e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801205; x=1747406005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL9vZro0BdFwyk98zVNm2YYJ6CabP26FrlBnQZyFPJw=;
        b=EZjDr6G3Ncnw5LPFkrhOLv6WAlJ+QOR0kMzk0G3a5x2W+GufTPm4AAHURYoZkYAYs6
         dieh4LH0WpDm374VyiniTmKLahl/gEohkabHEYkVETjNKF/7adpbAq4DfzfuK78rx1C4
         /Hih0gNdcukaw+EDhl9z6kYOx0BEJLIDldaBZfgJvtcnNGcnrZdTq0hju2l03pgzSkN6
         v7SVllw40qw+IEEP2+75DAb68t1/Ue+VTua5BB8ypxoq8VWLUFSN+HRJuaTrrIXpDtQx
         J0ctpLYcqr/mZa1r81C6Qbp/Cq2/NAWKhBOsiQlH3WJFlfLk6cTCBLPSuj3Nct/DcSeU
         0Gag==
X-Forwarded-Encrypted: i=1; AJvYcCUBCyNOtCceicMQhNCKyRP1sUcKTPeLDKJBRwPLZGh7Y9uDRXaksqGcbEQJkIIb2xcVh2PxoLNlm4GRg0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhsm+GuyeGXpvSX8Oj2xhALxrSar0cUUf3LwG1iLG7invVBuyO
	Gfo+lcFLfS23W1wzwOYtZQHZZpyeinsNzw8kAZvZ4Oj+letxubWM8UqU1u2GQidzPqqbSxuPptE
	GNb4pJ/6rOxg6RcoxZLqmRE2y3mjBfpNpVJ3Dqnivi/m3WFCTFDcq8M7Y+MEcjw==
X-Gm-Gg: ASbGncsbXTlKAIE6Dsyho1GsyNgNgtqeHPbJbTfQMRnsjv81Qsgpc6ShRWfMTVtCShp
	+dB4+GYAQAlxTrdeeRRmd1QhrbwIkAj1L8XaWhJA8U2SS4VBq964ma6iQ6WabzpgWJDI/2jMzXF
	UiUdKEQpMQhTaThL9J9YBcIvmrLZ0HIVr8PZ62/aHJ/pp2M9XBXnd/+IKhZcJmpwOIN1Z7zuBp4
	UvSQmi5HtwSVfjqY6ULHL4Z4+dD6VGNYIcC9oGbF2/dYHHDMzSYGPZQDME356KpEa2A8idUWflE
	p95dMVMHNHGx/f7KGkkP3PeRWtA2sRcxzolM+pi2a7OFqQvKxK+N7aQF1yXrGjcNwuHMwWZG4qA
	=
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr36807135e9.3.1746801204806;
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsWDESg6zUq+whRTNp61iivnxaZlKkiv8gH+MG5fYiPl5xSd+s4VyqNCOQwrNmOxuB7m8DQQ==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr36806865e9.3.1746801204462;
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 0/3] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Fri,  9 May 2025 16:33:09 +0200
Message-ID: <20250509143312.34224-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Sebastian Ott (3):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - workaround for
    AC03_CPU_14

 .../selftests/kvm/arm64/arch_timer_edge_cases.c      | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)


base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
-- 
2.49.0

