Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D71E1EB5DA
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479044; cv=none; b=ddnFhIrQunjTAmehwz13e/vfde0k1ThhIni3jCTl+to6L9NRjSDus883tAWxUoga3k6RhO/CCknOnfea+cV9AnJtR5E4N89N83Oh9GWVGs6jzVhvQH96PwKJ4usTPnCQNSEvsQoEOkwIzPxKJfYndXbP3fGKh2TOlelWiIhnECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479044; c=relaxed/simple;
	bh=5SG19wvFgbavNg9aIQxDETgEYhsFgxUgousZKkMRTDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZ7HOiqQMUnhCgs6LrhdGeO51wvKVopyYK2DPDKt6Hx2oQvc4TSR90loyUXWzW1Cl3BWc+rJhjbUCVQOpKKpo6v5aaSp8blT+RRS7mDcUAybxukjVr1PJ/A2XuN8RRLIGDVdekmvq4qVS1F8K/2d3KG1dd23ZYW/SjOmLnq+TFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00MM1Ymxz9sfF;
	Sat, 17 May 2025 12:20:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaMkn7WQlifr; Sat, 17 May 2025 12:20:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00ML1XfBz9scZ;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2EBC68B76C;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ur7_JVTsya3r; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD3D48B763;
	Sat, 17 May 2025 12:20:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKLOs013339
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKLmp013331;
	Sat, 17 May 2025 12:20:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sat, 17 May 2025 12:19:39 +0200
Message-ID: <174747706457.12970.10789323479369256227.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250413172948.207258-4-thorsten.blum@linux.dev>
References: <20250413172948.207258-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=671; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VmrCr8zAKzCrNd4nSn70Xr3yRrgBBAD2cxmoPGRn2MI=; b=f9EywaNmsT39/TksgCisYQ8rPpDUmzbx9bsDdzJM8n5LxfMw7dq3tAyrFnvPm1fgLd3WDYTqo lKbpkeEhrptDHJxNX+fazynnjNOQRmTnc+rocMJm3cBmvi5366zBolY
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Sun, 13 Apr 2025 19:29:50 +0200, Thorsten Blum wrote:
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
