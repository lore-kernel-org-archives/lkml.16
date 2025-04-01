Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72BC1F1512
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508668; cv=none; b=qUhcf0qPHP6z/rSkJWq+prWbN9UpboyL5cFneQj6eC1VWso4hNdFmFiBK0dhLYkrFZAJV3lgrxyEXFHDol0k3Ds6d490VqxpC+7Z+cDHx5+hRoFULe1wfHtSseRQmZAW4lGrPfr7KqTalGedT7lU9a8xsfpR4OL+uqBIzW2Fi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508668; c=relaxed/simple;
	bh=l7kYpJSyNb4LT4PNP24Ib/mZ3/rLHCzQ/AGuD9oUJk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SIiuiVq6SFImMMY4AIgAJGGgosleDrwlGZGmnRDzaYx3Qq7LPhw16JM4ywIA1ZE9m0Driexf/h5xPxMBGcH01TjKj6xHh421qNjz3hMSlEfS4jHe8rEewWcaOlhQ02JMwbMIrMu/ylM5X6Jk0w1qoy0LzItwCWQTtjsaxcXhfpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G/37PlTe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G/37PlTe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4170657f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743508665; x=1744113465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MjzUBL0mWJbDDZlrnw5hFFgQWXS6aH/9lQwvSCFdxu0=;
        b=G/37PlTe6dVwtK9jB1BqXUvwRl+5HIqSeAa7rNxVGIkKQUhMT3dFtMPXFYxQXkv37U
         hcLg+ocC3N2ycdiJ6F66js4JvlqYZ6bQdRB7YtAITOpWmTVTXE2NSy/7QWyF6WvvMWEW
         h8N0VmWCEnfYX7W0N1U4k/L5ki0UDlSJYQAMLRiKGXWixqD9J2D2DeBoEPPBRAVhMeYR
         oDe5Q9ZidjV6wl1vRF+MPqFux1l5r0LNICOYE/4zXOR6FMVm5AzSebk9EVyAfKUF/Fub
         2zE4b87Vz8CGvhJh6+Z+sTkOK+mRKcRKg6qoMm3jchj52NISDvRCVFx67aSGWSEmNU2C
         axFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508665; x=1744113465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjzUBL0mWJbDDZlrnw5hFFgQWXS6aH/9lQwvSCFdxu0=;
        b=J/GiNUYsS/OY6WRZcNOwsfUBSxTH/A9zA+Q6GvPF2OPBRZjKLtNpLC/e929kFcnRsP
         lWeDWNPxQhpZhhi8TlDXC3mjnxCcX/CfyhKo0X45kAEZxfL+DAVN5PFp5HUIISJiheCx
         +WBZ6nTi/h3IMLJRzAJ8syIOs6YgHCp0VDfvt0zgsIE0ifzdGykBro64AAPWdhTEb5Uv
         614MMGI3boAo6GcRvIEWGhZi3tf1IzSBbXiA6VO1LlJM9fzYwSJtBGhnC3XgUo0SGT6g
         Y8i34e/du0D2lv0GXPD2WGPAUbRngftMnxNNkMvlmHdT5lWlmuweY5rs4K2Zgb4BTdOp
         84WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpGOyse0gNLAr09eDGCyoUGPP+x7GekAxAzsCdfA5X3L55nfjAZPVAy7eeukWoNYwFkSr8j14JlgcKtb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEttYQC0wVOLt2IRJrRZOQsSV0EtWCPyg89hoMmBVgWeVDvs/O
	oYC2oBBANTIc/LADpU6OWI3PklD1CytQTux1j4Bc0awfT/FUNy1ziJAg4nGISJI=
X-Gm-Gg: ASbGnct797+fGtWZAPFgcGo6/GIHG72vkDv6lOMAGyhN2k2h5ib8qOfkfH74K3umWzI
	nNkPpEm7PRc3cvjuYRgZ+VITWivXjBlFTlaJ0TtUk2B+7wLUza17aWdiwk7jfXt2ImTQrVWuvp3
	uNnVtbXIYR6zeyJT/szZKAp4g1NbwDDhuIoozF5GNgx8a8aZrLkBXrasBFPmNmL1Dnh68WMrztq
	qK2CB7N85vJ8Gzkk+dN+jU/WEM0pMFwIns5ZHmCdFTzjz1Ex140fmX/KumNcXTChieubHM9Wy/I
	jyD2NM5i5+FIiv+kstGLg+YTSLSueyOw/yASXTio9CTGwPG1FYpiFspCDA==
X-Google-Smtp-Source: AGHT+IGf9wJpKPB8sOAif2cBapevtQFgZEdOvFtRWa5cgAStYv1CeTH/1WOTDBZFxqFzQq9JOq6DIw==
X-Received: by 2002:a05:6000:4282:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39c120dededmr10748348f8f.14.1743508665067;
        Tue, 01 Apr 2025 04:57:45 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a42a3sm14130150f8f.91.2025.04.01.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:57:44 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: netfilter-devel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [PATCH v3 0/3] netfilter: Make xt_cgroup independent from net_cls
Date: Tue,  1 Apr 2025 13:57:29 +0200
Message-ID: <20250401115736.1046942-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes from v2 (https://lore.kernel.org/r/20250305170935.80558-1-mkoutny@suse.com):
- don't accept zero classid neither (Pablo N. A.)
- eliminate code that might rely on comparison against zero with
  !CONFIG_CGROUP_NET_CLASSID

Michal Koutný (3):
  netfilter: Make xt_cgroup independent from net_cls
  cgroup: Guard users of sock_cgroup_classid()
  cgroup: Drop sock_cgroup_classid() dummy implementation

 include/linux/cgroup-defs.h | 10 ++++------
 net/ipv4/inet_diag.c        |  2 +-
 net/netfilter/Kconfig       |  2 +-
 net/netfilter/xt_cgroup.c   | 26 ++++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 8 deletions(-)


base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
-- 
2.48.1

