Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0C18E025
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067739; cv=none; b=KEDkq+D7fvbOsVALuRsKHNJ8nEvTHsbuYsvssUhnTTmP2OHXL9os5lHgZtcqX1YN8cIKj4BODD5iqqr7d7lCkWqH5t6/wykGfmtuLvbNNvAaVIgYlLZh/nGajp9Zmen5sjbpfDObPK1oryG3bmaBy8DQE4pUf2fLU5k0XYp3clk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067739; c=relaxed/simple;
	bh=drPrCveQJ2nF38aDlX6Xryfirhzqd9PmLSAMhJNpAOA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LGo2hvQ0aNEIr1hEPTMahuSlrwhV/cPZOF+nkqWlQhDd2PbaE/pDFxyr0f+pmcaVHGa8qguxyaxxM6aQVSavgZmbfEEW+WsyYLqgBf7z83PNBpou6lL3YYkmh+5iuqaC09+LFck7ynN6ST9UeMscVRqTasHU5VqRbWu/0+DBeYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=hViOd2+A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="hViOd2+A"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4530921461aso35747625e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1750067736; x=1750672536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ3V0gzJmMqB9pDar/canoJsIJpbRR3q/9+xStbVMrA=;
        b=hViOd2+AeKV5D5pCAbje8Dpk9JicmEvAsEV2xVF24mVfLV8KCvHccUPxLUnXd7Qo8U
         OYiNes7FxIlGaNgjACmB/ZEj6TpkLoUdyhwPJTbSRhooB3q10hLVDNLLBfkEYHaWC/Kw
         NwRmP+M8HsYK5YOOPVMWIcJwWz5AFmD2Zq7M/9MsXPdZD3Yf6uao+B+7LQlGjCJMImFD
         2un2djr589tVyoRXt+hlJ3nBS8N8iRgWfdow0HXkZN9T5RFMDnq/rSSvg7OJjiBDVAXe
         7mzPlJCPa+yKBBZ8EplBU3/jfvJuFkkFWaiLkVOs/XzDl4220YqpMDqpEq3ITFozC320
         L3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067736; x=1750672536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQ3V0gzJmMqB9pDar/canoJsIJpbRR3q/9+xStbVMrA=;
        b=WTuSA3r5w+kXbXvUb4UNOoeULn9RkRM/afLeoGMK4S2q5crqm5Den2NZmY2z1MiE6B
         KbF7xuMdw9F8jNr340/zwc6Hw0KT5eOK9qE2OAfk83S4gpl8/D4jAQIfAfxdA3RGDpk+
         wUMAhMWLlDwJCqwoEe41te0SMYVlWjU8Dph/WKvpeF8R/lgX9fuu/lzQvvQhoUx5lNME
         rN4hpksESY/ovZNhmNxsEFc4v6+AbXL8RXeE6IBWVQdC/hr/2g2y5IkDIokXMgHEVQuf
         oC1jbs/WN0+2cYDO9EJeIBmLosS5czy6D2YhsPd8/MxJ3w6Az6FJMohHYqNncW8624pI
         lzZg==
X-Forwarded-Encrypted: i=1; AJvYcCWtqxRG9UqO6V692Gv4cjTL8sfOZG+urUWjKdocw9j7RcjjO53B1A7Ddz26VAhs8hX8wu2c6G2POGYlV2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+SnYanmP/3giwIF4OZCtd4QaUZhDjDanxANuO9LwubnYaDQD
	jETf0iXAUCKpYYFKrsgXpHnz6IRkYzrkmrrs+krqZ7GEtEpjau1ggc6d7SiTTzPZTlA=
X-Gm-Gg: ASbGncu95bC+AZGzyQQVew9TzZSetyZgrgp16wnKUzJT5xUKh4jrWdYfXpKciSkaR+j
	6iyTqMpdHtaH/FAdPrCkU5zmSyAytMP2TshfesXAynoO8Vo51ZZ6zMRvvqV457G2wnD4XJQ+uec
	2eW3nG+KhfnpF1mnSvf5ZeAUVOZqzd/n2Vp/f5fYPi9PYP0gj58ncLaBLleJ249e3Wh87BzBCDs
	3yI4lt4yHHGvkzhQchR5dF4gmxilpdEEjLYv4zQO5cK1cgo7lGT0+B5dNRX3SD87Z/0jLDE4Iaq
	hx1VT5C9RMJMczlbcNlzLoMyANRPlTdO/KApPdkN2Mghfsz2ivtqbVh/7b1NjYzg
X-Google-Smtp-Source: AGHT+IGsunl5K1ssoQSRQmIgzglzisrnybJwWxpgkBqoS6HCLg2uMYiKE39WDsXJ7qi/USmCgzVtaA==
X-Received: by 2002:a05:6000:401e:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a57189690emr6979169f8f.0.1750067736249;
        Mon, 16 Jun 2025 02:55:36 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::2e0:113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28876sm10554308f8f.73.2025.06.16.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:55:35 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
Date: Mon, 16 Jun 2025 10:55:32 +0100
Message-Id: <20250616095532.47020-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

Calls to kfree() in trie_free() can be expensive for KASAN-enabled
kernels. This can cause soft lockup warnings when traversing large maps,

  watchdog: BUG: soft lockup - CPU#41 stuck for 76s! [kworker/u518:14:1158211]

Avoid an unbounded loop and periodically check whether we should reschedule.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 kernel/bpf/lpm_trie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index be66d7e520e0..a35619cd99f6 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -646,6 +646,8 @@ static void trie_free(struct bpf_map *map)
 			RCU_INIT_POINTER(*slot, NULL);
 			break;
 		}
+
+		cond_resched();
 	}
 
 out:
-- 
2.34.1

