Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC51DE4C2
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748049958; cv=none; b=XQYzR8J8WAs5IzB46iPlx8zoCHy74Oj1oop2YBSiKN9TTa5xHCcCa++C4IeYsvPUng1oOakk2wMLWIjNk48ftDPy3hBnmJWEMDuot8uUy6grHHqjyuVEXRPgEjS4JpCowKRF9zbq2I3eg+KHv57MrVS8S1pphe2ZZt3sX8TcaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748049958; c=relaxed/simple;
	bh=l1ZDZS/SgRZKCVPpw+35tAdRnJSUkZtdbbKhB270Ijw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2pRYmRrZkEPlzohy0M55/vDVEVkzop5ZqXv7PqtgzJRNLMKEMZpfdqW6LCoRl/n5xGamfqo7XNBzHnxcY2AGkKydkS8DcJQcFq9Uu5hp12dP6CSgcsnsPPqN8UqIUz5+vR4+icbyLTP11IV17OrxWRlR3KRGOi/eBIgGxiZdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=zNoI9kDz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="zNoI9kDz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso472854b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748049955; x=1748654755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=zNoI9kDz9zZj0CWQUwjYqIo8oyli45+NrwFolMv8e44TFIzdWQsWPrvtWRFvflHLOC
         IPMIRkAqZpw9iF0yCPeH3YifjnyKCTFVNwBDMS4vEDl+H2wqhl5zPn1Eeko0Ot+pPW7X
         Gnz8PB4HEq46BxVoID3khIgmA4+VNpiuhCQTl3Xtd6jBrHxAh/DUvOLQ8OzstcACj8/X
         hafRu7bHY+lPFOH9wNGCMVrbmY9IsLOcuWHYwmsCZJsqOqTTnPvNX/QZ3Nq/qqZH1dl5
         b513lwx3IAAVg+F0hrGm3zUfTSzX3RJvVhmN2LkDUE+j5vxGmjzmZO92+GeA3SpSQMtg
         q65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049955; x=1748654755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=n0phACcSOiCjPwD/E5ARVbysnCy9u+35pxskqlFSUTEG5bF7qUtnYa9gFrV5k+7+eX
         uxQfMYlU5fab6ioS32L30r0SiFZUOduy9sHf9r/Tr1Y1cYqZhQBWzWnGVPlVwn4Fz551
         1umHPUrrI7fQtdJxqehaIlQXLwXmUfzExzoegdUbyl8IQg4g7asrlCVSOD8iEuGX5XiR
         sRfLg9M2Jml6oyI+XiEja7Qdu3hVc7iGElnrb1XepUfkStqM6rIR5vTzpZgitvbwuziU
         wXQ9s/q5Z0XLediOGROHG3pXJl5eCttFue/JlfB+Hm6GAzdxI+H2CVX92q5U0lHXRfMF
         G7HA==
X-Forwarded-Encrypted: i=1; AJvYcCWeoy7uX1ym7Df5vX9SowzxaF0o9RCrPwRNurPWPdzFQoiNlWvbjt/sHOu1u8nHbiJLkYv8PaKWsKF4BRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmH08yqYQqLplrnZ/Ljn7lng0u9TNPL87g9Hq/AVZLYkPn+fX
	S9KeXgMk8hdYZHqS3y0aU3jZght/86Ip4E0COgpdCEttoQ5jsMPFFdto6iM+deT8DSY=
X-Gm-Gg: ASbGncvQcOKOkpqSvCvt52mZ/xBm+kJ+od1H/usm4oTKd7wIAEsISP/DBnetYYpQqPC
	SQVHCWAgqRuS1Ct6qvkRdTom3el9xOJShv8/tWdD5iqSqvjwvjgzT5qQX25Ad6cdeVn8H0QuihW
	730ofQdntt/K0hcB1EYLUEP56PDlBtszO8WBWbfv2UKy5Y0R0il8HiXr/2oC9atXgs+/BQx5Mff
	WXU4fydNYyFq2DtUm2XboNpvtEbVyRTHThDyrIvi4EF7g+44X9jsM/71apMCV19inqE+XP1ijBb
	YtQlQlgxMnY3QShbG1/LRhJf+aQQE8rHkunT9Ri/7nyzmqAaV3DAOSIBdPdt1t0=
X-Google-Smtp-Source: AGHT+IEOGeOW+PhuQhUWHpeQcMcmiGpwG3vk6rjPFlkV6C76xF/ii0bBJjaE1/tPG81FTngDhnjmmA==
X-Received: by 2002:a05:6a21:1089:b0:216:6060:971d with SMTP id adf61e73a8af0-2188c3b49bemr2223604637.37.1748049955462;
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c208eeeeasm195364a12.13.2025.05.23.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Date: Fri, 23 May 2025 18:25:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aDEgIfYl2f7zcO3O@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
 <aC+mJ560HbscG38R@x1>
 <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>

On Fri, May 23, 2025 at 08:25:38AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 00:33, Drew Fustini wrote:
> > On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> >> Quoting Drew Fustini (2025-05-07 11:56:57)
> >>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> >>>
> >>>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> >>
> >> I changed this to https://github.com/pdp7/linux.git but please fix it
> >> next time.
> > 
> > Sorry about that. I'll use https in the future.
> This should be kernel.org. I remember Drew we meet few times and you
> never asked for signing your key. Just get in touch next time on a
> conference to get it signed (and bring printed fingerprints).

Good idea. I would like to get kernel.org setup. The Portland kernel
meetup is next week so hopefully I can get some signatures. And I would
definitely appreciate your signature at the next conference we are both
at - maybe ELC Europe?

Thanks,
Drew
