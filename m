Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB011D6188
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409426; cv=none; b=o/aC+JMrmARqcw+KaYdpdpZ5cW0r0C7QABgm62lHmXVmiDoKRr66OmYqLjY/O3DyUQIGSWCzgPt6lNm1VAfqLjciV5NSXqHGbATC5j5Rcc1kaydj3/Vc8OkedeHHdY7+L6hPtk8l+6x2N4r2/eIOBeklxsHM31CvT1D+OMK6cFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409426; c=relaxed/simple;
	bh=IWIzqWTJerFVGDEJ6dyCfjqxawUtXxEZNgAVar0xfxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvJ+u9cKrpTsMvkolCmAgQQaAsCr7FCP0ERReMMTOzPbV99Sx+lddAn+xV/98CWnl6Byu3+iKaWSqjVgyYx5zvtv+YRuUsckIKxXhIsnYkzg9TqyDs1jtDZdBqYB9SgjTe6YuMYA1AFBdRlP4MwIZx81ar/f5b5bIg1eLCG1iWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4PmS5Xk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4PmS5Xk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so28910585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409423; x=1744014223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=k4PmS5XkykKpXzrOoexzKUVW5fr0oskxEcL9/hohzaCgaYL2+0BFRubMCLL7Q60l58
         r9j+4tOHYeSh3D2Iw/UIWPvJw/4mB4mkGnyvzmqlrale9qh6AWbFy7qn/1gR1vDMAZm8
         zYma8n/g97W1UDErTsL5iwOVvgwD6st1GdwNoSxzUUzrmRLFSs//X+dmP8rJ6Rc/ce8E
         jtCaJtxABMpFAdXCxb6JfXYqamViqw53OqwwC7ExUDVhDkjIo4bjlSPBdpZqa8mN9fry
         OsufUvh5W4gQjeHQuwKS/PPqJYAE/slqovwOW2gdFsmCWN8Rg7Gv472h3OLQVsgt8El/
         WdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409423; x=1744014223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=aAMV1+MgbiAhy4XSN96usT6SL4etcTdYwfyIIhz+NvbidomVOhsLNZYZBygiqDQ1vc
         wUr3YuUCLwiCDEj95b9rsvac6GJz78sckBBTk8SNQAiteNbfgMxUZTO1vRDTOxgJTR79
         TmpdJJbyKWmqcxbbpr3lvPqUGLmzWP2Hwa1yPt2PF7qxmH8rUGEHdbPes+xIqxfuPeKO
         QC90ubK6x1A+8kBLiL3jzIgHzKlz6zp3Nx1XCoaVers3l9THDlJTf6JLutoIQ1N8ge1N
         7QKSzGGtvMtKHgW8Sn7CP6B4iDqVvF5JFxkaa5cvQiNV6An5K/IqMgI2mVdzd/8EH8j/
         gaQg==
X-Forwarded-Encrypted: i=1; AJvYcCUgWLpg/HxuPSyca0oi27UfdpZCw99sLtm1A1085CF8EVTZ0Tou2QlxFvHyr1HCKG/yqhbG0/b5SNuTofQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgfyvKN+gMsjPeBynJ7pqob7NXmocFh8Wv/B6x8X8KtX2YhfH
	l/L29LelsKbod7k+35hegm3+zDQtjvoMAF2s9n2TGfRS/Ahv4Ns4rlPGahe2R3E=
X-Gm-Gg: ASbGncvfWAfceqLwQsfKHWuClr7cKJ7+92/hwUtl6kPyvS5jZXo+AzX6FSlnOFmN4SC
	WNemCK64qR/tH5evQGe/rSfVaAywDXHUIetXUwvkW+NLtDIA6Xhxt0WJvH8c8Pe7OvVsluD0S3b
	sdofB7GZM2a3H2U0XxsIBzFAiXG0aePnDISdd187AnjcjGrWrEWA9kkpSLvkPRaBQsbLE0q+fgE
	WR2uqAAcfSD+PR440tKLFG9iR87Pv6lPbJSt2yP3MPO7QYv39FRwl/MSKc43l2PimRARgp004sh
	C+UNCj0V81NirMBCViGMAsYXPZ3/PS2Eh0dvpIM2YB0Mn0pzfqJL+DFli4svuNMvN69DTIe8pjX
	YfqNCDxWFCg==
X-Google-Smtp-Source: AGHT+IEPliOGLXJ/ttkcUzPpUn/BmzsjWXM+S+SYmgYzau37T5+RA34Y6WBFtgNUEKvYobw7wxOI9A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6742640f8f.7.1743409423178;
        Mon, 31 Mar 2025 01:23:43 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 31 Mar 2025 09:23:35 +0100
Subject: [PATCH v2 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-2-036222fa383a@linaro.org>
References: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
In-Reply-To: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9571d042c7f4f7d3b0eb3e627f3b5ae20cf52e99..02da7a074541862bbc9da442f8380794ab5af87f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0

