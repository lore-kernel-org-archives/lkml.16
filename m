Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903C2114
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106542; cv=none; b=iMlJR5F/bALPj9zP+BswT35O0C2GqkRTIGg68sLVFAaDSY/Cz7wnAFMvwZxBBCJVzfUMi5T7w4q1wbPg7WkLZjXSzAEL++qESnDyUbNnk9Xt7gomPqy8TCLoDpe5ZSljfWBaq4TXvs/wyiUfI74LCjU4+QPAO4ZN+SGApgCToFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106542; c=relaxed/simple;
	bh=vobjxL9Ht4Ga7OLtAsuCI355VhyiFKLCWny1WNKsZac=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dPp9KRg0VDqzuKY0dj7Ov04HOzOxvFeJyoh9XE/j4eWnLxeACPU3wRMdm9X8+g4a10QPe8w1Ax1h/Nx6PhVpY3JAtp42sbPlNrNcZg3kPj0N0bwwdDu06dgvvDLWqt+Uyb9riZ5uKU9DIGL97VSIGbtPm1dCNuPH2jxKWXWsxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCRbOSVD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCRbOSVD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so528376f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749106539; x=1749711339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+ITcmCm4NZfY1wv7zR2Bon8G4iRiVfF37KR7g/6b48=;
        b=qCRbOSVDaGx8ds21gSr2r3MmosbiuOMk5GYM4yOwt6D74B6I3qUAq3nW49VhewewLX
         NNP4Khw3sX+8NPoQi6dWnJBAxVhAZgT1o+yU4lqZoYFzJ5Igy665z9HHKUCWZN5Kqj3p
         M17xjE3tyjrYDDNeVMaMRhqYR4J/7EEhZ22qC+C0mydyPVI7aXlRyI/uMPMzFzkInO28
         XbvSxMyzQAIJqpF6hK207TrT2Es+Tl6OvsMKQ1jmLIX+GuBMQM9p/8SRxjL1ridIq8zY
         aM/yTPN0G9pfxEEOkjxesF2ZZCG75WLbxmygKHxmpN0Zvr1/uf4qXVmRVkaHPwGI/RLC
         VHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106539; x=1749711339;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+ITcmCm4NZfY1wv7zR2Bon8G4iRiVfF37KR7g/6b48=;
        b=TTcekL31zMN8vCUAuwnTryn/2wCLwcFGi5ApCBBWLJCLcGcX5/lVkzCVxmL/yQug2/
         pD/GrUFy+8MC6RxoC49+crP3PwfSgE3hH3amqfiwt46h65hgjEzvMXWJVeZ3RLiE8PRH
         VX00kCMAaVAddIBUUYtCp7GEa3jg8qGcxIvyTKKD+3C5lxBJJuCTGSqb7TrCrn9F369J
         SIZvXB1wnLwB2PTYRoGnOboPaaF1QJ2BcCgmA70zPVDjAG13HEs53mlSLQHdxjRraiYb
         QvfgOL0HsbLFcsCbmCd6O51/qKgH1YMAeRNYu4MdgXV4BY/BnmSJ6DabgMpk8LDzAygK
         behA==
X-Gm-Message-State: AOJu0YzBOiH3lujea8e9zdVfMVy7P7ybw4XCRdkBSmGXzBD3V7Pipt8b
	xv0pR1aGvDpkctj82a/789AhefB6GCNX2XvdQE26VIUeDL6vVk4qGhEImPFwpAFUuyuMD0z/kS9
	LjhPM
X-Gm-Gg: ASbGnctc9Tp1a3bRugoisqIbD0sNmJWLQysjrQ5LWtQcshi7paQq6b5VOX+yXA/dpRJ
	/A5lWKONruMZcN7T7BGyNYY0aFuRR73vEk2UQIfXVxlG0n5jQ/74nyYEfe1tIiXFbD52IqPcoL6
	CQpDWHbgqSQEJYPzub4A1HCr8kpZxnS0wF/SVgpTiuEm5eM0YAdLnTa0VaFld+uHePE6GSpvI1c
	3U3gVAjXqbCCCgDcsRgpbjmC6R1Z/DWvZCB05YP9Gv/xZSxodUVs801mZjRmwp6C113HHjjFLiD
	1znLEngzbtTfSeIG1KQ6Om1/2ZWwVcHA4JIU3/NUgis/FSh3wEcj7OB9CwhoKTpSLDCbCVms
X-Google-Smtp-Source: AGHT+IGvH0unBBb8BFeOY9or4/awz4JHNnzBl0l/lhPxlzs/lpXvQgIr0gIyRm/BP5BVqpz4jE2S5A==
X-Received: by 2002:adf:e512:0:b0:3a5:243c:6058 with SMTP id ffacd0b85a97d-3a5243c622amr2333567f8f.4.1749106538894;
        Wed, 04 Jun 2025 23:55:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:55:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250603-panel-maintainer-update-v1-1-224aaa222d99@oss.qualcomm.com>
References: <20250603-panel-maintainer-update-v1-1-224aaa222d99@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Update my email address for DRM Panel
 reviews
Message-Id: <174910653841.1422723.16468836897937113572.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:38 +0200
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

On Tue, 03 Jun 2025 18:18:35 -0700, Jessica Zhang wrote:
> Update my email with *.qualcomm.com address
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: Update my email address for DRM Panel reviews
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/48d39ed4586b35d37d7c7439588bdbc1d9fa5674

-- 
Neil

