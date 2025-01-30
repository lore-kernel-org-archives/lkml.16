Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6E1F12E8
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258608; cv=none; b=aMM44qQ9B3USsja5pqEfaIinoQXJGNLaQeCFcOrl2W1qfvOuiQZp7Z8ni9f71TnSRYFbA8OVNKXQYgHsl4LuC0omjX7CXKrq8aK9NkRLNSTtVs2gRf4r70c50AFE+sbl72S1myDcIHPvcWevHzAm3KwkWLLunhYrqHql4f36GTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258608; c=relaxed/simple;
	bh=fEvX637Z7c33Zk5WCEhwiVVgzZ0aKNk8OcHlF0sVoOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pf6dUsg0DX08lNz8V2r1aidXfTbsb2jlt8WWF86u1v+9a89uC8OmhFbDGDpgBLNonlbw/vhDn93vBzP4lW/YWL6VOuz4owOHqY2iIircMx3kxRaRB0D5oAP2U+2QJnf7rcDHvnwyBgIxLN4Mp2VfAsSKBrBVJSOSivGjRww+yUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21654fdd5daso19153505ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258605; x=1738863405;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wba71lrlJHRpHNYwCSUOMwjfSnFCdMmwKcitB9A/Re8=;
        b=jdlIKG/lXFCm225FGj3fBgwmu7pkeQsYWwGkPIe8A6xIgracco5AUC7+HbKZ1s+nfy
         H4EuLFmCQ4zKdGHMpzAb8cmGiZRBnXlNcbPu54Mso1S3vesjsQVoWZHOBHpR8Yv1cj8X
         viBU5CF5waHYnG8YH1BvhDuFdC6gMIyXcPNdGAccuZ08qYy+TSIzvfPvmnKBkRn5dsqI
         FP3jFsmS7T0gy5irrMkePB8f6gECyOQ51l+W5ZUW0F6ZQ/gpwK3ymGAQY3edKNzsEF5C
         8eN81c25w9caWc1bF5DAwAQmPqvUElQ1rRg9P4oR4sXCC8mRJzU0R6MiEbDIPThuWnd/
         J+hw==
X-Forwarded-Encrypted: i=1; AJvYcCV/JoHDM9an5128vORA8mKAPfM2sONXGow4i2WwB08LhkAKZpdgKF220rsp7Sjx5fXBNjSCp2ZY+VfA/QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98RIgzXWz7VhfXs/+WE8laajWuPpTyo3+Pp/w1unymXhKsMRU
	AS4CQcUoS8UjDR1eFYuqGnbg/Lc4LCWuYGVYVGLizOYfFaZFqUl0Svil1z9lO2E=
X-Gm-Gg: ASbGncvIeR4BEGmRFkiprHfU97SK8tJ/Uqdywow+JW3sT43Q0v2qCbltCSZNe9wyXH+
	upD8vPUMO/e5VhR9BxJPccPFaLYXV7e6bsUQ4qabItujIt3EZERUU99EtiaNTdSAhDZtTG38o+w
	VT4IBVqC+6q2P1dejix2N6usfbUJpwmjYmj4sGmVFS1IniqaeGD/R7tzyXXqhBEcrdkC0gFc2GI
	5x4VSWEDUJEFKIvHtuvcRXPOognfgDd7KbJ4wqcoP18oBrRwLGFBrUjmKVs1vc2wunmCRPEco8U
	WGV9R3skEmy5mw==
X-Google-Smtp-Source: AGHT+IHPgtyksfxV717Ovby5/EZ85xi1T/C77gVscvPLkijnPA2Hto/kR8guWoggO+GeixLtqrCFiA==
X-Received: by 2002:a05:6a20:7345:b0:1e1:c03c:b420 with SMTP id adf61e73a8af0-1ed7a6b820dmr14182766637.31.1738258605613;
        Thu, 30 Jan 2025 09:36:45 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe384272sm1423838a12.18.2025.01.30.09.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:36:45 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Keita Morisaki <keyz@google.com>, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 lpieralisi@kernel.org, sudeep.holla@arm.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org
Cc: aarontian@google.com, yimingtseng@google.com, Keita Morisaki
 <keyz@google.com>
Subject: Re: [PATCH v3] cpuidle: psci: Add trace for PSCI domain idle
In-Reply-To: <20250125013145.1664062-1-keyz@google.com>
References: <20250125012734.1661860-1-keyz@google.com>
 <20250125013145.1664062-1-keyz@google.com>
Date: Thu, 30 Jan 2025 09:36:44 -0800
Message-ID: <7hy0ysi4pf.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Keita Morisaki <keyz@google.com> writes:

> The trace event cpu_idle provides insufficient information for debugging
> PSCI requests due to lacking access to determined PSCI domain idle
> states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
> idle states the power domain has.
>
> Add new trace events namely psci_domain_idle_enter and
> psci_domain_idle_exit to trace enter and exit events with a determined
> idle state.
>
> These new trace events will help developers debug CPUidle issues on ARM
> systems using PSCI by providing more detailed information about the
> requested idle states.
>
> Signed-off-by: Keita Morisaki <keyz@google.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Tested-by: Kevin Hilman <khilman@baylibre.com>

I've been using some local trace_printk() to do exactly this, so I fully
support having some official tracepoints here. 

For my local hacks, I was trackin the state index as well as the state
value since for quick debug, I find the index to more human readable
than the state value, which I have to compare with the
arm,psci-suspend-pararm from the DT.

Anyways, thanks for submitting this!

Kevin
