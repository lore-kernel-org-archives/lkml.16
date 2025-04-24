Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3074199949
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511284; cv=none; b=sI3eMFzzOX/5wrO8AlwlGkP34/Gk2zdsJ0XQLpU99Hz4hSBb7SsTdY2kqVDzu6XiWkXZoWR/aBtJris3AKjnF10J24rQtcuEY0GQRIPkVLu1JtTSeh+yi6Hv7kfapqXX0vOsvFe2IzjCjUdjt88EOYVHTtW4wN5ken6p7ZEOWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511284; c=relaxed/simple;
	bh=TngqcjSwM78PqkrMSBYgHbq4apEMEvYZ0f/57lUxrRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fd5qEEYY7fxF7HlEa+AxNWV+cJuFmavO4tri1pnmOr96B14TAOWyZFXPe7wqo+Hs4s+ST5lcs7TJByUiTBLGdyXmS4lL34/wnfX7ujTYX2GCFLY9ucFjmX8GLkzEZaRFcU9u+5bN+z1hEMsnMcg3GcGWrgBRK52nu//g/3edriE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cim0uXU2; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cim0uXU2"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so4513775ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745511282; x=1746116082; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ji/0WU0Hkm/Wd/Ac+aaMEEcuwdORU+nluLgv81PFOFU=;
        b=cim0uXU2sE+9GNtLdsdVAJC4lV6AB/vm47H+CqbFavXW905RqhyM1cB6flCFkn+QH3
         RyDQx2PaazS8v/OwfeVYVA3qw6tB7qfZyuHuy82+M6t9wnJ7BjlXdZsdZHN+YjdF/9hj
         tzh/UEd3tuG6w9rcZXAxFFZvcbZfhDMc8Q2ct02/NxIlIn0cKFOAS02UwNP1k1MRWD/j
         qJ2l9cJXH3DybYTHvP5rRCK2auBdkf/GEF7kbm7AxmPcR32DBHK2zMNQW4rosErXLngI
         4HVVtlOmgzKVS1grWqOoDTfdJB4v14TIlDiwvqndH3DyB/lVWIyK7rN8hfUapAqSwTXs
         3RSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511282; x=1746116082;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji/0WU0Hkm/Wd/Ac+aaMEEcuwdORU+nluLgv81PFOFU=;
        b=dzJ/TTTDiDV2g3cYFQBKPHlyFtxy6VCcxKyx5azwwU4cc5TkMRLYTvyBXvXSEpQUzP
         sq9+yFDqvjmX9EqC5NiRJteaoBIRltRqXKMCbGqiMNt6x8hqkjQbGkqjROyI5+/bBztf
         tffWaq/CQiiWlXolaTATyjDo7J2jc8kzyJy4cre+RUF85pRNjbg1VmAUmX1jCF/XQO56
         2i+jTBh9y/6McBThKZbAFd3+KNuwlDT8rNY+pkRvloMAV7dN3SyE3yspv6N4t4z366Ak
         qPgqroL5LJYGu7w8OR3Rw3/hDLX/HjK21NVXeshsDKAFuGCP4Q4cFIPG+h7+en68xnWu
         H6wg==
X-Forwarded-Encrypted: i=1; AJvYcCWEk+KiqWzgpx3sB1Y6uK/8kpssIodhMdEQi4DtI5xTeA0VIL3v28RQfI1/sd73EYc4FrnoW3TuHmg+4ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhgfbU1YUy871DZShSxmqGKiS7ITdsccFEw4IB+dlnWhfQ6aS
	oodBjBhjPyawI+OVLBA4TgxQ5iC2A4MwSlfmAg4zAN/H/hmYFkLeecjk0khK64AZmQ6k5qUvCeI
	Acvt39Q==
X-Gm-Gg: ASbGncvKtVmGvrBaouWL62o2HsJhZk7FQ+nuVoY4Dulx3K42El6qph2ZtEyoxVR2wdp
	485xXxykQb01Tv5r9uxosGDS7bZP5dZDipk4QH83oIv/5PqKg+JJ+lyCQDJ4jlJJxvaZA1uquBx
	Mw8i87O4/piP7frfR3uGKp/9dJitzMi3hVEMc9riyKUsMRtEjNJg4OqNrhzw2y3JVJxmoRyNk9/
	eWQ39TavjB96p7n53bILjOQtuk80vha9B+QvvjdcrXiYS3j+9aKHs4bEL3uWEi2NT59jSK9nNOS
	kg2nRCJ0SVRtizM9BNKxSyd1zZXStu1AqDxqV+g84PpJhedC
X-Google-Smtp-Source: AGHT+IHFPgnElAxZcqW1tgQiIZ2Unus+4rkzCDBPFWFzjHn1qt49SXmEjV32GZC2wJh6qjNVKHSPSw==
X-Received: by 2002:a05:6602:3f0a:b0:864:4a3a:2567 with SMTP id ca18e2360f4ac-864598fb52fmr28809239f.11.1745511281657;
        Thu, 24 Apr 2025 09:14:41 -0700 (PDT)
Received: from purestorage.com ([208.88.159.129])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824ba0eb9sm333003173.110.2025.04.24.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:14:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:14:38 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250424161438.g2fyo4ozvburf2rh@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes in v3:
 - Use nowait to stop all queues first then wait;
 - Check queue allocation flag in wait to avoid accessing after free;
 - Link to v2: https://lore.kernel.org/linux-nvme/20250417071036.a7nhovuokg7w2n5r@purestorage.com/

Michael Liang (1):
  nvme-tcp: wait socket wmem to drain in queue stop

 drivers/nvme/host/tcp.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.34.1

