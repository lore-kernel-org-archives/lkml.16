Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08591F1515
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892862; cv=none; b=nLRsklWDWikOlxnlS97AeP+YFAICv2GzxJcke/55cw2gi9PBw2nsZOxlOmnW7Uck3JqS/Efwyph5NHa83qvO6Xb17OAatWQ4qjoMPrkVYzs0Mp2qifLsSD3+In6cLW6KNZe/PcBqL7xlDDVyZvhJL99xwSCaQncO0Wv4lRjS8YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892862; c=relaxed/simple;
	bh=zTx/r5s4X4uS32Icc7H/vT79r+XdrlKaFHzzRCs1zK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGw8zlq1m0DQ8x/LD69pHJmSlsU0PwJ7BfRTrA7GV703pd+yxgahLql1+lBPSP2tzchnkW9wPKSXsbFXvX4ajxLB4S9crIauoPs5/fYNN/Z9VskME8PTtDP9F5zjx9MewZoB6gaerBmNLOTIuGbDCsZSXqbmFddat5BC+UGZym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDudcIcz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDudcIcz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74264d1832eso3227040b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749892860; x=1750497660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hpy2n/zGIix5S+aqfK+WtO+PpnnQR+jbJdzKWLldZvI=;
        b=MDudcIcz9egekRuAlrMjjmYpbdSKRUvd3f9Pb5lrcArnJpmK2qKFa/7OcnghUW7u9H
         x79yxYKIQqU6ZHWe0ZyQifSNayZoSFm6fHAf5cOTEY4DphilBJYS7y1MFlmQPwSListZ
         j19+NogemGJIrggFBoIYb+J4dowDmpEEcb6nT0griXjcrCXEKi86Lo4+wbD09T9MY2Cj
         rG/MlvJvev4IxfRvwIfE4OD3tgcDUS22Mk862H5+qJ1GqaR0ite51QlxJ3asfYrr34Pk
         nOarvOI7hvqy8pMuisniA1GNF509r2IXNQymn/KfAsZzf4HIJ2EVzZVbWONs6ZI2CRT5
         BNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749892860; x=1750497660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hpy2n/zGIix5S+aqfK+WtO+PpnnQR+jbJdzKWLldZvI=;
        b=DDue2cNhGz04Qq4h0ULVAV2TYVwrjCsG6XuDsISePE/1u7OwXcZExHkCIPSWZfYGpX
         UDsa36TbIKu5zz0M5qZLGYsnK0w/H4DCPSQes0RdC0ERd26THffsJzY67WQLmvLnzm1F
         f1UHP/I6K0RJ7VoHV31tLwrf1ONDAFSycynL+VX5euC2H2ZSPHjnmdO06TCjMF4m5BMs
         n13bD4aVQcWJ7tlD02nT4ht3mohy6a7X2MjuklGvzOgBiJMEuGPmhlbQNgxkXOkCLEh5
         BsemU8MT7Nwol6W/tWws58UZPF25y7EVzQauRlB1L1o1vN7o8aJx0Ga4X/zK+bUuWb/Q
         rtMA==
X-Gm-Message-State: AOJu0YxAFa8VYmoUK0UuZNdpSsW0/grNQAktmv1vCEBPMLrtzvaKFnZt
	AL/rb46rddCQOd+Gt7DLx8hGH6WeFKn97aMAcdT82/kcYMOB7BhRfu1aCwzjrA==
X-Gm-Gg: ASbGnctOX5+pjA1gGuFIqa8HvEwvCVjnqtBqK5okzxeHLouFEKnWwD1lS14JS7jho7C
	7y4dsoUnliN59c9E9a3lRimQF/lSxNvbC8YeaSWXSv3y2m7Sq4ObFVqAvzMT/xC+73ZNh1D//i+
	apxoOYO1PfB+iZkPOp+VIFcTKtPQyPiq/DJgo1woNx3b+HZvogTOtMaYeLWU49OfTsbgSnLc3co
	prgzb9bfxVUMVoILUYtS+x9HzLeLxAJ0b5CNTFKck/YrohDQxpOkRHWIBTgyWHuun+FBCx50AuC
	bBqYWHlhvEWMtnZeA1WaNdyAsP11a2BRkTnbg2coUD0p7zSUH11NnE07Bews6C2ESwLFFdlAvQk
	=
X-Google-Smtp-Source: AGHT+IE9X5OWoWiqpPQlNqHiEmRI8QaVmb7lmjvlEgeiQrnlpKv0U7T6vrDXEDwqx0v/kVIiPm3cWw==
X-Received: by 2002:a05:6a00:8ca:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-7489ccdeea2mr3184494b3a.0.1749892860136;
        Sat, 14 Jun 2025 02:21:00 -0700 (PDT)
Received: from localhost ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfbasm3100089b3a.15.2025.06.14.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:20:59 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	jemmywong512@gmail.com
Subject: [RFC] Expanding Scope-based Resource Management
Date: Sat, 14 Jun 2025 17:20:53 +0800
Message-ID: <20250614092054.25336-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20230612090713.652690195@infradead.org>
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

I greatly admire the Scope-based Resource Management infrastructure 
you introduced to the Linux kernel, as it elegantly aligns with the 
Resource Acquisition Is Initialization (RAII) programming idiom, 
improving code safety and maintainability.

I am interested in driving a comprehensive conversion of traditional 
manual lock/unlock patterns to use guard/scoped_guard,
starting with the sched module. 

Before proceeding, I’d like to confirm if you believe 
this effort is valuable and whether you’d support such a conversion.

Best,
Jemmy
