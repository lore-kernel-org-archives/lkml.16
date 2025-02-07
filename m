Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092A238D2C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940084; cv=none; b=iMPWyn5TFZ1UOVIlz6ETLzAaUxzKUqQSNil0ZjBHZOVUQvqzVgv+GTpIfd86+zPo7Q8iUHXoEFzYfV8AddTCx9omOBuUM3jyjaMW59dnznbVSMtZ63s5lBLJZoUEq9NDaIk87ipuW+Fpbg9rdD4h8yMc5cE9qLr7S5zfYVfqyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940084; c=relaxed/simple;
	bh=dhBxKIvdI6BiG9BZMMoSBVS3E3wXSa546KCeyQUs5Vs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=f5zQuA++hoP9LWH1/vVlw1ndM8mRutWiacPQd1zPcI4CexVWFEFs2L/Uy2c89s/lPy8Knu5IMSxBki3QnzIm5OXblRbQDgo8kjOEnZzS4q0VneCwaSPKlpjH+vXPQURmtgnDSFVx7VKtvNFrTTVbv9JV+PXsZ02Hg8kl8OmXlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LhM8f75R; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LhM8f75R"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ab78d6ed6f8so111461566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940081; x=1739544881; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JmM/iQkbvbBvv7fXX70IILA144cHjP/mqwSWag+vGNY=;
        b=LhM8f75RfwOdTZ3o5kakPXcYicpBpVVlIeQ6SBK/GzSIuys+nmp02yFuDL8nOem1n6
         8A5zaCGUusEf9Jn2VlhM7auV9AWxwT1MjyrhEX1KPGSkNsHlsYrB3NcsU60WuV4QgsUD
         bRZ3X3Mmq2ZPNqVLQaiCokAye3dzQt449dHLuU2aOjA825Qq1P4S0XMc3k/KHkDyLObg
         JlHUoimgsmt9089/Ev3VOOVxJQRsiGbphFO9Dg0Qdz1U9MquVXtuoR3BGLd3I+QSmvf7
         H55rjCwFLH93cnQSAdz8ZIR2sR9WBIy9GXGl79zcB6zb9zWFL3OilMAsxS2C3KPyUPlM
         GlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940081; x=1739544881;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmM/iQkbvbBvv7fXX70IILA144cHjP/mqwSWag+vGNY=;
        b=fB1DdpYmvQuMSti0//JeZgYJmQ3cxwrvXxAJoF0dBtIhTMC7e5TIoQPQbxzVEyLkHm
         R0+A3ZdD0JPUE2AggU9vTj1u9NYXT0petnIZwbn2geOm2j8JZh3MjRSn0tuEQjltxXA+
         SlrLjDVLT6C/RlfKkWDfqwhSbFNidumjGazBsfD9SBd8AuIR2J3Zi/I8e79hfgYXjXkz
         0Su5VWQgu2ZaxW//DKtGodEpLQwKdddOhkDkfdVJlUajkxAuw1W8FVaUj+DGIvD6hahr
         cSpG+IW+i7yO2QfQItLaHsC7ichYHYV1Bgt6HN2XQJoVHrO4SlWg8NRXQPBWae9ECnBQ
         +kZA==
X-Forwarded-Encrypted: i=1; AJvYcCXfabX2h24AkcEIbKUT2igYXXzmFnkQLHs+flVaFbozBTSa8AkZqGFHtmSbEEzV7WDvTeOdjzix3ZAIv30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMkZdbVE9cn48k33R2bLD693tj6nGEYFEZ25amAtBOBbP/0C3
	JZ95BrPvpy/bH1YHgcd+y8M7tt1/hFxGVSh4wNstNlNdyeO/GZgMvltzwJkzL+M3uBk05YPF0DH
	aFrRzAw==
X-Google-Smtp-Source: AGHT+IHcnN2p00NsIVJ/Tco7clKqry81fiAhoeHRLb1kPa5FchoYCPasviVPCLtY7RbBfUFKTgyinTclnwgX
X-Received: from ejer10.prod.google.com ([2002:a17:906:9ca:b0:aa9:1d5b:da39])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9719:b0:aae:b259:ef63
 with SMTP id a640c23a62f3a-ab789b27dddmr445128366b.34.1738940081474; Fri, 07
 Feb 2025 06:54:41 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:36 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-1-qperret@google.com>
Subject: [PATCH 0/2] Fixes for pKVM NP-guest support
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Here are two patches to deal with a race between the handling of
permission faults and MMU notifiers with pKVM that I found by
inspection. Specifically, pKVM gets thoroughly confused when it doesn't
find a page mapped in its relax_perm path, while standard KVM deals
with that trivially thanks to the -EAGAIN special case in
user_mem_abort(). The second patch addresses the problem by simplifying
the implementation of multiple pKVM hypercalls, which also has the nice
side effect of improving locking by not taking the global host stage-2
lock as much.

Patches based on 6.14-rc1, tested in qemu on on Google Pixel 6.

Thanks!
Quentin

Quentin Perret (2):
  KVM: arm64: Improve error handling from check_host_shared_guest()
  KVM: arm64: Simplify np-guest hypercalls

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 73 +++++++++++++++------------
 1 file changed, 40 insertions(+), 33 deletions(-)

-- 
2.48.1.502.g6dc24dfdaf-goog

