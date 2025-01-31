Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9315B546
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353930; cv=none; b=oFhGsoHTC3+8zLdiGk+eOYo++jttZvvWrQKZLbM5O0XKV/GT+5XpplhpMjdsP55UMdAOpvlxv8WOzkCFC0OB4AdGd66OgJc9rxKUhwDXaXQrbOXLYwbbHeBSnOq/4tDlE4zB3lJmwNDq++yohZfdUr+v6R0bu1S8asSHBBwNYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353930; c=relaxed/simple;
	bh=l99Tw10XlLrIJFgjoDvPNQ6CXOs9b04+sUzeVk9xs4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzFVI5ouaQwW5daFxDMEwz/FTNy7i4WpVU5Edz9BwNPMjVECxKk4rAsArSzJgCTYPUOrIy5LzBGI3Wkj7USI608xCj+smSThJ0Np9TI4b+5toHrRN7WpReBv/Hw4rumY7TKTycNN1FS/2uSxMIDiAx+9O5khZl6GX/FF6klop+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=GcDOkICO; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="GcDOkICO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oONFBN9kRWZhgPfaLK5ZjKIMG9MQ+h62PBu+80B8xeI=;
	b=GcDOkICOn3Tr7pKWUWR4rcuOIbez6/m23DvRRqkDFIw0kMTlLUrUabDF9UrH2uptTcU2Zi
	8qdakhRJV6dOrsdZ40nyTp7+k6GpfULfbfDFcW8gnPaj5RVZsQmFl6G9+J9F8exYEjE5mK
	P8lv/dsSinloQ4aucEtEGHr0kxQBUqrwRoidWkkgYZ74wK30JZV/e9lnjniLHpOfepX0Jp
	wHvRjEr0htCEz55GnLQazEjAw8VkRdNzuHfxgnWOuN50tXz0CKmmLVCHGaaSW1626RzLLY
	sP5rURjoSQ7mRqiF4LHvwe7bHlRo6Jxk3QoNSuB9p572d7AmQqU2CXb8CJ8CdA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:18 +0000
Message-ID: <20250131200319.19996-2-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ferass El Hafidi <funderscore@postmarketos.org>

Add support for xiaomi-aquaman.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..0db7038b9 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - amlogic,p241
               - libretech,aml-s805x-ac
+              - xiaomi,aquaman
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
-- 
2.47.1

