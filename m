Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39E1C3C1E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179886; cv=none; b=Loko/5o8E6NpMvmegGFCSFpBMDZ4hu805X8kxL+l+bQny+6+msOK765SfD8gabnj7vsU25IKyUx6IM6DTPKaEuczYsOoYOxuWzT+qKZk6Um9HH+UEYSMvQ/g/3ChV7P8Ew9vFJU51URFmixc4lCwZOauqrx33H869T2SSpe3hzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179886; c=relaxed/simple;
	bh=3iK9dqQG88KBmhm60ZuGRWIxcJgWWJvBwh7KKVLBzPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxZQbrhsn6sKwnNxRy9lerlvg2ZIwXbc5BlT057DRtsoyoEmpnmJD038hG79ZzzOPmBxfNgT9tYyDHQM0ZlN4uO8rarKR65z3Li6XaUJtbZL2Y3rhlj6JPFb/2lW7qLhb9YA0ofzdYSRMJk2kb76bQqOmSf9u+VDVOZ0UlEE9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3udUKmH; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3udUKmH"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a6bso45021401fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179883; x=1739784683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCNlscT97V9uOIoODPoJkucU+X2AI35SBhIpZ9hJ5mY=;
        b=N3udUKmHdJlK6aYc5I9LPiyWmu0drmx+mjlU66uglhM6KPRnd7CFyOxDj9/hHqjjsp
         8R56kb9DrxpWcoksf40eAekxUpuY2xFBpmqos87Cpxs2cJuiOCvSGA+7qptJUBqmyCG0
         5PKh1rK2aFJQVbGYcE6r3iDLyqbriuSBXAZ74kQNDF76bG6DpaRwtoRsE4H873z5UGqm
         FUsPGtYCiPZxQIbtEnxo7K1KYdIG3klXSjI02zOIRkaT8//4283O2bbSzKCw1YMTqUsS
         2cx4UsOES58knfKmYYsjiOgcD+UziNOCMRHrDUpbtPGUnA7rT0wJ2/PgyCEz2FFzayTE
         aGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179883; x=1739784683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCNlscT97V9uOIoODPoJkucU+X2AI35SBhIpZ9hJ5mY=;
        b=k0/KlOqS+dSLKZrLUoj0tZgbjQ2Ch3/iOO4+ffrwvyA1IHcqHcspw/CM+2GvQut6Ns
         UQSvdNEQZ20o9QW9sSVkbyCxhq2Tz25jg+dFpDMdrvVhnxX4x1oc7jlm2c6RGeQy3GG+
         QPDRIqZcpKY3bmUHp+p+Vzst6kK3uoxfv1VFadznNZBdf8UoownMmuUDmFiV4PFmWHx+
         kOt+aUi9q3IW0JCVjzfxnjut2o8geO6GUBYYRkbhawsJbv9yKUZ5NZwJ9jR68RHuYZKw
         DNqF/hXaaSHGSu/DKrywPqByKXDHaMI8c1uJV+4ChAZRlvAOtrqvRR+JxI2vIzzP7f/m
         sOLA==
X-Forwarded-Encrypted: i=1; AJvYcCVoammNMcuH2oEBHlJ9qr0gOSa4W/j02mUJMeV+mhvcxU9E8ErDgsGhka6CDGkaMIP/eAvHsOYWaFlX+KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyLTLiK2aOFgEA9RcyN7s/XB4gT/ZhgMw2LdVQaJWzHdwIvPT
	G9+5vOUjpForZ6leJUUxV2dvx+qGiGwSqC7QCUot47bwj/ew4RyTb150EzXaKnUpny8oqKaPslF
	0
X-Gm-Gg: ASbGnct6iJWxK9clAFIIAHDetGyDJHQDaCtr+HspSflDmNB0TfWcAHqFCfxOc3O8wv8
	5nImIqxa1FpVOVGEylounVMDZOHBXCyUZ7TfYw2SVCOCDxYNaylhksZGHpD1w9CRwdGrnNoQTng
	EnLM/gsedjzCCAXWN+/7gEUmPKnYPwM7ha0I7EXMN4dn8T1N8UBMH13ptXlarF4YFKHq6EoMiqX
	GHvVesp8EBWOhDjUC0ETpJDdfJQpzu9P5REZCbjXnNujqg+Gv9Nj0jo0Btt9IURUcbdOSUDUpIT
	AG3fR5mjkVQ0cgbuQmv5QNFinA==
X-Google-Smtp-Source: AGHT+IF0ul+u2dEeOp3LqnjYMyturrxBFsVvJjJz6HlDQToqwwLAAyyKMNFXqRlaK4DudcIvgifQSg==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id 38308e7fff4ca-308e54d63b4mr16025771fa.24.1739179882786;
        Mon, 10 Feb 2025 01:31:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:16 +0100
Subject: [PATCH 2/3] ARM: dts: ixp4xx: Fix up PCI on WG302
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-2-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Looking at the board file for WG302 v2 was not a good idea
because the GPIO IRQ for slot 2 differs, and v1 uses GPIO
10 instead of GPIO 9. Fix it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
index 19d56e9aec9d89ce0ad109fbc6bb6e26327997f9..af7b6a976d3dd61f3c6846c73b8788437dea20e3 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
@@ -57,7 +57,7 @@ pci@c0000000 {
 			status = "okay";
 
 			/*
-			 * Taken from WG302 v2 PCI boardfile (wg302v2-pci.c)
+			 * Taken from WG302 v1 PCI boardfile (wg302v1-pci.c)
 			 * We have slots (IDSEL) 1 and 2 with one assigned IRQ
 			 * each handling all IRQs.
 			 */
@@ -70,10 +70,10 @@ pci@c0000000 {
 			<0x0800 0 0 3 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 1 is irq 8 */
 			<0x0800 0 0 4 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT D on slot 1 is irq 8 */
 			/* IDSEL 2 */
-			<0x1000 0 0 1 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 2 is irq 9 */
-			<0x1000 0 0 2 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 2 is irq 9 */
-			<0x1000 0 0 3 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 2 is irq 9 */
-			<0x1000 0 0 4 &gpio0 9 IRQ_TYPE_LEVEL_LOW>; /* INT D on slot 2 is irq 9 */
+			<0x1000 0 0 1 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 2 is irq 10 */
+			<0x1000 0 0 2 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 2 is irq 10 */
+			<0x1000 0 0 3 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 2 is irq 10 */
+			<0x1000 0 0 4 &gpio0 10 IRQ_TYPE_LEVEL_LOW>; /* INT D on slot 2 is irq 10 */
 		};
 
 		ethernet@c8009000 {

-- 
2.48.1

