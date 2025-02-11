Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AF71E9B3B;
	Tue, 11 Feb 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254995; cv=none; b=F09eimW5aUdrTktMAJRw5u+jSWkVptZkAhv+Z6r8PpLLvSu4oYR39QdwWo+2GibE7r7pqMOrhYOozhfSJtjQWDgzPbm+Mv5Vgvo+pV+5XWEdC9bHOu+Fxwjv57xOVM5gQJsmWx5Kzc35p8K6KtGXVSyp6uE/IRAiBwkxhX7kij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254995; c=relaxed/simple;
	bh=xJJNTHLm28pOieLtRLXBCsjINp9HkQQLtgWkMVSB5X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuQUwBMXN3stOUtWtChM2aequpRtN4UDRyB+Wjfbiaa+axjsmomOMv1BSFsefuuDNYoR07KIwjQQN+nJ2vmW5y9x4LNvMxfO/rhNEI7+XbskD0cakZyur0VmoTQHngVcJrdgf0/oL8V+HWt0l+1repUeCHrL6QDJoolT0gHHQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL55aSTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL55aSTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26AFC4CEF0;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=xJJNTHLm28pOieLtRLXBCsjINp9HkQQLtgWkMVSB5X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FL55aSTeN5bnsbco4QM1TbvJO0WsQw3bepNk4uiUiEDE7xGFPjsbuhAaxJyMfHr5g
	 cJEIIhiWg3EK8fDk2j53hmb0wArtgfRD9tr4j3Xm37/g3DINHkvRxrOf9tZcZwaghc
	 MQ0l36Dl4srDoPB70+Zvm8OTSQySnwc5KSoGVKMmZxnrila95sOxN59sBtNLf9xPB3
	 59kMltV7jnLlSNbG94xQEf5Xr+CjzJugeAv/tcqFWz5RuB7nNEH2QAAxbhmQSmBQcI
	 cFHJ7ys5/wASU9F59vhxInMY6/eg8CQCOAjoUy1FApWId/AjpwmCmQGABEx+5wgUWC
	 8aGJt2FDTm1Ew==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBn-40dj;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Alex Shi <mchehab+huawei@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Carlos Bilbao <mchehab+huawei@kernel.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Remington Brasga <rbrasga@uci.edu>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] docs: translations: Allow creating cross-references for ABI README
Date: Tue, 11 Feb 2025 07:23:03 +0100
Message-ID: <685461ca5834c0cd4f7830f354d7ee123afb3716.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Update translations to also generate cross references for the ABI
readme file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
 Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 692be4af9c9b..3308c3084c60 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -58,7 +58,7 @@ Fornite documentazione
 4) Tutti i nuovi parametri dei moduli sono documentati con ``MODULE_PARM_DESC()``.
 
 5) Tutte le nuove interfacce verso lo spazio utente sono documentate in
-    ``Documentation/ABI/``.  Leggete ``Documentation/ABI/README`` per maggiori
+    ``Documentation/ABI/``.  Leggete Documentation/ABI/README per maggiori
     informazioni.  Le patch che modificano le interfacce utente dovrebbero
     essere inviate in copia anche a linux-api@vger.kernel.org.
 
diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
index 0d6651f9d871..3087ba80e818 100644
--- a/Documentation/translations/sp_SP/process/submit-checklist.rst
+++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
@@ -97,7 +97,7 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
     ``MODULE_PARM_DESC()``.
 
 18) Todas las nuevas interfaces de espacio de usuario están documentadas
-    en ``Documentation/ABI/``. Consulte ``Documentation/ABI/README`` para
+    en ``Documentation/ABI/``. Consulte Documentation/ABI/README para
     obtener más información. Los parches que cambian las interfaces del
     espacio de usuario deben ser CCed a linux-api@vger.kernel.org.
 
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 10536b74aeec..5c20a7f0936b 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -82,7 +82,7 @@ Linux内核补丁提交检查单
 17) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
-    请参阅 ``Documentation/ABI/README`` 。更改用户空间接口的补丁应该抄送
+    请参阅 Documentation/ABI/README 。更改用户空间接口的补丁应该抄送
     linux-api@vger.kernel.org。
 
 19) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/`` 。
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 0ecb187753e4..b09d29b0cc1b 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -85,7 +85,7 @@ Linux內核補丁提交檢查單
 17) 所有新的模塊參數都記錄在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用戶空間接口都記錄在 ``Documentation/ABI/`` 中。有關詳細信息，
-    請參閱 ``Documentation/ABI/README`` 。更改用戶空間接口的補丁應該抄送
+    請參閱 Documentation/ABI/README 。更改用戶空間接口的補丁應該抄送
     linux-api@vger.kernel.org。
 
 19) 已通過至少注入slab和page分配失敗進行檢查。請參閱 ``Documentation/fault-injection/`` 。
-- 
2.48.1

