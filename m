Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAD253F11
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904599; cv=none; b=gzEP8dJan0V8+x9RxHjzSe5aPdoh4AM8qosn7LpdpzDEKr8xHCXRl3bwB1iQoNq8SBxV2x+0VrMN+GnXIpf11k+Xp1I02X6xvL3fK158U4BJsN3F1DDcHdu/bjLWAfnbThvvix+OdyWW5bJOa38rrOX64fXhdmX0Ly/E/l0+ztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904599; c=relaxed/simple;
	bh=/ls7sBWqBfSenr7asANJeNgAWf1apqx+Udo/DkYWxjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tw+Kx17ODnnwfNzForasLuCbYMSBOcaxyYJG044vwTlu6W0+cy843KnGyn+NZXiWKkC3tQP3Tb5sWNIoKButgNGc1zPncyBXoP5gx0lUDeb4TR+Z+3UkR26MSvVze29Ki6EjOkLi3awYpaZ25OCschlpTKa5C9DdhIbI3lhSMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJ1ibxZf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJ1ibxZf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so911610f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904596; x=1745509396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcmDyccsNttBk1NEg+6hG3KCFS05A9O/iwmE0/V4rHM=;
        b=pJ1ibxZf1j/j9xQVMHMv6417BciZLIY0ejjgdAkmDi9j6/EOEVgZq3Gq/a7k5/zDQ3
         RwLlQiI2lyGv4vL+cHNiDPCjlbnjsSvBwA5NMRs7vgZ5v5cVcoivXFYJSatFma7ZGLy6
         sPhuWzyi13jQEx6LVQ/gsJKogLIHoJOVpe8ydvpkqu52C6q183uXp4MCx2fjtq6sllNg
         gzs/DBAA3jlH5lGgkgjNOLb+HTElqEFI9OgbyKa4X8kse/X7GKF0VYyCKZ01tKlhZkpg
         0sMDe0LpoDnNoSUnviOe+2ZOkCTepL1icUD0IFEYb2yK8Z0TvfVZ/wZa2N7wOw3q/VAA
         RkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904596; x=1745509396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcmDyccsNttBk1NEg+6hG3KCFS05A9O/iwmE0/V4rHM=;
        b=G55dwBs8qtZTNWFCUyLXkaYJ9+oO+l/QvJjOW5guo14V7zH8ZorGYbsa5dl57OwRry
         ZNNk1hnce4wfTSJpZtWf5i8gnUQanyUCU39yO3rf4TT847hWJNuoUfmvMCol/GPqagqv
         Ax/lVG72BL5HRMS+IjoqMsm5txPf9Alb3NeTIKIHneZVJTyKeOn8H6mZsBqatGqtVvXB
         WgmzDG5j40QZC2z3CswxqnqtwymGL9PVOjwY6vd7M5Nrrg7nj9CWRR+/7iMuU0Yi9G19
         XemBiYLxkCYHU3Oj2xIZBdhOdXzoc0Litoa00jdmw9CV4PS3bktRVUpe6UZq34vOpGbb
         znUw==
X-Forwarded-Encrypted: i=1; AJvYcCU8SU6Gp5XeAgjqm6zmV8JHaVVhsXxFc/YyByxj6jmGIsggBVPJSMj8b6JQWk9T+aYNncF1KCMULNTaOeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7kQmHslkGxdYvTL40DHn5klJlbPkEaiXufZxS13Yl8vQ89kE
	kiCBJV4SHhPGewGEgMgqJxZd8fzAzr988Fx4j8RJEG5uzhO0LyzR56SRz1HLpfQHnBMWRj62c53
	x
X-Gm-Gg: ASbGncuyuWHV+yIHD25sHHPxcVOJAgOH7QBX+q21XkLN5lFpwIsnVa0hNNGzR9tQAxa
	NSv3dlGneSeq2fmC70Af5BqwYuiJzfkN3bLUzyhfCeiV2uEnhQfvL4Sbi6SSoa1TBTtrryGVl+C
	Kj2CgqyIDwRX3ozFjcZZxXyDyIxnq0AtGiNVEU4BdDhWpefBnQBBxPSv22C4bDBCArLBGTposAX
	rOJSBNBsxKgPvELkv8qH5jio6KonNEro//969LQLXd+wuXsn7SWF2TckK+iadotlufiD4+XJkZz
	nwQ7aC6YdxAFDFhZU7dYrm10sF1GhoHqew0wT4uGjqCS6/VIa/2VlGDanWV9Kg==
X-Google-Smtp-Source: AGHT+IEU5hSJ6PQyOtWU4JcRiIyUToVqInBdR55ONV+0tTCpl+QOvuCPnUHp/XeMa+65tSD1j+KrnQ==
X-Received: by 2002:a05:6000:1867:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-39ee5b1618dmr5694942f8f.23.1744904595706;
        Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Alexander Baransky <sanyapilot496@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250414172637.197792-1-sanyapilot496@gmail.com>
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
Subject: Re: [PATCH v3 0/2] Add Visionox G2647FB105 panel support
Message-Id: <174490459500.1152288.2148667843889329004.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 14 Apr 2025 20:26:30 +0300, Alexander Baransky wrote:
> This patch series adds support for the Visionox G2647FB105 panel, used in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Testing has been done by me on sm7150-xiaomi-tucana. According to the
> downstream DTS, this driver should be fully compatible with the
> sm7150-xiaomi-toco (unfortunately not tested) without requiring any
> modifications.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Visionox G2647FB105
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a5d0cbd8b19403ededbe84f21780f70632d1e09
[2/2] drm/panel: Add Visionox G2647FB105 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3d55aebe257ec49f577deb7c8e4acb40dabc05e4

-- 
Neil

