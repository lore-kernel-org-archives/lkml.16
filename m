Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFB23958A;
	Fri,  9 May 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814441; cv=none; b=mCCXTD9fqaqbLwv0b+RmlkNhHWDQciOStCNf8DgE33iTyeWmyvQvumWuLnqGbZ6biEFwdXqCrikiXVAX6D6HrgjjfFb3MFd51Rt53frq36067OOuYQyfepvjOjBLoWUme1usob8doaOosDfr+w8977p5doMc7WyEvOLIo2skw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814441; c=relaxed/simple;
	bh=q2efZcS2vewZvZvxX5GnQfpsm2S/1Rw+OXcdg72+AUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tq0zuZWNsVmFBwICVP3YLoxc25WHZm9iTwnu4Qg4fWLqeDNXfu2dyuxqzVU7i152QBiE4R9ZMbo6U609vSrL2XgsGjONbmsJUc1pb02tFAI+3GQSmYwpvCYQceJ+5qND40U5cUoocGjy5ClV1CoaStmnRfcQ23lm9cl5kiL57sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6b/Qjnw; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6b/Qjnw"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so3043191a91.3;
        Fri, 09 May 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814439; x=1747419239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=f6b/QjnwuiXjZxusK5MCeLf/nPC6dJxCv23b5qmTQ3Kg/jViVbI6fbFWXpMQSCTe6h
         9lgrWVmx7OIK0cnA4GlLWQYdZTBB/JpcZeTE7ldVzWgpCwxyzwfB7W49FIPbhvwAt0AQ
         6pk1oLkAFTWh85V61/C9YWnT3lhyXm0huNoDXP+OHG3qsqI+Z5LoWN10fnL9jZhKnbnm
         m2XvN/5TOJ3ROymcl4PGoOGyE0jtXTnST7hGA1pKmaOvdUVUyLmTtgQEd1l+UhWfodpq
         w04zdlxWMKQZYVxvdr4fOFMZGGMvL01iJesaNSsCGjA6p1tGhe62j6kmeqCeeaayntFt
         ZXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814439; x=1747419239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=nLGFWGN4lfcZd0PGR/P+vbrKoFEc0r69FrvoYUH2QfZMHhVsud+/ncidbYVmzPo2Ew
         tIt6EPERSc6Ztb06mWKYeGgFCZ75U6z6QuMZe4C3M42RqJmh1wCE8LZYKeSxJSRu83Fl
         DQGkXP6PW35rMdlw+9X4BRdg16Wt7jIlV8TsEjAcNNLdAEWPYl9aD0RgJCc+dIv7A1xy
         FcXwYhgPxbNW55DPMCniSV6oh7uTxXnhIgKGy5uClS52kmoE8WOdKRgrC/eBoQm1Elpk
         cdSqju1krhdgH9jE6tyCcMiuApCMOrfK8ooTLTv5pYKDaU7Wg013oP3q57p//0vcXWfM
         Jj1w==
X-Forwarded-Encrypted: i=1; AJvYcCWYNG3BjggWUSj8dks4og8jNHLoLwB5gwk1jam/lpzxfWpQNLyDFiTBRglzT48VuzvkRMFOpVHQRhcscsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSRbYYXsLUFgEXklyVrCHlDVDMWyHR0Irqy7s26XgTurC7HfX
	zpWer6o6jBIEi0nTfedMRsmu6/38veUu+9b9splCzUI9xPh4oiHiR3ZhJvll9QEVgQ==
X-Gm-Gg: ASbGnctFI8CMNQrbzUEfkB5tuMES464BKiFrI7G/XX/WR9x9eaKko7vN7Wdh5kl6FXU
	EDwbwk9ZsnxUHeieQknPp9JfJfzQohYxkWior7jNnvFL1eLQcQozq9DPfDikXfyB600iKoZP2s+
	GfTMAWY49OhJrNHcVT0geZ8n6/aVNM0o4kg99HZ1C7zVlsnjxzkpNJQVLtrHgCspk/opLAv7hCt
	kvoPMMn70PBl2I1Erg7z7KjaYjUe52xPPjd/S8eXxHnTUS13yV4U8VEGc4I49HESOdh1fywKNOA
	422Wh0M8cuT0/3NE27jf60efVdPcWNzeDI4+yVU9WZ21SQCCvCti/ReEtp/DSw==
X-Google-Smtp-Source: AGHT+IFfDKuX+Ogqxn1Bz7Jth7H250NjxWVtd3CHGpPWzJnTEpjnMQCpbk5yL8+PxsceCiC6uJchgw==
X-Received: by 2002:a17:90a:dfd0:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-30c3d3eb4e3mr8275448a91.18.1746814438302;
        Fri, 09 May 2025 11:13:58 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:13:57 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add Sophgo x8/x4 EVB Board support
Date: Sat, 10 May 2025 02:13:26 +0800
Message-ID: <cover.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo x8/x4 EVB [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo x8 EVB bindings
  riscv: dts: sophgo: add Sophgo x8 EVB board device tree
  dt-bindings: riscv: add Sophgo x4 EVB bindings
  riscv: dts: sophgo: add Sophgo x4 EVB board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2042-sophgo-x4evb.dts   | 235 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-sophgo-x8evb.dts   | 247 ++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

