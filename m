Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3778A32
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810950; cv=none; b=gwx0gR9r66t1E9lwlNOjMBuMRb7IRCyYHz78N4hXu+XYHhv/KBnio34Yz4rOLkHBd8yUvWgjj6IXRk6+f8kPWhRCe24ED2YD/+zRtWnw5/CC3FtRtou9M4rH8YyMbNVAv1fMcp6lTCIAzeUNvSTTYVLR7bjHO151p9dpD/RYtYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810950; c=relaxed/simple;
	bh=hMgHEfmF+a/El1KoU2SeqtGwEMiyH0V7OzSh+mTbLl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VbFOUMkT6fLizKlLlGAdygrf9kyyeWwtXfizkIQzEnJDwzGA4lC7pLdSU4iFCqnFR90Ti9aATzbzsn3ei3yd+2rMCTnYDctWv4EHJhLAe5hHrnzGHYfY9y4vL2+C54HYslQuoJ9L+x3ovcvk2SKryE/mjukdFCXzHZ+T77tqgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjNbNGWA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjNbNGWA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224171d6826so95303965ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744810948; x=1745415748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuecjTJBdrHJRxWaFPH44rbdDNmZKM0pos0/cFEH1wk=;
        b=FjNbNGWA8FeMRhs15Yby/fVVrrn1utyDdcpDdRLCrJFxNgm4t3yn9QZAVwa1Uq28Gj
         ixJomkMJ6zLvKR1ZBdHcDL0DaNL25esc4BEjj+njcr/6AMnHJhtyJbEElwOppsJL1094
         MlcbObKquP2IG90NsDrZMLSyX+1iFAWDw6uXvWftmyy5D3d5DYE2L+c3ZK3gl0bvKmDv
         57qmxPhVy7T0QD4g4halyudT7WD2BhYlqqfqrMhtK5bSNqQWUrqonxlJjS0AgPzESK5f
         b2YUuBAIXQXbXOAflKmK1x03H3STWs+GZQEUcbUycWb4N6X9KMKgi/MsknfVlOjnO0dF
         qyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810948; x=1745415748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuecjTJBdrHJRxWaFPH44rbdDNmZKM0pos0/cFEH1wk=;
        b=OmiVN6Gb7or6ZAPRyjdWxOSQM+ZJbzKwTgMRav3/G8Bl6BUmz025qdVoCQaCNMMT8c
         DpM7wf70qFreLdY/cSPrLTk1T1XlUv/O3VRVAaev6ejiz7Ln8Ya6OX9PyOUjfhn1eJtH
         1LhBfRcQcRzIjs0AUyV9cSA18PqQSP3/fLPDWFNyE4EjKq8bhWz/xSuG7KHUTx3n92Qx
         1OlcPO8h0hAgiFKDvtJps21XEXh8L2981rdI5UVwatcg5ntxtl4sGKIqXEj73ZQKRIJE
         BO1izNpL88pVOwrH/wPBR9jypVNhX6yazlbOH/t1+D/wAsWMxB4huzvpVuoL7NjTyd2B
         7aHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWj8F1I7o5V2Bz8pu2wWqbUv0jtEa6lMiLHibn+E8Rd6J4JlqF4yBaVwckTNf23Z1aHlKdBCCktHhbv4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3+Wb5Ei2CK9KuIzeG7qW/3G3ra84/8ExD1uLLPoCg7/zM1+B
	pHy7lk9joeC3+jypUvBjYh8MTyPUYrpXBw4vWphXR+fIjDoj/ErFDLeWXbow+7A=
X-Gm-Gg: ASbGnct28PGFgNFynGMzpcKV04RpsCMx0UB0Wlh5ERSH5fbuI7oV6KHc3/ejqhmj1ig
	yXI5R1LmEYvZoQR0QFRoQ1O6MPLCmU7G6f7ckTNNXG2MuXA87zWNkKWSGAichVgW3qZTm5R4M0N
	rcdFNO0MQb+6BT6Eb+O+DCZK42WJxjpGtTU1ngINfRrVfgWP5Rq+/Vxdi+E2ruvlOjPCJ5EUzTy
	n2WfNaweOCoTHdImpEvHmaH/tWIPhkuMJMo7VoaBDeOlHAGHsmYu/K1QMSY8EU1GY/C0Y5UwK6w
	S9bIG9WLVGFeYuD1bsYnef24TiDVJcBBQzGXXBw=
X-Google-Smtp-Source: AGHT+IEwy5FOLkAJ0EfNOEL/9P6Fm2u6tlEydriwYaUFEkB0sL4EQ7PpEXdwwDTUiro+AmEF7/iRtA==
X-Received: by 2002:a17:902:da89:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22c358db946mr30628945ad.16.1744810948086;
        Wed, 16 Apr 2025 06:42:28 -0700 (PDT)
Received: from jemmy.. ([223.167.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c20f3sm10335926b3a.39.2025.04.16.06.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:42:27 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: linux@weissschuh.net
Cc: w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: Follow-up: [PATCH v3] tools/nolibc/types.h: fix mismatched parenthesis in minor()
Date: Wed, 16 Apr 2025 21:42:16 +0800
Message-ID: <20250416134216.29102-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411073624.22153-1-jemmywong512@gmail.com>
References: <20250411073624.22153-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

I hope this email finds you well. 

Following your feedback, I submitted v3 of my patch:
https://lore.kernel.org/all/20250411073624.22153-1-jemmywong512@gmail.com/

I’m writing to kindly follow up on the status of this submission 
and check if it’s being processed or if there are any updates.

Please let me know if there’s anything I need to address
to help move the review process forward. 

Thank you for your time and guidance.

Best regards,
Jemmy
