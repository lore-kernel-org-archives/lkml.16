Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29A1DE2C2;
	Thu, 12 Jun 2025 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713554; cv=none; b=Eq2zorw9fQeSQSSelya4ZxV+qhzpHvCe3VOSd03x5tQX2VAZYk+vEqISJFQuxXLWtkZJlhayjkkYXXSU+QIuI5o6YOsykeylT4wUWCiX1+iXJE88Nzjr915Z26ewdKHbuL8OZlijz4oAy06WjERU9EDF9Ll/QYPDWPkikpZT0Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713554; c=relaxed/simple;
	bh=Rxi+EBTs4u15/pEW6raBmajD2YKuWXvlshWS3G5v58Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8IvBJbsOiNR1/GNiu6dMF2FcEF7xVhYFfLKXbkYHDL3aGDp+zBw3JqU8nJyM5ghTPKrecKproCeus2xiBJg0M2Y8RIcpaNRhlqrbsDnHYO6+CdUz6nGTZ8t7MnvmT8Iv1GMOqFfITMIJOJRe7qRdEkThrsp55cyqJLpti1eBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loTSTQzC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loTSTQzC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so571723f8f.3;
        Thu, 12 Jun 2025 00:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749713551; x=1750318351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nJSFfJ/bUnK8CTdixwGEX8vTvp5ekIqyzTu6VwV/is=;
        b=loTSTQzCWlRydmjLWJVNPirZaa4KGgC6f7LjuSNxgOnx68qo3rD1vZbVLGk4P5Tsr6
         /nxcL0e2AnROprDmVW/ZiZk3BJMFSUrlNHZqyLdXd+zQmlxa6NoIoh66wxOp4YGPz/RY
         9WYb94n/sMwLgvoRuxOxHcxhJiSMsx79ofrTddZ1/io9h2sXBrvc7RRfrFef7O2uHpDt
         VP3FmOE0t4DcMcT+ibWe7nYXHjYzzoSFc3UXG7bj8JEDhIkzl9ebwY3+n/mV4WsTgI0T
         pMSkYyNHauMRoLqbuBUBjxX031DUOIUT4JzOg95bYMv9uFTFhdNmLso1Ml/HgtYQ0FtN
         9bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713551; x=1750318351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nJSFfJ/bUnK8CTdixwGEX8vTvp5ekIqyzTu6VwV/is=;
        b=BE5G0ggkYxBguDn1nJemkXimHaS8MgZ7oRH6i3incLSSanGfvRLPI/OGNwDuuRtkYe
         I30tLdNDyEP9u/VgvC6bGOdfDDV96UCOAcdrMiUQFTNMSjIucvGAlePx65lYHNF+bFz8
         RusZyKuhfwc5WHu0rDhRak35eoLe8x6d++1EspJ+/0ZeynaMGn4xUh44LEuSfXMfGvVW
         ZNDha6WU1HUZs29roCE+4V2LnHKJHllKMOGDdIjEZnDXmlUufRvqSUXHzZGYoIyVE3at
         pHXYLiIlDa8aY1VDfyVo6HNRtYPjILwzNjYQI5rRsAlCzU6LwFBR+LfqLiCVk0grqdEs
         Du1g==
X-Forwarded-Encrypted: i=1; AJvYcCUdE82Wl6m+IDATUhIMNZlH9ko9FC22ARo8SZg/JCuqt+8fYsn8/yoRkdFOiD9pqHBgWZSSsWLGdUdv@vger.kernel.org, AJvYcCVOXCVG9+dg/5o7m5OQnbz5AeLiXG1C9BHF5hPkSrcsLoDKwn5kshzZC6gljiXehva/i7/LJU4+HadU1aK/@vger.kernel.org
X-Gm-Message-State: AOJu0YwbnopIVPtPdCDS10lpCviExbliZ6JuJw7x9/Bq4amjbnyk835B
	zqkqQyGDp3ggbvFwU85IkdVLYaVOrc1isksfzT0c7aEAR4IL9U4LnPSt
X-Gm-Gg: ASbGncv73jW0pwhwr7D7NiBFEWVZd3hDz/ERv1pATXtUNZ2sGrv0CFuvi3nTYg9iG6s
	cc9zVFfVSEVokrXd29rtSDY+vJ+71BQXWSxc+tquC1O/7PvypRCXOztIcEgJ8acNW54oBraiW1K
	fy8w4d/Ezf2C9Fr6d4HQ1OORNzl6WTg1aRjOanpOO8tIE+3ajHI5wwm9b7gRRxLoDvMFZNwjrvc
	zgpKlsv+8nGTZWlewSzoYQT+SPrYsOK9qmXWVPioLnl71UV43V2hnx8h6GPlc+VwEywg2iIr9/8
	PYkbz2/kczeAb+IhastoeTYEM5L2e0N+LiuEOsPwe0BOpTwbIl54/9c5u25HuFmV6dbiZPB7hia
	2X7M+WGQnmH2k9x3/bA==
X-Google-Smtp-Source: AGHT+IHVJvybZpNkWYPnAXxdH3k4gem9mzuYdsUxbgs6JG5lAwa/abt1yXNl01UZ8vzSBfn4TdjpIw==
X-Received: by 2002:a05:6000:1ac7:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3a56130bd70mr1447886f8f.52.1749713551127;
        Thu, 12 Jun 2025 00:32:31 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b5125csm1126312f8f.70.2025.06.12.00.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:32:30 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: abd.masalkhi@gmail.com
Cc: W_Armin@gmx.de,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: [PATCH v4 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Thu, 12 Jun 2025 07:32:29 +0000
Message-ID: <20250612073229.3370781-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608182714.3359441-4-abd.masalkhi@gmail.com>
References: <20250608182714.3359441-4-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Greg,

> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/unlock
> +Date:           2025-06-8
> +KernelVersion:  6.15

Apologies for the typo, the correct kernel version should be 6.17,
targeting the next available merge window.

Should I resubmit the entire series as v5 with this fix applied, or
is it acceptable to submit a single follow-up patch that corrects it?

Thank you for your guidance.

Best regards,
Abd-Alrhman Masalkhi
