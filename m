Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1241CDFD4;
	Wed, 30 Apr 2025 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993500; cv=none; b=OE5u2rkvyp7RI46ywZKnuyMZsTstYGsjfN09KCSRQBQnzVjbRSkOq7+7mtP57JTbtaXoXYb6zWmRy3UIwOzZ2phSANiGmRYwqfvzTkImN4QDv6huErihdXLuZDmmaklkS+MhDGxNLVABxtbVHfHqezKyxcSXU1HztNMjhC16BQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993500; c=relaxed/simple;
	bh=v1pIsxP6g51VyfRbw0KYK/eHIg7gjK0YTemiE8HpC5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9475IWs1mC4GsPPZditAnamQPu6k9rZv3nt9uYzMHmaNtmdLvrXp5mdb5ql4zZGPZ7qBg/48K7ek0VDuQiUAY7chuISWqG4eZGJyM5zdgym1NFFNlweqejM1ED5Pi6A513RcXsBws+9oJNF8vA7TxYnSEJDLLkJyds7tZ99SbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAwRWdJ5; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAwRWdJ5"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476a720e806so66636611cf.0;
        Tue, 29 Apr 2025 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745993497; x=1746598297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=cAwRWdJ5kq0hhR8k6azLRcNeXu97tRozHb9QB55+f6YcCoyl4bhFz6EhjwrxhW/nvv
         w0QG8xm4juO2e74nxLFtpL9SRyUI3/pRUk8HbZiAhxfQI/LtcdAEen0+dkdwGEiEZa8t
         +dw6EXRNMMx2i9ypSBH/gswIVodAMIlPKB9ZVNcdD340aVF9sQKb22HL+Y33d5c6SKa+
         Pe2zjFFjCpvcSsq2E7eBGTO60+JGT4KRrieoN9vbopV3MgldGcC9Y6BEeaeSSpFzmOId
         mV7PLEnFaQ6hgXA5vuEuFmnd3BWIIKzKTcR1+cDlmeC/j53rtB6nLoeePS9Y4mLiPqeW
         lswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993497; x=1746598297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=OwN3ofX6GlqKGVFCSIY0Clc4uiO8+WCDsEffjI8WcQ5CR3pDIaqcjaeL+14F2Vr3J0
         3VS3cc9Ge8OxbtssgOlPKAkeTtEr0YINuKET0erBZyCNvll7kbNOUxxAVVAtSD3weqTB
         uXodCf06x8smHzGk3ROSf5vKYwa0LLrPGoWC70hcHKCXS+UmV9QfZ0GA4p3aBsXPrekX
         FSn0gt4fkxaL80+eRc3CnDpFxXvEOkP11h9z1vlqUXBw+owaiOivrjkljuUsWIZNi3Wr
         z8Ba5OCceGtAZGSut4wNxe2HJ2L7czy6oQ/iKGbN5YfaZlnNTf/lHx7d2eSrAos+NDDv
         8Z/w==
X-Forwarded-Encrypted: i=1; AJvYcCVkzCFAYdVoPd/l96BScwRnZ5pzcYM/ftslP8VF+yTwBRlsuoDwUM/TeMgwdog1SZMGY+tYZPWk+mT9@vger.kernel.org, AJvYcCWq5PDjVE2xFlzN2EtYsCeXKu+oxJ05rxUNxyULpkRhQP6DISiyMuGaq7pPXnZDBg38PR6ZD3bUtDEWv9pf@vger.kernel.org
X-Gm-Message-State: AOJu0YzItNppNbdfg2FzSH7YRE3/w7kc+Y1nazmQuhLwyZvFkQkG2/6z
	Bx2r0HkkzW4BKhhaatp4vgZlzjJV9irjBOmZUZYzZ1xRcb7qOnap
X-Gm-Gg: ASbGncsxuSg5iaV3cHr5O6XNBRn6OU7XWT4Ku/fUBtg6rDNoSHqZP1FrGeINBFXxxz2
	T7e5Vn+cQumDOU6fNhcDJZgPrzWga3DtY9Wrqt94Oc7HLWaHTAvkLlhiIeyVfrbZMzahiNdR9D0
	5Lq1lminmtVgOgg+3RzwnGHSchr5HMabJWmDnlIfQbYMPbZREKPiVDIK/PaZN2nfdnV5cr1/csO
	WOlunxNjUrLng2zFx/iq/96EtdIGmDo6u576OSSZHD2b1iL9sT8Whb/h+jo58Mfh7pM4k8MROae
	u9dvcJYdWxlUP+Yi
X-Google-Smtp-Source: AGHT+IGs1P+XfC/zsF9LCXLoh8Go5qSMxvWRH8PVyfFT1zFItCSZlKafKUoX4M940mVzPotcHqa3cQ==
X-Received: by 2002:ac8:6f09:0:b0:476:63e5:eb96 with SMTP id d75a77b69052e-489c4169351mr35148251cf.28.1745993497561;
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9f5b4f0asm88406361cf.33.2025.04.29.23.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
Date: Wed, 30 Apr 2025 14:11:19 +0800
Message-ID: <174599347430.640588.3561713391476977843.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 28 Apr 2025 17:24:36 +0800, Ze Huang wrote:
> The "snps,data-width" property[1] defines the AXI data width of the DMA
> controller as:
> 
>     width = 8 × (2^n) bits
> 
> (0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
> where "n" is the value of "snps,data-width".
> 
> [...]

Applied to fixes, thanks!

[1/1] riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
      https://github.com/sophgo/linux/commit/32b3f9d3e57bb4bd2204a6a4305b9f899f725859

Thanks,
Inochi

