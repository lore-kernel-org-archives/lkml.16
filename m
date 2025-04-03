Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4524C08C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691522; cv=none; b=lqodCLcHPO7IB8euWfarbjqBJh7IUS2XmgNCYEsylSHKY05jaijbLFYYkdM2U+cIxY1VRSu4ZiuqOW71s9IgYHJ0rQ8IWjHO+Kp5WbO3viqczXHwXqozCKsAfmFAH2Lm8zwbRoAJ2qejsk64V+UE3JbgmOUYyQocBbKR9J28a/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691522; c=relaxed/simple;
	bh=b5drFIBe75sGDj5pYe0brea2ZUmu6wtu9bzah0lST80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QHBtFRV4NY0NytszMdbWs+5Dr7mlr9cPknLN/EMLfqOZrY3g1bUp4OSa6s9RBowLPBfek7GOrzT/91wSCoVLJ1jSfvw9xMMjCGrOAJHMva77/E2P6MsKKwSfBPqs2BhDbI87EMy2UldbFSYK7zPp6SC133/LEaPW9jCOWcFqPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrxC0dOb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrxC0dOb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso7726515e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691519; x=1744296319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyzR9vVasmK/SdhNh8h5VH0sOIqi40QOhEUqjrHqr/I=;
        b=nrxC0dOb+MehyNNoVqUwA4+NEi3opQVKe4Y4yttJntKzXqVvPjDuCRHkyEyFeAHTh5
         OB1B6ZlzTyxI7M1xeRMz2nSTqaE2cD7sf1tNHKORmxpn5iCeVxe3fjgBffOqossr0tC4
         xQGqR/BMxQLBCIu6YBafysLRaLMWCQ0OSgvLanT0gunYPj2NJgljRP1PjlwEsbPcTff+
         HtpXJf9CnPY5OJ+nL74VdBkNqcphQs3DTYXeO0USDMv/olE/q5lezMeU8w2LFhStQvDi
         Hv61t3A4f5N7rTZpvrXSSkjoAho8bEyTfEB5gDH7OZzdZTPsn9vQlb8TwVKkh7honc9I
         +AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691519; x=1744296319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyzR9vVasmK/SdhNh8h5VH0sOIqi40QOhEUqjrHqr/I=;
        b=eJ7ogwUtYxqKvX9SplOFnpGA6VxcDEa2PVobJtEbCDmLfkacxlQvBw4tr8v23IwAJd
         KHezWT7IVcKppDJe6JyazH5xM2XyxN6wy6rB56Ocmkv8j6hVaHulvFjb5uYvdOGyHztM
         qr5BIRPlOYVumNDgISvwgl1Q/kZenP5cYQR3QxP41Pqe+9TjIHVyw8e/usgPSRLgdnVx
         dLTW+a7NU52sUklxO8L+i+u7SMNPa0WeVCN7g/gfXcuvszL1dsrIMGZ4YMogTeeplkFO
         rwDHV6eUCh0PAr4h/wGlVGo4GSFf+FbNbfR/as0jpB6yNCoMUgqYN9fTa+Z4OSzKW62E
         A5hg==
X-Gm-Message-State: AOJu0YylioJAD8yOtLQj/wOpN9Iga5CgMPtHGorrsSLgHEv3eQ8gcEYo
	GLWR1htBgP12e00wsUH8/hC8bbSql5c+Fx6dkTeKSXfi/RloN3oHhhA9KIaO1EYZHmAnzAmy0dh
	VWhg=
