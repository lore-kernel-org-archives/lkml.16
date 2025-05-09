Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554ED213E78;
	Fri,  9 May 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828714; cv=none; b=pLcP47mdg8xBqxu5CzncWIECbak0YdmXrLcXTeq7VuYJ21IF8KgDTFRuvR4tLwKjKPyHAKNeq6OkRU3LCVMuvzaDSn98sAzQpAqUqWBSEALe9iMQ7m24U48tT90cbUNttl4LpZnaZT88+FtyhzuhC0/CClSpV0Bm5VlMQa0vf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828714; c=relaxed/simple;
	bh=BHScd6W1izQxvNTXr1cbzgrQJUCi9unRwthj2g4US3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnLIa2WJRhubp77WSMiIvokNqTN4OHsjMGPLtUJoLEJokbYf4gVqG6i3fbIqi/M4Cz6Qv8prvBLE656HXolQqu3xRy4oY3Lak/jDxlr4Swr9oQEtL/iXK1GjV3pJQ91VqNISunBmdKUImy7ZWkUB0dnzbyyec3x+VEbpTncCnpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbEI5rwC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbEI5rwC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22e7eff58a0so25657785ad.3;
        Fri, 09 May 2025 15:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746828712; x=1747433512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=jbEI5rwCvlsaauc+NKszpJG0aULn7O9HCcjIjnORoUcYZ9iz9FOGcpgE0wIdb800tP
         L+iaqrd/zwVTrxDkbNf6saDGdVG/R3QxQzh1+9K/V2CqQ4sD4s/VLcTpFAdoMEAW5l5l
         /KDDfKZNcf363K5to0I1BcvZcHFDzNLr1APvlhqreZt3QK54ZYpDayvIlHOaC4XmXZhI
         RqNR+uiqkBlw1cb5p+6rC99vncJmXHctPxsU5+4x1Jqa9CTvUXMqMLyeEy7Ke1vnzyh3
         BV+hdusHeMxU2+gAFG6D2eYCc5LNN3glI4NpjMOGBEcsiHoejkSNz24iemQ6cyLf87V8
         XPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828712; x=1747433512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=HNMyRJvqks4WPEtbeyKolN0I8PfzQczlCkyVQUHfVVMOIojazqR9U3InLS3kky2XK2
         mvos6kajrbGygtNKt6ZEej3a8AonkpvQI761zuQnFjYUcbtHti0G0TSod50kTdNXWxds
         3eSPRmqrPiXu7SsxLaeSmj1wp/A5jQ1fel0Er5/Pbtvm0eGHQYvhWsQxHuMOTKKDptnY
         x/3+NaeThR/f6rchgKaki22Z+DSP82OWWyAKE+dsFpF+Dx8sfBErAKPi3zugUePKelfN
         e97uwSb94zE0ov6pVDyfffxUX72JhFrE7S5s7mjVERi6WmBuyVr67m6tk4vMbJXTssQJ
         WH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeRr/PGdCHAKFGwn1AypRPAMGAe7hB0TNx9DCnS5NZWl2UiVtmtCcBf3z6ICGuJir1uU4CWt5kW0ZYNSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpEsyRUNdkMQkBFz1BFhlWy6HryR2aRfo369GeewuSMI7YjGe
	tp/nzKdXlqIyFOg799yHCc80tcLOGbhYDMazZA+mLjvoJPxqOiVFMAylwE5jYWiwPA==
X-Gm-Gg: ASbGncv2H0Weh/0Vx7JPW7iv6XRfa7plNox04f5tX58nWBTyiuT4EKUpwe9xl7eEjxb
	x5m8mnoPcEUIhPy6Pm7oyXJUX5YbGLly2JFsM5pd5yeuyow/igGoJiOxVnSfXtyXtO9dV3tBW0I
	Ff7G5l56Fxm9JVWx9+4q9npzWp53i9ojRJ/qUhzexXbZzEnxU/b87RkFCz/Ovynbk2kcO835fsl
	8NLWB8N0bQ8Ju3iP933U/jHWFTB0cLz47MjkK28YWlALgMvJGiMz0kN6EIL+HivBsHhgkYMjBd5
	s4pmPzpuFw+/cWse+6k+ElDStdf6olok/yevfSeI0VL4MVmgnvRKeZbcbT9AVA==
X-Google-Smtp-Source: AGHT+IEaF56IevDwH1PlJFzgIzn4Rz1u6SE6rS1RLdeE8PwEKVL790XcKH2PSR3s+mYVPQUNRYS3gQ==
X-Received: by 2002:a17:903:3baf:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22fc8b0faeamr60003715ad.6.1746828711068;
        Fri, 09 May 2025 15:11:51 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm22510225ad.106.2025.05.09.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:11:50 -0700 (PDT)
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
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat, 10 May 2025 06:11:21 +0800
Message-ID: <cover.1746828006.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xtheadvector & ziccrse for sg2042

Thanks,
Han

Han Gao (2):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 320 ++++++++++++--------
 1 file changed, 192 insertions(+), 128 deletions(-)

-- 
2.47.2

