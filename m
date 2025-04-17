Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04F2153DA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873843; cv=none; b=LTMU9gYoI0899Ya5oMEtkPKmojYSED4z9AbNUfh0ypN92skjCyyMqGpvwzlN1f/ZlzcmxvC3ZncocuPRwkiTBDDZ3OYjTx0xGR+MOMFG8taxMdNeINXt8Vw3mehbHaB2KfFHJopYBO9YvNP28dDN4LwPNPAVCenLIbEg2eJ65Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873843; c=relaxed/simple;
	bh=+JiUNgqyoXFvdtdEoFu1TtZXJ9PUjEsA5M8yVrRsh98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dL7K0axFq0Da5VI+PEQBtsqgOZQiA6fnEg+Yl9iwWIn3mvzHDgMC0+aQSEzx+qPiH2INRFOFVe8hWz/Mpb7PPQFZSzY+zWmxD3H0QaVCYnwdEvNifu2GdQ3gBxEkOCeRsBrXk27LI9lM1C1cgDJMAbd/fAALatdqNmRhuoSFcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aLKCqLTF; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aLKCqLTF"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso502935b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744873840; x=1745478640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgYgljJxI+hCrOOLR7b719OU8bcmPXVZJzM2YizyFss=;
        b=aLKCqLTFz52F/n2l3mYOJNd8coNRxizYW27VnomPm5s2H5bs0wMsVhoAviY1mpwDAN
         8rFJ0PvW/tL0sowNFUpYEleoSAc/caPTVGmCID5vQtRvftSKU+tpSjqLqcHtN9aonCP8
         UuzOgnM6lQwU2+8fifFo1F2WUAtV/FL0Bry7gTD/0uy6aHIsWTLO4kkH/Mw428BU+Pgf
         7Td+oH1waEyMOs9Z0Ud6bsxb0wPLBDJXJkUAc09jv7p5AcOwvayS+dlFIfDYoOKuDj93
         K9n556uzwJjAS8cKI+rcWrdg1ciqUzWXJb0dW0ANCxEyxaQx5xchdSr/IC4NbeVY1yRg
         Wmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873840; x=1745478640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgYgljJxI+hCrOOLR7b719OU8bcmPXVZJzM2YizyFss=;
        b=HpTpE6GUgowwSAqyo5PDBZjP06jQrKf1VxXKb/VOpw3M04DX78fBx5NoUC3WPrKhre
         shgIC3n8W6Em047z82oVX5jm43Bl/1n9zT3vdYmxw0SMLY5ttkovoz4hvz16/eRGeHTe
         BtxbgiCFIjtI2sTQ0+xEpawKBSyC7fKLdr4yl2YZv70k64qoEvcon+m043fODQMsg1XU
         x+ojw69HqcOsyWr7AZnYY3e84zCyQa09SJU50w9n1V8wfxLjYj7CS0flfsvVTo7sumjB
         lN8rnA69EK2BOr8Rmmz163aVQv5ixTHFLXxBGPSEj9zicLnn22mgImrwoOAb6i8pXeyg
         /LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUv9DnmQRscNaBKq6TuD43T8JTSVg5J4AYxuESG/UduoBdMQrRb2Yb9620Trc65b5f8gPuEgeTCuWZNYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0tfDuR/Z6/qmAHDE7I4SPpFjr1f7S/yBgBCN6iQ/t1fMTJTM
	p687wKCvyOwppBu9VO5GmbCMqfATvb6XRxGhtGsFa/S2dTzvtKhS7GheQUs6MB8=
X-Gm-Gg: ASbGncsCa6tkFcjyHnup0t7DNOrLcWZecAElnZEv4BtU6MjrtVWmcUbeSlzb0ZwYfLe
	Rip/94sX+xaYhXck+E2BwO5WQsoin3wFz0jWk7rcwJJYMLE/ELB6XJVmN2hltPhGeNMXWTVGuXo
	MoJlCGcsJum88TSR9VGv7tkKIGQsu42yyvQ+XdBwW9wr1uqe16x3W7PWGfuVttwwHALkVP4l2td
	8Wm60x35HhcdR4uVf028vJT2JNvtRnHohflWPBbbJ+dunN3N5c6F8oa0kUUY+MIFr2SRqqU9WIv
	0FpbXa7U5x4XJ18BCF9ZmvxuV3HfeD49tLr99l54uOG/QAc7
X-Google-Smtp-Source: AGHT+IEVe/K3jTKEPBOICq/hXsLGkcQRGNxPHABsmFWTO+uu7X2IPJ3WbFKcUwQCvyFzgLk2C/HPZw==
X-Received: by 2002:a05:6a00:328a:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73c267fba0fmr7220974b3a.21.1744873839691;
        Thu, 17 Apr 2025 00:10:39 -0700 (PDT)
Received: from purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b22217f7bsm2338045a12.65.2025.04.17.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:10:39 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:10:36 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250417071036.a7nhovuokg7w2n5r@purestorage.com>
References: <20250405054848.3773471-1-mliang@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405054848.3773471-1-mliang@purestorage.com>

Changes in v2:
 - Always wait in tcp queue stop regardless of the queue liveness, which
   fixes the concurrent queue stop from I/O timeout from multiple namespaces
   of the same controller.
 - Link to v1: https://lore.kernel.org/linux-nvme/20250405054848.3773471-1-mliang@purestorage.com/

Michael Liang (1):
  nvme-tcp: wait socket wmem to drain in queue stop

 drivers/nvme/host/tcp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.34.1

