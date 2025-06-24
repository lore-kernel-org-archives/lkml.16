Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D5BA49;
	Tue, 24 Jun 2025 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750929; cv=none; b=ILOMDssPEy32X6PG9VonE3C9AK3w+GLSWwX6V/lQ62Mz/x8HZh0T/NEda8tq4JbVlhIRI2mhWq5KzerE43wxXvd2gsFkMDyoQAgQs3Oopt4+8zR+WlaSQjS64mx74MIMF/kNs6yIu+xJDUoV309RMbul4fvA0Q2rekunwPopvTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750929; c=relaxed/simple;
	bh=3ZsF5jIfypY0hGjs+DCj7bQwe/2UWHr/nkJierEMiRU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLlCGeKgneYoAf9GI2saHub69RiJi8QW3G7iJlAAYDz9Imdkot/mxIrPW67bpjePtRnrUFc6cwiZowpjNA5IGmOhlCRhjS+ta/d50UM7IC7w9J5no2TPpbhPRZTyr18sOHu2n6xC0FuiBdqGRDQIVQBkz0Dwa/VXI7IDdgrRqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6wGnVvr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6wGnVvr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33677183so1050265ad.2;
        Tue, 24 Jun 2025 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750928; x=1751355728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEGiqkddgrWRQ8BBTEozHaOcjlwLtbwy+RohDdiIKL4=;
        b=R6wGnVvr43Pm1iHfKrWIIVA2ySW/y7MmxQIUn/IW5naTTwHlWnPrW27255lMdafkLE
         vyEhbk8UvijRXWgfOjDXxq0isRDaBEwjRDEbWg27le9vZs/yBIpbEmbBexYaOkh5dY7E
         4CscOot1v5UXFlpioGgGvC/pD1KIR5zrBgBAIBHO2LtwMRytPVshE94RaEZ/F/p6p/vw
         z5dzRZ5/exOfumykGI+aQgTBOKRjYHiAZLlFeav3GvlaviMUM4BAPVzEM2cc5b6rf+mN
         zOMEohsUvdHV1tHGUgshwUaxfZdpGWelfIuZMD3F/LDXFhE1ZQeH6D38lA1KeyjujXu0
         dVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750928; x=1751355728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEGiqkddgrWRQ8BBTEozHaOcjlwLtbwy+RohDdiIKL4=;
        b=MUcILJLMa7flup3iQTH2a/ZZURwxy2O5jE8HvWfHuzHLeVuAkGgUdnDG6p8YnBZfwl
         EDHz9kG+vr8BYlCeu/DYyHdnrkEXsM0GZ2udzlCe26PIKO2JmGCIPsUx5vB1p3sEOO3p
         +il9b5WMsi7DC3zo2jU2VLyDwmyAUmg2C6SLVvE5duTpLUoPCZrA1lrSDdqWk0pbl4om
         6e/qGfJVCxhtF++Im3xfFe/lHrIa9sUv/tVWgkb34LQTj2p7cjdTBtALVbnokzutOmeY
         68d7kbaUlAKbbxdvon3l5vVoyBhZ2oZiPAb4XXFi/dz323Af+J4lwPp+LBZ2WrAF1fXE
         YvLA==
X-Forwarded-Encrypted: i=1; AJvYcCVDo7B2lwqvrofK9gxx2DnOOW60uTJdMFdROytBnKjMNK+ZcQeOAjqG0/kql5IKJpylxnbulow6bLVP@vger.kernel.org, AJvYcCVUep1o6SzlgizQldi0v4RPJOXOTX1AF+g4bjOsKAxp5b+yU5IjjLFrjZpzC9AYm/IVxXwPZ41o9UE8kQQ=@vger.kernel.org, AJvYcCVxtrwcqmXKcrZnnPnmKUJ9TLG2v0rP1npnDkGYPJMCFudqhvjgioymfZNKDR/t+0yixZTXuIEO4zSw@vger.kernel.org, AJvYcCW4sYjMIYqyYIZxq1w8OG9512Es0GfrfPP9d5OsfvPYz2hZjXb0pVEo+YWQ5pKm1aZtIClphr9UHAKM4ZRx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5Kquppdo6o6QzF4scm0WjMSPP3EMftzlrIsaIb/r98IcqQiH
	Ug3e1+lQN7/ooXTv0BO2+5j2XvOE/qR94j5d6DM4vY7X0TSK55HUzLkC
X-Gm-Gg: ASbGncvUnbVvxwRecFnKn+OJdeNKtHT/Orip+igVcbZhKGD0mj2dUR/3sUdRHLKAr3j
	FSONv/5pwnOyxUWN817oG6KysUEeBSXJwBmR1DRIo5peyi3HZGTKmEctbIbhFsm5tkF7rA70Eve
	rfYmb2QXCbbVSRv7YdbSLsEhj52x0iwwNAHyIfN3wpSgQCp7krw6CZmeBMYtmUrkMWOTy4BvasQ
	Kcc+ptyoBwx93lvvxFSL9w/XkF2M+phJ8fdY5YlAi93Dix7374fKvCzDiSYeSpBCNus+Uq0ky4R
	WNvbeBFG3RSrhHuamXxsmvqYoq4e0OPyRecPIsbihQocCB9GVPNB/uVRptr0bZNHj38RJKcP/dz
	7nqcLjjqgQNEs0+TWhv35v0FY/P9T5n0XrpmdWFbG0A7Q9p/kwNagZPn3phs=
X-Google-Smtp-Source: AGHT+IExGLvHHpt84cn0ieqkB4vcbTOL/+4hNEkYmvJVrpiWsTfNFl33F0LmYh0j6CMtk8rrTddNjw==
X-Received: by 2002:a17:902:e842:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-237d996585fmr267424865ad.35.1750750927512;
        Tue, 24 Jun 2025 00:42:07 -0700 (PDT)
Received: from localhost (2001-b400-e3db-4096-e87a-5c33-d510-e9d5.emome-ip6.hinet.net. [2001:b400:e3db:4096:e87a:5c33:d510:e9d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86407a3sm99141275ad.144.2025.06.24.00.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:42:07 -0700 (PDT)
From: tzuhao.wtmh@gmail.com
X-Google-Original-From: Henry_Wu@quantatw.tw
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Nuno Sa <nuno.sa@analog.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: trivial-devices: Add mp2869a/mp29612a device entry
Date: Tue, 24 Jun 2025 15:41:34 +0800
Message-ID: <20250624074156.291176-2-Henry_Wu@quantatw.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Henry Wu <Henry_Wu@quantatw.com>

Add trivial-devices binding for mp2869a/mp29612a to enable automatic matching
in device tree.

Signed-off-by: Henry Wu <Henry_Wu@quantatw.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..e9a3a6f2c59e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -287,8 +287,12 @@ properties:
           - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
+            # Monolithic Power Systems Inc. multi-phase controller mp2869a
+          - mps,mp2869a
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp29612a
+          - mps,mp29612a
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
-- 
2.43.0

