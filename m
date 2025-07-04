Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3F31C07C4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643009; cv=none; b=kE9/w8gvbHk3w8UBkFCW5VVNT+v8ox9oBna7vWBYpAhjJ9ENxoLUYYXTYoXP/LOfnNZiVa+aaHksHb681fwQMMHgl4YvSi3F0iruby09CQYB0UvjU+LS9pJlX9JDKCUtgX61vmEC+O2zqJcU6//spESLmy9F8H7J5w8lu9DZaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643009; c=relaxed/simple;
	bh=ekXqeaZ+sbMKeFzACv+Aej/vqDUC5Wkwzfw3Xowp4z4=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=uDxRmEaT6HwUFBxI4fe2YyBliMIOzrY7L35h9WEmBO6leXznD1IoUo+ysTDENdbwmMAiXJN8y85tJ2f1R/M+/+h4dFv3r/+HLwbUGxx536ZG6jDXBXCQdAEnl3ebJhqdMEkGCplvodTOGgJ9LvNuk85n1f9fNPEVMViijx5YuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=JUA/N1wA; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="JUA/N1wA"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5647IGcl164149;
	Fri, 4 Jul 2025 16:29:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=3
	e/tr1MQ5X6F+3Xjz6MhIIh8rXhLQCGZQFsuCvAv3EU=; b=JUA/N1wAIf1DZTPQn
	SJDKjSqPtiUYtdYbmO6V6XHLmFMGaJMP695TaErGuNaXru/+gPVbSzYKjOTwVgV9
	8oQs4dSyFZ6EBLj/4HHuBvf7RavebywHufC33QcknXV8CmFUS0epbCiN6xk5OkIX
	21gC+lyIbiJ5Z0TOAEXWoyEOZhVUONiwa07xxwvDBDZH/aR26C7Fui0oibvXqL8E
	PFGYi3mj1pdsnmT+a47NgP4GJ0eUFeiRe4EPU2JGEBUl5qckjTyEHyDbim7oQBYO
	jprh0fKDQXW9qvwiSe9UvwOAHWUv5C3MsQhQnda3zZjubPtfqhX7lBzszWyRmbby
	tMh/A==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47n1d91up4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 04 Jul 2025 16:29:40 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.125) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Jul 2025 16:29:39 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
References: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Clear runtime PM errors while
 resetting the GPU
Message-ID: <175164297965.68064.9466068700510801982.b4-ty@imgtec.com>
Date: Fri, 4 Jul 2025 16:29:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 2yiag1doPMQYHXMUnLETdw98OiuFh3ou
X-Proofpoint-GUID: 2yiag1doPMQYHXMUnLETdw98OiuFh3ou
X-Authority-Analysis: v=2.4 cv=JNM7s9Kb c=1 sm=1 tr=0 ts=6867f364 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=fFtJDOQOLN4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=r_1tXGB3AAAA:8
 a=FLNaFda3mgrzrB3-JzIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OCBTYWx0ZWRfX+iCJwlH/rUVU
 U7p/r9hzZ7rqnWKRM4X7xabKi58WfbAciKFrAmvo5bfSn+/Me8Fzacf1yYoFVicF9ng9R2ewyTi
 co564QGB8+e4NoUuRLNkY5VMxGcSU4w69e9E41VbmkfIF8AAytDtylX06AagH44WZYZhgvpv77f
 9Bz/k1pMSmkgQxKdkGlyWEnnZUXZ9L0pQNV6cheiD/3HFvW+tJQBvEONsGVqCPTd4nD9l+KBrqf
 /2j6ZXpe6Jx/jtXNIMSqRWgXK5SCKZtZ9cEZfzEk0yotpAS13pl8cCQCeMsnWD/1EzGIsiAQnrF
 qCTaODFDMYTa/dUuxRVzOh1CfsaYVyfzRvD2jiSbq74FGgHQzPC272sJmpPyn2hQWwEARS9dB6B
 J1wErhSz


On Tue, 24 Jun 2025 16:01:31 +0100, Alessio Belle wrote:
> The runtime PM might be left in error state if one of the callbacks
> returned an error, e.g. if the (auto)suspend callback failed following
> a firmware crash.
> 
> When that happens, any further attempt to acquire or release a power
> reference will then also fail, making it impossible to do anything else
> with the GPU. The driver logic will eventually reach the reset code.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Clear runtime PM errors while resetting the GPU
      commit: 551507e0d0bf32ce1d7d27533c4b98307380804c

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

