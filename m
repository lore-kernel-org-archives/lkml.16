Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5D1373
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553780; cv=none; b=X8gXKYq8Drgh9qw+pd8gWNinAai6Dpo+S7VmjpCqlrWfZP+X6cE4vGs4QhPP3eT6woFOqzO6AcL8xzCmI0Ld8UaE+1KGj32iKE2ZTZOX0gvhtZZ3USUVmNDRD+A2NUBIa3gJvWoTJeQ0ARcWQguL5C9Bt9b+5UbOwCeV3GEVgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553780; c=relaxed/simple;
	bh=TJwgQ+K94nM0wuudbO+pH9Uh8FX9mYdnPkPRatuR/oA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HAz0fNs29mO1MX+E0DWCiJPT0Eg1k3J9liOZvYYQar8/2eNTK5XM+gqviGc71Ok9An6kaVGfxph3ZOgzVcMkzLZlZgNDaj7/oL51xMuwPcLYsSqWIUwSDyL7YI3maTfPLoMfHsN3lrn6qtg2d7u1hK0e7kDESy1k3NfblaeSZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gj2OL1ve; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gj2OL1ve"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so10974246a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 17:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743553778; x=1744158578; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJwgQ+K94nM0wuudbO+pH9Uh8FX9mYdnPkPRatuR/oA=;
        b=gj2OL1veEcTTjgGN+ioYAAjF6Oqqy0Y1vNUmI5W2Y/ROMRbN9ZqBcCIcqeNh7nD/d3
         WcNCSAjD4kNkQ89OjdRez33D0K6oUUsgSNGDgJbl6mXUKZ86GeoK/hbQvedmb+a7qPpS
         cO/pdaMKqg2CHk+WSMy2ZLlKiKhMfJnqSG4P+K13w/VNb0yv3K9mh2gCRpYQ++z0VfPQ
         T0/oAe0C1ZSyvIzcbMppt3QLn/0PTOHhoipQTtSVnd9wo7jk2dV6SoKYyZ1sBp9EemA/
         4FFc5Imd7s3KURK/37dOsk6Gp4K/EUn6PWN+FNUqnht47/2GrsCvX7Dgq+v3iuuuoADx
         mlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743553778; x=1744158578;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJwgQ+K94nM0wuudbO+pH9Uh8FX9mYdnPkPRatuR/oA=;
        b=hw6mWUy3nlgAVNUsf4HbRJPp+LoTvoscw32TJHhBIDBPckLE/DMejsamgsIxmP9Q+K
         90CEHfNMoZZhNKn2bZE+qPUk3qcsS/WvvK1Vv6sORDPM+5aa9PzEuT4O1hv7W91Oe+jz
         tlYe1bLX9m4S7k2qyJTdWAocAhtcSUGh8NVxTBTpgnZGOMJKkWnx/tVY7S+iLljOYXjr
         X90antA0abM/U5BukauCTTlcX9sDcNn6fjV2ptueNxLL1Err+SBHIrjxbyKv0+edWSIs
         QBQzOPHcpHoH8PHIr4wuaUYzyFuaIaqwKFELdOBv3kLDVeSW1M4F2k296DbeBnGU5yrI
         HqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhqmNKLdm7QJphzpSTtGelICewV3zMApKgWNGtcii+1LRHxTg4BtdvbEF4x3oAPgCwssy//mQLjfPxheM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+7aR2RedSw1s7d6fmwTS7rnWu/HpNNHc8PWwJOAFtimQmtyS
	K8k4ZXpbE5a0Ylu0aYONQups6AuVZlonfhsex6og8P749m/uTcomJxI0C8+d8hwKBglbO+f4Q8u
	gLg==
X-Google-Smtp-Source: AGHT+IEnRy5A+8fYf3qEr6ikTE4WCBwKWkgwfuK1fpXzni71N19GGrE1sC/DusmSiadYTv56nAWxft8bNV4=
X-Received: from pfna20.prod.google.com ([2002:aa7:80d4:0:b0:736:3e92:66d7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9185:b0:1f5:81bc:c72e
 with SMTP id adf61e73a8af0-2009f778828mr19565665637.33.1743553778644; Tue, 01
 Apr 2025 17:29:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 17:29:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250402002936.960678-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2025.04.02 - No Topic
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

No scheduled topic for tomorrow, but PUCK is back on this week.
