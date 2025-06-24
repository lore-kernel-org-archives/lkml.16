Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C42DECD9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776704; cv=none; b=bjXH/Kj1Xu+MwZtC5LPa9VWDniTMa51Y24vXqlpJfzZpukl7c1MOlvuma9vH8qJeK2zH4asZXY6zP/awvBXXztHNN1K8pSrCvUaYVk79rg7nOnmuxdq70NNxIB7NtzOK5AmIO/xg+mauuwiwqQiydNuBBcaXybWVW7oeRqArpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776704; c=relaxed/simple;
	bh=1Kgf/0FDxsEKZ/IOTHjqv9oBj9EPg7EnnXFng5g4Z2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WnSA2jmoWQa2/v8yOOp/eZBmDRqrVBTx82Zcab4FmF92aO6naV7HTwqZM6s6ciTimROfzn++s4tADJsc7UPWqpJwtus8nw+wLff+m+FsQsq+2Q3wA/OVWHVAPNmmMz34FI14huzIDFuS9+v5vEbJfngjNqMjdfc0Q4yh28TqnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=f1SCzfNF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="f1SCzfNF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso687631a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750776702; x=1751381502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RccsmMtjgC9sn6ElRx/uOMQJy3s9FaB2yPZFMGBr2c=;
        b=f1SCzfNFn/EFZJtJgcY0a2GASkR5HbEcV7ksNJmEnn8Nw8JTEPBZFVVsDLavcaffWb
         oFUqbJoAbvCoJQIQISn1UO7K6p78vKVfiKmPFEine12Dwb5YUoFpt3w6Blf2WC1HkvXb
         Ux58XQBWI5PQfetX6gRTO36VHFNB2zXIq5VcQc89D6TueFbvojkgH2oSDhKnq78LhvBd
         nuM12sqx51GLo5+b0E12m8+XJ51/LfKOep7dEMZP0DG1JgsfMQDotPqgtKxmzMzQOrJU
         RBfJeDiG9PYxdx9FqQYjJehTXVv9oSfKbSqk1OE+F7v/IdheulvhO2x0F+T8hZYNfdWp
         tzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776702; x=1751381502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RccsmMtjgC9sn6ElRx/uOMQJy3s9FaB2yPZFMGBr2c=;
        b=KpOHVQqX78H+HdRq1C5YRjMipGrANRI6LQ3AU2VzWWlji8ccYvo6Mrx4E5okbe7c4f
         hDBQU4p7avJpE6e6X2zUE9YsFvUkgs8OUmIrvnSZvIC/RTdCKx9+Bc+eqoR5ENsNFoay
         xKG05JD6uNfDUKkzzfOCLq/SLkm0gA8NII7im+wrLauX3LuOzUoUI1VQqLsZwDJTfgXL
         HfXz3KfyZAOlHwNU8+MyehFpA3TuWqiUej/Q1WVGDFLrBDRNExq1B3faB2x+gFG1cyNG
         pY9Q7JARC6Zc1EWAKQKmwWHctOAfEmI+MiiMu/aPcQgPaT2Qede/8VUXTvkhNgChbP1V
         2/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkCCjkJO8+UDiTwRuxUM7H2HAsv+ncajhNE6246idw6T9jCAg7FQYJk6Np4jACentLL9ABEKZ+rh62PtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3vetnLY09ZWw5boZ891q9ieNpbwpONGlDfel+kqbIC4/aEL2
	KnC3APmikjh0E+Cs+fRz7xnJJ/1XODFOniEUo2uXzRxMWkyg/SSvYQHvOlVPK6IhdGY=
X-Gm-Gg: ASbGncvLl3+40bKsH9B8yiI6kveRtn4ghfx9pVL9Xu7NeL2KltvoMP11dg4q09cTlmL
	eXAT1JdKZExraLMuLji5Mb7lHECdE/K/LA308Zbg9Lk6jrCeEMDHpET32nEM7HTPsB6wZ191fdr
	7BbZRqP067ZkO6fHMnc1DKiF3TI7HZz+b+kuVG04hiDBtHtM5hleXMx/G4rE1duTXStNx31tDHK
	Tq7hvmM66AjoVl9J4v/GMtrXnRblCB/DsxbuSqzwKiSHTuXctg0inVhvFWxOKhOBTEIjoP+udBe
	cLJCzm6uS/9m7cgUaBmql8WCeSk7vPmCszoM3d4FPolKIZ/g7UKPRaIwdZyQ5Xy1
X-Google-Smtp-Source: AGHT+IGucjO0d3d6N2bz11w2ewtlOUqPYs+meVwXkvC5wVBZ2OnZdzSNibQf+aetqj1y5UwhiVNmJA==
X-Received: by 2002:a05:6a21:b94:b0:1f5:6f95:2544 with SMTP id adf61e73a8af0-22026f00f14mr21566416637.33.1750776702259;
        Tue, 24 Jun 2025 07:51:42 -0700 (PDT)
Received: from [127.0.0.1] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c887378csm2040731b3a.178.2025.06.24.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:51:41 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250621171015.354932-1-csander@purestorage.com>
References: <20250621171015.354932-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: update UBLK_F_SUPPORT_ZERO_COPY comment in UAPI
 header
Message-Id: <175077670063.72735.9246578539653895274.b4-ty@kernel.dk>
Date: Tue, 24 Jun 2025 08:51:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sat, 21 Jun 2025 11:10:14 -0600, Caleb Sander Mateos wrote:
> UBLK_F_SUPPORT_ZERO_COPY has a very old comment describing the initial
> idea for how zero-copy would be implemented. The actual implementation
> added in commit 1f6540e2aabb ("ublk: zc register/unregister bvec") uses
> io_uring registered buffers rather than shared memory mapping.
> Remove the inaccurate remarks about mapping ublk request memory into the
> ublk server's address space and requiring 4K block size. Replace them
> with a description of the current zero-copy mechanism.
> 
> [...]

Applied, thanks!

[1/1] ublk: update UBLK_F_SUPPORT_ZERO_COPY comment in UAPI header
      commit: c770c2e2b53b468d5eb124e7daabdb4a8471f442

Best regards,
-- 
Jens Axboe