X-Gm-Gg: ASbGncs9luV6njYVp7x06IIbFMc+SLaGWDelVp6bkcw5+e3kmvcPlj33Wq0LdlTR45a
	lty5LLfD1WYkTzyosBS3m85GK/5wB8Np7eDxK9ieu63ILIfngY4I0lJdvpo1Yv8OsC/z5JjFQO7
	3E/Q0OKDlMURo+l3VNykpEbNemRLt80R3frXll8DpTuGQeNnylPNWOIe0yXFIsNbV7AmE/5s+XE
	K4zXXxz3lavCQsG638+QaklZ+0kRcqAfaw+9HysGBFv7YLr2k/TE+781CYRwF/ZYyGHxDBkO5NG
	9b3jLr0cVpbvJrJEHGwtEHFm1kaBsjonvVqJiyflwgnICbIHhxBz2ZVQPONcg63zBHCMYA==
X-Google-Smtp-Source: AGHT+IH0iMeKKMC+wZydMrOah60Xbr+10s98wL7yVa6NAvfm2lz08QmrbfSKu+pAk+G9NeRjOqsXmw==
X-Received: by 2002:a5d:59a8:0:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39c2f951024mr2831126f8f.36.1743691518912;
        Thu, 03 Apr 2025 07:45:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:17 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 01/13] nvmem: rockchip-otp: Move read-offset into variant-data
Date: Thu,  3 Apr 2025 15:44:49 +0100
Message-Id: <20250403144501.202742-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=XTvrcZqujpYXE39Dy8u7O/ipvxv7YOZitDWD3sP10jE=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7iMkQcXUBxWRmO53FvtV/c/ywna5XAFDj66 YJ243dNYNeJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV N8wfB/9uB118OSywUpiguq2Y7sDE9F8oluYNO+2FFJQvBINm9M7VHVnH6+c2dItsxZYu90Y09Y/ Z7HTprs6P4U9mFcRPN9yig3ccWdNRWiAc0oae4GPMHvGpZKPQwLDaxlIsirbKbyGq7KCttAknfz bRTG5Kx4EjXtrTsP/YMUFgdWwjqWLi6doP0XJD/DCw0mhEQbePf4frEbX8gecrrFeA9caRCqeD4 B5JxneBOj9IF8mHGk9WxLv+PPImEPEVon7PZsVuTwKHZFcUuO/9ok1vMf6eQjRH84N3O13KNl3Z h9Uc3xNd8j+3bh/KuO5qslZciOkCNm9Cz+ehibn5SSmCzChy
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

The RK3588 has an offset into the OTP area where the readable area begins
and automatically adds this to the start address.
Other variants are very much similar to rk3588, just with a different
offset, so move that value into variant-data.

To match the size in bytes, store this value also in bytes and not in
number of blocks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/rockchip-otp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index ebc3f0b24166..3edfbfc2d722 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -59,7 +59,6 @@
 #define RK3588_OTPC_AUTO_EN		0x08
 #define RK3588_OTPC_INT_ST		0x84
 #define RK3588_OTPC_DOUT0		0x20
-#define RK3588_NO_SECURE_OFFSET		0x300
 #define RK3588_NBYTES			4
 #define RK3588_BURST_NUM		1
 #define RK3588_BURST_SHIFT		8
@@ -69,6 +68,7 @@
 
 struct rockchip_data {
 	int size;
+	int read_offset;
 	const char * const *clks;
 	int num_clks;
 	nvmem_reg_read_t reg_read;
@@ -196,7 +196,7 @@ static int rk3588_otp_read(void *context, unsigned int offset,
 	addr_start = round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_end = round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_len = addr_end - addr_start;
-	addr_start += RK3588_NO_SECURE_OFFSET;
+	addr_start += otp->data->read_offset / RK3588_NBYTES;
 
 	buf = kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
 	if (!buf)
@@ -280,6 +280,7 @@ static const char * const rk3588_otp_clocks[] = {
 
 static const struct rockchip_data rk3588_data = {
 	.size = 0x400,
+	.read_offset = 0xc00,
 	.clks = rk3588_otp_clocks,
 	.num_clks = ARRAY_SIZE(rk3588_otp_clocks),
 	.reg_read = rk3588_otp_read,
-- 
2.25.1

