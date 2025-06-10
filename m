Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2A21CFEC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552716; cv=none; b=oLYSFOGoFQuuV6/kSr/IbFg6n2bMk3zIHgNfZv3r8ot8YE2ezRwJZeETAEfAKSxb2hdic+urUXJoNqEQTzCh4vidqf2LgRNsZyqCv5TEEWSIZl7HLczwd7gp3bYxR4I+q98JErkkE/8/jyRqEFTY+N71a4JIN1GELd2DekqmDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552716; c=relaxed/simple;
	bh=BpGOCGjfMVwXLTb7pDRDKwkdHxA+xvVJY7qPvU3osOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PQ7G9/oBuwDOH5wrC/66v0b4KxvnbRFfg585mpDlX6PssQJm0e0El5IEvUCNqjicKCCm5ZgnupnUDQIZ+LdqhdLIZMOGuyFsOD0OAEuunfO5QXhZV2niuwTJGB64Ehg9714a4HQEENmV8mwQL4ZU5EiNXZhlKQQQV1mZqLSSN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=CbSKoD3B; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="CbSKoD3B"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58ba6c945so88629671cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749552713; x=1750157513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBzbb0j4JDUNUzQL10G0m3L9NxDCF3vqx3Mg0oudS78=;
        b=CbSKoD3BrC1pmptwc1fYsSAipOt7ZTmTO/IbJ3IkWr/WWBK0an8COiyiHbTbsyaErs
         VX9AUyGrD9nppqMkYaXvaW/Kq5T2lubEqrlIrKKVib+xq2DD4tYVo26m921R/is4n1T7
         2p381ElhMPVxJKR2RJvzXG7qgKCnGBZdnUY1kBiOh+Doxw72rVMHqnTs13J9/Pt8W8ah
         Nt8KJMJhN9Civh7E9Y5lL5XqJABnlCDiWBaMmXVv02hsENdW32hZwTSppNDveBmdeo/+
         7MhYiSb437mQPLLm7RjNkrpZF+pZsBN0sbDhDH9osxVS/7MOBJZEDhVrZ9bdiM3FZWKY
         susQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552713; x=1750157513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBzbb0j4JDUNUzQL10G0m3L9NxDCF3vqx3Mg0oudS78=;
        b=Y+ayUtaHgRf9CN5MRqukv6j3+ZOGjVaKSurKB079nJeWiqEtSlubcR/ABrlggjT2bO
         6Nm6G1e2Yp5/SqC5bL1tmcSWaCwr0Bc+Dt5vA2K8Qzq4x1ucqtS0upEu3kryAKXl+3ne
         ktremzDOlKxqgSktpJe+VOEZZ5Q7irQg7xxNOVvj3UtnX92fqe91+RT2ds+lK0x1zh0D
         y+J7PbZrfohex3Wr4yfDuy+Drl7M3Nb46PL9ZnywK3TaYUte0DQ6XTp/LhUKO8VruEtY
         tr+Fv2gkHcdOihZYCvr8fb7UFzGPHwkMcu5Yaxr/MXltxXhhkVotSx7+p/DmphJG6+He
         NGyA==
X-Forwarded-Encrypted: i=1; AJvYcCVXb1kiOWqR7+5rcDiH0lMkjV8Tl5abjJfeFhqq3zRi+FPFgYJgwrVCEhEHbEFpLDttwgnBVz/uqTlyV6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPm5LrjsddtC9ML+yQ3kOGiPm/btJrbhC6cfZvOlO1wEwqC+s
	WealSLcL8n/Nz7YZDPNnpwR3tmpp51RtbJkRH+/InRXITeYfxhlJnQIuHRunhXPmHbonKO21GSt
	hjQwu
X-Gm-Gg: ASbGncsPygM2N9Yd1y8rs+lfOlQek6w4CPUFKpsx/tyj7Q9BnXR66LkEgqL+WZEMLBo
	sEyUxjzP1B39RZElXV3pKSo0HWDMGXoX41cjjIz/I+vua1xDVCYPJFfdTWyRY8KN8Js8KmYoHwx
	iScV2rr5KDC2cFJX6mlDhkjDXYhFROHkDmGUzt/nCK9DLKOVQo0Dz8+8Q1XvxZK7Xj6bzWqCTZX
	Ydni/m6m+q16dlXG8ZWtjTZbOt9x5CXaLGaUoAYbBFl3eORjbOiV0Hcx1QJygZ6G8FWbfoS4xPy
	y2oDh3viHitpD+ZWvIHzpmFX5huqepW4MU+z5R582OFN9/i9XVa8TuqtNQJ6hEAe1CD5Z4RwkvC
	yANCMag666JqPBcu8AwaW7+9C5e+J173aBgRp6iJDCz8Ry3xg4lv2jw==
X-Google-Smtp-Source: AGHT+IHsRIE9+ok5ecCFJYm3GaEvcQAvlGCjKV9hMDLuhdOPy6VEujh5/w0caWC/jaE8aj9tt3UXTg==
X-Received: by 2002:a17:902:e5c4:b0:235:ecf2:397 with SMTP id d9443c01a7336-23601d70bd7mr240122475ad.33.1749552701532;
        Tue, 10 Jun 2025 03:51:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405e7asm68484365ad.171.2025.06.10.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:51:40 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: krzysztof.kozlowski@linaro.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: trivial: Add tps53685 support
Date: Tue, 10 Jun 2025 18:41:46 +0800
Message-Id: <20250610104146.250692-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <99f846c6-4041-4d68-b2f7-c686aa8c2bca@linaro.org>
References: <99f846c6-4041-4d68-b2f7-c686aa8c2bca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On 10/06/2025 12:41, Krzysztof Kozlowski wrote:
>
> On 10/06/2025 12:25, Chiang Brian wrote:
> > Add device type support for tps53685
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > ---
> > v8 -> v9:
> > - No code changed, correct the order of Acked-by tag
> > - Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
> Stop sending this to me 6 or more times. Every version you send multiple
> times, that's way too much.

But how do I avoid sending to you even though I need to send this patch 
series?
I apologize for the spamming due to familiar with the workflow.

Best Regards,
Brian Chiang
