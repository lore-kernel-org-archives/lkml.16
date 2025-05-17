Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69C31EB5DA
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479040; cv=none; b=J5af/xb4LRkDHuY17CMFfUUGo2C1niLbDfLlD3NOU4hUld3SxmRktyzhHxwXUGF3eJbEil9jbhtYAFDCSO2+/FJCt55g/2cprbh6NQd+E3+IbV1qvF1mVanCflOXrrOEButIuBMJ5QuZPZI63FTwqgzeMZvD7y0C4MoCwl8Veu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479040; c=relaxed/simple;
	bh=9IJRMUDl0W4Nj2xp0CSKskCMgMCmRN6k8RLDVc62IRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/VVssFkIk7Anx2RzuOhZ31+zqdKi3e7UG2iAep3LtlkBhtU0giA0xs9ENHCteYpP1fGWuWSpEb57S1s/e+IX7Xa8rOiHxpQGCGWQ8y4i7Y85P60lytCIDZKfQxKiOGYyyc/rtqe0Sqr2gorwTQvdOeDy/PeMsegoWHCRnBSOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00ML269qz9sd1;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_j-kwnIF3ju; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00ML1S3rz9scH;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C26F8B768;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id x8KOnfLvFbC2; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD4468B767;
	Sat, 17 May 2025 12:20:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKL7u013343
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKLua013342;
	Sat, 17 May 2025 12:20:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sat, 17 May 2025 12:19:40 +0200
Message-ID: <174747706461.12970.12407868094636158420.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429104149.66334-1-thorsten.blum@linux.dev>
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=671; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XARyMbMk0ocC0UV7ijn+e4ygQ6tnPtTPYUc6a6ZTFP0=; b=fkqCiXLFaISyXqz2xP4gHlZDKtyZDvfwuga56YIyOEnd0km5wkX/PCp9NOkV7Mx6YutdOhz/h PA8WrhPkw7zA0xZr/GdsY1tjFtS1EH2vVWIjvpac6rM2w7jHCLRReMH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Tue, 29 Apr 2025 12:41:48 +0200, Thorsten Blum wrote:
> Both destination buffers are already zero-initialized, making strscpy()
> sufficient for safely copying 'obj_type'. The additional NUL-padding
> performed by strscpy_pad() is unnecessary.
> 
> If the destination buffer has a fixed length, strscpy() automatically
> determines its size using sizeof() when the argument is omitted. This
> makes the explicit size arguments unnecessary.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
      commit: 61ddf5faa7cc091b409936d571ec1af34ce487a1

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>
