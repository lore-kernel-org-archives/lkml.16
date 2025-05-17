Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98AE1F4C85
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479058; cv=none; b=mwGYPwUT+saztSpLohD/5DoByErJ0nIYjyhboj1lpp3gQOExGKcALDLyANu4fjn1mTE5SEkLuNkwLjPZLuWA3MtYWhfsmhYEzYBh8uK+fJJ0TmDLkFxvUX3QtTt5N3OOGlXXn3FTdUMznhRx2DDPz7XBtctro1fIrXQGXo2MFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479058; c=relaxed/simple;
	bh=W2szJNh0Cou1FWEFeZTPmBSB8+UckQAm1YZPA0vLsI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z5/Vh2Uvu65SV3aPZeizYfJeQGSBbczSSaKPY5B0j7OkD92kytYxrjcvIuTb6l/JtDNaH/ClYjx894H/tccTYzwoNNgo+XyGgXByWouZc58JB6tBm59XUJk5Sf1AwZsw6JV1n0rE4pUsFNG0ySv4TYG4o+ZTMhVQDulLPVwGGR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00M63T1Xz9sWb;
	Sat, 17 May 2025 12:20:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5WR6SaDXKDR; Sat, 17 May 2025 12:20:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00M54MKVz9sYQ;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 916848B767;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5a4ytmCj7k7m; Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 57FEF8B763;
	Sat, 17 May 2025 12:20:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKChm013324
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:12 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKAOe013321;
	Sat, 17 May 2025 12:20:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: qiang.zhao@nxp.com, Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Sat, 17 May 2025 12:19:37 +0200
Message-ID: <174747706462.12970.7308015211348240691.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250515083919.3811473-1-nichen@iscas.ac.cn>
References: <20250515083919.3811473-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=445; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QUgzluer8yWbklILpqvTZIvYWxJlUPH1isJ6Z8FhIEk=; b=pQs8UzFywkxRkHAAXzbabVgBKt/zw2mtRTUaXgdw12fvhe2X4vMySzp+cMmb138Tt1mFER2xv olckTPdFsd7AAjDltcPnWmf4f1zbly0PskqxLmQR0TaVjig+zSlZPAu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Thu, 15 May 2025 16:39:19 +0800, Chen Ni wrote:
> Chained irq handlers usually set up handler data as well.
> irq_set_chained_handler_and_data() can set both under irq_desc->lock.
> Replace the two calls with one.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: Consolidate chained IRQ handler install/remove
      commit: 695d702f42bf4bd335e30f542ca710af081ee2a3

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>
