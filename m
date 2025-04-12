Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C02AF04
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744420207; cv=none; b=OY7Y+TzjzyCVmWp4Y4qfyJou3hfMzdeysW5vW7XHQwpkVDibxKx5Ebrzt//FJsx4o+vQqIutMg/oq01d3/VSr/Pfexkddh5WwQGS+6BdfmeSoJY1M5dVIpqV62Eue4ilDabMCuaCg5lUNS3xjbz6e36ZFs21smki+fS6qqUb6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744420207; c=relaxed/simple;
	bh=yLr8b9EbijnpOVnenjprleBtfB1K/02uoMq00wcTmw4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NQa4pgk4N7aaw/yC0+IYBg+P8DrLr98uc/Ae6pKL5pymF7S5WsT4LFXW73TWy0vqVS+I0M/04jBztDhERyGXMCIyXEWh5RIj9pG3ULdRVO51E5/WRJyjnmMrwes8p0gcWfLANmDzvLuclVgEhg/CAFwH8YtLKp6BfH5shUbjyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MA0qtJnc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MA0qtJnc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2254bdd4982so34836275ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744420206; x=1745025006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vuYeE7vh3UMCu+MTHlQBRo2PiTav7f60VIzBYttr9w0=;
        b=MA0qtJncXTNb4h0Ev9gTqPIw7twwRD8nE1K/YaFg8nEoe4LYnwammZ4ZlyQlefsxYx
         nKSEsaRgkYcfT3uYJYz90Jdzag6RT8WifEh1DTcucYI5ii4E3FXBIvId0NVHgXBNhV/u
         VnPwW/ox1VXeYmv0AVrz2P24xCp98TFV0AsvhGxTdZ0tZmCnIA0QgtgkOGwStOCcNDRX
         B6PTTq6T4aQpHzmKvaa06a8Ont2Gn2wJTSGwqqlbQLzGWplmANbL6EDEoaH/cYvD5LLL
         CjMjIxSKCEtOhGdcPjUXy4bvIVwy9eC4LncUiqs8XZqdFJBP2isskKyaXjCXV2gCo94H
         txZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744420206; x=1745025006;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vuYeE7vh3UMCu+MTHlQBRo2PiTav7f60VIzBYttr9w0=;
        b=Dq5uYl0zO3FUC/u0x7poJFioi5tswatrzrEpj62t+MoKiRra+DVC+w41KrnY4EikYa
         nXg11rS2ZhSHnL3RdxhrTw8wKy5wjaWxWNYtbP9AQXXm03KEZR0wuiz5ozAdvFhv5a8Y
         WN6/rYFPLMOQRNPfF4hv5rZiwVhRBL4/ID5Lt7eA5W2ccI2qruP2HNqakXPyrhf03HZJ
         drERQZhI85oH5hIbVFeZoZIRQQBOTThYAfPFkG4/GqZocHwuij7K+fTp7HrM/KFaqscr
         t6QBSqgqqfGDP3KYsI3TinLrMrk6Hz5ZWxpQUl2t2K63BEXoSnpPgt9Ye9COht7z1n2b
         JPJw==
X-Forwarded-Encrypted: i=1; AJvYcCXqttGQFv7wo214LvidDAMvmGShwLQPwm+YD6UL7fakuZGX1v4T91jHqhpm49TRnZcH5mM5OuP+BjHNYu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EHJ8rFnoA4B97GxaOgSmE3DwOXzgrk7ldE8XghKaaZD4lhnM
	XWWBZWFMq6kDYtDL0IZKfpPy/NcZ+ulDk9gMKaZ5OMQBbOHLG0klmQNavZ5RvKERKWwLYTGVKza
	pSm5MeY+FrJsWLPxuSKEC5A==
X-Google-Smtp-Source: AGHT+IHmybOBIwMVUHalKCMt11/fiZVTPLdyyMCAY62wKgSwsLPSM/VaRP6Diq3+UC83cC2e+Wnl9kvoKav//2b1MQ==
X-Received: from pfbgj26.prod.google.com ([2002:a05:6a00:841a:b0:736:3d80:7076])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0b:b0:220:f795:5f14 with SMTP id d9443c01a7336-22bea4bcf70mr71598855ad.27.1744420205676;
 Fri, 11 Apr 2025 18:10:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:09:37 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412010940.1686376-1-dylanbhatch@google.com>
Subject: [PATCH v2 0/2] arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
suuport on arm64.

Dylan Hatch (2):
  arm64: patching: Rename aarch64_insn_copy to text_poke.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/include/asm/text-patching.h |   2 +-
 arch/arm64/kernel/module.c             | 129 ++++++++++++++++---------
 arch/arm64/kernel/patching.c           |  12 +--
 arch/arm64/net/bpf_jit_comp.c          |   2 +-
 4 files changed, 91 insertions(+), 54 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

