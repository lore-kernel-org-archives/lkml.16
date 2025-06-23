Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514082C3265;
	Mon, 23 Jun 2025 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695162; cv=none; b=UH+Unbb8unD+csqiooIuT29ZzIFWqGdlk/ZqKwMNXf9UxYHVx/J+Sp1aPXW6NJpOHA5KzimsHfO3ZKLWrKMKptFmRhRmH0EGgMyE6uoaSBHC/8E0tpgUzmZrBVDpoyyMiqpEvubMhTKcgYX60j3LXBiliZgZpepcPDLyQyw2ySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695162; c=relaxed/simple;
	bh=NGNHqVeHxydNd/a2vIf96yJJA/aOVMOt2dlmMgPjKOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXX9jvFBsLUSsyzyrvo+jAny8Tly045bIsox21L7+qLIQW6gQhIJgSdaA9FN6ZiiU9tjxu3bw/x3IUCp46NFL5H+ZuWa2XDQ2H6Bcc3ZJRwRO693QssKWKrN/Ff11PAmI6iZ8A01eQTCA4erB1GeFfxtRDICMdvtPS3MtvnY7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1boP2I4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1boP2I4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3838613b3a.0;
        Mon, 23 Jun 2025 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695160; x=1751299960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f78YX8Jv2hkXlixOcjovzULMHQy54ZDO00RkiEOZMLg=;
        b=a1boP2I4O+S+6yxw1IckzVyj8Gye9uSCo0UqRIPx//MMs/nwnuY6FjvbkpTnhQVY3N
         o0xIQmMTv6e52BYSWwyVtUZgK9Q5qhpHEKPJSTV+suSS6cWSGn3p6wI6Hp5CRIEgfOuO
         vbZFClP1Al39gSOBCFINjzb1DadlInC1y3VUzq9Uh+WfaLJvDFwwRyFQ6UftVTCHoZ3g
         i+cO/NoAclUQ2/UR8kExNLctNNppNALTaFOEFXayB8obPBw2wx+zZS6MT47/JRNjdkkG
         sxXnvuUAq7PbmS2Vc8vyCv19DBE68tHgqXyFNiV5vl0Y5f3n7q82MkZaD6GbjZDWI38S
         xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695160; x=1751299960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f78YX8Jv2hkXlixOcjovzULMHQy54ZDO00RkiEOZMLg=;
        b=I/+OalDFw12TlTGFtDBlPVPUAKMcl4zufyQHrmjPbZnf+w0tz5pyexle6i5XjBOFY6
         QoEBQiTE8dV7py3YeVjQLrVo0mBsdHJt9EC9MtAwtI9+Kv4NR/vczQ9maIsMDIgmD6Oc
         QtMqBvRatA8ZCgxh6K0mqDaeqdqF/fUQS7Pt0kxswjWP1DX4wTJFv6ZcBu9eM7PoZusK
         +R9XGSmgYmoafuv/5gQAxa4HKHqArfW56pemKfzkH8zmfKm18Rsu8sWhqERy0suGL5do
         fvoe135j9g/6dCJzZLyV5+SMvX3pzK0Tg/lz/mYzZnVtOfv437gEidb0Z/l2hC8HsfOK
         /FAw==
X-Forwarded-Encrypted: i=1; AJvYcCWKepFD5loxVIhGPzHR7dZiuIty9uVpzbR7f+ZP3PmVhC9JAfxvEg0qcMpKRULVDBt2blrcYP+YY/Os@vger.kernel.org, AJvYcCWflq2izVN9/meynruuuaelrKjHqD0yHSzlMEOp9IslicOhvlzYDNlPDxG15OIOQLzQqMkj7X8KZtfItUP3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Oh7ZZXT570WoXM8DDQIfT6yPJyvS766k9kpmYI4vHo8qRFAB
	rJuyQxUfL83Ahuma3HevYz4JMHy1kC2meozOY//DcJqowOcBiscnd6voZaQKgpTG
X-Gm-Gg: ASbGncs59NZqg4dmzYwCeTItLdU0ValINP4n/qHUATl0cPt/2wUUlPDZnQZzeUcw89d
	zXgW65k22//eR/XKaJ9AVJG+hI4zAHSsGes6eECSbhRSKmK422NNIMj0Oad1mTMfDyQ8P+q6oSM
	eBntguesXfhF5Z5ffcSiUI+ipHRa8PuV0+z0gL05cstKmGjFsJNcKuB5bScr5zjduiES3CpYPZ7
	7PJxKC/a8D3OmKueuQVcjb7Ky0AkNO/Z1QvpZNErqlhhBNeiOkpoyuaek/2KxKd3M8NLSNoBYxv
	AdmyDdy4blBllPMd5uABQV+sTMrr27zDvVmJCOiuqcvJBzfL3HUAB0K83ZqQlVF9oO+wr+Xw9u1
	rUo+sFFb5Y28a5nk=
X-Google-Smtp-Source: AGHT+IEQFD7ncJGbn/pBz/+p1d4K7L7mh1a5kN90gM3aF97um4Xo6JRQuOcwRlaKlzaUrBNsaYvNLw==
X-Received: by 2002:a05:6a00:2e18:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-7490d723218mr17461031b3a.16.1750695160533;
        Mon, 23 Jun 2025 09:12:40 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:40 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Mon, 23 Jun 2025 13:12:27 -0300
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p-verdin: Adjust temperature
 trip points
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-2-cc185ba5843d@toradex.com>
References: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
In-Reply-To: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

While the TI AM62P supports a junction temperature (Tj) of up to 125°C
for industrial and automotive parts, Toradex Verdin-AM62P hardware
lifetime guarantees consider a 105°C Tj. Change the passive trip points
to 95°C and the critical trip points to 105°C to be compliant with the
hardware specifications.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 226398c37fa9b348b8ea30e1e21f75e98bd3d60b..7676b24b13f67da81245c023e0fdc27294efec82 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -848,6 +848,30 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
 	};
 };
 
+&main0_alert {
+	temperature = <95000>;
+};
+
+&main0_crit {
+	temperature = <105000>;
+};
+
+&main1_alert {
+	temperature = <95000>;
+};
+
+&main1_crit {
+	temperature = <105000>;
+};
+
+&main2_alert {
+	temperature = <95000>;
+};
+
+&main2_crit {
+	temperature = <105000>;
+};
+
 &main_gpio0 {
 	gpio-line-names =
 		"SODIMM_52",

-- 
2.43.0

