Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EAF19995E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672568; cv=none; b=HaWGvh4zQUw5YY+DQHwQY1DvMYO1zvKot+uqK+ClM2oU6nJWODAASj3GuVC7QhTNpfLRH6yCZ64wiA/8NY4nIlkqyubDiAiVFpoDbKSTEiP75ScVbBXewlr8JBAt6wm7wAGMR8jo7DAUFULSL66A8HQrpbxVwamsixioRIVve/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672568; c=relaxed/simple;
	bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElZt3I+KlNuFibFCjaj8ULclvjXnho4VcY8ws6HWRKQktLlci4R8UZOi3WsQzwDw4zywj9HJRyN3Ldfazvc7T4ieFXGdlhA4OkPgXrALdSBmM1r/9u/11aSxYT3OU40a401em5dCxNJLXuqf4z8pD6HlwfBmTtTiHpWHf1UlZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4nsliAQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4nsliAQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22438c356c8so54579985ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744672567; x=1745277367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
        b=U4nsliAQMyUp0LtxoaNU5XCSEeZwZrNj4/NeL3nMPsVrZ2GLYMw8pXJz8oaOr2ZaHB
         BHzjW+OUjK/O83PFlYi9sDSr/lxsoICZB6bVAz7skK23xi0lFDbcPRcagW03HZwwDXc5
         wzgCg7zcZ/PJrUVs6Nm6/NDlb2bbp2deTUoD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672567; x=1745277367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
        b=dVB2W4lS2PbpA/3pwF+pC2/e7CAo9bNugst0N8VV/FBbA+HfvD+7AvAIxVW5mP5hMd
         AjU5KkoNyl4cinWu7kh9QaeXaTNARidCiT48Znne4rnmK4eeHTFceVSpiF+94XzTUg38
         RomYpRCAYeBFZGz8oSlCsOdPfdnQbAhXnfBjD+oYSk/JF+q8xUkmRLyVhV1g7LHB2siT
         VAlmnFc3mu2lcXsyMjfWYCddw0IufGbYyyMdb5janlpbRrye31ZIlTo27q1A8nDnExzf
         kpr30AnCorn5bpGZgsFmSYKoXus7MD9CwDRTEWcbSZ6Bl7RzpHt4tidoxBT7+F3k3QiK
         u6wg==
X-Forwarded-Encrypted: i=1; AJvYcCXWl3vWUctBQo3re078iqRBGGqQRCTRmytokdWfDE2RNvHfK/mGnD7RxwWqpP0MHokZUS8DgUX1NrXPbBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuE48CLg/TVi2i+ck3r6vWYjD9DwhAInx8m6YsHarMj3XGh0nx
	TN8MHFeAlp8TT/6U9uV2yeSV2pv/fVrIt891UZLyrh8uZY3nb4/uqNj8L17YdA==
X-Gm-Gg: ASbGncsv0M9Vdze+1vNpExi0kCGdVt58Xe6fSuMMFuoZJO1PpXMY/HNHoLOO+aBJYYk
	r/yFvzUNDRiVt7XC5p7eoRZ/eZg0bKOVox+s1kVPNuIZJiDfU0TEvCilM7YDdJYYQUQ0uqh2ZNM
	vNEibIWYOmQFMPqjf05bqVyoAK3Q1GQAGBMGrpITw63T1PRl3THCqiJi8CPwImu2L+/4+XJN8kA
	fPmUx6TaYafYNgWU3JeokzhltARTwssB0beYfNN9oTBLwuQjPkK4S5+lO+Pxktpv2aHRzycIzTX
	Qjrt3905ZyPz9ebk1j8P/m0J0+Xocyq1ndeLWq21UU8UyA92ozLIr+s1paVgOR1YoWfwjEcaxDR
	ozA==
X-Google-Smtp-Source: AGHT+IHXVC2msS9Lv6MHRlDHgQ+8UmqZCQExOC+5nUPQFdZj1WNEowXz+rxUvsT8W2cEg963akZYUQ==
X-Received: by 2002:a17:902:f64e:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22bea4c76acmr213874215ad.29.1744672566799;
        Mon, 14 Apr 2025 16:16:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21e1f66sm7163929b3a.84.2025.04.14.16.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:16:06 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:16:04 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org, Tsai Sung-Fu <danielsftsai@google.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <Z_2XNM6FdRIvDx38@google.com>
References: <Z_WAKDjIeOjlghVs@google.com>
 <Z_WUgPMNzFAftLeE@google.com>
 <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>

On Mon, Apr 14, 2025 at 04:37:23PM +0530, Manivannan Sadhasivam wrote:
> If you look into brcm_pcie_add_bus(), they are ignoring the return value of
> brcm_pcie_start_link() precisely for the reason I explained in the previous
> thread. However, they do check for it in brcm_pcie_resume_noirq() which looks
> like a bug as the controller will fail to resume from system suspend if no
> devices are connected.

Ah, I think I was actually looking more at brcm_pcie_resume_noirq(), and
didn't notice that their add_bus() callback ignored errors.

But I think pcie-brcmstb.c still handles things that pwrctrl does not,
and I'm interested in those things. I'll reply more to your other
response, where there's more details.

Thanks,
Brian
