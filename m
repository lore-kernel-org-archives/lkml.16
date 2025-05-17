Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ADC1F4C94
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479053; cv=none; b=Jqx106ePDqlwh6O4/LcNDJ3xnSweLLBImXjCKmm3zbciewIJO+IyJx0fSByfIHzw8ZCF2rIgJ3mpNpmYHCJwNTiC+jbneyqPujBTaWZuTyazIyt7MVdan36rnhOqceV4Ej4IbaXlr4eEZILsKzqoSVjURPpJ5Ey/+TNP9CeUSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479053; c=relaxed/simple;
	bh=h26vBZSOsZCGAlugViBuPMhuX9fgUGRD+zJez/gLX8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZieq3CzAZwF00/omB8aIslM7Qy3arrg/iQJ5KZfnmd1dEbVIJZt3Ogjj/gIdI409jo9N8ynxD86JOf4MVruAm9eeX857r0nC2YjYEvv6BAujbzbH0No7HqFaBaRSSf3wkVJNaoLprVjAfcmmIzs+VKc6wJCMpdLxi3a8uRPCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M554J3z9sZ2;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1az-eONSp1z; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M5472hz9sWb;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 893BC8B768;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mAuXfhL-4fpr; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 580218B767;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKAZE013318
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:10 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAK9d0013315;
	Sat, 17 May 2025 12:20:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
Date: Sat, 17 May 2025 12:19:36 +0200
Message-ID: <174747706455.12970.4304005569552383300.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
References: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=384; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7GZVofQG8nGnuyZNjXY2JiiuE9YdRIp5MdJCBIR1hGY=; b=EaRBaAVMTN3PcAmBZEz517zwYrr0AHDEUG0krCJsh2Pa7B9aC5uiTYcBlzZTtkGlIYVU43tOv xA12+7+7PX0DZsIXdSHYq8KemAdEUkFJvhz9jcmW+IqgnRcZJp3JgVQ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Fri, 04 Apr 2025 13:24:07 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of such
> drivers.
> 
> 

Applied, thanks!

[1/1] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
      commit: 617a7ed073115016e417b518c68c96057f1bf66c

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>
