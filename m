Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA082C9A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254063; cv=none; b=ZDvlLvTIhMVntfeHgKCx0xuG7E/SRwRklxbO+CM+Vdojrf3dUUnI476NeGQVA3yjCS1emoaMYvmALEDD/6+8vHOhRuhFOat7rsh189O5byrBl2ZNDqeu0jdWKLuYPFi5Tl86+FfDJ3uc5tknLX2gYV7B6R7gjLTLHNlr3VijweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254063; c=relaxed/simple;
	bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtcHK2abM9SwtAf9z3cvTRt7a4AqNYaYKmC6DBSua+WvKgJzweM7wBGLtvzDCnHh7Ky2rK3LI1EQ3hx4wdul7DhaAcYWdLFIJ4BEh7xhTJIACP/Ese/ZAsFej0x76ndiJUGxwO3ibVtrb/EgyCnj43+6+qX+tildcwsIAKwQUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emJ+bnDb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emJ+bnDb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f6d2642faso67472245ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739254061; x=1739858861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=;
        b=emJ+bnDbKNJ6H7GtFai/d1w+pAqskZruur02pI8MgSDII4M4OW0AGD6Ncz7rYAVOH7
         vYUSgA9a5CeVXsH8LPvkYqyEC+2E9VmHhGmVWKE32FFT/o8f3Yh9/Rc+4fwWdUnoI+cj
         uIny34iezDwYGVsKZl3b7HD7+fuxNVrjagfbyfD2me1vLUOSO2PBCxGSZvvO/bqayyrq
         jlhxdrPLvAuAk9ZlRfyHZWZ6dyRolGT+RS5tnnlM7evvWnykOLeKssVA+kdvbE2pQY6N
         pVCurW/TB1EY9s3V7ErBq4Mo4necxvDoJJTZRrOf42UnsixV6LLIdqtya13pNVZrIR7x
         yJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254061; x=1739858861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=;
        b=kexySMizKW+REXP40fCqVeX4F5jnsc2LDCHKXdHHt1Q/HICsvHHPYA9x4CUISmubEi
         d7g3kawHEYFqMfUnR6Guo0upGR4j40cOSdQslbavKwkAgHDWsjduxCSKiQ5tO0bsrOL6
         dmsZ+6QzVdwaBMm7spMBqPZCMDNY54EAkHehP88chYG+CDfoT1QxqSVCtdKhl3wpj3Ko
         3ZMaN6qbE3nF1CLGioR0V80P05AnfDcdRJq2q0tQKZYWRJoAobfgVPmnbFdthN+fpb0P
         DpWSvsxdwJFNyJbebnStCfm28qkB9ldGpW/oldntYKRu+2XXuLcX1XPRdQgH+LJuRTCR
         SAyg==
X-Forwarded-Encrypted: i=1; AJvYcCXbx02dSbF0y/vFkuR5sI02avGNGGDzfAPAjKcuz6zmeiW/dqz4TVSErDd1tJ6borCfKO/VuMHOeR7KcHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9i3Tt9bYzlkKsk9wYo8oGkkw1rFLK1c2YlSRNqXVaqHRz1lc
	wkSZsGwHJHzq7gETd1E3H3gLX0VjTFQQD5FfeYe2ekeplZ9ALrCY
X-Gm-Gg: ASbGnctE0FivXDXx6IajVZr/bGxDIJlREA+0j2VqzJ6jgxV1h2Qgq9pln32Q+KyhH7x
	0CEXnU+sp/Z/Y0BM0TfH6wanz++imkkbnO/nGXnPLPZbih00jBR2VCFtSDr9482nPVJ0dM3XpVb
	Yw6oXyKuC707DvOSm3hzyDm6c8gXfVsZHtz8KqDfp3/3cCiPk1ZwxFSY6Jq8mw/2MZjgEQwRimx
	K3PgJOhxxNYzYaJ4/fZfz2yOPhvIfszo4d0J614L4xFxZUpp4r8sdk01Al8G1DB9hyDdkkLyI8e
	BlXHbwwEzyK3LD8aeMgdzr4LypDkCnziHFaRUBQ33XxGXw==
X-Google-Smtp-Source: AGHT+IEXZbVvFHUebNOQTZZuCtmrL4QARTAUGAoCZ0Io2NendW61xrPGBTihSLTOMP+6ldmhBpF1jA==
X-Received: by 2002:a17:902:f60a:b0:212:63db:bb15 with SMTP id d9443c01a7336-21f4e75e5famr272057935ad.38.1739254060656;
        Mon, 10 Feb 2025 22:07:40 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683dc35sm87436575ad.126.2025.02.10.22.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 22:07:40 -0800 (PST)
Message-ID: <5d82d549-663f-4438-922a-6831e57e80b5@gmail.com>
Date: Tue, 11 Feb 2025 14:07:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] iommu/dart: Reject identity domain for locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Alyssa Rosenzweig 於 2025/2/11 凌晨3:39 寫道:
> This cannot work.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Janne Grunau <j@jannau.net>
The submitter's sign-off must be the last sign-off. It appears that you are the author
of this patch, so drop Janne's sign-off.
[...]

Nick Chan

