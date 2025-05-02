Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC701B85CA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207901; cv=none; b=uRK9bdIryWXqkWEe0Wx9EhW7qMzx+X3gu869J26LN/cQZLrcpgq9qdnT9PxdAKyXLSI2uzmlKpl2KH6ygcHEs8aGqUic1nXf82kKAKiquzmjTqO2gruQ06cHxD9IX0Dc3bjWy5DL4xGOq4Junlm3WHLk7RfpY29dXSCqq3xvbfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207901; c=relaxed/simple;
	bh=XmCGPi5E/4vdLYqfzcEUuIa7Pjd6veLPx7s/gT1s0z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmw+646gq0inTQPgEjIROQSFil0VtpsrbuBSDpywgHlfhhQt0sFEE0K0Qsc9HYt/E0gRWR6izkMAtYjYRn4K7uGpkFn0IwdB0wpxZDr2detl0ghwD8XncPrTmU2hYcjPMcs17L5muLIzClreRJxQyEqErEeqEEhAWsLRKo/RyVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfT8qh63; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfT8qh63"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227a8cdd241so30424845ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746207899; x=1746812699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY8M+VLKea8pjpC946v5/t8PrnnUb0Gzxs+7tzVnLLg=;
        b=ZfT8qh63//vQIKv+aV+pTKMNJSSjvLT94HkI9it5Jn5Lrufb7peCm8wUTuJpnfo/ye
         UthcD5b7RleAhGAsixdB2GixpqQjAB9+HqsNmWbGlezGFqSx22VFJTJiSvyrox/n6Icf
         K77bNvG8zu4fY+r/AfpLe6xuF9JCrjvc3chodM/LzqN0ACA8W5wOwNb80cchg+M/n/9W
         BtopYKzjhNzoz/Mjj1rnJQ/MQ5uZZD+DWG+enEdFTzfQhmWwYc69OTs/2/s4v/guugbZ
         AO7otwmEVRO+NBtCq0408ZJf3H7uzWZHmPE7A2OvDNw3geQtrYk0HefqjR5gx+4izAzk
         lwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207899; x=1746812699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY8M+VLKea8pjpC946v5/t8PrnnUb0Gzxs+7tzVnLLg=;
        b=e1Kes6uZqj4hCyy2ITHnc2XShaSZ8OzP98ADOo/aZk59a4ZEzYjyti0qRMGSOUsqww
         Mx8LJ5FmGAkxnEfohyE0+0BY3liVBtXImjBsMGSHoNVkm2Huc3tZnBisJ6JlwR9fMIZK
         pzv6OzVHg3wKlMFHkqT/yDoG904ZImxUnV9zX9wnRVUsr1QTyQUUYd8E+2vmyrtHw9o3
         E7irup8wQ06OaGW9KvwANfYp8dNL5lAr7xs0Wgyf80v7DwBB+3058QEakUZwEucYK3ho
         Wo5R5SnNfIbcY6Ogcm6DEt2P3dMab75J7QZIUzwpFIDPuhY5aoRAsxBnrjFNnAkkCwvx
         rJnA==
X-Forwarded-Encrypted: i=1; AJvYcCXzSCJTVFqmPnM73SCJPPJsbhZ5NejSIMtPK8JcI1lSFvAk2wcX2iPhEn8MnLN9iwYXksLSJveS2nPiAEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69kG9XVUxMteABNvHrPSu7Q2meaUnU71fTczHQmw+F1ziLqJ+
	6bxroV9xAXT0J6u/eKG0jubhtBoRXB+yBXDifYq4YezZkvBIZqej8LvQLrxyhg==
X-Gm-Gg: ASbGncunpVgi+/Dlz22chKhyyrKFA1PsF/5fmyJocm0WPSCzuaaWgeaK+khaHkMPp0s
	x3TdHWhRJMYGfAhttW4uNxfDwNqWCbjzwLL9YmptpVK4CRdydn/Coe4aGpku9VggkFPbTXK+cvg
	r8u5p+cX0tlzsvveGhYaniCQJt5qIymcxrimSWKQZq0jAG/GIVLO6s3pgPyhT8OWNJTBH3p/Pdl
	uULG+TAe0xkWT6D7uId3A9hR9TqdI6jD9lo3AxudXBVCOrMCfH1hryP8jxsk3Vb/mB+DfcVewiW
	tLh61iZkmAr6fn636y5/fQ06JKNb+fNz/GrkxpSX9e04kuVFSNqhCRZR
X-Google-Smtp-Source: AGHT+IHXWlUErao4J1U1mlwJYk9ATwc8DlkGhI6ADj3IGLu/xR9EZ4EkOFgQ2fo9wnmS3hLmuShE4g==
X-Received: by 2002:a17:903:187:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22e1032f5a2mr56701275ad.17.1746207898939;
        Fri, 02 May 2025 10:44:58 -0700 (PDT)
Received: from thinkpad.. ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae99sm10608815ad.19.2025.05.02.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:44:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	christophe.jaillet@wanadoo.fr,
	thierry.reding@gmail.com,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	jonathanh@nvidia.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [v3] PCI: tegra194: Fix debugfs directory creation when CONFIG_PCIEASPM is disabled
Date: Fri,  2 May 2025 23:14:50 +0530
Message-ID: <174620787968.116062.4174884576928380234.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407124331.69459-1-18255117159@163.com>
References: <20250407124331.69459-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Apr 2025 20:43:31 +0800, Hans Zhang wrote:
> Previously, the debugfs directory was unconditionally created in
> tegra_pcie_config_rp() regardless of the CONFIG_PCIEASPM setting.
> This led to unnecessary directory creation when ASPM support was disabled.
> 
> Move the debugfs directory creation into init_debugfs() which is
> conditionally compiled based on CONFIG_PCIEASPM. This ensures:
> - The directory is only created when ASPM-related debugfs entries are
>   needed.
> - Proper error handling for directory creation failures.
> - Avoids cluttering debugfs with empty directories when ASPM is disabled.
> 
> [...]

Applied, thanks!

[1/1] PCI: tegra194: Fix debugfs directory creation when CONFIG_PCIEASPM is disabled
      commit: ed798ff1c52f6fe232ce2e24e68fb63f5470ab97

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
