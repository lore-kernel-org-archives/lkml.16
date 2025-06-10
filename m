Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CEE28C2C2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550780; cv=none; b=hA+5zmyuKCiHSW10yof8OdKiQYag6wL8aLOTY59NlD8PyGACixg/vPCB6jZsXRDAsB1g0zT4jQu5Pg795KdkzmllMV4i8iOzpctNKZRCmsz+pFhlmGn4IbTGv7Qijct7mBYkUciXKAP9tnnudqSlHd46aSSR3gTvi6H2eyFfMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550780; c=relaxed/simple;
	bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvV+ZKqfWE1Bh3po7L0rIRtIsqLhCSpkEcQEPji0ZdH2EWE98Se6lyHCl+zCIqMa0yoU9g5VAn6Y8sjYSWocOTmlL44KL0ltBltZq4RCyhZmOCp3VKlRhoyOjRHjHLTwi108xr/XWWwzXNR81roes2UWkka7BKjMOKRBBffPckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=l752W+Mq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="l752W+Mq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso10692493a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749550777; x=1750155577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=l752W+MqC4wFs5OC2F3jkrCncCms1IyZAKFeX1DjiSOfhQQ27N6Yv0UiNSBdbd1mGK
         Z1xMBRBBfZG2K95i/R0RIh4OI8o0L/yH1nFqpJ2+qKHmCBSLsCwtjZg5wXU6GRYatkMN
         G2eoCTshp4JFLJX5Rb2quJycS081W4zfzFtOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550777; x=1750155577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=DinmkSsP/86RwCvdTi7K0KNp6ek2qCPVoLM+nz3Ex1Lofg+4Iml2EKfouamsBtWb53
         gvQfYBrPokfwlC+19zFRZhUFKT95PVTxPYrtCABaM5V/vkJCcv6IPunvfxDEtpbKtq9Q
         sKRtl+S+Y0P92jEv5596aYe1y78fyJ1fGjzhBKdMC7t2DNS/zbJleWVCXwA/+2+Bbit3
         NSUB/zk7nBl2x6UiDUmBQpOA2jYShWZHz4UzDqGRInOTZaTyFwcQvhBl3c9RExEP1mht
         8U+3XNbjsrDMPfSvIKerZ9ZQN+uNJXIV8rG1nSLOWWHpMnDxMCHD4jIbVj3motEhC3VV
         o8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgG4C980I1zvgULvhCguwaQVzUTrFK9utPRLBY4A1so9trDdm0VuhCKfmviBE9d1TzbaBubDrRvZuA79Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHNkrLOBMLLRBhMYFPDITN6zL5SYcVVr8QHXptt2nJ758EobDv
	rOOFZaqxkqZkFmgRxiaPxwSHt03BN2eWVt5NLdVc1Zn5cfmoB0JoauzMYy9quaiZ9tY=
X-Gm-Gg: ASbGncuBCxSorVBJq0O20iV00/5eph0qpuq8YxyXKXbxYN0wEY/+eGhlf3cZOan/Dky
	188PmOypq8FVnna6kaRs7CE33MwexQ303Zr7jG3qsnkUOwI5qJ4QyHkEY6ZK9Fxq4lrnIaAucKH
	Jpxm9TC19ObolVBlJ29OhATov75345Su7zCzDuk2sSiVytLQ9Nr6+buT5DWzFaGE5wLb6Q8SveN
	MjWoV+4wXf0aYrYLXPh+5G3az5Az26Ox0sZGXLBDS8h4wmF2wfz1Nqd7cdoch+W3RiV14qc/CXR
	okxUqP0Elv5DG29D/ZSwlkE1usVxOsylPvSQae+aah/8LNQhU6A/dIOsPmX9VuDjPA==
X-Google-Smtp-Source: AGHT+IHDGq+r2IlKiecsvDQCxKT8f5zu0ppTH97cYtt7W5yjJyBOo4m2JwFoDG0lIxxYNFZqnFnEIQ==
X-Received: by 2002:a05:6402:26c6:b0:607:2a09:38dd with SMTP id 4fb4d7f45d1cf-6082d9b391bmr1857192a12.18.1749550776974;
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd48esm5869944a12.56.2025.06.10.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Message-ID: <1eef4644-f22d-4c5b-8cfe-843ed88c050c@neon.tech>
Date: Tue, 10 Jun 2025 11:19:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>
 <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apologies for not catching this. New version here:
https://lore.kernel.org/all/a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech/

Em
