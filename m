Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9685D23A9;
	Fri, 31 Jan 2025 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738287881; cv=none; b=WA17lQUCrlNyL8Y2HUZPi86+XKfvX038XmXUApyLspNRTIGrvp8WbWTZqJeAIEbgPZbXSIsaEf2dPqNUYlPZ0vFlHMetvix//VBr6C2Sko58ztOy/NXkoRhG/nkKzLPr/FSA9R8EuXYp4Oz2BEKr64uUnbJPYXltIaoy9y7YICg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738287881; c=relaxed/simple;
	bh=60MNHNzw39e36kUPq5kA45bhydoPWWQ2UNKdAqUnUF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sqlTwWiHG+Ej7hUyuOzp8CLtf5J5TRbclK1oz3zKtugCS2lHhzfQL0tP5j/Ej6wNQ8JWqevoyaLq6n3Tk3xREm7uIgKd4wDbKTkdIrugKMItC2S4v+/t1IRqluYEnQx8aHZVgPVwzg+wJvkVQXWNKwY/5LMBY5R5BNz6I+6VEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M77D8ERQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M77D8ERQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2efb17478adso2454022a91.1;
        Thu, 30 Jan 2025 17:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738287879; x=1738892679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60MNHNzw39e36kUPq5kA45bhydoPWWQ2UNKdAqUnUF4=;
        b=M77D8ERQPASGkPi644bcvLqIgy+AdKklWnefAxoaDHHayz/jd7NpeMKgKU2E/SFcIo
         L6FcxIiwS2Mpc4w/GUTvQlTKZ7tNO5oRg0JpkeDa8ZwP8WeFrvDYX0lIz6oMTiyz3qEu
         GboqytZT1OCuz61Xj2/YuCAqDyKcHNsgGq7OfhvQexCGgVTarFPVoJinhL9DspGgv8UJ
         Wpddfhon2qTFFcm53ozwOg0ybm2ZR2GEku/DTgja9NqJF+FypLU/8wj87EalwMI11efQ
         Ebn26H0jEfxexIQo6544x1Ymx5b7o6OGnhQTuZyBnmgbjT7DlWkVMVdNNt8fpuCL6ImV
         2/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287879; x=1738892679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60MNHNzw39e36kUPq5kA45bhydoPWWQ2UNKdAqUnUF4=;
        b=MYeVAiAdSAdugWR0RhsERcXhwLYzQaHjEE3QOA4sGA7WGGWmE2RwaPRpCqztI4DLkM
         4IvZyqEe1J6wlkJ0dijz6GtGz279a0hDxIoyVDtaneUz1Clm0QhKsMiwiCF/BsZhe+Yv
         Wdm01BuJ42+AFfVoJDpbZ0rvjB9lthKaqJygcAcdphfb8EhusbZ+Tr+iI2QUvzBsABWF
         RAzrX74npEdOuzKsTa9y4hwTHq6BZBwNutMFkdTJhZjVymLGJS0h5WLomU9hE8lVyNTc
         JhafL/W8LdJOqfNS9BQNx6BXCKeQ2WryGq6Qytq8SubvPW+toNdMIV6hzgyzR5JtdU4m
         hG5A==
X-Forwarded-Encrypted: i=1; AJvYcCUV60uxAIv2oxnciwJ2TABkeY/tlFXEpZw4sdMPXSGN6tVS3uU854mZm2HV0l0B10lyYrVew2dNK3Rp@vger.kernel.org, AJvYcCXOcD1SQwbAAhRsQ+/R6BTgLRjx1MrrLTH/DYfnvHC6ZnM4d+T8PkQSxqifYQMks75JGATrfT9G0G+EJfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS36D+uqZRYTMN0eSUaCfd7W2RtUcc+3fIMQMxqMQrZTWmQdp4
	9ulhIKa+aQ6p9UYCPr4ZsX2cJIu5mlV5fOPSNZ6UqmWyAFbQP9b+
X-Gm-Gg: ASbGncv4Ht1k7JlZw9DF7Keja6RRg7tfbTrCYAJw/H66LeAqAdbLYLQXhy14j0bfNnE
	OpqwxGFjVZ0RKmXYcjMH4jY3m9Q227a2l+5qFth+R/giJiPNaOTeelMfLXFOlWbYaFlESdi7WFK
	oVE+C3e8PDmVQ0wYUH51xh1J/X4LlBFjVGoBWB2lbPbT7l91R4nVrSTpLidqxpKc5hyFAHMN0F5
	m4GXpnOsL3BHgnw9I/0xsC/z4+aEWqOi9FopO/ncgmPNoAwAiQfYgCiCMRAH9f6T8RNx3uQ6tOp
	YSnaoGSwfNIRCP7r
X-Google-Smtp-Source: AGHT+IGcIccU7GmDh/q7Jw0XI9h8Dzc4/IO1AAbKBFkA+9v9xNmZRxPfAMdJXpghurn4wXP69hsocw==
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr15923858a91.12.1738287878752;
        Thu, 30 Jan 2025 17:44:38 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f830a66a23sm4179992a91.1.2025.01.30.17.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:44:37 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH v4 Cover Letter] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Fri, 31 Jan 2025 01:41:24 +0000
Message-ID: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Mika,

V4 of this patch resolves the styling issues identified in v3 by ./scripts/checkpatch.pl.
Apologies for the inconvenience.

Best regards,
Mohammad Rahimi

