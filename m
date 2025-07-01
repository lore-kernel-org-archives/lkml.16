Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE61F3B98
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393328; cv=none; b=dNSVO5bTThp3kJbqSqIB3TB6EKhebithdMjbjEAdcuCpN+xBY1XuRuH9/5BKDFf0JjFqOu5wicOWx2o/MZJUQB3iU4NpF5kJitT2UErJcBcPHCxLwd5l08TLRDnzlRulE97jSlEOwAwQ0GbEvTqsDXuLAfGVdf4uLLV2qYoPe2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393328; c=relaxed/simple;
	bh=sqEYp+GJsr3c1ZoP5ucjimUiASFNFvNEkUK9S5l3ld8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thDU9tj2mtvwLrLmYjVwvGcwouoC5lZJ9gBf4Map3JNhH02jNhHB/yUojJ0hurQPztnzpdVxC1YVQnlMNe1EJmnKI73ppsih/DJOP1mPgoHhAb/IUXkxvX+dPxCIuvkatOVY7f3wIZHSAf9iaNawAjMHQz3Z68SiKWLwysAFlSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbsa18Jm; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbsa18Jm"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2f3dab2a2a9so363863fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751393324; x=1751998124; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmBWeUFsja8XgEI6sHaSHNOJGBLbPXCjjSjO2QYqYio=;
        b=rbsa18JmMLVAQH6I2hhItZdAB37hiGg5WFfzohoehpDmRcH7khRaTH9SvhvDLv4d4x
         FULA7sfNFgykjR410b14rBRTs5Rn8Oqf1uhpBmT+z/JbSxxqERgnOYbdZboln/sDR7vw
         geoLwW8qyJqsbtww8t0xSyqFQw2FPboKiEx/wm0soH1xFTsqroAgp4gtRxtUoQzzIb8L
         Sry/FxEY86oUUyC+C5+RUD4Wu+c43s3jsD7XDyNbss0FtfdFPv9K5d6HAtIUSt1NJFUg
         X1v1uHXa3gP2z/IdR3P+jMwAh557n9zFyX0aPa3urOhSy2WY4sMh5z12edg15Vb9pfWq
         MjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393324; x=1751998124;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmBWeUFsja8XgEI6sHaSHNOJGBLbPXCjjSjO2QYqYio=;
        b=qjAFFJ9ksXsAo8gsODr7GqUBczKwEcRze8LRHH0hYDHeP2oAUyqwLF7pQKdO1quPxq
         7aPDd4QtHZaBZXN0DLPPVN73uw5wwyTz+2quDGxdoHEjeWY+r2VoFuEBRNaw3GDycTIH
         xnd5vet4na3A8P1zchTCheYsUz4Kdp7NHVYHTRbQSF3JLR6oiR7X+qmHfmwoGhvop2Ng
         1GESuVgxaeEauVF13zU8qlx+E7ZLcl8ta5gk/qdOsYKJBfdlVc4VJtvrKD/z1svipJ/z
         0nko0tjd2p55U4f9sBZ1lJvVUm7nzb8gXm9WFihS+3RkBJ/J0icStlmAYe7t4oWLkLNP
         ujaA==
X-Forwarded-Encrypted: i=1; AJvYcCVk9i9RQUMUsfkXAnta2tH4Zqn0XzvNSl/ICWstgTO0/Mhna0ta04LtZqfE4sHZ6RHbMbJn8wHpq9SnDd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NIKi2ien+nBfSedIgWcrPQNPYXdKypigB9pyP25H26cAFfFA
	YCDE8/iv1nxCm9aPPKo+UVdcJTyU0s2QLM51SE0gp16JwgnW2MY7YFdehmkJgFzKJNo=
X-Gm-Gg: ASbGncuu98CgzoJKNybvfmFpX7lKnxaQMkiq4GYf05tnKMYfV3h5gDeryHnjLIXATvi
	4Y0BqO7qGP34N5zexhGI4DDj3cBSPm0WfRHiOlrd5lqoZzZJqEhKrwuSGm52s7WMWNzHIn5/ixP
	GOsXZ3OnbLYOts1G2cSPGTu8K1AyOtZBqId8S0y/M0cI+1OlLAy41N03rMc3NN2xqQaCrobSdTn
	igR4eiGj4nVHImHP0kkr8ZF6MEqDY7h08/6HLDk8ljhXQgHzW/Xo8s73JaNWSDVN15yzS39SFXu
	p1pex7ROnJoaXgKwQVag17xxR5kjF+FUPUWser8xizJKG3QCEfDByZnqseKNrskI6+YLtQ==
X-Google-Smtp-Source: AGHT+IFUgAn7ZgG0vftEAU4ScpIylq4sfDSaoAFlTtYAYDN+URoGNI2riucbgBsxkY19iHfA6fkTRw==
X-Received: by 2002:a05:6870:479c:b0:2ef:3e4f:de9d with SMTP id 586e51a60fabf-2efed525468mr12436176fac.17.1751393324568;
        Tue, 01 Jul 2025 11:08:44 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd512d709sm3388146fac.43.2025.07.01.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:08:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:08:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: iwlwifi: Fix error code in iwl_op_mode_dvm_start()
Message-ID: <a7a1cd2c-ce01-461a-9afd-dbe535f8df01@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Preserve the error code if iwl_setup_deferred_work() fails.  The current
code returns ERR_PTR(0) (which is NULL) on this path.  I believe the
missing error code potentially leads to a use after free involving
debugfs.

Fixes: 90a0d9f33996 ("iwlwifi: Add missing check for alloc_ordered_workqueue")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/dvm/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index e015b83bb6e9..2b4dbebc71c2 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -1467,7 +1467,8 @@ static struct iwl_op_mode *iwl_op_mode_dvm_start(struct iwl_trans *trans,
 	/********************
 	 * 6. Setup services
 	 ********************/
-	if (iwl_setup_deferred_work(priv))
+	err = iwl_setup_deferred_work(priv);
+	if (err)
 		goto out_uninit_drv;
 
 	iwl_setup_rx_handlers(priv);
-- 
2.47.2

