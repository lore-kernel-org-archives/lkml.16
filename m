Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9171EF377
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370585; cv=none; b=RNcBPf91P/uM1i7N3Vgt9k5fbs2cLy0HLO/+8Wn0MnawzbnE/FLzOJmKBuGjNKAd5LhDpRh9R5skvJ3i+U48pWdFWpfQzdupnnKkXOnK0nluI6HEIjw6igBCB+Gtr+9QvDRVn7twvgJ4lFwINgNVSHjGyUNcPCBnQvHkW0eSSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370585; c=relaxed/simple;
	bh=b5drFIBe75sGDj5pYe0brea2ZUmu6wtu9bzah0lST80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XF4YJSrScA8A78EAnIxrmPJnAMFWqEq1Lhs9PVsc5U55VN/gW5fKHoWvU/2DU+iPVEWbxXqYGlsk4JPla3WvHxe4DXi8CxawcRn8KEsWJ/7CXBaFXqCQ8g8YEzJakgDy5+40FdyUyp9ji1d+gcWF3U1t/9nu9Hi7nkFdFhWnURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4evDNfi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4evDNfi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so18861315e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370581; x=1744975381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyzR9vVasmK/SdhNh8h5VH0sOIqi40QOhEUqjrHqr/I=;
        b=s4evDNfiDuPUXeSEjqu2vV75b6LK2sURLySHGmZlPfIOY45M8/5B/OcQUgkH44JghU
         oxZ+eI76NYwzgn4FIQqRXd82wBOs9t7H9bpeed6Rr7KW5tnwABuJlBmeYz+tzdKo19SO
         KLMgsmyXV8aeSCMIlfg3K+w1HEeNtIHGiB0CTc10+N5m2l2hEuJ1OHVng7odR5+MsKG8
         iH0vH67940+wMta4ptR/11iPfm22jkbodUJE4IwGj8ciJFhqt17ixEVYgKyNZiBYmEgU
         bOjxtMUKvaisG3tx6gwF8y8g5WdUdfYFSZLcEUATf91RpX2EV9YMyO8lxDilY2gdSzKi
         ZTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370581; x=1744975381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyzR9vVasmK/SdhNh8h5VH0sOIqi40QOhEUqjrHqr/I=;
        b=fwrqjGl8ULLauHvC6wB6LVd8vTiB8GguLCmKXDMOifas87Rc/jDgoBN5WcQlFz+oWO
         MgTsfPIx+RUdj5yhN/SQ53rZ/PshPLzw/fCBKsCWKftOHw3JYvP46lQcnQQ5MZOWru1W
         Em54I/LREjSD4OIxRVco8gpdcOKxzL/nY4dZNI6FKt2K4vO2C3KqMGVI6KAFoBpAf7oE
         GWHY0D66LNFwO6Z/7uW7ca00yyPNrys4lj2euUtgI4AMbqZ354BldPMNTZeFYTCVd1+w
         lxIVIVBrQL1avXQhki2jTsgSNHUR/7ssy2SR9nomgyiWSZiXO+B9xn9D5DiM/H+p8mow
         v03Q==
X-Gm-Message-State: AOJu0YzmXnBVKuG3jpvNGWgriS/QScStYA/Le13MnTxsyjLnGPKT9Z0i
	2VCf2kIRx7Fi92AuuecI17gN0DqMM7Rr54cbaPf+kSAQ2AXRfzQm3wvOh44txzQ=
X-Gm-Gg: ASbGncv2wRwBndkG046K1FoS6rEQcdpI1kUP4536Zy9wT72DV7JAvSS5Ns+HpeXd242
	k6n2wDpnTY7KeEAJsVgO38UlC5XH7fKELi1xRJ/7lqNNAhsqruLdALB+oZEPRHLGYyMTo07mcga
	1XfiYzdXx0yJptvuSc6Ym6HopXjwx0NlFHkYPJVS8y96msL6l3xXXpd3wuACRnDvdGBbzzqduj7
	mmda1RcGzse0dOkKmKCCN4ijDejg6xGI+PQ86PtMB/+Z4Z84r96AxaLyKbrQj1qFnE1Jg+D846S
	KOoGAf3sbA97pHQWM8MBzhQAx50TGGHqxHFIRdIiYseaQpakacUTtKxZUkFYdoPKIA==
X-Google-Smtp-Source: AGHT+IHcMuftL+qMMZJe4OpbHonuP0rQW0oVBwroJeC9iZkW/OIpD5Brd+qRZCgQlHio0mXZj/pXag==
X-Received: by 2002:a05:6000:4403:b0:39c:1257:cc28 with SMTP id ffacd0b85a97d-39eaaedc75fmr1380965f8f.59.1744370581512;
        Fri, 11 Apr 2025 04:23:01 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:01 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 01/13] nvmem: rockchip-otp: Move read-offset into variant-data
Date: Fri, 11 Apr 2025 12:22:39 +0100
Message-Id: <20250411112251.68002-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

