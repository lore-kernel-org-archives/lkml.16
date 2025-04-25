Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577031B4233
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569879; cv=none; b=tnDVOdmJYhHayO34rLXFmVkQMQdL/RrVWOPdfwupGzoLyqwW3mcBxuK35NzLrnBog4GQew9gamu9gi92Bxj/5rJxMSVBqEmIwyMBZ/3BMO4Mc9Pk8T2+3kCHR1RrURRNOKZ2JylWzyyqn0JhITdSgiTTETHpy2TIB3inEQ8Ttlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569879; c=relaxed/simple;
	bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLel+7nDjU9Sawx0f8SYuNmbZpu19E40AaxiIIUGSVWVKYoXMWFUfV/Mwf6NAnsrcOJ4eA0Qei36PJnm1fN8qhb71aOPXe7nPxedafKQyUBuJ1NLkEyB1Vuu/QFe/YyW3AAaUyBilSlujbvufrMXucUG7Udc7dnqdFWc82/ImKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EPY8U5tE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EPY8U5tE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1525371f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745569875; x=1746174675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
        b=EPY8U5tEQtrp3EcSGeKWD4xmj8krUF6GQO42fEwa+KPHRL1o8oOH7NdMm/wh/RIw5K
         Md1ZqUogx6YubRVE5BroxhNJaRPnBEk/GzvPBfq7L+oFxqcR1pOEWpZP5mohoXTpx23Q
         pnKaPccY+iub7SI+BG+7RiQsaKIi5nIsNUZyQ/EpdS4fzQqSKqcF5b3PLnd5FmX9F4+u
         P/gxIJ9w2Xf5BhhcmGwkd8T9nC6KZebCh34Y0di6nr1J0Gl7TuohcCLegln5r72iwcMU
         l5+netCqGLMMOBcEUJ9gAAqaVnbjVmATQYBNFtnDmT4mqL7KPk3ljhHffZj1Rj1IcMv4
         fj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569875; x=1746174675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
        b=s08xKra/gc7VxqSROlgfLDvZlE+mTmT6rFh+v2wUkdJo+fQhIfsMCPE916wCxxorjD
         USDop7Z0qS8AOm9tDTDreO9huvv2r9Gi+9M9RIvh6vHhNF7OgOCDBkseVZrA8lM4Lu7b
         AAt7jiI6Vc3RcyWuBJiOUPK9N1N+DpvkENOPpw/U6dX4baqSCYETwzD3yubZ0iYlu9Se
         tc7SZj49vLLUzhzevWS4GH5f66wQQeYZrMeVPizGKAGSyAqbIKW/HeYGXNxkJQiEU3cm
         D2/UX6Ifmylnr7A8sJSg1ydlSkvwD4ipYW0SMYtDpT0goXUAovOYXjpXIBTJAB0kWLDf
         o7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXVJrnKW4zyaOzgZ3sefVYWDNQ+pos/k5REWuhCKNDwoA+uuNvpgYAx3zfI88l8FJ38O4ND7H4Gk4v1z3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMEqK13ehTl5sBBosYXMX++4z8t41XiSlQgvFAIIgIscJDMrz
	JGffBgYLl8etYQ2Ez5BvzykW6Sgmh7rMZdOxSeAeDQjwut71pa8WiquLL29OaOA=
X-Gm-Gg: ASbGncsNatOB5sKFY0k/UIqKqEgKpAMy0ws68X1eu6olRBMTctkj4L6FMB/6SC5bWj1
	mOCQo7uDOtIR6cybAtMSh+y+DizmxzMi9x2pU1z40S12FVxakcIT0FirmaI78JsVuz9CQa73W10
	D/FfFXibyYx7OE5ZRgBJlCCoL97ROkHBxomfFodsGI9IsZJFlbFGjJn3FZ8Q4Accwop6cEOMrqW
	4eusaGbEQ7+sE3eTr8QurSg6bw9Li9tozdcOL8HVlL6TVsvOWS07W7kaNIp5ujSQN7CJEsio0eE
	jFvBXoHeCCWJim3c81Mkh+3l+ZiSu/cBpTo8K/d9cXyp1i/dp8n/XLlTiUfswQvB
X-Google-Smtp-Source: AGHT+IEGdodZj4yj6zqoEzlVTRVZPOKQ82CqHa0k8vGppZ4HJ5qkzSOxRm+naS8oNRD4cB6uvhxdGA==
X-Received: by 2002:a05:6000:1a89:b0:391:43cb:43e3 with SMTP id ffacd0b85a97d-3a074f39839mr1164197f8f.46.1745569875556;
        Fri, 25 Apr 2025 01:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm17104625e9.8.2025.04.25.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:31:15 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: marco.crivellari@suse.com
Cc: anna-maria@linutronix.de,
	chenhuacai@kernel.org,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	peterz@infradead.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
Date: Fri, 25 Apr 2025 10:30:43 +0200
Message-ID: <20250425083043.16671-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-2-marco.crivellari@suse.com>
References: <20250403161143.361461-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping.

Thanks.
